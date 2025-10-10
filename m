Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F2A1DDC33
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 20:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760128586; cv=none; b=alXzJ8Zwjg8kUlx8rHXhErdUOTGKvwIAGzpSi7T5WG4JUkDHkw9bN5Dlc5e7DNH1v2u2t28hu2ozkan+dfNf9vMgTOCgIOLMEN0e+y6gO3Hk0YHeWOhpCWmU8OQtUtIzh723JUKSaQ7scZ4RDvOouWszrSQIdy5VU986dMI/bgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760128586; c=relaxed/simple;
	bh=xOYr6XbOy5/fqjda5llZLWygfCAocaNumD8i+MHYFrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InUpCStV6pZBdjw0nysUb5DjuyxxCIJ6pNL1CGLrOoIGpwLS3CwoqvGs81FroumEJIYzC0dVthoXuJP2lpB6kTXs9CdSONig5JPV+XBQd3DwIb6wsAE9DTLk9wmRLvxkbpP38U+LkQK5NCuL+bUR3B4vSKyfoZyKwzf3vPEC6ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EX7vK2ba; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EX7vK2ba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760128584; x=1791664584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOYr6XbOy5/fqjda5llZLWygfCAocaNumD8i+MHYFrY=;
  b=EX7vK2baJBPDqFZK9roDShdVjCTthOMhOVrIQUZ0YLjLgYQWcdx40Wc5
   3kR0WJIsZz1Mcprt0TOY2AYSLhpuCP0h7FNj4iwmbF8FxLFl6OFPYm6F5
   q9+/OFckvTqtjWqCzltnbGjusukliPRtnFKNlck19SjfmG/T1GdWBcIRJ
   J+l2qtaIS0HxZ3ZjrnlHGdl9sXCFwpBlM97r5TM01/cQdQXiI+Vctbm+2
   G31x0Ysifnssolp6YN2b9Uxs9xYGmWyXCjq9Kcm+bXSBC8TLlLehB1wM4
   +Ovnj+BuSdqt3BcKtOS+fOJu9bq8I7/h9XXYdrArdrD30M1QvKwO8GhIX
   w==;
X-CSE-ConnectionGUID: xxRUbXtvS6+BWD2fm4CTxA==
X-CSE-MsgGUID: sX8JzXZ6TtmmhydbxqKP0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64974834"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="64974834"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 13:36:23 -0700
X-CSE-ConnectionGUID: mOCY6eFuT5mxCPq9WKO2hA==
X-CSE-MsgGUID: /R1kXU7iRiSLBZMDLNxG6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="181012760"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 13:36:22 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Jqe-00039R-0R;
	Fri, 10 Oct 2025 20:36:20 +0000
Date: Sat, 11 Oct 2025 04:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_all 36/59]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_dart_iova_to_phys()
 warn: sizeof(NUMBER)?
Message-ID: <202510110416.KW9IRs17-lkp@intel.com>
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

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   9c69ad5f7c8c4c920b421601258f0c8b120dd80c
commit: e422bd0e764d653ae378c39f3918735e7168a87f [36/59] iommupt: Add the DART v1/v2 page table format
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110416.KW9IRs17-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510110416.KW9IRs17-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:180 pt_iommu_dart_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:322 dart_set_dirty() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:208 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:753 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:753 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:702 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1114 pt_init_common() warn: bitwise AND condition is false here

vim +180 drivers/iommu/generic_pt/fmt/../iommu_pt.h

