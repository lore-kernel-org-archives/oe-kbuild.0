Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378FE19E999
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 21:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735938617; cv=none; b=OdAQT1shXllxzwd3GLB4dUy0eyALNmLmlhLF1mpgneJ21wVxwPdmvn/a/o6ma4bnAXAXjfRNweOTeTeqsG6AdwJVqZftcFZWHU/L86TqMvsbAUUs1nU8PZC/HfnreEvW+XFwcjneUo+gr3n2txlD7baOr7z+aQg38sw1W5C2SDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735938617; c=relaxed/simple;
	bh=hwC7385MUu6GvJdubzzA5YOffp2/NJo0lncd3FHEHY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UMO4fEGBupKYbBl9XlAtqrh6yctnP5ZlQ1f9x31PoABmysBD162j1Z3p43B0OOpjD5Av9TnpMayudSn1Ls/XMSCX7m7ISnWGCgcfq0PqzIIzn4Z4lTSiIS+XAPK6t4/zTPuEEVfWElDOm9q2cV4J/hx40woLtpO3ZUjXc89wswc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJe8gaT3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJe8gaT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735938615; x=1767474615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwC7385MUu6GvJdubzzA5YOffp2/NJo0lncd3FHEHY0=;
  b=VJe8gaT3tRVuS28MFSVm+pGE1qm9TlPKJLiKTtJE++OW0WINx0/ODPrC
   Lh17GFPUwnIXcqCIL+dW9L67YerWlJ1AEfzBS62jEslkeM7J8w2PHNTiX
   WzGdqdNV6h39gV8mAVDB02mMpVnFRXzYMHoYvjJtMS7P9PsBPXNfp2/uA
   G7bzbEIZUre70Rz/mabwD2OsRripsp2y3KdyQBhv3IM4XERskgS3TTJQh
   C0Jt2os48SsdHOCh4RO2/88pcl0UCQgOkjPjPuviuzxUR15PEE8FvY6Gl
   CLpPrwlZJmEbxnQM9iK5xOQzGwl0edSh2+x41eCcJ1fi9tJJYi5hlf8ON
   w==;
X-CSE-ConnectionGUID: r1n7rOQNT7CW2z3QALhm2w==
X-CSE-MsgGUID: 4R9bkB2ZRyq+0YkPIvp/Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47544738"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="47544738"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 13:10:15 -0800
X-CSE-ConnectionGUID: KwOzkaHwQvWFcfZRxiUG6g==
X-CSE-MsgGUID: mf11zeawSOmnBNx946uCmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101744725"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jan 2025 13:10:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTovr-000AJC-10;
	Fri, 03 Jan 2025 21:10:11 +0000
Date: Sat, 4 Jan 2025 05:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pci:controller/rockchip 1/3]
 drivers/pci/controller/pcie-rockchip.c:134 rockchip_pcie_parse_dt() warn:
 passing zero to 'dev_err_probe'
