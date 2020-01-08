typedef unsigned long addr_t;

extern char __sgx_start;        /* defined in the linker script */
extern char __sgx_end;          /* defined in the linker script */
extern char __sgx_code;         /* defined in the linker script */
#define _SGX_SIZE 0x2000000
#define _SGXCODE_BASE ((void*)&__sgx_code)
#define _SGXDATA_BASE ((void*)((addr_t)&__sgx_code + __sgx_data_ofs))
#define VIRTUAL_CODE 0x34800000
#define VIRTUAL_DATA 0x34a00000
#define PAN_Debug 0

#define SHADOWPAGEWIDE 11
#define SHADOWPAGESIZE (1<<SHADOWPAGEWIDE)

#ifdef JPEG
#if JPEG // is djpeg
char *inputImageFile = "/home/root/klotski/ae_programs/klotski_benchmarks/imgs/inputDir/jpg/download";
char *outputImageFile = "/home/root/klotski/ae_programs/klotski_benchmarks/imgs/outputDir/bmp/download";
#else    // is cjpeg
char *inputImageFile = "/home/root/klotski/ae_programs/klotski_benchmarks/imgs/inputDir/ppm/download";
char *outputImageFile = "/home/root/klotski/ae_programs/klotski_benchmarks/imgs/outputDir/jpg/download";
#endif
#endif

static unsigned long _stack_save = 0;
unsigned int heap_is_inited = 0;
unsigned long _virtual_stack_save = 0;
unsigned long rax_backup = 0;
static unsigned long _virtual_stack_r13 = 0;
#define HEAPNUM 3
unsigned long heap_virtual_start[HEAPNUM]={0};
unsigned long heap_real_start[HEAPNUM]={0};
size_t heap_size[HEAPNUM]={0};

unsigned char *program = (unsigned char *)&__sgx_start;
size_t program_size = (addr_t)&__sgx_end - (addr_t)&__sgx_start;
size_t code_section_size;
unsigned total_code_page_num;

addr_t __sgx_data_end = (addr_t)_SGXDATA_BASE + 0x1e00000;
addr_t __stack_start = (__sgx_data_end & (~0xFFF));

#define _SGXSTACK_BASE __stack_start;

#include <endian.h>
#if BYTE_ORDER == BIG_ENDIAN
# define byteorder ELFDATA2MSB
#elif BYTE_ORDER == LITTLE_ENDIAN
# define byteorder ELFDATA2LSB
#else
# error "Unknown BYTE_ORDER " BYTE_ORDER
# define byteorder ELFDATANONE
#endif

#define GET_OBJ(type, offset) \
     reinterpret_cast<type*>( reinterpret_cast<size_t>(program) \
            + static_cast<size_t>(offset) )
#define CHECK_SIZE(obj, size) \
    ((addr_t)obj + size <= (addr_t)program + program_size)

static Elf64_Ehdr *pehdr;
static Elf64_Shdr *pshdr;
static size_t n_symtab, _n_symtab = 1;
static Elf64_Sym *symtab;
char *strtab=NULL;
char *shstrtab=NULL;
static Elf64_Sym *main_sym;
Elf64_Addr textSectionRealAddress = 0;
Elf64_Addr rodataSectionRealAddress = 0;
Elf64_Addr dataSectionRealAddress = 0;

#include <vector>
//#include <iostream> 
#include <iterator>
#include <algorithm>
// #include "./securityCPY.h"
using namespace std;
std::vector<Elf64_Sym *> sortSymbol;
int *sym_ndx;
/*
 * After loading the metadata,
 * rel.r_offset = [ the index of the relocation source : the offset from the source ]
 */
size_t n_rel;               /* # of relocation tables */
size_t *n_reltab;           /* # of relocation entry */
static Elf64_Rela **reltab; /* array of pointers to relocation tables */
#define REL_DST_NDX(ofs) ((ofs) >> 32)
#define REL_DST_OFS(ofs) ((ofs) & 0xffffffff)
#define REL_OFFSET(ndx, ofs) ((((unsigned long)(ndx)) << 32) | ((unsigned long)(ofs)))

