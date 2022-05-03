Content-Type: multipart/mixed; boundary="===============6929661925880465906=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH V2 2/2] Swiotlb: Add device bounce buffer allocation interface
Date: Tue, 03 May 2022 19:49:36 +0800
Message-ID: <202205031911.3lYKS95Q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6929661925880465906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220502125436.23607-3-ltykernel@gmail.com>
References: <20220502125436.23607-3-ltykernel@gmail.com>
TO: Tianyu Lan <ltykernel@gmail.com>

Hi Tianyu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on next-20220429]
[cannot apply to linus/master v5.18-rc5 v5.18-rc4 v5.18-rc3 v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/swiotlb-A=
dd-child-io-tlb-mem-support/20220502-205700
base:    5469f0c06732a077c70a759a81f2a1f00b277694
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20503/202205031911.3lYKS95Q-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a=
645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3349f5b007cd7eca2f8=
2daa9dcaf4d234716c069
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tianyu-Lan/swiotlb-Add-child-io-tl=
b-mem-support/20220502-205700
        git checkout 3349f5b007cd7eca2f82daa9dcaf4d234716c069
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/dma/swiotlb.c:982:2: note: Taking false branch
           if (!page)
           ^
   kernel/dma/swiotlb.c:985:8: note: Calling 'kzalloc'
           mem =3D kzalloc(sizeof(*mem), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:588:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:605:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:605:2: note: Returning pointer
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:733:2: note: Returning pointer
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/swiotlb.c:985:8: note: Returning from 'kzalloc'
           mem =3D kzalloc(sizeof(*mem), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/swiotlb.c:985:2: note: Value assigned to 'mem'
           mem =3D kzalloc(sizeof(*mem), GFP_KERNEL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/swiotlb.c:986:6: note: Assuming 'mem' is null
           if (!mem)
               ^~~~
   kernel/dma/swiotlb.c:986:2: note: Taking true branch
           if (!mem)
           ^
   kernel/dma/swiotlb.c:987:3: note: Control jumps to line 1024
                   goto error_mem;
                   ^
   kernel/dma/swiotlb.c:1024:21: note: Passing null pointer value via 1st p=
arameter 'mem'
           swiotlb_free_block(mem, page_to_phys(page), nslabs / IO_TLB_BLOC=
KSIZE);
                              ^~~
   kernel/dma/swiotlb.c:1024:2: note: Calling 'swiotlb_free_block'
           swiotlb_free_block(mem, page_to_phys(page), nslabs / IO_TLB_BLOC=
KSIZE);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   kernel/dma/swiotlb.c:908:6: note: Access to field 'num_child' results in=
 a dereference of a null pointer (loaded from variable 'mem')
           if (mem->num_child) {
               ^~~
   kernel/dma/swiotlb.c:958:21: warning: The left operand of '+' is a garba=
ge value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           mem->index =3D nslot + 1;
                              ^
   kernel/dma/swiotlb.c:981:9: note: Calling 'swiotlb_alloc_block'
           page =3D swiotlb_alloc_block(parent_mem, nslabs / IO_TLB_BLOCKSI=
ZE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/swiotlb.c:930:28: note: 'nslot' declared without an initial v=
alue
           unsigned int block_index, nslot;
                                     ^~~~~
   kernel/dma/swiotlb.c:935:6: note: Assuming 'mem' is non-null
           if (!mem || !mem->block)
               ^~~~
   kernel/dma/swiotlb.c:935:6: note: Left side of '||' is false
   kernel/dma/swiotlb.c:935:14: note: Assuming field 'block' is non-null
           if (!mem || !mem->block)
                       ^~~~~~~~~~~
   kernel/dma/swiotlb.c:935:2: note: Taking false branch
           if (!mem || !mem->block)
           ^
   kernel/dma/swiotlb.c:938:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&mem->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   kernel/dma/swiotlb.c:938:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&mem->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   kernel/dma/swiotlb.c:942:6: note: Assuming 'block_num' is <=3D field 'li=
st'
           if (mem->block[block_index].list < block_num) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/swiotlb.c:942:2: note: Taking false branch
           if (mem->block[block_index].list < block_num) {
           ^
   kernel/dma/swiotlb.c:948:24: note: Assuming the condition is false
           for (i =3D block_index; i < block_index + block_num; i++) {
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/dma/swiotlb.c:948:2: note: Loop condition is false. Execution con=
tinues on line 958
           for (i =3D block_index; i < block_index + block_num; i++) {
           ^
   kernel/dma/swiotlb.c:958:21: note: The left operand of '+' is a garbage =
value
           mem->index =3D nslot + 1;
                        ~~~~~ ^
>> kernel/dma/swiotlb.c:1024:2: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           swiotlb_free_block(mem, page_to_phys(page), nslabs / IO_TLB_BLOC=
KSIZE);
           ^                  ~~~
   kernel/dma/swiotlb.c:982:6: note: Assuming 'page' is non-null
           if (!page)
               ^~~~~
   kernel/dma/swiotlb.c:982:2: note: Taking false branch
           if (!page)
           ^
   kernel/dma/swiotlb.c:986:6: note: Assuming 'mem' is non-null
           if (!mem)
               ^~~~
   kernel/dma/swiotlb.c:986:2: note: Taking false branch
           if (!mem)
           ^
   kernel/dma/swiotlb.c:991:6: note: Assuming field 'slots' is null
           if (!mem->slots)
               ^~~~~~~~~~~
   kernel/dma/swiotlb.c:991:2: note: Taking true branch
           if (!mem->slots)
           ^
   kernel/dma/swiotlb.c:992:3: note: Control jumps to line 1022
                   goto error_slots;
                   ^
   kernel/dma/swiotlb.c:1022:2: note: Memory is released
           kfree(mem);
           ^~~~~~~~~~
   kernel/dma/swiotlb.c:1024:2: note: Use of memory after it is freed
           swiotlb_free_block(mem, page_to_phys(page), nslabs / IO_TLB_BLOC=
KSIZE);
           ^                  ~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   mm/gup.c:711:2: warning: Value stored to 'page' is never read [clang-ana=
lyzer-deadcode.DeadStores]
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/gup.c:711:2: note: Value stored to 'page' is never read
           page =3D follow_trans_huge_pmd(vma, address, pmd, flags);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   mm/memory.c:335:2: warning: Value stored to 'p4d' is never read [clang-a=
nalyzer-deadcode.DeadStores]
           p4d =3D p4d_offset(pgd, start);
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:335:2: note: Value stored to 'p4d' is never read
           p4d =3D p4d_offset(pgd, start);
           ^     ~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:498:2: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memset(rss, 0, sizeof(int) * NR_MM_COUNTERS);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   mm/memory.c:498:2: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
           memset(rss, 0, sizeof(int) * NR_MM_COUNTERS);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   mm/memory.c:2636:3: warning: 1st function call argument is an uninitiali=
zed value [clang-analyzer-core.CallAndMessage]
                   pte_unmap_unlock(mapped_pte, ptl);
                   ^
   include/linux/mm.h:2350:2: note: expanded from macro 'pte_unmap_unlock'
           spin_unlock(ptl);                               \
           ^
   mm/memory.c:2808:9: note: Calling '__apply_to_page_range'
           return __apply_to_page_range(mm, addr, size, fn, data, false);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2760:14: note: Assuming 'addr' is < 'end'
           if (WARN_ON(addr >=3D end))
                       ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   mm/memory.c:2760:6: note: Taking false branch
           if (WARN_ON(addr >=3D end))
               ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   mm/memory.c:2760:2: note: Taking false branch
           if (WARN_ON(addr >=3D end))

vim +1024 kernel/dma/swiotlb.c

3349f5b007cd7e Tianyu Lan 2022-05-02   926  =

3349f5b007cd7e Tianyu Lan 2022-05-02   927  =

3349f5b007cd7e Tianyu Lan 2022-05-02   928  static struct page *swiotlb_all=
oc_block(struct io_tlb_mem *mem, unsigned int block_num)
3349f5b007cd7e Tianyu Lan 2022-05-02   929  {
3349f5b007cd7e Tianyu Lan 2022-05-02   930  	unsigned int block_index, nslo=
t;
3349f5b007cd7e Tianyu Lan 2022-05-02   931  	phys_addr_t tlb_addr;
3349f5b007cd7e Tianyu Lan 2022-05-02   932  	unsigned long flags;
3349f5b007cd7e Tianyu Lan 2022-05-02   933  	int i, j;
3349f5b007cd7e Tianyu Lan 2022-05-02   934  =

3349f5b007cd7e Tianyu Lan 2022-05-02   935  	if (!mem || !mem->block)
3349f5b007cd7e Tianyu Lan 2022-05-02   936  		return NULL;
3349f5b007cd7e Tianyu Lan 2022-05-02   937  =

3349f5b007cd7e Tianyu Lan 2022-05-02   938  	spin_lock_irqsave(&mem->lock, =
flags);
3349f5b007cd7e Tianyu Lan 2022-05-02   939  	block_index =3D mem->block_ind=
ex;
3349f5b007cd7e Tianyu Lan 2022-05-02   940  =

3349f5b007cd7e Tianyu Lan 2022-05-02   941  	/* Todo: Search more blocks. */
3349f5b007cd7e Tianyu Lan 2022-05-02   942  	if (mem->block[block_index].li=
st < block_num) {
3349f5b007cd7e Tianyu Lan 2022-05-02   943  		spin_unlock_irqrestore(&mem->=
lock, flags);
3349f5b007cd7e Tianyu Lan 2022-05-02   944  		return NULL;
3349f5b007cd7e Tianyu Lan 2022-05-02   945  	}
3349f5b007cd7e Tianyu Lan 2022-05-02   946  =

3349f5b007cd7e Tianyu Lan 2022-05-02   947  	/* Update block and slot list.=
 */
3349f5b007cd7e Tianyu Lan 2022-05-02  @948  	for (i =3D block_index; i < bl=
ock_index + block_num; i++) {
3349f5b007cd7e Tianyu Lan 2022-05-02   949  		mem->block[i].list =3D 0;
3349f5b007cd7e Tianyu Lan 2022-05-02   950  		mem->block[i].alloc_size =3D =
IO_TLB_BLOCKSIZE;
3349f5b007cd7e Tianyu Lan 2022-05-02   951  		for (j =3D 0; j < IO_TLB_BLOC=
KSIZE; j++) {
3349f5b007cd7e Tianyu Lan 2022-05-02   952  			nslot =3D i * IO_TLB_BLOCKSI=
ZE + j;
3349f5b007cd7e Tianyu Lan 2022-05-02   953  			mem->slots[nslot].list =3D 0;
3349f5b007cd7e Tianyu Lan 2022-05-02   954  			mem->slots[nslot].alloc_size=
 =3D IO_TLB_SIZE;
3349f5b007cd7e Tianyu Lan 2022-05-02   955  		}
3349f5b007cd7e Tianyu Lan 2022-05-02   956  	}
3349f5b007cd7e Tianyu Lan 2022-05-02   957  =

3349f5b007cd7e Tianyu Lan 2022-05-02   958  	mem->index =3D nslot + 1;
3349f5b007cd7e Tianyu Lan 2022-05-02   959  	mem->block_index +=3D block_nu=
m;
3349f5b007cd7e Tianyu Lan 2022-05-02   960  	mem->used +=3D block_num * IO_=
TLB_BLOCKSIZE;
3349f5b007cd7e Tianyu Lan 2022-05-02   961  	spin_unlock_irqrestore(&mem->l=
ock, flags);
3349f5b007cd7e Tianyu Lan 2022-05-02   962  =

3349f5b007cd7e Tianyu Lan 2022-05-02   963  	tlb_addr =3D slot_addr(mem->st=
art, block_index * IO_TLB_BLOCKSIZE);
3349f5b007cd7e Tianyu Lan 2022-05-02   964  	return pfn_to_page(PFN_DOWN(tl=
b_addr));
3349f5b007cd7e Tianyu Lan 2022-05-02   965  }
3349f5b007cd7e Tianyu Lan 2022-05-02   966  =

3349f5b007cd7e Tianyu Lan 2022-05-02   967  /*
3349f5b007cd7e Tianyu Lan 2022-05-02   968   * swiotlb_device_allocate - Al=
locate bounce buffer fo device from
3349f5b007cd7e Tianyu Lan 2022-05-02   969   * default io tlb pool. The all=
ocation size should be aligned with
3349f5b007cd7e Tianyu Lan 2022-05-02   970   * IO_TLB_BLOCK_UNIT.
3349f5b007cd7e Tianyu Lan 2022-05-02   971   */
3349f5b007cd7e Tianyu Lan 2022-05-02   972  int swiotlb_device_allocate(str=
uct device *dev,
3349f5b007cd7e Tianyu Lan 2022-05-02   973  			    unsigned int queue_num,
3349f5b007cd7e Tianyu Lan 2022-05-02   974  			    unsigned long size)
3349f5b007cd7e Tianyu Lan 2022-05-02   975  {
3349f5b007cd7e Tianyu Lan 2022-05-02   976  	struct io_tlb_mem *mem, *paren=
t_mem =3D dev->dma_io_tlb_mem;
3349f5b007cd7e Tianyu Lan 2022-05-02   977  	unsigned long nslabs =3D ALIGN=
(size >> IO_TLB_SHIFT, IO_TLB_BLOCKSIZE);
3349f5b007cd7e Tianyu Lan 2022-05-02   978  	struct page *page;
3349f5b007cd7e Tianyu Lan 2022-05-02   979  	int ret =3D -ENOMEM;
3349f5b007cd7e Tianyu Lan 2022-05-02   980  =

3349f5b007cd7e Tianyu Lan 2022-05-02   981  	page =3D swiotlb_alloc_block(p=
arent_mem, nslabs / IO_TLB_BLOCKSIZE);
3349f5b007cd7e Tianyu Lan 2022-05-02   982  	if (!page)
3349f5b007cd7e Tianyu Lan 2022-05-02   983  		return -ENOMEM;
3349f5b007cd7e Tianyu Lan 2022-05-02   984  =

3349f5b007cd7e Tianyu Lan 2022-05-02   985  	mem =3D kzalloc(sizeof(*mem), =
GFP_KERNEL);
3349f5b007cd7e Tianyu Lan 2022-05-02   986  	if (!mem)
3349f5b007cd7e Tianyu Lan 2022-05-02   987  		goto error_mem;
3349f5b007cd7e Tianyu Lan 2022-05-02   988  =

3349f5b007cd7e Tianyu Lan 2022-05-02   989  	mem->slots =3D kzalloc(array_s=
ize(sizeof(*mem->slots), nslabs),
3349f5b007cd7e Tianyu Lan 2022-05-02   990  			     GFP_KERNEL);
3349f5b007cd7e Tianyu Lan 2022-05-02   991  	if (!mem->slots)
3349f5b007cd7e Tianyu Lan 2022-05-02   992  		goto error_slots;
3349f5b007cd7e Tianyu Lan 2022-05-02   993  =

3349f5b007cd7e Tianyu Lan 2022-05-02   994  	mem->block =3D kcalloc(nslabs =
/ IO_TLB_BLOCKSIZE,
3349f5b007cd7e Tianyu Lan 2022-05-02   995  				sizeof(struct io_tlb_block),
3349f5b007cd7e Tianyu Lan 2022-05-02   996  				GFP_KERNEL);
3349f5b007cd7e Tianyu Lan 2022-05-02   997  	if (!mem->block)
3349f5b007cd7e Tianyu Lan 2022-05-02   998  		goto error_block;
3349f5b007cd7e Tianyu Lan 2022-05-02   999  =

3349f5b007cd7e Tianyu Lan 2022-05-02  1000  	mem->num_child =3D queue_num;
3349f5b007cd7e Tianyu Lan 2022-05-02  1001  	mem->child =3D kcalloc(queue_n=
um,
3349f5b007cd7e Tianyu Lan 2022-05-02  1002  				sizeof(struct io_tlb_mem),
3349f5b007cd7e Tianyu Lan 2022-05-02  1003  				GFP_KERNEL);
3349f5b007cd7e Tianyu Lan 2022-05-02  1004  	if (!mem->child)
3349f5b007cd7e Tianyu Lan 2022-05-02  1005  		goto error_child;
3349f5b007cd7e Tianyu Lan 2022-05-02  1006  =

3349f5b007cd7e Tianyu Lan 2022-05-02  1007  =

3349f5b007cd7e Tianyu Lan 2022-05-02  1008  	swiotlb_init_io_tlb_mem(mem, p=
age_to_phys(page), nslabs, true);
3349f5b007cd7e Tianyu Lan 2022-05-02  1009  	mem->force_bounce =3D true;
3349f5b007cd7e Tianyu Lan 2022-05-02  1010  	mem->for_alloc =3D true;
3349f5b007cd7e Tianyu Lan 2022-05-02  1011  =

3349f5b007cd7e Tianyu Lan 2022-05-02  1012  	mem->vaddr =3D parent_mem->vad=
dr + page_to_phys(page) -  parent_mem->start;
3349f5b007cd7e Tianyu Lan 2022-05-02  1013  	dev->dma_io_tlb_mem->parent =
=3D parent_mem;
3349f5b007cd7e Tianyu Lan 2022-05-02  1014  	dev->dma_io_tlb_mem =3D mem;
3349f5b007cd7e Tianyu Lan 2022-05-02  1015  	return 0;
3349f5b007cd7e Tianyu Lan 2022-05-02  1016  =

3349f5b007cd7e Tianyu Lan 2022-05-02  1017  error_child:
3349f5b007cd7e Tianyu Lan 2022-05-02  1018  	kfree(mem->block);
3349f5b007cd7e Tianyu Lan 2022-05-02  1019  error_block:
3349f5b007cd7e Tianyu Lan 2022-05-02  1020  	kfree(mem->slots);
3349f5b007cd7e Tianyu Lan 2022-05-02  1021  error_slots:
3349f5b007cd7e Tianyu Lan 2022-05-02  1022  	kfree(mem);
3349f5b007cd7e Tianyu Lan 2022-05-02  1023  error_mem:
3349f5b007cd7e Tianyu Lan 2022-05-02 @1024  	swiotlb_free_block(mem, page_t=
o_phys(page), nslabs / IO_TLB_BLOCKSIZE);
3349f5b007cd7e Tianyu Lan 2022-05-02  1025  	return ret;
3349f5b007cd7e Tianyu Lan 2022-05-02  1026  }
3349f5b007cd7e Tianyu Lan 2022-05-02  1027  EXPORT_SYMBOL_GPL(swiotlb_devic=
e_allocate);
3349f5b007cd7e Tianyu Lan 2022-05-02  1028  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6929661925880465906==--

