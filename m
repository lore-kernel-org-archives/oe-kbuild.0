Content-Type: multipart/mixed; boundary="===============0790955447105921001=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/xen/swiotlb-xen.c:193:3: warning: Value stored to 'bytes' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 30 Dec 2021 14:43:32 +0800
Message-ID: <202112301431.Lj1UMdYl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0790955447105921001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eec4df26e24e978e49ccf9bcf49ca0f2ccdaeffe
commit: 4c092c59015f7adf0f07685f869edb96d997a756 swiotlb-xen: fix late init=
 retry
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20211228 (https://download.01.org/0day-ci/archi=
ve/20211230/202112301431.Lj1UMdYl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af=
744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4c092c59015f7adf0f07685f869edb96d997a756
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4c092c59015f7adf0f07685f869edb96d997a756
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   __clear_bit(nr, addr);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:29:5: note: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage
           *p &=3D ~mask;
           ~~ ^
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/pinctrl/pinctrl-axp209.c:204:22: warning: Value stored to 'pctl'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct axp20x_pctl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
                               ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-axp209.c:204:22: note: Value stored to 'pctl' du=
ring its initialization is never read
           struct axp20x_pctl *pctl =3D pinctrl_dev_get_drvdata(pctldev);
                               ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   fs/xfs/libxfs/xfs_rtbitmap.c:349:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:349:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:394:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:394:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:847:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:847:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:893:8: warning: Although the value stored t=
o 'bufp' is used in the enclosing expression, the value is never actually r=
ead from 'bufp' [clang-analyzer-deadcode.DeadStores]
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   fs/xfs/libxfs/xfs_rtbitmap.c:893:8: note: Although the value stored to '=
bufp' is used in the enclosing expression, the value is never actually read=
 from 'bufp'
                           b =3D bufp =3D bp->b_addr;
                               ^      ~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/xen/swiotlb-xen.c:187:6: warning: Branch condition evaluates to =
a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!start)
               ^~~~~~
   drivers/xen/swiotlb-xen.c:165:2: note: 'start' declared without an initi=
al value
           char *start;
           ^~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:167:6: note: Assuming 'io_tlb_default_mem' is =
