Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025F4284888
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763231202; cv=none; b=HeV0h7VNNXGy+I14s3nwbiMBboRNCNw7dwJLUISavApgzpKJRwhmzeU7YXcR2Kh7Ns0DgnX+c/DvfpZcaGSHIc8IQCtB3ufS/0jTl9+eLaxqOCixWewM2Xw0G6FeKJwAi7iH1IOQAGw2r2KeSZtbDpGnvwAgSNiyeZ6Fu4cefgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763231202; c=relaxed/simple;
	bh=005P1snRXpSYFUFcn5RkLUJYyxgp4gmP5ex9UL/MJwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TWEZKB6AFBC5jcIEWHU5ffufgPdVJy3kEQY9ONdP2agbC78hZDXHdGZhmpsAom6gmiCCpEntTveNxBoWARDO3S3j8MaQ1drLVV9h4TG5slvdFDhbqLvn4tueqSB+qi7DC7coRBrqkz15op49qbk6g4ySMwU7oqNAtctlIuenWMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOB0em/S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOB0em/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763231201; x=1794767201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=005P1snRXpSYFUFcn5RkLUJYyxgp4gmP5ex9UL/MJwI=;
  b=AOB0em/Sr6o/pd5kCcoAfNQ9k1tWiZYXctHQr8tGwfDLI4zJY+HjA0Ei
   koWBk6pnLbaMz7yMRQ/CqjDJv24lNZ56N1SevKLk8rVFsTZDCjRSnFQWq
   UlWczQw5yKkrUyUYoOXO5i5jwbBzKkPmckWZzPXoHGBCR03f4XhPlVJnW
   EfbpBuqY4ilBwfPI8hhf8TOq71X/uSsJzPahX7jzBHmSP5pRcALtUN0Xt
   LurS8rO9sSmcjttkmJFhP9tQSV7ifkb6Ht1uHMZ8AKLmrFMH7L1I9ThZO
   GhpBO5veaLOpVZS6Z024av06/3gXToM3we6wHWNXt8EkoriRyZDKL+MO0
   g==;
X-CSE-ConnectionGUID: odsh5RENRSCpvZE+TjPqXw==
X-CSE-MsgGUID: C/S2G6qTSKWuztohKXbOZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65228884"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65228884"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 10:26:40 -0800
X-CSE-ConnectionGUID: zSEKINIBQaqUOSCP0REf5g==
X-CSE-MsgGUID: WCndHabKTkK44Pvo1C22dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="220959758"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Nov 2025 10:26:38 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKKyq-0008At-17;
	Sat, 15 Nov 2025 18:26:36 +0000
Date: Sun, 16 Nov 2025 02:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 7022/8918] fs/xfs/xfs_trans_dquot.c:696:5-15:
 second lock on line 704
Message-ID: <202511160221.O3Jq4Jwa-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Carlos Maiolino <cem@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f2995693867bfb26197b117cd55624ddc57582f
commit: 6129b088e1f10938b86f44948ad698b39dd19faa [7022/8918] xfs: remove xfs_dqunlock and friends
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: nios2-randconfig-r061-20251115 (https://download.01.org/0day-ci/archive/20251116/202511160221.O3Jq4Jwa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511160221.O3Jq4Jwa-lkp@intel.com/

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
