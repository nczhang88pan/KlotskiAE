SECTIONS
{
    .sgx.bin : {
        __sgx_start = .;
        *(.sgx.bin)
        __sgx_end = .;
    }
    . = . + 0x0000000;
    .sgx.code ALIGN(0x200000): {
        __sgx_code = .;
        *(.sgx.code)
    }
}
__elf_end = .;
