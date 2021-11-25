Content-Type: multipart/mixed; boundary="===============6177218013159236603=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:log-recovery-defer-capture 45/87] fs/xfs/libxfs/xfs_bmap_btree.c:646:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Fri, 26 Nov 2021 02:44:28 +0800
Message-ID: <202111260249.1FeI4KCG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6177218013159236603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t log-recovery-defer-capture
head:   a9ba97129f384fff0a4ac1ff3e2c4b455ea77c88
commit: ebbf385a912f3d1e5c13d7e33101e8aefb300f15 [45/87] xfs: repair inode =
block maps
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20211031 (https://download.01.org/0day-ci/archi=
ve/20211126/202111260249.1FeI4KCG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d32154=
8c3ce987f4f21350ba1c81fdb5d4354224)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Debbf385a912f3d1e5c13d7e33101e8aefb300f15
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs log-recovery-defer-capture
        git checkout ebbf385a912f3d1e5c13d7e33101e8aefb300f15
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/media/tuners/xc5000.c:37:2: note: expanded from macro 'dprintk'
           printk(KERN_INFO "%s: " fmt, "xc5000", ## arg)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/tuners/xc5000.c:674:54: note: The left operand of '/' is a=
 garbage value
           dprintk(1, "*** Total gain =3D %d.%d dB\n", totalgain / 256,
                                                               ^
   drivers/media/tuners/xc5000.c:37:44: note: expanded from macro 'dprintk'
           printk(KERN_INFO "%s: " fmt, "xc5000", ## arg)
                                                     ^~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 17 warnings (17 in non-user code).
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
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mtd/devices/phram.c:231:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:231:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:315:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(phram_paramline, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:315:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(phram_paramline, val);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/mtd/devices/block2mtd.c:395:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/block2mtd.c:395:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(str, val);
           ^~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   fs/xfs/libxfs/xfs_attr_leaf.c:2253:29: warning: Value stored to 'drop_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2253:29: note: Value stored to 'drop_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2254:29: warning: Value stored to 'save_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2254:29: note: Value stored to 'save_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   fs/xfs/libxfs/xfs_bmap.c:850:2: warning: Value stored to 'error' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           error =3D 0;
           ^       ~
   fs/xfs/libxfs/xfs_bmap.c:850:2: note: Value stored to 'error' is never r=
ead
           error =3D 0;
           ^       ~
   fs/xfs/libxfs/xfs_bmap.c:5082:2: warning: Value stored to 'qfield' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           qfield =3D 0;
           ^        ~
   fs/xfs/libxfs/xfs_bmap.c:5082:2: note: Value stored to 'qfield' is never=
 read
           qfield =3D 0;
           ^        ~
   Suppressed 19 warnings (18 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> fs/xfs/libxfs/xfs_bmap_btree.c:646:9: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   flags |=3D extflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:632:2: note: Assuming the condition is fa=
lse
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:632:2: note: '?' condition is true
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:633:9: note: Assuming 'whichfork' is equa=
l to 2
           ASSERT(whichfork !=3D XFS_COW_FORK);
                  ^
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_bmap_btree.c:633:2: note: '?' condition is false
           ASSERT(whichfork !=3D XFS_COW_FORK);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:640:8: note: 'whichfork' is not equal to 0
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^~~
   fs/xfs/libxfs/xfs_bmap_btree.c:640:8: note: '?' condition is false
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^
   fs/xfs/libxfs/xfs_bmap_btree.c:640:8: note: 'whichfork' is not equal to 1
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^~~
   fs/xfs/libxfs/xfs_bmap_btree.c:640:8: note: '?' condition is false
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^
   fs/xfs/libxfs/xfs_bmap_btree.c:644:2: note: Control jumps to 'case XFS_D=
INODE_FMT_EXTENTS:'  at line 645
           switch (ifp->if_format) {
           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:646:9: note: Assigned value is garbage or=
 undefined
                   flags |=3D extflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:649:9: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   flags |=3D brootflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:632:2: note: Assuming the condition is fa=
lse
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:632:2: note: '?' condition is true
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:633:9: note: Assuming 'whichfork' is equa=
l to 2
           ASSERT(whichfork !=3D XFS_COW_FORK);
                  ^
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_bmap_btree.c:633:2: note: '?' condition is false
           ASSERT(whichfork !=3D XFS_COW_FORK);

vim +646 fs/xfs/libxfs/xfs_bmap_btree.c

ebbf385a912f3d Darrick J. Wong 2021-09-01  613  =

ebbf385a912f3d Darrick J. Wong 2021-09-01  614  /*
ebbf385a912f3d Darrick J. Wong 2021-09-01  615   * Swap in the new inode fo=
rk root.  Once we pass this point the newly rebuilt
ebbf385a912f3d Darrick J. Wong 2021-09-01  616   * mappings are in place an=
d we have to kill off any old btree blocks.
ebbf385a912f3d Darrick J. Wong 2021-09-01  617   */
ebbf385a912f3d Darrick J. Wong 2021-09-01  618  void
ebbf385a912f3d Darrick J. Wong 2021-09-01  619  xfs_bmbt_commit_staged_btre=
e(
ebbf385a912f3d Darrick J. Wong 2021-09-01  620  	struct xfs_btree_cur	*cur,
ebbf385a912f3d Darrick J. Wong 2021-09-01  621  	struct xfs_trans	*tp,
ebbf385a912f3d Darrick J. Wong 2021-09-01  622  	int			whichfork)
ebbf385a912f3d Darrick J. Wong 2021-09-01  623  {
ebbf385a912f3d Darrick J. Wong 2021-09-01  624  	struct xbtree_ifakeroot	*i=
fake =3D cur->bc_ino.ifake;
ebbf385a912f3d Darrick J. Wong 2021-09-01  625  	struct xfs_ifork	*ifp;
ebbf385a912f3d Darrick J. Wong 2021-09-01  626  	static const short	brootfl=
ag[2] =3D
ebbf385a912f3d Darrick J. Wong 2021-09-01  627  		{ XFS_ILOG_DBROOT, XFS_IL=
OG_ABROOT };
ebbf385a912f3d Darrick J. Wong 2021-09-01  628  	static const short	extflag=
[2] =3D
ebbf385a912f3d Darrick J. Wong 2021-09-01  629  		{ XFS_ILOG_DEXT, XFS_ILOG=
_AEXT };
ebbf385a912f3d Darrick J. Wong 2021-09-01  630  	int			flags =3D XFS_ILOG_C=
ORE;
ebbf385a912f3d Darrick J. Wong 2021-09-01  631  =

ebbf385a912f3d Darrick J. Wong 2021-09-01  632  	ASSERT(cur->bc_flags & XFS=
_BTREE_STAGING);
ebbf385a912f3d Darrick J. Wong 2021-09-01  633  	ASSERT(whichfork !=3D XFS_=
COW_FORK);
ebbf385a912f3d Darrick J. Wong 2021-09-01  634  =

ebbf385a912f3d Darrick J. Wong 2021-09-01  635  	/*
ebbf385a912f3d Darrick J. Wong 2021-09-01  636  	 * Free any resources hang=
ing off the real fork, then shallow-copy the
ebbf385a912f3d Darrick J. Wong 2021-09-01  637  	 * staging fork's contents=
 into the real fork to transfer everything
ebbf385a912f3d Darrick J. Wong 2021-09-01  638  	 * we just built.
ebbf385a912f3d Darrick J. Wong 2021-09-01  639  	 */
ebbf385a912f3d Darrick J. Wong 2021-09-01  640  	ifp =3D XFS_IFORK_PTR(cur-=
>bc_ino.ip, whichfork);
ebbf385a912f3d Darrick J. Wong 2021-09-01  641  	xfs_idestroy_fork(ifp);
ebbf385a912f3d Darrick J. Wong 2021-09-01  642  	memcpy(ifp, ifake->if_fork=
, sizeof(struct xfs_ifork));
ebbf385a912f3d Darrick J. Wong 2021-09-01  643  =

ebbf385a912f3d Darrick J. Wong 2021-09-01  644  	switch (ifp->if_format) {
ebbf385a912f3d Darrick J. Wong 2021-09-01  645  	case XFS_DINODE_FMT_EXTENT=
S:
ebbf385a912f3d Darrick J. Wong 2021-09-01 @646  		flags |=3D extflag[whichf=
ork];
ebbf385a912f3d Darrick J. Wong 2021-09-01  647  		break;
ebbf385a912f3d Darrick J. Wong 2021-09-01  648  	case XFS_DINODE_FMT_BTREE:
ebbf385a912f3d Darrick J. Wong 2021-09-01  649  		flags |=3D brootflag[whic=
hfork];
ebbf385a912f3d Darrick J. Wong 2021-09-01  650  		break;
ebbf385a912f3d Darrick J. Wong 2021-09-01  651  	default:
ebbf385a912f3d Darrick J. Wong 2021-09-01  652  		ASSERT(0);
ebbf385a912f3d Darrick J. Wong 2021-09-01  653  		break;
ebbf385a912f3d Darrick J. Wong 2021-09-01  654  	}
ebbf385a912f3d Darrick J. Wong 2021-09-01  655  	xfs_trans_log_inode(tp, cu=
r->bc_ino.ip, flags);
ebbf385a912f3d Darrick J. Wong 2021-09-01  656  	xfs_btree_commit_ifakeroot=
(cur, tp, whichfork, &xfs_bmbt_ops);
ebbf385a912f3d Darrick J. Wong 2021-09-01  657  }
ebbf385a912f3d Darrick J. Wong 2021-09-01  658  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6177218013159236603==--

