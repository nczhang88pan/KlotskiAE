void do_sgx_ocall(){
     __asm__ __volatile__(
        "movq %rsp,0x40589\n"
        "movq 0x40589,%rsp\n"
        "movq 0x40589(,%r14,8),%r14\n"
        "call *%r14\n"
        "movq 0x40589,%rsp\n"
        "ret\n"
    );
}
void clock(){
    __asm__ __volatile__(
        "mov $0, %r14\n"
    );
    do_sgx_ocall();
}

void time(){
    __asm__ __volatile__(
        "mov $1, %r14\n"
    );
    do_sgx_ocall();
}

void localtime(){
    __asm__ __volatile__(
        "mov $2, %r14\n"
    );
    do_sgx_ocall();
}

void gmtime(){
    __asm__ __volatile__(
        "mov $3, %r14\n"
    );
    do_sgx_ocall();
}

void mktime(){
    __asm__ __volatile__(
        "mov $4, %r14\n"
    );
    do_sgx_ocall();
}


void gettimeofday(){
    __asm__ __volatile__(
        "mov $5, %r14\n"
    );
    do_sgx_ocall();
}


void puts(){
    __asm__ __volatile__(
        "mov $6, %r14\n"
    );
    do_sgx_ocall();
}


void open(){
    __asm__ __volatile__(
        "mov $7, %r14\n"
    );
    do_sgx_ocall();
}

void close(){
    __asm__ __volatile__(
        "mov $8, %r14\n"
    );
    do_sgx_ocall();
}

void read(){
    __asm__ __volatile__(
        "mov $9, %r14\n"
    );
    do_sgx_ocall();
}


void write(){
    __asm__ __volatile__(
        "mov $10, %r14\n"
    );
    do_sgx_ocall();
}

void lseek(){
    __asm__ __volatile__(
        "mov $11, %r14\n"
    );
    do_sgx_ocall();
}
void socket(){
    __asm__ __volatile__(
        "mov $12, %r14\n"
    );
    do_sgx_ocall();
}
void bind(){
    __asm__ __volatile__(
        "mov $13, %r14\n"
    );
    do_sgx_ocall();
}
void connect(){
    __asm__ __volatile__(
        "mov $14, %r14\n"
    );
    do_sgx_ocall();
}

void listen(){
    __asm__ __volatile__(
        "mov $15, %r14\n"
    );
    do_sgx_ocall();
}
void accept(){
    __asm__ __volatile__(
        "mov $16, %r14\n"
    );
    do_sgx_ocall();
}
void fstat(){
    __asm__ __volatile__(
        "mov $17, %r14\n"
    );
    do_sgx_ocall();
}
void send(){
    __asm__ __volatile__(
        "mov $18, %r14\n"
    );
    do_sgx_ocall();
}
void recv(){
    __asm__ __volatile__(
        "mov $19, %r14\n"
    );
    do_sgx_ocall();
}
void sendto(){
    __asm__ __volatile__(
        "mov $20, %r14\n"
    );
    do_sgx_ocall();
}

void recvfrom(){
    __asm__ __volatile__(
        "mov $21, %r14\n"
    );
    do_sgx_ocall();
}
void gethostname(){
    __asm__ __volatile__(
        "mov $22, %r14\n"
    );
    do_sgx_ocall();
}
void getaddrinfo(){
    __asm__ __volatile__(
        "mov $23, %r14\n"
    );
    do_sgx_ocall();
}
void getenv(){
    __asm__ __volatile__(
        "mov $24, %r14\n"
    );
    do_sgx_ocall();
}
void getsockname(){
    __asm__ __volatile__(
        "mov $25, %r14\n"
    );
    do_sgx_ocall();
}

void getsockopt(){
    __asm__ __volatile__(
        "mov $26, %r14\n"
    );
    do_sgx_ocall();
}

void getservbyname(){
    __asm__ __volatile__(
        "mov $27, %r14\n"
    );
    do_sgx_ocall();
}

void getprotobynumber(){
    __asm__ __volatile__(
        "mov $28, %r14\n"
    );
    do_sgx_ocall();
}

void setsockopt(){
    __asm__ __volatile__(
        "mov $29, %r14\n"
    );
    do_sgx_ocall();
}

void htons(){
    __asm__ __volatile__(
        "mov $30, %r14\n"
    );
    do_sgx_ocall();
}

void htonl(){
    __asm__ __volatile__(
        "mov $31, %r14\n"
    );
    do_sgx_ocall();
}

void ntohs(){
    __asm__ __volatile__(
        "mov $32, %r14\n"
    );
    do_sgx_ocall();
}
void ntohl(){
    __asm__ __volatile__(
        "mov $33, %r14\n"
    );
    do_sgx_ocall();
}
void signal(){
    __asm__ __volatile__(
        "mov $34, %r14\n"
    );
    do_sgx_ocall();
}
void shutdown(){
    __asm__ __volatile__(
        "mov $35, %r14\n"
    );
    do_sgx_ocall();
}
void exit(){
    __asm__ __volatile__(
        "mov $36, %r14\n"
    );
    do_sgx_ocall();
}
void sgx_measure_start(){
    __asm__ __volatile__(
        "mov $43, %r14\n"
    );
    do_sgx_ocall();
}

void sgx_measure_wait(){
    __asm__ __volatile__(
        "mov $44, %r14\n"
    );
    do_sgx_ocall();
}


