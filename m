Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EDE8C1E
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 19:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680290695; x=1711826695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6u6Ohbf/JonjZDT2naSS7t+7D4CoL2DJp+OLon+lEfE=;
  b=oEkwWfFofjJifEC56ZenEqMbe3EpzjSDCEuFdvHXXsuBLQYDGlDVDEvN
   fQ3XyL6HJvPfAD9jiWL2PImwA/07qLd1JSIMT+O2IWxPxXi2+6jXU8ves
   86Hs2Gte+J0DfQfD1HvGApR9zuMqSmet1h+4aYr39BO0jjcPeek04kBwE
   VMT0igPeQOHQ4nq8lMCQ62KOcyndVQuQL759k1hdXP/tNQRahFwnxyLUt
   DYYGbeqKPFnBQZPcahaB8cAfYs9dj126tIHpQmqWgvo32H4kuDodQ88tF
   vpXhtDy+eoxC/7ZLhF+oNst8hAbYqpzMhD3zVFVj972xezK1TxDAsRmCM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321934621"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="321934621"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 12:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="828834742"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="828834742"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2023 12:24:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piKMm-000M5t-35;
	Fri, 31 Mar 2023 19:24:52 +0000
Date: Sat, 1 Apr 2023 03:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Use dev_err_probe()
Message-ID: <202304010325.2OPFvIm3-lkp@intel.com>
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
In-Reply-To: <202303231145121987818@zte.com.cn>
References: <202303231145121987818@zte.com.cn>
TO: ye.xingchen@zte.com.cn
TO: sergio.paracuellos@gmail.com
CC: lpieralisi@kernel.org
CC: kw@linux.com
CC: robh@kernel.org
CC: bhelgaas@google.com
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: linux-pci@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-com-cn/PCI-mt7621-Use-dev_err_probe/20230323-114623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/202303231145121987818%40zte.com.cn
patch subject: [PATCH] PCI: mt7621: Use dev_err_probe()
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: s390-randconfig-m031-20230329 (https://download.01.org/0day-ci/archive/20230401/202304010325.2OPFvIm3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304010325.2OPFvIm3-lkp@intel.com/

smatch warnings:
drivers/pci/controller/pcie-mt7621.c:224 mt7621_pcie_parse_port() warn: passing zero to 'PTR_ERR'
drivers/pci/controller/pcie-mt7621.c:227 mt7621_pcie_parse_port() warn: ignoring unreachable code.

vim +/PTR_ERR +224 drivers/pci/controller/pcie-mt7621.c

e51844bf825169 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-24  197  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  198  static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  199  				  struct device_node *node,
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  200  				  int slot)
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  201  {
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  202  	struct mt7621_pcie_port *port;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  203  	struct device *dev = pcie->dev;
fab6710e4c51f4 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-04-13  204  	struct platform_device *pdev = to_platform_device(dev);
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2019-01-04  205  	char name[10];
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  206  	int err;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  207  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  208  	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  209  	if (!port)
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  210  		return -ENOMEM;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  211  
108b2f2a972454 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-11-23  212  	port->base = devm_platform_ioremap_resource(pdev, slot + 1);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  213  	if (IS_ERR(port->base))
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  214  		return PTR_ERR(port->base);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  215  
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  216  	port->clk = devm_get_clk_from_child(dev, node, NULL);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  217  	if (IS_ERR(port->clk)) {
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  218  		dev_err(dev, "failed to get pcie%d clock\n", slot);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  219  		return PTR_ERR(port->clk);
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  220  	}
cc4e864a5ce4c1 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-05-05  221  
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  222  	port->pcie_rst = of_reset_control_get_exclusive(node, NULL);
9873bac812f262 drivers/pci/controller/pcie-mt7621.c    Ye Xingchen        2023-03-23  223  
9873bac812f262 drivers/pci/controller/pcie-mt7621.c    Ye Xingchen        2023-03-23 @224  	return dev_err_probe(dev, PTR_ERR(port->pcie_rst),
9873bac812f262 drivers/pci/controller/pcie-mt7621.c    Ye Xingchen        2023-03-23  225  			     "failed to get pcie%d reset control\n", slot);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  226  
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2019-01-04 @227  	snprintf(name, sizeof(name), "pcie-phy%d", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  228  	port->phy = devm_of_phy_get(dev, node, name);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  229  	if (IS_ERR(port->phy)) {
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  230  		dev_err(dev, "failed to get pcie-phy%d\n", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  231  		err = PTR_ERR(port->phy);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  232  		goto remove_reset;
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  233  	}
61f9bde6ea578f drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2019-01-04  234  
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-13  235  	port->gpio_rst = devm_gpiod_get_index_optional(dev, "reset", slot,
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-13  236  						       GPIOD_OUT_LOW);
825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-20  237  	if (IS_ERR(port->gpio_rst)) {
2bdd5238e756aa drivers/pci/controller/pcie-mt7621.c    Sergio Paracuellos 2021-09-22  238  		dev_err(dev, "failed to get GPIO for PCIe%d\n", slot);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  239  		err = PTR_ERR(port->gpio_rst);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  240  		goto remove_reset;
825c6f470c62da drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-20  241  	}
b27e35f91c75cf drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2020-03-13  242  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  243  	port->slot = slot;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  244  	port->pcie = pcie;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  245  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  246  	INIT_LIST_HEAD(&port->list);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  247  	list_add_tail(&port->list, &pcie->ports);
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  248  
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  249  	return 0;
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  250  
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  251  remove_reset:
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  252  	reset_control_put(port->pcie_rst);
2d3d288f0eaf10 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2021-06-07  253  	return err;
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  254  }
ad9c87e129d139 drivers/staging/mt7621-pci/pci-mt7621.c Sergio Paracuellos 2018-11-04  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
