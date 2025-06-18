Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B437429A5
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750207961; cv=none; b=H+mp0zgwy43bGu/xo6I3r7D6FcFHjxc/mS29hmh9NyYStsvqMqAOR2Jrsiw5gEg0AqCwO9EsZKSeEP4lABU9ZZ0ftoPct0AqgX2xNA4m8zOzMdZZFWYjh8qjNZZt3wsXoYJg3I89kfYseb/duk6G9ZQ1pX9bn9tiygkvvTA6QFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750207961; c=relaxed/simple;
	bh=vuclWtTSJK8SiVmcMXdnTEZas36cSmukwbtffVipvGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gsb8CesEx1Qzn/uVVBYBgge9uc6SYzjP319JbmAAUK/P2RrcXQgSD4CHW/jtcFp3/o8LNkKIH4U2W9PA3j0jp4ZVA+BtHpTNHBLFTyp2WwPrhKBKsPFXm5N7fiGzVfhuiw9HkRQIBXyWuT3zGrh2JvYx2qv380Ekli1qD5J62fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKq0JGhP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKq0JGhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750207958; x=1781743958;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vuclWtTSJK8SiVmcMXdnTEZas36cSmukwbtffVipvGM=;
  b=MKq0JGhPMnDIUN5Xnaa50yDDnCmiNV2suuRMQ5+0B3sg+TBd9amkdiGB
   +QF19UsC5M/D8hc5IPm4r9B9KRthKOtlp7pIY2onAkBPI8+KqPOOMMVHG
   maUuHq7VJFFxncQ9Y9ICTfAkFv2rWsywjgzh02BDaPS1rDuQvaZgJw8Zd
   Nf2yB5/IjS3Rb8d9i3ZMwsm5HubsMpecelYJemr8CIw+MPgm+Qym9oK83
   TavvxLIeSvTVTm/kKpJQ0vvIaUwvGHPkY2Y8HTSUqfBwBYILIYXOQ30Ph
   Ueb/UJ36lsUfBv9GGyEQodLR1U6duQRD6JSf1M2WiZebGK5Yts6GiFhr3
   g==;
X-CSE-ConnectionGUID: bIY+om0IRKaBLnGyTTopjw==
X-CSE-MsgGUID: LwgEa+ZXQEitade/bYqymg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52387439"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52387439"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 17:52:38 -0700
X-CSE-ConnectionGUID: ZElgSkArQJuVy4G12rLErQ==
X-CSE-MsgGUID: yAxNycihQcad8TFN8rBkHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="172329011"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jun 2025 17:52:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRh2Y-000JG6-11;
	Wed, 18 Jun 2025 00:52:34 +0000
Date: Wed, 18 Jun 2025 08:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2 2/2] !!! TESTING ONLY !!! Allow compile virt-dma users
 on ARM64 platform