uint64_t rounddown(uint64_t align, uint64_t n)
{
    return (n / align) * align;
}

static uint32_t get_rand(void)
{
    uint32_t val;
    sgx_read_rand((unsigned char *)&val, sizeof(uint32_t));
    return val;
}


void *reserve_data(size_t size, size_t align)
{
    static void *data_end = _SGXDATA_BASE;
    void *ret = (void *)rounddown(align, (addr_t)data_end+(align-1));
    data_end = (void *)((addr_t)ret+rounddown(align, size+(align-1)));
    return ret;
}

bool is_available(uint8_t *base, size_t index, size_t size)
{
    for (unsigned i = 0;i < size;++i)
        if (base[index+i]) return false;
    return true;
}


void *reserve_code(size_t size, size_t align)
{
    static void *code_end = _SGXCODE_BASE;
    void *ret = (void *)rounddown(align, (addr_t)code_end+(align-1));
    code_end = (void *)((addr_t)ret+rounddown(align, size+(align-1)));
    return ret;
}

void *reserve(Elf64_Xword flags, size_t size, size_t align)
{
    if (flags & 0x4) return reserve_code(size, align);
    return reserve_data(size, align);
}

Elf64_Addr updateSymbolAddress(Elf64_Xword flags, Elf64_Addr address){
    if(flags & 0x4) return address - VIRTUAL_CODE + (Elf64_Addr)_SGXCODE_BASE;
    return address - VIRTUAL_DATA + (Elf64_Addr)_SGXDATA_BASE;
}

#define STR_EQUAL(s1, s2, n) \
    str_equal((const uint8_t *)(s1), (const uint8_t *)(s2), (n))
uint8_t str_equal(const uint8_t *s1, const uint8_t *s2, size_t n) {
    for (unsigned i = 0;i < n;++i)
        if (s1[i] != s2[i])
            return 0;
    return 1;
}

#define STR_STARTWITH(s1, s2, n)\
    str_startwith((const uint8_t *)(s1), (const uint8_t *)(s2), (n))
uint8_t str_startwith(const uint8_t *s1, const uint8_t *s2, size_t n) {
    for (unsigned i = 0;i < n;++i)
        if (s1[i] != s2[i])
            return 0;
    return 1;
}    
static void validate_ehdr(void)
{
    static const unsigned char expected[EI_NIDENT] =
    {
        [EI_MAG0] = ELFMAG0,
        [EI_MAG1] = ELFMAG1,
        [EI_MAG2] = ELFMAG2,
        [EI_MAG3] = ELFMAG3,
        [EI_CLASS] = ELFCLASS64,
        [EI_DATA] = byteorder,
        [EI_VERSION] = EV_CURRENT,
        [EI_OSABI] = ELFOSABI_SYSV,
        [EI_ABIVERSION] = 0
    };

    if ((pehdr = GET_OBJ(Elf64_Ehdr, 0)) == NULL)
        dlog("%u: Ehdr size", __LINE__);

    if (!str_equal(pehdr->e_ident, expected, EI_ABIVERSION)
            || pehdr->e_ident[EI_ABIVERSION] != 0
            || !str_equal(&pehdr->e_ident[EI_PAD], &expected[EI_PAD],
                EI_NIDENT - EI_PAD))
        dlog("%u: Ehdr ident", __LINE__);

    if (pehdr->e_version != EV_CURRENT)
        dlog("%u: Ehdr version", __LINE__);

    /* ELF format check - relocatable */
    if (pehdr->e_type != ET_REL)
        dlog("%u: Ehdr not relocatable", __LINE__);

    /* check the architecture - currently only support x86_64 */
    if (pehdr->e_machine != EM_X86_64)
        dlog("%u: Ehdr not x86_64", __LINE__);

    if (pehdr->e_shentsize != sizeof (Elf64_Shdr))
        dlog("%u: Shdr entry size", __LINE__);
}

void *get_buf(size_t size) {
    static addr_t heap_end = _HEAP_BASE;
    void *ret = (void *)heap_end;
    heap_end = heap_end + size;
    return ret;
}

