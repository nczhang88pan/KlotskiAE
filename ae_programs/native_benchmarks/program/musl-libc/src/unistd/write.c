#include <unistd.h>
#include "libc.h"

#if NOSGX_PAN
#include <string.h>
#include <sgx-lib.h>

ssize_t write(int fd, const void *buf, size_t count)
{
    sgx_stub_info *stub = (sgx_stub_info *)STUB_ADDR;
    int tmp_len;
    int i;
    ssize_t rt;

    rt = 0;
    for (i = 0; i < count / SGXLIB_MAX_ARG + 1; i++) {
        stub->fcode = FUNC_WRITE;
        stub->out_arg1 = fd;

        if (i == count/SGXLIB_MAX_ARG)
            tmp_len = (int)count % SGXLIB_MAX_ARG;
        else
            tmp_len = SGXLIB_MAX_ARG;

        stub->out_arg2 = tmp_len;
        memcpy(stub->out_data1, (uint8_t *)buf + i * SGXLIB_MAX_ARG, tmp_len);
        sgx_exit(stub->trampoline);
        rt += stub->in_arg1;
    }

    return rt;
}
#else
#include "syscall.h"

ssize_t write(int fd, const void *buf, size_t count)
{
    return write_nosgx(fd,buf,count);
}
#endif