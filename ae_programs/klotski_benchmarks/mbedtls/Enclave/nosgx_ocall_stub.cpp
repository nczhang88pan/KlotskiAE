// this file is generated by lib/gen_ocall_stub.py script
static void *ocall_table[37] = {
    (void *) clock,
    (void *) time,
    (void *) localtime,
    (void *) gmtime,
    (void *) mktime,
    (void *) gettimeofday,
    (void *) puts,
   // (void *) sgx_push_gadget,
    (void *) open,
    (void *) close,
    (void *) read,
    (void *) write,
    (void *) lseek,
    (void *) socket,
    (void *) bind,
    (void *) connect,
    (void *) listen,
    (void *) accept,
    (void *) fstat,
    (void *) send,
    (void *) recv,
    (void *) sendto,
    (void *) recvfrom,
    (void *) gethostname,
    (void *) getaddrinfo,
    (void *) getenv,
    (void *) getsockname,
    (void *) getsockopt,
    (void *) getservbyname,
    (void *) getprotobynumber,
    (void *) setsockopt,
    (void *) htons,
    (void *) htonl,
    (void *) ntohs,
    (void *) ntohl,
    (void *) signal,
    (void *) shutdown,
    (void *) memmove,
};
void do_sgx_ocall_random();
void do_sgx_ocall();