/* search (section SE, OFS) from symtab - binary search can be applied */
static unsigned search(const Elf64_Half se, const Elf64_Addr ofs)
{
    // assuming that symbols are already sorted
    for (unsigned i = 0; i < n_symtab; ++i)
      if (symtab[i].st_shndx == se && symtab[i].st_value <= ofs
          && (i+1 >= n_symtab || symtab[i+1].st_value > ofs
              || symtab[i+1].st_shndx != se)) return i;
    return -1;
}

/*
 * process of sorting symbols
 * 1. sort symbols by {st_shndx, st_value, st_size}
 *    while managing "initial symndx to old symndx" mapping
 * 2. update the relocation table (r_info's r_sym)
 *    according to the "initial symndx to old symndx" mapping
 */
bool comp_sym(const Elf64_Sym *r, const Elf64_Sym *l)
{
    if (r->st_shndx != l->st_shndx)
        return r->st_shndx < l->st_shndx;
    else if (r->st_shndx < pehdr->e_shnum &&
            pshdr[r->st_shndx].sh_type == SHT_NOBITS)
        return r->st_size > l->st_size;
    else if (r->st_value != l->st_value)
        return r->st_value < l->st_value;
    else
        return r->st_size > l->st_size;
}
void sort_sym(void)
{
    // add all symbol pointers to the vector, and then sort them
    for (int i = 0; i < n_symtab; ++i) {
        sortSymbol.push_back(&symtab[i]);
    }
    sort(sortSymbol.begin(), sortSymbol.end(), comp_sym);

    sym_ndx =(int *) malloc(n_symtab*sizeof(int));
    /* generate "initial symndx to new symndx" */
    for (int i = 0; i < n_symtab; ++i) {
        int tmp = ((unsigned long)sortSymbol[i] - (unsigned long)symtab) / sizeof(Elf64_Sym);
        sym_ndx[i] = tmp;
    }

    for(int i=0; i < n_symtab; ++i){
            int tmp = ((unsigned long)sortSymbol[i] - (unsigned long)symtab) / sizeof(Elf64_Sym);
            #if PAN_Debug
            printf("Index:%d orgIndex:%d Value: %lx SectionIndex:%d \n",i,tmp,sortSymbol[i]->st_value,sortSymbol[i]->st_shndx);
            #endif
        }
}

static void update_reltab(void)
{
    /* read shdr */
    if ((pshdr = GET_OBJ(Elf64_Shdr, pehdr->e_shoff)) == NULL
            || !CHECK_SIZE(pshdr, pehdr->e_shnum*sizeof(Elf64_Shdr)))
        dlog("%u: Shdr size", __LINE__);

    /* pointers to symbol, string, relocation tables */
    n_rel = 0;
    for (unsigned i = 0; i < pehdr->e_shnum; ++i) {
        if (pshdr[i].sh_type == SHT_RELA) ++n_rel;
        else if (pshdr[i].sh_type == SHT_SYMTAB) {
            symtab = GET_OBJ(Elf64_Sym, pshdr[i].sh_offset);
            n_symtab = pshdr[i].sh_size / sizeof(Elf64_Sym);
        } else if (pshdr[i].sh_type == SHT_STRTAB){
            if(shstrtab==NULL){
                shstrtab = GET_OBJ(char, pshdr[i].sh_offset);
            }else{
                strtab = GET_OBJ(char, pshdr[i].sh_offset);
            }
        }
    }
    n_reltab = (size_t *)malloc(n_rel * sizeof(size_t));
    reltab = (Elf64_Rela **)malloc(n_rel * sizeof(Elf64_Rela *));
    n_rel = 0;
    for (unsigned i = 0; i < pehdr->e_shnum; ++i) {
        if (pshdr[i].sh_type == SHT_RELA && pshdr[i].sh_size) {
            reltab[n_rel] = GET_OBJ(Elf64_Rela, pshdr[i].sh_offset);
            n_reltab[n_rel] = pshdr[i].sh_size / sizeof(Elf64_Rela);

            /* update relocation table: r_offset --> dst + offset */
            // assert(GET_OBJ(pshdr[pshdr[i].sh_link].sh_offset) == symtab);
            for (size_t j = 0; j < n_reltab[n_rel]; ++j) {
                unsigned dst = search(pshdr[i].sh_info, reltab[n_rel][j].r_offset);
                reltab[n_rel][j].r_offset =
                    REL_OFFSET(dst, reltab[n_rel][j].r_offset - symtab[dst].st_value);
            }
            ++n_rel;
        }
    }
}

