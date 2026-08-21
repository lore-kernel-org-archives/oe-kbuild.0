Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9730567B
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347033; cv=none; b=Pr8tIIlXebrYmyzoVwwmtZtZzCh7k4VGb5T6MbARRNMXixTCe+SAOP1iFSf7RQjveZ5KHqKibtMwriImumtrDq3LrrckN3c3mlvMfwYjHnTREANyBP/RENcYBwBn8sOe+vSHQLa8Y4FSxEVmjWwtUxTTehBlsOuWlMo3CuIswtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347033; c=relaxed/simple;
	bh=ebIbBgNeAdeC/ieteVkNoz3xXULu/DI1Ptsg4EmFfNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k9qGyRsylQHo+JL5+tVVFlMuMl3GJfq0BzONKKlyEOYRRkHQAkFpStQ5bGfkXCaAjDX+uuTznxBxG/ancC8aLdvREMlULrdAYMYEE2X+612SfIrIsjCTSsMU4l/2YA9kwxKmHBFFqiZlpprxLwwRcCtLQ5uSNioIXCvqJVTF/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2jw4B3j; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2jw4B3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787347031; x=1818883031;
  h=date:from:to:cc:subject:message-id;
  bh=ebIbBgNeAdeC/ieteVkNoz3xXULu/DI1Ptsg4EmFfNg=;
  b=D2jw4B3jjDJ/YN787rU1Vegj2uB3w9blYsyHbnXjQkI44wvc9rZPj43N
   bxE00JwX9mvdjOLu0AoFtnb0PzDv+xFicTAeURXwsfGIO1RmFjOrjKehO
   9oxIYdOv4C8V2XI1Ng1BezjhNqZALjjKMGgT3zncUl49H62sVWM/+HODF
   2tMmJklGIvmfQRMOytHDf/GCPye/13VTl5qlc2wQ37eTUt7RV1rol6kXH
   gj8wyC1la6XnVq6JkchXgVoJ4Zxzy4cZylzU2HlDDdbcVbcHczdY8hyg3
   PDgm6uB0YF1pqfGoKT2ox2Eu4/LBz2MSlSz/mz1zga1nvnTA/jhxfm8Ot
   g==;
X-CSE-ConnectionGUID: uiwtXx4CQsyyDARjh3YfPw==
X-CSE-MsgGUID: lCnMxI/oTtCo9JDNbu6wWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="86849674"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="86849674"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:17:11 -0700
X-CSE-ConnectionGUID: l09QewtXQoWcNh4tM81teQ==
X-CSE-MsgGUID: CGemIB/xQmSdW8o+k0nFUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="263185923"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2026 14:17:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxWbr-00000000qTt-05YF;
	Fri, 21 Aug 2026 21:17:07 +0000
Date: Sat, 22 Aug 2026 05:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gourryinverse:scratch/gourry/managed_nodes/node_features_v6
 42/44] mm/page_alloc.c:7717 alloc_contig_frozen_pages_noprof() warn: bitwise
 AND condition is false here
Message-ID: <202608220505.bExFiebJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Gregory Price <gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/node_features_v6
head:   38c7f48162aa282dc6a9edfb7011378594057c10
commit: e349bc96af39536035720fe607b05fc4cbd269fc [42/44] mm/page_alloc: let a contiguous search target a private node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r073-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220505.bExFiebJ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608220505.bExFiebJ-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:7717 alloc_contig_frozen_pages_noprof() warn: bitwise AND condition is false here

vim +7717 mm/page_alloc.c

