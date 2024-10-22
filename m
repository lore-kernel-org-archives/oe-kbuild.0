Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A2B1EB31
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 03:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729567334; cv=none; b=kwW1GH/+578mtdXZYKsiAj9Rgen90zNjSN49DGgiFR2PVYOv4lkgy8a+GYcIeWTHUlfBvxydDnZ+pmmfNbogRCtQM+0Lqk1iFiguS/As+usNOTExLVAduowwzwJfbKa+dMqfpqeEehaevKq5NwFiTAm04xc+krCrYLm0T+RFEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729567334; c=relaxed/simple;
	bh=wQtocC+TMw0rtRv+z2GBxUYzGjB1xd4vqLvtYu6e4Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9hMWG+410X6ceSlAZ2NdQ4PspX3If2bVFn8e1Vc+NP8cRvnS8/3+JSzM1dQoGnLJmvWT0M9VMC7/ScuR8wrRzngsrXTiTn58F1D5j4YRa7+C1Gon6r0iV8APYl7zUSilwdzoq7Pz0dCviDjYqCzsSYZFT49nRlVV4K1iOZKQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLQp+HeM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLQp+HeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729567333; x=1761103333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQtocC+TMw0rtRv+z2GBxUYzGjB1xd4vqLvtYu6e4Xs=;
  b=LLQp+HeMC4yptwqjfV4c4tKwHAprmMpiTmlZkQYpzdGf/YIPKpMvzuw8
   mohnTg4WT86EEwnUBtI2CnSojIqb+PYpOVDWXx7ozEWhN5WYzClVMlF5K
   p9t5054PkfSwDUSCIpruysYLpqMCurU4oJrEggtKovrIcLfdrW/PDy/2S
   dzntZLecAirTv6a+3weN2eFQkuYiQKFd5hvf5ndukI1Q6061VhC96CzLJ
   pa8Ir9RpSoJw+bc2Viht80hRRleJE7jAc6NsAOmpC7G1QplWPwSGGQGiO
   PP/jzJtArFMKaNo6QI3KJgk98Zx0Cf9XcFVsizDCX4mmT0ObGHyPIqAPa
   Q==;
X-CSE-ConnectionGUID: vytcSkSLTsiFTjRUCieVvA==
X-CSE-MsgGUID: hEkvsa+ZQD6gLAU4PujZdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32890137"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="32890137"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 20:22:12 -0700
X-CSE-ConnectionGUID: xECSjT6yR82xlCdWJHlFJw==
X-CSE-MsgGUID: 0H9fre22QPuwi1jjhmDcew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79295997"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2024 20:22:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t35TE-000Sze-0o;
	Tue, 22 Oct 2024 03:22:08 +0000
Date: Tue, 22 Oct 2024 11:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/6] mm/hugetlb_vmemmap: add arch-independent helpers
Message-ID: <202410221109.SuinuBiD-lkp@intel.com>
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
In-Reply-To: <20241021042218.746659-3-yuzhao@google.com>
References: <20241021042218.746659-3-yuzhao@google.com>
TO: Yu Zhao <yuzhao@google.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Marc Zyngier <maz@kernel.org>
TO: Muchun Song <muchun.song@linux.dev>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Will Deacon <will@kernel.org>
CC: Douglas Anderson <dianders@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Nanyong Sun <sunnanyong@huawei.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Yu Zhao <yuzhao@google.com>

Hi Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 42f7652d3eb527d03665b09edac47f85fb600924]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Zhao/mm-hugetlb_vmemmap-batch-update-PTEs/20241021-122330
base:   42f7652d3eb527d03665b09edac47f85fb600924
patch link:    https://lore.kernel.org/r/20241021042218.746659-3-yuzhao%40google.com
patch subject: [PATCH v1 2/6] mm/hugetlb_vmemmap: add arch-independent helpers
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-161-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221109.SuinuBiD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410221109.SuinuBiD-lkp@intel.com/

smatch warnings:
mm/hugetlb_vmemmap.c:609 hugetlb_vmemmap_restore_folios() warn: bitwise AND condition is false here
mm/hugetlb_vmemmap.c:740 hugetlb_vmemmap_optimize_folios() warn: bitwise AND condition is false here