static void fill_zero(char *ptr, Elf64_Word size) {
    while (size--) ptr[size] = 0;
}
static void cpy(char *dst, char *src, size_t size) {
    while (size--) dst[size] = src[size];
}

#ifndef NOSGX
#include "ocall_stub.cpp"
#include "ocall_stub_table.cpp"
#else
#include "nosgx_ocall_stub.cpp"
#endif


#define RAX_BACKUP_FIXUP 31
#define OCALL_TABLE_FIXUP 20
#define STACK_SAVE_FIXUP 12
#define VIRTUAL_STACK_SAVE_FIXUP 4
#define BACK_VIRTUAL_STACK_SAVE_TO_RSP_FIXUP 31

#define SECURECOPY_FIXUP 38
static unsigned char find_special_symbol(const char* name, const size_t i)
{
    if (STR_EQUAL(name, "dep.bdr\0", 8)) {
        sortSymbol[i]->st_value = (Elf64_Addr)_SGXDATA_BASE;
        sortSymbol[i]->st_size = 0;
        dlog(&strtab[sortSymbol[i]->st_name]);
        return 1;
    } else if (STR_EQUAL(name, "ocall.bdr\0", 10)) {
        sortSymbol[i]->st_value = (Elf64_Addr)_SGXCODE_BASE;
        sortSymbol[i]->st_size = 0;
        dlog(&strtab[sortSymbol[i]->st_name]);
        return 1;
    } else if (STR_EQUAL(name, "sgx_ocall.loader\0", 14)) {
        sortSymbol[i]->st_value = (Elf64_Addr)do_sgx_ocall;
        dlog("%s: %lx", &strtab[sortSymbol[i]->st_name], sortSymbol[i]->st_value);
        return 1;
    } else if (STR_EQUAL(name, "rand_internal\0", 14)) {
        sortSymbol[i]->st_value = (Elf64_Addr)get_rand;
        dlog("%s: %lx", &strtab[sortSymbol[i]->st_name], sortSymbol[i]->st_value);
        return 1;
    } else if (STR_EQUAL(name, "_stack\0", 7)) {
        sortSymbol[i]->st_value = (Elf64_Addr)reserve_data(sortSymbol[i]->st_size, 64);//TODO stack may need to align to page
        dlog("%s: %lx", &strtab[sortSymbol[i]->st_name], sortSymbol[i]->st_value);
        return 1;
    } else if(STR_STARTWITH(name,"_heap_chk\0",9)){
        printf("_heap_chk 0x%x\n",sortSymbol[i]->st_value);
        if(STR_EQUAL(name,"_heap_chk0\0",10)){
            heap_virtual_start[0] = sortSymbol[i]->st_value;
        } else if(STR_EQUAL(name,"_heap_chk1\0",10)){
            heap_virtual_start[1] = sortSymbol[i]->st_value;
        } else if(STR_EQUAL(name,"_heap_chk2\0",10)){
            heap_virtual_start[2] = sortSymbol[i]->st_value;
        }
    }else if(STR_EQUAL(name,"set_inited\0",10)){
        sortSymbol[i]->st_value = (Elf64_Addr)updateSymbolAddress(pshdr[sortSymbol[i]->st_shndx].sh_flags,
                            sortSymbol[i]->st_value);
        unsigned int *heap_is_inited_fixed_address = (unsigned int *) (sortSymbol[i]->st_value + 11);
        *heap_is_inited_fixed_address = (unsigned long)&heap_is_inited;

    }if (STR_EQUAL(name,"do_sgx_ocall\0",13)){
        printf("do_sgx_ocall index:%lx address:0x%lx\n",i,sortSymbol[i]->st_value);
        printf("ocall_table address:0x%lx\n",(unsigned long)ocall_table);
        sortSymbol[i]->st_value = (Elf64_Addr)updateSymbolAddress(pshdr[sortSymbol[i]->st_shndx].sh_flags,
                            sortSymbol[i]->st_value);
        printf("do_sgx_ocall index:%lx address:0x%lx\n",i,sortSymbol[i]->st_value);

        // store rsp -> _virtual_stack_save
        unsigned int *_virtual_stack_save_fixed_address = (unsigned int *) (sortSymbol[i]->st_value + VIRTUAL_STACK_SAVE_FIXUP);
        *_virtual_stack_save_fixed_address = (unsigned long)&_virtual_stack_save;

        // store _stack_save -> rsp
        unsigned int *_stack_save_fixed_address = (unsigned int *) (sortSymbol[i]->st_value + STACK_SAVE_FIXUP);
        *_stack_save_fixed_address = (unsigned long)&_stack_save;
        
        // update ocall
        unsigned int *fixedAddress = (unsigned int *) (sortSymbol[i]->st_value + OCALL_TABLE_FIXUP);
        unsigned long ocall_table_address = (unsigned long)ocall_table;
        *fixedAddress = ocall_table_address;

        // store _virtual_stack_save -> rsp
        unsigned int *back_virtual_stack_save_fixed_address = (unsigned int *) (sortSymbol[i]->st_value + BACK_VIRTUAL_STACK_SAVE_TO_RSP_FIXUP);
        *back_virtual_stack_save_fixed_address = (unsigned long)&_virtual_stack_save;

        return 1;
        

    }
    return 0;
}
static void copySections(){
    Elf64_Addr address;
    for(unsigned i =0; i<pehdr->e_shnum; i++ ){
        size_t sectionOffset = pshdr[i].sh_offset;
        size_t sectionSize= pshdr[i].sh_size;
        size_t align = pshdr[i].sh_addralign;
        if(STR_EQUAL(&shstrtab[pshdr[i].sh_name],".text\0",6)){
            textSectionRealAddress=  (Elf64_Addr)_SGXCODE_BASE + sectionOffset;
            printf("textSection start: 0x%lx\n",textSectionRealAddress);
            code_section_size = sectionSize;

            cpy((char *)textSectionRealAddress, GET_OBJ(char, sectionOffset), sectionSize);
            continue;
        }
        if(STR_EQUAL(&shstrtab[pshdr[i].sh_name],".rodata\0",8)){
            rodataSectionRealAddress=  (Elf64_Addr)_SGXCODE_BASE + sectionOffset;
            printf("rodataSection start: 0x%lx,sectionSize: 0x%lx\n",rodataSectionRealAddress,sectionSize);
            cpy((char *)rodataSectionRealAddress, GET_OBJ(char, sectionOffset), sectionSize);
            continue;
        }
        if(STR_EQUAL(&shstrtab[pshdr[i].sh_name],".data\0",6)){
            dataSectionRealAddress =  (Elf64_Addr)_SGXDATA_BASE + sectionOffset;
            printf("dataSection start: 0x%lx\n",dataSectionRealAddress);
            cpy((char *)dataSectionRealAddress, GET_OBJ(char, sectionOffset), sectionSize);
            continue;
        }
        if(STR_EQUAL(&shstrtab[pshdr[i].sh_name],".data.rel.ro\0",13)){
            address =  (Elf64_Addr)_SGXDATA_BASE + sectionOffset;
            printf(".data.rel.ro start: 0x%lx\n",address);
            cpy((char *)address, GET_OBJ(char, sectionOffset), sectionSize);
            continue;
        }
        if(STR_EQUAL(&shstrtab[pshdr[i].sh_name],".got\0",5)){
            address =  (Elf64_Addr)_SGXDATA_BASE + sectionOffset;
            printf(".got start: 0x%lx\n",address);
            cpy((char *)address, GET_OBJ(char, sectionOffset), sectionSize);
            continue;
        }
        if(STR_EQUAL(&shstrtab[pshdr[i].sh_name],".got.plt\0",9)){
            address =  (Elf64_Addr)_SGXDATA_BASE + sectionOffset;
            printf(".got.plt start: 0x%lx\n",address);
            cpy((char *)address, GET_OBJ(char, sectionOffset), sectionSize);
            continue;
        }
    }
}

