Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A911E536
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 05:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMEGzBWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702273967; x=1733809967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bt89mLqdVQOleuWJAFmD2thHEWpeygUGXYacyXWU1wY=;
  b=PMEGzBWP1zqIugJ6ATt6boYr76OGWUdrjCZo7b0HImlm3ah2pG4JWW1s
   U6HCyu6M8Qiih2u7cMmVNr+EGef16YFSLZjF/mnJdLXT4oPCVC+mKSg0X
   fclLL+mF9GXTOiDe1YCHheEaF89UxUvqMYAX6yi5dZ0xn0N+2Ymu5zYw2
   laEUgscawvKPTYmhM/TzSS1NVWFqva88yvcGgoNvHFK7hoJ4Ksm+E+RkU
   bmFg4dXpXz+OEkMljlqhwu0pWHwjjFcJZ/sIhWJ+REPj5V2zvaAjzT6Zc
   buijIE+KSwThNFoXvSnb0ooxUsnmXcvct1hPnOuUlyITv9aNeQHDB/z9W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="461073793"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="461073793"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 21:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="807170132"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="807170132"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Dec 2023 21:52:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCZDd-000Hgh-1m;
	Mon, 11 Dec 2023 05:52:41 +0000
Date: Mon, 11 Dec 2023 13:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pci/controller/pcie-mt7621.c:241:49: warning: 'snprintf'
 output may be truncated before the last format character
Message-ID: <202312111344.ghnJwbSD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
CC: Bjorn Helgaas <helgaas@kernel.org>

Hi Sergio,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
commit: 44ddb791f8f41f5f9f2ab4280a27c179ca7a8aed PCI: mt7621: Allow COMPILE_TEST for all arches
date:   1 year, 11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 11 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231211/202312111344.ghnJwbSD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312111344.ghnJwbSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312111344.ghnJwbSD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/pcie-mt7621.c: In function 'mt7621_pcie_parse_port':
>> drivers/pci/controller/pcie-mt7621.c:241:49: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     241 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |                                                 ^
   drivers/pci/controller/pcie-mt7621.c:241:9: note: 'snprintf' output between 10 and 11 bytes into a destination of size 10
     241 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +241 drivers/pci/controller/pcie-mt7621.c

e51844bf825169 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-24  210  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  211  static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  212  				  struct device_node *node,
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  213  				  int slot)
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  214  {
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  215  	struct mt7621_pcie_port *port;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  216  	struct device *dev = pcie->dev;
fab6710e4c51f4 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-04-13  217  	struct platform_device *pdev = to_platform_device(dev);
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2019-01-04  218  	char name[10];
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  219  	int err;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  220  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  221  	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  222  	if (!port)
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  223  		return -ENOMEM;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  224  
108b2f2a972454 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-11-23  225  	port->base = devm_platform_ioremap_resource(pdev, slot + 1);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  226  	if (IS_ERR(port->base))
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  227  		return PTR_ERR(port->base);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  228  
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  229  	port->clk = devm_get_clk_from_child(dev, node, NULL);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  230  	if (IS_ERR(port->clk)) {
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  231  		dev_err(dev, "failed to get pcie%d clock\n", slot);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  232  		return PTR_ERR(port->clk);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  233  	}
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  234  
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  235  	port->pcie_rst = of_reset_control_get_exclusive(node, NULL);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  236  	if (PTR_ERR(port->pcie_rst) == -EPROBE_DEFER) {
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  237  		dev_err(dev, "failed to get pcie%d reset control\n", slot);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  238  		return PTR_ERR(port->pcie_rst);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  239  	}
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  240  
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2019-01-04 @241  	snprintf(name, sizeof(name), "pcie-phy%d", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  242  	port->phy = devm_of_phy_get(dev, node, name);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  243  	if (IS_ERR(port->phy)) {
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  244  		dev_err(dev, "failed to get pcie-phy%d\n", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  245  		err = PTR_ERR(port->phy);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  246  		goto remove_reset;
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  247  	}
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2019-01-04  248  
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-13  249  	port->gpio_rst = devm_gpiod_get_index_optional(dev, "reset", slot,
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-13  250  						       GPIOD_OUT_LOW);
825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-20  251  	if (IS_ERR(port->gpio_rst)) {
2bdd5238e756aa drivers/pci/controller/pcie-mt7621.c    Sergio Paracuellos 2021-09-22  252  		dev_err(dev, "failed to get GPIO for PCIe%d\n", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  253  		err = PTR_ERR(port->gpio_rst);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  254  		goto remove_reset;
825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-20  255  	}
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-13  256  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  257  	port->slot = slot;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  258  	port->pcie = pcie;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  259  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  260  	INIT_LIST_HEAD(&port->list);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  261  	list_add_tail(&port->list, &pcie->ports);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  262  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  263  	return 0;
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  264  
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  265  remove_reset:
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  266  	reset_control_put(port->pcie_rst);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  267  	return err;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  268  }
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  269  

:::::: The code at line 241 was first introduced by commit
:::::: 61f9bde6ea578f5baa1662c97365f7b36fc790fa staging: mt7621-pci: handle phy using new generic phy 'pci-mt7621-phy' driver

:::::: TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
