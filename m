Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43661F9A8B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750260004; cv=none; b=D0am1TM+65FfhyEbU3XmCDnOuIBAY1mBv+eCVz+6Oh/32/c+jglE54JMypBogp0D6Wk+7RgDAMjI6XBt5RYzON9f65MaFRJA/aO6a+33rffr8dAEPCq1SKHPkx3EZoDa9Y6KMatJCYQuLTbVAHVS/3ss4dLUpuwPBJ1x8j/NDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750260004; c=relaxed/simple;
	bh=8JDmAH2EaF5bZZywGoxcHCKkpPCUgPDGJfXygsw3mvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWjO+AawC5lYBFP6y5B/QdParVk01SsiXwybnM8E8/ZcGbZjk66nr8mbob51xgaftGgOfEc9FzN4MlO95rpZj9PI2iFVhK5J4szAWlamqe/BvnxrBclSnAEsDIqPEmldPMPaM+oz0P9STp5hUJhC7P+fU78EMLKs3NrR9JqWijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nan8/MdV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nan8/MdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750260002; x=1781796002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JDmAH2EaF5bZZywGoxcHCKkpPCUgPDGJfXygsw3mvU=;
  b=Nan8/MdViOwEyJFbRXRCvtXpsUsZIFPBC3DVQ8EQlcIj5UAKirJ3EAMi
   SsOtcbKsOmW8MW97z5tgjED5IgJmdhkoGykrgWlI5GxWneKZqQIw+OaV2
   jz12yMHVjPwNJUZaluArZiPV0OuTiSvHmcsk76DkhmOelurtuWMeFm5Px
   4hyRCCSNnwsPAsDh7uxC3iKzvU3YH+ShFAfYmrZ2efw2cBNHZ3lFJULtY
   k1QQtH9TvfjkUROATOYW4c+GfYZoRELlXrWrHJC+GyRLfWwNgoKQ7f27I
   YLYn/EoOJLsr0EQkNCozEaLNoP8fKh9MD1lNaP5nvSrJyk6XnZZl3FZk0
   Q==;
X-CSE-ConnectionGUID: Fp8GQRyZR4+vFF1S3Jq8oQ==
X-CSE-MsgGUID: 6ZNvNOdHTaK8OPBj3iG9tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52629541"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52629541"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 08:20:01 -0700
X-CSE-ConnectionGUID: IZDQyfwRRqK6UljAnnfpog==
X-CSE-MsgGUID: 2JiZipklSAyr42IDg772rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="149509501"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Jun 2025 08:19:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRuZw-000JvO-2o;
	Wed, 18 Jun 2025 15:19:56 +0000
Date: Wed, 18 Jun 2025 23:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_vtd 37/42]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_vtdss_iova_to_phys()
 warn: sizeof(NUMBER)?