vim +609 mm/hugetlb_vmemmap.c

c24f188b228929 Mike Kravetz 2023-10-18  571  
cfb8c75099dbf1 Mike Kravetz 2023-10-18  572  /**
cfb8c75099dbf1 Mike Kravetz 2023-10-18  573   * hugetlb_vmemmap_restore_folios - restore vmemmap for every folio on the list.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  574   * @h:			hstate.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  575   * @folio_list:		list of folios.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  576   * @non_hvo_folios:	Output list of folios for which vmemmap exists.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  577   *
cfb8c75099dbf1 Mike Kravetz 2023-10-18  578   * Return: number of folios for which vmemmap was restored, or an error code
cfb8c75099dbf1 Mike Kravetz 2023-10-18  579   *		if an error was encountered restoring vmemmap for a folio.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  580   *		Folios that have vmemmap are moved to the non_hvo_folios
cfb8c75099dbf1 Mike Kravetz 2023-10-18  581   *		list.  Processing of entries stops when the first error is
cfb8c75099dbf1 Mike Kravetz 2023-10-18  582   *		encountered. The folio that experienced the error and all
cfb8c75099dbf1 Mike Kravetz 2023-10-18  583   *		non-processed folios will remain on folio_list.
cfb8c75099dbf1 Mike Kravetz 2023-10-18  584   */
cfb8c75099dbf1 Mike Kravetz 2023-10-18  585  long hugetlb_vmemmap_restore_folios(const struct hstate *h,
cfb8c75099dbf1 Mike Kravetz 2023-10-18  586  					struct list_head *folio_list,
cfb8c75099dbf1 Mike Kravetz 2023-10-18  587  					struct list_head *non_hvo_folios)
cfb8c75099dbf1 Mike Kravetz 2023-10-18  588  {
cfb8c75099dbf1 Mike Kravetz 2023-10-18  589  	struct folio *folio, *t_folio;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  590  	long restored = 0;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  591  	long ret = 0;
c2a967f6ab0ec8 Yu Zhao      2024-07-18  592  	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
bd225530a4c717 Yu Zhao      2024-06-27  593  
cfb8c75099dbf1 Mike Kravetz 2023-10-18  594  	list_for_each_entry_safe(folio, t_folio, folio_list, lru) {
cfb8c75099dbf1 Mike Kravetz 2023-10-18  595  		if (folio_test_hugetlb_vmemmap_optimized(folio)) {
c2a967f6ab0ec8 Yu Zhao      2024-07-18  596  			ret = __hugetlb_vmemmap_restore_folio(h, folio, flags);
c2a967f6ab0ec8 Yu Zhao      2024-07-18  597  			/* only need to synchronize_rcu() once for each batch */
c2a967f6ab0ec8 Yu Zhao      2024-07-18  598  			flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
c2a967f6ab0ec8 Yu Zhao      2024-07-18  599  
cfb8c75099dbf1 Mike Kravetz 2023-10-18  600  			if (ret)
cfb8c75099dbf1 Mike Kravetz 2023-10-18  601  				break;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  602  			restored++;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  603  		}
cfb8c75099dbf1 Mike Kravetz 2023-10-18  604  
cfb8c75099dbf1 Mike Kravetz 2023-10-18  605  		/* Add non-optimized folios to output list */
cfb8c75099dbf1 Mike Kravetz 2023-10-18  606  		list_move(&folio->lru, non_hvo_folios);
cfb8c75099dbf1 Mike Kravetz 2023-10-18  607  	}
cfb8c75099dbf1 Mike Kravetz 2023-10-18  608  
65e43809317a90 Yu Zhao      2024-10-20 @609  	if (restored && !(VMEMMAP_ARCH_TLB_FLUSH_FLAGS & VMEMMAP_REMAP_NO_TLB_FLUSH))
c24f188b228929 Mike Kravetz 2023-10-18  610  		flush_tlb_all();
cfb8c75099dbf1 Mike Kravetz 2023-10-18  611  	if (!ret)
cfb8c75099dbf1 Mike Kravetz 2023-10-18  612  		ret = restored;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  613  	return ret;
cfb8c75099dbf1 Mike Kravetz 2023-10-18  614  }
cfb8c75099dbf1 Mike Kravetz 2023-10-18  615  
6213834c10de95 Muchun Song  2022-06-28  616  /* Return true iff a HugeTLB whose vmemmap should and can be optimized. */
ebc20dcac4ce98 Muchun Song  2023-11-27  617  static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *folio)
66361095129b3b Muchun Song  2022-06-17  618  {
ebc20dcac4ce98 Muchun Song  2023-11-27  619  	if (folio_test_hugetlb_vmemmap_optimized(folio))
79359d6d24df2f Mike Kravetz 2023-10-18  620  		return false;
79359d6d24df2f Mike Kravetz 2023-10-18  621  
cf5472e5611338 Muchun Song  2022-06-28  622  	if (!READ_ONCE(vmemmap_optimize_enabled))
6213834c10de95 Muchun Song  2022-06-28  623  		return false;
6213834c10de95 Muchun Song  2022-06-28  624  
6213834c10de95 Muchun Song  2022-06-28  625  	if (!hugetlb_vmemmap_optimizable(h))
6213834c10de95 Muchun Song  2022-06-28  626  		return false;
66361095129b3b Muchun Song  2022-06-17  627  
6213834c10de95 Muchun Song  2022-06-28  628  	return true;
66361095129b3b Muchun Song  2022-06-17  629  }
66361095129b3b Muchun Song  2022-06-17  630  
c5ad3233ead566 Usama Arif   2023-10-11  631  static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
c5ad3233ead566 Usama Arif   2023-10-11  632  					    struct folio *folio,
f13b83fdd99640 Joao Martins 2023-10-18  633  					    struct list_head *vmemmap_pages,
f13b83fdd99640 Joao Martins 2023-10-18  634  					    unsigned long flags)
f41f2ed43ca525 Muchun Song  2021-06-30  635  {
91f386bf0772c1 Mike Kravetz 2023-10-18  636  	int ret = 0;
ebc20dcac4ce98 Muchun Song  2023-11-27  637  	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
6213834c10de95 Muchun Song  2022-06-28  638  	unsigned long vmemmap_reuse;
f41f2ed43ca525 Muchun Song  2021-06-30  639  
ebc20dcac4ce98 Muchun Song  2023-11-27  640  	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
bd225530a4c717 Yu Zhao      2024-06-27  641  	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
bd225530a4c717 Yu Zhao      2024-06-27  642  
ebc20dcac4ce98 Muchun Song  2023-11-27  643  	if (!vmemmap_should_optimize_folio(h, folio))
91f386bf0772c1 Mike Kravetz 2023-10-18  644  		return ret;
f41f2ed43ca525 Muchun Song  2021-06-30  645  
78f39084b41d28 Muchun Song  2022-05-13  646  	static_branch_inc(&hugetlb_optimize_vmemmap_key);
c2a967f6ab0ec8 Yu Zhao      2024-07-18  647  
c2a967f6ab0ec8 Yu Zhao      2024-07-18  648  	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
c2a967f6ab0ec8 Yu Zhao      2024-07-18  649  		synchronize_rcu();
f13b83fdd99640 Joao Martins 2023-10-18  650  	/*
f13b83fdd99640 Joao Martins 2023-10-18  651  	 * Very Subtle
f13b83fdd99640 Joao Martins 2023-10-18  652  	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
f13b83fdd99640 Joao Martins 2023-10-18  653  	 * immediately after remapping.  As a result, subsequent accesses
f13b83fdd99640 Joao Martins 2023-10-18  654  	 * and modifications to struct pages associated with the hugetlb
f13b83fdd99640 Joao Martins 2023-10-18  655  	 * page could be to the OLD struct pages.  Set the vmemmap optimized
f13b83fdd99640 Joao Martins 2023-10-18  656  	 * flag here so that it is copied to the new head page.  This keeps
f13b83fdd99640 Joao Martins 2023-10-18  657  	 * the old and new struct pages in sync.
f13b83fdd99640 Joao Martins 2023-10-18  658  	 * If there is an error during optimization, we will immediately FLUSH
f13b83fdd99640 Joao Martins 2023-10-18  659  	 * the TLB and clear the flag below.
f13b83fdd99640 Joao Martins 2023-10-18  660  	 */
c5ad3233ead566 Usama Arif   2023-10-11  661  	folio_set_hugetlb_vmemmap_optimized(folio);
78f39084b41d28 Muchun Song  2022-05-13  662  
6213834c10de95 Muchun Song  2022-06-28  663  	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
6213834c10de95 Muchun Song  2022-06-28  664  	vmemmap_reuse	= vmemmap_start;
6213834c10de95 Muchun Song  2022-06-28  665  	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
f41f2ed43ca525 Muchun Song  2021-06-30  666  
f41f2ed43ca525 Muchun Song  2021-06-30  667  	/*
6213834c10de95 Muchun Song  2022-06-28  668  	 * Remap the vmemmap virtual address range [@vmemmap_start, @vmemmap_end)
91f386bf0772c1 Mike Kravetz 2023-10-18  669  	 * to the page which @vmemmap_reuse is mapped to.  Add pages previously
91f386bf0772c1 Mike Kravetz 2023-10-18  670  	 * mapping the range to vmemmap_pages list so that they can be freed by
91f386bf0772c1 Mike Kravetz 2023-10-18  671  	 * the caller.
f41f2ed43ca525 Muchun Song  2021-06-30  672  	 */
f13b83fdd99640 Joao Martins 2023-10-18  673  	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end, vmemmap_reuse,
f13b83fdd99640 Joao Martins 2023-10-18  674  				 vmemmap_pages, flags);
f13b83fdd99640 Joao Martins 2023-10-18  675  	if (ret) {
78f39084b41d28 Muchun Song  2022-05-13  676  		static_branch_dec(&hugetlb_optimize_vmemmap_key);
c5ad3233ead566 Usama Arif   2023-10-11  677  		folio_clear_hugetlb_vmemmap_optimized(folio);
f13b83fdd99640 Joao Martins 2023-10-18  678  	}
91f386bf0772c1 Mike Kravetz 2023-10-18  679  
91f386bf0772c1 Mike Kravetz 2023-10-18  680  	return ret;
91f386bf0772c1 Mike Kravetz 2023-10-18  681  }
91f386bf0772c1 Mike Kravetz 2023-10-18  682  
91f386bf0772c1 Mike Kravetz 2023-10-18  683  /**
c5ad3233ead566 Usama Arif   2023-10-11  684   * hugetlb_vmemmap_optimize_folio - optimize @folio's vmemmap pages.
91f386bf0772c1 Mike Kravetz 2023-10-18  685   * @h:		struct hstate.
c5ad3233ead566 Usama Arif   2023-10-11  686   * @folio:     the folio whose vmemmap pages will be optimized.
91f386bf0772c1 Mike Kravetz 2023-10-18  687   *
c5ad3233ead566 Usama Arif   2023-10-11  688   * This function only tries to optimize @folio's vmemmap pages and does not
91f386bf0772c1 Mike Kravetz 2023-10-18  689   * guarantee that the optimization will succeed after it returns. The caller
c5ad3233ead566 Usama Arif   2023-10-11  690   * can use folio_test_hugetlb_vmemmap_optimized(@folio) to detect if @folio's
c5ad3233ead566 Usama Arif   2023-10-11  691   * vmemmap pages have been optimized.
91f386bf0772c1 Mike Kravetz 2023-10-18  692   */
c5ad3233ead566 Usama Arif   2023-10-11  693  void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
91f386bf0772c1 Mike Kravetz 2023-10-18  694  {
91f386bf0772c1 Mike Kravetz 2023-10-18  695  	LIST_HEAD(vmemmap_pages);
91f386bf0772c1 Mike Kravetz 2023-10-18  696  
65e43809317a90 Yu Zhao      2024-10-20  697  	__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages,
65e43809317a90 Yu Zhao      2024-10-20  698  			VMEMMAP_SYNCHRONIZE_RCU | VMEMMAP_ARCH_TLB_FLUSH_FLAGS);
91f386bf0772c1 Mike Kravetz 2023-10-18  699  	free_vmemmap_page_list(&vmemmap_pages);
f41f2ed43ca525 Muchun Song  2021-06-30  700  }
774905878fc9b0 Muchun Song  2021-06-30  701  
ebc20dcac4ce98 Muchun Song  2023-11-27  702  static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *folio)
f4b7e3efaddbf8 Joao Martins 2023-10-18  703  {
ebc20dcac4ce98 Muchun Song  2023-11-27  704  	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
f4b7e3efaddbf8 Joao Martins 2023-10-18  705  	unsigned long vmemmap_reuse;
f4b7e3efaddbf8 Joao Martins 2023-10-18  706  
ebc20dcac4ce98 Muchun Song  2023-11-27  707  	if (!vmemmap_should_optimize_folio(h, folio))
f4b7e3efaddbf8 Joao Martins 2023-10-18  708  		return 0;
f4b7e3efaddbf8 Joao Martins 2023-10-18  709  
f4b7e3efaddbf8 Joao Martins 2023-10-18  710  	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
f4b7e3efaddbf8 Joao Martins 2023-10-18  711  	vmemmap_reuse	= vmemmap_start;
f4b7e3efaddbf8 Joao Martins 2023-10-18  712  	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
f4b7e3efaddbf8 Joao Martins 2023-10-18  713  
f4b7e3efaddbf8 Joao Martins 2023-10-18  714  	/*
f4b7e3efaddbf8 Joao Martins 2023-10-18  715  	 * Split PMDs on the vmemmap virtual address range [@vmemmap_start,
f4b7e3efaddbf8 Joao Martins 2023-10-18  716  	 * @vmemmap_end]
f4b7e3efaddbf8 Joao Martins 2023-10-18  717  	 */
f4b7e3efaddbf8 Joao Martins 2023-10-18  718  	return vmemmap_remap_split(vmemmap_start, vmemmap_end, vmemmap_reuse);
f4b7e3efaddbf8 Joao Martins 2023-10-18  719  }
f4b7e3efaddbf8 Joao Martins 2023-10-18  720  
79359d6d24df2f Mike Kravetz 2023-10-18  721  void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list)
79359d6d24df2f Mike Kravetz 2023-10-18  722  {
79359d6d24df2f Mike Kravetz 2023-10-18  723  	struct folio *folio;
91f386bf0772c1 Mike Kravetz 2023-10-18  724  	LIST_HEAD(vmemmap_pages);
c2a967f6ab0ec8 Yu Zhao      2024-07-18  725  	unsigned long flags = VMEMMAP_REMAP_NO_TLB_FLUSH | VMEMMAP_SYNCHRONIZE_RCU;
79359d6d24df2f Mike Kravetz 2023-10-18  726  
f4b7e3efaddbf8 Joao Martins 2023-10-18  727  	list_for_each_entry(folio, folio_list, lru) {
ebc20dcac4ce98 Muchun Song  2023-11-27  728  		int ret = hugetlb_vmemmap_split_folio(h, folio);
f4b7e3efaddbf8 Joao Martins 2023-10-18  729  
f4b7e3efaddbf8 Joao Martins 2023-10-18  730  		/*
f4b7e3efaddbf8 Joao Martins 2023-10-18  731  		 * Spliting the PMD requires allocating a page, thus lets fail
f4b7e3efaddbf8 Joao Martins 2023-10-18  732  		 * early once we encounter the first OOM. No point in retrying
f4b7e3efaddbf8 Joao Martins 2023-10-18  733  		 * as it can be dynamically done on remap with the memory
f4b7e3efaddbf8 Joao Martins 2023-10-18  734  		 * we get back from the vmemmap deduplication.
f4b7e3efaddbf8 Joao Martins 2023-10-18  735  		 */
f4b7e3efaddbf8 Joao Martins 2023-10-18  736  		if (ret == -ENOMEM)
f4b7e3efaddbf8 Joao Martins 2023-10-18  737  			break;
f4b7e3efaddbf8 Joao Martins 2023-10-18  738  	}
f4b7e3efaddbf8 Joao Martins 2023-10-18  739  
65e43809317a90 Yu Zhao      2024-10-20 @740  	if (!(VMEMMAP_ARCH_TLB_FLUSH_FLAGS & VMEMMAP_SPLIT_NO_TLB_FLUSH))
f4b7e3efaddbf8 Joao Martins 2023-10-18  741  		flush_tlb_all();
f4b7e3efaddbf8 Joao Martins 2023-10-18  742  
91f386bf0772c1 Mike Kravetz 2023-10-18  743  	list_for_each_entry(folio, folio_list, lru) {
ebc20dcac4ce98 Muchun Song  2023-11-27  744  		int ret;
ebc20dcac4ce98 Muchun Song  2023-11-27  745  
c2a967f6ab0ec8 Yu Zhao      2024-07-18  746  		ret = __hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, flags);
c2a967f6ab0ec8 Yu Zhao      2024-07-18  747  		/* only need to synchronize_rcu() once for each batch */
c2a967f6ab0ec8 Yu Zhao      2024-07-18  748  		flags &= ~VMEMMAP_SYNCHRONIZE_RCU;
91f386bf0772c1 Mike Kravetz 2023-10-18  749  
91f386bf0772c1 Mike Kravetz 2023-10-18  750  		/*
91f386bf0772c1 Mike Kravetz 2023-10-18  751  		 * Pages to be freed may have been accumulated.  If we
91f386bf0772c1 Mike Kravetz 2023-10-18  752  		 * encounter an ENOMEM,  free what we have and try again.
f13b83fdd99640 Joao Martins 2023-10-18  753  		 * This can occur in the case that both spliting fails
f13b83fdd99640 Joao Martins 2023-10-18  754  		 * halfway and head page allocation also failed. In this
c5ad3233ead566 Usama Arif   2023-10-11  755  		 * case __hugetlb_vmemmap_optimize_folio() would free memory
f13b83fdd99640 Joao Martins 2023-10-18  756  		 * allowing more vmemmap remaps to occur.
91f386bf0772c1 Mike Kravetz 2023-10-18  757  		 */
91f386bf0772c1 Mike Kravetz 2023-10-18  758  		if (ret == -ENOMEM && !list_empty(&vmemmap_pages)) {
65e43809317a90 Yu Zhao      2024-10-20  759  			if (!(VMEMMAP_ARCH_TLB_FLUSH_FLAGS & VMEMMAP_REMAP_NO_TLB_FLUSH))
f13b83fdd99640 Joao Martins 2023-10-18  760  				flush_tlb_all();
91f386bf0772c1 Mike Kravetz 2023-10-18  761  			free_vmemmap_page_list(&vmemmap_pages);
91f386bf0772c1 Mike Kravetz 2023-10-18  762  			INIT_LIST_HEAD(&vmemmap_pages);
c2a967f6ab0ec8 Yu Zhao      2024-07-18  763  			__hugetlb_vmemmap_optimize_folio(h, folio, &vmemmap_pages, flags);
91f386bf0772c1 Mike Kravetz 2023-10-18  764  		}
91f386bf0772c1 Mike Kravetz 2023-10-18  765  	}
91f386bf0772c1 Mike Kravetz 2023-10-18  766  
65e43809317a90 Yu Zhao      2024-10-20  767  	if (!(VMEMMAP_ARCH_TLB_FLUSH_FLAGS & VMEMMAP_REMAP_NO_TLB_FLUSH))
f13b83fdd99640 Joao Martins 2023-10-18  768  		flush_tlb_all();
91f386bf0772c1 Mike Kravetz 2023-10-18  769  	free_vmemmap_page_list(&vmemmap_pages);
79359d6d24df2f Mike Kravetz 2023-10-18  770  }
79359d6d24df2f Mike Kravetz 2023-10-18  771  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