static void load(void)
{
    Elf64_Addr last_off = (Elf64_Addr)-1;
    Elf64_Addr last_st_value = (Elf64_Addr)-1;
    Elf64_Xword last_size = 0;
    Elf64_Addr sectionOffset;
    Elf64_Addr sectionVirtualAddr; 
    unsigned shndx = -1;
    copySections();
    for (unsigned i = 1; i < n_symtab; ++i, ++_n_symtab) {
        if (shndx != sortSymbol[i]->st_shndx) {
            printf("------------------st_shndx = %d-------------------\n",sortSymbol[i]->st_shndx);
            last_off = (Elf64_Addr)-1;
            last_st_value = (Elf64_Addr)-1;
            last_size = 0;
            shndx = sortSymbol[i]->st_shndx;
            if(sortSymbol[i]->st_shndx != SHN_ABS){
                sectionOffset = pshdr[sortSymbol[i]->st_shndx].sh_offset;
                sectionVirtualAddr = pshdr[sortSymbol[i]->st_shndx].sh_addr;
            }
        }

        unsigned char found = sortSymbol[i]->st_name ?
            find_special_symbol(&strtab[sortSymbol[i]->st_name], i) : 0;

        if(sortSymbol[i]->st_shndx == SHN_ABS || sortSymbol[i]->st_shndx == SHN_UNDEF){
            break;
        }else if (sortSymbol[i]->st_shndx == SHN_COMMON && !found) {  
            sortSymbol[i]->st_value = (Elf64_Addr)updateSymbolAddress(0, sortSymbol[i]->st_value);
            fill_zero((char *)sortSymbol[i]->st_value, sortSymbol[i]->st_size);
        } else if (!found) {
            // symoff is the offset in our loading file
            Elf64_Addr symoff = sortSymbol[i]->st_value - sectionVirtualAddr + sectionOffset;
            /* potentially WEAK bind */
            if (last_off <= symoff && symoff < (last_off + last_size)) {
                sortSymbol[i]->st_value = last_st_value + symoff - last_off;
            } else {
                /* find main */
                if (sortSymbol[i]->st_value == pehdr->e_entry)
                    main_sym = sortSymbol[i];
                    // Elf64_Addr tempValue = sortSymbol[i]->st_value;
                sortSymbol[i]->st_value = (Elf64_Addr)updateSymbolAddress(pshdr[sortSymbol[i]->st_shndx].sh_flags,
                            sortSymbol[i]->st_value);

                            // if(tempValue != sortSymbol[i]->st_value){
                            //     printf("!!!!!!!!!!!!!!!!!!!!!!lx\n",sortSymbol[i]->st_value);
                            // }
            
                
                
                /* fill zeros for .bss section .. otherwise, copy from file */
                if (pshdr[sortSymbol[i]->st_shndx].sh_type == SHT_NOBITS) {

                    fill_zero((char *)sortSymbol[i]->st_value, sortSymbol[i]->st_size);
                } else {
                    size_t dataSize = sortSymbol[i]->st_size;
                    size_t align = pshdr[sortSymbol[i]->st_shndx].sh_addralign;
                   
                    // check whether this symbol size is zero and the type is func
                    // if(sortSymbol[i]->st_size == 0 && ((sortSymbol[i]->st_info & 0xf)== STT_FUNC)){
                    //     // whether this symbol is in text section
                    //    if(STR_EQUAL(&shstrtab[pshdr[sortSymbol[i]->st_shndx].sh_name],".text\0",6)){
                    //        // find the next function
                    //        if(i+1<n_symtab && sortSymbol[i+1]->st_shndx == sortSymbol[i]->st_shndx){
                    //            funcSize = sortSymbol[i+1]->st_value - sortSymbol[i]->st_value;
                    //        }else{
                    //            funcSize = pshdr[sortSymbol[i]->st_shndx].sh_size + sectionVirtualAddr - sortSymbol[i]->st_value;
                    //            align = pshdr[sortSymbol[i]->st_shndx].sh_addralign;
                    //        }
                    //    }
                    // }
                    // else{
                    //     funcSize = sortSymbol[i]->st_size;
                    //     //align = pshdr[sortSymbol[i]->st_shndx].sh_addralign;
                    // }
                    
                    // for we have already cp the text section, so we just update the symbol st_value with the textSection base
                    if(STR_EQUAL(&shstrtab[pshdr[sortSymbol[i]->st_shndx].sh_name],".text\0",6)){

                    }else{
                        cpy((char *)sortSymbol[i]->st_value, GET_OBJ(char, symoff), dataSize);
                    }

                   #if PAN_Debug
                    printf("Index:%d OriginIndex:%d address:%lx\n",i,sym_ndx[i],sortSymbol[i]->st_value - (Elf64_Addr)_SGXCODE_BASE+ VIRTUAL_CODE);
                   #endif

                    /* update last values */
                    last_size = dataSize; 
                    last_off = symoff;
                    last_st_value = sortSymbol[i]->st_value;
                }
            }
        }
        dlog("sym %04u %08lx", i, (unsigned long)sortSymbol[i]->st_value);
#if PTRACE
        find_ptrace_target(&strtab[sortSymbol[i]->st_name], i);
#endif
    }
}

