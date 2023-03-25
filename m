Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB1290F
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Mar 2023 23:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679787264; x=1711323264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jg/InB2376rqV4DyABPztcGn/gzXs1IRuzVB9A/nZXs=;
  b=gFadcfrWTDpi0fRe8MA1HFKRgysK8bz+43mMgog3qmfuQqiDn1jbaFKN
   pud/zT6q/ctoPdBXe2XPCBNIyl0o854zBT8DYj8fKC4/filMLeoF+yZ0R
   ravXCo3u7B6vJJlZYL90zDeZJFrzbhzvD2Iit6+VVuNbCl6WATASQGj4L
   3DvPUjaHkdBME1iv4PKjnAoyOCDrukjHZ/3Kg7GzROsSAmH8MWNPDzZ1O
   zmUluH84MR6xcOVk0+jo7cmrdI6af26GFXnwRo7ZRUibuZA4bI0XVAoEd
   xtSXMF4l9UkOVr/4T0A0ggWXMOyGEGh9qwS7q/fLXF9EKXFsErnCJwJCN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="341596896"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="341596896"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 16:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="713437930"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="713437930"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Mar 2023 16:34:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgDOw-000Gjb-0S;
	Sat, 25 Mar 2023 23:34:22 +0000
Date: Sun, 26 Mar 2023 07:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfile-page-caching 171/287]
 fs/xfs/scrub/nlinks_repair.c:91 xrep_nlinks_repair_inode() warn: missing
 error code 'error'
