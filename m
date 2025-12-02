Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3B72EA146
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 20:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764708234; cv=none; b=KAqfAW3eLlkYebs5Y1RCjopZHezRnnQpMsX8EIdiSm05VTfG8q7f46jh0OGoZ9KzzE6WBIJK6yNkhvlphcZ40ck1HPi7XyXnZB6f97yQJEdPWCkXPvbQXIc45VSrRgoao2BEJKJbCE8aymLAf+qk1Br7UVQ7kqnKr/MZNYvBykM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764708234; c=relaxed/simple;
	bh=WkO38WTsRzK6LBGVbnyi8O7UXn0sJ0oYZeuukhsXzd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d5IQejAvraC/pygtUWdGA0mLjOOD3FCwPJCxR7wugacapdo6TNaL5oO2iuraFNm77RRsGHLzveK5bjNHdODdm5g4lLS4x+C0gaB7Du0RrFMjorWnBEYTQWIqWRwdRnunNxA8kbxGmmS0ubY8N9Xr2s7etL02+NC87eTTVsWkTiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWQ8U49+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWQ8U49+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764708232; x=1796244232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WkO38WTsRzK6LBGVbnyi8O7UXn0sJ0oYZeuukhsXzd0=;
  b=OWQ8U49++m6/e/igA9tqPnSBN5+MC2My7N03KgaXa3gWEdWRdbujBVJH
   a8D3ZOPtFQxS6SxQRbv5Sti3Fxc8PaCiUFum2MxyY5ypW9nIIbJy0NWft
   LaO8ZUHLK1EnKngqgK0mZJbuRpq3DhPKwhnKV+QlhnJ7+JxQU81TzLxDI
   DO2B9hKKjXpllURwQto6ku0lFk9nD2JLXoYST5d9mBQWh0EVxoIlaAYo/
   0G7rbv1A4B6iSsY3InLcMzGJ76pxOS5LnUz78WAyU5sTT3SyNgRwf2o2g
   3xOWJBSjPYeEFa0IUk6G0zdWdUAUn1KFACsf9HuaQLOhI+0tPXC4j6x69
   g==;
X-CSE-ConnectionGUID: AQESPHc/TuyiLQGve5cocA==
X-CSE-MsgGUID: MPvf7sHdT8qvQAjmlUdwig==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89343832"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="89343832"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 12:43:50 -0800
X-CSE-ConnectionGUID: glngFvlKSm2BcYEFo/cN8A==
X-CSE-MsgGUID: 0l8z9h0hTka5JSKGG66Lvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194294642"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Dec 2025 12:43:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQXDv-00000000ABJ-0rfB;
	Tue, 02 Dec 2025 20:43:47 +0000
Date: Wed, 3 Dec 2025 04:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH v2 20/27] NTB: ntb_transport: Introduce remote eDMA
 backed transport mode
Message-ID: <202512030438.hBGwMuy6-lkp@intel.com>
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
In-Reply-To: <20251129160405.2568284-21-den@valinux.co.jp>
References: <20251129160405.2568284-21-den@valinux.co.jp>
TO: Koichiro Den <den@valinux.co.jp>

