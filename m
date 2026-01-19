Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EE42DB78A
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 19:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852756; cv=none; b=DBzU4Tz7HjUpTNR6hbHFoAIMH6d0Cd640j03SejJpFTFZWJSriq2ftjh4Rw2GCh/S/OskAxPq26j4k4XxtSO5em9Q0vtrbKmQVI0udR73X6vEJf2rGf5QBLQDJWm8GTtCbhs51XC2hKM9m8wp02KZDDTZVMseElUSelHwod3dyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852756; c=relaxed/simple;
	bh=a30vfeoqsblq2W7RxzRi4W+ySmHnXYq60wEFurDZ/OM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PznBliZR0RIlLxScV8eiTikGyVqaKe4EqkTTZiHvNOLMggyB2En0YsFG5OqD2mW1lzVtegXf6Sds2FyWNRC2o/4L5u+0YI5TUBBOP7AJClA3nEEegKW6iN4z8ejVTGCV8MelPrUtsD9PamfBcloU8ojztW96NJyXIP2cNFPPji4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0TkzMKt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0TkzMKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768852756; x=1800388756;
  h=date:from:to:cc:subject:message-id;
  bh=a30vfeoqsblq2W7RxzRi4W+ySmHnXYq60wEFurDZ/OM=;
  b=Y0TkzMKtIeCYuj1yA6IA69zn7o0KMyojFil8Who10yYhYr96mWqJJa+1
   FesxGxLwMHo7n5gz/4+nsIFCHzb4kol/eggPfJYVT0QeUkZICfXnXBLnY
   I++iffiT/8Qjodw9m3G441KTgKWZhrFJpChkX1LCOd9HreO1Qq/UVE3h9
   0X98Yh1LoNI6xGmM/We1HaldGFn5eJOulu2xnYykEUjB4WIjo+mtMdr/b
   0GR3JWGQZoH/AjQI1Rrpm1o9wwxo5iZrZ0lPp3eOvazMz6gmjksV0+Fku
   3USVYDvEP5rQ3CoQ+yslFMuQ+ctJR9mL3jfGSBmH+HW7JghJF/wAKzjVJ
   w==;
X-CSE-ConnectionGUID: 94rRSvDqRLuCSFSuxnIOVQ==
X-CSE-MsgGUID: 194kKBmSQjeWd4RdrmTM8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70154302"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70154302"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 11:59:15 -0800
X-CSE-ConnectionGUID: Tz4osbYBT0mESA8+iIFwKw==
X-CSE-MsgGUID: /U+THOlYSIWV50p+Vh44aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210444021"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2026 11:59:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhvP4-00000000OG6-34lh;
	Mon, 19 Jan 2026 19:59:10 +0000
Date: Tue, 20 Jan 2026 03:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/pcie-rzg3s-host.c:1675
 rzg3s_pcie_suspend_noirq() warn: 'port->refclk' from clk_prepare_enable() not
 released on lines: 1675.
Message-ID: <202601200310.Qy35J0Pm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Manivannan Sadhasivam <mani@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 7ef502fb35b283e0f85ed7b34e2d963343981a8c PCI: Add Renesas RZ/G3S host controller driver
date:   8 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 weeks ago
config: loongarch-randconfig-r072-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200310.Qy35J0Pm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200310.Qy35J0Pm-lkp@intel.com/

New smatch warnings:
drivers/pci/controller/pcie-rzg3s-host.c:1675 rzg3s_pcie_suspend_noirq() warn: 'port->refclk' from clk_prepare_enable() not released on lines: 1675.

Old smatch warnings:
drivers/pci/controller/pcie-rzg3s-host.c:1348 rzg3s_pcie_parse_map_dma_ranges() warn: iterator 'i' not incremented
arch/loongarch/include/asm/atomic.h:135 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +1675 drivers/pci/controller/pcie-rzg3s-host.c

