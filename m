Content-Type: multipart/mixed; boundary="===============7334324965781236164=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/xfs_buf.c:284:7: warning: Array access (via field 'b_pages') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Thu, 16 Dec 2021 22:15:31 +0800
Message-ID: <202112162218.4b6MoWJP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7334324965781236164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2b14864acbaaf03d9c01982e243a84632524c3ac
commit: 4c7f65aea7b7fe66c08f8f7304c1ea3f7a871d5a xfs: rename buffer cache i=
ndex variable b_bn
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20211214 (https://download.01.org/0day-ci/arc=
hive/20211216/202112162218.4b6MoWJP-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4c7f65aea7b7fe66c08f8f7304c1ea3f7a871d5a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4c7f65aea7b7fe66c08f8f7304c1ea3f7a871d5a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/verity/open.c:347:6: note: Assuming the condition is false
           if (!IS_VERITY(inode))
               ^~~~~~~~~~~~~~~~~
   fs/verity/open.c:347:2: note: Taking false branch
           if (!IS_VERITY(inode))
           ^
   fs/verity/open.c:350:6: note: Assuming the condition is false
           if (filp->f_mode & FMODE_WRITE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:350:2: note: Taking false branch
           if (filp->f_mode & FMODE_WRITE) {
           ^
   fs/verity/open.c:356:9: note: Calling 'ensure_verity_info'
           return ensure_verity_info(inode);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:312:6: note: Assuming 'vi' is null
           if (vi)
               ^~
   fs/verity/open.c:312:2: note: Taking false branch
           if (vi)
           ^
   fs/verity/open.c:316:6: note: 'err' is 0
           if (err)
               ^~~
   fs/verity/open.c:316:2: note: Taking false branch
           if (err)
           ^
   fs/verity/open.c:319:7: note: Calling 'fsverity_create_info'
           vi =3D fsverity_create_info(inode, desc, desc_size);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:157:6: note: Assuming 'vi' is non-null
           if (!vi)
               ^~~
   fs/verity/open.c:157:2: note: Taking false branch
           if (!vi)
           ^
   fs/verity/open.c:161:8: note: Calling 'fsverity_init_merkle_tree_params'
           err =3D fsverity_init_merkle_tree_params(&vi->tree_params, inode,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:43:2: note: Taking false branch
           if (IS_ERR(hash_alg))
           ^
   fs/verity/open.c:50:2: note: Taking false branch
           if (IS_ERR(params->hashstate)) {
           ^
   fs/verity/open.c:57:6: note: Assuming 'log_blocksize' is not equal to PA=
GE_SHIFT
           if (log_blocksize !=3D PAGE_SHIFT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:57:2: note: Taking true branch
           if (log_blocksize !=3D PAGE_SHIFT) {
           ^
   fs/verity/open.c:61:3: note: Control jumps to line 121
                   goto out_err;
                   ^
   fs/verity/open.c:121:2: note: Memory is released
           kfree(params->hashstate);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:161:8: note: Returning; memory was released
           err =3D fsverity_init_merkle_tree_params(&vi->tree_params, inode,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:165:6: note: 'err' is -22
           if (err) {
               ^~~
   fs/verity/open.c:165:2: note: Taking true branch
           if (err) {
           ^
   fs/verity/open.c:169:3: note: Control jumps to line 187
                   goto out;
                   ^
   fs/verity/open.c:187:6: note: 'err' is -22
           if (err) {
               ^~~
   fs/verity/open.c:187:2: note: Taking true branch
           if (err) {
           ^
   fs/verity/open.c:188:3: note: Calling 'fsverity_free_info'
                   fsverity_free_info(vi);
                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:215:7: note: 'vi' is non-null
           if (!vi)
                ^~
   fs/verity/open.c:215:2: note: Taking false branch
           if (!vi)
           ^
   fs/verity/open.c:217:2: note: Attempt to free released memory
           kfree(vi->tree_params.hashstate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   5 warnings generated.
>> fs/xfs/xfs_buf.c:284:7: warning: Array access (via field 'b_pages') resu=
lts in a null pointer dereference [clang-analyzer-core.NullDereference]
                   if (bp->b_pages[i])
                       ^
   fs/xfs/xfs_buf.c:874:10: note: Calling 'xfs_buf_get_uncached'
           error =3D xfs_buf_get_uncached(target, numblks, flags, &bp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_buf.c:910:10: note: Calling '_xfs_buf_alloc'
           error =3D _xfs_buf_alloc(target, &map, 1, flags & XBF_NO_IOACCT,=
 &bp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/xfs/xfs_buf.c:238:2: note: Loop condition is false.  Exiting loop
           spin_lock_init(&bp->b_lock);
           ^
   include/linux/spinlock.h:334:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   fs/xfs/xfs_buf.c:248:10: note: Calling 'xfs_buf_get_maps'
           error =3D xfs_buf_get_maps(bp, nmaps);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_buf.c:185:6: note: 'map_count' is equal to 1
           if (map_count =3D=3D 1) {
               ^~~~~~~~~
   fs/xfs/xfs_buf.c:185:2: note: Taking true branch
           if (map_count =3D=3D 1) {
           ^
   fs/xfs/xfs_buf.c:187:3: note: Returning without writing to 'bp->b_pages'
                   return 0;
                   ^
   fs/xfs/xfs_buf.c:248:10: note: Returning from 'xfs_buf_get_maps'
           error =3D xfs_buf_get_maps(bp, nmaps);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_buf.c:249:6: note: 'error' is 0
           if (error)  {
               ^~~~~
   fs/xfs/xfs_buf.c:249:2: note: Taking false branch
           if (error)  {
           ^
   fs/xfs/xfs_buf.c:256:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < nmaps; i++) {
           ^
   fs/xfs/xfs_buf.c:256:2: note: Loop condition is false. Execution continu=
es on line 262
   fs/xfs/xfs_buf.c:263:2: note: Loop condition is false.  Exiting loop
           init_waitqueue_head(&bp->b_waiters);
           ^
   include/linux/wait.h:67:2: note: expanded from macro 'init_waitqueue_hea=
d'
           do {                                                            =
        \
           ^
   fs/xfs/xfs_buf.c:265:2: note: Loop condition is false.  Exiting loop
           XFS_STATS_INC(bp->b_mount, xb_create);
           ^
   fs/xfs/xfs_stats.h:165:2: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->s.v++;   \
           ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/xfs_buf.c:265:2: note: Loop condition is false.  Exiting loop
           XFS_STATS_INC(bp->b_mount, xb_create);
           ^
   fs/xfs/xfs_stats.h:166:2: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(mp->m_stats.xs_stats, current_cpu())->s.v++;        \
           ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/xfs_buf.c:265:2: note: Loop condition is false.  Exiting loop
           XFS_STATS_INC(bp->b_mount, xb_create);
           ^
   fs/xfs/xfs_stats.h:163:34: note: expanded from macro 'XFS_STATS_INC'
   #define XFS_STATS_INC(mp, v)                                    \
                                                                   ^
   fs/xfs/xfs_buf.c:266:2: note: Calling 'trace_xfs_buf_init'
           trace_xfs_buf_init(bp, _RET_IP_);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_trace.h:448:1: note: Returning without writing to 'bp->b_page=
s'
   DEFINE_BUF_EVENT(xfs_buf_init);
   ^
   fs/xfs/xfs_trace.h:444:32: note: expanded from macro 'DEFINE_BUF_EVENT'
   #define DEFINE_BUF_EVENT(name) \
                                  ^
   include/linux/tracepoint.h:542:2: note: expanded from macro '\DEFINE_EVE=
NT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:343:4: note: expanded from macro '__DECLARE_T=
RACE'
           { }                                                             \
             ^
   fs/xfs/xfs_buf.c:266:2: note: Returning from 'trace_xfs_buf_init'

vim +/b_pages +284 fs/xfs/xfs_buf.c

^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  271=
  =

e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  272=
  static void
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  273=
  xfs_buf_free_pages(
e82226138b20d4 fs/xfs/xfs_buf.c           Dave Chinner      2020-12-16  274=
  	struct xfs_buf	*bp)
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  275=
  {
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  276=
  	uint		i;
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  277=
  =

e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  278=
  	ASSERT(bp->b_flags & _XBF_PAGES);
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  279=
  =

e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  280=
  	if (xfs_buf_is_vmapped(bp))
54cd3aa6f8102f fs/xfs/xfs_buf.c           Christoph Hellwig 2021-06-07  281=
  		vm_unmap_ram(bp->b_addr, bp->b_page_count);
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  282=
  =

e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  283=
  	for (i =3D 0; i < bp->b_page_count; i++) {
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01 @284=
  		if (bp->b_pages[i])
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  285=
  			__free_page(bp->b_pages[i]);
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  286=
  	}
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  287=
  	if (current->reclaim_state)
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  288=
  		current->reclaim_state->reclaimed_slab +=3D bp->b_page_count;
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  289=
  =

02c5117386884e fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  290=
  	if (bp->b_pages !=3D bp->b_page_array)
f0e2d93c29dc39 fs/xfs/linux-2.6/xfs_buf.c Denys Vlasenko    2008-05-19  291=
  		kmem_free(bp->b_pages);
3fc98b1ac03667 fs/xfs/linux-2.6/xfs_buf.c Dave Chinner      2009-12-14  292=
  	bp->b_pages =3D NULL;
e7d236a6fe5102 fs/xfs/xfs_buf.c           Dave Chinner      2021-06-01  293=
  	bp->b_flags &=3D ~_XBF_PAGES;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  294=
  }
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  295=
  =


:::::: The code at line 284 was first introduced by commit
:::::: e7d236a6fe5102092c463112124cf52e4d71885e xfs: move page freeing into=
 _xfs_buf_free_pages()

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Dave Chinner <david@fromorbit.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7334324965781236164==--

