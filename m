Content-Type: multipart/mixed; boundary="===============3551387168263376026=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/iova.c:192:14: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 24 Apr 2022 12:10:54 +0800
Message-ID: <202204241113.7fF1lSjN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3551387168263376026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Stefano Garzarella <sgarzare@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   22da5264abf497a10a4ed629f07f4ba28a7ed5eb
commit: 4080fc1067501707b9693b8003feae7d50d14e35 vdpa_sim: use iova module =
to allocate IOVA addresses
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20220418 (https://download.01.org/0day-ci/arc=
hive/20220424/202204241113.7fF1lSjN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ef9460=
9d6ebe981767788e6877b0b3b731d425af)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4080fc1067501707b9693b8003feae7d50d14e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4080fc1067501707b9693b8003feae7d50d14e35
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (10 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/target/target_core_configfs.c:1964:5: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:1964:5: note: Value stored to 'ret=
' is never read
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:1978:5: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:1978:5: note: Value stored to 'ret=
' is never read
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2042:5: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2042:5: note: Value stored to 'ret=
' is never read
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   Suppressed 16 warnings (7 in non-user code, 9 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/xfs/xfs_pnfs.c:39:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_pnfs.c:39:3: note: Value stored to 'error' is never read
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/input/serio/apbps2.c:114:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D ioread32be(&priv->regs->data);
                   ^
   drivers/input/serio/apbps2.c:114:3: note: Value stored to 'tmp' is never=
 read
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/iommu/iova.c:192:14: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
                   align_mask <<=3D fls_long(size - 1);
                              ^   ~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:191:2: note: Assuming 'size_aligned' is true
           if (size_aligned)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iommu/iova.c:191:2: note: '?' condition is false
           if (size_aligned)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/iommu/iova.c:191:6: note: 'size_aligned' is true
           if (size_aligned)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/iommu/iova.c:191:2: note: '?' condition is true
           if (size_aligned)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/iommu/iova.c:191:2: note: Taking true branch
           if (size_aligned)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/iommu/iova.c:192:18: note: Calling 'fls_long'
                   align_mask <<=3D fls_long(size - 1);
                                  ^~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:187:2: note: '?' condition is true
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/bitops.h:187:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/bitops.h:188:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0
           if (!x)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/asm-generic/bitops/fls.h:17:2: note: '?' condition is false
           if (!x)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/asm-generic/bitops/fls.h:17:7: note: 'x' is not equal to 0
           if (!x)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +192 drivers/iommu/iova.c

d751751a9f7f2f drivers/iommu/iova.c Marek Szyprowski      2017-02-24  179  =

ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  180  =
static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  181  =
		unsigned long size, unsigned long limit_pfn,
ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  182  =
			struct iova *new, bool size_aligned)
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  183  {
973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  184  =
	struct rb_node *curr, *prev;
973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  185  =
	struct iova *curr_iova;
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  186  =
	unsigned long flags;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  187  =
	unsigned long new_pfn, retry_pfn;
086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21  188  =
	unsigned long align_mask =3D ~0UL;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  189  =
	unsigned long high_pfn =3D limit_pfn, low_pfn =3D iovad->start_pfn;
086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21  190  =

086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21  191  =
	if (size_aligned)
086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21 @192  =
		align_mask <<=3D fls_long(size - 1);
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  193  =

f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  194  =
	/* Walk the tree backwards */
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  195  =
	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  196  =
	if (limit_pfn <=3D iovad->dma_32bit_pfn &&
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  197  =
			size >=3D iovad->max32_alloc_size)
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  198  =
		goto iova32_full;
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  199  =

973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  200  =
	curr =3D __get_cached_rbnode(iovad, limit_pfn);
973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  201  =
	curr_iova =3D rb_entry(curr, struct iova, node);
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  202  =
	retry_pfn =3D curr_iova->pfn_hi + 1;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  203  =

4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  204  =
retry:
973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  205  =
	do {
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  206  =
		high_pfn =3D min(high_pfn, curr_iova->pfn_lo);
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  207  =
		new_pfn =3D (high_pfn - size) & align_mask;
ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  208  =
		prev =3D curr;
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  209  =
		curr =3D rb_prev(curr);
973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  210  =
		curr_iova =3D rb_entry(curr, struct iova, node);
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  211  =
	} while (curr && new_pfn <=3D curr_iova->pfn_hi && new_pfn >=3D low_pfn);
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  212  =

4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  213  =
	if (high_pfn < size || new_pfn < low_pfn) {
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  214  =
		if (low_pfn =3D=3D iovad->start_pfn && retry_pfn < limit_pfn) {
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  215  =
			high_pfn =3D limit_pfn;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  216  =
			low_pfn =3D retry_pfn;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  217  =
			curr =3D &iovad->anchor.node;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  218  =
			curr_iova =3D rb_entry(curr, struct iova, node);
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  219  =
			goto retry;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  220  =
		}
80ef4464d5e274 drivers/iommu/iova.c Robert Richter        2019-03-20  221  =
		iovad->max32_alloc_size =3D size;
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  222  =
		goto iova32_full;
80ef4464d5e274 drivers/iommu/iova.c Robert Richter        2019-03-20  223  =
	}
f76aec76ec7f68 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  224  =

f76aec76ec7f68 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  225  =
	/* pfn_lo will point to size aligned address if size_aligned is set */
086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21  226  =
	new->pfn_lo =3D new_pfn;
f76aec76ec7f68 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  227  =
	new->pfn_hi =3D new->pfn_lo + size - 1;
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  228  =

d751751a9f7f2f drivers/iommu/iova.c Marek Szyprowski      2017-02-24  229  =
	/* If we have 'prev', it's a valid place to start the insertion. */
d751751a9f7f2f drivers/iommu/iova.c Marek Szyprowski      2017-02-24  230  =
	iova_insert_rbtree(&iovad->rbroot, new, prev);
e60aa7b53845a2 drivers/iommu/iova.c Robin Murphy          2017-09-21  231  =
	__cached_rbnode_insert_update(iovad, new);
ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  232  =

f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  233  =
	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  234  =
	return 0;
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  235  =

bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  236  =
iova32_full:
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  237  =
	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  238  =
	return -ENOMEM;
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  239  }
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  240  =


:::::: The code at line 192 was first introduced by commit
:::::: 086c83acb70fc6da044c9ca45c1c9780c64545b0 iommu/iova: Optimise the pa=
dding calculation

:::::: TO: Zhen Lei <thunder.leizhen@huawei.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3551387168263376026==--

