Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E61DFF7
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732987421; cv=none; b=rSVnEwa4ZEKP5FTXOQqeM+SjfDQ/Tn4ptzsiVYxF4qtjE9/5ECgdhuXN0tj/2kObMt0ngQYT5kp4e76FP16T6epdf+wo4LItoVfVR4Idmcxh9Rsl+yURQKFiRhHrPZoXrTEQtrVaDeOEr1niYgZxKeYrpsRiWyR64zo3upFQlbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732987421; c=relaxed/simple;
	bh=qEe2ctbulO8LgUJMhv4ZJ/fX/Brxe8/VfhV9ljI7aXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=piHj0Cmlb79Q7VxUistRtZD/4vTvif/FSO6cXp186xVzOn5C/k2pLIBmyXCd9Vq2qXlPMGndUPc1feo4XyDOYQoOsWXIAJDTVFY2NMnb/aXqXmleNjueq+heD1tuaA37K7afygHIqGnwy0FfcXXzQtUauj6NKCsjDOLDX4Wh0uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfFKUd3d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfFKUd3d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732987419; x=1764523419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qEe2ctbulO8LgUJMhv4ZJ/fX/Brxe8/VfhV9ljI7aXU=;
  b=dfFKUd3diWOOJcQbHBU0r9UytQshPFNV9Pf2bk2irfANyPcDK8bf9oUJ
   VNHrM0FZaTPBayRmSqKW7oTX9Iq0Y6yCfmxqymFpXWP7rjm3bybv7tVhw
   qoHZgdCYzqYhbJJtkjlmBJk/X0OeeH2IZVwi95uvnTyQCY4D3FstWTfY4
   ki/vgOhuUmq1nhWICmGANIN7Ml2i7rhBXhuXxLXesRqcY8MdzgCI965G1
   V2TGdPyBMpRkDYOu0yBaU5a/YMM+8YwfRuVRHHKYAhRApZHv1VaZSTmCa
   Gd2xih5ZAdkPLxg0GdcxOhaVcsr+PtqbG4KagWmt+AHvvNG6Y/+UaTNSr
   A==;
X-CSE-ConnectionGUID: jCGnWlIPQBySSMBq61X41A==
X-CSE-MsgGUID: dLn1VyBTRiGRkU68tBsrkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="50591344"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="50591344"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 09:23:39 -0800
X-CSE-ConnectionGUID: 0DvqjvMzQW+3h89PE3qCEQ==
X-CSE-MsgGUID: FRfIifzwTp6NT2LSmXriyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92533049"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Nov 2024 09:23:36 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHRBl-0000rR-0V;
	Sat, 30 Nov 2024 17:23:29 +0000
Date: Sun, 1 Dec 2024 01:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [hch-xfs:xfs-zoned-streams 32/52] fs/xfs/xfs_zone_gc.c:432:33-34:
 WARNING opportunity for min()
