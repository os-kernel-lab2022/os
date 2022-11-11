#include <pmm.h>
#include <list.h>
#include <string.h>
#include <buddy_pmm.h>
#include <default_pmm.h>

static size_t buddy_whole_pages; //伙伴系统的所有页的数量
static struct Page* buddy_base;//由于是一个连续的内存空间，因此我们需要把基地址记录下来
static size_t buddy_pages[32768*4];//由于使用了zkw线段树，我们只有一个一维数组。理论上说这个空间只需要开到32768，因为页的数量是16384，不过开的很大页无所谓，可以防止越界。注意，线段树在端点处会退化成点树。

static free_area_t free_area;
#define free_list (free_area.free_list)
#define nr_free (free_area.nr_free)

//比大小的一个宏
#define max(a, b) ((a) > (b) ? (a) : (b))

//仿写，不需要更改
static void buddy_init(void) {
    list_init(&free_list);
    nr_free=0;
}
//初始化zkw线段树的模板
void init_zkw_segment_tree(void){
    int i;
    for (i = 16384; i < 16384 << 1; ++i)
    {
        buddy_pages[i] = 1;
    }
    for (i = 16384 - 1; i > 0; --i)
    {
        buddy_pages[i] = buddy_pages[i << 1] << 1;
    }
    cprintf("DONE!\n");
    return ;
}
//这是一个找到合适的块的函数，也是zkw线段树的模板。

size_t get_block_index(size_t n)
{
    size_t want_index = 1;
    size_t size ;
    for (size= buddy_whole_pages; size >= n; size >>= 1) {
    //先看左儿子是否比要分配的空间大，如果大就进入下一层。
        if (buddy_pages[want_index << 1] >= n) 
        {
            want_index <<= 1;
        }
    //如果左儿子已经被分配，但是右儿子满足，就进右儿子。
        else if (buddy_pages[want_index << 1 | 1] >= n) 
        {
            want_index = want_index << 1 | 1;
        }
        else
        {
            return want_index;
        }
    }
}

//还是模板，一个维护的函数。注意,zkw线段树是要从下向上维护。
void update(size_t index)
{
    size_t i;
    for (i=index>>=1; (i>>1)>0;i>>=1)
    {   
        buddy_pages[i] = max(buddy_pages[i<< 1], buddy_pages[i << 1 | 1]);
    }
    return ;
}

