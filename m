Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1685C641
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Feb 2023 05:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676697221; x=1708233221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUO3JUyDEL93bh6iNBS+9xbicXyTlBfNGTisGDSDwM0=;
  b=C1yL2s/zU5lRfW/9NzKIqpeATF3QYRLjreKqepTEQjaqQ4WoSa8gckGc
   NOLU9BRtJ4PZH7C5vY69Q7Dow+T6M/UUFj7OwF9lOW9MX3ks326SP/gyL
   z9oj742o0KdX4Ds2gTXzThZJmsYgDtnNn5w/kNRBvSO4VtsCZuGkiDPfB
   BLNoXr9Utcs4MMwiOVae1KJ+5Kqtb2pelqS86o1XMqJWxPJ4o2uvgB95G
   agsGHdz6llQY7avuw+LIPhgGwvCVgZ1bkAchrYlgHJrEVIyBI4BzIuF8Z
   sNEG9fDGG4x20wVzPJRd76oiDAnN/pPN3pBQ3Vxl20U3mg6UPABphc82p
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="311774426"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="311774426"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 21:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="620607920"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="620607920"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Feb 2023 21:10:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTFUl-000C89-2g;
	Sat, 18 Feb 2023 05:10:47 +0000
Date: Sat, 18 Feb 2023 13:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:in-memory-btrees 58/182] fs/xfs/scrub/ialloc.c:87:2:
 warning: Value stored to 'error' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302181300.1ivsoenk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/scrub/ialloc.c:87:2: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git in-memory-btrees
