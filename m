Content-Type: multipart/mixed; boundary="===============5955672915783556310=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/backing-dev.c:609:8: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 11 Feb 2022 06:19:17 +0800
Message-ID: <202202110625.0CSGzFvM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5955672915783556310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e3c85076d7a6f986445b9008be7e7f83d1b0780a
commit: f948666de517cf8ebef7cb2c9b2d669dec4bfe2e locking/barriers, kcsan: A=
dd instrumentation for barriers
date:   9 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20220208 (https://download.01.org/0day-ci/arc=
hive/20220211/202202110625.0CSGzFvM-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df948666de517cf8ebef7cb2c9b2d669dec4bfe2e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f948666de517cf8ebef7cb2c9b2d669dec4bfe2e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2992:9: note: Returning from 'is_inode_flag_set'
           return is_inode_flag_set(inode, FI_INLINE_XATTR);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2992:2: note: Returning zero, which participates in a con=
dition later
           return is_inode_flag_set(inode, FI_INLINE_XATTR);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3044:6: note: Returning from 'f2fs_has_inline_xattr'
           if (f2fs_has_inline_xattr(inode))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3044:2: note: Taking false branch
           if (f2fs_has_inline_xattr(inode))
           ^
   fs/f2fs/f2fs.h:3046:2: note: Returning zero, which participates in a con=
dition later
           return 0;
           ^~~~~~~~
   fs/f2fs/xattr.c:398:29: note: Returning from 'inline_xattr_size'
           unsigned int inline_size =3D inline_xattr_size(inode);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:402:16: note: Calling 'f2fs_kzalloc'
           txattr_addr =3D f2fs_kzalloc(F2FS_I_SB(inode),
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3205:9: note: Calling 'f2fs_kmalloc'
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3194:6: note: Assuming the condition is false
           if (time_to_inject(sbi, FAULT_KMALLOC)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3194:2: note: Taking false branch
           if (time_to_inject(sbi, FAULT_KMALLOC)) {
           ^
   fs/f2fs/f2fs.h:3199:9: note: Uninitialized value stored to field 'h_magi=
c'
           return kmalloc(size, flags);
                  ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3199:2: note: Returning pointer, which participates in a =
condition later
           return kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3205:9: note: Returning from 'f2fs_kmalloc'
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3205:2: note: Returning pointer, which participates in a =
condition later
           return f2fs_kmalloc(sbi, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:402:16: note: Returning from 'f2fs_kzalloc'
           txattr_addr =3D f2fs_kzalloc(F2FS_I_SB(inode),
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.c:404:6: note: Assuming 'txattr_addr' is non-null
           if (!txattr_addr)
               ^~~~~~~~~~~~
   fs/f2fs/xattr.c:404:2: note: Taking false branch
           if (!txattr_addr)
           ^
   fs/f2fs/xattr.c:408:6: note: 'inline_size' is 0
           if (inline_size) {
               ^~~~~~~~~~~
   fs/f2fs/xattr.c:408:2: note: Taking false branch
           if (inline_size) {
           ^
   fs/f2fs/xattr.c:415:6: note: Assuming 'xnid' is 0
           if (xnid) {
               ^~~~
   fs/f2fs/xattr.c:415:2: note: Taking false branch
           if (xnid) {
           ^
   fs/f2fs/xattr.c:424:35: note: The left operand of '!=3D' is a garbage va=
lue
           if (le32_to_cpu(header->h_magic) !=3D F2FS_XATTR_MAGIC) {
                                            ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   mm/shmem.c:1360:2: warning: Value stored to 'index' is never read [clang=
-analyzer-deadcode.DeadStores]
           index =3D page->index;
           ^       ~~~~~~~~~~~
   mm/shmem.c:1360:2: note: Value stored to 'index' is never read
           index =3D page->index;
           ^       ~~~~~~~~~~~
   mm/shmem.c:1552:24: warning: Value stored to 'mapping' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct address_space *mapping =3D info->vfs_inode.i_mapping;
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1552:24: note: Value stored to 'mapping' during its initializ=
ation is never read
           struct address_space *mapping =3D info->vfs_inode.i_mapping;
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.
>> mm/backing-dev.c:609:8: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
                   wb =3D wb_get_lookup(bdi, memcg_css);
                        ^             ~~~
   mm/backing-dev.c:605:6: note: Assuming field 'parent' is non-null
           if (!memcg_css->parent)
               ^~~~~~~~~~~~~~~~~~
   mm/backing-dev.c:605:2: note: Taking false branch
           if (!memcg_css->parent)
           ^
   mm/backing-dev.c:610:12: note: 'wb' is null
           } while (!wb && !cgwb_create(bdi, memcg_css, gfp));
                     ^~
   mm/backing-dev.c:610:11: note: Left side of '&&' is true
           } while (!wb && !cgwb_create(bdi, memcg_css, gfp));
                    ^
   mm/backing-dev.c:608:2: note: Loop condition is true. Execution continue=
s on line 609
           do {
           ^
   mm/backing-dev.c:610:12: note: 'wb' is null
           } while (!wb && !cgwb_create(bdi, memcg_css, gfp));
                     ^~
   mm/backing-dev.c:610:11: note: Left side of '&&' is true
           } while (!wb && !cgwb_create(bdi, memcg_css, gfp));
                    ^
   mm/backing-dev.c:608:2: note: Loop condition is true. Execution continue=
s on line 609
           do {
           ^
   mm/backing-dev.c:610:12: note: 'wb' is null
           } while (!wb && !cgwb_create(bdi, memcg_css, gfp));
                     ^~
   mm/backing-dev.c:610:11: note: Left side of '&&' is true
           } while (!wb && !cgwb_create(bdi, memcg_css, gfp));
                    ^
   mm/backing-dev.c:610:19: note: Calling 'cgwb_create'
           } while (!wb && !cgwb_create(bdi, memcg_css, gfp));
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/backing-dev.c:462:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&cgwb_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   mm/backing-dev.c:462:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&cgwb_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   mm/backing-dev.c:464:6: note: Assuming 'wb' is null
           if (wb && wb->blkcg_css !=3D blkcg_css) {
               ^~
   mm/backing-dev.c:464:9: note: Left side of '&&' is false
           if (wb && wb->blkcg_css !=3D blkcg_css) {
                  ^
   mm/backing-dev.c:469:6: note: 'wb' is null
           if (wb)
               ^~
   mm/backing-dev.c:469:2: note: Taking false branch
           if (wb)
           ^
   mm/backing-dev.c:474:6: note: Assuming 'wb' is non-null
           if (!wb) {
               ^~~
   mm/backing-dev.c:474:2: note: Taking false branch
           if (!wb) {
           ^
   mm/backing-dev.c:480:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   mm/backing-dev.c:480:2: note: Taking false branch
           if (ret)
           ^
   mm/backing-dev.c:484:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   mm/backing-dev.c:484:2: note: Taking false branch
           if (ret)
           ^
   mm/backing-dev.c:488:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   mm/backing-dev.c:488:2: note: Taking false branch
           if (ret)
           ^
   mm/backing-dev.c:494:2: note: Loop condition is false.  Exiting loop
           INIT_WORK(&wb->release_work, cgwb_release_workfn);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:236:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   mm/backing-dev.c:505:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&cgwb_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \

vim +609 mm/backing-dev.c

ed288dc0d4aa29f Tejun Heo     2019-08-26  587  =

ed288dc0d4aa29f Tejun Heo     2019-08-26  588  /**
ed288dc0d4aa29f Tejun Heo     2019-08-26  589   * wb_get_create - get wb fo=
r a given memcg, create if necessary
ed288dc0d4aa29f Tejun Heo     2019-08-26  590   * @bdi: target bdi
ed288dc0d4aa29f Tejun Heo     2019-08-26  591   * @memcg_css: cgroup_subsys=
_state of the target memcg (must have positive ref)
ed288dc0d4aa29f Tejun Heo     2019-08-26  592   * @gfp: allocation mask to =
use
ed288dc0d4aa29f Tejun Heo     2019-08-26  593   *
ed288dc0d4aa29f Tejun Heo     2019-08-26  594   * Try to get the wb for @me=
mcg_css on @bdi.  If it doesn't exist, try to
ed288dc0d4aa29f Tejun Heo     2019-08-26  595   * create one.  See wb_get_l=
ookup() for more details.
ed288dc0d4aa29f Tejun Heo     2019-08-26  596   */
ed288dc0d4aa29f Tejun Heo     2019-08-26  597  struct bdi_writeback *wb_get=
_create(struct backing_dev_info *bdi,
ed288dc0d4aa29f Tejun Heo     2019-08-26  598  				    struct cgroup_subsys=
_state *memcg_css,
ed288dc0d4aa29f Tejun Heo     2019-08-26  599  				    gfp_t gfp)
ed288dc0d4aa29f Tejun Heo     2019-08-26  600  {
ed288dc0d4aa29f Tejun Heo     2019-08-26  601  	struct bdi_writeback *wb;
ed288dc0d4aa29f Tejun Heo     2019-08-26  602  =

c1ca59a1f21e360 Daniel Vetter 2021-02-25  603  	might_alloc(gfp);
ed288dc0d4aa29f Tejun Heo     2019-08-26  604  =

ed288dc0d4aa29f Tejun Heo     2019-08-26  605  	if (!memcg_css->parent)
ed288dc0d4aa29f Tejun Heo     2019-08-26  606  		return &bdi->wb;
ed288dc0d4aa29f Tejun Heo     2019-08-26  607  =

ed288dc0d4aa29f Tejun Heo     2019-08-26  608  	do {
ed288dc0d4aa29f Tejun Heo     2019-08-26 @609  		wb =3D wb_get_lookup(bdi, =
memcg_css);
52ebea749aaed19 Tejun Heo     2015-05-22  610  	} while (!wb && !cgwb_creat=
e(bdi, memcg_css, gfp));
52ebea749aaed19 Tejun Heo     2015-05-22  611  =

52ebea749aaed19 Tejun Heo     2015-05-22  612  	return wb;
52ebea749aaed19 Tejun Heo     2015-05-22  613  }
52ebea749aaed19 Tejun Heo     2015-05-22  614  =


:::::: The code at line 609 was first introduced by commit
:::::: ed288dc0d4aa29f65bd25b31b5cb866aa5664ff9 writeback: Separate out wb_=
get_lookup() from wb_get_create()

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5955672915783556310==--

