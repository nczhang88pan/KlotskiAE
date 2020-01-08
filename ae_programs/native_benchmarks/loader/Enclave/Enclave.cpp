#include <stdarg.h>
#include <stdio.h>      /* vsnprintf */

#include <stdlib.h>
#include <time.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include "ocall_type.h"
typedef void (*sighandler_t)(int);

#include "Enclave.h"
#include "Enclave_t.h"  /* print_string */

#include "sgx_trts.h"   /* sgx_read_rand */

#include "elf.h"        /* ELF */

#include "../App/attack.h"

void printf(const char *fmt, ...)
{
    char buf[BUFSIZ] = {'\0'};
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(buf, BUFSIZ, fmt, ap);
    va_end(ap);
    ocall_print_string(buf);
}

#ifdef LD_DEBUG
#define dlog(...) printf(__VA_ARGS__)
#else
#define dlog(...)
#endif

extern char __elf_end;          /* defined in the linker script */
#define _HEAP_BASE (((addr_t)&__elf_end + 0xfff) & ~0xfff)

//const unsigned long __sgx_data_ofs = 0x2027000;
const unsigned long __sgx_data_ofs = 0x200000;



/*
 * Create a listening socket on bind_ip:port
 */
int mbedtls_net_bind( mbedtls_net_context *ctx, const char *bind_ip, const char *port, int proto )
{
    int ret;
    ocall_mbedtls_net_bind(&ret, ctx, bind_ip, port, proto);
    return( ret );

}

/*
 * Accept a connection from a remote client
 */
int mbedtls_net_accept( mbedtls_net_context *bind_ctx,
                        mbedtls_net_context *client_ctx,
                        void *client_ip, size_t buf_size, size_t *ip_len )
{
    int ret;
    /*
     - bind_ctx: int fd [OUT]
     - client_ctx: int fd [IN]
     - client_ip: [IN]
     - buf_size: sizeof client_ip
     - ip_len: receiver of ip_len [IN]
    */
    ocall_mbedtls_net_accept(&ret, bind_ctx, client_ctx, client_ip, buf_size, ip_len);
    return ret;
}

/*
 * Read at most 'len' characters, blocking for at most 'timeout' ms
 */
int mbedtls_net_recv_timeout( void *ctx, unsigned char *buf, size_t len,
                      uint32_t timeout )
{
    int ret;
    ocall_mbedtls_net_recv_timeout(&ret, (mbedtls_net_context*) ctx, buf, len, timeout);
    return ret;
}

/*
 * Write at most 'len' characters
 */
int mbedtls_net_send( void *ctx, const unsigned char *buf, size_t len )
{
    int ret;
    ocall_mbedtls_net_send(&ret, (mbedtls_net_context*) ctx, buf, len);
    return ret;
}

/*
 * Gracefully close the connection
 */
void mbedtls_net_free( mbedtls_net_context *ctx )
{
    sgx_status_t ret;
    ret = ocall_mbedtls_net_free((mbedtls_net_context*) ctx);
    if (ret != SGX_SUCCESS)
    {
        printf("Error: mbedtls_net_free returned %d", ret);
    }
}

#include "loader.cpp"