Message-ID: <202412010116.OetB8dCl-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-streams
head:   a1e1cce6a19aa017c7dd40925628b520af3dfcd0
commit: 1b9104b51569dbccbeb66612746279b40fe10b62 [32/52] xfs: support zoned RT devices
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-103-20241117 (https://download.01.org/0day-ci/archive/20241201/202412010116.OetB8dCl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412010116.OetB8dCl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_zone_gc.c:432:33-34: WARNING opportunity for min()

vim +432 fs/xfs/xfs_zone_gc.c

1b9104b51569db Christoph Hellwig 2024-11-05  399  
1b9104b51569db Christoph Hellwig 2024-11-05  400  static int
1b9104b51569db Christoph Hellwig 2024-11-05  401  xfs_zone_gc_query(
1b9104b51569db Christoph Hellwig 2024-11-05  402  	struct xfs_mount	*mp,
1b9104b51569db Christoph Hellwig 2024-11-05  403  	struct xfs_zone_gc_iter	*iter)
1b9104b51569db Christoph Hellwig 2024-11-05  404  {
1b9104b51569db Christoph Hellwig 2024-11-05  405  	struct xfs_rtgroup	*rtg = iter->victim_rtg;
1b9104b51569db Christoph Hellwig 2024-11-05  406  	struct xfs_rmap_irec	ri_low = { };
1b9104b51569db Christoph Hellwig 2024-11-05  407  	struct xfs_rmap_irec	ri_high;
1b9104b51569db Christoph Hellwig 2024-11-05  408  	struct xfs_btree_cur	*cur;
1b9104b51569db Christoph Hellwig 2024-11-05  409  	struct xfs_trans	*tp;
1b9104b51569db Christoph Hellwig 2024-11-05  410  	int			error;
1b9104b51569db Christoph Hellwig 2024-11-05  411  
1b9104b51569db Christoph Hellwig 2024-11-05  412  	ASSERT(iter->next_startblock <= rtg->rtg_extents);
1b9104b51569db Christoph Hellwig 2024-11-05  413  	if (iter->next_startblock == rtg->rtg_extents)
1b9104b51569db Christoph Hellwig 2024-11-05  414  		goto done;
1b9104b51569db Christoph Hellwig 2024-11-05  415  
1b9104b51569db Christoph Hellwig 2024-11-05  416  	ASSERT(iter->next_startblock < rtg->rtg_extents);
1b9104b51569db Christoph Hellwig 2024-11-05  417  	ri_low.rm_startblock = iter->next_startblock;
1b9104b51569db Christoph Hellwig 2024-11-05  418  	memset(&ri_high, 0xFF, sizeof(ri_high));
1b9104b51569db Christoph Hellwig 2024-11-05  419  
1b9104b51569db Christoph Hellwig 2024-11-05  420  	iter->rec_idx = 0;
1b9104b51569db Christoph Hellwig 2024-11-05  421  	iter->rec_count = 0;
1b9104b51569db Christoph Hellwig 2024-11-05  422  
1b9104b51569db Christoph Hellwig 2024-11-05  423  	error = xfs_trans_alloc_empty(mp, &tp);
1b9104b51569db Christoph Hellwig 2024-11-05  424  	if (error)
1b9104b51569db Christoph Hellwig 2024-11-05  425  		return error;
1b9104b51569db Christoph Hellwig 2024-11-05  426  
1b9104b51569db Christoph Hellwig 2024-11-05  427  	xfs_rtgroup_lock(rtg, XFS_RTGLOCK_RMAP);
1b9104b51569db Christoph Hellwig 2024-11-05  428  	xfs_rtgroup_trans_join(tp, rtg, XFS_RTGLOCK_RMAP);
1b9104b51569db Christoph Hellwig 2024-11-05  429  	cur = xfs_rtrmapbt_init_cursor(tp, rtg);
1b9104b51569db Christoph Hellwig 2024-11-05  430  	error = xfs_rmap_query_range(cur, &ri_low, &ri_high,
1b9104b51569db Christoph Hellwig 2024-11-05  431  			xfs_zone_gc_query_cb, iter);
1b9104b51569db Christoph Hellwig 2024-11-05 @432  	xfs_btree_del_cursor(cur, error < 0 ? error : 0);
1b9104b51569db Christoph Hellwig 2024-11-05  433  	xfs_trans_cancel(tp);
1b9104b51569db Christoph Hellwig 2024-11-05  434  
1b9104b51569db Christoph Hellwig 2024-11-05  435  	if (error < 0)
1b9104b51569db Christoph Hellwig 2024-11-05  436  		return error;
1b9104b51569db Christoph Hellwig 2024-11-05  437  
1b9104b51569db Christoph Hellwig 2024-11-05  438  	/*
1b9104b51569db Christoph Hellwig 2024-11-05  439  	 * Sort the rmap records by inode number and increasing offset to
1b9104b51569db Christoph Hellwig 2024-11-05  440  	 * defragment the mappings.
1b9104b51569db Christoph Hellwig 2024-11-05  441  	 *
1b9104b51569db Christoph Hellwig 2024-11-05  442  	 * This could be further enhanced by an even bigger look ahead window,
1b9104b51569db Christoph Hellwig 2024-11-05  443  	 * but that's better left until we have better detection of changes to
1b9104b51569db Christoph Hellwig 2024-11-05  444  	 * inode mapping to avoid the potential of GCing already dead data.
1b9104b51569db Christoph Hellwig 2024-11-05  445  	 */
1b9104b51569db Christoph Hellwig 2024-11-05  446  	sort(iter->recs, iter->rec_count, sizeof(iter->recs[0]),
1b9104b51569db Christoph Hellwig 2024-11-05  447  		xfs_zone_gc_rmap_rec_cmp, NULL);
1b9104b51569db Christoph Hellwig 2024-11-05  448  
1b9104b51569db Christoph Hellwig 2024-11-05  449  	if (error == 0) {
1b9104b51569db Christoph Hellwig 2024-11-05  450  		/*
1b9104b51569db Christoph Hellwig 2024-11-05  451  		 * We finished iterating through the zone.
1b9104b51569db Christoph Hellwig 2024-11-05  452  		 */
1b9104b51569db Christoph Hellwig 2024-11-05  453  		iter->next_startblock = rtg->rtg_extents;
1b9104b51569db Christoph Hellwig 2024-11-05  454  		if (iter->rec_count == 0)
1b9104b51569db Christoph Hellwig 2024-11-05  455  			goto done;
1b9104b51569db Christoph Hellwig 2024-11-05  456  	}
1b9104b51569db Christoph Hellwig 2024-11-05  457  
1b9104b51569db Christoph Hellwig 2024-11-05  458  	return 0;
1b9104b51569db Christoph Hellwig 2024-11-05  459  done:
1b9104b51569db Christoph Hellwig 2024-11-05  460  	xfs_rtgroup_rele(iter->victim_rtg);
1b9104b51569db Christoph Hellwig 2024-11-05  461  	iter->victim_rtg = NULL;
1b9104b51569db Christoph Hellwig 2024-11-05  462  	return 0;
1b9104b51569db Christoph Hellwig 2024-11-05  463  }
1b9104b51569db Christoph Hellwig 2024-11-05  464  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
