Content-Type: multipart/mixed; boundary="===============8998843633418027846=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ceph/addr.c:334:6: warning: Value stored to 'len' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 17 Dec 2021 16:51:36 +0800
Message-ID: <202112171619.EdGlYxTY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8998843633418027846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>
CC: Ilya Dryomov <idryomov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6441998e2e37131b0a4c310af9156d79d3351c16
commit: 8ff2d290c8ce77c8e30d9b08c13d87cd5688d7e1 ceph: convert some PAGE_SI=
ZE invocations to thp_size()
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20211211 (https://download.01.org/0day-ci/archi=
ve/20211217/202112171619.EdGlYxTY-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8ff2d290c8ce77c8e30d9b08c13d87cd5688d7e1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8ff2d290c8ce77c8e30d9b08c13d87cd5688d7e1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   list_first_entry(head, struct host1x_waitlist, list)->th=
resh;
                   ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/host1x/intr.c:93:3: note: Loop condition is false.  Exiting =
loop
                   list_first_entry(head, struct host1x_waitlist, list)->th=
resh;
                   ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/host1x/intr.c:93:3: note: Use of memory after it is freed
                   list_first_entry(head, struct host1x_waitlist, list)->th=
resh;
                   ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:707:41: note: expanded from macro 'container_of'
   #define container_of(ptr, type, member) ({                              \
                                           ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
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
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   fs/ceph/file.c:295:7: warning: Value stored to 'issued' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
                   int issued =3D __ceph_caps_issued(ci, NULL);
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:295:7: note: Value stored to 'issued' during its initiali=
zation is never read
                   int issued =3D __ceph_caps_issued(ci, NULL);
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:2183:2: warning: Value stored to 'size' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           size =3D i_size_read(dst_inode);
           ^      ~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/file.c:2183:2: note: Value stored to 'size' is never read
           size =3D i_size_read(dst_inode);
           ^      ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   fs/ceph/addr.c:332:19: warning: Value stored to 'vino' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct ceph_vino vino =3D ceph_vino(inode);
                            ^~~~   ~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:332:19: note: Value stored to 'vino' during its initializ=
ation is never read
           struct ceph_vino vino =3D ceph_vino(inode);
                            ^~~~   ~~~~~~~~~~~~~~~~
>> fs/ceph/addr.c:334:6: warning: Value stored to 'len' during its initiali=
zation is never read [clang-analyzer-deadcode.DeadStores]
           u64 len =3D thp_size(page);
               ^~~   ~~~~~~~~~~~~~~
   fs/ceph/addr.c:334:6: note: Value stored to 'len' during its initializat=
ion is never read
           u64 len =3D thp_size(page);
               ^~~   ~~~~~~~~~~~~~~
   fs/ceph/addr.c:585:3: warning: The expression is an uninitialized value.=
 The computed value will also be garbage [clang-analyzer-core.uninitialized=
.Assign]
                   wbc->pages_skipped++;
                   ^
   fs/ceph/addr.c:607:9: note: Assuming 'inode' is non-null
           BUG_ON(!inode);
                  ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ceph/addr.c:607:2: note: Taking false branch
           BUG_ON(!inode);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ceph/addr.c:607:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!inode);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ceph/addr.c:609:8: note: Calling 'writepage_nounlock'
           err =3D writepage_nounlock(page, wbc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:504:2: note: Taking false branch
           dout("writepage %p idx %lu\n", page, page->index);
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   fs/ceph/addr.c:504:2: note: Loop condition is false.  Exiting loop
           dout("writepage %p idx %lu\n", page, page->index);
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   fs/ceph/addr.c:508:6: note: Assuming 'snapc' is non-null
           if (!snapc) {
               ^~~~~~
   fs/ceph/addr.c:508:2: note: Taking false branch
           if (!snapc) {
           ^
   fs/ceph/addr.c:513:6: note: Assuming 'snapc->seq' is <=3D 'oldest->seq'
           if (snapc->seq > oldest->seq) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:513:2: note: Taking false branch
           if (snapc->seq > oldest->seq) {
           ^
   fs/ceph/addr.c:525:6: note: Assuming 'page_off' is < field 'i_size'
           if (page_off >=3D ceph_wbc.i_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:525:2: note: Taking false branch
           if (page_off >=3D ceph_wbc.i_size) {
           ^
   fs/ceph/addr.c:531:6: note: Assuming the condition is false
           if (ceph_wbc.i_size < page_off + len)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:531:2: note: Taking false branch
           if (ceph_wbc.i_size < page_off + len)
           ^
   fs/ceph/addr.c:534:2: note: Taking false branch
           dout("writepage %p page %p index %lu on %llu~%llu snapc %p seq %=
lld\n",
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   fs/ceph/addr.c:534:2: note: Loop condition is false.  Exiting loop
           dout("writepage %p page %p index %lu on %llu~%llu snapc %p seq %=
lld\n",
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   fs/ceph/addr.c:537:6: note: Assuming the condition is false
           if (atomic_long_inc_return(&fsc->writeback_count) >
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:537:2: note: Taking false branch
           if (atomic_long_inc_return(&fsc->writeback_count) >
           ^
   fs/ceph/addr.c:546:6: note: Calling 'IS_ERR'
           if (IS_ERR(req)) {
               ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);

vim +/len +334 fs/ceph/addr.c

f0702876e152f04 Jeff Layton 2020-06-01  326  =

f0702876e152f04 Jeff Layton 2020-06-01  327  /* read a single page, without=
 unlocking it. */
f0702876e152f04 Jeff Layton 2020-06-01  328  static int ceph_readpage(struc=
t file *file, struct page *page)
f0702876e152f04 Jeff Layton 2020-06-01  329  {
f0702876e152f04 Jeff Layton 2020-06-01  330  	struct inode *inode =3D file_=
inode(file);
f0702876e152f04 Jeff Layton 2020-06-01  331  	struct ceph_inode_info *ci =
=3D ceph_inode(inode);
f0702876e152f04 Jeff Layton 2020-06-01  332  	struct ceph_vino vino =3D cep=
h_vino(inode);
f0702876e152f04 Jeff Layton 2020-06-01  333  	u64 off =3D page_offset(page);
8ff2d290c8ce77c Jeff Layton 2021-04-05 @334  	u64 len =3D thp_size(page);
f0702876e152f04 Jeff Layton 2020-06-01  335  =

f0702876e152f04 Jeff Layton 2020-06-01  336  	if (ci->i_inline_version !=3D=
 CEPH_INLINE_NONE) {
f0702876e152f04 Jeff Layton 2020-06-01  337  		/*
f0702876e152f04 Jeff Layton 2020-06-01  338  		 * Uptodate inline data shou=
ld have been added
f0702876e152f04 Jeff Layton 2020-06-01  339  		 * into page cache while get=
ting Fcr caps.
f0702876e152f04 Jeff Layton 2020-06-01  340  		 */
f0702876e152f04 Jeff Layton 2020-06-01  341  		if (off =3D=3D 0) {
f0702876e152f04 Jeff Layton 2020-06-01  342  			unlock_page(page);
f0702876e152f04 Jeff Layton 2020-06-01  343  			return -EINVAL;
f0702876e152f04 Jeff Layton 2020-06-01  344  		}
8ff2d290c8ce77c Jeff Layton 2021-04-05  345  		zero_user_segment(page, 0, t=
hp_size(page));
f0702876e152f04 Jeff Layton 2020-06-01  346  		SetPageUptodate(page);
f0702876e152f04 Jeff Layton 2020-06-01  347  		unlock_page(page);
f0702876e152f04 Jeff Layton 2020-06-01  348  		return 0;
f0702876e152f04 Jeff Layton 2020-06-01  349  	}
f0702876e152f04 Jeff Layton 2020-06-01  350  =

f0702876e152f04 Jeff Layton 2020-06-01  351  	dout("readpage ino %llx.%llx =
file %p off %llu len %llu page %p index %lu\n",
f0702876e152f04 Jeff Layton 2020-06-01  352  	     vino.ino, vino.snap, fil=
e, off, len, page, page->index);
f0702876e152f04 Jeff Layton 2020-06-01  353  =

f0702876e152f04 Jeff Layton 2020-06-01  354  	return netfs_readpage(file, p=
age, &ceph_netfs_read_ops, NULL);
f0702876e152f04 Jeff Layton 2020-06-01  355  }
f0702876e152f04 Jeff Layton 2020-06-01  356  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8998843633418027846==--

