#include <stdlib.h>
#include <stdint.h>

#define WITH_HEAP_RAND 0
void *morecore() {
    puts("Heap space is not enough");
    return NULL;
}
#define LACKS_TIME_H 1 /* XXX: do not use time() for generating a magic
                          if linker does not support "time()" */
#define HAVE_MORECORE 0
#define HAVE_MMAP 0
#define ONLY_MSPACES 1
#define USE_LOCKS 0
#include "dlmalloc.inc" /* XXX: ugly include .. updating dlmalloc.inc does not trigger make */

#if WITH_HEAP_RAND

#define HEAP_CHK_SIZE 0x100000
#define N_POOL 0x8
#define RAND_GAP 37
#define SEED_MAX (N_POOL * RAND_GAP)
#define HEAP_CHK(N) static uint8_t _heap_chk##N[HEAP_CHK_SIZE] = {0}
HEAP_CHK(0); HEAP_CHK(1); HEAP_CHK(2); HEAP_CHK(3);
HEAP_CHK(4); HEAP_CHK(5); HEAP_CHK(6); HEAP_CHK(7);
static uint8_t *_heap[N_POOL] = {
    _heap_chk0, _heap_chk1, _heap_chk2, _heap_chk3,
    _heap_chk4, _heap_chk5, _heap_chk6, _heap_chk7,
};
static mspace _ms[N_POOL] = {0};

#include <stdio.h>
void _malloc_init() {
    uint8_t i;
    for (i = 0;i < N_POOL;++i)
        _ms[i] = create_mspace_with_base((void*)_heap[i], HEAP_CHK_SIZE, 0);
}

#if defined(NBENCH_TEST) && NBENCH_TEST
#define MALLOC nben_malloc
#define FREE nben_free
#define CALLOC nben_calloc
#define REALLOC nben_realloc
#define MEMALIGN nben_memalign
#else
#define MALLOC malloc
#define FREE free
#define CALLOC calloc
#define REALLOC realloc
#define MEMALIGN __memalign
#endif

void* MALLOC(size_t bytes) {
    void *ret = NULL;
    uint8_t i, e, g;
    if (!_ms[0]) _malloc_init();
    i = rand() % SEED_MAX;
    e = i % N_POOL;
    g = i % RAND_GAP;
    i = i % N_POOL;
    i = (i == N_POOL-1) ? 0 : i+1;
    for (;i != e && !ret;i = (i+1) % N_POOL)
        ret = mspace_malloc(_ms[i], bytes+g);
    return ret;
}

void FREE(void* mem) {
    uint8_t i;
    if (!_ms[0]) return;
    for (i = 0;i < N_POOL;++i) {
        if (((uint64_t)_heap[i] <= (uint64_t)mem)
                && ((uint64_t)_heap[i] + HEAP_CHK_SIZE > (uint64_t)mem)) {
            mspace_free(_ms[i], mem);
            return;
        }
    }
}

void* CALLOC(size_t n_elements, size_t elem_size) {
    void *ret = NULL;
    uint8_t i, e;
    if (!_ms[0]) _malloc_init();
    i = rand() % SEED_MAX;
    e = i % N_POOL;
    i = i % N_POOL;
    i = (i == N_POOL-1) ? 0 : i+1;
    for (;i != e && !ret;i = (i+1) % N_POOL)
        ret = mspace_calloc(_ms[i], n_elements, elem_size);
    return ret;
}

void* REALLOC(void* oldMem, size_t bytes) {
    uint8_t i;
    if (!_ms[0]) _malloc_init();
    if (!oldMem) return MALLOC(bytes);
    for (i = 0;i < N_POOL;++i) {
        if (((uint64_t)_heap[i] <= (uint64_t)oldMem)
                && ((uint64_t)_heap[i] + HEAP_CHK_SIZE > (uint64_t)oldMem)) {
            return mspace_realloc(_ms[i], oldMem, bytes);
        }
    }
    return NULL;
}

void* MEMALIGN(size_t alignment, size_t bytes) {
    void *ret = NULL;
    uint8_t i, e, g;
    if (!_ms[0]) _malloc_init();
    i = rand() % SEED_MAX;
    e = i % N_POOL;
    g = i % RAND_GAP;
    i = i % N_POOL;
    i = (i == N_POOL-1) ? 0 : i+1;
    for (;i != e && !ret;i = (i+1) % N_POOL)
        ret = mspace_memalign(_ms[i], alignment, bytes+g);
    return ret;
}

size_t malloc_usable_size(const void* mem) {
    if (!_ms[0]) _malloc_init();
    return mspace_usable_size(mem);
}

int posix_memalign(void** memptr, size_t alignment, size_t bytes) {
    if (alignment < sizeof(void *)) return EINVAL;
    if (!memptr) return 1;
    if (!_ms[0]) _malloc_init();
    *memptr = MEMALIGN(alignment, bytes);
    if (!*memptr) return 1;
    return 0;
}

/* add if needed
struct mallinfo mallinfo() {
    return mspace_mallinfo(_ms);
}

// already defined in src/legacy/valloc.c
void* valloc(size_t bytes) {
    if (!_ms[0]) _malloc_init();
    return mspace_memalign(_ms, PAGE_SIZE, bytes);
}
*/

