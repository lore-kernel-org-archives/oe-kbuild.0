Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165192904
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Feb 2025 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739718083; cv=none; b=dLewfYkSdEO8D4f44lyyWhx+tzyHeod5A5L03iyKLixk59H3y+TimHbO45eayTsKcX59MIWSVF816ENOy8YkUszBwvLbmHFqUWKwLJ286nQjNqjshQIv1Tx92uZPyhFFdA23mZM+vFwfmrIbggcFEbD0q/UQVdEKVkUU9u7CLzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739718083; c=relaxed/simple;
	bh=TXOpgpo5GR4eyDdmt219/arL+tmJbnkCy7rsKo+wBCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qP2NJig9lQMTmYWnEAblcRYh8DCnBWKSt4JbiAn+XyKhA1A+L7Kh5LeZ+AJX5oVzku6fZg3vY8PqJv+4XdiZJhv6hixyXR/nHQ/+YNb3tDp0kKR0khtABbCX8z+toQjV3hro5Zusv6VKC+LIZBcRP90LRmO2oAedMRjYxVyF1Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOlObkPD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOlObkPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739718081; x=1771254081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TXOpgpo5GR4eyDdmt219/arL+tmJbnkCy7rsKo+wBCU=;
  b=WOlObkPDJ2llcDobS4hmhJXKmTp8DfZjJ16otiltmNY5hXGZVc5n5Rt2
   idZxTIpMmSjMiEc/tlf+vx3AcuvCNMx7GH0thZ+OkJvNCelALhmLl5rDZ
   bPffhkGUJ3WLM5+zNJfgbbDW1JOtvzele2D144TpOqs5SsISPMEmB4nWM
   dEqJlai8E9qizz+fJgZ9VvQBwRpAfZxE3oPS55EJGBwEH3YVY0nZgtROx
   8Mt4QoNuUmlAS6Bas6nBFcAqRi93wlM437eSNgsUUn/0nTC9wNC6r0Pzh
   J/otjFdC2D2dG9xJ3tCbZ+bqbIh38TB0cbX7PT+CMitPnOt/N63yF3f/z
   w==;
X-CSE-ConnectionGUID: Z7fC84bIQam+a/Al0E8pzw==
X-CSE-MsgGUID: usrUUr+BQTmcHR9hOaK2UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51391749"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="51391749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 07:01:20 -0800
X-CSE-ConnectionGUID: seeaQ54iRqSj5Zox824WLw==
X-CSE-MsgGUID: 9cr1yMXbTyeGiEspG970Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="144751932"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2025 07:01:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjg8z-001C0N-0Q;
	Sun, 16 Feb 2025 15:01:17 +0000
Date: Sun, 16 Feb 2025 23:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:242:51-57: opportunity
 for str_on_off(enable)
