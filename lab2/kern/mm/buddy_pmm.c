#include <pmm.h>
#include <list.h>
#include <string.h>
#include <buddy_pmm.h>
#include <default_pmm.h>

static size_t buddy_whole_pages; //���ϵͳ������ҳ������
static struct Page* buddy_base;//������һ���������ڴ�ռ䣬���������Ҫ�ѻ���ַ��¼����
static size_t buddy_pages[32768*4];//����ʹ����zkw�߶���������ֻ��һ��һά���顣������˵����ռ�ֻ��Ҫ����32768����Ϊҳ��������16384���������ĺܴ�ҳ����ν�����Է�ֹԽ�硣ע�⣬�߶����ڶ˵㴦���˻��ɵ�����

free_area_t free_area;
#define free_list (free_area.free_list)
#define nr_free (free_area.nr_free)

//�ȴ�С��һ����
#define max(a, b) ((a) > (b) ? (a) : (b))

//��д������Ҫ����
static void buddy_init(void) {
    list_init(&free_list);
    nr_free=0;
}
//��ʼ��zkw�߶�����ģ��
void init_zkw_segment_tree(void){
    for (int i = 16384; i < 16384 << 1; ++i)
    {
        buddy_pages[i] = 1;
    }
    for (int i = 16384 - 1; i > 0; --i)
    {
        buddy_pages[i] = buddy_pages[i << 1] << 1;
    }
    cprintf("DONE!\n");
    return ;
}
//����һ���ҵ����ʵĿ�ĺ�����Ҳ��zkw�߶�����ģ�塣

