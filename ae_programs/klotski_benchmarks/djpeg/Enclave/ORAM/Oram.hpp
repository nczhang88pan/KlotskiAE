#pragma once
#include <vector>

// #define CACHENUM 8  //cache Size for code
#define DATACACHE_MIN CACHENUM    //cache Size for data

// Each Blocks contain a unique
// identifier and a chunk of data
#define Z  2U // Maximum number of real blocks per bucket, 
#define S  4U // Number of slots reserved for dummies per bucket
#define A  4U  //Eviction rate
#define BLOCKSINBUCKET (Z+S)
#define isADummyBlock(block) (block->address == 0xffff)
#define STASHSIZE (StashSize)
#define MINISTASHSIZE 32
#define CODE_STASHSIZE 200
#define DATA_STASHSIZE 300

#define LEAFVALIDCHECKE 0xfff //if block is a dummy block, is leaf equals to 0xfff
#define SUCCESS 0
#define READPathFailed 1
#define ReadBucketFailed 2
#define WriteBucketFailed 3

#define SHADOWPAGESIZE 0x800
#define SHADOWPAGEWIDE 11
#define SPLITNUM 8
#define RECORDRECENTNUM 32
				
#define CACHESPARENUM 1         //shall we enable the SPARE_PAGE_VALID which 
                                 //means allocating a spare page to valid over page access
                                 //1 or 2
#define PRINGMAC 0x221e
#if DATACACHE_MIN<=4
#define DATACACHE (DATACACHE_MIN*20*CACHESPARENUM*4)
#elif DATACACHE_MIN<=16
#define DATACACHE (DATACACHE_MIN*10*CACHESPARENUM*4)
#else
#define DATACACHE (DATACACHE_MIN*5*CACHESPARENUM*2)
#endif


#define STASH_SHUFFLE_GROUP_NUM 16

#define CACHE_BACK_EVICT_NUM 0 //how many path are evicted while swapping cache page back

#define DATADEBUG 1

struct Block {
	char offset;
	unsigned short leaf; //leaf label for this block , zero is valid
	int index; //the information of the block Index;
};

struct Bucket{
	char *nodeStartAddress;
	Bucket *parent;
	unsigned char count; // of times this bucket has been touched by ReadPath since it was last shuffled
	unsigned short valid; // represent the state of a block. 0:valid, 1:invalid

	// A bucket contains a number of Blocks
	struct Block blocks[BLOCKSINBUCKET];
};

struct StashMetadata{
	// unsigned short index;
	// unsigned short leaf;
	int index;
	char* address;
};

class PathORAM {
    int	realPageNumber; // N: Number of real data blocks in ORAM
	int	Depth;			// L: Depth of the ORAM tree;
	int	BlockSize;		// B: Data block size

	//bucket
	unsigned char maxRealBlocksNum; // Z: Maximum number of real blocks per bucket, 
	unsigned char reservedDummyNum; // S: Number of slots reserved for dummies per bucket
	unsigned char BlocksInABucket ;  //BLOCKSINBUCKET the number of blocks in a bucket = S+Z
	size_t bucketNumber;               // the total number of buckets in trees
	struct Bucket *bucketMetaData;


	//reserved area: stash + ORAMarea
	char *ReservedArea;
	
	//position map
	int *position;
	
	//stash
	struct StashMetadata *stash;
	int currentStashBoundry;
	int StashSize;

	//misc
	size_t *PATHReadingGroup;
	int leafStartIndex;
	int round;    // A: Eviction rate
	struct Bucket **tempBucketContainer;
	struct Block  **tempBlockContainer;
	size_t *StashReadingGroup;
	size_t *helperArrayForWriteBuck;
	int StartIndex;
	int currentStashPtr;


	//help array for stash shuffle
	size_t *helperarrayForStashShuffle;
	int recordStash;
	
	//shuffleGroup shores the offset of the target shuffle pages
	size_t *shuffleGroup;
	size_t shuffleStartAddress;

	size_t RecentEvict[RECORDRECENTNUM]={0};

