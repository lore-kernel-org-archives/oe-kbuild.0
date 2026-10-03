Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8878F2F
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 00:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986186; cv=none; b=u7vAB1cTJlZHB+pF/axA8ZIFx8U/4mYJMaVws5O6J6SSmBzj77h3zOITnyJNEP3tEnIwyQDVdlkptNM+tfl9CegcC5VqGpRWFZDpUwjV6wvc8OyVD/uHR7feCjMdh6TjmqGeZT92VBzOMNkcGcVcP9Z4dF3jw/jeDDHjJj9imyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986186; c=relaxed/simple;
	bh=TLuhMvGZJLK6z/zYYoQ5VtikAQ8+GOeMGw/o5/H1pNk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XIoqLbCd8etXd6CqmTbTNmHeQ0ThCHO8qPqMn8e9ypRuzwHE7x9AHrzbyQjFEB0x90Jb+M7Y33NxvCOkPHUvmuhv36mjoM8YqZeyS1N+fE5Bj2ifjgMgK6eyag15QEdufdy4eftDHAMN2R0lGz9ChCOcDuCdGMdmXjYaJSpFLG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js+HRyNi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js+HRyNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790986184; x=1822522184;
  h=date:from:to:cc:subject:message-id;
  bh=TLuhMvGZJLK6z/zYYoQ5VtikAQ8+GOeMGw/o5/H1pNk=;
  b=Js+HRyNiCcDpZX3TaDpOleLYtezX2ldapCz0xTBriBkY+bRjTjKh5yaM
   Pa4yJ0iJEUhL4UzY3J4+krA6KswZtaVun84zAztSTT7t6FjLS3J/WyhDH
   lZR4iu8hjU8YVmQSmCANjrQdbHrOItJD4FUfDR6uLnItrjqb/wGWVLTps
   o8UKbG6S91FJoNq820mZmZJzDXLq0Xu9O/uUB9Ml/00BIchEqVGTEFIMy
   ltD27bkVzzlTY296nsYLIJsZcaccAjwVyoOkBiHPwHI8aonC/JFlEb4YN
   8+D6NlEM08LdJNv6J7GU9D5if6Zg6/Nj9cJ2oDXVj3j7a7FTvUOn1OemE
   A==;
X-CSE-ConnectionGUID: nUdLpE1ES7mGImzSYMTi0g==
X-CSE-MsgGUID: TDIQSCiASYSHmwQKYjQJsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="117280470"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="117280470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 17:09:43 -0700
X-CSE-ConnectionGUID: rcuqmq9FR76KMxEB0dXVRA==
X-CSE-MsgGUID: ljmoY3+aSmSfxT8RRx8ywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275907485"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2026 17:09:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCnJs-00000000Tb7-0rBw;
	Sat, 03 Oct 2026 00:09:40 +0000
Date: Sat, 03 Oct 2026 08:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/generic_pt/shrinker.c:117:undefined reference
 to `iommu_put_pages_list'
Message-ID: <202610030757.zvLnZqhW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pranjal-Shrivastava/iommu-Add-reclaim_list-xarray-to-struct-iommu_domain/20261001-230215, commit: 500ec14f96dbb4ca3ad2c39349b778c8a25fe0b7"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pranjal Shrivastava <praan@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/iommu-Add-reclaim_list-xarray-to-struct-iommu_domain/20261001-230215
head:   27fca47089358dfe3840aa0b0c9795b3963c21b9
commit: 500ec14f96dbb4ca3ad2c39349b778c8a25fe0b7 iommupt: Introduce lockless page table shrinker
date:   25 hours ago
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-buildonly-randconfig-1005-20261002 (https://download.01.org/0day-ci/archive/20261003/202610030757.zvLnZqhW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030757.zvLnZqhW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030757.zvLnZqhW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `generic_pt_shrinker_scan':
>> drivers/iommu/generic_pt/shrinker.c:117:(.text+0xc394f1): undefined reference to `iommu_put_pages_list'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]


vim +117 drivers/iommu/generic_pt/shrinker.c

500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   56  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   57  static unsigned long generic_pt_shrinker_scan(struct shrinker *shrink,
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   58  					      struct shrink_control *sc)
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   59  {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   60  	struct iommu_pages_list free_list = IOMMU_PAGES_LIST_INIT(free_list);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   61  	struct pt_iommu *iommu;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   62  	struct ioptdesc *ioptdesc;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   63  	unsigned long iova;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   64  	unsigned long freed_count = 0;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   65  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   66  	mutex_lock(&generic_pt_domains_list_lock);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   67  	list_for_each_entry(iommu, &generic_pt_domains_list, shrinker_list) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   68  		struct iommu_domain *domain = &iommu->domain;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   69  		unsigned long prev_freed = freed_count;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   70  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   71  		xa_for_each(&domain->reclaim_list, iova, ioptdesc) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   72  			if (freed_count >= sc->nr_to_scan)
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   73  				break;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   74  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   75  			if (atomic_cmpxchg(&ioptdesc->__page_refcount, 1, 0) == 1) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   76  				void *virt = folio_address(ioptdesc_folio(ioptdesc));
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   77  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   78  				if (iommu->ops->sever_branch(iommu, iova, virt_to_phys(virt))) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   79  					/* Successfully severed, queue for freeing */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   80  					xa_erase(&domain->reclaim_list, iova);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   81  					iommu_pages_list_add(&free_list, virt);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   82  					freed_count++;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   83  				} else {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   84  					/* We raced with map, abort pruning */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   85  					xa_erase(&domain->reclaim_list, iova);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   86  				}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   87  			} else {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   88  				/* Not empty anymore, remove from list */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   89  				xa_erase(&domain->reclaim_list, iova);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   90  			}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   91  		}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   92  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   93  		/*
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   94  		 * The IOMMU may still cache pointers to the severed tables in its
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   95  		 * paging-structure caches, flush them before the tables are freed.
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   96  		 */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   97  		if (freed_count != prev_freed)
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   98  			iommu_flush_iotlb_all(domain);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   99  	}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  100  	mutex_unlock(&generic_pt_domains_list_lock);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  101  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  102  	/* If we didn't sever anything, just return */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  103  	if (list_empty(&free_list.pages))
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  104  		return freed_count;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  105  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  106  	/* Wait ONE time for the entire system */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  107  	synchronize_srcu(&generic_pt_srcu);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  108  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  109  	/* Free pages from all domains */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  110  	struct page *page, *next;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  111  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  112  	list_for_each_entry_safe(page, next, &free_list.pages, lru) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  113  		/* We must restore the refcount to 1 before freeing */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  114  		set_page_count(page, 1);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  115  	}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  116  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01 @117  	iommu_put_pages_list(&free_list);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  118  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  119  	return freed_count;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  120  }
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  121  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