5e27a2df03b893 Anshuman Khandual 2019-11-30  7671  
5e27a2df03b893 Anshuman Khandual 2019-11-30  7672  /**
e0c1326779cc1b Kefeng Wang       2026-01-09  7673   * alloc_contig_frozen_pages() -- tries to find and allocate contiguous range of frozen pages
5e27a2df03b893 Anshuman Khandual 2019-11-30  7674   * @nr_pages:	Number of contiguous pages to allocate
f6037a4a686523 David Hildenbrand 2024-12-03  7675   * @gfp_mask:	GFP mask. Node/zone/placement hints limit the search; only some
f6037a4a686523 David Hildenbrand 2024-12-03  7676   *		action and reclaim modifiers are supported. Reclaim modifiers
f6037a4a686523 David Hildenbrand 2024-12-03  7677   *		control allocation behavior during compaction/migration/reclaim.
5e27a2df03b893 Anshuman Khandual 2019-11-30  7678   * @nid:	Target node
5e27a2df03b893 Anshuman Khandual 2019-11-30  7679   * @nodemask:	Mask for other possible nodes
5e27a2df03b893 Anshuman Khandual 2019-11-30  7680   *
e0c1326779cc1b Kefeng Wang       2026-01-09  7681   * This routine is a wrapper around alloc_contig_frozen_range(). It scans over
e0c1326779cc1b Kefeng Wang       2026-01-09  7682   * zones on an applicable zonelist to find a contiguous pfn range which can then
e0c1326779cc1b Kefeng Wang       2026-01-09  7683   * be tried for allocation with alloc_contig_frozen_range(). This routine is
e0c1326779cc1b Kefeng Wang       2026-01-09  7684   * intended for allocation requests which can not be fulfilled with the buddy
e0c1326779cc1b Kefeng Wang       2026-01-09  7685   * allocator.
5e27a2df03b893 Anshuman Khandual 2019-11-30  7686   *
5e27a2df03b893 Anshuman Khandual 2019-11-30  7687   * The allocated memory is always aligned to a page boundary. If nr_pages is a
eaab8e753632b8 Anshuman Khandual 2022-01-14  7688   * power of two, then allocated range is also guaranteed to be aligned to same
eaab8e753632b8 Anshuman Khandual 2022-01-14  7689   * nr_pages (e.g. 1GB request would be aligned to 1GB).
5e27a2df03b893 Anshuman Khandual 2019-11-30  7690   *
e0c1326779cc1b Kefeng Wang       2026-01-09  7691   * Allocated frozen pages need be freed with free_contig_frozen_range(),
e0c1326779cc1b Kefeng Wang       2026-01-09  7692   * or by manually calling free_frozen_pages() on each allocated frozen
e0c1326779cc1b Kefeng Wang       2026-01-09  7693   * non-compound page, for compound frozen pages could be freed with
e0c1326779cc1b Kefeng Wang       2026-01-09  7694   * free_frozen_pages() directly.
5e27a2df03b893 Anshuman Khandual 2019-11-30  7695   *
e0c1326779cc1b Kefeng Wang       2026-01-09  7696   * Return: pointer to contiguous frozen pages on success, or NULL if not successful.
5e27a2df03b893 Anshuman Khandual 2019-11-30  7697   */
e0c1326779cc1b Kefeng Wang       2026-01-09  7698  struct page *alloc_contig_frozen_pages_noprof(unsigned long nr_pages,
e349bc96af3953 Gregory Price     2026-08-19  7699  		gfp_t gfp_mask, int nid, nodemask_t *nodemask,
e349bc96af3953 Gregory Price     2026-08-19  7700  		unsigned int alloc_flags)
5e27a2df03b893 Anshuman Khandual 2019-11-30  7701  {
5e27a2df03b893 Anshuman Khandual 2019-11-30  7702  	unsigned long ret, pfn, flags;
5e27a2df03b893 Anshuman Khandual 2019-11-30  7703  	struct zonelist *zonelist;
5e27a2df03b893 Anshuman Khandual 2019-11-30  7704  	struct zone *zone;
5e27a2df03b893 Anshuman Khandual 2019-11-30  7705  	struct zoneref *z;
e349bc96af3953 Gregory Price     2026-08-19  7706  	nodemask_t targets;
3bb64898f00368 Gregory Price     2025-12-21  7707  	bool skip_hugetlb = true;
3bb64898f00368 Gregory Price     2025-12-21  7708  	bool skipped_hugetlb = false;
5e27a2df03b893 Anshuman Khandual 2019-11-30  7709  
e349bc96af3953 Gregory Price     2026-08-19  7710  	/*
e349bc96af3953 Gregory Price     2026-08-19  7711  	 * ALLOC_ZONELIST_PRIVATE grants the search access to private nodes,
e349bc96af3953 Gregory Price     2026-08-19  7712  	 * but the private zonelist is built over all of N_MEMORY, so without
e349bc96af3953 Gregory Price     2026-08-19  7713  	 * a nodemask it would also offer up other devices' nodes.  Confine it
e349bc96af3953 Gregory Price     2026-08-19  7714  	 * to @nid and the public nodes.  A caller that supplied its own
e349bc96af3953 Gregory Price     2026-08-19  7715  	 * nodemask has already said what it will accept.
e349bc96af3953 Gregory Price     2026-08-19  7716  	 */
e349bc96af3953 Gregory Price     2026-08-19 @7717  	if ((alloc_flags & ALLOC_ZONELIST_PRIVATE) && !nodemask &&
e349bc96af3953 Gregory Price     2026-08-19  7718  	    contig_private_targets(nid, &targets))
e349bc96af3953 Gregory Price     2026-08-19  7719  		nodemask = &targets;
e349bc96af3953 Gregory Price     2026-08-19  7720  
3bb64898f00368 Gregory Price     2025-12-21  7721  retry:
e349bc96af3953 Gregory Price     2026-08-19  7722  	zonelist = select_zonelist(nid, gfp_mask, alloc_flags);
5e27a2df03b893 Anshuman Khandual 2019-11-30  7723  	for_each_zone_zonelist_nodemask(zone, z, zonelist,
5e27a2df03b893 Anshuman Khandual 2019-11-30  7724  					gfp_zone(gfp_mask), nodemask) {
5e27a2df03b893 Anshuman Khandual 2019-11-30  7725  		spin_lock_irqsave(&zone->lock, flags);
5e27a2df03b893 Anshuman Khandual 2019-11-30  7726  
5e27a2df03b893 Anshuman Khandual 2019-11-30  7727  		pfn = ALIGN(zone->zone_start_pfn, nr_pages);
5e27a2df03b893 Anshuman Khandual 2019-11-30  7728  		while (zone_spans_last_pfn(zone, pfn, nr_pages)) {
3bb64898f00368 Gregory Price     2025-12-21  7729  			if (pfn_range_valid_contig(zone, pfn, nr_pages,
3bb64898f00368 Gregory Price     2025-12-21  7730  						   skip_hugetlb,
3bb64898f00368 Gregory Price     2025-12-21  7731  						   &skipped_hugetlb)) {
5e27a2df03b893 Anshuman Khandual 2019-11-30  7732  				/*
5e27a2df03b893 Anshuman Khandual 2019-11-30  7733  				 * We release the zone lock here because
e0c1326779cc1b Kefeng Wang       2026-01-09  7734  				 * alloc_contig_frozen_range() will also lock
e0c1326779cc1b Kefeng Wang       2026-01-09  7735  				 * the zone at some point. If there's an
e0c1326779cc1b Kefeng Wang       2026-01-09  7736  				 * allocation spinning on this lock, it may
e0c1326779cc1b Kefeng Wang       2026-01-09  7737  				 * win the race and cause allocation to fail.
5e27a2df03b893 Anshuman Khandual 2019-11-30  7738  				 */
5e27a2df03b893 Anshuman Khandual 2019-11-30  7739  				spin_unlock_irqrestore(&zone->lock, flags);
e0c1326779cc1b Kefeng Wang       2026-01-09  7740  				ret = alloc_contig_frozen_range_noprof(pfn,
e0c1326779cc1b Kefeng Wang       2026-01-09  7741  							pfn + nr_pages,
e0c1326779cc1b Kefeng Wang       2026-01-09  7742  							ACR_FLAGS_NONE,
5e27a2df03b893 Anshuman Khandual 2019-11-30  7743  							gfp_mask);
5e27a2df03b893 Anshuman Khandual 2019-11-30  7744  				if (!ret)
5e27a2df03b893 Anshuman Khandual 2019-11-30  7745  					return pfn_to_page(pfn);
5e27a2df03b893 Anshuman Khandual 2019-11-30  7746  				spin_lock_irqsave(&zone->lock, flags);
5e27a2df03b893 Anshuman Khandual 2019-11-30  7747  			}
5e27a2df03b893 Anshuman Khandual 2019-11-30  7748  			pfn += nr_pages;
5e27a2df03b893 Anshuman Khandual 2019-11-30  7749  		}
5e27a2df03b893 Anshuman Khandual 2019-11-30  7750  		spin_unlock_irqrestore(&zone->lock, flags);
5e27a2df03b893 Anshuman Khandual 2019-11-30  7751  	}
3bb64898f00368 Gregory Price     2025-12-21  7752  	/*
3bb64898f00368 Gregory Price     2025-12-21  7753  	 * If we failed, retry the search, but treat regions with HugeTLB pages
3bb64898f00368 Gregory Price     2025-12-21  7754  	 * as valid targets.  This retains fast-allocations on first pass
3bb64898f00368 Gregory Price     2025-12-21  7755  	 * without trying to migrate HugeTLB pages (which may fail). On the
3bb64898f00368 Gregory Price     2025-12-21  7756  	 * second pass, we will try moving HugeTLB pages when those pages are
3bb64898f00368 Gregory Price     2025-12-21  7757  	 * smaller than the requested contiguous region size.
3bb64898f00368 Gregory Price     2025-12-21  7758  	 */
3bb64898f00368 Gregory Price     2025-12-21  7759  	if (skip_hugetlb && skipped_hugetlb) {
3bb64898f00368 Gregory Price     2025-12-21  7760  		skip_hugetlb = false;
3bb64898f00368 Gregory Price     2025-12-21  7761  		goto retry;
3bb64898f00368 Gregory Price     2025-12-21  7762  	}
5e27a2df03b893 Anshuman Khandual 2019-11-30  7763  	return NULL;
5e27a2df03b893 Anshuman Khandual 2019-11-30  7764  }
e0c1326779cc1b Kefeng Wang       2026-01-09  7765  EXPORT_SYMBOL(alloc_contig_frozen_pages_noprof);
041d3a8cdc18dc Michal Nazarewicz 2011-12-29  7766  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
