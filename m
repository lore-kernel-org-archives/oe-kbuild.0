Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752E92D7BF
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 17:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728493633; cv=none; b=gQForZKqmLo5Lue8s/1MKbaySOYe0+ZeLp6etyTfRpllGLi7hnn3jScvRWZyygqF71wH6PnQk1u7UX+7+WR9qd8CoLxhUpQVJ/8EeqN47We0dPP29ITAOSOC0RzyE+8eibKMGNTn6gu4bIUqyAPTdFVHXsIw/A0uwb7Zhpd3RXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728493633; c=relaxed/simple;
	bh=Yis/wW4cxYgveecozGLe8Cf2rGP/RwEO+gAGuAzXPyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tm9lSOI1BeVS7r3vnoU8GxBR9ANFmT3bU56FwF1b9zd8Xwzxvk2E/+aZyUxCmADPAdy1way6g7InAoEJPvS9g1ooJFYQmpIRXYEfXBzrEy8tcAGFROIqnOlJDvTASgZ9VpRvgdkGyDJ5zPR2R/QSF5oLJVwNxD3WzOU6dlJxgP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0V0pT1K; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0V0pT1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728493632; x=1760029632;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Yis/wW4cxYgveecozGLe8Cf2rGP/RwEO+gAGuAzXPyM=;
  b=X0V0pT1KgZNRDrE2M1a5uGJq8+DfUknGDSAyz+f0uSyLWFxTLru8BlHe
   XkX/snwhl8Es18BkihsN+w2VNicfu1AhDWOU7NwxYQmZ/uCKCGHZ54bXX
   7h0n0R5uaLjoS0HokwsmPMXgq34X2Y/yv+SlTpY5yfGwg13GK1xZ9Vsx3
   kYamHsXN2/QSxlf7JKJUx2/supRMg+EAIHmlnW3gmLbh97ampBNDhhEAw
   zOZ6lDN5eBYOSJyAxX2nR47IciwIHbKZPdkJZXtn4C5jBjlWricCyuucZ
   cnVf6tCwpHEmUlUPHCDClexGoMvuzyy+JQjvNvBA3oVMMAE+b+2OBfLdo
   Q==;
X-CSE-ConnectionGUID: ffmtBQVHS92zlfASS7+GIg==
X-CSE-MsgGUID: B9XU/MqlS3qoMIXQN8isCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27942429"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="27942429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 10:07:11 -0700
X-CSE-ConnectionGUID: yv0namRUQseBGUsciVPo7w==
X-CSE-MsgGUID: CdpZTkqkSp+o0XzS3iEl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="76520106"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2024 10:07:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sya9T-0009Xn-1K;
	Wed, 09 Oct 2024 17:07:07 +0000
Date: Thu, 10 Oct 2024 01:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 RESET 1/3] PCI: rockchip: Simplify clock handling by
 using clk_bulk*() function
Message-ID: <202410100015.9W01OqrR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241006182445.3713-2-linux.amoon@gmail.com>
References: <20241006182445.3713-2-linux.amoon@gmail.com>
TO: Anand Moon <linux.amoon@gmail.com>
TO: Shawn Lin <shawn.lin@rock-chips.com>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kw@linux.com>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: linux-pci@vger.kernel.org
TO: linux-rockchip@lists.infradead.org
TO: linux-kernel@vger.kernel.org
CC: Anand Moon <linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f602276d3902642fdc3429b548d73c745446601]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/PCI-rockchip-Simplify-clock-handling-by-using-clk_bulk-function/20241007-022714
base:   8f602276d3902642fdc3429b548d73c745446601
patch link:    https://lore.kernel.org/r/20241006182445.3713-2-linux.amoon%40gmail.com
patch subject: [PATCH v6 RESET 1/3] PCI: rockchip: Simplify clock handling by using clk_bulk*() function
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-r071-20241009 (https://download.01.org/0day-ci/archive/20241010/202410100015.9W01OqrR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410100015.9W01OqrR-lkp@intel.com/

smatch warnings:
drivers/pci/controller/pcie-rockchip.c:132 rockchip_pcie_parse_dt() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +132 drivers/pci/controller/pcie-rockchip.c

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
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  122  	if (rockchip->is_rc) {
58adbfb3ebec46 drivers/pci/controller/pcie-rockchip.c Chen-Yu Tsai          2021-01-22  123  		rockchip->ep_gpio = devm_gpiod_get_optional(dev, "ep",
840b7a5edf88fe drivers/pci/controller/pcie-rockchip.c Manivannan Sadhasivam 2024-04-16  124  							    GPIOD_OUT_LOW);
58adbfb3ebec46 drivers/pci/controller/pcie-rockchip.c Chen-Yu Tsai          2021-01-22  125  		if (IS_ERR(rockchip->ep_gpio))
58adbfb3ebec46 drivers/pci/controller/pcie-rockchip.c Chen-Yu Tsai          2021-01-22  126  			return dev_err_probe(dev, PTR_ERR(rockchip->ep_gpio),
58adbfb3ebec46 drivers/pci/controller/pcie-rockchip.c Chen-Yu Tsai          2021-01-22  127  					     "failed to get ep GPIO\n");
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  128  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  129  
9a8ff91a0ee96b drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-10-06  130  	rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
9a8ff91a0ee96b drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-10-06  131  	if (rockchip->num_clks < 0)
9a8ff91a0ee96b drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-10-06 @132  		return dev_err_probe(dev, err, "failed to get clocks\n");
4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  133  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  134  	return 0;
4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  135  }
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  136  EXPORT_SYMBOL_GPL(rockchip_pcie_parse_dt);
4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