Hi Koichiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on next-20251202]
[cannot apply to jonmason-ntb/ntb-next pci/for-linus geert-renesas-devel/next linus/master v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251130-001424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251129160405.2568284-21-den%40valinux.co.jp
patch subject: [RFC PATCH v2 20/27] NTB: ntb_transport: Introduce remote eDMA backed transport mode
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-r063-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030438.hBGwMuy6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512030438.hBGwMuy6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/ntb/ntb_edma.c:223:8-26: WARNING: dma_alloc_coherent used in info already zeroes out memory, so memset is not needed
>> drivers/ntb/ntb_edma.c:261:8-26: WARNING: dma_alloc_coherent used in intr already zeroes out memory, so memset is not needed
>> drivers/ntb/ntb_edma.c:434:3-21: WARNING: dma_alloc_coherent used in edma_ctx . intr_rc_virt already zeroes out memory, so memset is not needed

vim +223 drivers/ntb/ntb_edma.c

2c52b6a2a63cec4 Koichiro Den 2025-11-30  191  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  192  int ntb_edma_setup_mws(struct ntb_dev *ndev)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  193  {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  194  	const size_t info_bytes = PAGE_SIZE;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  195  	resource_size_t size_max, offset;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  196  	dma_addr_t intr_phys, info_phys;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  197  	u32 wr_done = 0, rd_done = 0;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  198  	struct ntb_edma_intr *intr;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  199  	struct ntb_edma_info *info;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  200  	int peer_mw, mw_index, rc;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  201  	struct iommu_domain *dom;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  202  	bool reg_mapped = false;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  203  	size_t ll_bytes, size;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  204  	struct pci_epc *epc;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  205  	struct device *dev;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  206  	unsigned long iova;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  207  	phys_addr_t phys;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  208  	u64 need;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  209  	u32 i;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  210  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  211  	/* +1 is for interruption */
2c52b6a2a63cec4 Koichiro Den 2025-11-30  212  	ll_bytes = (EDMA_WR_CH_NUM + EDMA_RD_CH_NUM + 1) * DMA_LLP_MEM_SIZE;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  213  	need = EDMA_REG_SIZE + info_bytes + ll_bytes;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  214  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  215  	epc = ntb_get_pci_epc(ndev);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  216  	if (!epc)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  217  		return -ENODEV;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  218  	dev = epc->dev.parent;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  219  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  220  	if (edma_ctx.initialized)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  221  		return 0;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  222  
2c52b6a2a63cec4 Koichiro Den 2025-11-30 @223  	info = dma_alloc_coherent(dev, info_bytes, &info_phys, GFP_KERNEL);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  224  	if (!info)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  225  		return -ENOMEM;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  226  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  227  	memset(info, 0, info_bytes);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  228  	info->magic = NTB_EDMA_INFO_MAGIC;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  229  	info->wr_cnt = EDMA_WR_CH_NUM;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  230  	info->rd_cnt = EDMA_RD_CH_NUM + 1; /* +1 for interruption */
2c52b6a2a63cec4 Koichiro Den 2025-11-30  231  	info->regs_phys = edma_regs_phys;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  232  	info->ll_stride = DMA_LLP_MEM_SIZE;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  233  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  234  	for (i = 0; i < EDMA_WR_CH_NUM; i++) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  235  		edma_ctx.ll_wr_virt[i] = dma_alloc_attrs(dev, DMA_LLP_MEM_SIZE,
2c52b6a2a63cec4 Koichiro Den 2025-11-30  236  							 &edma_ctx.ll_wr_phys[i],
2c52b6a2a63cec4 Koichiro Den 2025-11-30  237  							 GFP_KERNEL,
2c52b6a2a63cec4 Koichiro Den 2025-11-30  238  							 DMA_ATTR_FORCE_CONTIGUOUS);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  239  		if (!edma_ctx.ll_wr_virt[i]) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  240  			rc = -ENOMEM;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  241  			goto err_free_ll;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  242  		}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  243  		wr_done++;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  244  		info->ll_wr_phys[i] = edma_ctx.ll_wr_phys[i];
2c52b6a2a63cec4 Koichiro Den 2025-11-30  245  	}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  246  	for (i = 0; i < EDMA_RD_CH_NUM + 1; i++) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  247  		edma_ctx.ll_rd_virt[i] = dma_alloc_attrs(dev, DMA_LLP_MEM_SIZE,
2c52b6a2a63cec4 Koichiro Den 2025-11-30  248  							 &edma_ctx.ll_rd_phys[i],
2c52b6a2a63cec4 Koichiro Den 2025-11-30  249  							 GFP_KERNEL,
2c52b6a2a63cec4 Koichiro Den 2025-11-30  250  							 DMA_ATTR_FORCE_CONTIGUOUS);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  251  		if (!edma_ctx.ll_rd_virt[i]) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  252  			rc = -ENOMEM;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  253  			goto err_free_ll;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  254  		}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  255  		rd_done++;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  256  		info->ll_rd_phys[i] = edma_ctx.ll_rd_phys[i];
2c52b6a2a63cec4 Koichiro Den 2025-11-30  257  	}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  258  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  259  	/* For interruption */
2c52b6a2a63cec4 Koichiro Den 2025-11-30  260  	edma_ctx.notify_qp_max = NTB_EDMA_NOTIFY_MAX_QP;
2c52b6a2a63cec4 Koichiro Den 2025-11-30 @261  	intr = dma_alloc_coherent(dev, sizeof(*intr), &intr_phys, GFP_KERNEL);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  262  	if (!intr) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  263  		rc = -ENOMEM;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  264  		goto err_free_ll;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  265  	}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  266  	memset(intr, 0, sizeof(*intr));
2c52b6a2a63cec4 Koichiro Den 2025-11-30  267  	edma_ctx.intr_ep_virt = intr;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  268  	edma_ctx.intr_ep_phys = intr_phys;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  269  	info->intr_dar_base = intr_phys;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  270  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  271  	peer_mw = ntb_peer_mw_count(ndev);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  272  	if (peer_mw <= 0) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  273  		rc = -ENODEV;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  274  		goto err_free_ll;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  275  	}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  276  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  277  	mw_index = peer_mw - 1; /* last MW */
2c52b6a2a63cec4 Koichiro Den 2025-11-30  278  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  279  	rc = ntb_mw_get_align(ndev, 0, mw_index, 0, NULL, &size_max,
2c52b6a2a63cec4 Koichiro Den 2025-11-30  280  			      &offset);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  281  	if (rc)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  282  		goto err_free_ll;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  283  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  284  	if (size_max < need) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  285  		rc = -ENOSPC;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  286  		goto err_free_ll;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  287  	}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  288  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  289  	/* Map register space (direct) */
2c52b6a2a63cec4 Koichiro Den 2025-11-30  290  	dom = iommu_get_domain_for_dev(dev);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  291  	if (dom) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  292  		phys = edma_regs_phys & PAGE_MASK;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  293  		size = PAGE_ALIGN(EDMA_REG_SIZE + edma_regs_phys - phys);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  294  		iova = phys;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  295  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  296  		rc = iommu_map(dom, iova, phys, EDMA_REG_SIZE,
2c52b6a2a63cec4 Koichiro Den 2025-11-30  297  			       IOMMU_READ | IOMMU_WRITE | IOMMU_MMIO, GFP_KERNEL);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  298  		if (rc)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  299  			dev_err(&ndev->dev, "failed to create direct mapping for eDMA reg space\n");
2c52b6a2a63cec4 Koichiro Den 2025-11-30  300  		reg_mapped = true;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  301  	}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  302  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  303  	rc = ntb_mw_set_trans(ndev, 0, mw_index, edma_regs_phys, EDMA_REG_SIZE, offset);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  304  	if (rc)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  305  		goto err_unmap_reg;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  306  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  307  	offset += EDMA_REG_SIZE;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  308  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  309  	/* Map ntb_edma_info */
2c52b6a2a63cec4 Koichiro Den 2025-11-30  310  	rc = ntb_mw_set_trans(ndev, 0, mw_index, info_phys, info_bytes, offset);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  311  	if (rc)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  312  		goto err_clear_trans;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  313  	offset += info_bytes;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  314  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  315  	/* Map LL location */
2c52b6a2a63cec4 Koichiro Den 2025-11-30  316  	for (i = 0; i < EDMA_WR_CH_NUM; i++) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  317  		rc = ntb_mw_set_trans(ndev, 0, mw_index, edma_ctx.ll_wr_phys[i],
2c52b6a2a63cec4 Koichiro Den 2025-11-30  318  				      DMA_LLP_MEM_SIZE, offset);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  319  		if (rc)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  320  			goto err_clear_trans;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  321  		offset += DMA_LLP_MEM_SIZE;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  322  	}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  323  	for (i = 0; i < EDMA_RD_CH_NUM + 1; i++) {
2c52b6a2a63cec4 Koichiro Den 2025-11-30  324  		rc = ntb_mw_set_trans(ndev, 0, mw_index, edma_ctx.ll_rd_phys[i],
2c52b6a2a63cec4 Koichiro Den 2025-11-30  325  				      DMA_LLP_MEM_SIZE, offset);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  326  		if (rc)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  327  			goto err_clear_trans;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  328  		offset += DMA_LLP_MEM_SIZE;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  329  	}
2c52b6a2a63cec4 Koichiro Den 2025-11-30  330  	edma_ctx.initialized = true;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  331  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  332  	return 0;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  333  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  334  err_clear_trans:
2c52b6a2a63cec4 Koichiro Den 2025-11-30  335  	/*
2c52b6a2a63cec4 Koichiro Den 2025-11-30  336  	 * Tear down the NTB translation window used for the eDMA MW.
2c52b6a2a63cec4 Koichiro Den 2025-11-30  337  	 * There is no sub-range clear API for ntb_mw_set_trans(), so we
2c52b6a2a63cec4 Koichiro Den 2025-11-30  338  	 * unconditionally drop the whole mapping on error.
2c52b6a2a63cec4 Koichiro Den 2025-11-30  339  	 */
2c52b6a2a63cec4 Koichiro Den 2025-11-30  340  	ntb_mw_clear_trans(ndev, 0, mw_index);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  341  
2c52b6a2a63cec4 Koichiro Den 2025-11-30  342  err_unmap_reg:
2c52b6a2a63cec4 Koichiro Den 2025-11-30  343  	if (reg_mapped)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  344  		iommu_unmap(dom, iova, size);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  345  err_free_ll:
2c52b6a2a63cec4 Koichiro Den 2025-11-30  346  	while (rd_done--)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  347  		dma_free_attrs(dev, DMA_LLP_MEM_SIZE,
2c52b6a2a63cec4 Koichiro Den 2025-11-30  348  			       edma_ctx.ll_rd_virt[rd_done],
2c52b6a2a63cec4 Koichiro Den 2025-11-30  349  			       edma_ctx.ll_rd_phys[rd_done],
2c52b6a2a63cec4 Koichiro Den 2025-11-30  350  			       DMA_ATTR_FORCE_CONTIGUOUS);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  351  	while (wr_done--)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  352  		dma_free_attrs(dev, DMA_LLP_MEM_SIZE,
2c52b6a2a63cec4 Koichiro Den 2025-11-30  353  			       edma_ctx.ll_wr_virt[wr_done],
2c52b6a2a63cec4 Koichiro Den 2025-11-30  354  			       edma_ctx.ll_wr_phys[wr_done],
2c52b6a2a63cec4 Koichiro Den 2025-11-30  355  			       DMA_ATTR_FORCE_CONTIGUOUS);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  356  	if (edma_ctx.intr_ep_virt)
2c52b6a2a63cec4 Koichiro Den 2025-11-30  357  		dma_free_coherent(dev, sizeof(struct ntb_edma_intr),
2c52b6a2a63cec4 Koichiro Den 2025-11-30  358  				  edma_ctx.intr_ep_virt,
2c52b6a2a63cec4 Koichiro Den 2025-11-30  359  				  edma_ctx.intr_ep_phys);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  360  	dma_free_coherent(dev, info_bytes, info, info_phys);
2c52b6a2a63cec4 Koichiro Den 2025-11-30  361  	return rc;
2c52b6a2a63cec4 Koichiro Den 2025-11-30  362  }
2c52b6a2a63cec4 Koichiro Den 2025-11-30  363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