static void relocate(void)
{
    for (unsigned k = 0; k < n_rel; ++k)
        for (unsigned i = 0; i < n_reltab[k]; ++i) {
            unsigned int ofs = REL_DST_OFS(reltab[k][i].r_offset);
            unsigned int dst_sym = REL_DST_NDX(reltab[k][i].r_offset);
            unsigned int src_sym = ELF64_R_SYM(reltab[k][i].r_info);
            const unsigned int type = ELF64_R_TYPE(reltab[k][i].r_info);
            addr_t dst = (addr_t)symtab[dst_sym].st_value + (addr_t)ofs;
#if PTRACE
            check_breakpoint(src_sym, dst);
#endif

            dlog("rel[%04u] %04u (%08lx) --> %04u", i, dst_sym, dst, src_sym);
            if (type == R_X86_64_64) {
                /* word 64 */
                *(addr_t *)dst = symtab[src_sym].st_value + reltab[k][i].r_addend;
                dlog("%lx", *(addr_t *)dst);
            } else if (type == R_X86_64_32) {
                /* word 32 */
                *(uint32_t*)dst = (uint32_t)(symtab[src_sym].st_value + reltab[k][i].r_addend);
                dlog("%x", *(uint32_t *)dst);
            } else if (type == R_X86_64_32S) {
                /* word 32 */
                *(int32_t*)dst = (int32_t)(symtab[src_sym].st_value + reltab[k][i].r_addend);
                dlog("%x", *(int32_t *)dst);
            } else if (type == R_X86_64_PC32 || type == R_X86_64_PLT32) {
                /* word 32 */
                *(uint32_t*)dst = (uint32_t)(symtab[src_sym].st_value
                        - dst + reltab[k][i].r_addend);
                dlog("%x", *(uint32_t *)dst);
            } else if (type == R_X86_64_GOTPCREL) {
                /* word 32 */
                *(uint32_t*)dst = (uint32_t)((Elf64_Addr)&(symtab[src_sym].st_value)
                        - dst + reltab[k][i].r_addend);
                dlog("%x", *(uint32_t *)dst);
            } else
                dlog("%u: Relocation -- not supported type %u", __LINE__, type);
        }
}


