Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8665920C004
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760118551; cv=none; b=E+4bSWtgVhFEP63k1Fd5EVL1U/buoVmCXgZ8v0UoJQ+K2nvyxRG/uxQAXQC4T6c2TQMES1Mk7CkUMOHcM2QdsLyfDG59YhZaqPpXPO7FF/UKmv7XYBtec2Ydbp9plmey+2k5ZO2mhA2UJTYAukHnwqtSKFwISONnjBooFFbJwSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760118551; c=relaxed/simple;
	bh=LtI7otrNSHMapyXrQOZNHhdxt+83Z3bICgpI/1SLSm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nlSd8L+jFf1FzV0YSZ7p8ldyAbKBypKlh8da3O2i0pptutO7mr2SwP0BhKmHYU64OBgNoi54Kjd10+HA+b/qKnylj382gkSBRDsYm/H47Or0O26KIxfjgq/oQiqzU1rheirRB+a8qLHBUFx7FY4Q0iUSuAhFPugM9NbIP/NLlcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Usk0E5P7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Usk0E5P7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760118550; x=1791654550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtI7otrNSHMapyXrQOZNHhdxt+83Z3bICgpI/1SLSm0=;
  b=Usk0E5P703GxdwrtnVs3h5R6C2M8t7ufAEuEaPyYNcigjiYO5twR8D/h
   HhUgl3EK2/4JupHldbA39ImkRV6iPoWkaLnhvlrnA1w0uaoKAOc7/D/zE
   amQgUZDp6KENQwE7Py1+7izCcmKrofyknZV1drHpemwNQz+Pp7mmcQb26
   OkjukGUT48uY3Jw4tVgfG4tfLO6NUiR3CqlzaDoKwEb1NWY+xPC90biRQ
   7FJuCWEfkVeJIRGYgf1QpN4nKcnKqHJKu3cLp2GsubEECvrbgT9yGcVM5
   cyYTpOJH0juj1fBdBDJ7MTXGjEIEAwaN4NGH0SINhHmFlJBeypFkYx7o0
   w==;
X-CSE-ConnectionGUID: bfRk9CfsQly9UhxYf7htfA==
X-CSE-MsgGUID: 6lmRFw46Tq6IY7rLcI2AEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="84966869"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="84966869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 10:49:10 -0700
X-CSE-ConnectionGUID: CEnLlQdVQsWriWfyDByPbQ==
X-CSE-MsgGUID: kmaDCh1yQWyYcsNW/P50zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="204716172"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Oct 2025 10:49:07 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7HEn-00031x-16;
	Fri, 10 Oct 2025 17:49:05 +0000
Date: Sat, 11 Oct 2025 01:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jgunthorpe:iommu_pt_vtd 18/34]
 drivers/iommu/generic_pt/fmt/../iommu_pt.h:153
 pt_iommu_riscv_64_iova_to_phys() warn: sizeof(NUMBER)?
Message-ID: <202510110151.yX8jxnt1-lkp@intel.com>
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
head:   385b726d52995c3f1842ab4218ab299ef44c2360
commit: 97e5a7c57e18331ad7bb48f1ce3366792af4069b [18/34] iommupt: Add the RISC-V page table format
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110151.yX8jxnt1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510110151.yX8jxnt1-lkp@intel.com/

New smatch warnings:
drivers/iommu/generic_pt/fmt/../iommu_pt.h:153 pt_iommu_riscv_64_iova_to_phys() warn: sizeof(NUMBER)?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:291 riscv_64_set_dirty() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/iommu/generic_pt/fmt/../pt_defs.h:205 pt_feature() warn: bitwise AND condition is false here
drivers/iommu/generic_pt/fmt/../iommu_pt.h:663 increase_top() error: uninitialized symbol 'table_mem'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:663 increase_top() error: uninitialized symbol 'new_level'.
drivers/iommu/generic_pt/fmt/../iommu_pt.h:622 increase_top() warn: missing unwind goto?
drivers/iommu/generic_pt/fmt/../iommu_pt.h:1015 pt_init_common() warn: bitwise AND condition is false here

