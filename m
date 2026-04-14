Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268D639B4B2
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776163426; cv=none; b=T/cNkKb9BTfPCZDoi/zEUduxeXSi3YASGAdwtuoQNvhf89Ycj7VYEQXPoW3r3YF8F0gsvUMT9mRngbtQrpYaFS6ZBIFhaIn3Jubi/s2akvd8S3JAhV1BbvWojHUZw+fQCOEo2kNBqASnJE/LllHhyD4HBtm7+E2lysw0256C6S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776163426; c=relaxed/simple;
	bh=GfPR0anFp5GlfUjCevQNmBg6Ho39yQtl6TlmavsfQIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o0Ps5k26cEhKIEIEqztK7UvCq/G3kVEg38Yht+Y0+h07kPxQslvRMMldU+yGoTgKyNk58mcdKIv3HORi+0VgiEa+S4M1b8O9y/O7kVm3YuwUNPmYPYk7YSGvHbUzkV7nB3b+90w87R5Y02YMrxWYyout3tS4yNWG6KesahWNWVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzPASp+g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzPASp+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776163420; x=1807699420;
  h=date:from:to:cc:subject:message-id;
  bh=GfPR0anFp5GlfUjCevQNmBg6Ho39yQtl6TlmavsfQIM=;
  b=AzPASp+g6e+0s3yvIO743Ef0Vi5cOPnOoY6Ccg3I41y9cZ9LdsL2JYSZ
   XzEIL9wpEjq04Rv0DHEdxLbt2oB5545hTDQgz9eua6goxeJpxR5faaa7R
   TW2XJgdWsLRJMCpNIJU/okftTF/vaKHDwF06EF1IFoFKex1bZK/RPWNy4
   E+bO5uYVR6X6ngiw1OLjJHgKUMOrXf9cV543uGn3UBTwgZK3orPUxIaVj
   wS57sd80W6MYcG8bulgq6mzjqtNyO7NiiheFhdjv0qnb1G3NO1FYjygzh
   X4TUvWzdubbG+XKQwztClbQsOdIy2olNvwfZ6rKIKyM78uhvLeblp8CjL
   g==;
X-CSE-ConnectionGUID: jAOUdruEQT+Xii6pd6FkGA==
X-CSE-MsgGUID: 2NhQEkzRSHKacnAh4HwZFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77297947"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77297947"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 03:43:36 -0700
X-CSE-ConnectionGUID: gtmHDgz2STyKTwBDTixzVA==
X-CSE-MsgGUID: Kic1DExPQRWkrHBy6QwSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="235018267"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Apr 2026 03:43:35 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCbEy-000000001MH-1lBC;
	Tue, 14 Apr 2026 10:43:32 +0000
