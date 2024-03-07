Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B3137C54
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Mar 2024 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709842827; cv=none; b=I+1J6Xg1ntA0oSDTYC3LBnR6bw4y+avIWsypC+PAyp5H1EHK4tcFpyFsKzV1gpzKfLG/1T/lyU3rclV0AainVETh3cJt0j61UZTJYv27MiJ2FUHyHQQzhI4uYQeAgtiKCfzVGkqcgKcImVgCdwgO6ydaATQKo7gQ1fzGfDLFlsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709842827; c=relaxed/simple;
	bh=J1kly9CxERUeC2FSPLEH3VMlZdCMDpnHl4xIw73KRpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H2iHS2E2u/hubXAEHHFint8yz60JB8O3Wcm7XLMNF76G0LB5bGCx5HzPiIol93yyYK8m9HaJSsVcwOntgvvNa9tGZrzdaP1/jf6ImJGQak5d30Ixbcj28PzStq6hL/y6mytK4MPnCvcyXquceMPtQDFbDfJ7F1Y3KfVP4/1Zmpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5P1xG3l; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5P1xG3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709842825; x=1741378825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1kly9CxERUeC2FSPLEH3VMlZdCMDpnHl4xIw73KRpo=;
  b=m5P1xG3lMmFMh6vDgzl//mto0bx2dLWaSpSP0KHfjAiFCyTvGroHVERA
   7clW+abPll5VIGNouJxFaFSGZKtyWSFPn6zuE3hRn60VHrMBKNrzW6fFf
   s1VggSa6Dmmi5eh9bDAn9HG8LHQWzyzDz6HiS0u00+Of0M6NojSeWIFcO
   VYEeoRJFgmN1iyfLuZxlsWM2eL6s+RLeE9n11ZGeY8neOiOkepi9ZSYIH
   SiNSFIhl5nqJ5nmVJZoDQ2/DmAVZu+wvC+yllEV4vBGqjQqk4z+P+cVt9
   qoMOqZtCLE8SoNZhesbjPUaeqYGQS6V2qj23AdABZF/z4bAW9w1iVRNwd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15948851"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="15948851"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 12:20:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="14896257"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2024 12:20:19 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riKDx-0005fp-11;
	Thu, 07 Mar 2024 20:20:17 +0000
Date: Fri, 8 Mar 2024 04:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7006/12647] drivers/gpu/drm/xe/xe_mmio.c:109
 xe_resize_vram_bar() warn: impossible condition '(root_res->start >
 4294967296) => (0-u32max > 4294967296)'
