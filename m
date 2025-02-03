Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A220E021
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613660; cv=none; b=Y5BUFx21vVzqA6dgViWGRT/RTiU7b5nLFc9nr2FIy0InJ3ZyWkcwU+59MKeM77rUun8sA32H/qR9ySR/dikdAKEVgaw4g9jvHKzhy5qRwSrpzcAVeBJAiOy7P9NfOt3V0OMAr/eunY83QFp0Ebjidn7oVtbiuFWHE4fiJIRjCHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613660; c=relaxed/simple;
	bh=nnx0Ly2kw0BsohBkD92HXV7RO7tGQDgHRpwLbvm+1oI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqFzYnKSQ/kgnRhesCP2PtjXS1zaenpyWOlUZvOfZU0mNly0483RLcrdSARfY1c8UXOMaLq7sbEOl2ZY8B1QJziqPb2g79elT5uUsYc7uFTSAMlfpmcVd7XYLKF5Nec1r2DhS1qD1Ors+UxYrrFxxFVNHYm7rxKk4curmD5r3Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzFKwzhx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzFKwzhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738613659; x=1770149659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nnx0Ly2kw0BsohBkD92HXV7RO7tGQDgHRpwLbvm+1oI=;
  b=GzFKwzhx2xmqC/YlgU8EgxbBBJ8yOawhld/E8Oo3ww2hF/6DoyNA2Lc7
   8scEMIakYoo+6yK6yq5b5wzop787eoAQWwEVOAUhQDVhiCZxkf/qVDPvQ
   waKYQ0TpReawiG/ai9/QxBt9Y+mngHEGlVW71MtTjag7+hO4Yp/ouCgti
   /9NcPuc4nOQsyWAG4PiAV9W554cFfWHEqZ69qcm5Q1O+zRNU0mGxSAFZF
   7YOZQw76T15O3Ai3zYhzN9bIoks6frk9NZ+DboGIGRvkAZtBxOb8CpCYF
   LW6cUXUephgtAm+/ZKrIT8U9JpLqdMk4nvfF8jtCP+QgOhFKCpQC3IkvT
   Q==;
X-CSE-ConnectionGUID: /5KhEdOVTLCSuCAo1cygQQ==
X-CSE-MsgGUID: qKeFz1O0T4qnkpMY7HIVJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56658302"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="56658302"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 12:14:17 -0800
X-CSE-ConnectionGUID: /6FFmapPQsC7pitW5abQUg==
X-CSE-MsgGUID: EG8eRdCuRaG76EnisaT/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="115409790"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2025 12:14:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf2ph-000rRP-2o;
	Mon, 03 Feb 2025 20:14:13 +0000
Date: Tue, 4 Feb 2025 04:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:1575:1-23:
 WARNING: Function "for_each_child_of_node" should have of_node_put() before
 return around line 1588.
Message-ID: <202502040440.xCkSsAT4-lkp@intel.com>
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
TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>
CC: Gabriel Somlo <gsomlo@gmail.com>
CC: Mateusz Holenko <mholenko@antmicro.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   e6c6fef5f6b404cbbbabf0039fbb30acd3b49517
commit: b6d2dbb4bbd797c6254403bdf67b3b200d08bfa6 [14/15] LiteX: driver for MMCM
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: openrisc-randconfig-r053-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040440.xCkSsAT4-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502040440.xCkSsAT4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-litex.c:1575:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1588.
   drivers/clk/clk-litex.c:1575:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1607.
   drivers/clk/clk-litex.c:1575:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1617.
   drivers/clk/clk-litex.c:1575:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1623.

vim +/for_each_child_of_node +1575 drivers/clk/clk-litex.c

b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1560  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1561  static int litex_clk_init_clkouts(struct device *dev,
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1562  				  struct device_node *node,
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1563  				  struct litex_clk_device *l_dev)
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1564  {
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1565  	struct device_node *child_node;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1566  	struct clk_hw *hw;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1567  	struct clk_duty duty;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1568  	u32 dt_lock_timeout, dt_drdy_timeout;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1569  	int i = 0, ret;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1570  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1571  	ret = litex_clk_get_timeouts(node, &dt_lock_timeout, &dt_drdy_timeout);
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1572  	if (ret != 0)
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1573  		return ret;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1574  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22 @1575  	for_each_child_of_node(node, child_node) {
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1576  		struct litex_clk_clkout *clkout;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1577  		struct clk_init_data clkout_init;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1578  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1579  		clkout = &l_dev->clkouts[i];
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1580  		clkout->is_clkout = true;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1581  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1582  		clkout->lock_timeout = dt_lock_timeout;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1583  		clkout->drdy_timeout = dt_drdy_timeout;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1584  		clkout->sys_clk_freq = l_dev->sys_clk_freq;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1585  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1586  		ret = litex_clk_read_clkout_dts(child_node, clkout);
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1587  		if (ret != 0)
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22 @1588  			return ret;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1589  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1590  		clkout_init.name = child_node->name;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1591  		clkout_init.ops = &litex_clk_ops;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1592  		clkout_init.num_parents = 0;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1593  		clkout_init.flags = CLK_SET_RATE_UNGATE | CLK_GET_RATE_NOCACHE;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1594  		clkout->clk_hw.init = &clkout_init;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1595  		clkout->base = l_dev->base;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1596  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1597  		duty.num = clkout->default_duty_num;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1598  		duty.den = clkout->default_duty_den;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1599  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1600  		/* set global divider and multiplier once */
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1601  		if (i == 0) {
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1602  			hw = &l_dev->clkouts[i].clk_hw;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1603  			litex_clk_enable(hw);
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1604  			ret = litex_clk_set_dm(hw);
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1605  			litex_clk_disable(hw);
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1606  			if (ret != 0)
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1607  				return ret;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1608  		}
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1609  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1610  		ret = litex_clk_set_def_clkout(&clkout->clk_hw,
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1611  						clkout->default_freq,
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1612  						clkout->default_phase, &duty);
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1613  		ret = devm_clk_hw_register(dev, &clkout->clk_hw);
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1614  		if (ret != 0) {
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1615  			pr_err("devm_clk_hw_register failure, %s ret: %d\n",
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1616  						child_node->name, ret);
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1617  			return ret;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1618  		}
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1619  
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1620  		ret = of_clk_add_hw_provider(child_node, of_clk_hw_simple_get,
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1621  							     &clkout->clk_hw);
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1622  		if (ret != 0)
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1623  			return ret;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1624  		i++;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1625  	}
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1626  	return 0;
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1627  }
b6d2dbb4bbd797 Pawel Czarnecki 2020-12-22  1628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
