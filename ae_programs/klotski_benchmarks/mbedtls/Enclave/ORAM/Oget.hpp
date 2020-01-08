#define PTE_WIDTH 3
#define INCACHE_WIDTH 4
#define CACHE_PTE_NUM (1<<INCACHE_WIDTH) // 16 ptes in a cache line
#define ONE_TIME_CACHED_WIDTH 3
#define CAN_CACHE_NUM_AT_ONE_TIME (1<<ONE_TIME_CACHED_WIDTH)      //8, 4-byte (8*4*8=256 bit can be cached at once)

#define PTE_SIZE (1<<PTE_WIDTH)   //the size of a pte
#define BYTES_IN_One_CACHE_LINE (CACHE_PTE_NUM*PTE_SIZE) // typically the size is 64, but we can change according to the size of pte
#define A_CACHE_BUCKET_SIZE  (BYTES_IN_One_CACHE_LINE * CAN_CACHE_NUM_AT_ONE_TIME)

void Oget();

