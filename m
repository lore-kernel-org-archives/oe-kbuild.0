Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5321946BC
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733302321; cv=none; b=D9Q48gL4D5PvPI53mllvWfj3hO3hYmskuCJKnFEQYLSLfHbUTX5kWk4aGSQi0YefCwTpr8bAueP3F0Yp38IYPxnYV3guIf2vyph4sQiJ26Q1IePskWZyVvyFPpOUedvP3K5wx8ntESwFu3/d0DCp7kMrlK1Ce0292VwkhEKnHEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733302321; c=relaxed/simple;
	bh=Dx4SI4xSy+1D8X/Sux+q7sPR4tsIsE+ZEHJVNo8vMoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SLh2xp9P6iukAeJq8wwjxxNbxFATEIhRDJxcUmImDIISZC3ohcWbyMYNH6Ylp+mBKYwqIfhbn5WERaUWQwAFYjhZLnOIO/Oduf9Y2bQ0Tor/QAkC0bDIy3We3I3SVQQaGJ3u8h9yitnhr87zE3R21B/XAq6c8+0M8yYe6caual8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Opox/arp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Opox/arp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733302319; x=1764838319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dx4SI4xSy+1D8X/Sux+q7sPR4tsIsE+ZEHJVNo8vMoo=;
  b=Opox/arpIBF8yIXj6tbO+ZAwBp0KBtaOtkc6+t87VkMqRGHxAD33OxBs
   mLiDhhWWot6yuoY1LGkzupummTQ34eiNiLnL8HrRJmK0f6EKRwWlDJux+
   VPpMgkNBEIWF6FQIudgCQ4QnbZBCpbzO80hVVJ41fq16EhdvV5DXwFpfs
   FWvRq65CPz6B6WIqyJRnTB3CsCdXiCwjxI4xPCg3c7dOpFWII0/z3nxjX
   uoPVBytuKls+8jdewTi2zthBkKW+KpNrooDHCZmCE1h8YzfuPpOh7AnIc
   SaKHR75xft9MtSkYfqHpb0PMroB/at8uGTmYAkDD9CKK3hgaDz1EqgpZI
   A==;
X-CSE-ConnectionGUID: cW1qoivqRWmCsPt6QesH4Q==
X-CSE-MsgGUID: jsv57cfeQXeOLDc9kCvA1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="56041185"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="56041185"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 00:51:58 -0800
X-CSE-ConnectionGUID: jTAv/icMSeei52snbwiuag==
X-CSE-MsgGUID: XFGu7OBvSq242NInGlSQPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="98721017"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Dec 2024 00:51:57 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIl6w-0002nF-1I;
	Wed, 04 Dec 2024 08:51:54 +0000