Message-ID: <202303260733.QjASwv51-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   10b2657dfdd633f83d3de6eba27b8e093cf0caa6
commit: 5e5ada746aad79a27ff5f0b235cac245ccc1b621 [171/287] xfs: teach repair to fix file nlinks
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: microblaze-randconfig-m041-20230326 (https://download.01.org/0day-ci/archive/20230326/202303260733.QjASwv51-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303260733.QjASwv51-lkp@intel.com/

New smatch warnings:
fs/xfs/scrub/nlinks_repair.c:91 xrep_nlinks_repair_inode() warn: missing error code 'error'

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/error +91 fs/xfs/scrub/nlinks_repair.c

5e5ada746aad79 Darrick J. Wong 2023-03-06   28  
5e5ada746aad79 Darrick J. Wong 2023-03-06   29  /*
5e5ada746aad79 Darrick J. Wong 2023-03-06   30   * Live Inode Link Count Repair
5e5ada746aad79 Darrick J. Wong 2023-03-06   31   * ============================
5e5ada746aad79 Darrick J. Wong 2023-03-06   32   *
5e5ada746aad79 Darrick J. Wong 2023-03-06   33   * Use the live inode link count information that we collected to replace the
5e5ada746aad79 Darrick J. Wong 2023-03-06   34   * nlink values of the incore inodes.  A scrub->repair cycle should have left
5e5ada746aad79 Darrick J. Wong 2023-03-06   35   * the live data and hooks active, so this is safe so long as we make sure the
5e5ada746aad79 Darrick J. Wong 2023-03-06   36   * inode is locked.
5e5ada746aad79 Darrick J. Wong 2023-03-06   37   */
5e5ada746aad79 Darrick J. Wong 2023-03-06   38  
5e5ada746aad79 Darrick J. Wong 2023-03-06   39  /*
5e5ada746aad79 Darrick J. Wong 2023-03-06   40   * Correct the link count of the given inode.  Because we have to grab locks
5e5ada746aad79 Darrick J. Wong 2023-03-06   41   * and resources in a certain order, it's possible that this will be a no-op.
5e5ada746aad79 Darrick J. Wong 2023-03-06   42   */
5e5ada746aad79 Darrick J. Wong 2023-03-06   43  STATIC int
5e5ada746aad79 Darrick J. Wong 2023-03-06   44  xrep_nlinks_repair_inode(
5e5ada746aad79 Darrick J. Wong 2023-03-06   45  	struct xchk_nlink_ctrs	*xnc)
5e5ada746aad79 Darrick J. Wong 2023-03-06   46  {
5e5ada746aad79 Darrick J. Wong 2023-03-06   47  	struct xchk_nlink	obs;
5e5ada746aad79 Darrick J. Wong 2023-03-06   48  	struct xfs_scrub	*sc = xnc->sc;
5e5ada746aad79 Darrick J. Wong 2023-03-06   49  	struct xfs_mount	*mp = sc->mp;
5e5ada746aad79 Darrick J. Wong 2023-03-06   50  	struct xfs_inode	*ip = sc->ip;
5e5ada746aad79 Darrick J. Wong 2023-03-06   51  	uint64_t		total_links;
5e5ada746aad79 Darrick J. Wong 2023-03-06   52  	uint64_t		actual_nlink;
5e5ada746aad79 Darrick J. Wong 2023-03-06   53  	bool			dirty = false;
5e5ada746aad79 Darrick J. Wong 2023-03-06   54  	int			error;
5e5ada746aad79 Darrick J. Wong 2023-03-06   55  
5e5ada746aad79 Darrick J. Wong 2023-03-06   56  	xchk_ilock(sc, XFS_IOLOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06   57  
5e5ada746aad79 Darrick J. Wong 2023-03-06   58  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_link, 0, 0, 0, &sc->tp);
5e5ada746aad79 Darrick J. Wong 2023-03-06   59  	if (error)
5e5ada746aad79 Darrick J. Wong 2023-03-06   60  		goto out_iolock;
5e5ada746aad79 Darrick J. Wong 2023-03-06   61  
5e5ada746aad79 Darrick J. Wong 2023-03-06   62  	xchk_ilock(sc, XFS_ILOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06   63  	xfs_trans_ijoin(sc->tp, ip, 0);
5e5ada746aad79 Darrick J. Wong 2023-03-06   64  
5e5ada746aad79 Darrick J. Wong 2023-03-06   65  	mutex_lock(&xnc->lock);
5e5ada746aad79 Darrick J. Wong 2023-03-06   66  
5e5ada746aad79 Darrick J. Wong 2023-03-06   67  	if (xchk_iscan_aborted(&xnc->collect_iscan)) {
5e5ada746aad79 Darrick J. Wong 2023-03-06   68  		error = -ECANCELED;
5e5ada746aad79 Darrick J. Wong 2023-03-06   69  		goto out_scanlock;
5e5ada746aad79 Darrick J. Wong 2023-03-06   70  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06   71  
5e5ada746aad79 Darrick J. Wong 2023-03-06   72  	error = xfarray_load_sparse(xnc->nlinks, ip->i_ino, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06   73  	if (error)
5e5ada746aad79 Darrick J. Wong 2023-03-06   74  		goto out_scanlock;
5e5ada746aad79 Darrick J. Wong 2023-03-06   75  
5e5ada746aad79 Darrick J. Wong 2023-03-06   76  	/*
5e5ada746aad79 Darrick J. Wong 2023-03-06   77  	 * We're done accessing the shared scan data, so we can drop the lock.
5e5ada746aad79 Darrick J. Wong 2023-03-06   78  	 * We still hold @ip's ILOCK, so its link count cannot change.
5e5ada746aad79 Darrick J. Wong 2023-03-06   79  	 */
5e5ada746aad79 Darrick J. Wong 2023-03-06   80  	mutex_unlock(&xnc->lock);
5e5ada746aad79 Darrick J. Wong 2023-03-06   81  
5e5ada746aad79 Darrick J. Wong 2023-03-06   82  	total_links = xchk_nlink_total(&obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06   83  	actual_nlink = VFS_I(ip)->i_nlink;
5e5ada746aad79 Darrick J. Wong 2023-03-06   84  
5e5ada746aad79 Darrick J. Wong 2023-03-06   85  	/*
5e5ada746aad79 Darrick J. Wong 2023-03-06   86  	 * Cannot set more than the maxiumum possible link count.  We won't
5e5ada746aad79 Darrick J. Wong 2023-03-06   87  	 * touch this file, but we don't want to abort the entire operation.
5e5ada746aad79 Darrick J. Wong 2023-03-06   88  	 */
5e5ada746aad79 Darrick J. Wong 2023-03-06   89  	if (total_links > U32_MAX) {
5e5ada746aad79 Darrick J. Wong 2023-03-06   90  		trace_xrep_nlinks_unfixable_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  @91  		goto out_trans;
5e5ada746aad79 Darrick J. Wong 2023-03-06   92  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06   93  
5e5ada746aad79 Darrick J. Wong 2023-03-06   94  	/*
5e5ada746aad79 Darrick J. Wong 2023-03-06   95  	 * Linked directories should have at least one "child" (the dot entry)
5e5ada746aad79 Darrick J. Wong 2023-03-06   96  	 * pointing up to them.
5e5ada746aad79 Darrick J. Wong 2023-03-06   97  	 */
5e5ada746aad79 Darrick J. Wong 2023-03-06   98  	if (S_ISDIR(VFS_I(ip)->i_mode) && actual_nlink > 0 &&
5e5ada746aad79 Darrick J. Wong 2023-03-06   99  					  obs.children == 0) {
5e5ada746aad79 Darrick J. Wong 2023-03-06  100  		trace_xrep_nlinks_unfixable_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  101  		goto out_trans;
5e5ada746aad79 Darrick J. Wong 2023-03-06  102  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06  103  
5e5ada746aad79 Darrick J. Wong 2023-03-06  104  	/* Non-directories cannot have directories pointing up to them. */
5e5ada746aad79 Darrick J. Wong 2023-03-06  105  	if (!S_ISDIR(VFS_I(ip)->i_mode) && obs.children != 0) {
5e5ada746aad79 Darrick J. Wong 2023-03-06  106  		trace_xrep_nlinks_unfixable_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  107  		goto out_trans;
5e5ada746aad79 Darrick J. Wong 2023-03-06  108  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06  109  
5e5ada746aad79 Darrick J. Wong 2023-03-06  110  	/*
5e5ada746aad79 Darrick J. Wong 2023-03-06  111  	 * We did not find any links to this inode.  If the inode agrees, we
5e5ada746aad79 Darrick J. Wong 2023-03-06  112  	 * have nothing further to do.  If not, the inode has a nonzero link
5e5ada746aad79 Darrick J. Wong 2023-03-06  113  	 * count and we don't have anywhere to graft the child onto.  Dropping
5e5ada746aad79 Darrick J. Wong 2023-03-06  114  	 * a live inode's link count to zero can cause unexpected shutdowns in
5e5ada746aad79 Darrick J. Wong 2023-03-06  115  	 * inactivation, so leave it alone.
5e5ada746aad79 Darrick J. Wong 2023-03-06  116  	 */
5e5ada746aad79 Darrick J. Wong 2023-03-06  117  	if (total_links == 0) {
5e5ada746aad79 Darrick J. Wong 2023-03-06  118  		if (actual_nlink != 0)
5e5ada746aad79 Darrick J. Wong 2023-03-06  119  			trace_xrep_nlinks_unfixable_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  120  		goto out_trans;
5e5ada746aad79 Darrick J. Wong 2023-03-06  121  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06  122  
5e5ada746aad79 Darrick J. Wong 2023-03-06  123  	/* Commit the new link count if it changed. */
5e5ada746aad79 Darrick J. Wong 2023-03-06  124  	if (total_links != actual_nlink) {
5e5ada746aad79 Darrick J. Wong 2023-03-06  125  		trace_xrep_nlinks_update_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  126  		set_nlink(VFS_I(ip), total_links);
5e5ada746aad79 Darrick J. Wong 2023-03-06  127  		dirty = true;
5e5ada746aad79 Darrick J. Wong 2023-03-06  128  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06  129  
5e5ada746aad79 Darrick J. Wong 2023-03-06  130  	if (!dirty)
5e5ada746aad79 Darrick J. Wong 2023-03-06  131  		goto out_trans;
5e5ada746aad79 Darrick J. Wong 2023-03-06  132  
5e5ada746aad79 Darrick J. Wong 2023-03-06  133  	xfs_trans_log_inode(sc->tp, ip, XFS_ILOG_CORE);
5e5ada746aad79 Darrick J. Wong 2023-03-06  134  
5e5ada746aad79 Darrick J. Wong 2023-03-06  135  	error = xrep_trans_commit(sc);
5e5ada746aad79 Darrick J. Wong 2023-03-06  136  	if (error)
5e5ada746aad79 Darrick J. Wong 2023-03-06  137  		goto out_ilock;
5e5ada746aad79 Darrick J. Wong 2023-03-06  138  
5e5ada746aad79 Darrick J. Wong 2023-03-06  139  	xchk_iunlock(sc, XFS_ILOCK_EXCL | XFS_IOLOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06  140  	return 0;
5e5ada746aad79 Darrick J. Wong 2023-03-06  141  
5e5ada746aad79 Darrick J. Wong 2023-03-06  142  out_scanlock:
5e5ada746aad79 Darrick J. Wong 2023-03-06  143  	mutex_unlock(&xnc->lock);
5e5ada746aad79 Darrick J. Wong 2023-03-06  144  out_trans:
5e5ada746aad79 Darrick J. Wong 2023-03-06  145  	xchk_trans_cancel(sc);
5e5ada746aad79 Darrick J. Wong 2023-03-06  146  out_ilock:
5e5ada746aad79 Darrick J. Wong 2023-03-06  147  	xchk_iunlock(sc, XFS_ILOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06  148  out_iolock:
5e5ada746aad79 Darrick J. Wong 2023-03-06  149  	xchk_iunlock(sc, XFS_IOLOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06  150  	return error;
5e5ada746aad79 Darrick J. Wong 2023-03-06  151  }
5e5ada746aad79 Darrick J. Wong 2023-03-06  152  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