Message-ID: <202501040409.SUV09R80-lkp@intel.com>
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
CC: linux-pci@vger.kernel.org
TO: Anand Moon <linux.amoon@gmail.com>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/rockchip
head:   8261bf695c47b98a2d8f63e04e2fc2e4a8c6b12b
commit: fa0ce454cd4ee35703d4126c5b8e4a9a398cf198 [1/3] PCI: rockchip: Simplify clock handling by using clk_bulk*() function
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r073-20250102 (https://download.01.org/0day-ci/archive/20250104/202501040409.SUV09R80-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501040409.SUV09R80-lkp@intel.com/

smatch warnings:
drivers/pci/controller/pcie-rockchip.c:134 rockchip_pcie_parse_dt() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +134 drivers/pci/controller/pcie-rockchip.c

9e2aee80c78d50 drivers/pci/host/pcie-rockchip.c       Rob Herring           2018-05-11   26  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   27  int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
277743ef616def drivers/pci/host/pcie-rockchip.c       Rajat Jain            2016-09-22   28  {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   29  	struct device *dev = rockchip->dev;
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   30  	struct platform_device *pdev = to_platform_device(dev);
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   31  	struct device_node *node = dev->of_node;
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   32  	struct resource *regs;
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   33  	int err;
277743ef616def drivers/pci/host/pcie-rockchip.c       Rajat Jain            2016-09-22   34  
cf590b07839133 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   35  	if (rockchip->is_rc) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   36  		regs = platform_get_resource_byname(pdev,
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   37  						    IORESOURCE_MEM,
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   38  						    "axi-base");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   39  		rockchip->reg_base = devm_pci_remap_cfg_resource(dev, regs);
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   40  		if (IS_ERR(rockchip->reg_base))
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   41  			return PTR_ERR(rockchip->reg_base);
cf590b07839133 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   42  	} else {
cf590b07839133 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   43  		rockchip->mem_res =
cf590b07839133 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   44  			platform_get_resource_byname(pdev, IORESOURCE_MEM,
cf590b07839133 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   45  						     "mem-base");
cf590b07839133 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   46  		if (!rockchip->mem_res)
cf590b07839133 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   47  			return -EINVAL;
277743ef616def drivers/pci/host/pcie-rockchip.c       Rajat Jain            2016-09-22   48  	}
277743ef616def drivers/pci/host/pcie-rockchip.c       Rajat Jain            2016-09-22   49  
e2dcd20b1645a7 drivers/pci/controller/pcie-rockchip.c Dejin Zheng           2020-06-03   50  	rockchip->apb_base =
e2dcd20b1645a7 drivers/pci/controller/pcie-rockchip.c Dejin Zheng           2020-06-03   51  		devm_platform_ioremap_resource_byname(pdev, "apb-base");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   52  	if (IS_ERR(rockchip->apb_base))
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   53  		return PTR_ERR(rockchip->apb_base);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03   54  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   55  	err = rockchip_pcie_get_phys(rockchip);
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   56  	if (err)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   57  		return err;
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03   58  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   59  	rockchip->lanes = 1;
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   60  	err = of_property_read_u32(node, "num-lanes", &rockchip->lanes);
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   61  	if (!err && (rockchip->lanes == 0 ||
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   62  		     rockchip->lanes == 3 ||
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   63  		     rockchip->lanes > 4)) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   64  		dev_warn(dev, "invalid num-lanes, default to use one lane\n");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   65  		rockchip->lanes = 1;
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03   66  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03   67  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   68  	rockchip->link_gen = of_pci_get_max_link_speed(node);
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   69  	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   70  		rockchip->link_gen = 2;
f06c6c41e6ccf9 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2017-07-19   71  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   72  	rockchip->core_rst = devm_reset_control_get_exclusive(dev, "core");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   73  	if (IS_ERR(rockchip->core_rst)) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   74  		if (PTR_ERR(rockchip->core_rst) != -EPROBE_DEFER)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   75  			dev_err(dev, "missing core reset property in node\n");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   76  		return PTR_ERR(rockchip->core_rst);
f06c6c41e6ccf9 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2017-07-19   77  	}
f06c6c41e6ccf9 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2017-07-19   78  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   79  	rockchip->mgmt_rst = devm_reset_control_get_exclusive(dev, "mgmt");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   80  	if (IS_ERR(rockchip->mgmt_rst)) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   81  		if (PTR_ERR(rockchip->mgmt_rst) != -EPROBE_DEFER)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   82  			dev_err(dev, "missing mgmt reset property in node\n");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   83  		return PTR_ERR(rockchip->mgmt_rst);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03   84  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03   85  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   86  	rockchip->mgmt_sticky_rst = devm_reset_control_get_exclusive(dev,
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   87  								"mgmt-sticky");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   88  	if (IS_ERR(rockchip->mgmt_sticky_rst)) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   89  		if (PTR_ERR(rockchip->mgmt_sticky_rst) != -EPROBE_DEFER)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   90  			dev_err(dev, "missing mgmt-sticky reset property in node\n");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   91  		return PTR_ERR(rockchip->mgmt_sticky_rst);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03   92  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03   93  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   94  	rockchip->pipe_rst = devm_reset_control_get_exclusive(dev, "pipe");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   95  	if (IS_ERR(rockchip->pipe_rst)) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   96  		if (PTR_ERR(rockchip->pipe_rst) != -EPROBE_DEFER)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   97  			dev_err(dev, "missing pipe reset property in node\n");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09   98  		return PTR_ERR(rockchip->pipe_rst);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03   99  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  100  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  101  	rockchip->pm_rst = devm_reset_control_get_exclusive(dev, "pm");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  102  	if (IS_ERR(rockchip->pm_rst)) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  103  		if (PTR_ERR(rockchip->pm_rst) != -EPROBE_DEFER)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  104  			dev_err(dev, "missing pm reset property in node\n");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  105  		return PTR_ERR(rockchip->pm_rst);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  106  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  107  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  108  	rockchip->pclk_rst = devm_reset_control_get_exclusive(dev, "pclk");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  109  	if (IS_ERR(rockchip->pclk_rst)) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  110  		if (PTR_ERR(rockchip->pclk_rst) != -EPROBE_DEFER)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  111  			dev_err(dev, "missing pclk reset property in node\n");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  112  		return PTR_ERR(rockchip->pclk_rst);
5667e655e1c77e drivers/pci/host/pcie-rockchip.c       Shawn Lin             2017-05-04  113  	}
5667e655e1c77e drivers/pci/host/pcie-rockchip.c       Shawn Lin             2017-05-04  114  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  115  	rockchip->aclk_rst = devm_reset_control_get_exclusive(dev, "aclk");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  116  	if (IS_ERR(rockchip->aclk_rst)) {
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  117  		if (PTR_ERR(rockchip->aclk_rst) != -EPROBE_DEFER)
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  118  			dev_err(dev, "missing aclk reset property in node\n");
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  119  		return PTR_ERR(rockchip->aclk_rst);
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  120  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  121  
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  122  	if (rockchip->is_rc)
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  123  		rockchip->perst_gpio = devm_gpiod_get_optional(dev, "ep",
840b7a5edf88fe drivers/pci/controller/pcie-rockchip.c Manivannan Sadhasivam 2024-04-16  124  							       GPIOD_OUT_LOW);
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  125  	else
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  126  		rockchip->perst_gpio = devm_gpiod_get_optional(dev, "reset",
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  127  							       GPIOD_IN);
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  128  	if (IS_ERR(rockchip->perst_gpio))
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  129  		return dev_err_probe(dev, PTR_ERR(rockchip->perst_gpio),
a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  130  				     "failed to get PERST# GPIO\n");
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  131  
fa0ce454cd4ee3 drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-12-02  132  	rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
fa0ce454cd4ee3 drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-12-02  133  	if (rockchip->num_clks < 0)
fa0ce454cd4ee3 drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-12-02 @134  		return dev_err_probe(dev, err, "failed to get clocks\n");
4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  135  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  136  	return 0;
4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  137  }
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  138  EXPORT_SYMBOL_GPL(rockchip_pcie_parse_dt);
4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
