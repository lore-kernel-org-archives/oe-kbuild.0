Content-Type: multipart/mixed; boundary="===============2758609186848795545=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 64/326] fs/xfs/libxfs/xfs_bmap_btree.c:658:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 30 Dec 2021 11:40:12 +0800
Message-ID: <202112301148.ItcziOOC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2758609186848795545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   f736db09eb704761df6d6534ed9730f38bf136d1
commit: 16951bd0c78efd2eb893d369c08db44a8ba9800c [64/326] xfs: repair inode=
 block maps
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-c001-20211228 (https://download.01.org/0day-ci/arch=
ive/20211230/202112301148.ItcziOOC-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b=
7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3D16951bd0c78efd2eb893d369c08db44a8ba9800c
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 16951bd0c78efd2eb893d369c08db44a8ba9800c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:282:6: note: Assuming the condition is fa=
lse
           if (list_empty(&stdev->mrpc_queue))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:282:2: note: Taking false branch
           if (list_empty(&stdev->mrpc_queue))
           ^
   drivers/pci/switch/switchtec.c:290:2: note: Calling 'mrpc_cleanup_cmd'
           mrpc_cleanup_cmd(stdev);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:212:2: note: Calling 'stuser_put'
           stuser_put(stuser);
           ^~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:117:2: note: Calling 'kref_put'
           kref_put(&stuser->kref, stuser_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'stuser_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:109:2: note: Taking false branch
           dev_dbg(&stuser->stdev->dev, "%s: %p\n", __func__, stuser);
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/pci/switch/switchtec.c:112:2: note: Memory is released
           kfree(stuser);
           ^~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:117:2: note: Returning; memory was releas=
ed
           kref_put(&stuser->kref, stuser_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:212:2: note: Returning; memory was releas=
ed
           stuser_put(stuser);
           ^~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:215:2: note: Calling 'mrpc_cmd_submit'
           mrpc_cmd_submit(stdev);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:160:13: note: Field 'mrpc_busy' is 0
           if (stdev->mrpc_busy)
                      ^
   drivers/pci/switch/switchtec.c:160:2: note: Taking false branch
           if (stdev->mrpc_busy)
           ^
   drivers/pci/switch/switchtec.c:163:6: note: Assuming the condition is fa=
lse
           if (list_empty(&stdev->mrpc_queue))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:163:2: note: Taking false branch
           if (list_empty(&stdev->mrpc_queue))
           ^
   drivers/pci/switch/switchtec.c:169:6: note: Assuming field 'dma_mrpc' is=
 null
           if (stdev->dma_mrpc) {
               ^~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:169:2: note: Taking false branch
           if (stdev->dma_mrpc) {
           ^
   drivers/pci/switch/switchtec.c:174:2: note: Calling 'stuser_set_state'
           stuser_set_state(stuser, MRPC_RUNNING);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/switch/switchtec.c:133:16: note: Use of memory after it is f=
reed
           stuser->state =3D state;
           ~~~~~~~~~~~~~ ^
   drivers/pci/switch/switchtec.c:609:3: warning: Value stored to 'rc' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   drivers/pci/switch/switchtec.c:609:3: note: Value stored to 'rc' is neve=
r read
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   drivers/pci/switch/switchtec.c:617:3: warning: Value stored to 'rc' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   drivers/pci/switch/switchtec.c:617:3: note: Value stored to 'rc' is neve=
r read
                   rc =3D -EFAULT;
                   ^    ~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
>> fs/xfs/libxfs/xfs_bmap_btree.c:658:9: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   flags |=3D extflag[whichfork];
                         ^  ~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:644:2: note: Assuming the condition is fa=
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
   fs/xfs/libxfs/xfs_bmap_btree.c:644:2: note: '?' condition is true
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
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
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_bmap_btree.c:645:2: note: '?' condition is false
           ASSERT(whichfork !=3D XFS_COW_FORK);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
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
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:644:2: note: '?' condition is true
           ASSERT(cur->bc_flags & XFS_BTREE_STAGING);
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
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
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_bmap_btree.c:645:2: note: '?' condition is false
           ASSERT(whichfork !=3D XFS_COW_FORK);

vim +658 fs/xfs/libxfs/xfs_bmap_btree.c

16951bd0c78efd Darrick J. Wong 2021-09-01  625  =

16951bd0c78efd Darrick J. Wong 2021-09-01  626  /*
16951bd0c78efd Darrick J. Wong 2021-09-01  627   * Swap in the new inode fo=
rk root.  Once we pass this point the newly rebuilt
16951bd0c78efd Darrick J. Wong 2021-09-01  628   * mappings are in place an=
d we have to kill off any old btree blocks.
16951bd0c78efd Darrick J. Wong 2021-09-01  629   */
16951bd0c78efd Darrick J. Wong 2021-09-01  630  void
16951bd0c78efd Darrick J. Wong 2021-09-01  631  xfs_bmbt_commit_staged_btre=
e(
16951bd0c78efd Darrick J. Wong 2021-09-01  632  	struct xfs_btree_cur	*cur,
16951bd0c78efd Darrick J. Wong 2021-09-01  633  	struct xfs_trans	*tp,
16951bd0c78efd Darrick J. Wong 2021-09-01  634  	int			whichfork)
16951bd0c78efd Darrick J. Wong 2021-09-01  635  {
16951bd0c78efd Darrick J. Wong 2021-09-01  636  	struct xbtree_ifakeroot	*i=
fake =3D cur->bc_ino.ifake;
16951bd0c78efd Darrick J. Wong 2021-09-01  637  	struct xfs_ifork	*ifp;
16951bd0c78efd Darrick J. Wong 2021-09-01  638  	static const short	brootfl=
ag[2] =3D
16951bd0c78efd Darrick J. Wong 2021-09-01  639  		{ XFS_ILOG_DBROOT, XFS_IL=
OG_ABROOT };
16951bd0c78efd Darrick J. Wong 2021-09-01  640  	static const short	extflag=
[2] =3D
16951bd0c78efd Darrick J. Wong 2021-09-01  641  		{ XFS_ILOG_DEXT, XFS_ILOG=
_AEXT };
16951bd0c78efd Darrick J. Wong 2021-09-01  642  	int			flags =3D XFS_ILOG_C=
ORE;
16951bd0c78efd Darrick J. Wong 2021-09-01  643  =

16951bd0c78efd Darrick J. Wong 2021-09-01  644  	ASSERT(cur->bc_flags & XFS=
_BTREE_STAGING);
16951bd0c78efd Darrick J. Wong 2021-09-01  645  	ASSERT(whichfork !=3D XFS_=
COW_FORK);
16951bd0c78efd Darrick J. Wong 2021-09-01  646  =

16951bd0c78efd Darrick J. Wong 2021-09-01  647  	/*
16951bd0c78efd Darrick J. Wong 2021-09-01  648  	 * Free any resources hang=
ing off the real fork, then shallow-copy the
16951bd0c78efd Darrick J. Wong 2021-09-01  649  	 * staging fork's contents=
 into the real fork to transfer everything
16951bd0c78efd Darrick J. Wong 2021-09-01  650  	 * we just built.
16951bd0c78efd Darrick J. Wong 2021-09-01  651  	 */
16951bd0c78efd Darrick J. Wong 2021-09-01  652  	ifp =3D XFS_IFORK_PTR(cur-=
>bc_ino.ip, whichfork);
16951bd0c78efd Darrick J. Wong 2021-09-01  653  	xfs_idestroy_fork(ifp);
16951bd0c78efd Darrick J. Wong 2021-09-01  654  	memcpy(ifp, ifake->if_fork=
, sizeof(struct xfs_ifork));
16951bd0c78efd Darrick J. Wong 2021-09-01  655  =

16951bd0c78efd Darrick J. Wong 2021-09-01  656  	switch (ifp->if_format) {
16951bd0c78efd Darrick J. Wong 2021-09-01  657  	case XFS_DINODE_FMT_EXTENT=
S:
16951bd0c78efd Darrick J. Wong 2021-09-01 @658  		flags |=3D extflag[whichf=
ork];
16951bd0c78efd Darrick J. Wong 2021-09-01  659  		break;
16951bd0c78efd Darrick J. Wong 2021-09-01  660  	case XFS_DINODE_FMT_BTREE:
16951bd0c78efd Darrick J. Wong 2021-09-01  661  		flags |=3D brootflag[whic=
hfork];
16951bd0c78efd Darrick J. Wong 2021-09-01  662  		break;
16951bd0c78efd Darrick J. Wong 2021-09-01  663  	default:
16951bd0c78efd Darrick J. Wong 2021-09-01  664  		ASSERT(0);
16951bd0c78efd Darrick J. Wong 2021-09-01  665  		break;
16951bd0c78efd Darrick J. Wong 2021-09-01  666  	}
16951bd0c78efd Darrick J. Wong 2021-09-01  667  	xfs_trans_log_inode(tp, cu=
r->bc_ino.ip, flags);
16951bd0c78efd Darrick J. Wong 2021-09-01  668  	xfs_btree_commit_ifakeroot=
(cur, tp, whichfork, &xfs_bmbt_ops);
16951bd0c78efd Darrick J. Wong 2021-09-01  669  }
16951bd0c78efd Darrick J. Wong 2021-09-01  670  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2758609186848795545==--

