Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9C227E93
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Apr 2025 05:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745559052; cv=none; b=qgcTD0rRrufQXGJwg+8k8pxVHqwy2URJX1g7uMl/ZLzk04ni2rV81KtE4bnfK8S57+35slOAP2pAXJjxK9QbQ9e315lScnoViPE+lPX9zwxW5xegSK8+z4WHRpZqsLgThkHJQYeSKYwkopLB0qzYC5Nlfv9s3SCXF9tLhwtsgI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745559052; c=relaxed/simple;
	bh=sn8wDtqUzYZODyz0BKa4nbezCew67VKKfogko3Smiyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lj0l6J4/4ThHTHB0SX2/oJINrb+or1qH57aoeaY1cCuGOzTyDXH0OVrccsMlZJHPw+rodY9yuMq/+GyySbj9D+JdYhr17D9irpGVUlCT/QOhSiEV+zchiZVpI4wa8+TrWg2o5iSCWxjhYbk4YgWf0XnFC96zPk/IKtfIMruNR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcA7Y6ox; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcA7Y6ox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745559050; x=1777095050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sn8wDtqUzYZODyz0BKa4nbezCew67VKKfogko3Smiyo=;
  b=OcA7Y6oxW/INen93/FwhM8hvyy4ykBEBAiOKUEWBn7SvJDzub+pjT6qf
   TmJap6yeiWS6mO4CYA5Tbtuesa1QKrQ4E05mwK1g4E/AoOq3YL4qIqc8Y
   dD/JkdO8RZ/j83nfqKljdhgZg4i5o5h1J42xpQiG1NnXBBYWStL4jsmPA
   y1Gno7KLln2PkLSvWeq65Fz+R8DEiU553uoslqHVafYKIGE3+RgFPnR1Z
   ioo9cgRBZ+hroGq3fFU1LclKPEekzbk6obXJJuPeKsK7RO6xHf1NHO4Xx
   MeUw5ydsGpzdKGbiWiuQNVx4BU7bkuKe9Y7iCBYCeNyRO2R/iU2wY4Jtu
   w==;
X-CSE-ConnectionGUID: MVsmtoP8T2uMn3zT34Krow==
X-CSE-MsgGUID: GBMr8jSJTTuQcsFTaDQmnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47348004"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47348004"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 22:30:49 -0700
X-CSE-ConnectionGUID: qum61J27SKysBhHznKk++w==
X-CSE-MsgGUID: N97vYKWmSYeEbeLnqV6NDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137973591"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2025 22:30:37 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Bdy-0004r1-0Y;
	Fri, 25 Apr 2025 05:30:34 +0000
Date: Fri, 25 Apr 2025 13:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/huge_memory.c:3808 __split_unmapped_folio() error: we previously
 assumed 'mapping' could be null (see line 3796)
Message-ID: <202504251345.9f3beTHC-lkp@intel.com>
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
TO: Zi Yan <ziy@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 00527733d0dc806a72bb9a56cfbd6c44d5f74872 mm/huge_memory: add two new (not yet used) functions for folio_split()
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-161-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251345.9f3beTHC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504251345.9f3beTHC-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:3808 __split_unmapped_folio() error: we previously assumed 'mapping' could be null (see line 3796)

vim +/mapping +3808 mm/huge_memory.c