7ef502fb35b283 Claudiu Beznea 2025-11-19  1632  
7ef502fb35b283 Claudiu Beznea 2025-11-19  1633  static int rzg3s_pcie_suspend_noirq(struct device *dev)
7ef502fb35b283 Claudiu Beznea 2025-11-19  1634  {
7ef502fb35b283 Claudiu Beznea 2025-11-19  1635  	struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
7ef502fb35b283 Claudiu Beznea 2025-11-19  1636  	const struct rzg3s_pcie_soc_data *data = host->data;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1637  	struct rzg3s_pcie_port *port = &host->port;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1638  	struct regmap *sysc = host->sysc;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1639  	int ret;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1640  
7ef502fb35b283 Claudiu Beznea 2025-11-19  1641  	ret = pm_runtime_put_sync(dev);
7ef502fb35b283 Claudiu Beznea 2025-11-19  1642  	if (ret)
7ef502fb35b283 Claudiu Beznea 2025-11-19  1643  		return ret;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1644  
7ef502fb35b283 Claudiu Beznea 2025-11-19  1645  	clk_disable_unprepare(port->refclk);
7ef502fb35b283 Claudiu Beznea 2025-11-19  1646  
7ef502fb35b283 Claudiu Beznea 2025-11-19  1647  	ret = reset_control_bulk_assert(data->num_power_resets,
7ef502fb35b283 Claudiu Beznea 2025-11-19  1648  					host->power_resets);
7ef502fb35b283 Claudiu Beznea 2025-11-19  1649  	if (ret)
7ef502fb35b283 Claudiu Beznea 2025-11-19  1650  		goto refclk_restore;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1651  
7ef502fb35b283 Claudiu Beznea 2025-11-19  1652  	ret = reset_control_bulk_assert(data->num_cfg_resets,
7ef502fb35b283 Claudiu Beznea 2025-11-19  1653  					host->cfg_resets);
7ef502fb35b283 Claudiu Beznea 2025-11-19  1654  	if (ret)
7ef502fb35b283 Claudiu Beznea 2025-11-19  1655  		goto power_resets_restore;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1656  
7ef502fb35b283 Claudiu Beznea 2025-11-19  1657  	ret = regmap_update_bits(sysc, RZG3S_SYS_PCIE_RST_RSM_B,
7ef502fb35b283 Claudiu Beznea 2025-11-19  1658  				 RZG3S_SYS_PCIE_RST_RSM_B_MASK,
7ef502fb35b283 Claudiu Beznea 2025-11-19  1659  				 FIELD_PREP(RZG3S_SYS_PCIE_RST_RSM_B_MASK, 0));
7ef502fb35b283 Claudiu Beznea 2025-11-19  1660  	if (ret)
7ef502fb35b283 Claudiu Beznea 2025-11-19  1661  		goto cfg_resets_restore;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1662  
7ef502fb35b283 Claudiu Beznea 2025-11-19  1663  	return 0;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1664  
7ef502fb35b283 Claudiu Beznea 2025-11-19  1665  	/* Restore the previous state if any error happens */
7ef502fb35b283 Claudiu Beznea 2025-11-19  1666  cfg_resets_restore:
7ef502fb35b283 Claudiu Beznea 2025-11-19  1667  	reset_control_bulk_deassert(data->num_cfg_resets,
7ef502fb35b283 Claudiu Beznea 2025-11-19  1668  				    host->cfg_resets);
7ef502fb35b283 Claudiu Beznea 2025-11-19  1669  power_resets_restore:
7ef502fb35b283 Claudiu Beznea 2025-11-19  1670  	reset_control_bulk_deassert(data->num_power_resets,
7ef502fb35b283 Claudiu Beznea 2025-11-19  1671  				    host->power_resets);
7ef502fb35b283 Claudiu Beznea 2025-11-19  1672  refclk_restore:
7ef502fb35b283 Claudiu Beznea 2025-11-19  1673  	clk_prepare_enable(port->refclk);
7ef502fb35b283 Claudiu Beznea 2025-11-19  1674  	pm_runtime_resume_and_get(dev);
7ef502fb35b283 Claudiu Beznea 2025-11-19 @1675  	return ret;
7ef502fb35b283 Claudiu Beznea 2025-11-19  1676  }
7ef502fb35b283 Claudiu Beznea 2025-11-19  1677  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