Message-ID: <202403080435.Y08BvKFC-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1843e16d2df9d98427ef8045589571749d627cf7
commit: 237412e45390805e14a6936fb998d756c4eac9d8 [7006/12647] drm/xe: Enable 32bits build
:::::: branch date: 14 hours ago
:::::: commit date: 2 weeks ago
config: powerpc-randconfig-r071-20240228 (https://download.01.org/0day-ci/archive/20240308/202403080435.Y08BvKFC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403080435.Y08BvKFC-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_mmio.c:109 xe_resize_vram_bar() warn: impossible condition '(root_res->start > 4294967296) => (0-u32max > 4294967296)'
drivers/gpu/drm/xe/xe_mmio.c:284 xe_mmio_probe_vram() error: '%pa' expects argument of type 'phys_addr_t*', argument 3 has type 'ullong*'

Old smatch warnings:
drivers/gpu/drm/xe/xe_mmio.c:295 xe_mmio_probe_vram() error: '%pa' expects argument of type 'phys_addr_t*', argument 4 has type 'ullong*'

vim +109 drivers/gpu/drm/xe/xe_mmio.c

dd08ebf6c3525a Matthew Brost              2023-03-30   50  
7f075300a31829 Michael J. Ruhl            2023-05-25   51  /*
7f075300a31829 Michael J. Ruhl            2023-05-25   52   * if force_vram_bar_size is set, attempt to set to the requested size
7f075300a31829 Michael J. Ruhl            2023-05-25   53   * else set to maximum possible size
7f075300a31829 Michael J. Ruhl            2023-05-25   54   */
433002ca367076 Michael J. Ruhl            2023-06-05   55  static void xe_resize_vram_bar(struct xe_device *xe)
dd08ebf6c3525a Matthew Brost              2023-03-30   56  {
adce1b393f90c3 Bommithi Sakeena           2023-11-17   57  	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
dd08ebf6c3525a Matthew Brost              2023-03-30   58  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
dd08ebf6c3525a Matthew Brost              2023-03-30   59  	struct pci_bus *root = pdev->bus;
dd08ebf6c3525a Matthew Brost              2023-03-30   60  	resource_size_t current_size;
7f075300a31829 Michael J. Ruhl            2023-05-25   61  	resource_size_t rebar_size;
7f075300a31829 Michael J. Ruhl            2023-05-25   62  	struct resource *root_res;
7f075300a31829 Michael J. Ruhl            2023-05-25   63  	u32 bar_size_mask;
dd08ebf6c3525a Matthew Brost              2023-03-30   64  	u32 pci_cmd;
dd08ebf6c3525a Matthew Brost              2023-03-30   65  	int i;
dd08ebf6c3525a Matthew Brost              2023-03-30   66  
7f075300a31829 Michael J. Ruhl            2023-05-25   67  	/* gather some relevant info */
0bc519d20ffa7a Lucas De Marchi            2023-11-17   68  	current_size = pci_resource_len(pdev, LMEM_BAR);
0bc519d20ffa7a Lucas De Marchi            2023-11-17   69  	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
7f075300a31829 Michael J. Ruhl            2023-05-25   70  
7f075300a31829 Michael J. Ruhl            2023-05-25   71  	if (!bar_size_mask)
433002ca367076 Michael J. Ruhl            2023-06-05   72  		return;
dd08ebf6c3525a Matthew Brost              2023-03-30   73  
7f075300a31829 Michael J. Ruhl            2023-05-25   74  	/* set to a specific size? */
2a8477f7614a62 Matthew Auld               2023-03-08   75  	if (force_vram_bar_size) {
7f075300a31829 Michael J. Ruhl            2023-05-25   76  		u32 bar_size_bit;
dd08ebf6c3525a Matthew Brost              2023-03-30   77  
2a8477f7614a62 Matthew Auld               2023-03-08   78  		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
dd08ebf6c3525a Matthew Brost              2023-03-30   79  
7f075300a31829 Michael J. Ruhl            2023-05-25   80  		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
dd08ebf6c3525a Matthew Brost              2023-03-30   81  
7f075300a31829 Michael J. Ruhl            2023-05-25   82  		if (!bar_size_bit) {
dd08ebf6c3525a Matthew Brost              2023-03-30   83  			drm_info(&xe->drm,
7f075300a31829 Michael J. Ruhl            2023-05-25   84  				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
7f075300a31829 Michael J. Ruhl            2023-05-25   85  				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
433002ca367076 Michael J. Ruhl            2023-06-05   86  			return;
dd08ebf6c3525a Matthew Brost              2023-03-30   87  		}
7f075300a31829 Michael J. Ruhl            2023-05-25   88  
7f075300a31829 Michael J. Ruhl            2023-05-25   89  		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
7f075300a31829 Michael J. Ruhl            2023-05-25   90  
7f075300a31829 Michael J. Ruhl            2023-05-25   91  		if (rebar_size == current_size)
433002ca367076 Michael J. Ruhl            2023-06-05   92  			return;
dd08ebf6c3525a Matthew Brost              2023-03-30   93  	} else {
7f075300a31829 Michael J. Ruhl            2023-05-25   94  		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
dd08ebf6c3525a Matthew Brost              2023-03-30   95  
7f075300a31829 Michael J. Ruhl            2023-05-25   96  		/* only resize if larger than current */
7f075300a31829 Michael J. Ruhl            2023-05-25   97  		if (rebar_size <= current_size)
433002ca367076 Michael J. Ruhl            2023-06-05   98  			return;
dd08ebf6c3525a Matthew Brost              2023-03-30   99  	}
dd08ebf6c3525a Matthew Brost              2023-03-30  100  
433002ca367076 Michael J. Ruhl            2023-06-05  101  	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
96cb46df567e04 Balasubramani Vivekanandan 2023-04-25  102  		 (u64)current_size >> 20, (u64)rebar_size >> 20);
96cb46df567e04 Balasubramani Vivekanandan 2023-04-25  103  
dd08ebf6c3525a Matthew Brost              2023-03-30  104  	while (root->parent)
dd08ebf6c3525a Matthew Brost              2023-03-30  105  		root = root->parent;
dd08ebf6c3525a Matthew Brost              2023-03-30  106  
dd08ebf6c3525a Matthew Brost              2023-03-30  107  	pci_bus_for_each_resource(root, root_res, i) {
dd08ebf6c3525a Matthew Brost              2023-03-30  108  		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
dd08ebf6c3525a Matthew Brost              2023-03-30 @109  		    root_res->start > 0x100000000ull)
dd08ebf6c3525a Matthew Brost              2023-03-30  110  			break;
dd08ebf6c3525a Matthew Brost              2023-03-30  111  	}
dd08ebf6c3525a Matthew Brost              2023-03-30  112  
dd08ebf6c3525a Matthew Brost              2023-03-30  113  	if (!root_res) {
96cb46df567e04 Balasubramani Vivekanandan 2023-04-25  114  		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
433002ca367076 Michael J. Ruhl            2023-06-05  115  		return;
dd08ebf6c3525a Matthew Brost              2023-03-30  116  	}
dd08ebf6c3525a Matthew Brost              2023-03-30  117  
dd08ebf6c3525a Matthew Brost              2023-03-30  118  	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
dd08ebf6c3525a Matthew Brost              2023-03-30  119  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
dd08ebf6c3525a Matthew Brost              2023-03-30  120  
0bc519d20ffa7a Lucas De Marchi            2023-11-17  121  	_resize_bar(xe, LMEM_BAR, rebar_size);
dd08ebf6c3525a Matthew Brost              2023-03-30  122  
dd08ebf6c3525a Matthew Brost              2023-03-30  123  	pci_assign_unassigned_bus_resources(pdev->bus);
dd08ebf6c3525a Matthew Brost              2023-03-30  124  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
dd08ebf6c3525a Matthew Brost              2023-03-30  125  }
dd08ebf6c3525a Matthew Brost              2023-03-30  126  
dd08ebf6c3525a Matthew Brost              2023-03-30  127  static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
dd08ebf6c3525a Matthew Brost              2023-03-30  128  {
dd08ebf6c3525a Matthew Brost              2023-03-30  129  	if (!pci_resource_flags(pdev, bar))
dd08ebf6c3525a Matthew Brost              2023-03-30  130  		return false;
dd08ebf6c3525a Matthew Brost              2023-03-30  131  
dd08ebf6c3525a Matthew Brost              2023-03-30  132  	if (pci_resource_flags(pdev, bar) & IORESOURCE_UNSET)
dd08ebf6c3525a Matthew Brost              2023-03-30  133  		return false;
dd08ebf6c3525a Matthew Brost              2023-03-30  134  
dd08ebf6c3525a Matthew Brost              2023-03-30  135  	if (!pci_resource_len(pdev, bar))
dd08ebf6c3525a Matthew Brost              2023-03-30  136  		return false;
dd08ebf6c3525a Matthew Brost              2023-03-30  137  
dd08ebf6c3525a Matthew Brost              2023-03-30  138  	return true;
dd08ebf6c3525a Matthew Brost              2023-03-30  139  }
dd08ebf6c3525a Matthew Brost              2023-03-30  140  
7f075300a31829 Michael J. Ruhl            2023-05-25  141  static int xe_determine_lmem_bar_size(struct xe_device *xe)
7f075300a31829 Michael J. Ruhl            2023-05-25  142  {
7f075300a31829 Michael J. Ruhl            2023-05-25  143  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
7f075300a31829 Michael J. Ruhl            2023-05-25  144  
0bc519d20ffa7a Lucas De Marchi            2023-11-17  145  	if (!xe_pci_resource_valid(pdev, LMEM_BAR)) {
7f075300a31829 Michael J. Ruhl            2023-05-25  146  		drm_err(&xe->drm, "pci resource is not valid\n");
7f075300a31829 Michael J. Ruhl            2023-05-25  147  		return -ENXIO;
7f075300a31829 Michael J. Ruhl            2023-05-25  148  	}
7f075300a31829 Michael J. Ruhl            2023-05-25  149  
433002ca367076 Michael J. Ruhl            2023-06-05  150  	xe_resize_vram_bar(xe);
7f075300a31829 Michael J. Ruhl            2023-05-25  151  
0bc519d20ffa7a Lucas De Marchi            2023-11-17  152  	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
0bc519d20ffa7a Lucas De Marchi            2023-11-17  153  	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
7f075300a31829 Michael J. Ruhl            2023-05-25  154  	if (!xe->mem.vram.io_size)
7f075300a31829 Michael J. Ruhl            2023-05-25  155  		return -EIO;
7f075300a31829 Michael J. Ruhl            2023-05-25  156  
0887a2e7ab6205 Oak Zeng                   2023-07-11  157  	/* XXX: Need to change when xe link code is ready */
0887a2e7ab6205 Oak Zeng                   2023-07-11  158  	xe->mem.vram.dpa_base = 0;
2d830096e41403 Michael J. Ruhl            2023-05-25  159  
7f075300a31829 Michael J. Ruhl            2023-05-25  160  	/* set up a map to the total memory area. */
7f075300a31829 Michael J. Ruhl            2023-05-25  161  	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
7f075300a31829 Michael J. Ruhl            2023-05-25  162  
7f075300a31829 Michael J. Ruhl            2023-05-25  163  	return 0;
7f075300a31829 Michael J. Ruhl            2023-05-25  164  }
7f075300a31829 Michael J. Ruhl            2023-05-25  165  
61f288a8972253 Michael J. Ruhl            2023-05-25  166  /**
61f288a8972253 Michael J. Ruhl            2023-05-25  167   * xe_mmio_tile_vram_size() - Collect vram size and offset information
ebd288cba7db70 Matt Roper                 2023-06-01  168   * @tile: tile to get info for
61f288a8972253 Michael J. Ruhl            2023-05-25  169   * @vram_size: available vram (size - device reserved portions)
61f288a8972253 Michael J. Ruhl            2023-05-25  170   * @tile_size: actual vram size
61f288a8972253 Michael J. Ruhl            2023-05-25  171   * @tile_offset: physical start point in the vram address space
61f288a8972253 Michael J. Ruhl            2023-05-25  172   *
61f288a8972253 Michael J. Ruhl            2023-05-25  173   * There are 4 places for size information:
61f288a8972253 Michael J. Ruhl            2023-05-25  174   * - io size (from pci_resource_len of LMEM bar) (only used for small bar and DG1)
61f288a8972253 Michael J. Ruhl            2023-05-25  175   * - TILEx size (actual vram size)
61f288a8972253 Michael J. Ruhl            2023-05-25  176   * - GSMBASE offset (TILEx - "stolen")
61f288a8972253 Michael J. Ruhl            2023-05-25  177   * - CSSBASE offset (TILEx - CSS space necessary)
61f288a8972253 Michael J. Ruhl            2023-05-25  178   *
61f288a8972253 Michael J. Ruhl            2023-05-25  179   * CSSBASE is always a lower/smaller offset then GSMBASE.
61f288a8972253 Michael J. Ruhl            2023-05-25  180   *
61f288a8972253 Michael J. Ruhl            2023-05-25  181   * The actual available size of memory is to the CCS or GSM base.
61f288a8972253 Michael J. Ruhl            2023-05-25  182   * NOTE: multi-tile bases will include the tile offset.
61f288a8972253 Michael J. Ruhl            2023-05-25  183   *
61f288a8972253 Michael J. Ruhl            2023-05-25  184   */
b646ce9ce99f74 Brian Welty                2023-11-13  185  static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
b646ce9ce99f74 Brian Welty                2023-11-13  186  				  u64 *tile_size, u64 *tile_offset)
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  187  {
ebd288cba7db70 Matt Roper                 2023-06-01  188  	struct xe_device *xe = tile_to_xe(tile);
f6929e80cdf540 Matt Roper                 2023-06-01  189  	struct xe_gt *gt = tile->primary_gt;
61f288a8972253 Michael J. Ruhl            2023-05-25  190  	u64 offset;
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  191  	int err;
61f288a8972253 Michael J. Ruhl            2023-05-25  192  	u32 reg;
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  193  
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  194  	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  195  	if (err)
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  196  		return err;
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  197  
61f288a8972253 Michael J. Ruhl            2023-05-25  198  	/* actual size */
ebd288cba7db70 Matt Roper                 2023-06-01  199  	if (unlikely(xe->info.platform == XE_DG1)) {
0bc519d20ffa7a Lucas De Marchi            2023-11-17  200  		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
61f288a8972253 Michael J. Ruhl            2023-05-25  201  		*tile_offset = 0;
61f288a8972253 Michael J. Ruhl            2023-05-25  202  	} else {
61f288a8972253 Michael J. Ruhl            2023-05-25  203  		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
61f288a8972253 Michael J. Ruhl            2023-05-25  204  		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
61f288a8972253 Michael J. Ruhl            2023-05-25  205  		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
61f288a8972253 Michael J. Ruhl            2023-05-25  206  	}
61f288a8972253 Michael J. Ruhl            2023-05-25  207  
61f288a8972253 Michael J. Ruhl            2023-05-25  208  	/* minus device usage */
ebd288cba7db70 Matt Roper                 2023-06-01  209  	if (xe->info.has_flat_ccs) {
61f288a8972253 Michael J. Ruhl            2023-05-25  210  		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
61f288a8972253 Michael J. Ruhl            2023-05-25  211  		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
61f288a8972253 Michael J. Ruhl            2023-05-25  212  	} else {
07431945d8ae80 Matt Roper                 2023-08-22  213  		offset = xe_mmio_read64_2x32(gt, GSMBASE);
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  214  	}
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  215  
61f288a8972253 Michael J. Ruhl            2023-05-25  216  	/* remove the tile offset so we have just the available size */
61f288a8972253 Michael J. Ruhl            2023-05-25  217  	*vram_size = offset - *tile_offset;
61f288a8972253 Michael J. Ruhl            2023-05-25  218  
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  219  	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  220  }
d8b52a02cb40fe Maarten Lankhorst          2023-01-12  221  
dd08ebf6c3525a Matthew Brost              2023-03-30  222  int xe_mmio_probe_vram(struct xe_device *xe)
dd08ebf6c3525a Matthew Brost              2023-03-30  223  {
ebd288cba7db70 Matt Roper                 2023-06-01  224  	struct xe_tile *tile;
2d830096e41403 Michael J. Ruhl            2023-05-25  225  	resource_size_t io_size;
2d830096e41403 Michael J. Ruhl            2023-05-25  226  	u64 available_size = 0;
2d830096e41403 Michael J. Ruhl            2023-05-25  227  	u64 total_size = 0;
61f288a8972253 Michael J. Ruhl            2023-05-25  228  	u64 tile_offset;
61f288a8972253 Michael J. Ruhl            2023-05-25  229  	u64 tile_size;
61f288a8972253 Michael J. Ruhl            2023-05-25  230  	u64 vram_size;
96cb46df567e04 Balasubramani Vivekanandan 2023-04-25  231  	int err;
61f288a8972253 Michael J. Ruhl            2023-05-25  232  	u8 id;
dd08ebf6c3525a Matthew Brost              2023-03-30  233  
7f075300a31829 Michael J. Ruhl            2023-05-25  234  	if (!IS_DGFX(xe))
dd08ebf6c3525a Matthew Brost              2023-03-30  235  		return 0;
dd08ebf6c3525a Matthew Brost              2023-03-30  236  
ebd288cba7db70 Matt Roper                 2023-06-01  237  	/* Get the size of the root tile's vram for later accessibility comparison */
ebd288cba7db70 Matt Roper                 2023-06-01  238  	tile = xe_device_get_root_tile(xe);
ebd288cba7db70 Matt Roper                 2023-06-01  239  	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
dd08ebf6c3525a Matthew Brost              2023-03-30  240  	if (err)
dd08ebf6c3525a Matthew Brost              2023-03-30  241  		return err;
dd08ebf6c3525a Matthew Brost              2023-03-30  242  
7f075300a31829 Michael J. Ruhl            2023-05-25  243  	err = xe_determine_lmem_bar_size(xe);
7f075300a31829 Michael J. Ruhl            2023-05-25  244  	if (err)
7f075300a31829 Michael J. Ruhl            2023-05-25  245  		return err;
dd08ebf6c3525a Matthew Brost              2023-03-30  246  
7f075300a31829 Michael J. Ruhl            2023-05-25  247  	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
7f075300a31829 Michael J. Ruhl            2023-05-25  248  		 &xe->mem.vram.io_size);
dd08ebf6c3525a Matthew Brost              2023-03-30  249  
2492f4544e6f81 Matthew Auld               2023-03-14  250  	io_size = xe->mem.vram.io_size;
dd08ebf6c3525a Matthew Brost              2023-03-30  251  
ebd288cba7db70 Matt Roper                 2023-06-01  252  	/* tile specific ranges */
ebd288cba7db70 Matt Roper                 2023-06-01  253  	for_each_tile(tile, xe, id) {
ebd288cba7db70 Matt Roper                 2023-06-01  254  		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
2d830096e41403 Michael J. Ruhl            2023-05-25  255  		if (err)
2d830096e41403 Michael J. Ruhl            2023-05-25  256  			return err;
2492f4544e6f81 Matthew Auld               2023-03-14  257  
9641df81977266 Tejas Upadhyay             2023-06-28  258  		tile->mem.vram.actual_physical_size = tile_size;
ebd288cba7db70 Matt Roper                 2023-06-01  259  		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
ebd288cba7db70 Matt Roper                 2023-06-01  260  		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
2492f4544e6f81 Matthew Auld               2023-03-14  261  
ebd288cba7db70 Matt Roper                 2023-06-01  262  		if (!tile->mem.vram.io_size) {
2492f4544e6f81 Matthew Auld               2023-03-14  263  			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
2492f4544e6f81 Matthew Auld               2023-03-14  264  			return -ENODEV;
2492f4544e6f81 Matthew Auld               2023-03-14  265  		}
dd08ebf6c3525a Matthew Brost              2023-03-30  266  
0887a2e7ab6205 Oak Zeng                   2023-07-11  267  		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
c00ce7f2231700 Matthew Auld               2023-03-31  268  		tile->mem.vram.usable_size = vram_size;
ebd288cba7db70 Matt Roper                 2023-06-01  269  		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
2d830096e41403 Michael J. Ruhl            2023-05-25  270  
e4b2893c17048a Tejas Upadhyay             2023-06-28  271  		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
286089ce692907 Oak Zeng                   2023-07-14  272  			drm_info(&xe->drm, "Small BAR device\n");
286089ce692907 Oak Zeng                   2023-07-14  273  		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
286089ce692907 Oak Zeng                   2023-07-14  274  			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
286089ce692907 Oak Zeng                   2023-07-14  275  		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
6d8d038364d8ec Lucas De Marchi            2024-01-18  276  			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
6d8d038364d8ec Lucas De Marchi            2024-01-18  277  			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
2d830096e41403 Michael J. Ruhl            2023-05-25  278  
2d830096e41403 Michael J. Ruhl            2023-05-25  279  		/* calculate total size using tile size to get the correct HW sizing */
2d830096e41403 Michael J. Ruhl            2023-05-25  280  		total_size += tile_size;
2d830096e41403 Michael J. Ruhl            2023-05-25  281  		available_size += vram_size;
2d830096e41403 Michael J. Ruhl            2023-05-25  282  
2d830096e41403 Michael J. Ruhl            2023-05-25  283  		if (total_size > xe->mem.vram.io_size) {
c00ce7f2231700 Matthew Auld               2023-03-31 @284  			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
2d830096e41403 Michael J. Ruhl            2023-05-25  285  				 &total_size, &xe->mem.vram.io_size);
dd08ebf6c3525a Matthew Brost              2023-03-30  286  		}
dd08ebf6c3525a Matthew Brost              2023-03-30  287  
2d830096e41403 Michael J. Ruhl            2023-05-25  288  		io_size -= min_t(u64, tile_size, io_size);
dd08ebf6c3525a Matthew Brost              2023-03-30  289  	}
2d830096e41403 Michael J. Ruhl            2023-05-25  290  
0887a2e7ab6205 Oak Zeng                   2023-07-11  291  	xe->mem.vram.actual_physical_size = total_size;
2d830096e41403 Michael J. Ruhl            2023-05-25  292  
2d830096e41403 Michael J. Ruhl            2023-05-25  293  	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
0887a2e7ab6205 Oak Zeng                   2023-07-11  294  		 &xe->mem.vram.actual_physical_size);
2d830096e41403 Michael J. Ruhl            2023-05-25  295  	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
2d830096e41403 Michael J. Ruhl            2023-05-25  296  		 &available_size);
2d830096e41403 Michael J. Ruhl            2023-05-25  297  
dd08ebf6c3525a Matthew Brost              2023-03-30  298  	return 0;
dd08ebf6c3525a Matthew Brost              2023-03-30  299  }
dd08ebf6c3525a Matthew Brost              2023-03-30  300  

:::::: The code at line 109 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
