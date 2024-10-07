Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0FC1D90A9
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312901; cv=none; b=IHPsj3uNyGYrQMiPUK69hVOSB0Jakxd9WCBIyjQDrULNaU9Uo5fw2LUEBysJEDqp5+tTG3XpT8Cg/1aMRwV1JOUCXBg0tOTYXBw+zzc5o9NMWHq0Pw69gOyth5ZBiHjRLXQMZrTywCTsMWnWp4simNTsScnTFR2wpCte91YIflc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312901; c=relaxed/simple;
	bh=XIH9qu3I45hK4k2f2hi4IPEWXzvFTZevG3LR4jLGV1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjufkCK1dx0mrPHHP+sgKAhByoSROa2zHXtuiFmMdvyjOvOBOprT7QjdY+RhKUdUSr5IWWL3zBe+R1jv2AeCmwCLciPhNl3WTqAJSCJiZtc8Lb2wWDO4+/17AOCNLE89kmAmpjfk7UwJsk85wIblLJB7ZqNx0aIxvjQB5LZz1HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBik8yQV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBik8yQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728312900; x=1759848900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIH9qu3I45hK4k2f2hi4IPEWXzvFTZevG3LR4jLGV1Y=;
  b=VBik8yQVNpjnoAdmRqMkHwdHZdhVdj8Uxw/4D0q9z7dSjx93FgNxw6IR
   tR7NqImxp3kzlTG50mkBL3/ymweSoJldoVSZcpTpSW/iS4o74YFhKwKUd
   toWhjIj+eXsG9OaGmSIdMdpon7ejajm5T3s1Op/T5w8x7c2Pf4wibUVdK
   Ulx7R08M2YxBMhajC2LZrFR97tMO9tOOhuwIs0kBiQLhlLP/VPZjjJ0Ev
   Srh27id3Wq4r0NuzF+G7GkJ39xNbur1wN1XexZVQIOBvL8DrOCMoY5srl
   7zkdCz/l2iYVVo6PvUohz1dY1CQF9iQ9z5+Wq/NLU1x3CUUXjPSLcTQdV
   Q==;
X-CSE-ConnectionGUID: EXkPrjdBQ5iDxjqEds96qQ==
X-CSE-MsgGUID: pe6mjBB/RRCneU5hnv1k7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27276131"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27276131"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 07:54:58 -0700
X-CSE-ConnectionGUID: bepDGo0kT2eWydtN0dElKw==
X-CSE-MsgGUID: 1f8aLqpuT/mhRg3iebxHog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="112960969"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Oct 2024 07:54:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxp8Q-000580-1H;
	Mon, 07 Oct 2024 14:54:54 +0000
Date: Mon, 7 Oct 2024 22:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iommu/mtk_iommu.c:378:3-9: opportunity for
 str_enable_disable(enable)
