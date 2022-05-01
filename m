Content-Type: multipart/mixed; boundary="===============0309706281160760089=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 132/399] fs/xfs/libxfs/xfs_bmap_btree.c:674:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 01 May 2022 09:47:41 +0800
Message-ID: <202205010934.Hulk27CT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0309706281160760089==
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
head:   afeb4fa123e9a46cb653baab2baa3259c051f7d7
commit: a6f406ba1589679d5d44ce883a3ff26c0635decd [132/399] xfs: repair inod=
e block maps
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm-randconfig-c002-20220428 (https://download.01.org/0day-ci/archi=
ve/20220501/202205010934.Hulk27CT-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Da6f406ba1589679d5d44ce883a3ff26c0635decd
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout a6f406ba1589679d5d44ce883a3ff26c0635decd
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2776:4: note:  Execution contin=
ues on line 2785
                           break;
                           ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2785:6: note: 'state_index' is =
equal to 0
           if (state_index =3D=3D 0) {
               ^~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2785:2: note: Taking true branch
           if (state_index =3D=3D 0) {
           ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2786:26: note: Calling 'kzalloc'
                   rdev->pm.power_state =3D kzalloc(sizeof(struct radeon_po=
wer_state), GFP_KERNEL);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:2: note: Returning pointer
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2786:26: note: Returning from '=
kzalloc'
                   rdev->pm.power_state =3D kzalloc(sizeof(struct radeon_po=
wer_state), GFP_KERNEL);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2786:3: note: Value assigned to=
 field 'power_state'
                   rdev->pm.power_state =3D kzalloc(sizeof(struct radeon_po=
wer_state), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2787:7: note: Assuming field 'p=
ower_state' is null
                   if (rdev->pm.power_state) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2787:3: note: Taking false bran=
ch
                   if (rdev->pm.power_state) {
                   ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2814:6: note: Assuming field 'd=
efault_power_state_index' is >=3D 0
           if (rdev->pm.default_power_state_index >=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2814:2: note: Taking true branch
           if (rdev->pm.default_power_state_index >=3D 0)
           ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2816:4: note: Dereference of nu=
ll pointer
                           rdev->pm.power_state[rdev->pm.default_power_stat=
e_index].clock_info[0].voltage.voltage;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/xfs/libxfs/xfs_attr.c:1243:2: warning: Value stored to 'error' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr.c:1243:2: note: Value stored to 'error' is never =
read
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
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
   8 warnings generated.
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
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> fs/xfs/libxfs/xfs_bmap_btree.c:674:9: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   flags |=3D extflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:660:2: note: Assuming the condition is fa=
lse
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:213:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:660:2: note: '?' condition is true
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:213:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:661:9: note: Assuming 'whichfork' is equa=
l to 2
           ASSERT(whichfork !=3D XFS_COW_FORK);
                  ^
   fs/xfs/xfs_linux.h:213:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/xfs/libxfs/xfs_bmap_btree.c:661:2: note: '?' condition is false
           ASSERT(whichfork !=3D XFS_COW_FORK);
           ^
   fs/xfs/xfs_linux.h:213:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:668:8: note: 'whichfork' is not equal to 0
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^~~
   fs/xfs/libxfs/xfs_bmap_btree.c:668:8: note: '?' condition is false
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^
   fs/xfs/libxfs/xfs_bmap_btree.c:668:8: note: 'whichfork' is not equal to 1
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^~~
   fs/xfs/libxfs/xfs_bmap_btree.c:668:8: note: '?' condition is false
           ifp =3D XFS_IFORK_PTR(cur->bc_ino.ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^
   fs/xfs/libxfs/xfs_bmap_btree.c:672:2: note: Control jumps to 'case XFS_D=
INODE_FMT_EXTENTS:'  at line 673
           switch (ifp->if_format) {
           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:674:9: note: Assigned value is garbage or=
 undefined
                   flags |=3D extflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:677:9: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   flags |=3D brootflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:660:2: note: Assuming the condition is fa=
lse
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:213:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:660:2: note: '?' condition is true
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:213:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   fs/xfs/libxfs/xfs_bmap_btree.c:661:9: note: Assuming 'whichfork' is equa=
l to 2
           ASSERT(whichfork !=3D XFS_COW_FORK);

vim +674 fs/xfs/libxfs/xfs_bmap_btree.c

a6f406ba1589679 Darrick J. Wong 2022-01-06  641  =

a6f406ba1589679 Darrick J. Wong 2022-01-06  642  /*
a6f406ba1589679 Darrick J. Wong 2022-01-06  643   * Swap in the new inode f=
ork root.  Once we pass this point the newly rebuilt
a6f406ba1589679 Darrick J. Wong 2022-01-06  644   * mappings are in place a=
nd we have to kill off any old btree blocks.
a6f406ba1589679 Darrick J. Wong 2022-01-06  645   */
a6f406ba1589679 Darrick J. Wong 2022-01-06  646  void
a6f406ba1589679 Darrick J. Wong 2022-01-06  647  xfs_bmbt_commit_staged_btr=
ee(
a6f406ba1589679 Darrick J. Wong 2022-01-06  648  	struct xfs_btree_cur	*cur,
a6f406ba1589679 Darrick J. Wong 2022-01-06  649  	struct xfs_trans	*tp,
a6f406ba1589679 Darrick J. Wong 2022-01-06  650  	int			whichfork)
a6f406ba1589679 Darrick J. Wong 2022-01-06  651  {
a6f406ba1589679 Darrick J. Wong 2022-01-06  652  	struct xbtree_ifakeroot	*=
ifake =3D cur->bc_ino.ifake;
a6f406ba1589679 Darrick J. Wong 2022-01-06  653  	struct xfs_ifork	*ifp;
a6f406ba1589679 Darrick J. Wong 2022-01-06  654  	static const short	brootf=
lag[2] =3D
a6f406ba1589679 Darrick J. Wong 2022-01-06  655  		{ XFS_ILOG_DBROOT, XFS_I=
LOG_ABROOT };
a6f406ba1589679 Darrick J. Wong 2022-01-06  656  	static const short	extfla=
g[2] =3D
a6f406ba1589679 Darrick J. Wong 2022-01-06  657  		{ XFS_ILOG_DEXT, XFS_ILO=
G_AEXT };
a6f406ba1589679 Darrick J. Wong 2022-01-06  658  	int			flags =3D XFS_ILOG_=
CORE;
a6f406ba1589679 Darrick J. Wong 2022-01-06  659  =

a6f406ba1589679 Darrick J. Wong 2022-01-06  660  	ASSERT(cur->bc_flags & XF=
S_BTREE_STAGING);
a6f406ba1589679 Darrick J. Wong 2022-01-06  661  	ASSERT(whichfork !=3D XFS=
_COW_FORK);
a6f406ba1589679 Darrick J. Wong 2022-01-06  662  =

a6f406ba1589679 Darrick J. Wong 2022-01-06  663  	/*
a6f406ba1589679 Darrick J. Wong 2022-01-06  664  	 * Free any resources han=
ging off the real fork, then shallow-copy the
a6f406ba1589679 Darrick J. Wong 2022-01-06  665  	 * staging fork's content=
s into the real fork to transfer everything
a6f406ba1589679 Darrick J. Wong 2022-01-06  666  	 * we just built.
a6f406ba1589679 Darrick J. Wong 2022-01-06  667  	 */
a6f406ba1589679 Darrick J. Wong 2022-01-06  668  	ifp =3D XFS_IFORK_PTR(cur=
->bc_ino.ip, whichfork);
a6f406ba1589679 Darrick J. Wong 2022-01-06  669  	xfs_idestroy_fork(ifp);
a6f406ba1589679 Darrick J. Wong 2022-01-06  670  	memcpy(ifp, ifake->if_for=
k, sizeof(struct xfs_ifork));
a6f406ba1589679 Darrick J. Wong 2022-01-06  671  =

a6f406ba1589679 Darrick J. Wong 2022-01-06  672  	switch (ifp->if_format) {
a6f406ba1589679 Darrick J. Wong 2022-01-06  673  	case XFS_DINODE_FMT_EXTEN=
TS:
a6f406ba1589679 Darrick J. Wong 2022-01-06 @674  		flags |=3D extflag[which=
fork];
a6f406ba1589679 Darrick J. Wong 2022-01-06  675  		break;
a6f406ba1589679 Darrick J. Wong 2022-01-06  676  	case XFS_DINODE_FMT_BTREE:
a6f406ba1589679 Darrick J. Wong 2022-01-06  677  		flags |=3D brootflag[whi=
chfork];
a6f406ba1589679 Darrick J. Wong 2022-01-06  678  		break;
a6f406ba1589679 Darrick J. Wong 2022-01-06  679  	default:
a6f406ba1589679 Darrick J. Wong 2022-01-06  680  		ASSERT(0);
a6f406ba1589679 Darrick J. Wong 2022-01-06  681  		break;
a6f406ba1589679 Darrick J. Wong 2022-01-06  682  	}
a6f406ba1589679 Darrick J. Wong 2022-01-06  683  	xfs_trans_log_inode(tp, c=
ur->bc_ino.ip, flags);
a6f406ba1589679 Darrick J. Wong 2022-01-06  684  	xfs_btree_commit_ifakeroo=
t(cur, tp, whichfork, &xfs_bmbt_ops);
a6f406ba1589679 Darrick J. Wong 2022-01-06  685  }
a6f406ba1589679 Darrick J. Wong 2022-01-06  686  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0309706281160760089==--