Date: Wed, 4 Dec 2024 16:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/xfs_log_cil.c:897:1-10: second lock on line 900
Message-ID: <202412041955.WNw2dKDo-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Chandan Babu R <chandanrlinux@gmail.com>
CC: Allison Henderson <allison.henderson@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: eef983ffeae7a1cdde8c3338155ae2dd74b8621b xfs: journal IO cache flush reductions
date:   3 years, 5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 years, 5 months ago
config: x86_64-randconfig-104-20241115 (https://download.01.org/0day-ci/archive/20241204/202412041955.WNw2dKDo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412041955.WNw2dKDo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_log_cil.c:897:1-10: second lock on line 900

vim +897 fs/xfs/xfs_log_cil.c

89ae379d564c5d Christoph Hellwig 2019-06-28  625  
71e330b593905e Dave Chinner      2010-05-21  626  /*
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  627   * Push the Committed Item List to the log.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  628   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  629   * If the current sequence is the same as xc_push_seq we need to do a flush. If
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  630   * xc_push_seq is less than the current sequence, then it has already been
a44f13edf0ebb4 Dave Chinner      2010-08-24  631   * flushed and we don't need to do anything - the caller will wait for it to
a44f13edf0ebb4 Dave Chinner      2010-08-24  632   * complete if necessary.
a44f13edf0ebb4 Dave Chinner      2010-08-24  633   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  634   * xc_push_seq is checked unlocked against the sequence number for a match.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  635   * Hence we can allow log forces to run racily and not issue pushes for the
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  636   * same sequence twice.  If we get a race between multiple pushes for the same
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  637   * sequence they will block on the first one and then abort, hence avoiding
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  638   * needless pushes.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  639   */
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  640  static void
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  641  xlog_cil_push_work(
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  642  	struct work_struct	*work)
71e330b593905e Dave Chinner      2010-05-21  643  {
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  644  	struct xfs_cil		*cil =
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  645  		container_of(work, struct xfs_cil, xc_push_work);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  646  	struct xlog		*log = cil->xc_log;
71e330b593905e Dave Chinner      2010-05-21  647  	struct xfs_log_vec	*lv;
71e330b593905e Dave Chinner      2010-05-21  648  	struct xfs_cil_ctx	*ctx;
71e330b593905e Dave Chinner      2010-05-21  649  	struct xfs_cil_ctx	*new_ctx;
71e330b593905e Dave Chinner      2010-05-21  650  	struct xlog_in_core	*commit_iclog;
71e330b593905e Dave Chinner      2010-05-21  651  	struct xlog_ticket	*tic;
71e330b593905e Dave Chinner      2010-05-21  652  	int			num_iovecs;
71e330b593905e Dave Chinner      2010-05-21  653  	int			error = 0;
71e330b593905e Dave Chinner      2010-05-21  654  	struct xfs_trans_header thdr;
71e330b593905e Dave Chinner      2010-05-21  655  	struct xfs_log_iovec	lhdr;
71e330b593905e Dave Chinner      2010-05-21  656  	struct xfs_log_vec	lvhdr = { NULL };
71e330b593905e Dave Chinner      2010-05-21  657  	xfs_lsn_t		commit_lsn;
4c2d542f2e7865 Dave Chinner      2012-04-23  658  	xfs_lsn_t		push_seq;
bad77c375e8de6 Dave Chinner      2021-06-18  659  	struct bio		bio;
bad77c375e8de6 Dave Chinner      2021-06-18  660  	DECLARE_COMPLETION_ONSTACK(bdev_flush);
71e330b593905e Dave Chinner      2010-05-21  661  
707e0ddaf67e89 Tetsuo Handa      2019-08-26  662  	new_ctx = kmem_zalloc(sizeof(*new_ctx), KM_NOFS);
71e330b593905e Dave Chinner      2010-05-21  663  	new_ctx->ticket = xlog_cil_ticket_alloc(log);
71e330b593905e Dave Chinner      2010-05-21  664  
71e330b593905e Dave Chinner      2010-05-21  665  	down_write(&cil->xc_ctx_lock);
71e330b593905e Dave Chinner      2010-05-21  666  	ctx = cil->xc_ctx;
71e330b593905e Dave Chinner      2010-05-21  667  
4bb928cdb900d0 Dave Chinner      2013-08-12  668  	spin_lock(&cil->xc_push_lock);
4c2d542f2e7865 Dave Chinner      2012-04-23  669  	push_seq = cil->xc_push_seq;
4c2d542f2e7865 Dave Chinner      2012-04-23  670  	ASSERT(push_seq <= ctx->sequence);
71e330b593905e Dave Chinner      2010-05-21  671  
0e7ab7efe77451 Dave Chinner      2020-03-24  672  	/*
0e7ab7efe77451 Dave Chinner      2020-03-24  673  	 * Wake up any background push waiters now this context is being pushed.
0e7ab7efe77451 Dave Chinner      2020-03-24  674  	 */
c7f87f3984cfa1 Dave Chinner      2020-06-16  675  	if (ctx->space_used >= XLOG_CIL_BLOCKING_SPACE_LIMIT(log))
c7f87f3984cfa1 Dave Chinner      2020-06-16  676  		wake_up_all(&cil->xc_push_wait);
0e7ab7efe77451 Dave Chinner      2020-03-24  677  
4c2d542f2e7865 Dave Chinner      2012-04-23  678  	/*
4c2d542f2e7865 Dave Chinner      2012-04-23  679  	 * Check if we've anything to push. If there is nothing, then we don't
4c2d542f2e7865 Dave Chinner      2012-04-23  680  	 * move on to a new sequence number and so we have to be able to push
4c2d542f2e7865 Dave Chinner      2012-04-23  681  	 * this sequence again later.
4c2d542f2e7865 Dave Chinner      2012-04-23  682  	 */
4c2d542f2e7865 Dave Chinner      2012-04-23  683  	if (list_empty(&cil->xc_cil)) {
4c2d542f2e7865 Dave Chinner      2012-04-23  684  		cil->xc_push_seq = 0;
4bb928cdb900d0 Dave Chinner      2013-08-12  685  		spin_unlock(&cil->xc_push_lock);
a44f13edf0ebb4 Dave Chinner      2010-08-24  686  		goto out_skip;
4c2d542f2e7865 Dave Chinner      2012-04-23  687  	}
4c2d542f2e7865 Dave Chinner      2012-04-23  688  
a44f13edf0ebb4 Dave Chinner      2010-08-24  689  
cf085a1b5d2214 Joe Perches       2019-11-07  690  	/* check for a previously pushed sequence */
8af3dcd3c89aef Dave Chinner      2014-09-23  691  	if (push_seq < cil->xc_ctx->sequence) {
8af3dcd3c89aef Dave Chinner      2014-09-23  692  		spin_unlock(&cil->xc_push_lock);
df806158b0f6eb Dave Chinner      2010-05-17  693  		goto out_skip;
8af3dcd3c89aef Dave Chinner      2014-09-23  694  	}
8af3dcd3c89aef Dave Chinner      2014-09-23  695  
8af3dcd3c89aef Dave Chinner      2014-09-23  696  	/*
8af3dcd3c89aef Dave Chinner      2014-09-23  697  	 * We are now going to push this context, so add it to the committing
8af3dcd3c89aef Dave Chinner      2014-09-23  698  	 * list before we do anything else. This ensures that anyone waiting on
8af3dcd3c89aef Dave Chinner      2014-09-23  699  	 * this push can easily detect the difference between a "push in
8af3dcd3c89aef Dave Chinner      2014-09-23  700  	 * progress" and "CIL is empty, nothing to do".
8af3dcd3c89aef Dave Chinner      2014-09-23  701  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23  702  	 * IOWs, a wait loop can now check for:
8af3dcd3c89aef Dave Chinner      2014-09-23  703  	 *	the current sequence not being found on the committing list;
8af3dcd3c89aef Dave Chinner      2014-09-23  704  	 *	an empty CIL; and
8af3dcd3c89aef Dave Chinner      2014-09-23  705  	 *	an unchanged sequence number
8af3dcd3c89aef Dave Chinner      2014-09-23  706  	 * to detect a push that had nothing to do and therefore does not need
8af3dcd3c89aef Dave Chinner      2014-09-23  707  	 * waiting on. If the CIL is not empty, we get put on the committing
8af3dcd3c89aef Dave Chinner      2014-09-23  708  	 * list before emptying the CIL and bumping the sequence number. Hence
8af3dcd3c89aef Dave Chinner      2014-09-23  709  	 * an empty CIL and an unchanged sequence number means we jumped out
8af3dcd3c89aef Dave Chinner      2014-09-23  710  	 * above after doing nothing.
8af3dcd3c89aef Dave Chinner      2014-09-23  711  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23  712  	 * Hence the waiter will either find the commit sequence on the
8af3dcd3c89aef Dave Chinner      2014-09-23  713  	 * committing list or the sequence number will be unchanged and the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23  714  	 * still dirty. In that latter case, the push has not yet started, and
8af3dcd3c89aef Dave Chinner      2014-09-23  715  	 * so the waiter will have to continue trying to check the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23  716  	 * committing list until it is found. In extreme cases of delay, the
8af3dcd3c89aef Dave Chinner      2014-09-23  717  	 * sequence may fully commit between the attempts the wait makes to wait
8af3dcd3c89aef Dave Chinner      2014-09-23  718  	 * on the commit sequence.
8af3dcd3c89aef Dave Chinner      2014-09-23  719  	 */
8af3dcd3c89aef Dave Chinner      2014-09-23  720  	list_add(&ctx->committing, &cil->xc_committing);
8af3dcd3c89aef Dave Chinner      2014-09-23  721  	spin_unlock(&cil->xc_push_lock);
df806158b0f6eb Dave Chinner      2010-05-17  722  
71e330b593905e Dave Chinner      2010-05-21  723  	/*
bad77c375e8de6 Dave Chinner      2021-06-18  724  	 * The CIL is stable at this point - nothing new will be added to it
bad77c375e8de6 Dave Chinner      2021-06-18  725  	 * because we hold the flush lock exclusively. Hence we can now issue
bad77c375e8de6 Dave Chinner      2021-06-18  726  	 * a cache flush to ensure all the completed metadata in the journal we
bad77c375e8de6 Dave Chinner      2021-06-18  727  	 * are about to overwrite is on stable storage.
bad77c375e8de6 Dave Chinner      2021-06-18  728  	 */
bad77c375e8de6 Dave Chinner      2021-06-18  729  	xfs_flush_bdev_async(&bio, log->l_mp->m_ddev_targp->bt_bdev,
bad77c375e8de6 Dave Chinner      2021-06-18  730  				&bdev_flush);
bad77c375e8de6 Dave Chinner      2021-06-18  731  
bad77c375e8de6 Dave Chinner      2021-06-18  732  	/*
bad77c375e8de6 Dave Chinner      2021-06-18  733  	 * Pull all the log vectors off the items in the CIL, and remove the
bad77c375e8de6 Dave Chinner      2021-06-18  734  	 * items from the CIL. We don't need the CIL lock here because it's only
bad77c375e8de6 Dave Chinner      2021-06-18  735  	 * needed on the transaction commit side which is currently locked out
bad77c375e8de6 Dave Chinner      2021-06-18  736  	 * by the flush lock.
71e330b593905e Dave Chinner      2010-05-21  737  	 */
71e330b593905e Dave Chinner      2010-05-21  738  	lv = NULL;
71e330b593905e Dave Chinner      2010-05-21  739  	num_iovecs = 0;
71e330b593905e Dave Chinner      2010-05-21  740  	while (!list_empty(&cil->xc_cil)) {
71e330b593905e Dave Chinner      2010-05-21  741  		struct xfs_log_item	*item;
71e330b593905e Dave Chinner      2010-05-21  742  
71e330b593905e Dave Chinner      2010-05-21  743  		item = list_first_entry(&cil->xc_cil,
71e330b593905e Dave Chinner      2010-05-21  744  					struct xfs_log_item, li_cil);
71e330b593905e Dave Chinner      2010-05-21  745  		list_del_init(&item->li_cil);
71e330b593905e Dave Chinner      2010-05-21  746  		if (!ctx->lv_chain)
71e330b593905e Dave Chinner      2010-05-21  747  			ctx->lv_chain = item->li_lv;
71e330b593905e Dave Chinner      2010-05-21  748  		else
71e330b593905e Dave Chinner      2010-05-21  749  			lv->lv_next = item->li_lv;
71e330b593905e Dave Chinner      2010-05-21  750  		lv = item->li_lv;
71e330b593905e Dave Chinner      2010-05-21  751  		item->li_lv = NULL;
71e330b593905e Dave Chinner      2010-05-21  752  		num_iovecs += lv->lv_niovecs;
71e330b593905e Dave Chinner      2010-05-21  753  	}
71e330b593905e Dave Chinner      2010-05-21  754  
71e330b593905e Dave Chinner      2010-05-21  755  	/*
71e330b593905e Dave Chinner      2010-05-21  756  	 * initialise the new context and attach it to the CIL. Then attach
c7f87f3984cfa1 Dave Chinner      2020-06-16  757  	 * the current context to the CIL committing list so it can be found
71e330b593905e Dave Chinner      2010-05-21  758  	 * during log forces to extract the commit lsn of the sequence that
71e330b593905e Dave Chinner      2010-05-21  759  	 * needs to be forced.
71e330b593905e Dave Chinner      2010-05-21  760  	 */
71e330b593905e Dave Chinner      2010-05-21  761  	INIT_LIST_HEAD(&new_ctx->committing);
71e330b593905e Dave Chinner      2010-05-21  762  	INIT_LIST_HEAD(&new_ctx->busy_extents);
71e330b593905e Dave Chinner      2010-05-21  763  	new_ctx->sequence = ctx->sequence + 1;
71e330b593905e Dave Chinner      2010-05-21  764  	new_ctx->cil = cil;
71e330b593905e Dave Chinner      2010-05-21  765  	cil->xc_ctx = new_ctx;
71e330b593905e Dave Chinner      2010-05-21  766  
71e330b593905e Dave Chinner      2010-05-21  767  	/*
71e330b593905e Dave Chinner      2010-05-21  768  	 * The switch is now done, so we can drop the context lock and move out
71e330b593905e Dave Chinner      2010-05-21  769  	 * of a shared context. We can't just go straight to the commit record,
71e330b593905e Dave Chinner      2010-05-21  770  	 * though - we need to synchronise with previous and future commits so
71e330b593905e Dave Chinner      2010-05-21  771  	 * that the commit records are correctly ordered in the log to ensure
71e330b593905e Dave Chinner      2010-05-21  772  	 * that we process items during log IO completion in the correct order.
71e330b593905e Dave Chinner      2010-05-21  773  	 *
71e330b593905e Dave Chinner      2010-05-21  774  	 * For example, if we get an EFI in one checkpoint and the EFD in the
71e330b593905e Dave Chinner      2010-05-21  775  	 * next (e.g. due to log forces), we do not want the checkpoint with
71e330b593905e Dave Chinner      2010-05-21  776  	 * the EFD to be committed before the checkpoint with the EFI.  Hence
71e330b593905e Dave Chinner      2010-05-21  777  	 * we must strictly order the commit records of the checkpoints so
71e330b593905e Dave Chinner      2010-05-21  778  	 * that: a) the checkpoint callbacks are attached to the iclogs in the
71e330b593905e Dave Chinner      2010-05-21  779  	 * correct order; and b) the checkpoints are replayed in correct order
71e330b593905e Dave Chinner      2010-05-21  780  	 * in log recovery.
71e330b593905e Dave Chinner      2010-05-21  781  	 *
71e330b593905e Dave Chinner      2010-05-21  782  	 * Hence we need to add this context to the committing context list so
71e330b593905e Dave Chinner      2010-05-21  783  	 * that higher sequences will wait for us to write out a commit record
71e330b593905e Dave Chinner      2010-05-21  784  	 * before they do.
f876e44603ad09 Dave Chinner      2014-02-27  785  	 *
f876e44603ad09 Dave Chinner      2014-02-27  786  	 * xfs_log_force_lsn requires us to mirror the new sequence into the cil
f876e44603ad09 Dave Chinner      2014-02-27  787  	 * structure atomically with the addition of this sequence to the
f876e44603ad09 Dave Chinner      2014-02-27  788  	 * committing list. This also ensures that we can do unlocked checks
f876e44603ad09 Dave Chinner      2014-02-27  789  	 * against the current sequence in log forces without risking
f876e44603ad09 Dave Chinner      2014-02-27  790  	 * deferencing a freed context pointer.
71e330b593905e Dave Chinner      2010-05-21  791  	 */
4bb928cdb900d0 Dave Chinner      2013-08-12  792  	spin_lock(&cil->xc_push_lock);
f876e44603ad09 Dave Chinner      2014-02-27  793  	cil->xc_current_sequence = new_ctx->sequence;
4bb928cdb900d0 Dave Chinner      2013-08-12  794  	spin_unlock(&cil->xc_push_lock);
71e330b593905e Dave Chinner      2010-05-21  795  	up_write(&cil->xc_ctx_lock);
71e330b593905e Dave Chinner      2010-05-21  796  
71e330b593905e Dave Chinner      2010-05-21  797  	/*
71e330b593905e Dave Chinner      2010-05-21  798  	 * Build a checkpoint transaction header and write it to the log to
71e330b593905e Dave Chinner      2010-05-21  799  	 * begin the transaction. We need to account for the space used by the
71e330b593905e Dave Chinner      2010-05-21  800  	 * transaction header here as it is not accounted for in xlog_write().
71e330b593905e Dave Chinner      2010-05-21  801  	 *
71e330b593905e Dave Chinner      2010-05-21  802  	 * The LSN we need to pass to the log items on transaction commit is
71e330b593905e Dave Chinner      2010-05-21  803  	 * the LSN reported by the first log vector write. If we use the commit
71e330b593905e Dave Chinner      2010-05-21  804  	 * record lsn then we can move the tail beyond the grant write head.
71e330b593905e Dave Chinner      2010-05-21  805  	 */
71e330b593905e Dave Chinner      2010-05-21  806  	tic = ctx->ticket;
71e330b593905e Dave Chinner      2010-05-21  807  	thdr.th_magic = XFS_TRANS_HEADER_MAGIC;
71e330b593905e Dave Chinner      2010-05-21  808  	thdr.th_type = XFS_TRANS_CHECKPOINT;
71e330b593905e Dave Chinner      2010-05-21  809  	thdr.th_tid = tic->t_tid;
71e330b593905e Dave Chinner      2010-05-21  810  	thdr.th_num_items = num_iovecs;
4e0d5f926b80b0 Christoph Hellwig 2010-06-23  811  	lhdr.i_addr = &thdr;
71e330b593905e Dave Chinner      2010-05-21  812  	lhdr.i_len = sizeof(xfs_trans_header_t);
71e330b593905e Dave Chinner      2010-05-21  813  	lhdr.i_type = XLOG_REG_TYPE_TRANSHDR;
71e330b593905e Dave Chinner      2010-05-21  814  	tic->t_curr_res -= lhdr.i_len + sizeof(xlog_op_header_t);
71e330b593905e Dave Chinner      2010-05-21  815  
71e330b593905e Dave Chinner      2010-05-21  816  	lvhdr.lv_niovecs = 1;
71e330b593905e Dave Chinner      2010-05-21  817  	lvhdr.lv_iovecp = &lhdr;
71e330b593905e Dave Chinner      2010-05-21  818  	lvhdr.lv_next = ctx->lv_chain;
71e330b593905e Dave Chinner      2010-05-21  819  
bad77c375e8de6 Dave Chinner      2021-06-18  820  	/*
bad77c375e8de6 Dave Chinner      2021-06-18  821  	 * Before we format and submit the first iclog, we have to ensure that
bad77c375e8de6 Dave Chinner      2021-06-18  822  	 * the metadata writeback ordering cache flush is complete.
bad77c375e8de6 Dave Chinner      2021-06-18  823  	 */
bad77c375e8de6 Dave Chinner      2021-06-18  824  	wait_for_completion(&bdev_flush);
bad77c375e8de6 Dave Chinner      2021-06-18  825  
3468bb1ca6e884 Dave Chinner      2021-06-18  826  	error = xlog_write(log, &lvhdr, tic, &ctx->start_lsn, NULL,
3468bb1ca6e884 Dave Chinner      2021-06-18  827  				XLOG_START_TRANS);
71e330b593905e Dave Chinner      2010-05-21  828  	if (error)
7db37c5e6575b2 Dave Chinner      2011-01-27  829  		goto out_abort_free_ticket;
71e330b593905e Dave Chinner      2010-05-21  830  
71e330b593905e Dave Chinner      2010-05-21  831  	/*
71e330b593905e Dave Chinner      2010-05-21  832  	 * now that we've written the checkpoint into the log, strictly
71e330b593905e Dave Chinner      2010-05-21  833  	 * order the commit records so replay will get them in the right order.
71e330b593905e Dave Chinner      2010-05-21  834  	 */
71e330b593905e Dave Chinner      2010-05-21  835  restart:
4bb928cdb900d0 Dave Chinner      2013-08-12  836  	spin_lock(&cil->xc_push_lock);
71e330b593905e Dave Chinner      2010-05-21  837  	list_for_each_entry(new_ctx, &cil->xc_committing, committing) {
ac983517ec5941 Dave Chinner      2014-05-07  838  		/*
ac983517ec5941 Dave Chinner      2014-05-07  839  		 * Avoid getting stuck in this loop because we were woken by the
ac983517ec5941 Dave Chinner      2014-05-07  840  		 * shutdown, but then went back to sleep once already in the
ac983517ec5941 Dave Chinner      2014-05-07  841  		 * shutdown state.
ac983517ec5941 Dave Chinner      2014-05-07  842  		 */
ac983517ec5941 Dave Chinner      2014-05-07  843  		if (XLOG_FORCED_SHUTDOWN(log)) {
ac983517ec5941 Dave Chinner      2014-05-07  844  			spin_unlock(&cil->xc_push_lock);
ac983517ec5941 Dave Chinner      2014-05-07  845  			goto out_abort_free_ticket;
ac983517ec5941 Dave Chinner      2014-05-07  846  		}
ac983517ec5941 Dave Chinner      2014-05-07  847  
71e330b593905e Dave Chinner      2010-05-21  848  		/*
71e330b593905e Dave Chinner      2010-05-21  849  		 * Higher sequences will wait for this one so skip them.
ac983517ec5941 Dave Chinner      2014-05-07  850  		 * Don't wait for our own sequence, either.
71e330b593905e Dave Chinner      2010-05-21  851  		 */
71e330b593905e Dave Chinner      2010-05-21  852  		if (new_ctx->sequence >= ctx->sequence)
71e330b593905e Dave Chinner      2010-05-21  853  			continue;
71e330b593905e Dave Chinner      2010-05-21  854  		if (!new_ctx->commit_lsn) {
71e330b593905e Dave Chinner      2010-05-21  855  			/*
71e330b593905e Dave Chinner      2010-05-21  856  			 * It is still being pushed! Wait for the push to
71e330b593905e Dave Chinner      2010-05-21  857  			 * complete, then start again from the beginning.
71e330b593905e Dave Chinner      2010-05-21  858  			 */
4bb928cdb900d0 Dave Chinner      2013-08-12  859  			xlog_wait(&cil->xc_commit_wait, &cil->xc_push_lock);
71e330b593905e Dave Chinner      2010-05-21  860  			goto restart;
71e330b593905e Dave Chinner      2010-05-21  861  		}
71e330b593905e Dave Chinner      2010-05-21  862  	}
4bb928cdb900d0 Dave Chinner      2013-08-12  863  	spin_unlock(&cil->xc_push_lock);
71e330b593905e Dave Chinner      2010-05-21  864  
f10e925def9a6d Dave Chinner      2020-03-25  865  	error = xlog_commit_record(log, tic, &commit_iclog, &commit_lsn);
dd401770b0ff68 Dave Chinner      2020-03-25  866  	if (error)
dd401770b0ff68 Dave Chinner      2020-03-25  867  		goto out_abort_free_ticket;
dd401770b0ff68 Dave Chinner      2020-03-25  868  
8b41e3f98e6ca1 Christoph Hellwig 2020-03-25  869  	xfs_log_ticket_ungrant(log, tic);
71e330b593905e Dave Chinner      2010-05-21  870  
89ae379d564c5d Christoph Hellwig 2019-06-28  871  	spin_lock(&commit_iclog->ic_callback_lock);
1858bb0bec612d Christoph Hellwig 2019-10-14  872  	if (commit_iclog->ic_state == XLOG_STATE_IOERROR) {
89ae379d564c5d Christoph Hellwig 2019-06-28  873  		spin_unlock(&commit_iclog->ic_callback_lock);
71e330b593905e Dave Chinner      2010-05-21  874  		goto out_abort;
89ae379d564c5d Christoph Hellwig 2019-06-28  875  	}
89ae379d564c5d Christoph Hellwig 2019-06-28  876  	ASSERT_ALWAYS(commit_iclog->ic_state == XLOG_STATE_ACTIVE ||
89ae379d564c5d Christoph Hellwig 2019-06-28  877  		      commit_iclog->ic_state == XLOG_STATE_WANT_SYNC);
89ae379d564c5d Christoph Hellwig 2019-06-28  878  	list_add_tail(&ctx->iclog_entry, &commit_iclog->ic_callbacks);
89ae379d564c5d Christoph Hellwig 2019-06-28  879  	spin_unlock(&commit_iclog->ic_callback_lock);
71e330b593905e Dave Chinner      2010-05-21  880  
71e330b593905e Dave Chinner      2010-05-21  881  	/*
71e330b593905e Dave Chinner      2010-05-21  882  	 * now the checkpoint commit is complete and we've attached the
71e330b593905e Dave Chinner      2010-05-21  883  	 * callbacks to the iclog we can assign the commit LSN to the context
71e330b593905e Dave Chinner      2010-05-21  884  	 * and wake up anyone who is waiting for the commit to complete.
71e330b593905e Dave Chinner      2010-05-21  885  	 */
4bb928cdb900d0 Dave Chinner      2013-08-12  886  	spin_lock(&cil->xc_push_lock);
71e330b593905e Dave Chinner      2010-05-21  887  	ctx->commit_lsn = commit_lsn;
eb40a87500ac2f Dave Chinner      2010-12-21  888  	wake_up_all(&cil->xc_commit_wait);
4bb928cdb900d0 Dave Chinner      2013-08-12  889  	spin_unlock(&cil->xc_push_lock);
71e330b593905e Dave Chinner      2010-05-21  890  
a79b28c284fd91 Dave Chinner      2021-06-18  891  	/*
a79b28c284fd91 Dave Chinner      2021-06-18  892  	 * If the checkpoint spans multiple iclogs, wait for all previous
eef983ffeae7a1 Dave Chinner      2021-06-18  893  	 * iclogs to complete before we submit the commit_iclog. In this case,
eef983ffeae7a1 Dave Chinner      2021-06-18  894  	 * the commit_iclog write needs to issue a pre-flush so that the
eef983ffeae7a1 Dave Chinner      2021-06-18  895  	 * ordering is correctly preserved down to stable storage.
a79b28c284fd91 Dave Chinner      2021-06-18  896  	 */
a79b28c284fd91 Dave Chinner      2021-06-18 @897  	spin_lock(&log->l_icloglock);
eef983ffeae7a1 Dave Chinner      2021-06-18  898  	if (ctx->start_lsn != commit_lsn) {
a79b28c284fd91 Dave Chinner      2021-06-18  899  		xlog_wait_on_iclog(commit_iclog->ic_prev);
eef983ffeae7a1 Dave Chinner      2021-06-18 @900  		spin_lock(&log->l_icloglock);
eef983ffeae7a1 Dave Chinner      2021-06-18  901  		commit_iclog->ic_flags |= XLOG_ICL_NEED_FLUSH;
a79b28c284fd91 Dave Chinner      2021-06-18  902  	}
a79b28c284fd91 Dave Chinner      2021-06-18  903  
eef983ffeae7a1 Dave Chinner      2021-06-18  904  	/*
eef983ffeae7a1 Dave Chinner      2021-06-18  905  	 * The commit iclog must be written to stable storage to guarantee
eef983ffeae7a1 Dave Chinner      2021-06-18  906  	 * journal IO vs metadata writeback IO is correctly ordered on stable
eef983ffeae7a1 Dave Chinner      2021-06-18  907  	 * storage.
eef983ffeae7a1 Dave Chinner      2021-06-18  908  	 */
eef983ffeae7a1 Dave Chinner      2021-06-18  909  	commit_iclog->ic_flags |= XLOG_ICL_NEED_FUA;
eef983ffeae7a1 Dave Chinner      2021-06-18  910  	xlog_state_release_iclog(log, commit_iclog);
eef983ffeae7a1 Dave Chinner      2021-06-18  911  	spin_unlock(&log->l_icloglock);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  912  	return;
71e330b593905e Dave Chinner      2010-05-21  913  
71e330b593905e Dave Chinner      2010-05-21  914  out_skip:
71e330b593905e Dave Chinner      2010-05-21  915  	up_write(&cil->xc_ctx_lock);
71e330b593905e Dave Chinner      2010-05-21  916  	xfs_log_ticket_put(new_ctx->ticket);
71e330b593905e Dave Chinner      2010-05-21  917  	kmem_free(new_ctx);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  918  	return;
71e330b593905e Dave Chinner      2010-05-21  919  
7db37c5e6575b2 Dave Chinner      2011-01-27  920  out_abort_free_ticket:
8b41e3f98e6ca1 Christoph Hellwig 2020-03-25  921  	xfs_log_ticket_ungrant(log, tic);
71e330b593905e Dave Chinner      2010-05-21  922  out_abort:
12e6a0f449d585 Christoph Hellwig 2020-03-20  923  	ASSERT(XLOG_FORCED_SHUTDOWN(log));
12e6a0f449d585 Christoph Hellwig 2020-03-20  924  	xlog_cil_committed(ctx);
4c2d542f2e7865 Dave Chinner      2012-04-23  925  }
4c2d542f2e7865 Dave Chinner      2012-04-23  926  

:::::: The code at line 897 was first introduced by commit
:::::: a79b28c284fd910bb291dbf307a26f4d432e88f3 xfs: separate CIL commit record IO

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
