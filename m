Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2F3B19A0
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745899; cv=none; b=Kqr6OhwWECazBuxp+IrbOE/0p5D++4JebvJeifPo9q50vz/k/u1Rwrh6fK/tp/RIT11zBRMvuDuHXpnCPhDKLGIORN78OvRYKL0rLDnpilVm0d/B3bxn1rPh3hPF7HNxtUwn5djqzFSsHay+QEFAFoZNoF9w2rpLIrNOxTZnUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745899; c=relaxed/simple;
	bh=HpfRYxRSHahyfk0+aZMD2OCxOyvZ7Wnd8KYhuqtj+9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TCUfn131/Os3TqUw9n0V/efLHpj804hyoFIxR7hfu+lQcuPznb9AcC1xxJpxn6UfwoU22QOFrDy8in7JK5ScgcVF7LfuMIyAWAfzJi5obfvQzkdsjvZeLgYd9JbSCCw5D+obpR6h/0EM65X5D9tYViJnmzWtk0LnbFIZmYeAgNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDC71jJN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDC71jJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778745897; x=1810281897;
  h=date:from:to:cc:subject:message-id;
  bh=HpfRYxRSHahyfk0+aZMD2OCxOyvZ7Wnd8KYhuqtj+9o=;
  b=nDC71jJN24kjx2jy9chu63gq8/CKbGm1dGy3PIy2vFI6mw1hPypDYkIl
   EVJPX/VhT5VeFXfVsuc7yvS/QWhvzp1SaKWTsfGDdtngfqREmang9/KAA
   poDK4pBTnWGf3Efw+jgfoFspbLaowVciJeEW9ChPrdIyMtmJsVYFdsZSl
   7JFNCsl1h9mmdTHt8NBEzuujtMbjJqPWL4SQtck0+sHY4hs0nk6a2uDQm
   PTocyHz5wYmkoYA7fUcZvRcNSGwsa2qOqdmMABPpogZz7i6Np0KnL04dx
   LO4hezpxAzd5V9hiqrRh9Kwdni4LNl1AIB3xRLA9+JcG06jtNJmFZJsr4
   w==;
X-CSE-ConnectionGUID: ybatBlDLR62wd8/iRhzsMQ==
X-CSE-MsgGUID: BmSbVMKMR/q24RrTbS0bPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83297971"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="83297971"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 01:04:56 -0700
X-CSE-ConnectionGUID: jYSuP2fyRb6jjHSUVBqAmg==
X-CSE-MsgGUID: YPyI6gBFQrW+QSmgeoTP5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="234039421"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2026 01:04:55 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNR3t-0000000069Z-0ian;
	Thu, 14 May 2026 08:04:53 +0000
Date: Thu, 14 May 2026 16:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/pcie-rzg3s-host.c:1675
 rzg3s_pcie_suspend_noirq() warn: 'port->refclk' from clk_prepare_enable() not
 released on lines: 1675.
Message-ID: <202605141513.i0HxcVmM-lkp@intel.com>
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
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 7ef502fb35b283e0f85ed7b34e2d963343981a8c PCI: Add Renesas RZ/G3S host controller driver
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: alpha-randconfig-r071-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141513.i0HxcVmM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7ef502fb35b2 ("PCI: Add Renesas RZ/G3S host controller driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141513.i0HxcVmM-lkp@intel.com/

New smatch warnings:
drivers/pci/controller/pcie-rzg3s-host.c:1675 rzg3s_pcie_suspend_noirq() warn: 'port->refclk' from clk_prepare_enable() not released on lines: 1675.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

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