equal to NULL
           if (io_tlb_default_mem !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:167:2: note: Taking false branch
           if (io_tlb_default_mem !=3D NULL) {
           ^
   drivers/xen/swiotlb-xen.c:181:2: note: Loop condition is false. Executio=
n continues on line 187
           while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
           ^
   drivers/xen/swiotlb-xen.c:187:6: note: Branch condition evaluates to a g=
arbage value
           if (!start)
               ^~~~~~
>> drivers/xen/swiotlb-xen.c:193:3: warning: Value stored to 'bytes' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   bytes =3D nslabs << IO_TLB_SHIFT;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:193:3: note: Value stored to 'bytes' is never =
read
                   bytes =3D nslabs << IO_TLB_SHIFT;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/xen/privcmd.c:94:2: warning: Assigned value is garbage or undefi=
ned [clang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(p, n, pages, lru)
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^
   drivers/xen/privcmd.c:841:2: note: Control jumps to 'case 806914:'  at l=
ine 846
           switch (cmd) {
           ^
   drivers/xen/privcmd.c:847:9: note: Calling 'privcmd_ioctl_mmap'
                   ret =3D privcmd_ioctl_mmap(file, udata);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:261:6: note: Assuming the condition is false
           if (xen_feature(XENFEAT_auto_translated_physmap))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:261:2: note: Taking false branch
           if (xen_feature(XENFEAT_auto_translated_physmap))
           ^
   drivers/xen/privcmd.c:264:2: note: Taking false branch
           if (copy_from_user(&mmapcmd, udata, sizeof(mmapcmd)))
           ^
   drivers/xen/privcmd.c:268:6: note: Assuming field 'domid' is equal to DO=
MID_INVALID
           if (data->domid !=3D DOMID_INVALID && data->domid !=3D mmapcmd.d=
om)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:268:35: note: Left side of '&&' is false
           if (data->domid !=3D DOMID_INVALID && data->domid !=3D mmapcmd.d=
om)
                                            ^
   drivers/xen/privcmd.c:271:7: note: Calling 'gather_array'
           rc =3D gather_array(&pagelist,
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:114:2: note: Taking false branch
           if (size > PAGE_SIZE)
           ^
   drivers/xen/privcmd.c:119:2: note: Loop condition is false. Execution co=
ntinues on line 141
           while (nelem--) {
           ^
   drivers/xen/privcmd.c:271:7: note: Returning from 'gather_array'
           rc =3D gather_array(&pagelist,
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:275:6: note: 'rc' is 0
           if (rc || list_empty(&pagelist))
               ^~
   drivers/xen/privcmd.c:275:6: note: Left side of '||' is false
   drivers/xen/privcmd.c:275:2: note: Taking true branch
           if (rc || list_empty(&pagelist))
           ^
   drivers/xen/privcmd.c:276:3: note: Control jumps to line 306
                   goto out;
                   ^
   drivers/xen/privcmd.c:306:2: note: Calling 'free_page_list'
           free_page_list(&pagelist);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/privcmd.c:94:2: note: Left side of '&&' is false
           list_for_each_entry_safe(p, n, pages, lru)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/xen/privcmd.c:94:2: note: Taking false branch
           list_for_each_entry_safe(p, n, pages, lru)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^

vim +/bytes +193 drivers/xen/swiotlb-xen.c

4035b43da6daa5 Christoph Hellwig     2021-03-01  157  =

a98f565462f0fc Christoph Hellwig     2021-03-01  158  int __ref xen_swiotlb=
_init(void)
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  159  {
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  160  	enum xen_swiotlb_err=
 m_ret =3D XEN_SWIOTLB_UNKNOWN;
2d29960af0bee8 Christoph Hellwig     2021-03-18  161  	unsigned long bytes =
=3D swiotlb_size_or_default();
2d29960af0bee8 Christoph Hellwig     2021-03-18  162  	unsigned long nslabs=
 =3D bytes >> IO_TLB_SHIFT;
2d29960af0bee8 Christoph Hellwig     2021-03-18  163  	unsigned int order, =
repeat =3D 3;
a98f565462f0fc Christoph Hellwig     2021-03-01  164  	int rc =3D -ENOMEM;
cbce99527ca7c4 Christoph Hellwig     2021-03-01  165  	char *start;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  166  =

97729b653de52b Stefano Stabellini    2021-05-12  167  	if (io_tlb_default_m=
em !=3D NULL) {
97729b653de52b Stefano Stabellini    2021-05-12  168  		pr_warn("swiotlb bu=
ffer already initialized\n");
97729b653de52b Stefano Stabellini    2021-05-12  169  		return -EEXIST;
97729b653de52b Stefano Stabellini    2021-05-12  170  	}
97729b653de52b Stefano Stabellini    2021-05-12  171  =

a98f565462f0fc Christoph Hellwig     2021-03-01  172  retry:
a98f565462f0fc Christoph Hellwig     2021-03-01  173  	m_ret =3D XEN_SWIOTL=
B_ENOMEM;
4035b43da6daa5 Christoph Hellwig     2021-03-01  174  	order =3D get_order(=
bytes);
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  175  =

b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  176  	/*
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  177  	 * Get IO TLB memory=
 from any location.
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  178  	 */
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  179  #define SLABS_PER_PAG=
E (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  180  #define IO_TLB_MIN_SL=
ABS ((1<<20) >> IO_TLB_SHIFT)
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  181  	while ((SLABS_PER_PA=
GE << order) > IO_TLB_MIN_SLABS) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  182  		start =3D (void *)x=
en_get_swiotlb_free_pages(order);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  183  		if (start)
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  184  			break;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  185  		order--;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  186  	}
a98f565462f0fc Christoph Hellwig     2021-03-01  187  	if (!start)
a98f565462f0fc Christoph Hellwig     2021-03-01  188  		goto error;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  189  	if (order !=3D get_o=
rder(bytes)) {
283c0972d53769 Joe Perches           2013-06-28  190  		pr_warn("Warning: o=
nly able to allocate %ld MB for software IO TLB\n",
283c0972d53769 Joe Perches           2013-06-28  191  			(PAGE_SIZE << orde=
r) >> 20);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  192  		nslabs =3D SLABS_PE=
R_PAGE << order;
cbce99527ca7c4 Christoph Hellwig     2021-03-01 @193  		bytes =3D nslabs <<=
 IO_TLB_SHIFT;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  194  	}
a98f565462f0fc Christoph Hellwig     2021-03-01  195  =

b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  196  	/*
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  197  	 * And replace that =
memory with pages under 4GB.
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  198  	 */
6bcd4ea717f3d2 Christoph Hellwig     2021-03-01  199  	rc =3D xen_swiotlb_f=
ixup(start, nslabs);
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  200  	if (rc) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  201  		free_pages((unsigne=
d long)start, order);
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  202  		m_ret =3D XEN_SWIOT=
LB_EFIXUP;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  203  		goto error;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  204  	}
cbce99527ca7c4 Christoph Hellwig     2021-03-01  205  	rc =3D swiotlb_late_=
init_with_tbl(start, nslabs);
a98f565462f0fc Christoph Hellwig     2021-03-01  206  	if (rc)
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  207  		return rc;
a98f565462f0fc Christoph Hellwig     2021-03-01  208  	swiotlb_set_max_segm=
ent(PAGE_SIZE);
a98f565462f0fc Christoph Hellwig     2021-03-01  209  	return 0;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  210  error:
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  211  	if (repeat--) {
a98f565462f0fc Christoph Hellwig     2021-03-01  212  		/* Min is 2MB */
a98f565462f0fc Christoph Hellwig     2021-03-01  213  		nslabs =3D max(1024=
UL, (nslabs >> 1));
4c092c59015f7a Jan Beulich           2021-09-07  214  		bytes =3D nslabs <<=
 IO_TLB_SHIFT;
4c092c59015f7a Jan Beulich           2021-09-07  215  		pr_info("Lowering t=
o %luMB\n", bytes >> 20);
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  216  		goto retry;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  217  	}
283c0972d53769 Joe Perches           2013-06-28  218  	pr_err("%s (rc:%d)\n=
", xen_swiotlb_error(m_ret), rc);
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  219  	return rc;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  220  }
dceb1a6819ab2c Christoph Hellwig     2017-05-21  221  =


:::::: The code at line 193 was first introduced by commit
:::::: cbce99527ca7c4e98db9890651d5e9dfc2fb89ac xen-swiotlb: remove xen_io_=
tlb_start and xen_io_tlb_nslabs

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0790955447105921001==--