unsigned long offset_physical_to_virtual = 0;
unsigned long offset_physical_to_virtual_stack = 0;
#define SHADOW_START_INDEX (0x400000 >> SHADOWPAGEWIDE)
#define HEAP_CHK_SIZE 0x400000

void calculateHeap(int i){
    uint64_t start = heap_virtual_start[i],end;
    uint64_t addr = (start + 0x1000) & (~0xfff);
    end = (heap_virtual_start[i] + HEAP_CHK_SIZE) & (~0xfff);
    heap_size[i]=end - addr;
    printf("heap[%d]:0x%x,size:0x%x\n",i,start,heap_size[i]);

    heap_real_start[i]=(long)_SGXCODE_BASE + addr - (0x400<<12);
    heap_virtual_start[i] = addr;
    printf("heap->transfer:0x%x\n",heap_real_start[i]);
}

void (*entry)();
void enclave_main()
{
    int i=0;
    dlog("program at %p (%lx)", program, program_size);
    dlog(".sgxcode = %p", _SGXCODE_BASE);
    dlog(".sgxdata = %p", _SGXDATA_BASE);
    //sgx_push_gadget((unsigned long)_SGXCODE_BASE);
    //sgx_push_gadget((unsigned long)_SGXDATA_BASE);

    dlog("__sgx_start = %p", &__sgx_start);
    dlog("__sgx_end = %p", &__sgx_end);
    dlog("__elf_end = %p", &__elf_end);
    dlog("heap base = %lx", _HEAP_BASE);

    validate_ehdr();
    update_reltab();
    sort_sym();
    load();
    relocate();
    for(;i<3;i++){
        calculateHeap(i);
    }
    printf("sgx_stack start: 0x%lx\n",(unsigned long)__stack_start);
    //start to measure
    //sgx_measure_init((uint64_t)_SGXCODE_BASE,(uint64_t)__stack_start - (uint64_t)_SGXCODE_BASE,(uint64_t)_SGXCODE_BASE,(uint64_t)total_code_page_num<<11);
    // sgx_measure_start();
    // sgx_measure_wait();
    //sgx_measure_stop();

    //entry = (void (*)())(main_sym->st_value);
    dlog("main: %p", entry);

#ifdef JPEG
printf("%s\n",inputImageFile);
printf("%s\n",outputImageFile);
#endif

//#if PTRACE
#if 0 
    run_with_ptrace(entry);
#else
    __asm__ __volatile__(
                         "movq %%rsp,%1\n"
                         "mov %0,%%rsp\n"
                        #ifdef JPEG
                         "mov %2,%%rdi\n"
                         "mov %3,%%rsi\n"
                         ::"m"(__stack_start),"m"(_stack_save)
                         ,"m"(inputImageFile),"m"(outputImageFile)
                        #else
                         ::"m"(__stack_start),"m"(_stack_save)
                        #endif
                         );
    entry = (void (*)())(main_sym->st_value);
    entry();
   __asm__ __volatile__(
                         "movq %0,%%rsp\n"::"m"(_stack_save)); 
#endif
}