Message-ID: <202506182351.CXfinTmc-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   4245120afe2501de333527c4d900356914995527
commit: af685158951db3ab23ae6945fa93e2615bc8bc3f [37/42] iommupt: Add the Intel VT-D second stage page table format
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250618 (https://download.01.org/0day-ci/archive/20250618/202506182351.CXfinTmc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506182351.CXfinTmc-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_vtdss_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:321 vtdss_set_dirty() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:827 pt_iommu_vtdss_map_pages() warn: impossible condition '(paddr > 18446744073709551615) => (0-u64max > u64max)'

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:206 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:739 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:739 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:688 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1098 pt_init_common() warn: bitwise AND condition is false here

vim +180 drivers/iommu/generic_pt/fmt/../iommu_pt.h

49fea5b015c4530 Jason Gunthorpe 2024-06-28  158  
49fea5b015c4530 Jason Gunthorpe 2024-06-28  159  /**
49fea5b015c4530 Jason Gunthorpe 2024-06-28  160   * iova_to_phys() - Return the output address for the given IOVA
49fea5b015c4530 Jason Gunthorpe 2024-06-28  161   * @iommu_table: Table to query
49fea5b015c4530 Jason Gunthorpe 2024-06-28  162   * @iova: IO virtual address to query
49fea5b015c4530 Jason Gunthorpe 2024-06-28  163   *
49fea5b015c4530 Jason Gunthorpe 2024-06-28  164   * Determine the output address from the given IOVA. @iova may have any
49fea5b015c4530 Jason Gunthorpe 2024-06-28  165   * alignment, the returned physical will be adjusted with any sub page offset.
49fea5b015c4530 Jason Gunthorpe 2024-06-28  166   *
49fea5b015c4530 Jason Gunthorpe 2024-06-28  167   * Context: The caller must hold a read range lock that includes @iova.
49fea5b015c4530 Jason Gunthorpe 2024-06-28  168   *
49fea5b015c4530 Jason Gunthorpe 2024-06-28  169   * Return: 0 if there is no translation for the given iova.
49fea5b015c4530 Jason Gunthorpe 2024-06-28  170   */
49fea5b015c4530 Jason Gunthorpe 2024-06-28  171  phys_addr_t DOMAIN_NS(iova_to_phys)(struct iommu_domain *domain,
49fea5b015c4530 Jason Gunthorpe 2024-06-28  172  				    dma_addr_t iova)
49fea5b015c4530 Jason Gunthorpe 2024-06-28  173  {
49fea5b015c4530 Jason Gunthorpe 2024-06-28  174  	struct pt_iommu *iommu_table =
49fea5b015c4530 Jason Gunthorpe 2024-06-28  175  		container_of(domain, struct pt_iommu, domain);
49fea5b015c4530 Jason Gunthorpe 2024-06-28  176  	struct pt_range range;
49fea5b015c4530 Jason Gunthorpe 2024-06-28  177  	pt_oaddr_t res;
49fea5b015c4530 Jason Gunthorpe 2024-06-28  178  	int ret;
49fea5b015c4530 Jason Gunthorpe 2024-06-28  179  
49fea5b015c4530 Jason Gunthorpe 2024-06-28 @180  	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
49fea5b015c4530 Jason Gunthorpe 2024-06-28  181  	if (ret)
49fea5b015c4530 Jason Gunthorpe 2024-06-28  182  		return ret;
49fea5b015c4530 Jason Gunthorpe 2024-06-28  183  
49fea5b015c4530 Jason Gunthorpe 2024-06-28  184  	ret = pt_walk_range(&range, __iova_to_phys, &res);
49fea5b015c4530 Jason Gunthorpe 2024-06-28  185  	/* PHYS_ADDR_MAX would be a better error code */
49fea5b015c4530 Jason Gunthorpe 2024-06-28  186  	if (ret)
49fea5b015c4530 Jason Gunthorpe 2024-06-28  187  		return 0;
49fea5b015c4530 Jason Gunthorpe 2024-06-28  188  	return res;
49fea5b015c4530 Jason Gunthorpe 2024-06-28  189  }
49fea5b015c4530 Jason Gunthorpe 2024-06-28  190  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(iova_to_phys), "GENERIC_PT_IOMMU");
49fea5b015c4530 Jason Gunthorpe 2024-06-28  191  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  192  struct pt_iommu_dirty_args {
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  193  	struct iommu_dirty_bitmap *dirty;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  194  	unsigned int flags;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  195  };
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  196  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  197  static void record_dirty(struct pt_state *pts,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  198  			 struct pt_iommu_dirty_args *dirty,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  199  			 unsigned int num_contig_lg2)
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  200  {
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  201  	pt_vaddr_t dirty_len;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  202  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  203  	if (num_contig_lg2 != ilog2(1)) {
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  204  		unsigned int index = pts->index;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  205  		unsigned int end_index = log2_set_mod_max_t(
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  206  			unsigned int, pts->index, num_contig_lg2);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  207  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  208  		/* Adjust for being contained inside a contiguous page */
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  209  		end_index = min(end_index, pts->end_index);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  210  		dirty_len = (end_index - index) *
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  211  				log2_to_int(pt_table_item_lg2sz(pts));
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  212  	} else {
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  213  		dirty_len = log2_to_int(pt_table_item_lg2sz(pts));
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  214  	}
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  215  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  216  	if (dirty->dirty->bitmap)
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  217  		iova_bitmap_set(dirty->dirty->bitmap, pts->range->va,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  218  				dirty_len);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  219  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  220  	if (!(dirty->flags & IOMMU_DIRTY_NO_CLEAR)) {
3c800542a2f313f Jason Gunthorpe 2025-06-06  221  		/*
3c800542a2f313f Jason Gunthorpe 2025-06-06  222  		 * No write log required because DMA incoherence and atomic
3c800542a2f313f Jason Gunthorpe 2025-06-06  223  		 * dirty tracking bits can't work together
3c800542a2f313f Jason Gunthorpe 2025-06-06  224  		 */
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  225  		pt_entry_set_write_clean(pts);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  226  		iommu_iotlb_gather_add_range(dirty->dirty->gather,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  227  					     pts->range->va, dirty_len);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  228  	}
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  229  }
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  230  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  231  static inline int __read_and_clear_dirty(struct pt_range *range, void *arg,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  232  					 unsigned int level,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  233  					 struct pt_table_p *table)
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  234  {
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  235  	struct pt_state pts = pt_init(range, level, table);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  236  	struct pt_iommu_dirty_args *dirty = arg;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  237  	int ret;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  238  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  239  	for_each_pt_level_entry(&pts) {
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  240  		if (pts.type == PT_ENTRY_TABLE) {
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  241  			ret = pt_descend(&pts, arg, __read_and_clear_dirty);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  242  			if (ret)
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  243  				return ret;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  244  			continue;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  245  		}
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  246  		if (pts.type == PT_ENTRY_OA && pt_entry_write_is_dirty(&pts))
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  247  			record_dirty(&pts, dirty,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  248  				     pt_entry_num_contig_lg2(&pts));
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  249  	}
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  250  	return 0;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  251  }
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  252  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  253  /**
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  254   * read_and_clear_dirty() - Manipulate the HW set write dirty state
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  255   * @iommu_table: Table to manipulate
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  256   * @iova: IO virtual address to start
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  257   * @size: Length of the IOVA
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  258   * @flags: A bitmap of IOMMU_DIRTY_NO_CLEAR
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  259   *
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  260   * Iterate over all the entries in the mapped range and record their write dirty
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  261   * status in iommu_dirty_bitmap. If IOMMU_DIRTY_NO_CLEAR is not specified then
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  262   * the entries will be left dirty, otherwise they are returned to being not
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  263   * write dirty.
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  264   *
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  265   * Context: The caller must hold a read range lock that includes @iova.
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  266   *
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  267   * Returns: -ERRNO on failure, 0 on success.
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  268   */
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  269  int DOMAIN_NS(read_and_clear_dirty)(struct iommu_domain *domain,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  270  				    unsigned long iova, size_t size,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  271  				    unsigned long flags,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  272  				    struct iommu_dirty_bitmap *dirty)
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  273  {
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  274  	struct pt_iommu *iommu_table =
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  275  		container_of(domain, struct pt_iommu, domain);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  276  	struct pt_iommu_dirty_args dirty_args = {
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  277  		.dirty = dirty,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  278  		.flags = flags,
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  279  	};
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  280  	struct pt_range range;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  281  	int ret;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  282  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  283  #if !IS_ENABLED(CONFIG_IOMMUFD_DRIVER) || !defined(pt_entry_write_is_dirty)
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  284  	return -EOPNOTSUPP;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  285  #endif
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  286  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  287  	ret = make_range(common_from_iommu(iommu_table), &range, iova, size);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  288  	if (ret)
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  289  		return ret;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  290  
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  291  	ret = pt_walk_range(&range, __read_and_clear_dirty, &dirty_args);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  292  	PT_WARN_ON(ret);
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  293  	return ret;
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  294  }
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  295  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(read_and_clear_dirty), "GENERIC_PT_IOMMU");
1c8d1983105cf9c Jason Gunthorpe 2024-07-18  296  
161666fd7474542 Jason Gunthorpe 2024-08-21  297  static inline int __set_dirty(struct pt_range *range, void *arg,
161666fd7474542 Jason Gunthorpe 2024-08-21  298  			      unsigned int level, struct pt_table_p *table)
161666fd7474542 Jason Gunthorpe 2024-08-21  299  {
161666fd7474542 Jason Gunthorpe 2024-08-21  300  	struct pt_state pts = pt_init(range, level, table);
161666fd7474542 Jason Gunthorpe 2024-08-21  301  
161666fd7474542 Jason Gunthorpe 2024-08-21  302  	switch (pt_load_single_entry(&pts)) {
161666fd7474542 Jason Gunthorpe 2024-08-21  303  	case PT_ENTRY_EMPTY:
161666fd7474542 Jason Gunthorpe 2024-08-21  304  		return -ENOENT;
161666fd7474542 Jason Gunthorpe 2024-08-21  305  	case PT_ENTRY_TABLE:
161666fd7474542 Jason Gunthorpe 2024-08-21  306  		return pt_descend(&pts, arg, __set_dirty);
161666fd7474542 Jason Gunthorpe 2024-08-21  307  	case PT_ENTRY_OA:
161666fd7474542 Jason Gunthorpe 2024-08-21  308  		if (!pt_entry_make_write_dirty(&pts))
161666fd7474542 Jason Gunthorpe 2024-08-21  309  			return -EAGAIN;
161666fd7474542 Jason Gunthorpe 2024-08-21  310  		return 0;
161666fd7474542 Jason Gunthorpe 2024-08-21  311  	}
161666fd7474542 Jason Gunthorpe 2024-08-21  312  	return -ENOENT;
161666fd7474542 Jason Gunthorpe 2024-08-21  313  }
161666fd7474542 Jason Gunthorpe 2024-08-21  314  
161666fd7474542 Jason Gunthorpe 2024-08-21  315  static int __maybe_unused NS(set_dirty)(struct pt_iommu *iommu_table,
161666fd7474542 Jason Gunthorpe 2024-08-21  316  					dma_addr_t iova)
161666fd7474542 Jason Gunthorpe 2024-08-21  317  {
161666fd7474542 Jason Gunthorpe 2024-08-21  318  	struct pt_range range;
161666fd7474542 Jason Gunthorpe 2024-08-21  319  	int ret;
161666fd7474542 Jason Gunthorpe 2024-08-21  320  
161666fd7474542 Jason Gunthorpe 2024-08-21 @321  	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
161666fd7474542 Jason Gunthorpe 2024-08-21  322  	if (ret)
161666fd7474542 Jason Gunthorpe 2024-08-21  323  		return ret;
161666fd7474542 Jason Gunthorpe 2024-08-21  324  
161666fd7474542 Jason Gunthorpe 2024-08-21  325  	/*
161666fd7474542 Jason Gunthorpe 2024-08-21  326  	 * Note: There is no locking here yet, if the test suite races this it
161666fd7474542 Jason Gunthorpe 2024-08-21  327  	 * can crash. It should use RCU locking eventually.
161666fd7474542 Jason Gunthorpe 2024-08-21  328  	 */
161666fd7474542 Jason Gunthorpe 2024-08-21  329  	return pt_walk_range(&range, __set_dirty, NULL);
161666fd7474542 Jason Gunthorpe 2024-08-21  330  }
161666fd7474542 Jason Gunthorpe 2024-08-21  331  

:::::: The code at line 180 was first introduced by commit
:::::: 49fea5b015c4530dbf5cc5bee97f0a8e18531660 iommupt: Add iova_to_phys op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