Message-ID: <202410072212.VdZ5FavG-lkp@intel.com>
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
TO: Johannes Berg <johannes.berg@intel.com>
CC: Richard Weinberger <richard@nod.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
commit: 68f5d3f3b6543266b29e047cfaf9842333019b4c um: add PCI over virtio emulation driver
date:   3 years, 4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 years, 4 months ago
config: um-randconfig-r064-20241007 (https://download.01.org/0day-ci/archive/20241007/202410072212.VdZ5FavG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410072212.VdZ5FavG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/mtk_iommu.c:378:3-9: opportunity for str_enable_disable(enable)
>> drivers/iommu/mtk_iommu.c:316:10-15: opportunity for str_write_read(write)
--
>> drivers/thunderbolt/usb4.c:329:4-8: opportunity for str_yes_no(tbt3)
>> drivers/thunderbolt/usb4.c:329:25-29: opportunity for str_yes_no(xhci)
>> drivers/thunderbolt/usb4.c:268:7-31: opportunity for str_yes_no(( val & PORT_CS_18_WOU4S ))
>> drivers/thunderbolt/usb4.c:252:5-29: opportunity for str_yes_no(( val & ROUTER_CS_6_WOPS ))
>> drivers/thunderbolt/usb4.c:253:5-29: opportunity for str_yes_no(( val & ROUTER_CS_6_WOUS ))

vim +378 drivers/iommu/mtk_iommu.c

05aed9412b0bd0 Will Deacon  2019-07-02  270  
0df4fabe208d95 Yong Wu      2016-02-23  271  static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
0df4fabe208d95 Yong Wu      2016-02-23  272  {
0df4fabe208d95 Yong Wu      2016-02-23  273  	struct mtk_iommu_data *data = dev_id;
0df4fabe208d95 Yong Wu      2016-02-23  274  	struct mtk_iommu_domain *dom = data->m4u_dom;
37276e00da7d3a Chao Hao     2020-07-03  275  	unsigned int fault_larb, fault_port, sub_comm = 0;
ef0f0986b670cb Yong Wu      2021-01-11  276  	u32 int_state, regval, va34_32, pa34_32;
ef0f0986b670cb Yong Wu      2021-01-11  277  	u64 fault_iova, fault_pa;
0df4fabe208d95 Yong Wu      2016-02-23  278  	bool layer, write;
0df4fabe208d95 Yong Wu      2016-02-23  279  
0df4fabe208d95 Yong Wu      2016-02-23  280  	/* Read error info from registers */
0df4fabe208d95 Yong Wu      2016-02-23  281  	int_state = readl_relaxed(data->base + REG_MMU_FAULT_ST1);
15a01f4c60607a Yong Wu      2019-08-24  282  	if (int_state & F_REG_MMU0_FAULT_MASK) {
15a01f4c60607a Yong Wu      2019-08-24  283  		regval = readl_relaxed(data->base + REG_MMU0_INT_ID);
15a01f4c60607a Yong Wu      2019-08-24  284  		fault_iova = readl_relaxed(data->base + REG_MMU0_FAULT_VA);
15a01f4c60607a Yong Wu      2019-08-24  285  		fault_pa = readl_relaxed(data->base + REG_MMU0_INVLD_PA);
15a01f4c60607a Yong Wu      2019-08-24  286  	} else {
15a01f4c60607a Yong Wu      2019-08-24  287  		regval = readl_relaxed(data->base + REG_MMU1_INT_ID);
15a01f4c60607a Yong Wu      2019-08-24  288  		fault_iova = readl_relaxed(data->base + REG_MMU1_FAULT_VA);
15a01f4c60607a Yong Wu      2019-08-24  289  		fault_pa = readl_relaxed(data->base + REG_MMU1_INVLD_PA);
15a01f4c60607a Yong Wu      2019-08-24  290  	}
0df4fabe208d95 Yong Wu      2016-02-23  291  	layer = fault_iova & F_MMU_FAULT_VA_LAYER_BIT;
0df4fabe208d95 Yong Wu      2016-02-23  292  	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
ef0f0986b670cb Yong Wu      2021-01-11  293  	if (MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN)) {
ef0f0986b670cb Yong Wu      2021-01-11  294  		va34_32 = FIELD_GET(F_MMU_INVAL_VA_34_32_MASK, fault_iova);
ef0f0986b670cb Yong Wu      2021-01-11  295  		pa34_32 = FIELD_GET(F_MMU_INVAL_PA_34_32_MASK, fault_iova);
ef0f0986b670cb Yong Wu      2021-01-11  296  		fault_iova = fault_iova & F_MMU_INVAL_VA_31_12_MASK;
ef0f0986b670cb Yong Wu      2021-01-11  297  		fault_iova |= (u64)va34_32 << 32;
ef0f0986b670cb Yong Wu      2021-01-11  298  		fault_pa |= (u64)pa34_32 << 32;
ef0f0986b670cb Yong Wu      2021-01-11  299  	}
ef0f0986b670cb Yong Wu      2021-01-11  300  
15a01f4c60607a Yong Wu      2019-08-24  301  	fault_port = F_MMU_INT_ID_PORT_ID(regval);
37276e00da7d3a Chao Hao     2020-07-03  302  	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM)) {
37276e00da7d3a Chao Hao     2020-07-03  303  		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
37276e00da7d3a Chao Hao     2020-07-03  304  		sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
37276e00da7d3a Chao Hao     2020-07-03  305  	} else {
37276e00da7d3a Chao Hao     2020-07-03  306  		fault_larb = F_MMU_INT_ID_LARB_ID(regval);
37276e00da7d3a Chao Hao     2020-07-03  307  	}
37276e00da7d3a Chao Hao     2020-07-03  308  	fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
b3e5eee76548f6 Yong Wu      2019-08-24  309  
0df4fabe208d95 Yong Wu      2016-02-23  310  	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
0df4fabe208d95 Yong Wu      2016-02-23  311  			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
0df4fabe208d95 Yong Wu      2016-02-23  312  		dev_err_ratelimited(
0df4fabe208d95 Yong Wu      2016-02-23  313  			data->dev,
ef0f0986b670cb Yong Wu      2021-01-11  314  			"fault type=0x%x iova=0x%llx pa=0x%llx larb=%d port=%d layer=%d %s\n",
0df4fabe208d95 Yong Wu      2016-02-23  315  			int_state, fault_iova, fault_pa, fault_larb, fault_port,
0df4fabe208d95 Yong Wu      2016-02-23 @316  			layer, write ? "write" : "read");
0df4fabe208d95 Yong Wu      2016-02-23  317  	}
0df4fabe208d95 Yong Wu      2016-02-23  318  
0df4fabe208d95 Yong Wu      2016-02-23  319  	/* Interrupt clear */
0df4fabe208d95 Yong Wu      2016-02-23  320  	regval = readl_relaxed(data->base + REG_MMU_INT_CONTROL0);
0df4fabe208d95 Yong Wu      2016-02-23  321  	regval |= F_INT_CLR_BIT;
0df4fabe208d95 Yong Wu      2016-02-23  322  	writel_relaxed(regval, data->base + REG_MMU_INT_CONTROL0);
0df4fabe208d95 Yong Wu      2016-02-23  323  
0df4fabe208d95 Yong Wu      2016-02-23  324  	mtk_iommu_tlb_flush_all(data);
0df4fabe208d95 Yong Wu      2016-02-23  325  
0df4fabe208d95 Yong Wu      2016-02-23  326  	return IRQ_HANDLED;
0df4fabe208d95 Yong Wu      2016-02-23  327  }
0df4fabe208d95 Yong Wu      2016-02-23  328  
803cf9e5a6aa64 Yong Wu      2021-01-11  329  static int mtk_iommu_get_domain_id(struct device *dev,
803cf9e5a6aa64 Yong Wu      2021-01-11  330  				   const struct mtk_iommu_plat_data *plat_data)
803cf9e5a6aa64 Yong Wu      2021-01-11  331  {
803cf9e5a6aa64 Yong Wu      2021-01-11  332  	const struct mtk_iommu_iova_region *rgn = plat_data->iova_region;
803cf9e5a6aa64 Yong Wu      2021-01-11  333  	const struct bus_dma_region *dma_rgn = dev->dma_range_map;
803cf9e5a6aa64 Yong Wu      2021-01-11  334  	int i, candidate = -1;
803cf9e5a6aa64 Yong Wu      2021-01-11  335  	dma_addr_t dma_end;
803cf9e5a6aa64 Yong Wu      2021-01-11  336  
803cf9e5a6aa64 Yong Wu      2021-01-11  337  	if (!dma_rgn || plat_data->iova_region_nr == 1)
803cf9e5a6aa64 Yong Wu      2021-01-11  338  		return 0;
803cf9e5a6aa64 Yong Wu      2021-01-11  339  
803cf9e5a6aa64 Yong Wu      2021-01-11  340  	dma_end = dma_rgn->dma_start + dma_rgn->size - 1;
803cf9e5a6aa64 Yong Wu      2021-01-11  341  	for (i = 0; i < plat_data->iova_region_nr; i++, rgn++) {
803cf9e5a6aa64 Yong Wu      2021-01-11  342  		/* Best fit. */
803cf9e5a6aa64 Yong Wu      2021-01-11  343  		if (dma_rgn->dma_start == rgn->iova_base &&
803cf9e5a6aa64 Yong Wu      2021-01-11  344  		    dma_end == rgn->iova_base + rgn->size - 1)
803cf9e5a6aa64 Yong Wu      2021-01-11  345  			return i;
803cf9e5a6aa64 Yong Wu      2021-01-11  346  		/* ok if it is inside this region. */
803cf9e5a6aa64 Yong Wu      2021-01-11  347  		if (dma_rgn->dma_start >= rgn->iova_base &&
803cf9e5a6aa64 Yong Wu      2021-01-11  348  		    dma_end < rgn->iova_base + rgn->size)
803cf9e5a6aa64 Yong Wu      2021-01-11  349  			candidate = i;
803cf9e5a6aa64 Yong Wu      2021-01-11  350  	}
803cf9e5a6aa64 Yong Wu      2021-01-11  351  
803cf9e5a6aa64 Yong Wu      2021-01-11  352  	if (candidate >= 0)
803cf9e5a6aa64 Yong Wu      2021-01-11  353  		return candidate;
803cf9e5a6aa64 Yong Wu      2021-01-11  354  	dev_err(dev, "Can NOT find the iommu domain id(%pad 0x%llx).\n",
803cf9e5a6aa64 Yong Wu      2021-01-11  355  		&dma_rgn->dma_start, dma_rgn->size);
803cf9e5a6aa64 Yong Wu      2021-01-11  356  	return -EINVAL;
803cf9e5a6aa64 Yong Wu      2021-01-11  357  }
803cf9e5a6aa64 Yong Wu      2021-01-11  358  
8d2c749e525246 Yong Wu      2021-01-11  359  static void mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
8d2c749e525246 Yong Wu      2021-01-11  360  			     bool enable, unsigned int domid)
0df4fabe208d95 Yong Wu      2016-02-23  361  {
0df4fabe208d95 Yong Wu      2016-02-23  362  	struct mtk_smi_larb_iommu    *larb_mmu;
0df4fabe208d95 Yong Wu      2016-02-23  363  	unsigned int                 larbid, portid;
a9bf2eec5a6fc0 Joerg Roedel 2018-11-29  364  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
8d2c749e525246 Yong Wu      2021-01-11  365  	const struct mtk_iommu_iova_region *region;
58f0d1d536bc71 Robin Murphy 2016-10-17  366  	int i;
0df4fabe208d95 Yong Wu      2016-02-23  367  
58f0d1d536bc71 Robin Murphy 2016-10-17  368  	for (i = 0; i < fwspec->num_ids; ++i) {
58f0d1d536bc71 Robin Murphy 2016-10-17  369  		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
58f0d1d536bc71 Robin Murphy 2016-10-17  370  		portid = MTK_M4U_TO_PORT(fwspec->ids[i]);
8d2c749e525246 Yong Wu      2021-01-11  371  
1ee9feb2c9f893 Yong Wu      2019-08-24  372  		larb_mmu = &data->larb_imu[larbid];
0df4fabe208d95 Yong Wu      2016-02-23  373  
8d2c749e525246 Yong Wu      2021-01-11  374  		region = data->plat_data->iova_region + domid;
8d2c749e525246 Yong Wu      2021-01-11  375  		larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
8d2c749e525246 Yong Wu      2021-01-11  376  
8d2c749e525246 Yong Wu      2021-01-11  377  		dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
8d2c749e525246 Yong Wu      2021-01-11 @378  			enable ? "enable" : "disable", dev_name(larb_mmu->dev),
8d2c749e525246 Yong Wu      2021-01-11  379  			portid, domid, larb_mmu->bank[portid]);
0df4fabe208d95 Yong Wu      2016-02-23  380  
0df4fabe208d95 Yong Wu      2016-02-23  381  		if (enable)
0df4fabe208d95 Yong Wu      2016-02-23  382  			larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
0df4fabe208d95 Yong Wu      2016-02-23  383  		else
0df4fabe208d95 Yong Wu      2016-02-23  384  			larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
0df4fabe208d95 Yong Wu      2016-02-23  385  	}
0df4fabe208d95 Yong Wu      2016-02-23  386  }
0df4fabe208d95 Yong Wu      2016-02-23  387  

:::::: The code at line 378 was first introduced by commit
:::::: 8d2c749e5252466d8fc1917101f137966c61fd1c iommu/mediatek: Support master use iova over 32bit

:::::: TO: Yong Wu <yong.wu@mediatek.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