Message-ID: <202506180852.dB2jZ8KI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250616124934.141782-3-al.kochet@gmail.com>
References: <20250616124934.141782-3-al.kochet@gmail.com>
TO: Alexander Kochetkov <al.kochet@gmail.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: dmaengine@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Nishad Saraf <nishads@amd.com>
CC: Lizhi Hou <lizhi.hou@amd.com>
CC: Jacky Huang <ychuang3@nuvoton.com>
CC: "Shan-Chun Hung" <schung@nuvoton.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Ray Jui <rjui@broadcom.com>
CC: Scott Branden <sbranden@broadcom.com>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Paul Cercueil <paul@crapouillou.net>
CC: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
CC: Manivannan Sadhasivam <mani@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Zhou Wang <wangzhou1@hisilicon.com>
CC: Longfang Liu <liulongfang@huawei.com>
CC: Andy Shevchenko <andy@kernel.org>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: Keguang Zhang <keguang.zhang@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "Andreas Färber" <afaerber@suse.de>
CC: Daniel Mack <daniel@zonque.org>
CC: Haojian Zhuang <haojian.zhuang@gmail.com>
CC: Robert Jarzmik <robert.jarzmik@free.fr>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on shawnguo/for-next sunxi/sunxi/for-next lee-mfd/for-mfd-next linus/master v6.16-rc2 next-20250617]
[cannot apply to atorgue-stm32/stm32-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Kochetkov/dmaengine-virt-dma-convert-tasklet-to-BH-workqueue-for-callback-invocation/20250616-205118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250616124934.141782-3-al.kochet%40gmail.com
patch subject: [PATCH v2 2/2] !!! TESTING ONLY !!! Allow compile virt-dma users on ARM64 platform
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r052-20250618 (https://download.01.org/0day-ci/archive/20250618/202506180852.dB2jZ8KI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180852.dB2jZ8KI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506180852.dB2jZ8KI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/bcm2835-dma.c:856:34: warning: 'bcm2835_dma_of_match' defined but not used [-Wunused-const-variable=]
    static const struct of_device_id bcm2835_dma_of_match[] = {
                                     ^~~~~~~~~~~~~~~~~~~~

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/bcm2835-dma.c:994:36-37: WARNING opportunity for min()

vim +994 drivers/dma/bcm2835-dma.c

96286b57669073 Florian Meier  2014-01-06   855  
96286b57669073 Florian Meier  2014-01-06  @856  static const struct of_device_id bcm2835_dma_of_match[] = {
96286b57669073 Florian Meier  2014-01-06   857  	{ .compatible = "brcm,bcm2835-dma", },
96286b57669073 Florian Meier  2014-01-06   858  	{},
96286b57669073 Florian Meier  2014-01-06   859  };
96286b57669073 Florian Meier  2014-01-06   860  MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
96286b57669073 Florian Meier  2014-01-06   861  
96286b57669073 Florian Meier  2014-01-06   862  static struct dma_chan *bcm2835_dma_xlate(struct of_phandle_args *spec,
96286b57669073 Florian Meier  2014-01-06   863  					   struct of_dma *ofdma)
96286b57669073 Florian Meier  2014-01-06   864  {
96286b57669073 Florian Meier  2014-01-06   865  	struct bcm2835_dmadev *d = ofdma->of_dma_data;
96286b57669073 Florian Meier  2014-01-06   866  	struct dma_chan *chan;
96286b57669073 Florian Meier  2014-01-06   867  
96286b57669073 Florian Meier  2014-01-06   868  	chan = dma_get_any_slave_channel(&d->ddev);
96286b57669073 Florian Meier  2014-01-06   869  	if (!chan)
96286b57669073 Florian Meier  2014-01-06   870  		return NULL;
96286b57669073 Florian Meier  2014-01-06   871  
96286b57669073 Florian Meier  2014-01-06   872  	/* Set DREQ from param */
96286b57669073 Florian Meier  2014-01-06   873  	to_bcm2835_dma_chan(chan)->dreq = spec->args[0];
96286b57669073 Florian Meier  2014-01-06   874  
96286b57669073 Florian Meier  2014-01-06   875  	return chan;
96286b57669073 Florian Meier  2014-01-06   876  }
96286b57669073 Florian Meier  2014-01-06   877  
9602a843cb3a16 Stefan Wahren  2024-12-04   878  static int bcm2835_dma_suspend_late(struct device *dev)
9602a843cb3a16 Stefan Wahren  2024-12-04   879  {
9602a843cb3a16 Stefan Wahren  2024-12-04   880  	struct bcm2835_dmadev *od = dev_get_drvdata(dev);
9602a843cb3a16 Stefan Wahren  2024-12-04   881  	struct bcm2835_chan *c, *next;
9602a843cb3a16 Stefan Wahren  2024-12-04   882  
9602a843cb3a16 Stefan Wahren  2024-12-04   883  	list_for_each_entry_safe(c, next, &od->ddev.channels,
9602a843cb3a16 Stefan Wahren  2024-12-04   884  				 vc.chan.device_node) {
9602a843cb3a16 Stefan Wahren  2024-12-04   885  		void __iomem *chan_base = c->chan_base;
9602a843cb3a16 Stefan Wahren  2024-12-04   886  
9602a843cb3a16 Stefan Wahren  2024-12-04   887  		/* Check if DMA channel is busy */
9602a843cb3a16 Stefan Wahren  2024-12-04   888  		if (readl(chan_base + BCM2835_DMA_ADDR))
9602a843cb3a16 Stefan Wahren  2024-12-04   889  			return -EBUSY;
9602a843cb3a16 Stefan Wahren  2024-12-04   890  	}
9602a843cb3a16 Stefan Wahren  2024-12-04   891  
9602a843cb3a16 Stefan Wahren  2024-12-04   892  	return 0;
9602a843cb3a16 Stefan Wahren  2024-12-04   893  }
9602a843cb3a16 Stefan Wahren  2024-12-04   894  
9602a843cb3a16 Stefan Wahren  2024-12-04   895  static const struct dev_pm_ops bcm2835_dma_pm_ops = {
95032938c7c9b2 Stefan Wahren  2025-02-22   896  	LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late, NULL)
9602a843cb3a16 Stefan Wahren  2024-12-04   897  };
9602a843cb3a16 Stefan Wahren  2024-12-04   898  
96286b57669073 Florian Meier  2014-01-06   899  static int bcm2835_dma_probe(struct platform_device *pdev)
96286b57669073 Florian Meier  2014-01-06   900  {
96286b57669073 Florian Meier  2014-01-06   901  	struct bcm2835_dmadev *od;
96286b57669073 Florian Meier  2014-01-06   902  	void __iomem *base;
96286b57669073 Florian Meier  2014-01-06   903  	int rc;
e2eca6389b031c Martin Sperl   2016-04-11   904  	int i, j;
e2eca6389b031c Martin Sperl   2016-04-11   905  	int irq[BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1];
e2eca6389b031c Martin Sperl   2016-04-11   906  	int irq_flags;
96286b57669073 Florian Meier  2014-01-06   907  	uint32_t chans_available;
e2eca6389b031c Martin Sperl   2016-04-11   908  	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
96286b57669073 Florian Meier  2014-01-06   909  
96286b57669073 Florian Meier  2014-01-06   910  	if (!pdev->dev.dma_mask)
96286b57669073 Florian Meier  2014-01-06   911  		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
96286b57669073 Florian Meier  2014-01-06   912  
96286b57669073 Florian Meier  2014-01-06   913  	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
72503b25ee3638 Stefan Wahren  2019-07-16   914  	if (rc) {
72503b25ee3638 Stefan Wahren  2019-07-16   915  		dev_err(&pdev->dev, "Unable to set DMA mask\n");
96286b57669073 Florian Meier  2014-01-06   916  		return rc;
72503b25ee3638 Stefan Wahren  2019-07-16   917  	}
96286b57669073 Florian Meier  2014-01-06   918  
96286b57669073 Florian Meier  2014-01-06   919  	od = devm_kzalloc(&pdev->dev, sizeof(*od), GFP_KERNEL);
96286b57669073 Florian Meier  2014-01-06   920  	if (!od)
96286b57669073 Florian Meier  2014-01-06   921  		return -ENOMEM;
96286b57669073 Florian Meier  2014-01-06   922  
96286b57669073 Florian Meier  2014-01-06   923  	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
96286b57669073 Florian Meier  2014-01-06   924  
4b23603a251d24 Tudor Ambarus  2022-11-10   925  	base = devm_platform_ioremap_resource(pdev, 0);
96286b57669073 Florian Meier  2014-01-06   926  	if (IS_ERR(base))
96286b57669073 Florian Meier  2014-01-06   927  		return PTR_ERR(base);
96286b57669073 Florian Meier  2014-01-06   928  
96286b57669073 Florian Meier  2014-01-06   929  	od->base = base;
96286b57669073 Florian Meier  2014-01-06   930  
96286b57669073 Florian Meier  2014-01-06   931  	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
7f5ae3553685d5 Florian Meier  2014-01-17   932  	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
96286b57669073 Florian Meier  2014-01-06   933  	dma_cap_set(DMA_CYCLIC, od->ddev.cap_mask);
d9f094a02f3051 Martin Sperl   2016-03-16   934  	dma_cap_set(DMA_MEMCPY, od->ddev.cap_mask);
96286b57669073 Florian Meier  2014-01-06   935  	od->ddev.device_alloc_chan_resources = bcm2835_dma_alloc_chan_resources;
96286b57669073 Florian Meier  2014-01-06   936  	od->ddev.device_free_chan_resources = bcm2835_dma_free_chan_resources;
96286b57669073 Florian Meier  2014-01-06   937  	od->ddev.device_tx_status = bcm2835_dma_tx_status;
96286b57669073 Florian Meier  2014-01-06   938  	od->ddev.device_issue_pending = bcm2835_dma_issue_pending;
96286b57669073 Florian Meier  2014-01-06   939  	od->ddev.device_prep_dma_cyclic = bcm2835_dma_prep_dma_cyclic;
388cc7a281c06e Martin Sperl   2016-03-16   940  	od->ddev.device_prep_slave_sg = bcm2835_dma_prep_slave_sg;
d9f094a02f3051 Martin Sperl   2016-03-16   941  	od->ddev.device_prep_dma_memcpy = bcm2835_dma_prep_dma_memcpy;
39159bea78ed05 Maxime Ripard  2014-11-17   942  	od->ddev.device_config = bcm2835_dma_slave_config;
39159bea78ed05 Maxime Ripard  2014-11-17   943  	od->ddev.device_terminate_all = bcm2835_dma_terminate_all;
de92436ac40ffe Peter Ujfalusi 2017-11-14   944  	od->ddev.device_synchronize = bcm2835_dma_synchronize;
b574368024670a Maxime Ripard  2014-11-17   945  	od->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
b574368024670a Maxime Ripard  2014-11-17   946  	od->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
d9f094a02f3051 Martin Sperl   2016-03-16   947  	od->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV) |
d9f094a02f3051 Martin Sperl   2016-03-16   948  			      BIT(DMA_MEM_TO_MEM);
0fa5867e6a2c61 Martin Sperl   2016-03-16   949  	od->ddev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
6f6869dc97e865 Lukas Wunner   2019-09-11   950  	od->ddev.descriptor_reuse = true;
96286b57669073 Florian Meier  2014-01-06   951  	od->ddev.dev = &pdev->dev;
96286b57669073 Florian Meier  2014-01-06   952  	INIT_LIST_HEAD(&od->ddev.channels);
96286b57669073 Florian Meier  2014-01-06   953  
96286b57669073 Florian Meier  2014-01-06   954  	platform_set_drvdata(pdev, od);
96286b57669073 Florian Meier  2014-01-06   955  
bf75703d0912da Lukas Wunner   2019-09-11   956  	od->zero_page = dma_map_page_attrs(od->ddev.dev, ZERO_PAGE(0), 0,
bf75703d0912da Lukas Wunner   2019-09-11   957  					   PAGE_SIZE, DMA_TO_DEVICE,
bf75703d0912da Lukas Wunner   2019-09-11   958  					   DMA_ATTR_SKIP_CPU_SYNC);
bf75703d0912da Lukas Wunner   2019-09-11   959  	if (dma_mapping_error(od->ddev.dev, od->zero_page)) {
bf75703d0912da Lukas Wunner   2019-09-11   960  		dev_err(&pdev->dev, "Failed to map zero page\n");
bf75703d0912da Lukas Wunner   2019-09-11   961  		return -ENOMEM;
bf75703d0912da Lukas Wunner   2019-09-11   962  	}
bf75703d0912da Lukas Wunner   2019-09-11   963  
96286b57669073 Florian Meier  2014-01-06   964  	/* Request DMA channel mask from device tree */
96286b57669073 Florian Meier  2014-01-06   965  	if (of_property_read_u32(pdev->dev.of_node,
96286b57669073 Florian Meier  2014-01-06   966  			"brcm,dma-channel-mask",
96286b57669073 Florian Meier  2014-01-06   967  			&chans_available)) {
96286b57669073 Florian Meier  2014-01-06   968  		dev_err(&pdev->dev, "Failed to get channel mask\n");
96286b57669073 Florian Meier  2014-01-06   969  		rc = -EINVAL;
96286b57669073 Florian Meier  2014-01-06   970  		goto err_no_dma;
96286b57669073 Florian Meier  2014-01-06   971  	}
96286b57669073 Florian Meier  2014-01-06   972  
e2eca6389b031c Martin Sperl   2016-04-11   973  	/* get irqs for each channel that we support */
e2eca6389b031c Martin Sperl   2016-04-11   974  	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
e2eca6389b031c Martin Sperl   2016-04-11   975  		/* skip masked out channels */
e2eca6389b031c Martin Sperl   2016-04-11   976  		if (!(chans_available & (1 << i))) {
e2eca6389b031c Martin Sperl   2016-04-11   977  			irq[i] = -1;
e2eca6389b031c Martin Sperl   2016-04-11   978  			continue;
e2eca6389b031c Martin Sperl   2016-04-11   979  		}
e2eca6389b031c Martin Sperl   2016-04-11   980  
e2eca6389b031c Martin Sperl   2016-04-11   981  		/* get the named irq */
e2eca6389b031c Martin Sperl   2016-04-11   982  		snprintf(chan_name, sizeof(chan_name), "dma%i", i);
e2eca6389b031c Martin Sperl   2016-04-11   983  		irq[i] = platform_get_irq_byname(pdev, chan_name);
e2eca6389b031c Martin Sperl   2016-04-11   984  		if (irq[i] >= 0)
e2eca6389b031c Martin Sperl   2016-04-11   985  			continue;
e2eca6389b031c Martin Sperl   2016-04-11   986  
e2eca6389b031c Martin Sperl   2016-04-11   987  		/* legacy device tree case handling */
e2eca6389b031c Martin Sperl   2016-04-11   988  		dev_warn_once(&pdev->dev,
0eef727a47c5ea Martin Sperl   2016-04-22   989  			      "missing interrupt-names property in device tree - legacy interpretation is used\n");
e2eca6389b031c Martin Sperl   2016-04-11   990  		/*
e2eca6389b031c Martin Sperl   2016-04-11   991  		 * in case of channel >= 11
e2eca6389b031c Martin Sperl   2016-04-11   992  		 * use the 11th interrupt and that is shared
e2eca6389b031c Martin Sperl   2016-04-11   993  		 */
e2eca6389b031c Martin Sperl   2016-04-11  @994  		irq[i] = platform_get_irq(pdev, i < 11 ? i : 11);
e2eca6389b031c Martin Sperl   2016-04-11   995  	}
e2eca6389b031c Martin Sperl   2016-04-11   996  
e2eca6389b031c Martin Sperl   2016-04-11   997  	/* get irqs for each channel */
e2eca6389b031c Martin Sperl   2016-04-11   998  	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
e2eca6389b031c Martin Sperl   2016-04-11   999  		/* skip channels without irq */
e2eca6389b031c Martin Sperl   2016-04-11  1000  		if (irq[i] < 0)
e2eca6389b031c Martin Sperl   2016-04-11  1001  			continue;
e2eca6389b031c Martin Sperl   2016-04-11  1002  
e2eca6389b031c Martin Sperl   2016-04-11  1003  		/* check if there are other channels that also use this irq */
e2eca6389b031c Martin Sperl   2016-04-11  1004  		irq_flags = 0;
e2eca6389b031c Martin Sperl   2016-04-11  1005  		for (j = 0; j <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; j++)
e2eca6389b031c Martin Sperl   2016-04-11  1006  			if ((i != j) && (irq[j] == irq[i])) {
e2eca6389b031c Martin Sperl   2016-04-11  1007  				irq_flags = IRQF_SHARED;
96286b57669073 Florian Meier  2014-01-06  1008  				break;
e2eca6389b031c Martin Sperl   2016-04-11  1009  			}
96286b57669073 Florian Meier  2014-01-06  1010  
e2eca6389b031c Martin Sperl   2016-04-11  1011  		/* initialize the channel */
e2eca6389b031c Martin Sperl   2016-04-11  1012  		rc = bcm2835_dma_chan_init(od, i, irq[i], irq_flags);
96286b57669073 Florian Meier  2014-01-06  1013  		if (rc)
96286b57669073 Florian Meier  2014-01-06  1014  			goto err_no_dma;
96286b57669073 Florian Meier  2014-01-06  1015  	}
96286b57669073 Florian Meier  2014-01-06  1016  
96286b57669073 Florian Meier  2014-01-06  1017  	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", i);
96286b57669073 Florian Meier  2014-01-06  1018  
96286b57669073 Florian Meier  2014-01-06  1019  	/* Device-tree DMA controller registration */
96286b57669073 Florian Meier  2014-01-06  1020  	rc = of_dma_controller_register(pdev->dev.of_node,
96286b57669073 Florian Meier  2014-01-06  1021  			bcm2835_dma_xlate, od);
96286b57669073 Florian Meier  2014-01-06  1022  	if (rc) {
96286b57669073 Florian Meier  2014-01-06  1023  		dev_err(&pdev->dev, "Failed to register DMA controller\n");
96286b57669073 Florian Meier  2014-01-06  1024  		goto err_no_dma;
96286b57669073 Florian Meier  2014-01-06  1025  	}
96286b57669073 Florian Meier  2014-01-06  1026  
96286b57669073 Florian Meier  2014-01-06  1027  	rc = dma_async_device_register(&od->ddev);
96286b57669073 Florian Meier  2014-01-06  1028  	if (rc) {
96286b57669073 Florian Meier  2014-01-06  1029  		dev_err(&pdev->dev,
96286b57669073 Florian Meier  2014-01-06  1030  			"Failed to register slave DMA engine device: %d\n", rc);
96286b57669073 Florian Meier  2014-01-06  1031  		goto err_no_dma;
96286b57669073 Florian Meier  2014-01-06  1032  	}
96286b57669073 Florian Meier  2014-01-06  1033  
96286b57669073 Florian Meier  2014-01-06  1034  	dev_dbg(&pdev->dev, "Load BCM2835 DMA engine driver\n");
96286b57669073 Florian Meier  2014-01-06  1035  
96286b57669073 Florian Meier  2014-01-06  1036  	return 0;
96286b57669073 Florian Meier  2014-01-06  1037  
96286b57669073 Florian Meier  2014-01-06  1038  err_no_dma:
96286b57669073 Florian Meier  2014-01-06  1039  	bcm2835_dma_free(od);
96286b57669073 Florian Meier  2014-01-06  1040  	return rc;
96286b57669073 Florian Meier  2014-01-06  1041  }
96286b57669073 Florian Meier  2014-01-06  1042  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