00527733d0dc80 Zi Yan 2025-03-07  3751  
00527733d0dc80 Zi Yan 2025-03-07  3752  
00527733d0dc80 Zi Yan 2025-03-07  3753  		/* complete memcg works before add pages to LRU */
00527733d0dc80 Zi Yan 2025-03-07  3754  		split_page_memcg(&folio->page, old_order, split_order);
00527733d0dc80 Zi Yan 2025-03-07  3755  		split_page_owner(&folio->page, old_order, split_order);
00527733d0dc80 Zi Yan 2025-03-07  3756  		pgalloc_tag_split(folio, old_order, split_order);
00527733d0dc80 Zi Yan 2025-03-07  3757  
00527733d0dc80 Zi Yan 2025-03-07  3758  		__split_folio_to_order(folio, old_order, split_order);
00527733d0dc80 Zi Yan 2025-03-07  3759  
00527733d0dc80 Zi Yan 2025-03-07  3760  after_split:
00527733d0dc80 Zi Yan 2025-03-07  3761  		/*
00527733d0dc80 Zi Yan 2025-03-07  3762  		 * Iterate through after-split folios and perform related
00527733d0dc80 Zi Yan 2025-03-07  3763  		 * operations. But in buddy allocator like split, the folio
00527733d0dc80 Zi Yan 2025-03-07  3764  		 * containing the specified page is skipped until its order
00527733d0dc80 Zi Yan 2025-03-07  3765  		 * is new_order, since the folio will be worked on in next
00527733d0dc80 Zi Yan 2025-03-07  3766  		 * iteration.
00527733d0dc80 Zi Yan 2025-03-07  3767  		 */
00527733d0dc80 Zi Yan 2025-03-07  3768  		for (release = folio; release != end_folio; release = next) {
00527733d0dc80 Zi Yan 2025-03-07  3769  			next = folio_next(release);
00527733d0dc80 Zi Yan 2025-03-07  3770  			/*
00527733d0dc80 Zi Yan 2025-03-07  3771  			 * for buddy allocator like split, the folio containing
00527733d0dc80 Zi Yan 2025-03-07  3772  			 * page will be split next and should not be released,
00527733d0dc80 Zi Yan 2025-03-07  3773  			 * until the folio's order is new_order or stop_split
00527733d0dc80 Zi Yan 2025-03-07  3774  			 * is set to true by the above xas_split() failure.
00527733d0dc80 Zi Yan 2025-03-07  3775  			 */
00527733d0dc80 Zi Yan 2025-03-07  3776  			if (release == page_folio(split_at)) {
00527733d0dc80 Zi Yan 2025-03-07  3777  				folio = release;
00527733d0dc80 Zi Yan 2025-03-07  3778  				if (split_order != new_order && !stop_split)
00527733d0dc80 Zi Yan 2025-03-07  3779  					continue;
00527733d0dc80 Zi Yan 2025-03-07  3780  			}
00527733d0dc80 Zi Yan 2025-03-07  3781  			if (folio_test_anon(release)) {
00527733d0dc80 Zi Yan 2025-03-07  3782  				mod_mthp_stat(folio_order(release),
00527733d0dc80 Zi Yan 2025-03-07  3783  						MTHP_STAT_NR_ANON, 1);
00527733d0dc80 Zi Yan 2025-03-07  3784  			}
00527733d0dc80 Zi Yan 2025-03-07  3785  
00527733d0dc80 Zi Yan 2025-03-07  3786  			/*
00527733d0dc80 Zi Yan 2025-03-07  3787  			 * origin_folio should be kept frozon until page cache
00527733d0dc80 Zi Yan 2025-03-07  3788  			 * entries are updated with all the other after-split
00527733d0dc80 Zi Yan 2025-03-07  3789  			 * folios to prevent others seeing stale page cache
00527733d0dc80 Zi Yan 2025-03-07  3790  			 * entries.
00527733d0dc80 Zi Yan 2025-03-07  3791  			 */
00527733d0dc80 Zi Yan 2025-03-07  3792  			if (release == origin_folio)
00527733d0dc80 Zi Yan 2025-03-07  3793  				continue;
00527733d0dc80 Zi Yan 2025-03-07  3794  
00527733d0dc80 Zi Yan 2025-03-07  3795  			folio_ref_unfreeze(release, 1 +
00527733d0dc80 Zi Yan 2025-03-07 @3796  					((mapping || swap_cache) ?
00527733d0dc80 Zi Yan 2025-03-07  3797  						folio_nr_pages(release) : 0));
00527733d0dc80 Zi Yan 2025-03-07  3798  
00527733d0dc80 Zi Yan 2025-03-07  3799  			lru_add_page_tail(origin_folio, &release->page,
00527733d0dc80 Zi Yan 2025-03-07  3800  						lruvec, list);
00527733d0dc80 Zi Yan 2025-03-07  3801  
00527733d0dc80 Zi Yan 2025-03-07  3802  			/* Some pages can be beyond EOF: drop them from cache */
00527733d0dc80 Zi Yan 2025-03-07  3803  			if (release->index >= end) {
00527733d0dc80 Zi Yan 2025-03-07  3804  				if (shmem_mapping(mapping))
00527733d0dc80 Zi Yan 2025-03-07  3805  					nr_dropped += folio_nr_pages(release);
00527733d0dc80 Zi Yan 2025-03-07  3806  				else if (folio_test_clear_dirty(release))
00527733d0dc80 Zi Yan 2025-03-07  3807  					folio_account_cleaned(release,
00527733d0dc80 Zi Yan 2025-03-07 @3808  						inode_to_wb(mapping->host));
00527733d0dc80 Zi Yan 2025-03-07  3809  				__filemap_remove_folio(release, NULL);
00527733d0dc80 Zi Yan 2025-03-07  3810  				folio_put_refs(release, folio_nr_pages(release));
00527733d0dc80 Zi Yan 2025-03-07  3811  			} else if (mapping) {
00527733d0dc80 Zi Yan 2025-03-07  3812  				__xa_store(&mapping->i_pages,
00527733d0dc80 Zi Yan 2025-03-07  3813  						release->index, release, 0);
00527733d0dc80 Zi Yan 2025-03-07  3814  			} else if (swap_cache) {
00527733d0dc80 Zi Yan 2025-03-07  3815  				__xa_store(&swap_cache->i_pages,
00527733d0dc80 Zi Yan 2025-03-07  3816  						swap_cache_index(release->swap),
00527733d0dc80 Zi Yan 2025-03-07  3817  						release, 0);
00527733d0dc80 Zi Yan 2025-03-07  3818  			}
00527733d0dc80 Zi Yan 2025-03-07  3819  		}
00527733d0dc80 Zi Yan 2025-03-07  3820  	}
00527733d0dc80 Zi Yan 2025-03-07  3821  
00527733d0dc80 Zi Yan 2025-03-07  3822  	/*
00527733d0dc80 Zi Yan 2025-03-07  3823  	 * Unfreeze origin_folio only after all page cache entries, which used
00527733d0dc80 Zi Yan 2025-03-07  3824  	 * to point to it, have been updated with new folios. Otherwise,
00527733d0dc80 Zi Yan 2025-03-07  3825  	 * a parallel folio_try_get() can grab origin_folio and its caller can
00527733d0dc80 Zi Yan 2025-03-07  3826  	 * see stale page cache entries.
00527733d0dc80 Zi Yan 2025-03-07  3827  	 */
00527733d0dc80 Zi Yan 2025-03-07  3828  	folio_ref_unfreeze(origin_folio, 1 +
00527733d0dc80 Zi Yan 2025-03-07  3829  		((mapping || swap_cache) ? folio_nr_pages(origin_folio) : 0));
00527733d0dc80 Zi Yan 2025-03-07  3830  
00527733d0dc80 Zi Yan 2025-03-07  3831  	unlock_page_lruvec(lruvec);
00527733d0dc80 Zi Yan 2025-03-07  3832  
00527733d0dc80 Zi Yan 2025-03-07  3833  	if (swap_cache)
00527733d0dc80 Zi Yan 2025-03-07  3834  		xa_unlock(&swap_cache->i_pages);
00527733d0dc80 Zi Yan 2025-03-07  3835  	if (mapping)
00527733d0dc80 Zi Yan 2025-03-07  3836  		xa_unlock(&mapping->i_pages);
00527733d0dc80 Zi Yan 2025-03-07  3837  
00527733d0dc80 Zi Yan 2025-03-07  3838  	/* Caller disabled irqs, so they are still disabled here */
00527733d0dc80 Zi Yan 2025-03-07  3839  	local_irq_enable();
00527733d0dc80 Zi Yan 2025-03-07  3840  
00527733d0dc80 Zi Yan 2025-03-07  3841  	if (nr_dropped)
00527733d0dc80 Zi Yan 2025-03-07  3842  		shmem_uncharge(mapping->host, nr_dropped);
00527733d0dc80 Zi Yan 2025-03-07  3843  
00527733d0dc80 Zi Yan 2025-03-07  3844  	remap_page(origin_folio, 1 << order,
00527733d0dc80 Zi Yan 2025-03-07  3845  			folio_test_anon(origin_folio) ?
00527733d0dc80 Zi Yan 2025-03-07  3846  				RMP_USE_SHARED_ZEROPAGE : 0);
00527733d0dc80 Zi Yan 2025-03-07  3847  
00527733d0dc80 Zi Yan 2025-03-07  3848  	/*
00527733d0dc80 Zi Yan 2025-03-07  3849  	 * At this point, folio should contain the specified page.
00527733d0dc80 Zi Yan 2025-03-07  3850  	 * For uniform split, it is left for caller to unlock.
00527733d0dc80 Zi Yan 2025-03-07  3851  	 * For buddy allocator like split, the first after-split folio is left
00527733d0dc80 Zi Yan 2025-03-07  3852  	 * for caller to unlock.
00527733d0dc80 Zi Yan 2025-03-07  3853  	 */
00527733d0dc80 Zi Yan 2025-03-07  3854  	for (new_folio = origin_folio; new_folio != next_folio; new_folio = next) {
00527733d0dc80 Zi Yan 2025-03-07  3855  		next = folio_next(new_folio);
00527733d0dc80 Zi Yan 2025-03-07  3856  		if (new_folio == page_folio(lock_at))
00527733d0dc80 Zi Yan 2025-03-07  3857  			continue;
00527733d0dc80 Zi Yan 2025-03-07  3858  
00527733d0dc80 Zi Yan 2025-03-07  3859  		folio_unlock(new_folio);
00527733d0dc80 Zi Yan 2025-03-07  3860  		/*
00527733d0dc80 Zi Yan 2025-03-07  3861  		 * Subpages may be freed if there wasn't any mapping
00527733d0dc80 Zi Yan 2025-03-07  3862  		 * like if add_to_swap() is running on a lru page that
00527733d0dc80 Zi Yan 2025-03-07  3863  		 * had its mapping zapped. And freeing these pages
00527733d0dc80 Zi Yan 2025-03-07  3864  		 * requires taking the lru_lock so we do the put_page
00527733d0dc80 Zi Yan 2025-03-07  3865  		 * of the tail pages after the split is complete.
00527733d0dc80 Zi Yan 2025-03-07  3866  		 */
00527733d0dc80 Zi Yan 2025-03-07  3867  		free_page_and_swap_cache(&new_folio->page);
00527733d0dc80 Zi Yan 2025-03-07  3868  	}
00527733d0dc80 Zi Yan 2025-03-07  3869  	return ret;
00527733d0dc80 Zi Yan 2025-03-07  3870  }
00527733d0dc80 Zi Yan 2025-03-07  3871  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