	//get the start index of a bucket
	int GetNodeOnPath(int leaf, int depth);
	Bucket * GetLeafBucket(int leaf);
	//get bucket on Path
	Bucket *GetBucketOnPath(int leaf,int depth);
	void getBucketOfAPath(int leaf,std::vector<Bucket*> &path);

	bool EvictPath();
	int EarlyReshuffle(int leaf);
	bool ReadBucket(Bucket *);
	bool WriteBucket(Bucket *,int min,int max);
	size_t getASparePageInStash(size_t &targetAddress);
	void recordNewEvictPage(int);

	//for testing
	size_t CacheStart;
	int *CacheIndex;
	int CacheNumber;
	size_t getAllValidPageMACTimes;
	int print_count; //for count the get MAC times

	//
	int G;
	int recordGroupNum;
	int RecentAccessROR;
	int shuffleStashtimes;
	int obliviousWriteBucketWriteBuckNum;

public:
	PathORAM(size_t PathORAMReservedArea_start,size_t ObliviousStart,size_t pageNumber,size_t blockSize,int startIndex,int stashSize);
	~PathORAM();
		void initOram(unsigned startAddress, long pageNumber);
	int Access(int blockIndex,int evictedBlockIndex,size_t targetAddress,bool needDoSwap);
	bool ReadPath(int leaf,int blockIndex,size_t targetAddress);
	
	//helper functions
	int GetBlockOffset(Bucket *bucket,int BlockIndex,bool &isReal);
	int GetBlockSize(){return BlockSize;}
	int GetNumOfBlockInABucket(){return BlocksInABucket;}
	size_t GetDepth(){return Depth;}

	//copy a shadow page from src to dest
	int quickCopyAShadowPage(size_t destPage,size_t srcPage);

	//untraceable copy a shadow page to 

	// functions for test
	// bool getASparePage(size_t &targetAddress);
	void coutStashState();
	int stasticIndexBlock(int leafIndex);
	int findBlockLeafIndex(int blockIndex);
	int searchBlockInStash(int blockIndex);
	bool isInEvictPath;

	//this is an oblivious cpy function that hides where the page copy from
	//Group: is a array that contains the addresses of a bunch of blocks,
	//groupNum: the number of blocks in this group
	//srcIndex: the realblock in this group
	//destAddress: targetAddress that should be copied to.
	int obliviousCPY_HF(size_t *Group,int groupNum,int srcIndex,size_t destAddress);
	//this function swap a cache page out to a spare page, and then swap the target page into the cache   
	int SWAPCachePageOutTargetIn(size_t targetCachePageAddress,int srcIndex,int sparePageIndex,bool needDoSwap);
	//shuffle a group of pages
	int shuffleAGroupOfpages(size_t *Group,int groupNum);
	void shuffleStash();
	//oblivous write bucket back
	//srcBlock: srcNum of blocks in srcBlock are reals, the left blocks are dummy
	int obliviousWriteBucket(int *srcBlock,int srcNum,int realNum,Bucket *butcket,int bucketNum);

	//write cache back to stash
	void writeCashBack(size_t cacheStartAddress,int pageNum,int evictNum,int *cacheIndex,int startIndex);

	//testFunction
	int checkInStashOrOramTree();
	int checkWhetherInTheRightORAMTree();
	size_t findABlock(size_t blockIndex,int currentCachePtr);

	size_t getAPageMAC(size_t startAddress);
	size_t getARangeMAC(size_t startVirtAddr,size_t endVirtAddr,int currentPtr);

	//we will calculate the MAC of pages in cache, stash and stack
	size_t getAllValidPageMAC(size_t cacheStartAddr,int *cacheIndexArray,int currentPtr,int *cacheSlotValidArray); 

	//for testing
	void setCacheInfo(size_t cacheStart,int *cacheIndex,int cacheNumber){
		CacheStart=cacheStart;
		CacheIndex=cacheIndex;
		CacheNumber=cacheNumber;
	}
};



