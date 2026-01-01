Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9D27145F
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 23:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767310493; cv=none; b=h3IRBLm5RAvpa41a3UpLTfOP8KXJSj7wvVFiSagfxflLYmhLBMf3X9i/oEeFCn+HM0MW554Vyk40AEm9kRyAxkyU1X/t0KJtPqCp8mcfbBhh2U+W072MEEwuBgmeTvYr7TabR0tUPJqh5u7ZtnyUpv0kYBG8yc9c0vdLYNQS5VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767310493; c=relaxed/simple;
	bh=BnyavHII3uYtX0j6HROqZT0nrJJUZTVIOmCHyNnsEng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kgn2NA09WzWKI/1Va4WD5lnrjge1yBXOTtmzXgLvCFAY9ijqIgGFhFFqZPYxFezxRzKBbuJ0E0BFJwTnT1IH4waOIR083YJYnzEDoEAe7eKYTUz9sqAmA/mRrjZNChBbRyBlpi2fzs6YMhaiNhHDdIeGPrIkjbQe+TEq8mGZdDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dg3aACeW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dg3aACeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767310491; x=1798846491;
  h=date:from:to:cc:subject:message-id;
  bh=BnyavHII3uYtX0j6HROqZT0nrJJUZTVIOmCHyNnsEng=;
  b=dg3aACeWKpLa6kzul6CIp+BeFieyz27fW37VZgSfJxeszc16Ei7EiMKK
   r0vPaiDP/Ba9zYQbHXtx0Rrhvv3SgQR/OHRqaJNPPCh21EQorNMdjGu1p
   XsfihTvvmZgKQ+YBANSO/8CHkHtcSCSB9A0dB1opIjmvQjt/iwN5PSqHs
   OHnp7fmI0vd+UsZZ4lyxlLERsvJKGl+np5oLvNMEU1/kql0NaIPwzk/Pb
   qEdu0L4n3WA/JdMzuvhr+5wsL623/D8t+/4AG69KSMs0tAxmSLvCPx4Iv
   SpFouNru6knT6gDRVm/AA2ivnJXmzWprTskD2niSYAFi3q1lSBOiDxAO/
   w==;
X-CSE-ConnectionGUID: 67agbLAQR4u2IC1gQQjDUw==
X-CSE-MsgGUID: 8XrF5RnuRbuunhvjiryNUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67834848"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="67834848"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 15:34:50 -0800
X-CSE-ConnectionGUID: +UzY2a4KSOeXK4W61NkQGw==
X-CSE-MsgGUID: nluodugjR/WdYopw5tkRpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="206234479"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jan 2026 15:34:49 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbSBr-0000000023f-0ABJ;
	Thu, 01 Jan 2026 23:34:47 +0000
Date: Fri, 02 Jan 2026 07:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/xfs_zone_gc.c:324:33-34: WARNING opportunity for
 min()
Message-ID: <202601020750.7rJA0WTv-lkp@intel.com>
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
CC: Hans Holmberg <hans.holmberg@wdc.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 080d01c41d44f0993f2c235a6bfdb681f0a66be6 xfs: implement zoned garbage collection
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601020750.7rJA0WTv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601020750.7rJA0WTv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_gc.c:324:33-34: WARNING opportunity for min()

vim +324 fs/xfs/xfs_zone_gc.c

