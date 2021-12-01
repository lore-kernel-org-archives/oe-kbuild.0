Content-Type: multipart/mixed; boundary="===============2179187194994624750=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/iova.c:247:14: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 02 Dec 2021 05:22:30 +0800
Message-ID: <202112020519.JY1wbUxV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2179187194994624750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xie Yongji <xieyongji@bytedance.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: c8a6153b6c59d95c0e091f053f6f180952ade91e vduse: Introduce VDUSE - v=
DPA Device in Userspace
date:   3 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20211001 (https://download.01.org/0day-ci/archi=
ve/20211202/202112020519.JY1wbUxV-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 962e50=
3cc8bc411f7523cc393acae8aae425b1c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc8a6153b6c59d95c0e091f053f6f180952ade91e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c8a6153b6c59d95c0e091f053f6f180952ade91e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/rtc/rtc-m41t80.c:485:3: note: The value -16 is assigned to 'val'
                   val =3D 15 - ilog2(rate);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-m41t80.c:488:6: note: Assuming 'reg' is >=3D 0
           if (reg < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/rtc/rtc-m41t80.c:488:2: note: '?' condition is false
           if (reg < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/rtc/rtc-m41t80.c:488:6: note: 'reg' is >=3D 0
           if (reg < 0)
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
   drivers/rtc/rtc-m41t80.c:488:2: note: '?' condition is false
           if (reg < 0)
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
   drivers/rtc/rtc-m41t80.c:488:2: note: Taking false branch
           if (reg < 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/rtc/rtc-m41t80.c:491:28: note: The result of the left shift is u=
ndefined because the left operand is negative
           reg =3D (reg & 0x0f) | (val << 4);
                                 ~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/iommu/iova.c:247:14: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
                   align_mask <<=3D fls_long(size - 1);
                              ^
   drivers/iommu/iova.c:503:2: note: '?' condition is false
           if (iova_pfn)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/iommu/iova.c:503:6: note: 'iova_pfn' is 0
           if (iova_pfn)
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
   drivers/iommu/iova.c:503:2: note: '?' condition is false
           if (iova_pfn)
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
   drivers/iommu/iova.c:503:2: note: Taking false branch
           if (iova_pfn)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/iommu/iova.c:507:13: note: Calling 'alloc_iova'
           new_iova =3D alloc_iova(iovad, size, limit_pfn, true);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:379:6: note: Assuming 'new_iova' is non-null
           if (!new_iova)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iommu/iova.c:379:2: note: '?' condition is false
           if (!new_iova)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/iommu/iova.c:379:7: note: 'new_iova' is non-null
           if (!new_iova)
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
   drivers/iommu/iova.c:379:2: note: '?' condition is false
           if (!new_iova)
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
   drivers/iommu/iova.c:379:2: note: Taking false branch
           if (!new_iova)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/iommu/iova.c:382:8: note: Calling '__alloc_and_insert_iova_range'
           ret =3D __alloc_and_insert_iova_range(iovad, size, limit_pfn + 1,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iova.c:246:2: note: '?' condition is false
           if (size_aligned)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +247 drivers/iommu/iova.c

d751751a9f7f2f drivers/iommu/iova.c Marek Szyprowski      2017-02-24  234  =

ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  235  =
static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  236  =
		unsigned long size, unsigned long limit_pfn,
ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  237  =
			struct iova *new, bool size_aligned)
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  238  {
973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  239  =
	struct rb_node *curr, *prev;
973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  240  =
	struct iova *curr_iova;
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  241  =
	unsigned long flags;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  242  =
	unsigned long new_pfn, retry_pfn;
086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21  243  =
	unsigned long align_mask =3D ~0UL;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  244  =
	unsigned long high_pfn =3D limit_pfn, low_pfn =3D iovad->start_pfn;
086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21  245  =

086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21  246  =
	if (size_aligned)
086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21 @247  =
		align_mask <<=3D fls_long(size - 1);
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  248  =

f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  249  =
	/* Walk the tree backwards */
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  250  =
	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  251  =
	if (limit_pfn <=3D iovad->dma_32bit_pfn &&
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  252  =
			size >=3D iovad->max32_alloc_size)
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  253  =
		goto iova32_full;
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  254  =

973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  255  =
	curr =3D __get_cached_rbnode(iovad, limit_pfn);
7ae31cec5b70e3 drivers/iommu/iova.c Robin Murphy          2021-03-05  256  =
	curr_iova =3D to_iova(curr);
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  257  =
	retry_pfn =3D curr_iova->pfn_hi + 1;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  258  =

4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  259  =
retry:
973f5fbedb0721 drivers/iommu/iova.c Robin Murphy          2017-09-21  260  =
	do {
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  261  =
		high_pfn =3D min(high_pfn, curr_iova->pfn_lo);
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  262  =
		new_pfn =3D (high_pfn - size) & align_mask;
ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  263  =
		prev =3D curr;
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  264  =
		curr =3D rb_prev(curr);
7ae31cec5b70e3 drivers/iommu/iova.c Robin Murphy          2021-03-05  265  =
		curr_iova =3D to_iova(curr);
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  266  =
	} while (curr && new_pfn <=3D curr_iova->pfn_hi && new_pfn >=3D low_pfn);
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  267  =

4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  268  =
	if (high_pfn < size || new_pfn < low_pfn) {
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  269  =
		if (low_pfn =3D=3D iovad->start_pfn && retry_pfn < limit_pfn) {
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  270  =
			high_pfn =3D limit_pfn;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  271  =
			low_pfn =3D retry_pfn;
371d7955e3102f drivers/iommu/iova.c Robin Murphy          2021-03-05  272  =
			curr =3D iova_find_limit(iovad, limit_pfn);
7ae31cec5b70e3 drivers/iommu/iova.c Robin Murphy          2021-03-05  273  =
			curr_iova =3D to_iova(curr);
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  274  =
			goto retry;
4e89dce725213d drivers/iommu/iova.c Vijayanand Jitta      2020-09-30  275  =
		}
80ef4464d5e274 drivers/iommu/iova.c Robert Richter        2019-03-20  276  =
		iovad->max32_alloc_size =3D size;
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  277  =
		goto iova32_full;
80ef4464d5e274 drivers/iommu/iova.c Robert Richter        2019-03-20  278  =
	}
f76aec76ec7f68 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  279  =

f76aec76ec7f68 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  280  =
	/* pfn_lo will point to size aligned address if size_aligned is set */
086c83acb70fc6 drivers/iommu/iova.c Zhen Lei              2017-09-21  281  =
	new->pfn_lo =3D new_pfn;
f76aec76ec7f68 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  282  =
	new->pfn_hi =3D new->pfn_lo + size - 1;
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  283  =

d751751a9f7f2f drivers/iommu/iova.c Marek Szyprowski      2017-02-24  284  =
	/* If we have 'prev', it's a valid place to start the insertion. */
d751751a9f7f2f drivers/iommu/iova.c Marek Szyprowski      2017-02-24  285  =
	iova_insert_rbtree(&iovad->rbroot, new, prev);
e60aa7b53845a2 drivers/iommu/iova.c Robin Murphy          2017-09-21  286  =
	__cached_rbnode_insert_update(iovad, new);
ddf02886cbe665 drivers/pci/iova.c   mark gross            2008-03-04  287  =

f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  288  =
	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  289  =
	return 0;
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  290  =

bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  291  =
iova32_full:
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  292  =
	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
bee60e94a1e20e drivers/iommu/iova.c Ganapatrao Kulkarni   2018-09-05  293  =
	return -ENOMEM;
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  294  }
f8de50eb6b0855 drivers/pci/iova.c   Keshavamurthy, Anil S 2007-10-21  295  =


:::::: The code at line 247 was first introduced by commit
:::::: 086c83acb70fc6da044c9ca45c1c9780c64545b0 iommu/iova: Optimise the pa=
dding calculation

:::::: TO: Zhen Lei <thunder.leizhen@huawei.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2179187194994624750==--