head:   65b160b063691d49f132134659b0b200cb138e72
commit: e7466b46031e598f224dd49d41a2f2a9dae5349e [58/182] xfs: directly cross-reference the inode btrees with each other
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-c005-20230212 (https://download.01.org/0day-ci/archive/20230218/202302181300.1ivsoenk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=e7466b46031e598f224dd49d41a2f2a9dae5349e
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs in-memory-btrees
        git checkout e7466b46031e598f224dd49d41a2f2a9dae5349e
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302181300.1ivsoenk-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   fs/xfs/scrub/ialloc.c:483:11: note: Calling 'xchk_iallocbt_check_cluster'
                   error = xchk_iallocbt_check_cluster(bs, irec, cluster_base);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:379:14: note: Assuming '__UNIQUE_ID___x361' is >= '__UNIQUE_ID___y362'
           nr_inodes = min_t(unsigned int, XFS_INODES_PER_CHUNK,
                       ^
   include/linux/minmax.h:126:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/xfs/scrub/ialloc.c:379:14: note: '?' condition is false
           nr_inodes = min_t(unsigned int, XFS_INODES_PER_CHUNK,
                       ^
   include/linux/minmax.h:126:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/xfs/scrub/ialloc.c:387:7: note: Assuming 'cluster_index' is < 'nr_inodes'
                cluster_index < nr_inodes;
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:386:2: note: Loop condition is true.  Entering loop body
           for (cluster_index = 0;
           ^
   fs/xfs/scrub/ialloc.c:387:7: note: Assuming 'cluster_index' is >= 'nr_inodes'
                cluster_index < nr_inodes;
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:386:2: note: Loop condition is false. Execution continues on line 399
           for (cluster_index = 0;
           ^
   fs/xfs/scrub/ialloc.c:405:6: note: Assuming field 'im_boffset' is equal to 0
           if (imap.im_boffset != 0 && cluster_base != 0) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:405:27: note: Left side of '&&' is false
           if (imap.im_boffset != 0 && cluster_base != 0) {
                                    ^
   fs/xfs/scrub/ialloc.c:418:6: note: 'ir_holemask' is not equal to 'cluster_mask'
           if (ir_holemask != cluster_mask && ir_holemask != 0) {
               ^~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:418:6: note: Left side of '&&' is true
   fs/xfs/scrub/ialloc.c:418:37: note: 'ir_holemask' is equal to 0
           if (ir_holemask != cluster_mask && ir_holemask != 0) {
                                              ^~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:418:2: note: Taking false branch
           if (ir_holemask != cluster_mask && ir_holemask != 0) {
           ^
   fs/xfs/scrub/ialloc.c:424:6: note: 'ir_holemask' is 0
           if (ir_holemask) {
               ^~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:424:2: note: Taking false branch
           if (ir_holemask) {
           ^
   fs/xfs/scrub/ialloc.c:436:6: note: Assuming the condition is false
           if (!xchk_btree_xref_process_error(bs->sc, bs->cur, 0, &error))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:436:2: note: Taking false branch
           if (!xchk_btree_xref_process_error(bs->sc, bs->cur, 0, &error))
           ^
   fs/xfs/scrub/ialloc.c:440:26: note: 'cluster_index' is < 'nr_inodes'
           for (cluster_index = 0; cluster_index < nr_inodes; cluster_index++) {
                                   ^~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:440:2: note: Loop condition is true.  Entering loop body
           for (cluster_index = 0; cluster_index < nr_inodes; cluster_index++) {
           ^
   fs/xfs/scrub/ialloc.c:443:7: note: Assuming the condition is false
                   if (imap.im_boffset >= BBTOB(cluster_bp->b_length)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:443:3: note: Taking false branch
                   if (imap.im_boffset >= BBTOB(cluster_bp->b_length)) {
                   ^
   fs/xfs/scrub/ialloc.c:449:11: note: Calling 'xchk_iallocbt_check_cluster_ifree'
                   error = xchk_iallocbt_check_cluster_ifree(bs, irec,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:314:6: note: Calling 'xchk_should_terminate'
           if (xchk_should_terminate(bs->sc, &error))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/common.h:26:27: note: Dereference of null pointer
           if (fatal_signal_pending(current)) {
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'current'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:215:22: note: expanded from macro 'S390_lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> fs/xfs/scrub/ialloc.c:87:2: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
           error = xfs_inobt_get_rec(cur, &frec, &has_record);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:87:2: note: Value stored to 'error' is never read
           error = xfs_inobt_get_rec(cur, &frec, &has_record);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:190:2: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
           error = xfs_inobt_get_rec(cur, &irec, &has_record);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/ialloc.c:190:2: note: Value stored to 'error' is never read
           error = xfs_inobt_get_rec(cur, &irec, &has_record);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   13 warnings generated.
   arch/s390/include/asm/spinlock.h:61:52: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           return likely(__atomic_cmpxchg_bool(&lp->lock, 0, SPINLOCK_LOCKVAL));
                                                             ^
   arch/s390/include/asm/spinlock.h:19:26: note: expanded from macro 'SPINLOCK_LOCKVAL'
   #define SPINLOCK_LOCKVAL (S390_lowcore.spinlock_lockval)
                            ^
   fs/ext4/ialloc.c:1376:6: note: Assuming 'ino' is >= field 's_first_ino'
           if (ino < EXT4_FIRST_INO(sb) || ino > max_ino)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/ialloc.c:1376:6: note: Left side of '||' is false
   fs/ext4/ialloc.c:1376:34: note: Assuming 'ino' is <= 'max_ino'
           if (ino < EXT4_FIRST_INO(sb) || ino > max_ino)
                                           ^~~~~~~~~~~~~
   fs/ext4/ialloc.c:1376:2: note: Taking false branch
           if (ino < EXT4_FIRST_INO(sb) || ino > max_ino)
           ^
   fs/ext4/ialloc.c:1381:14: note: Calling 'ext4_read_inode_bitmap'
           bitmap_bh = ext4_read_inode_bitmap(sb, block_group);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/ialloc.c:133:6: note: Assuming 'desc' is non-null
           if (!desc)
               ^~~~~
   fs/ext4/ialloc.c:133:2: note: Taking false branch
           if (!desc)
           ^
   fs/ext4/ialloc.c:137:7: note: Assuming the condition is false
           if ((bitmap_blk <= le32_to_cpu(sbi->s_es->s_first_data_block)) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/ialloc.c:137:6: note: Left side of '||' is false
           if ((bitmap_blk <= le32_to_cpu(sbi->s_es->s_first_data_block)) ||
               ^
   fs/ext4/ialloc.c:138:7: note: Assuming the condition is false
               (bitmap_blk >= ext4_blocks_count(sbi->s_es))) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/ialloc.c:137:2: note: Taking false branch
           if ((bitmap_blk <= le32_to_cpu(sbi->s_es->s_first_data_block)) ||
           ^
   fs/ext4/ialloc.c:146:15: note: Assuming 'bh' is non-null
           if (unlikely(!bh)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/ialloc.c:146:2: note: Taking false branch
           if (unlikely(!bh)) {
           ^
   fs/ext4/ialloc.c:152:2: note: Taking false branch
           if (bitmap_uptodate(bh))
           ^
   fs/ext4/ialloc.c:156:2: note: Taking false branch
           if (bitmap_uptodate(bh)) {
           ^
   fs/ext4/ialloc.c:161:2: note: Calling 'ext4_lock_group'
           ext4_lock_group(sb, block_group);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/ext4.h:3481:2: note: Taking false branch
           if (spin_trylock(lock))
           ^
   fs/ext4/ext4.h:3494:3: note: Calling 'spin_lock'
                   spin_lock(lock);
                   ^~~~~~~~~~~~~~~
   include/linux/spinlock.h:350:2: note: Calling '__raw_spin_lock'
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:216:29: note: expanded from macro 'raw_spin_lock'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:47:30: note: expanded from macro '_raw_spin_lock'
   #define _raw_spin_lock(lock) __raw_spin_lock(lock)
                                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:133:2: note: Loop condition is false.  Exiting loop
           spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
           ^
   include/linux/lockdep.h:526:35: note: expanded from macro 'spin_acquire'
   #define spin_acquire(l, s, t, i)                lock_acquire_exclusive(l, s, t, NULL, i)
                                                   ^
   include/linux/lockdep.h:522:48: note: expanded from macro 'lock_acquire_exclusive'
   #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, n, i)
                                                           ^
   include/linux/lockdep.h:360:44: note: expanded from macro 'lock_acquire'
   # define lock_acquire(l, s, t, r, c, n, i)      do { } while (0)
                                                   ^
   include/linux/spinlock_api_smp.h:134:44: note: Calling 'do_raw_spin_lock'

vim +/error +87 fs/xfs/scrub/ialloc.c

2c2d9d3a205afa Darrick J. Wong 2018-12-12   52  
2e6f27561b7987 Darrick J. Wong 2018-01-16   53  /*
e7466b46031e59 Darrick J. Wong 2022-07-14   54   * Does the finobt have a record for this inode with the same hole/free state?
e7466b46031e59 Darrick J. Wong 2022-07-14   55   * This is a bit complicated because of the following:
e7466b46031e59 Darrick J. Wong 2022-07-14   56   *
e7466b46031e59 Darrick J. Wong 2022-07-14   57   * - The finobt need not have a record if all inodes in the inobt record are
e7466b46031e59 Darrick J. Wong 2022-07-14   58   *   allocated.
e7466b46031e59 Darrick J. Wong 2022-07-14   59   * - The finobt need not have a record if all inodes in the inobt record are
e7466b46031e59 Darrick J. Wong 2022-07-14   60   *   free.
e7466b46031e59 Darrick J. Wong 2022-07-14   61   * - The finobt need not have a record if the inobt record says this is a hole.
e7466b46031e59 Darrick J. Wong 2022-07-14   62   *   This likely doesn't happen in practice.
2e6f27561b7987 Darrick J. Wong 2018-01-16   63   */
e7466b46031e59 Darrick J. Wong 2022-07-14   64  STATIC int
e7466b46031e59 Darrick J. Wong 2022-07-14   65  xchk_inobt_xref_finobt(
1d8a748a8aa94a Darrick J. Wong 2018-07-19   66  	struct xfs_scrub	*sc,
2e6f27561b7987 Darrick J. Wong 2018-01-16   67  	struct xfs_inobt_rec_incore *irec,
e7466b46031e59 Darrick J. Wong 2022-07-14   68  	xfs_agino_t		agino,
e7466b46031e59 Darrick J. Wong 2022-07-14   69  	bool			free,
e7466b46031e59 Darrick J. Wong 2022-07-14   70  	bool			hole)
2e6f27561b7987 Darrick J. Wong 2018-01-16   71  {
e7466b46031e59 Darrick J. Wong 2022-07-14   72  	struct xfs_inobt_rec_incore frec;
e7466b46031e59 Darrick J. Wong 2022-07-14   73  	struct xfs_btree_cur	*cur = sc->sa.fino_cur;
e7466b46031e59 Darrick J. Wong 2022-07-14   74  	bool			ffree, fhole;
e7466b46031e59 Darrick J. Wong 2022-07-14   75  	unsigned int		frec_idx, fhole_idx;
e7466b46031e59 Darrick J. Wong 2022-07-14   76  	int			has_record;
2e6f27561b7987 Darrick J. Wong 2018-01-16   77  	int			error;
2e6f27561b7987 Darrick J. Wong 2018-01-16   78  
e7466b46031e59 Darrick J. Wong 2022-07-14   79  	ASSERT(cur->bc_btnum == XFS_BTNUM_FINO);
e7466b46031e59 Darrick J. Wong 2022-07-14   80  
e7466b46031e59 Darrick J. Wong 2022-07-14   81  	error = xfs_inobt_lookup(cur, agino, XFS_LOOKUP_LE, &has_record);
e7466b46031e59 Darrick J. Wong 2022-07-14   82  	if (error)
e7466b46031e59 Darrick J. Wong 2022-07-14   83  		return error;
e7466b46031e59 Darrick J. Wong 2022-07-14   84  	if (!has_record)
e7466b46031e59 Darrick J. Wong 2022-07-14   85  		goto no_record;
e7466b46031e59 Darrick J. Wong 2022-07-14   86  
e7466b46031e59 Darrick J. Wong 2022-07-14  @87  	error = xfs_inobt_get_rec(cur, &frec, &has_record);
e7466b46031e59 Darrick J. Wong 2022-07-14   88  	if (!has_record)
e7466b46031e59 Darrick J. Wong 2022-07-14   89  		return -EFSCORRUPTED;
e7466b46031e59 Darrick J. Wong 2022-07-14   90  
e7466b46031e59 Darrick J. Wong 2022-07-14   91  	if (frec.ir_startino + XFS_INODES_PER_CHUNK <= agino)
e7466b46031e59 Darrick J. Wong 2022-07-14   92  		goto no_record;
e7466b46031e59 Darrick J. Wong 2022-07-14   93  
e7466b46031e59 Darrick J. Wong 2022-07-14   94  	/* There's a finobt record; free and hole status must match. */
e7466b46031e59 Darrick J. Wong 2022-07-14   95  	frec_idx = agino - frec.ir_startino;
e7466b46031e59 Darrick J. Wong 2022-07-14   96  	ffree = frec.ir_free & (1ULL << frec_idx);
e7466b46031e59 Darrick J. Wong 2022-07-14   97  	fhole_idx = frec_idx / XFS_INODES_PER_HOLEMASK_BIT;
e7466b46031e59 Darrick J. Wong 2022-07-14   98  	fhole = frec.ir_holemask & (1U << fhole_idx);
e7466b46031e59 Darrick J. Wong 2022-07-14   99  
e7466b46031e59 Darrick J. Wong 2022-07-14  100  	if (ffree != free)
e7466b46031e59 Darrick J. Wong 2022-07-14  101  		xchk_btree_xref_set_corrupt(sc, cur, 0);
e7466b46031e59 Darrick J. Wong 2022-07-14  102  	if (fhole != hole)
e7466b46031e59 Darrick J. Wong 2022-07-14  103  		xchk_btree_xref_set_corrupt(sc, cur, 0);
e7466b46031e59 Darrick J. Wong 2022-07-14  104  	return 0;
e7466b46031e59 Darrick J. Wong 2022-07-14  105  
e7466b46031e59 Darrick J. Wong 2022-07-14  106  no_record:
e7466b46031e59 Darrick J. Wong 2022-07-14  107  	/* inobt record is fully allocated */
e7466b46031e59 Darrick J. Wong 2022-07-14  108  	if (irec->ir_free == 0)
e7466b46031e59 Darrick J. Wong 2022-07-14  109  		return 0;
e7466b46031e59 Darrick J. Wong 2022-07-14  110  
e7466b46031e59 Darrick J. Wong 2022-07-14  111  	/* inobt record is totally unallocated */
e7466b46031e59 Darrick J. Wong 2022-07-14  112  	if (irec->ir_free == XFS_INOBT_ALL_FREE)
e7466b46031e59 Darrick J. Wong 2022-07-14  113  		return 0;
e7466b46031e59 Darrick J. Wong 2022-07-14  114  
e7466b46031e59 Darrick J. Wong 2022-07-14  115  	/* inobt record says this is a hole */
e7466b46031e59 Darrick J. Wong 2022-07-14  116  	if (hole)
e7466b46031e59 Darrick J. Wong 2022-07-14  117  		return 0;
e7466b46031e59 Darrick J. Wong 2022-07-14  118  
e7466b46031e59 Darrick J. Wong 2022-07-14  119  	/* finobt doesn't care about allocated inodes */
e7466b46031e59 Darrick J. Wong 2022-07-14  120  	if (!free)
e7466b46031e59 Darrick J. Wong 2022-07-14  121  		return 0;
e7466b46031e59 Darrick J. Wong 2022-07-14  122  
e7466b46031e59 Darrick J. Wong 2022-07-14  123  	xchk_btree_xref_set_corrupt(sc, cur, 0);
e7466b46031e59 Darrick J. Wong 2022-07-14  124  	return 0;
e7466b46031e59 Darrick J. Wong 2022-07-14  125  }
e7466b46031e59 Darrick J. Wong 2022-07-14  126  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