//判断是否为2的整数幂的函数
//如果是2的整数幂，那么化为二进制应该只有一个1，减一后那位变成0，其他位变成1，再按位与，结果为0
size_t judge_two_power(size_t x){
    if((x&(x-1)) == 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

//给定一个size，求出应给给他分配的大小，此处参考了博客给出的内容。
//就是通过位运算，把从第一个1开始的后面各个位都取满1，这样是2^n-1,最后加一就是2^n了
//这个函数如果没有判定是返回比输入的数刚刚大一点的2的整数幂，但是如果输入比如4，会返回8，输入256会返回512，比我们要的正好大了一倍
//因此我加了一个判定
//不过网上的参考程序是把判定加在后边了，感觉上没区别。
size_t get_buddy_size(size_t size) {
    if(judge_two_power(size)){
        size |= size >> 1;
        size |= size >> 2;
        size |= size >> 4;
        size |= size >> 8;
        size |= size >> 16;
        return (size+1)>>2;}
    else{
        size |= size >> 1;
        size |= size >> 2;
        size |= size >> 4;
        size |= size >> 8;
        size |= size >> 16;
        return size+1;}
}

//初始化
static void buddy_init_memmap(struct Page *base, size_t n) {
    assert(n > 0);
    //先判断伙伴系统能分配多少页

    buddy_whole_pages=get_buddy_size(n);
    //由于函数实现的是向上取2的幂，但伙伴系统可分配内存不可能超过实际分配内存大小，因此除以2
    buddy_whole_pages >>= 1 ;
    cprintf("total_pages %d, for_buddy_blocks %d\n", n, buddy_whole_pages);

    buddy_base = base;
    //常规操作，直接仿写
    struct Page *p=buddy_base;
    for (; p != base + n; ++p) {
        ClearPageReserved(p);
        SetPageProperty(p);
        set_page_ref(p, 0);
        list_add_before(&free_list,&(p->page_link));     
    }
    //下面开始线段树的建树过程
    cprintf("build zkw_segment_tree begin!\n");
    init_zkw_segment_tree();
}

static struct Page* buddy_alloc_pages(size_t n) {
    assert(n > 0);
    //如果申请的超过了伙伴系统页的总量，只能返回
    if (n > buddy_pages[1]) 
    {
    return NULL;
    }
    
    //取要分配的页
    size_t index=get_block_index(n);
    size_t size=buddy_pages[index];
    buddy_pages[index] = 0;
    // 那么父节点分配出去了，子节点就都没了
    struct Page* new_page = buddy_base + index * size - buddy_whole_pages;
    struct Page* p = new_page;
    for (; p != new_page + size; ++p)
    {
        set_page_ref(p, 0);
        ClearPageProperty(p);
    }


    update(index);
    
    return new_page;
}

static void buddy_free_pages(struct Page *base, size_t n) {
    assert(n > 0);
    size_t size=1;
    //自底向上维护的
    size_t index= base - buddy_base+ buddy_whole_pages;
    
    //找到那个被我们复制成0的块，同时需要返回它的块大小。
    int i;
    for (i=index; buddy_pages[i] > 0; i >>= 1)
    {
      size<<=1;
      index>>=1;
    }
    //常规操作
    struct Page *p=base;
    for (; p != base + n; ++p) 
    {
        assert(!PageReserved(p) && !PageProperty(p));
        SetPageProperty(p);
        set_page_ref(p, 0);
    }
    
    //块的合并，首先我们要把已经被分配的块附上值，然后向上更新。
    //写到这里发现清华16级翁家翌珠玉在前，也是采用了zkw线段树的机制，因此直接拿过来用了。。。
    //他是压行选手，一个循环省了我写了40行还不对的函数。。。
    //每个节点维护当前段内最长可供分配的连续内存块大小（存放于 buddy_page 中）。节点更新信息如下：
    //如果左孩子和右孩子都没被使用，则当前节点设置成当前块大小；
    //如果左孩子或右孩子至少一个被使用过，则当前节点设置成两个孩子可分配最长块大小的最大值。
    for (buddy_pages[index] = size;size <<= 1, (index >>= 1) > 0;)
    {    
        buddy_pages[index] = (buddy_pages[index << 1] + buddy_pages[index << 1 | 1] == size) ? size : max(buddy_pages[index << 1], buddy_pages[index << 1 | 1]);
    }
}

//返回所有可用的页的数量，那么也就是zkw线段树的根节点的值
static size_t buddy_nr_free_pages(void)
{ 
    return buddy_pages[1]; 
}

//下面这个是网上找的，可以自行修改。经实验应该是对的。
static void buddy_check(void) {
/*
整个测试流程如下:
首先申请 p0 p1 p2 p3
其大小为 70 35 257 63
从前向后分配的块以及其大小 |64+64|64|64|128+128|512|
其对应的页                 |p0   |p1|p3|空     |p2|
然后释放p0\p1\p3
这时候前512个页已经空了
然后我们申请 p4 p5
其大小为     255 255
那么这时候系统的内存空间是这样的
|256|256|256|
|p4 |p5 |p2 | 
最后释放。
注意，指针的地址都是块的首地址。
通过计算验证，然后将结果打印出来，较为直观。也可以通过断言机制assert()判定。
*/
cprintf(
"-----------------------------------------------------"
"\n\nThe test process is as follows:\n"
"First,alloc   p0 p1 p2  p3\n"
"sizes of them 70 35 257 63\n"
"the buddy block:    |64+64|64|64|128+128|512|\n"
"the pages we alloc: |p0   |p1|p3|empty  |p2|\n"
"then,free. p0 p1 p3\n"
"now,the first 512 pages are free\n"
"then alloc:     p4  p5\n"
"sizes of the:   255 255\n"
"now,the distribution in memory space are below:\n"
"|256|256|256|\n"
"|p4 |p5 |p2 |\n"
"Last,free all buddy blocks.\n"
"Notice!addr of pointer is the base addr of the buddy block\n"
"we use cprintf() show the progress and if you want, you can use assert() to judge.\n\n"
"------------------------------------------------------\n");

    struct Page *p0, *p1,*p2;
    p0 = p1 = NULL;
    p2=NULL;
    struct Page *p3, *p4,*p5;
    assert((p0 = alloc_page()) != NULL);
    assert((p1 = alloc_page()) != NULL);
    assert((p2 = alloc_page()) != NULL);
    free_page(p0);
    free_page(p1);
    free_page(p2);
    
    p0=alloc_pages(70);
    p1=alloc_pages(35);
    //注意，一个结构体指针是20个字节，有3个int,3*4，还有一个双向链表,两个指针是8。加载一起是20。
    cprintf("p0 %p\n",p0);
    cprintf("p1 %p\n",p1);
    cprintf("p1-p0 equal %p ?=128\n",p1-p0);//应该差128
    
    p2=alloc_pages(257);
    cprintf("p2 %p\n",p2);
    cprintf("p2-p1 equal %p ?=128+256\n",p2-p1);//应该差384
    
    p3=alloc_pages(63);
    cprintf("p3 %p\n",p3);
    cprintf("p3-p1 equal %p ?=64\n",p3-p1);//应该差64
    
    free_pages(p0,70);    
    cprintf("free p0!\n");
    free_pages(p1,35);
    cprintf("free p1!\n");
    free_pages(p3,63);    
    cprintf("free p3!\n");
    
    p4=alloc_pages(255);
    cprintf("p4 %p\n",p4);
    cprintf("p2-p4 equal %p ?=512\n",p2-p4);//应该差512
    
    p5=alloc_pages(255);
    cprintf("p5 %p\n",p5);
    cprintf("p5-p4 equal %p ?=256\n",p5-p4);//应该差256
        free_pages(p2,257);    
    cprintf("free p2!\n");
        free_pages(p4,255);    
    cprintf("free p4!\n"); 
            free_pages(p5,255);    
    cprintf("free p5!\n");   
    cprintf("CHECK DONE!\n") ;
}
//直接仿写。
const struct pmm_manager buddy_pmm_manager = {
    .name = "buddy_pmm_manager",
    .init = buddy_init,
    .init_memmap = buddy_init_memmap,
    .alloc_pages = buddy_alloc_pages,
    .free_pages = buddy_free_pages,
    .nr_free_pages = buddy_nr_free_pages,
    .check = buddy_check,
};