080d01c41d44f0 Christoph Hellwig 2025-02-15  291  
080d01c41d44f0 Christoph Hellwig 2025-02-15  292  static int
080d01c41d44f0 Christoph Hellwig 2025-02-15  293  xfs_zone_gc_query(
080d01c41d44f0 Christoph Hellwig 2025-02-15  294  	struct xfs_mount	*mp,
080d01c41d44f0 Christoph Hellwig 2025-02-15  295  	struct xfs_zone_gc_iter	*iter)
080d01c41d44f0 Christoph Hellwig 2025-02-15  296  {
080d01c41d44f0 Christoph Hellwig 2025-02-15  297  	struct xfs_rtgroup	*rtg = iter->victim_rtg;
080d01c41d44f0 Christoph Hellwig 2025-02-15  298  	struct xfs_rmap_irec	ri_low = { };
080d01c41d44f0 Christoph Hellwig 2025-02-15  299  	struct xfs_rmap_irec	ri_high;
080d01c41d44f0 Christoph Hellwig 2025-02-15  300  	struct xfs_btree_cur	*cur;
080d01c41d44f0 Christoph Hellwig 2025-02-15  301  	struct xfs_trans	*tp;
080d01c41d44f0 Christoph Hellwig 2025-02-15  302  	int			error;
080d01c41d44f0 Christoph Hellwig 2025-02-15  303  
080d01c41d44f0 Christoph Hellwig 2025-02-15  304  	ASSERT(iter->next_startblock <= rtg_blocks(rtg));
080d01c41d44f0 Christoph Hellwig 2025-02-15  305  	if (iter->next_startblock == rtg_blocks(rtg))
080d01c41d44f0 Christoph Hellwig 2025-02-15  306  		goto done;
080d01c41d44f0 Christoph Hellwig 2025-02-15  307  
080d01c41d44f0 Christoph Hellwig 2025-02-15  308  	ASSERT(iter->next_startblock < rtg_blocks(rtg));
080d01c41d44f0 Christoph Hellwig 2025-02-15  309  	ri_low.rm_startblock = iter->next_startblock;
080d01c41d44f0 Christoph Hellwig 2025-02-15  310  	memset(&ri_high, 0xFF, sizeof(ri_high));
080d01c41d44f0 Christoph Hellwig 2025-02-15  311  
080d01c41d44f0 Christoph Hellwig 2025-02-15  312  	iter->rec_idx = 0;
080d01c41d44f0 Christoph Hellwig 2025-02-15  313  	iter->rec_count = 0;
080d01c41d44f0 Christoph Hellwig 2025-02-15  314  
080d01c41d44f0 Christoph Hellwig 2025-02-15  315  	error = xfs_trans_alloc_empty(mp, &tp);
080d01c41d44f0 Christoph Hellwig 2025-02-15  316  	if (error)
080d01c41d44f0 Christoph Hellwig 2025-02-15  317  		return error;
080d01c41d44f0 Christoph Hellwig 2025-02-15  318  
080d01c41d44f0 Christoph Hellwig 2025-02-15  319  	xfs_rtgroup_lock(rtg, XFS_RTGLOCK_RMAP);
080d01c41d44f0 Christoph Hellwig 2025-02-15  320  	cur = xfs_rtrmapbt_init_cursor(tp, rtg);
080d01c41d44f0 Christoph Hellwig 2025-02-15  321  	error = xfs_rmap_query_range(cur, &ri_low, &ri_high,
080d01c41d44f0 Christoph Hellwig 2025-02-15  322  			xfs_zone_gc_query_cb, iter);
080d01c41d44f0 Christoph Hellwig 2025-02-15  323  	xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_RMAP);
080d01c41d44f0 Christoph Hellwig 2025-02-15 @324  	xfs_btree_del_cursor(cur, error < 0 ? error : 0);
080d01c41d44f0 Christoph Hellwig 2025-02-15  325  	xfs_trans_cancel(tp);
080d01c41d44f0 Christoph Hellwig 2025-02-15  326  
080d01c41d44f0 Christoph Hellwig 2025-02-15  327  	if (error < 0)
080d01c41d44f0 Christoph Hellwig 2025-02-15  328  		return error;
080d01c41d44f0 Christoph Hellwig 2025-02-15  329  
080d01c41d44f0 Christoph Hellwig 2025-02-15  330  	/*
080d01c41d44f0 Christoph Hellwig 2025-02-15  331  	 * Sort the rmap records by inode number and increasing offset to
080d01c41d44f0 Christoph Hellwig 2025-02-15  332  	 * defragment the mappings.
080d01c41d44f0 Christoph Hellwig 2025-02-15  333  	 *
080d01c41d44f0 Christoph Hellwig 2025-02-15  334  	 * This could be further enhanced by an even bigger look ahead window,
080d01c41d44f0 Christoph Hellwig 2025-02-15  335  	 * but that's better left until we have better detection of changes to
080d01c41d44f0 Christoph Hellwig 2025-02-15  336  	 * inode mapping to avoid the potential of GCing already dead data.
080d01c41d44f0 Christoph Hellwig 2025-02-15  337  	 */
080d01c41d44f0 Christoph Hellwig 2025-02-15  338  	sort(iter->recs, iter->rec_count, sizeof(iter->recs[0]),
080d01c41d44f0 Christoph Hellwig 2025-02-15  339  			xfs_zone_gc_rmap_rec_cmp, NULL);
080d01c41d44f0 Christoph Hellwig 2025-02-15  340  
080d01c41d44f0 Christoph Hellwig 2025-02-15  341  	if (error == 0) {
080d01c41d44f0 Christoph Hellwig 2025-02-15  342  		/*
080d01c41d44f0 Christoph Hellwig 2025-02-15  343  		 * We finished iterating through the zone.
080d01c41d44f0 Christoph Hellwig 2025-02-15  344  		 */
080d01c41d44f0 Christoph Hellwig 2025-02-15  345  		iter->next_startblock = rtg_blocks(rtg);
080d01c41d44f0 Christoph Hellwig 2025-02-15  346  		if (iter->rec_count == 0)
080d01c41d44f0 Christoph Hellwig 2025-02-15  347  			goto done;
080d01c41d44f0 Christoph Hellwig 2025-02-15  348  	}
080d01c41d44f0 Christoph Hellwig 2025-02-15  349  
080d01c41d44f0 Christoph Hellwig 2025-02-15  350  	return 0;
080d01c41d44f0 Christoph Hellwig 2025-02-15  351  done:
080d01c41d44f0 Christoph Hellwig 2025-02-15  352  	xfs_rtgroup_rele(iter->victim_rtg);
080d01c41d44f0 Christoph Hellwig 2025-02-15  353  	iter->victim_rtg = NULL;
080d01c41d44f0 Christoph Hellwig 2025-02-15  354  	return 0;
080d01c41d44f0 Christoph Hellwig 2025-02-15  355  }
080d01c41d44f0 Christoph Hellwig 2025-02-15  356  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