size_t get_block_index(size_t n)
{
    size_t want_index = 1;
    size_t size ;
    for (size= buddy_whole_pages; size >= n; size >>= 1) {
    //�ȿ�������Ƿ��Ҫ����Ŀռ�������ͽ�����һ�㡣
        if (buddy_pages[want_index << 1] >= n) 
        {
            want_index <<= 1;
        }
    //���������Ѿ������䣬�����Ҷ������㣬�ͽ��Ҷ��ӡ�
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

//����ģ�壬һ��ά���ĺ�����ע��,zkw�߶�����Ҫ��������ά����
void update(size_t index)
{    
    for (size_t i=index>>=1; (i>>1)>0;i>>=1)
    {   
        buddy_pages[i] = max(buddy_pages[i<< 1], buddy_pages[i << 1 | 1]);
    }
    return ;
}

//�ж��Ƿ�Ϊ2�������ݵĺ���
//�����2�������ݣ���ô��Ϊ������Ӧ��ֻ��һ��1����һ����λ���0������λ���1���ٰ�λ�룬���Ϊ0
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

//����һ��size�����Ӧ����������Ĵ�С���˴��ο��˲��͸��������ݡ�
//����ͨ��λ���㣬�Ѵӵ�һ��1��ʼ�ĺ������λ��ȡ��1��������2^n-1,����һ����2^n��
//����������û���ж��Ƿ��ر���������ոմ�һ���2�������ݣ���������������4���᷵��8������256�᷵��512��������Ҫ�����ô���һ��
//����Ҽ���һ���ж�
//�������ϵĲο������ǰ��ж����ں���ˣ��о���û����
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

//��ʼ��
static void buddy_init_memmap(struct Page *base, size_t n) {
    assert(n > 0);
    //���жϻ��ϵͳ�ܷ������ҳ

    buddy_whole_pages=get_buddy_size(n);
    //���ں���ʵ�ֵ�������ȡ2���ݣ������ϵͳ�ɷ����ڴ治���ܳ���ʵ�ʷ����ڴ��С����˳���2
    buddy_whole_pages >>= 1 ;
    cprintf("total_pages %d, for_buddy_blocks %d\n", n, buddy_whole_pages);

    buddy_base = base;
    //���������ֱ�ӷ�д
    for (struct Page *p = buddy_base; p != base + n; ++p) {
        ClearPageReserved(p);
        SetPageProperty(p);
        set_page_ref(p, 0);
        list_add_before(&free_list,&(p->page_link));     
    }
    //���濪ʼ�߶����Ľ�������
    cprintf("build zkw_segment_tree begin!\n");
    init_zkw_segment_tree();
}

static struct Page* buddy_alloc_pages(size_t n) {
    assert(n > 0);
    //�������ĳ����˻��ϵͳҳ��������ֻ�ܷ���
    if (n > buddy_pages[1]) 
    {
    return NULL;
    }
    
    //ȡҪ�����ҳ
    size_t index=get_block_index(n);
    size_t size=buddy_pages[index];
    buddy_pages[index] = 0;
    // ��ô���ڵ�����ȥ�ˣ��ӽڵ�Ͷ�û��
    struct Page* new_page = buddy_base + index * size - buddy_whole_pages;
    for (struct Page* p = new_page; p != new_page + size; ++p)
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
    //�Ե�����ά����
    size_t index= base - buddy_base+ buddy_whole_pages;
    
    //�ҵ��Ǹ������Ǹ��Ƴ�0�Ŀ飬ͬʱ��Ҫ�������Ŀ��С��
    for (int i=index; buddy_pages[i] > 0; i >>= 1)
    {
      size<<=1;
      index>>=1;
    }
    //�������
    for (struct Page *p = base; p != base + n; ++p) 
    {
        assert(!PageReserved(p) && !PageProperty(p));
        SetPageProperty(p);
        set_page_ref(p, 0);
    }
    
    //��ĺϲ�����������Ҫ���Ѿ�������Ŀ鸽��ֵ��Ȼ�����ϸ��¡�
    //д�����﷢���廪16���̼���������ǰ��Ҳ�ǲ�����zkw�߶����Ļ��ƣ����ֱ���ù������ˡ�����
    //����ѹ��ѡ�֣�һ��ѭ��ʡ����д��40�л����Եĺ���������
    //ÿ���ڵ�ά����ǰ������ɹ�����������ڴ���С������� buddy_page �У����ڵ������Ϣ���£�
    //������Ӻ��Һ��Ӷ�û��ʹ�ã���ǰ�ڵ����óɵ�ǰ���С��
    //������ӻ��Һ�������һ����ʹ�ù�����ǰ�ڵ����ó��������ӿɷ�������С�����ֵ��
    for (buddy_pages[index] = size;size <<= 1, (index >>= 1) > 0;)
    {    
        buddy_pages[index] = (buddy_pages[index << 1] + buddy_pages[index << 1 | 1] == size) ? size : max(buddy_pages[index << 1], buddy_pages[index << 1 | 1]);
    }
}

//�������п��õ�ҳ����������ôҲ����zkw�߶����ĸ��ڵ��ֵ
static size_t buddy_nr_free_pages(void)
{ 
    return buddy_pages[1]; 
}

//��������������ҵģ����������޸ġ���ʵ��Ӧ���ǶԵġ�
static void buddy_check(void) {
/*
����������������:

�������� p0 p1 p2 p3
���СΪ 70 35 257 63

��ǰ������Ŀ��Լ����С |64+64|64|64|128+128|512|
���Ӧ��ҳ                 |p0   |p1|p3|��     |p2|

Ȼ���ͷ�p0\p1\p3

��ʱ��ǰ512��ҳ�Ѿ�����

Ȼ���������� p4 p5
���СΪ     255 255

��ô��ʱ��ϵͳ���ڴ�ռ���������
|256|256|256|
|p4 |p5 |p2 | 

����ͷš�
ע�⣬ָ��ĵ�ַ���ǿ���׵�ַ��
ͨ��������֤��Ȼ�󽫽����ӡ��������Ϊֱ�ۡ�Ҳ����ͨ�����Ի���assert()�ж���
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
    //ע�⣬һ���ṹ��ָ����20���ֽڣ���3��int,3*4������һ��˫������,����ָ����8������һ����20��
    cprintf("p0 %p\n",p0);
    cprintf("p1 %p\n",p1);
    cprintf("p1-p0 equal %p ?=128\n",p1-p0);//Ӧ�ò�128
    
    p2=alloc_pages(257);
    cprintf("p2 %p\n",p2);
    cprintf("p2-p1 equal %p ?=128+256\n",p2-p1);//Ӧ�ò�384
    
    p3=alloc_pages(63);
    cprintf("p3 %p\n",p3);
    cprintf("p3-p1 equal %p ?=64\n",p3-p1);//Ӧ�ò�64
    
    free_pages(p0,70);    
    cprintf("free p0!\n");
    free_pages(p1,35);
    cprintf("free p1!\n");
    free_pages(p3,63);    
    cprintf("free p3!\n");
    
    p4=alloc_pages(255);
    cprintf("p4 %p\n",p4);
    cprintf("p2-p4 equal %p ?=512\n",p2-p4);//Ӧ�ò�512
    
    p5=alloc_pages(255);
    cprintf("p5 %p\n",p5);
    cprintf("p5-p4 equal %p ?=256\n",p5-p4);//Ӧ�ò�256
        free_pages(p2,257);    
    cprintf("free p2!\n");
        free_pages(p4,255);    
    cprintf("free p4!\n"); 
            free_pages(p5,255);    
    cprintf("free p5!\n");   
    cprintf("CHECK DONE!\n") ;
}
//ֱ�ӷ�д��
const struct pmm_manager buddy_pmm_manager = {
    .name = "buddy_pmm_manager",
    .init = buddy_init,
    .init_memmap = buddy_init_memmap,
    .alloc_pages = buddy_alloc_pages,
    .free_pages = buddy_free_pages,
    .nr_free_pages = buddy_nr_free_pages,
    .check = buddy_check,
};