Date: Tue, 14 Apr 2026 18:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/xfs_trans_dquot.c:696:5-15: second lock on line 704
Message-ID: <202604141823.3oSLI1nU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Carlos Maiolino <cem@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d60bc140158342716e13ff0f8aa65642f43ba053
commit: 6129b088e1f10938b86f44948ad698b39dd19faa xfs: remove xfs_dqunlock and friends
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: hexagon-randconfig-r063-20260413 (https://download.01.org/0day-ci/archive/20260414/202604141823.3oSLI1nU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6129b088e1f1 ("xfs: remove xfs_dqunlock and friends")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604141823.3oSLI1nU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_trans_dquot.c:696:5-15: second lock on line 704
   fs/xfs/xfs_trans_dquot.c:696:5-15: second lock on line 713
   fs/xfs/xfs_trans_dquot.c:704:5-15: second lock on line 713

vim +696 fs/xfs/xfs_trans_dquot.c

200491875ce144 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-02-22  653  
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  654  /*
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  655   * Release the reservations, and adjust the dquots accordingly.
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  656   * This is called only when the transaction is being aborted. If by
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  657   * any chance we have done dquot modifications incore (ie. deltas) already,
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  658   * we simply throw those away, since that's the expected behavior
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  659   * when a transaction is curtailed without a commit.
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  660   */
7d095257e32121 fs/xfs/quota/xfs_trans_dquot.c Christoph Hellwig   2009-06-08  661  void
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  662  xfs_trans_unreserve_and_mod_dquots(
07137e925fa951 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-12-02  663  	struct xfs_trans	*tp,
07137e925fa951 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-12-02  664  	bool			already_locked)
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  665  {
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  666  	int			i, j;
aefe69a45d8490 fs/xfs/xfs_trans_dquot.c       Pavel Reichl        2019-11-12  667  	struct xfs_dquot	*dqp;
078f4a7d31092a fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2019-04-17  668  	struct xfs_dqtrx	*qtrx, *qa;
667a9291c5b383 fs/xfs/xfs_trans_dquot.c       Thiago Farina       2012-11-12  669  	bool			locked;
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  670  
04a58620a17cb1 fs/xfs/xfs_trans_dquot.c       Kaixu Xia           2020-12-03  671  	if (!tp->t_dqinfo)
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  672  		return;
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  673  
0e6436d99e730f fs/xfs/xfs_trans_dquot.c       Chandra Seetharaman 2013-06-27  674  	for (j = 0; j < XFS_QM_TRANS_DQTYPES; j++) {
0e6436d99e730f fs/xfs/xfs_trans_dquot.c       Chandra Seetharaman 2013-06-27  675  		qa = tp->t_dqinfo->dqs[j];
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  676  
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  677  		for (i = 0; i < XFS_QM_TRANS_MAXDQS; i++) {
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  678  			qtrx = &qa[i];
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  679  			/*
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  680  			 * We assume that the array of dquots is filled
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  681  			 * sequentially, not sparsely.
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  682  			 */
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  683  			if ((dqp = qtrx->qt_dquot) == NULL)
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  684  				break;
200491875ce144 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-02-22  685  
200491875ce144 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-02-22  686  			xfs_trans_unreserve_and_mod_dquots_hook(tp, dqp);
200491875ce144 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-02-22  687  
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  688  			/*
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  689  			 * Unreserve the original reservation. We don't care
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  690  			 * about the number of blocks used field, or deltas.
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  691  			 * Also we don't bother to zero the fields.
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  692  			 */
07137e925fa951 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-12-02  693  			locked = already_locked;
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  694  			if (qtrx->qt_blk_res) {
07137e925fa951 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-12-02  695  				if (!locked) {
6129b088e1f109 fs/xfs/xfs_trans_dquot.c       Christoph Hellwig   2025-11-10 @696  					mutex_lock(&dqp->q_qlock);
667a9291c5b383 fs/xfs/xfs_trans_dquot.c       Thiago Farina       2012-11-12  697  					locked = true;
07137e925fa951 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-12-02  698  				}
784e80f5640db9 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2020-07-14  699  				dqp->q_blk.reserved -=
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  700  					(xfs_qcnt_t)qtrx->qt_blk_res;
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  701  			}
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  702  			if (qtrx->qt_ino_res) {
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  703  				if (!locked) {
6129b088e1f109 fs/xfs/xfs_trans_dquot.c       Christoph Hellwig   2025-11-10 @704  					mutex_lock(&dqp->q_qlock);
667a9291c5b383 fs/xfs/xfs_trans_dquot.c       Thiago Farina       2012-11-12  705  					locked = true;
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  706  				}
784e80f5640db9 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2020-07-14  707  				dqp->q_ino.reserved -=
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  708  					(xfs_qcnt_t)qtrx->qt_ino_res;
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  709  			}
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  710  
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  711  			if (qtrx->qt_rtblk_res) {
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  712  				if (!locked) {
6129b088e1f109 fs/xfs/xfs_trans_dquot.c       Christoph Hellwig   2025-11-10  713  					mutex_lock(&dqp->q_qlock);
667a9291c5b383 fs/xfs/xfs_trans_dquot.c       Thiago Farina       2012-11-12  714  					locked = true;
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  715  				}
784e80f5640db9 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2020-07-14  716  				dqp->q_rtb.reserved -=
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  717  					(xfs_qcnt_t)qtrx->qt_rtblk_res;
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  718  			}
07137e925fa951 fs/xfs/xfs_trans_dquot.c       Darrick J. Wong     2024-12-02  719  			if (locked && !already_locked)
6129b088e1f109 fs/xfs/xfs_trans_dquot.c       Christoph Hellwig   2025-11-10  720  				mutex_unlock(&dqp->q_qlock);
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  721  
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  722  		}
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  723  	}
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  724  }
^1da177e4c3f41 fs/xfs/quota/xfs_trans_dquot.c Linus Torvalds      2005-04-16  725  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