static unsigned long runtime_RSP_value=0;
// TODO: check if it breaks the calling ABI
// void do_sgx_ocall_random() {
//     __asm__ __volatile__ (
//         "mov (%0, %%r14, 8), %%r14\n"
//         "call *%%r14\n"
//         "call %1\n"
//         "push %%r14\n"
//         "rorx $0xb, %%r14,%%r14\n"
//         "add (%%r15d,%%r14d,8),%%r14\n"
//         "rorx $0x35, %%r14,%%r14\n"
//         "jmp *%%r14\n"
//     ::"r" (ocall_table),"r"(secureCopy):"cc");
// }
void do_sgx_ocall() {
    __asm__ __volatile__ (
        "mov (%0, %%r14, 8), %%r14\n"
        "call *%%r14\n"
    ::"r" (ocall_table));
}

// void secureCopy(){
//  // sgx_measure_wait_random();
//  // warpSecureCP();
//  // sgx_measure_start_random();
//     __asm__ __volatile__ (
//         "pop %%r14\n"
//         "mov %0,%%r14\n"
//         "sub $8,%%r14\n"
//         "mov %1,%%rax\n"
//         "rorx $0xb, %%r14,%%r14\n"
//         "add (%%r15d,%%r14d,8),%%r14\n"
//         "rorx $0x35, %%r14,%%rsp\n"
//         "pop %%r14\n"
//         "rorx $0xb, %%r14,%%r14\n"
//         "add (%%r15d,%%r14d,8),%%r14\n"
//         "rorx $0x35, %%r14,%%r14\n"
//         "jmp *%%r14\n"
//     ::"m"(_virtual_stack_r13),"m"(rax_backup));
// }