#undef weak_alias
#define weak_alias(old, new) \
        extern __typeof(old) new __attribute__((weak, alias(#old)))
#if defined(NBENCH_TEST) && NBENCH_TEST
weak_alias(nben_memalign, memalign);
#else
weak_alias(__memalign, memalign);
#endif


#else //with_heap_rand

#define HEAP_CHK_SIZE 0x300000
#define N_POOL 0x2
#define RAND_GAP 37
#define SEED_MAX (N_POOL * RAND_GAP)
#define HEAP_CHK(N) static uint8_t _heap_chk##N[HEAP_CHK_SIZE] = {0}
HEAP_CHK(0);
HEAP_CHK(1);
HEAP_CHK(2);
static uint8_t *_heap= _heap_chk0;
static uint8_t *_heap_8k = _heap_chk1;
static uint8_t *_heap_large = _heap_chk2;
static mspace _ms= 0;
static mspace _ms_8k = 0;
static mspace _ms_large = 0;
void * heap_start[3] ={0};
size_t heap_size[3] = {0};
unsigned int is_inited = 0;

#include <stdio.h>
// void set_inited(){
//     // __asm__ __volatile__(
//     //     "movq $1,(is_inited)\n"
//     //     ::
//     // );
// }

void _malloc_init() {
    unsigned long addr_start ,end;
    size_t capt ;

    //create the small one,align the page
    addr_start = ((unsigned long)_heap + 0x1000) & (~0xfff);
    end = ((unsigned long)_heap + HEAP_CHK_SIZE) & (~0xfff);
    capt = end - addr_start;
    _ms = create_mspace_with_base((void*)addr_start,
            capt, 0);
    heap_start[0] = addr_start;
    heap_size[0] = capt;
    //mspace_malloc(_ms,0,)
    mspace_init_pan(_ms,0x1000);

    //create the large one
    addr_start = ((unsigned long)_heap_8k + 0x1000) & (~0xfff);
    end = ((unsigned long)_heap_8k + HEAP_CHK_SIZE) & (~0xfff);
    capt = end - addr_start;
    _ms_8k = create_mspace_with_base((void*)addr_start,
            capt, 0);
    heap_start[1] = addr_start;
    heap_size[1] = capt;
    mspace_init_pan(_ms_8k,0x2000);
    
    //create the large one
    _ms_large = create_mspace_with_base((void*)_heap_large,
            HEAP_CHK_SIZE, 0);
            
    heap_start[2] = _heap_large;
    heap_size[2] = HEAP_CHK_SIZE;  
}

void* malloc(size_t bytes) {
    static mspace ms = NULL;
    if (!_ms) _malloc_init();
    if(is_small(bytes)){
        ms = _ms;
    }else if(bytes < 0x1fd0){
        ms = _ms_8k;
    }
    else{
        ms = _ms_large;
    }
    return mspace_malloc(ms, bytes);
}

void free(void* mem) {
    static mspace ms = NULL;
    if (!_ms) _malloc_init();
    if(((uint64_t)_heap <= (uint64_t)mem)
                             &&((uint64_t)_heap + HEAP_CHK_SIZE > (uint64_t)mem)){
        ms = _ms;                 
    }else if(((uint64_t)_heap_8k <= (uint64_t)mem)
                             &&((uint64_t)_heap_8k + HEAP_CHK_SIZE > (uint64_t)mem)){
        ms = _ms_8k;
    }else{
        ms = _ms_large;
    }
    mspace_free(ms, mem);
}

void* calloc(size_t n_elements, size_t elem_size) {
    size_t req = n_elements*elem_size;
    static mspace ms = NULL;
    if (!_ms) _malloc_init();
    if(is_small(req)){
        ms = _ms;
    }else if(req < 0x1fd0){
        ms = _ms_8k;
    }
    else{
        sprintf(buf,"allocate big bytes 0x%zx\n",req);
        puts(buf);
        ms = _ms_large;
    }
    
    return mspace_calloc(ms, n_elements, elem_size);
}

void* realloc(void* oldMem, size_t bytes) {
    static mspace ms = NULL;
    static mspace new_ms = NULL;
    if (!_ms) _malloc_init();

    if(is_small(bytes)){
        new_ms = _ms;
    }else if(bytes < 0x1fd0){
        new_ms = _ms_8k;
    }
    else{
        sprintf(buf,"allocate big bytes 0x%zx\n",bytes);
        puts(buf);
        new_ms = _ms_large;
    }

    if(((uint64_t)_heap <= (uint64_t)oldMem)
                             &&((uint64_t)_heap + HEAP_CHK_SIZE > (uint64_t)oldMem)){
        ms = _ms;                 
    }else if(((uint64_t)_heap_8k <= (uint64_t)oldMem)
                             &&((uint64_t)_heap_8k + HEAP_CHK_SIZE > (uint64_t)oldMem)){
        ms = _ms_8k;
    }else{
        ms = _ms_large;
    }
    
    return mspace_realloc_pan(ms,new_ms, oldMem, bytes);
}

void* memalign(size_t alignment, size_t bytes) {
    sprintf(buf,"memalign %zx\n",bytes);
    puts(buf);
    if (!_ms) _malloc_init();
    return mspace_memalign(_ms, alignment, bytes);
}

size_t malloc_usable_size(const void* mem) {
    if (!_ms) _malloc_init();
    return mspace_usable_size(mem);
}

int posix_memalign(void** memptr, size_t alignment, size_t bytes) {
    if (alignment < sizeof(void *)) return EINVAL;
    if (!memptr) return 1;
    if (!_ms) _malloc_init();
    *memptr = mspace_memalign(_ms, alignment, bytes);
    if (!*memptr) return 1;
    return 0;
}

/* add if needed
struct mallinfo mallinfo() {
    return mspace_mallinfo(_ms);
}

// already defined in src/legacy/valloc.c
void* valloc(size_t bytes) {
    if (!_ms) _malloc_init();
    return mspace_memalign(_ms, PAGE_SIZE, bytes);
}
*/

//weak_alias(__memalign, memalign);
#endif
