Content-Type: multipart/mixed; boundary="===============6636659290107363781=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 109/375] fs/xfs/libxfs/xfs_bmap_btree.c:658:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 31 Mar 2022 11:38:29 +0800
Message-ID: <202203311107.ysWSKUZQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6636659290107363781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   5194da24d830593d0d817b339de2fc185172f6c8
commit: ae50990ecf51f2c8a39454ef721531d9fb7da4c5 [109/375] xfs: repair inod=
e block maps
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm-randconfig-c002-20220330 (https://download.01.org/0day-ci/archi=
ve/20220331/202203311107.ysWSKUZQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Dae50990ecf51f2c8a39454ef721531d9fb7da4c5
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout ae50990ecf51f2c8a39454ef721531d9fb7da4c5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (unlikely(__ret_warn_on))                                    \
           ^
   net/caif/cfcnfg.c:407:2: note: Loop condition is false.  Exiting loop
           caif_assert(phyinfo->phy_layer !=3D NULL);
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_asse=
rt'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:88:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
                                   ^
   include/asm-generic/bug.h:90:3: note: expanded from macro '__WARN_printf'
                   instrumentation_begin();                                \
                   ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   net/caif/cfcnfg.c:407:2: note: Loop condition is false.  Exiting loop
           caif_assert(phyinfo->phy_layer !=3D NULL);
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_asse=
rt'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:88:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
                                   ^
   include/asm-generic/bug.h:92:3: note: expanded from macro '__WARN_printf'
                   instrumentation_end();                                  \
                   ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   net/caif/cfcnfg.c:407:2: note: Loop condition is false.  Exiting loop
           caif_assert(phyinfo->phy_layer !=3D NULL);
           ^
   include/net/caif/caif_layer.h:31:3: note: expanded from macro 'caif_asse=
rt'
                   WARN_ON(!(assert));                             \
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:88:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
                                   ^
   include/asm-generic/bug.h:89:38: note: expanded from macro '__WARN_print=
f'
   #define __WARN_printf(taint, arg...) do {                               \
                                        ^
   net/caif/cfcnfg.c:407:2: note: Loop condition is false.  Exiting loop
           caif_assert(phyinfo->phy_layer !=3D NULL);
           ^
   include/net/caif/caif_layer.h:27:33: note: expanded from macro 'caif_ass=
ert'
   #define caif_assert(assert)                                     \
                                                                   ^
   net/caif/cfcnfg.c:408:14: note: Access to field 'id' results in a derefe=
rence of a null pointer (loaded from field 'phy_layer')
           caif_assert(phyinfo->phy_layer->id =3D=3D phyid);
                       ^
   include/net/caif/caif_layer.h:29:8: note: expanded from macro 'caif_asse=
rt'
           if (!(assert)) {                                        \
                 ^~~~~~
   1 warning generated.
   fs/xfs/libxfs/xfs_attr.c:1243:2: warning: Value stored to 'error' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr.c:1243:2: note: Value stored to 'error' is never =
read
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
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
   3 warnings generated.
   fs/xfs/libxfs/xfs_bmap.c:800:2: warning: Value stored to 'error' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           error =3D 0;
           ^       ~
   fs/xfs/libxfs/xfs_bmap.c:800:2: note: Value stored to 'error' is never r=
ead
           error =3D 0;
           ^       ~
   fs/xfs/libxfs/xfs_bmap.c:5032:2: warning: Value stored to 'qfield' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           qfield =3D 0;
           ^        ~
   fs/xfs/libxfs/xfs_bmap.c:5032:2: note: Value stored to 'qfield' is never=
 read
           qfield =3D 0;
           ^        ~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> fs/xfs/libxfs/xfs_bmap_btree.c:658:9: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   flags |=3D extflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:644:2: note: Assuming the condition is fa=
lse
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:215:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:644:2: note: '?' condition is true
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:215:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:645:9: note: Assuming 'whichfork' is equa=
l to 2
           ASSERT(whichfork !=3D XFS_COW_FORK);
                  ^
   fs/xfs/xfs_linux.h:215:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_bmap_btree.c:645:2: note: '?' condition is false
           ASSERT(whichfork !=3D XFS_COW_FORK);
           ^
   fs/xfs/xfs_linux.h:215:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:652:8: note: 'whichfork' is not equal to 0
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^~~
   fs/xfs/libxfs/xfs_bmap_btree.c:652:8: note: '?' condition is false
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^
   fs/xfs/libxfs/xfs_bmap_btree.c:652:8: note: 'whichfork' is not equal to 1
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^~~
   fs/xfs/libxfs/xfs_bmap_btree.c:652:8: note: '?' condition is false
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^
   fs/xfs/libxfs/xfs_bmap_btree.c:656:2: note: Control jumps to 'case XFS_D=
INODE_FMT_EXTENTS:'  at line 657
           switch (ifp->if_format) {
           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:658:9: note: Assigned value is garbage or=
 undefined
                   flags |=3D extflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:661:9: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   flags |=3D brootflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:644:2: note: Assuming the condition is fa=
lse
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:215:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:644:2: note: '?' condition is true
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:215:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:645:9: note: Assuming 'whichfork' is equa=
l to 2
           ASSERT(whichfork !=3D XFS_COW_FORK);
                  ^
   fs/xfs/xfs_linux.h:215:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_bmap_btree.c:645:2: note: '?' condition is false
           ASSERT(whichfork !=3D XFS_COW_FORK);

vim +658 fs/xfs/libxfs/xfs_bmap_btree.c

ae50990ecf51f2 Darrick J. Wong 2022-01-06  625  =

ae50990ecf51f2 Darrick J. Wong 2022-01-06  626  /*
ae50990ecf51f2 Darrick J. Wong 2022-01-06  627   * Swap in the new inode fo=
rk root.  Once we pass this point the newly rebuilt
ae50990ecf51f2 Darrick J. Wong 2022-01-06  628   * mappings are in place an=
d we have to kill off any old btree blocks.
ae50990ecf51f2 Darrick J. Wong 2022-01-06  629   */
ae50990ecf51f2 Darrick J. Wong 2022-01-06  630  void
ae50990ecf51f2 Darrick J. Wong 2022-01-06  631  xfs_bmbt_commit_staged_btre=
e(
ae50990ecf51f2 Darrick J. Wong 2022-01-06  632  	struct xfs_btree_cur	*cur,
ae50990ecf51f2 Darrick J. Wong 2022-01-06  633  	struct xfs_trans	*tp,
ae50990ecf51f2 Darrick J. Wong 2022-01-06  634  	int			whichfork)
ae50990ecf51f2 Darrick J. Wong 2022-01-06  635  {
ae50990ecf51f2 Darrick J. Wong 2022-01-06  636  	struct xbtree_ifakeroot	*i=
fake =3D cur->bc_ino.ifake;
ae50990ecf51f2 Darrick J. Wong 2022-01-06  637  	struct xfs_ifork	*ifp;
ae50990ecf51f2 Darrick J. Wong 2022-01-06  638  	static const short	brootfl=
ag[2] =3D
ae50990ecf51f2 Darrick J. Wong 2022-01-06  639  		{ XFS_ILOG_DBROOT, XFS_IL=
OG_ABROOT };
ae50990ecf51f2 Darrick J. Wong 2022-01-06  640  	static const short	extflag=
[2] =3D
ae50990ecf51f2 Darrick J. Wong 2022-01-06  641  		{ XFS_ILOG_DEXT, XFS_ILOG=
_AEXT };
ae50990ecf51f2 Darrick J. Wong 2022-01-06  642  	int			flags =3D XFS_ILOG_C=
ORE;
ae50990ecf51f2 Darrick J. Wong 2022-01-06  643  =

ae50990ecf51f2 Darrick J. Wong 2022-01-06  644  	ASSERT(cur->bc_flags & XFS=
_BTREE_STAGING);
ae50990ecf51f2 Darrick J. Wong 2022-01-06  645  	ASSERT(whichfork !=3D XFS_=
COW_FORK);
ae50990ecf51f2 Darrick J. Wong 2022-01-06  646  =

ae50990ecf51f2 Darrick J. Wong 2022-01-06  647  	/*
ae50990ecf51f2 Darrick J. Wong 2022-01-06  648  	 * Free any resources hang=
ing off the real fork, then shallow-copy the
ae50990ecf51f2 Darrick J. Wong 2022-01-06  649  	 * staging fork's contents=
 into the real fork to transfer everything
ae50990ecf51f2 Darrick J. Wong 2022-01-06  650  	 * we just built.
ae50990ecf51f2 Darrick J. Wong 2022-01-06  651  	 */
ae50990ecf51f2 Darrick J. Wong 2022-01-06  652  	ifp =3D XFS_IFORK_PTR(cur-=
>bc_ino.ip, whichfork);
ae50990ecf51f2 Darrick J. Wong 2022-01-06  653  	xfs_idestroy_fork(ifp);
ae50990ecf51f2 Darrick J. Wong 2022-01-06  654  	memcpy(ifp, ifake->if_fork=
, sizeof(struct xfs_ifork));
ae50990ecf51f2 Darrick J. Wong 2022-01-06  655  =

ae50990ecf51f2 Darrick J. Wong 2022-01-06  656  	switch (ifp->if_format) {
ae50990ecf51f2 Darrick J. Wong 2022-01-06  657  	case XFS_DINODE_FMT_EXTENT=
S:
ae50990ecf51f2 Darrick J. Wong 2022-01-06 @658  		flags |=3D extflag[whichf=
ork];
ae50990ecf51f2 Darrick J. Wong 2022-01-06  659  		break;
ae50990ecf51f2 Darrick J. Wong 2022-01-06  660  	case XFS_DINODE_FMT_BTREE:
ae50990ecf51f2 Darrick J. Wong 2022-01-06  661  		flags |=3D brootflag[whic=
hfork];
ae50990ecf51f2 Darrick J. Wong 2022-01-06  662  		break;
ae50990ecf51f2 Darrick J. Wong 2022-01-06  663  	default:
ae50990ecf51f2 Darrick J. Wong 2022-01-06  664  		ASSERT(0);
ae50990ecf51f2 Darrick J. Wong 2022-01-06  665  		break;
ae50990ecf51f2 Darrick J. Wong 2022-01-06  666  	}
ae50990ecf51f2 Darrick J. Wong 2022-01-06  667  	xfs_trans_log_inode(tp, cu=
r->bc_ino.ip, flags);
ae50990ecf51f2 Darrick J. Wong 2022-01-06  668  	xfs_btree_commit_ifakeroot=
(cur, tp, whichfork, &xfs_bmbt_ops);
ae50990ecf51f2 Darrick J. Wong 2022-01-06  669  }
ae50990ecf51f2 Darrick J. Wong 2022-01-06  670  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6636659290107363781==--