Message-ID: <202502162250.oxR8oKDN-lkp@intel.com>
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
TO: Bingbu Cao <bingbu.cao@intel.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Andreas Helbech Kleist <andreaskleist@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Hi Bingbu,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ad1b832bf1cf2df9304f8eb72943111625c7e5a7
commit: c70281cc83d666d8c064b4c82cc94b6dc9e9f310 media: intel/ipu6: add Kconfig and Makefile
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-102-20250216 (https://download.01.org/0day-ci/archive/20250216/202502162250.oxR8oKDN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502162250.oxR8oKDN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:242:51-57: opportunity for str_on_off(enable)
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:352:43-49: opportunity for str_on_off(enable)

vim +242 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c

a11a5570a09dbc Bingbu Cao 2024-01-31  227  
a11a5570a09dbc Bingbu Cao 2024-01-31  228  static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
a11a5570a09dbc Bingbu Cao 2024-01-31  229  				     const struct ipu6_isys_csi2_timing *timing,
a11a5570a09dbc Bingbu Cao 2024-01-31  230  				     unsigned int nlanes, int enable)
a11a5570a09dbc Bingbu Cao 2024-01-31  231  {
a11a5570a09dbc Bingbu Cao 2024-01-31  232  	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
a11a5570a09dbc Bingbu Cao 2024-01-31  233  	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
a11a5570a09dbc Bingbu Cao 2024-01-31  234  	struct ipu6_isys *isys = csi2->isys;
a11a5570a09dbc Bingbu Cao 2024-01-31  235  	struct device *dev = &isys->adev->auxdev.dev;
a11a5570a09dbc Bingbu Cao 2024-01-31  236  	struct ipu6_isys_csi2_config cfg;
a11a5570a09dbc Bingbu Cao 2024-01-31  237  	unsigned int nports;
a11a5570a09dbc Bingbu Cao 2024-01-31  238  	int ret = 0;
a11a5570a09dbc Bingbu Cao 2024-01-31  239  	u32 mask = 0;
a11a5570a09dbc Bingbu Cao 2024-01-31  240  	u32 i;
a11a5570a09dbc Bingbu Cao 2024-01-31  241  
a11a5570a09dbc Bingbu Cao 2024-01-31 @242  	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", enable ? "on" : "off",
a11a5570a09dbc Bingbu Cao 2024-01-31  243  		csi2->port, nlanes);
a11a5570a09dbc Bingbu Cao 2024-01-31  244  
a11a5570a09dbc Bingbu Cao 2024-01-31  245  	cfg.port = csi2->port;
a11a5570a09dbc Bingbu Cao 2024-01-31  246  	cfg.nlanes = nlanes;
a11a5570a09dbc Bingbu Cao 2024-01-31  247  
a11a5570a09dbc Bingbu Cao 2024-01-31  248  	mask = isys->pdata->ipdata->csi2.irq_mask;
a11a5570a09dbc Bingbu Cao 2024-01-31  249  	nports = isys->pdata->ipdata->csi2.nports;
a11a5570a09dbc Bingbu Cao 2024-01-31  250  
a11a5570a09dbc Bingbu Cao 2024-01-31  251  	if (!enable) {
a11a5570a09dbc Bingbu Cao 2024-01-31  252  		writel(0, csi2->base + CSI_REG_CSI_FE_ENABLE);
a11a5570a09dbc Bingbu Cao 2024-01-31  253  		writel(0, csi2->base + CSI_REG_PPI2CSI_ENABLE);
a11a5570a09dbc Bingbu Cao 2024-01-31  254  
a11a5570a09dbc Bingbu Cao 2024-01-31  255  		writel(0,
a11a5570a09dbc Bingbu Cao 2024-01-31  256  		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
a11a5570a09dbc Bingbu Cao 2024-01-31  257  		       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  258  		writel(mask,
a11a5570a09dbc Bingbu Cao 2024-01-31  259  		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
a11a5570a09dbc Bingbu Cao 2024-01-31  260  		       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  261  		writel(0,
a11a5570a09dbc Bingbu Cao 2024-01-31  262  		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
a11a5570a09dbc Bingbu Cao 2024-01-31  263  		       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  264  		writel(0xffffffff,
a11a5570a09dbc Bingbu Cao 2024-01-31  265  		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
a11a5570a09dbc Bingbu Cao 2024-01-31  266  		       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  267  
a11a5570a09dbc Bingbu Cao 2024-01-31  268  		isys->phy_set_power(isys, &cfg, timing, false);
a11a5570a09dbc Bingbu Cao 2024-01-31  269  
a11a5570a09dbc Bingbu Cao 2024-01-31  270  		writel(0, isys->pdata->base + CSI_REG_HUB_FW_ACCESS_PORT
a11a5570a09dbc Bingbu Cao 2024-01-31  271  		       (isys->pdata->ipdata->csi2.fw_access_port_ofs,
a11a5570a09dbc Bingbu Cao 2024-01-31  272  			csi2->port));
a11a5570a09dbc Bingbu Cao 2024-01-31  273  		writel(0, isys->pdata->base +
a11a5570a09dbc Bingbu Cao 2024-01-31  274  		       CSI_REG_HUB_DRV_ACCESS_PORT(csi2->port));
a11a5570a09dbc Bingbu Cao 2024-01-31  275  
a11a5570a09dbc Bingbu Cao 2024-01-31  276  		return ret;
a11a5570a09dbc Bingbu Cao 2024-01-31  277  	}
a11a5570a09dbc Bingbu Cao 2024-01-31  278  
a11a5570a09dbc Bingbu Cao 2024-01-31  279  	/* reset port reset */
a11a5570a09dbc Bingbu Cao 2024-01-31  280  	writel(0x1, csi2->base + CSI_REG_PORT_GPREG_SRST);
a11a5570a09dbc Bingbu Cao 2024-01-31  281  	usleep_range(100, 200);
a11a5570a09dbc Bingbu Cao 2024-01-31  282  	writel(0x0, csi2->base + CSI_REG_PORT_GPREG_SRST);
a11a5570a09dbc Bingbu Cao 2024-01-31  283  
a11a5570a09dbc Bingbu Cao 2024-01-31  284  	/* enable port clock */
a11a5570a09dbc Bingbu Cao 2024-01-31  285  	for (i = 0; i < nports; i++) {
a11a5570a09dbc Bingbu Cao 2024-01-31  286  		writel(1, isys->pdata->base + CSI_REG_HUB_DRV_ACCESS_PORT(i));
a11a5570a09dbc Bingbu Cao 2024-01-31  287  		writel(1, isys->pdata->base + CSI_REG_HUB_FW_ACCESS_PORT
a11a5570a09dbc Bingbu Cao 2024-01-31  288  		       (isys->pdata->ipdata->csi2.fw_access_port_ofs, i));
a11a5570a09dbc Bingbu Cao 2024-01-31  289  	}
a11a5570a09dbc Bingbu Cao 2024-01-31  290  
a11a5570a09dbc Bingbu Cao 2024-01-31  291  	/* enable all error related irq */
a11a5570a09dbc Bingbu Cao 2024-01-31  292  	writel(mask,
a11a5570a09dbc Bingbu Cao 2024-01-31  293  	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
a11a5570a09dbc Bingbu Cao 2024-01-31  294  	       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  295  	writel(mask,
a11a5570a09dbc Bingbu Cao 2024-01-31  296  	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
a11a5570a09dbc Bingbu Cao 2024-01-31  297  	       CSI_PORT_REG_BASE_IRQ_MASK_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  298  	writel(mask,
a11a5570a09dbc Bingbu Cao 2024-01-31  299  	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
a11a5570a09dbc Bingbu Cao 2024-01-31  300  	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  301  	writel(mask,
a11a5570a09dbc Bingbu Cao 2024-01-31  302  	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
a11a5570a09dbc Bingbu Cao 2024-01-31  303  	       CSI_PORT_REG_BASE_IRQ_LEVEL_NOT_PULSE_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  304  	writel(mask,
a11a5570a09dbc Bingbu Cao 2024-01-31  305  	       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
a11a5570a09dbc Bingbu Cao 2024-01-31  306  	       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  307  
a11a5570a09dbc Bingbu Cao 2024-01-31  308  	/*
a11a5570a09dbc Bingbu Cao 2024-01-31  309  	 * Using event from firmware instead of irq to handle CSI2 sync event
a11a5570a09dbc Bingbu Cao 2024-01-31  310  	 * which can reduce system wakeups. If CSI2 sync irq enabled, we need
a11a5570a09dbc Bingbu Cao 2024-01-31  311  	 * disable the firmware CSI2 sync event to avoid duplicate handling.
a11a5570a09dbc Bingbu Cao 2024-01-31  312  	 */
a11a5570a09dbc Bingbu Cao 2024-01-31  313  	writel(0xffffffff, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
a11a5570a09dbc Bingbu Cao 2024-01-31  314  	       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  315  	writel(0, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
a11a5570a09dbc Bingbu Cao 2024-01-31  316  	       CSI_PORT_REG_BASE_IRQ_MASK_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  317  	writel(0xffffffff, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
a11a5570a09dbc Bingbu Cao 2024-01-31  318  	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  319  	writel(0, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
a11a5570a09dbc Bingbu Cao 2024-01-31  320  	       CSI_PORT_REG_BASE_IRQ_LEVEL_NOT_PULSE_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  321  	writel(0xffffffff, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
a11a5570a09dbc Bingbu Cao 2024-01-31  322  	       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
a11a5570a09dbc Bingbu Cao 2024-01-31  323  
a11a5570a09dbc Bingbu Cao 2024-01-31  324  	/* configure to enable FE and PPI2CSI */
a11a5570a09dbc Bingbu Cao 2024-01-31  325  	writel(0, csi2->base + CSI_REG_CSI_FE_MODE);
a11a5570a09dbc Bingbu Cao 2024-01-31  326  	writel(CSI_SENSOR_INPUT, csi2->base + CSI_REG_CSI_FE_MUX_CTRL);
a11a5570a09dbc Bingbu Cao 2024-01-31  327  	writel(CSI_CNTR_SENSOR_LINE_ID | CSI_CNTR_SENSOR_FRAME_ID,
a11a5570a09dbc Bingbu Cao 2024-01-31  328  	       csi2->base + CSI_REG_CSI_FE_SYNC_CNTR_SEL);
a11a5570a09dbc Bingbu Cao 2024-01-31  329  	writel(FIELD_PREP(PPI_INTF_CONFIG_NOF_ENABLED_DLANES_MASK, nlanes - 1),
a11a5570a09dbc Bingbu Cao 2024-01-31  330  	       csi2->base + CSI_REG_PPI2CSI_CONFIG_PPI_INTF);
a11a5570a09dbc Bingbu Cao 2024-01-31  331  
a11a5570a09dbc Bingbu Cao 2024-01-31  332  	writel(1, csi2->base + CSI_REG_PPI2CSI_ENABLE);
a11a5570a09dbc Bingbu Cao 2024-01-31  333  	writel(1, csi2->base + CSI_REG_CSI_FE_ENABLE);
a11a5570a09dbc Bingbu Cao 2024-01-31  334  
a11a5570a09dbc Bingbu Cao 2024-01-31  335  	ret = isys->phy_set_power(isys, &cfg, timing, true);
a11a5570a09dbc Bingbu Cao 2024-01-31  336  	if (ret)
a11a5570a09dbc Bingbu Cao 2024-01-31  337  		dev_err(dev, "csi-%d phy power up failed %d\n", csi2->port,
a11a5570a09dbc Bingbu Cao 2024-01-31  338  			ret);
a11a5570a09dbc Bingbu Cao 2024-01-31  339  
a11a5570a09dbc Bingbu Cao 2024-01-31  340  	return ret;
a11a5570a09dbc Bingbu Cao 2024-01-31  341  }
a11a5570a09dbc Bingbu Cao 2024-01-31  342  

:::::: The code at line 242 was first introduced by commit
:::::: a11a5570a09dbcbe3b8813bd9fb7e9c630afdbf4 media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
