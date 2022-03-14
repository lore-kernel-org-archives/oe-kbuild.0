Content-Type: multipart/mixed; boundary="===============7512270607182392864=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/xen/swiotlb-xen.c:206:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Tue, 15 Mar 2022 04:38:54 +0800
Message-ID: <202203150407.KzSq020Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7512270607182392864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: cbce99527ca7c4e98db9890651d5e9dfc2fb89ac xen-swiotlb: remove xen_io=
_tlb_start and xen_io_tlb_nslabs
date:   12 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007-20220307 (https://download.01.org/0day-ci/ar=
chive/20220315/202203150407.KzSq020Z-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcbce99527ca7c4e98db9890651d5e9dfc2fb89ac
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cbce99527ca7c4e98db9890651d5e9dfc2fb89ac
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:315:2: note: Taking true branch
           if (lis3->whoami =3D=3D WAI_8B) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:318:3: note: 3rd function call argume=
nt is an uninitialized value
                   lis3->write(lis3, CTRL_REG3, ctrl_reg_data);
                   ^                            ~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:798:9: warning: 4th function call arg=
ument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           return sprintf(buf, "%s %d %d %d\n", res,
                  ^
   drivers/misc/lis3lv02d/lis3lv02d.c:786:10: note: Calling 'lis3lv02d_self=
test'
           switch (lis3lv02d_selftest(lis3, values)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:268:6: note: Assuming field 'whoami' =
is not equal to WAI_8B
           if (lis3->whoami =3D=3D WAI_8B) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:268:2: note: Taking false branch
           if (lis3->whoami =3D=3D WAI_8B) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:281:7: note: Assuming field 'whoami' =
is equal to WAI_3DC
           if ((lis3->whoami =3D=3D WAI_3DC) || (lis3->whoami =3D=3D WAI_3D=
LH)) {
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:281:32: note: Left side of '||' is tr=
ue
           if ((lis3->whoami =3D=3D WAI_3DC) || (lis3->whoami =3D=3D WAI_3D=
LH)) {
                                         ^
   drivers/misc/lis3lv02d/lis3lv02d.c:295:6: note: 'ret' is -6
           if (ret)
               ^~~
   drivers/misc/lis3lv02d/lis3lv02d.c:295:2: note: Taking true branch
           if (ret)
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:296:3: note: Control jumps to line 348
                   goto fail;
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:349:2: note: Returning without writin=
g to '*results'
           return ret;
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:786:10: note: Returning from 'lis3lv0=
2d_selftest'
           switch (lis3lv02d_selftest(lis3, values)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:786:2: note: Control jumps to the 'de=
fault' case at line 794
           switch (lis3lv02d_selftest(lis3, values)) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:796:3: note:  Execution continues on =
line 798
                   break;
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:798:9: note: 4th function call argume=
nt is an uninitialized value
           return sprintf(buf, "%s %d %d %d\n", res,
                  ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   arch/x86/include/asm/xen/hypercall.h:364:9: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           return _hypercall2(int, xen_version, cmd, arg);
                  ^
   arch/x86/include/asm/xen/hypercall.h:169:2: note: expanded from macro '_=
hypercall2'
           __HYPERCALL_DECLS;                                              \
           ^
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^
   drivers/xen/sys-hypervisor.c:361:8: note: Calling 'HYPERVISOR_xen_versio=
n'
           ret =3D HYPERVISOR_xen_version(XENVER_build_id, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:364:9: note: Assigned value is garb=
age or undefined
           return _hypercall2(int, xen_version, cmd, arg);
                  ^
   arch/x86/include/asm/xen/hypercall.h:169:2: note: expanded from macro '_=
hypercall2'
           __HYPERCALL_DECLS;                                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^                                                        ~~~~~~
   arch/x86/include/asm/xen/hypercall.h:435:9: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           return _hypercall2(int, xenpmu_op, op, arg);
                  ^
   arch/x86/include/asm/xen/hypercall.h:169:2: note: expanded from macro '_=
hypercall2'
           __HYPERCALL_DECLS;                                              \
           ^
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^
   drivers/xen/sys-hypervisor.c:493:8: note: Calling 'HYPERVISOR_xenpmu_op'
           ret =3D HYPERVISOR_xenpmu_op(XENPMU_feature_get, &xp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:435:9: note: Assigned value is garb=
age or undefined
           return _hypercall2(int, xenpmu_op, op, arg);
                  ^
   arch/x86/include/asm/xen/hypercall.h:169:2: note: expanded from macro '_=
hypercall2'
           __HYPERCALL_DECLS;                                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/xen/hypercall.h:113:2: note: expanded from macro '_=
_HYPERCALL_DECLS'
           register unsigned long __arg1 asm(__HYPERCALL_ARG1REG) =3D __arg=
1; \
           ^                                                        ~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/xen/swiotlb-xen.c:206:6: warning: Branch condition evaluates to =
a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!start) {
               ^~~~~~
   drivers/xen/swiotlb-xen.c:165:2: note: 'start' declared without an initi=
al value
           char *start;
           ^~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:170:6: note: Assuming 'nslabs' is not equal to=
 0
           if (!nslabs)
               ^~~~~~~
   drivers/xen/swiotlb-xen.c:170:2: note: Taking false branch
           if (!nslabs)
           ^
   drivers/xen/swiotlb-xen.c:178:6: note: Assuming 'io_tlb_start' is equal =
to 0
           if (io_tlb_start !=3D 0)
               ^~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:178:2: note: Taking false branch
           if (io_tlb_start !=3D 0)
           ^
   drivers/xen/swiotlb-xen.c:184:6: note: Assuming 'early' is false
           if (early) {
               ^~~~~
   drivers/xen/swiotlb-xen.c:184:2: note: Taking false branch
           if (early) {
           ^
   drivers/xen/swiotlb-xen.c:193:10: note: Assuming the condition is false
                   while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:193:3: note: Loop condition is false. Executio=
n continues on line 199
                   while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
                   ^
   drivers/xen/swiotlb-xen.c:199:7: note: Assuming the condition is false
                   if (order !=3D get_order(bytes)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:199:3: note: Taking false branch
                   if (order !=3D get_order(bytes)) {
                   ^
   drivers/xen/swiotlb-xen.c:206:6: note: Branch condition evaluates to a g=
arbage value
           if (!start) {
               ^~~~~~
   include/linux/dma-direct.h:81:6: warning: Access to field 'dma_range_map=
' results in a dereference of a null pointer (loaded from variable 'dev') [=
clang-analyzer-core.NullDereference]
           if (dev->dma_range_map)
               ^
   drivers/xen/swiotlb-xen.c:319:17: note: 32 is not equal to 64
           u64 dma_mask =3D DMA_BIT_MASK(32);
                          ^
   include/linux/dma-mapping.h:76:27: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                             ^~~
   drivers/xen/swiotlb-xen.c:319:17: note: '?' condition is false
           u64 dma_mask =3D DMA_BIT_MASK(32);
                          ^
   include/linux/dma-mapping.h:76:26: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                            ^
   drivers/xen/swiotlb-xen.c:322:6: note: Assuming 'hwdev' is null
           if (hwdev && hwdev->coherent_dma_mask)
               ^~~~~
   drivers/xen/swiotlb-xen.c:322:12: note: Left side of '&&' is false
           if (hwdev && hwdev->coherent_dma_mask)
                     ^
   drivers/xen/swiotlb-xen.c:327:25: note: Passing null pointer value via 1=
st parameter 'dev'
           phys =3D xen_dma_to_phys(hwdev, dev_addr);
                                  ^~~~~
   drivers/xen/swiotlb-xen.c:327:9: note: Calling 'xen_dma_to_phys'
           phys =3D xen_dma_to_phys(hwdev, dev_addr);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:75:42: note: Passing null pointer value via 1s=
t parameter 'dev'
           return xen_bus_to_phys(dev, dma_to_phys(dev, dma_addr));
                                                   ^~~
   drivers/xen/swiotlb-xen.c:75:30: note: Calling 'dma_to_phys'
           return xen_bus_to_phys(dev, dma_to_phys(dev, dma_addr));
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-direct.h:81:6: note: Access to field 'dma_range_map' r=
esults in a dereference of a null pointer (loaded from variable 'dev')
           if (dev->dma_range_map)
               ^~~
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/pinctrl/pinctrl-single.c:1410:3: warning: Value stored to 'mask'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   mask =3D pcs->read(pcswi->reg);
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1410:3: note: Value stored to 'mask' is=
 never read
                   mask =3D pcs->read(pcswi->reg);
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +206 drivers/xen/swiotlb-xen.c

4035b43da6daa51 Christoph Hellwig     2021-03-01  158  =

b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  159  int __ref xen_swiotl=
b_init(int verbose, bool early)
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  160  {
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  161  	unsigned long bytes=
, order;
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  162  	int rc =3D -ENOMEM;
5bab7864b1167f9 Konrad Rzeszutek Wilk 2012-08-23  163  	enum xen_swiotlb_er=
r m_ret =3D XEN_SWIOTLB_UNKNOWN;
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  164  	unsigned int repeat=
 =3D 3;
cbce99527ca7c4e Christoph Hellwig     2021-03-01  165  	char *start;
cbce99527ca7c4e Christoph Hellwig     2021-03-01  166  	unsigned long nslab=
s;
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  167  =

cbce99527ca7c4e Christoph Hellwig     2021-03-01  168  	nslabs =3D swiotlb_=
nr_tbl();
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  169  retry:
cbce99527ca7c4e Christoph Hellwig     2021-03-01  170  	if (!nslabs)
cbce99527ca7c4e Christoph Hellwig     2021-03-01  171  		nslabs =3D DEFAULT=
_NSLABS;
cbce99527ca7c4e Christoph Hellwig     2021-03-01  172  	bytes =3D nslabs <<=
 IO_TLB_SHIFT;
4035b43da6daa51 Christoph Hellwig     2021-03-01  173  	order =3D get_order=
(bytes);
4e7372e0dc5d7d2 Stefano Stabellini    2019-05-28  174  =

4e7372e0dc5d7d2 Stefano Stabellini    2019-05-28  175  	/*
4e7372e0dc5d7d2 Stefano Stabellini    2019-05-28  176  	 * IO TLB memory al=
ready allocated. Just use it.
4e7372e0dc5d7d2 Stefano Stabellini    2019-05-28  177  	 */
cbce99527ca7c4e Christoph Hellwig     2021-03-01  178  	if (io_tlb_start !=
=3D 0)
4e7372e0dc5d7d2 Stefano Stabellini    2019-05-28  179  		goto end;
4e7372e0dc5d7d2 Stefano Stabellini    2019-05-28  180  =

b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  181  	/*
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  182  	 * Get IO TLB memor=
y from any location.
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  183  	 */
8a7f97b902f4fb0 Mike Rapoport         2019-03-11  184  	if (early) {
cbce99527ca7c4e Christoph Hellwig     2021-03-01  185  		start =3D memblock=
_alloc(PAGE_ALIGN(bytes),
15c3c114ed144e5 Mike Rapoport         2018-10-30  186  						  PAGE_SIZE);
cbce99527ca7c4e Christoph Hellwig     2021-03-01  187  		if (!start)
8a7f97b902f4fb0 Mike Rapoport         2019-03-11  188  			panic("%s: Failed=
 to allocate %lu bytes align=3D0x%lx\n",
8a7f97b902f4fb0 Mike Rapoport         2019-03-11  189  			      __func__, P=
AGE_ALIGN(bytes), PAGE_SIZE);
8a7f97b902f4fb0 Mike Rapoport         2019-03-11  190  	} else {
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  191  #define SLABS_PER_PA=
GE (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  192  #define IO_TLB_MIN_S=
LABS ((1<<20) >> IO_TLB_SHIFT)
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  193  		while ((SLABS_PER_=
PAGE << order) > IO_TLB_MIN_SLABS) {
cbce99527ca7c4e Christoph Hellwig     2021-03-01  194  			start =3D (void *=
)xen_get_swiotlb_free_pages(order);
cbce99527ca7c4e Christoph Hellwig     2021-03-01  195  			if (start)
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  196  				break;
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  197  			order--;
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  198  		}
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  199  		if (order !=3D get=
_order(bytes)) {
283c0972d53769e Joe Perches           2013-06-28  200  			pr_warn("Warning:=
 only able to allocate %ld MB for software IO TLB\n",
283c0972d53769e Joe Perches           2013-06-28  201  				(PAGE_SIZE << or=
der) >> 20);
cbce99527ca7c4e Christoph Hellwig     2021-03-01  202  			nslabs =3D SLABS_=
PER_PAGE << order;
cbce99527ca7c4e Christoph Hellwig     2021-03-01  203  			bytes =3D nslabs =
<< IO_TLB_SHIFT;
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  204  		}
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  205  	}
cbce99527ca7c4e Christoph Hellwig     2021-03-01 @206  	if (!start) {
5bab7864b1167f9 Konrad Rzeszutek Wilk 2012-08-23  207  		m_ret =3D XEN_SWIO=
TLB_ENOMEM;
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  208  		goto error;
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  209  	}
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  210  	/*
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  211  	 * And replace that=
 memory with pages under 4GB.
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  212  	 */
cbce99527ca7c4e Christoph Hellwig     2021-03-01  213  	rc =3D xen_swiotlb_=
fixup(start,
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  214  			       bytes,
cbce99527ca7c4e Christoph Hellwig     2021-03-01  215  			       nslabs);
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  216  	if (rc) {
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  217  		if (early)
cbce99527ca7c4e Christoph Hellwig     2021-03-01  218  			memblock_free(__p=
a(start),
2013288f7238878 Mike Rapoport         2018-10-30  219  				      PAGE_ALIGN=
(bytes));
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  220  		else {
cbce99527ca7c4e Christoph Hellwig     2021-03-01  221  			free_pages((unsig=
ned long)start, order);
cbce99527ca7c4e Christoph Hellwig     2021-03-01  222  			start =3D NULL;
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  223  		}
5bab7864b1167f9 Konrad Rzeszutek Wilk 2012-08-23  224  		m_ret =3D XEN_SWIO=
TLB_EFIXUP;
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  225  		goto error;
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  226  	}
c468bdee28a1cb6 Konrad Rzeszutek Wilk 2012-09-17  227  	if (early) {
cbce99527ca7c4e Christoph Hellwig     2021-03-01  228  		if (swiotlb_init_w=
ith_tbl(start, nslabs,
ac2cbab21f318e1 Yinghai Lu            2013-01-24  229  			 verbose))
ac2cbab21f318e1 Yinghai Lu            2013-01-24  230  			panic("Cannot all=
ocate SWIOTLB buffer");
c468bdee28a1cb6 Konrad Rzeszutek Wilk 2012-09-17  231  		rc =3D 0;
c468bdee28a1cb6 Konrad Rzeszutek Wilk 2012-09-17  232  	} else
cbce99527ca7c4e Christoph Hellwig     2021-03-01  233  		rc =3D swiotlb_lat=
e_init_with_tbl(start, nslabs);
7453c549f5f6485 Konrad Rzeszutek Wilk 2016-12-20  234  =

4e7372e0dc5d7d2 Stefano Stabellini    2019-05-28  235  end:
7453c549f5f6485 Konrad Rzeszutek Wilk 2016-12-20  236  	if (!rc)
7453c549f5f6485 Konrad Rzeszutek Wilk 2016-12-20  237  		swiotlb_set_max_se=
gment(PAGE_SIZE);
7453c549f5f6485 Konrad Rzeszutek Wilk 2016-12-20  238  =

b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  239  	return rc;
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  240  error:
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  241  	if (repeat--) {
cbce99527ca7c4e Christoph Hellwig     2021-03-01  242  		nslabs =3D max(102=
4UL, /* Min is 2MB */
cbce99527ca7c4e Christoph Hellwig     2021-03-01  243  					(nslabs >> 1));
283c0972d53769e Joe Perches           2013-06-28  244  		pr_info("Lowering =
to %luMB\n",
cbce99527ca7c4e Christoph Hellwig     2021-03-01  245  			(nslabs << IO_TLB=
_SHIFT) >> 20);
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  246  		goto retry;
f4b2f07b2ed9b46 Konrad Rzeszutek Wilk 2011-07-22  247  	}
283c0972d53769e Joe Perches           2013-06-28  248  	pr_err("%s (rc:%d)\=
n", xen_swiotlb_error(m_ret), rc);
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  249  	if (early)
5bab7864b1167f9 Konrad Rzeszutek Wilk 2012-08-23  250  		panic("%s (rc:%d)"=
, xen_swiotlb_error(m_ret), rc);
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  251  	else
cbce99527ca7c4e Christoph Hellwig     2021-03-01  252  		free_pages((unsign=
ed long)start, order);
b82776005369899 Konrad Rzeszutek Wilk 2012-08-23  253  	return rc;
b097186fd29d5bc Konrad Rzeszutek Wilk 2010-05-11  254  }
dceb1a6819ab2c8 Christoph Hellwig     2017-05-21  255  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7512270607182392864==--