fde43dfc31dc9b Jason Gunthorpe 2024-06-28  158  
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  159  /**
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  160   * iova_to_phys() - Return the output address for the given IOVA
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  161   * @iommu_table: Table to query
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  162   * @iova: IO virtual address to query
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  163   *
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  164   * Determine the output address from the given IOVA. @iova may have any
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  165   * alignment, the returned physical will be adjusted with any sub page offset.
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  166   *
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  167   * Context: The caller must hold a read range lock that includes @iova.
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  168   *
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  169   * Return: 0 if there is no translation for the given iova.
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  170   */
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  171  phys_addr_t DOMAIN_NS(iova_to_phys)(struct iommu_domain *domain,
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  172  				    dma_addr_t iova)
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  173  {
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  174  	struct pt_iommu *iommu_table =
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  175  		container_of(domain, struct pt_iommu, domain);
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  176  	struct pt_range range;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  177  	pt_oaddr_t res;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  178  	int ret;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  179  
fde43dfc31dc9b Jason Gunthorpe 2024-06-28 @180  	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  181  	if (ret)
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  182  		return ret;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  183  
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  184  	ret = pt_walk_range(&range, __iova_to_phys, &res);
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  185  	/* PHYS_ADDR_MAX would be a better error code */
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  186  	if (ret)
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  187  		return 0;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  188  	return res;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  189  }
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  190  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(iova_to_phys), "GENERIC_PT_IOMMU");
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  191  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  192  struct pt_iommu_dirty_args {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  193  	struct iommu_dirty_bitmap *dirty;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  194  	unsigned int flags;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  195  };
02831dddd39fe9 Jason Gunthorpe 2024-07-18  196  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  197  static void record_dirty(struct pt_state *pts,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  198  			 struct pt_iommu_dirty_args *dirty,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  199  			 unsigned int num_contig_lg2)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  200  {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  201  	pt_vaddr_t dirty_len;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  202  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  203  	if (num_contig_lg2 != ilog2(1)) {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  204  		unsigned int index = pts->index;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  205  		unsigned int end_index = log2_set_mod_max_t(
02831dddd39fe9 Jason Gunthorpe 2024-07-18  206  			unsigned int, pts->index, num_contig_lg2);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  207  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  208  		/* Adjust for being contained inside a contiguous page */
02831dddd39fe9 Jason Gunthorpe 2024-07-18  209  		end_index = min(end_index, pts->end_index);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  210  		dirty_len = (end_index - index) *
02831dddd39fe9 Jason Gunthorpe 2024-07-18  211  				log2_to_int(pt_table_item_lg2sz(pts));
02831dddd39fe9 Jason Gunthorpe 2024-07-18  212  	} else {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  213  		dirty_len = log2_to_int(pt_table_item_lg2sz(pts));
02831dddd39fe9 Jason Gunthorpe 2024-07-18  214  	}
02831dddd39fe9 Jason Gunthorpe 2024-07-18  215  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  216  	if (dirty->dirty->bitmap)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  217  		iova_bitmap_set(dirty->dirty->bitmap, pts->range->va,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  218  				dirty_len);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  219  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  220  	if (!(dirty->flags & IOMMU_DIRTY_NO_CLEAR)) {
4a2e2b84fb4dbf Jason Gunthorpe 2025-06-06  221  		/*
4a2e2b84fb4dbf Jason Gunthorpe 2025-06-06  222  		 * No write log required because DMA incoherence and atomic
4a2e2b84fb4dbf Jason Gunthorpe 2025-06-06  223  		 * dirty tracking bits can't work together
4a2e2b84fb4dbf Jason Gunthorpe 2025-06-06  224  		 */
02831dddd39fe9 Jason Gunthorpe 2024-07-18  225  		pt_entry_set_write_clean(pts);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  226  		iommu_iotlb_gather_add_range(dirty->dirty->gather,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  227  					     pts->range->va, dirty_len);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  228  	}
02831dddd39fe9 Jason Gunthorpe 2024-07-18  229  }
02831dddd39fe9 Jason Gunthorpe 2024-07-18  230  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  231  static inline int __read_and_clear_dirty(struct pt_range *range, void *arg,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  232  					 unsigned int level,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  233  					 struct pt_table_p *table)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  234  {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  235  	struct pt_state pts = pt_init(range, level, table);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  236  	struct pt_iommu_dirty_args *dirty = arg;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  237  	int ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  238  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  239  	for_each_pt_level_entry(&pts) {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  240  		if (pts.type == PT_ENTRY_TABLE) {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  241  			ret = pt_descend(&pts, arg, __read_and_clear_dirty);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  242  			if (ret)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  243  				return ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  244  			continue;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  245  		}
02831dddd39fe9 Jason Gunthorpe 2024-07-18  246  		if (pts.type == PT_ENTRY_OA && pt_entry_write_is_dirty(&pts))
02831dddd39fe9 Jason Gunthorpe 2024-07-18  247  			record_dirty(&pts, dirty,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  248  				     pt_entry_num_contig_lg2(&pts));
02831dddd39fe9 Jason Gunthorpe 2024-07-18  249  	}
02831dddd39fe9 Jason Gunthorpe 2024-07-18  250  	return 0;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  251  }
02831dddd39fe9 Jason Gunthorpe 2024-07-18  252  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  253  /**
02831dddd39fe9 Jason Gunthorpe 2024-07-18  254   * read_and_clear_dirty() - Manipulate the HW set write dirty state
02831dddd39fe9 Jason Gunthorpe 2024-07-18  255   * @domain: Domain to manipulate
02831dddd39fe9 Jason Gunthorpe 2024-07-18  256   * @iova: IO virtual address to start
02831dddd39fe9 Jason Gunthorpe 2024-07-18  257   * @size: Length of the IOVA
02831dddd39fe9 Jason Gunthorpe 2024-07-18  258   * @flags: A bitmap of IOMMU_DIRTY_NO_CLEAR
02831dddd39fe9 Jason Gunthorpe 2024-07-18  259   * @dirty: Place to store the dirty bits
02831dddd39fe9 Jason Gunthorpe 2024-07-18  260   *
02831dddd39fe9 Jason Gunthorpe 2024-07-18  261   * Iterate over all the entries in the mapped range and record their write dirty
02831dddd39fe9 Jason Gunthorpe 2024-07-18  262   * status in iommu_dirty_bitmap. If IOMMU_DIRTY_NO_CLEAR is not specified then
02831dddd39fe9 Jason Gunthorpe 2024-07-18  263   * the entries will be left dirty, otherwise they are returned to being not
02831dddd39fe9 Jason Gunthorpe 2024-07-18  264   * write dirty.
02831dddd39fe9 Jason Gunthorpe 2024-07-18  265   *
02831dddd39fe9 Jason Gunthorpe 2024-07-18  266   * Context: The caller must hold a read range lock that includes @iova.
02831dddd39fe9 Jason Gunthorpe 2024-07-18  267   *
02831dddd39fe9 Jason Gunthorpe 2024-07-18  268   * Returns: -ERRNO on failure, 0 on success.
02831dddd39fe9 Jason Gunthorpe 2024-07-18  269   */
02831dddd39fe9 Jason Gunthorpe 2024-07-18  270  int DOMAIN_NS(read_and_clear_dirty)(struct iommu_domain *domain,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  271  				    unsigned long iova, size_t size,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  272  				    unsigned long flags,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  273  				    struct iommu_dirty_bitmap *dirty)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  274  {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  275  	struct pt_iommu *iommu_table =
02831dddd39fe9 Jason Gunthorpe 2024-07-18  276  		container_of(domain, struct pt_iommu, domain);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  277  	struct pt_iommu_dirty_args dirty_args = {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  278  		.dirty = dirty,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  279  		.flags = flags,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  280  	};
02831dddd39fe9 Jason Gunthorpe 2024-07-18  281  	struct pt_range range;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  282  	int ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  283  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  284  #if !IS_ENABLED(CONFIG_IOMMUFD_DRIVER) || !defined(pt_entry_write_is_dirty)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  285  	return -EOPNOTSUPP;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  286  #endif
02831dddd39fe9 Jason Gunthorpe 2024-07-18  287  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  288  	ret = make_range(common_from_iommu(iommu_table), &range, iova, size);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  289  	if (ret)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  290  		return ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  291  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  292  	ret = pt_walk_range(&range, __read_and_clear_dirty, &dirty_args);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  293  	PT_WARN_ON(ret);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  294  	return ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  295  }
02831dddd39fe9 Jason Gunthorpe 2024-07-18  296  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(read_and_clear_dirty), "GENERIC_PT_IOMMU");
02831dddd39fe9 Jason Gunthorpe 2024-07-18  297  
e919c47afc07f5 Jason Gunthorpe 2024-08-21  298  static inline int __set_dirty(struct pt_range *range, void *arg,
e919c47afc07f5 Jason Gunthorpe 2024-08-21  299  			      unsigned int level, struct pt_table_p *table)
e919c47afc07f5 Jason Gunthorpe 2024-08-21  300  {
e919c47afc07f5 Jason Gunthorpe 2024-08-21  301  	struct pt_state pts = pt_init(range, level, table);
e919c47afc07f5 Jason Gunthorpe 2024-08-21  302  
e919c47afc07f5 Jason Gunthorpe 2024-08-21  303  	switch (pt_load_single_entry(&pts)) {
e919c47afc07f5 Jason Gunthorpe 2024-08-21  304  	case PT_ENTRY_EMPTY:
e919c47afc07f5 Jason Gunthorpe 2024-08-21  305  		return -ENOENT;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  306  	case PT_ENTRY_TABLE:
e919c47afc07f5 Jason Gunthorpe 2024-08-21  307  		return pt_descend(&pts, arg, __set_dirty);
e919c47afc07f5 Jason Gunthorpe 2024-08-21  308  	case PT_ENTRY_OA:
e919c47afc07f5 Jason Gunthorpe 2024-08-21  309  		if (!pt_entry_make_write_dirty(&pts))
e919c47afc07f5 Jason Gunthorpe 2024-08-21  310  			return -EAGAIN;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  311  		return 0;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  312  	}
e919c47afc07f5 Jason Gunthorpe 2024-08-21  313  	return -ENOENT;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  314  }
e919c47afc07f5 Jason Gunthorpe 2024-08-21  315  
e919c47afc07f5 Jason Gunthorpe 2024-08-21  316  static int __maybe_unused NS(set_dirty)(struct pt_iommu *iommu_table,
e919c47afc07f5 Jason Gunthorpe 2024-08-21  317  					dma_addr_t iova)
e919c47afc07f5 Jason Gunthorpe 2024-08-21  318  {
e919c47afc07f5 Jason Gunthorpe 2024-08-21  319  	struct pt_range range;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  320  	int ret;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  321  
e919c47afc07f5 Jason Gunthorpe 2024-08-21 @322  	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
e919c47afc07f5 Jason Gunthorpe 2024-08-21  323  	if (ret)
e919c47afc07f5 Jason Gunthorpe 2024-08-21  324  		return ret;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  325  
e919c47afc07f5 Jason Gunthorpe 2024-08-21  326  	/*
e919c47afc07f5 Jason Gunthorpe 2024-08-21  327  	 * Note: There is no locking here yet, if the test suite races this it
e919c47afc07f5 Jason Gunthorpe 2024-08-21  328  	 * can crash. It should use RCU locking eventually.
e919c47afc07f5 Jason Gunthorpe 2024-08-21  329  	 */
e919c47afc07f5 Jason Gunthorpe 2024-08-21  330  	return pt_walk_range(&range, __set_dirty, NULL);
e919c47afc07f5 Jason Gunthorpe 2024-08-21  331  }
e919c47afc07f5 Jason Gunthorpe 2024-08-21  332  

:::::: The code at line 180 was first introduced by commit
:::::: fde43dfc31dc9bbfb4524e00e55f4a9f6d6012b4 iommupt: Add iova_to_phys op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