vim +153 drivers/iommu/generic_pt/fmt/../iommu_pt.h

fde43dfc31dc9b Jason Gunthorpe 2024-06-28  131  
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  132  /**
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  133   * iova_to_phys() - Return the output address for the given IOVA
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  134   * @iommu_table: Table to query
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  135   * @iova: IO virtual address to query
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  136   *
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  137   * Determine the output address from the given IOVA. @iova may have any
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  138   * alignment, the returned physical will be adjusted with any sub page offset.
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  139   *
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  140   * Context: The caller must hold a read range lock that includes @iova.
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  141   *
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  142   * Return: 0 if there is no translation for the given iova.
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  143   */
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  144  phys_addr_t DOMAIN_NS(iova_to_phys)(struct iommu_domain *domain,
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  145  				    dma_addr_t iova)
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  146  {
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  147  	struct pt_iommu *iommu_table =
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  148  		container_of(domain, struct pt_iommu, domain);
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  149  	struct pt_range range;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  150  	pt_oaddr_t res;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  151  	int ret;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  152  
fde43dfc31dc9b Jason Gunthorpe 2024-06-28 @153  	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  154  	if (ret)
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  155  		return ret;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  156  
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  157  	ret = pt_walk_range(&range, __iova_to_phys, &res);
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  158  	/* PHYS_ADDR_MAX would be a better error code */
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  159  	if (ret)
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  160  		return 0;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  161  	return res;
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  162  }
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  163  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(iova_to_phys), "GENERIC_PT_IOMMU");
fde43dfc31dc9b Jason Gunthorpe 2024-06-28  164  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  165  struct pt_iommu_dirty_args {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  166  	struct iommu_dirty_bitmap *dirty;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  167  	unsigned int flags;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  168  };
02831dddd39fe9 Jason Gunthorpe 2024-07-18  169  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  170  static void record_dirty(struct pt_state *pts,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  171  			 struct pt_iommu_dirty_args *dirty,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  172  			 unsigned int num_contig_lg2)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  173  {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  174  	pt_vaddr_t dirty_len;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  175  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  176  	if (num_contig_lg2 != ilog2(1)) {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  177  		unsigned int index = pts->index;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  178  		unsigned int end_index = log2_set_mod_max_t(
02831dddd39fe9 Jason Gunthorpe 2024-07-18  179  			unsigned int, pts->index, num_contig_lg2);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  180  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  181  		/* Adjust for being contained inside a contiguous page */
02831dddd39fe9 Jason Gunthorpe 2024-07-18  182  		end_index = min(end_index, pts->end_index);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  183  		dirty_len = (end_index - index) *
02831dddd39fe9 Jason Gunthorpe 2024-07-18  184  				log2_to_int(pt_table_item_lg2sz(pts));
02831dddd39fe9 Jason Gunthorpe 2024-07-18  185  	} else {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  186  		dirty_len = log2_to_int(pt_table_item_lg2sz(pts));
02831dddd39fe9 Jason Gunthorpe 2024-07-18  187  	}
02831dddd39fe9 Jason Gunthorpe 2024-07-18  188  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  189  	if (dirty->dirty->bitmap)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  190  		iova_bitmap_set(dirty->dirty->bitmap, pts->range->va,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  191  				dirty_len);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  192  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  193  	if (!(dirty->flags & IOMMU_DIRTY_NO_CLEAR)) {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  194  		pt_entry_set_write_clean(pts);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  195  		iommu_iotlb_gather_add_range(dirty->dirty->gather,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  196  					     pts->range->va, dirty_len);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  197  	}
02831dddd39fe9 Jason Gunthorpe 2024-07-18  198  }
02831dddd39fe9 Jason Gunthorpe 2024-07-18  199  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  200  static inline int __read_and_clear_dirty(struct pt_range *range, void *arg,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  201  					 unsigned int level,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  202  					 struct pt_table_p *table)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  203  {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  204  	struct pt_state pts = pt_init(range, level, table);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  205  	struct pt_iommu_dirty_args *dirty = arg;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  206  	int ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  207  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  208  	for_each_pt_level_entry(&pts) {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  209  		if (pts.type == PT_ENTRY_TABLE) {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  210  			ret = pt_descend(&pts, arg, __read_and_clear_dirty);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  211  			if (ret)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  212  				return ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  213  			continue;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  214  		}
02831dddd39fe9 Jason Gunthorpe 2024-07-18  215  		if (pts.type == PT_ENTRY_OA && pt_entry_write_is_dirty(&pts))
02831dddd39fe9 Jason Gunthorpe 2024-07-18  216  			record_dirty(&pts, dirty,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  217  				     pt_entry_num_contig_lg2(&pts));
02831dddd39fe9 Jason Gunthorpe 2024-07-18  218  	}
02831dddd39fe9 Jason Gunthorpe 2024-07-18  219  	return 0;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  220  }
02831dddd39fe9 Jason Gunthorpe 2024-07-18  221  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  222  /**
02831dddd39fe9 Jason Gunthorpe 2024-07-18  223   * read_and_clear_dirty() - Manipulate the HW set write dirty state
02831dddd39fe9 Jason Gunthorpe 2024-07-18  224   * @domain: Domain to manipulate
02831dddd39fe9 Jason Gunthorpe 2024-07-18  225   * @iova: IO virtual address to start
02831dddd39fe9 Jason Gunthorpe 2024-07-18  226   * @size: Length of the IOVA
02831dddd39fe9 Jason Gunthorpe 2024-07-18  227   * @flags: A bitmap of IOMMU_DIRTY_NO_CLEAR
02831dddd39fe9 Jason Gunthorpe 2024-07-18  228   * @dirty: Place to store the dirty bits
02831dddd39fe9 Jason Gunthorpe 2024-07-18  229   *
02831dddd39fe9 Jason Gunthorpe 2024-07-18  230   * Iterate over all the entries in the mapped range and record their write dirty
02831dddd39fe9 Jason Gunthorpe 2024-07-18  231   * status in iommu_dirty_bitmap. If IOMMU_DIRTY_NO_CLEAR is not specified then
02831dddd39fe9 Jason Gunthorpe 2024-07-18  232   * the entries will be left dirty, otherwise they are returned to being not
02831dddd39fe9 Jason Gunthorpe 2024-07-18  233   * write dirty.
02831dddd39fe9 Jason Gunthorpe 2024-07-18  234   *
02831dddd39fe9 Jason Gunthorpe 2024-07-18  235   * Context: The caller must hold a read range lock that includes @iova.
02831dddd39fe9 Jason Gunthorpe 2024-07-18  236   *
02831dddd39fe9 Jason Gunthorpe 2024-07-18  237   * Returns: -ERRNO on failure, 0 on success.
02831dddd39fe9 Jason Gunthorpe 2024-07-18  238   */
02831dddd39fe9 Jason Gunthorpe 2024-07-18  239  int DOMAIN_NS(read_and_clear_dirty)(struct iommu_domain *domain,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  240  				    unsigned long iova, size_t size,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  241  				    unsigned long flags,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  242  				    struct iommu_dirty_bitmap *dirty)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  243  {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  244  	struct pt_iommu *iommu_table =
02831dddd39fe9 Jason Gunthorpe 2024-07-18  245  		container_of(domain, struct pt_iommu, domain);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  246  	struct pt_iommu_dirty_args dirty_args = {
02831dddd39fe9 Jason Gunthorpe 2024-07-18  247  		.dirty = dirty,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  248  		.flags = flags,
02831dddd39fe9 Jason Gunthorpe 2024-07-18  249  	};
02831dddd39fe9 Jason Gunthorpe 2024-07-18  250  	struct pt_range range;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  251  	int ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  252  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  253  #if !IS_ENABLED(CONFIG_IOMMUFD_DRIVER) || !defined(pt_entry_write_is_dirty)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  254  	return -EOPNOTSUPP;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  255  #endif
02831dddd39fe9 Jason Gunthorpe 2024-07-18  256  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  257  	ret = make_range(common_from_iommu(iommu_table), &range, iova, size);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  258  	if (ret)
02831dddd39fe9 Jason Gunthorpe 2024-07-18  259  		return ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  260  
02831dddd39fe9 Jason Gunthorpe 2024-07-18  261  	ret = pt_walk_range(&range, __read_and_clear_dirty, &dirty_args);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  262  	PT_WARN_ON(ret);
02831dddd39fe9 Jason Gunthorpe 2024-07-18  263  	return ret;
02831dddd39fe9 Jason Gunthorpe 2024-07-18  264  }
02831dddd39fe9 Jason Gunthorpe 2024-07-18  265  EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(read_and_clear_dirty), "GENERIC_PT_IOMMU");
02831dddd39fe9 Jason Gunthorpe 2024-07-18  266  
e919c47afc07f5 Jason Gunthorpe 2024-08-21  267  static inline int __set_dirty(struct pt_range *range, void *arg,
e919c47afc07f5 Jason Gunthorpe 2024-08-21  268  			      unsigned int level, struct pt_table_p *table)
e919c47afc07f5 Jason Gunthorpe 2024-08-21  269  {
e919c47afc07f5 Jason Gunthorpe 2024-08-21  270  	struct pt_state pts = pt_init(range, level, table);
e919c47afc07f5 Jason Gunthorpe 2024-08-21  271  
e919c47afc07f5 Jason Gunthorpe 2024-08-21  272  	switch (pt_load_single_entry(&pts)) {
e919c47afc07f5 Jason Gunthorpe 2024-08-21  273  	case PT_ENTRY_EMPTY:
e919c47afc07f5 Jason Gunthorpe 2024-08-21  274  		return -ENOENT;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  275  	case PT_ENTRY_TABLE:
e919c47afc07f5 Jason Gunthorpe 2024-08-21  276  		return pt_descend(&pts, arg, __set_dirty);
e919c47afc07f5 Jason Gunthorpe 2024-08-21  277  	case PT_ENTRY_OA:
e919c47afc07f5 Jason Gunthorpe 2024-08-21  278  		if (!pt_entry_make_write_dirty(&pts))
e919c47afc07f5 Jason Gunthorpe 2024-08-21  279  			return -EAGAIN;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  280  		return 0;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  281  	}
e919c47afc07f5 Jason Gunthorpe 2024-08-21  282  	return -ENOENT;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  283  }
e919c47afc07f5 Jason Gunthorpe 2024-08-21  284  
e919c47afc07f5 Jason Gunthorpe 2024-08-21  285  static int __maybe_unused NS(set_dirty)(struct pt_iommu *iommu_table,
e919c47afc07f5 Jason Gunthorpe 2024-08-21  286  					dma_addr_t iova)
e919c47afc07f5 Jason Gunthorpe 2024-08-21  287  {
e919c47afc07f5 Jason Gunthorpe 2024-08-21  288  	struct pt_range range;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  289  	int ret;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  290  
e919c47afc07f5 Jason Gunthorpe 2024-08-21 @291  	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
e919c47afc07f5 Jason Gunthorpe 2024-08-21  292  	if (ret)
e919c47afc07f5 Jason Gunthorpe 2024-08-21  293  		return ret;
e919c47afc07f5 Jason Gunthorpe 2024-08-21  294  
e919c47afc07f5 Jason Gunthorpe 2024-08-21  295  	/*
e919c47afc07f5 Jason Gunthorpe 2024-08-21  296  	 * Note: There is no locking here yet, if the test suite races this it
e919c47afc07f5 Jason Gunthorpe 2024-08-21  297  	 * can crash. It should use RCU locking eventually.
e919c47afc07f5 Jason Gunthorpe 2024-08-21  298  	 */
e919c47afc07f5 Jason Gunthorpe 2024-08-21  299  	return pt_walk_range(&range, __set_dirty, NULL);
e919c47afc07f5 Jason Gunthorpe 2024-08-21  300  }
e919c47afc07f5 Jason Gunthorpe 2024-08-21  301  

:::::: The code at line 153 was first introduced by commit
:::::: fde43dfc31dc9bbfb4524e00e55f4a9f6d6012b4 iommupt: Add iova_to_phys op

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
