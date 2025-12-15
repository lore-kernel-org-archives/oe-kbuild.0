Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3BA31C58E
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 04:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765773854; cv=none; b=sc3CSBe6IiqrqU/jAyh3iCi6vMnJP7disrU4pu7b+HYeUlVwSVtO+FKAapJcgoIWJkZsTK+SoPS/GTNRF/JFaQ/SAb1biPZ4JUJ9TYDH3SoZpinsOFrLV7mi+Y02ZRJvcLa3wM6EzVQzBFL17UNq8UGYgKNnf1pFQ5nCgdno1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765773854; c=relaxed/simple;
	bh=37iavjH/N0Fy0Jl58tk3NV3TrpaZdWREr5bX+PgtppU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvJfnhb8GZuh5VI8gMINhqmBSMLaWGdKnklPTzCehuCZpk6V3vXed/WjJXpfIl3tKlFZLV10WE7JnVa4aQfXX8sbX5oVC2t45NnRnpE5n0G9zcFHwJz7Abx1lsWu2xwNvftsHlKlfnTu5bw+InFUqEzQTHoGw0H8Gi17Kw/TCpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBilVJBO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBilVJBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765773853; x=1797309853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37iavjH/N0Fy0Jl58tk3NV3TrpaZdWREr5bX+PgtppU=;
  b=nBilVJBOaWKqkaRfdoEiJD7PsYG3AhU3l72Pb0zFftGoxfGqaIZnCl5X
   NP8ojnEpsnytw4GMZImcBzvrKprWq9muvra1E7Tw6CGhz3LVxgmQqFyWj
   4h5dEGPXtylNU7X93W+xnxTlWiIbiDuPF3jXbCUPmmBTROpDf/NXPrH3E
   KJIzVp3WgyF/qMneKUXxjFMH/LphkoS+88hCaOW8pMOz8aN2Z7Lxy+gQ1
   /efUsQ050RGEqBZ0RWh4LsAwRq4IX84gmJ0sprPOoDs9lE1IZmDLWw3cf
   GXqzha9O1FwKoaZGzZI2W1U3tyxhCX7fHFlpZ5RP0iQWoTykktlEVVh8P
   g==;
X-CSE-ConnectionGUID: iCpjnJ4wSZq+qnFL17tUjA==
X-CSE-MsgGUID: o1boNOHeTfSVIjvgITWceA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66852247"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="66852247"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 20:44:12 -0800
X-CSE-ConnectionGUID: T1ThgNRGTtGc+7CaD1L6dw==
X-CSE-MsgGUID: V1h3fguMQvWIicL+KydF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228277787"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2025 20:44:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV0RM-000000009nV-2Vvv;
	Mon, 15 Dec 2025 04:44:08 +0000
Date: Mon, 15 Dec 2025 12:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:1575:1-23:
 WARNING: Function "for_each_child_of_node" should have of_node_put() before
 return around line 1588.
Message-ID: <202512151221.A0qRlCI2-lkp@intel.com>
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
head:   bf1103a7647b9e371007e1f7d02827190e619900
commit: 553f9a11b145aae5c68d5abf17e5fa38a3a93426 [14/15] LiteX: driver for MMCM
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-104-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151221.A0qRlCI2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512151221.A0qRlCI2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-litex.c:1575:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1588.
   drivers/clk/clk-litex.c:1575:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1607.
   drivers/clk/clk-litex.c:1575:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1617.
   drivers/clk/clk-litex.c:1575:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 1623.

vim +/for_each_child_of_node +1575 drivers/clk/clk-litex.c

553f9a11b145aa Pawel Czarnecki 2020-12-22  1560  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1561  static int litex_clk_init_clkouts(struct device *dev,
553f9a11b145aa Pawel Czarnecki 2020-12-22  1562  				  struct device_node *node,
553f9a11b145aa Pawel Czarnecki 2020-12-22  1563  				  struct litex_clk_device *l_dev)
553f9a11b145aa Pawel Czarnecki 2020-12-22  1564  {
553f9a11b145aa Pawel Czarnecki 2020-12-22  1565  	struct device_node *child_node;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1566  	struct clk_hw *hw;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1567  	struct clk_duty duty;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1568  	u32 dt_lock_timeout, dt_drdy_timeout;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1569  	int i = 0, ret;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1570  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1571  	ret = litex_clk_get_timeouts(node, &dt_lock_timeout, &dt_drdy_timeout);
553f9a11b145aa Pawel Czarnecki 2020-12-22  1572  	if (ret != 0)
553f9a11b145aa Pawel Czarnecki 2020-12-22  1573  		return ret;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1574  
553f9a11b145aa Pawel Czarnecki 2020-12-22 @1575  	for_each_child_of_node(node, child_node) {
553f9a11b145aa Pawel Czarnecki 2020-12-22  1576  		struct litex_clk_clkout *clkout;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1577  		struct clk_init_data clkout_init;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1578  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1579  		clkout = &l_dev->clkouts[i];
553f9a11b145aa Pawel Czarnecki 2020-12-22  1580  		clkout->is_clkout = true;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1581  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1582  		clkout->lock_timeout = dt_lock_timeout;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1583  		clkout->drdy_timeout = dt_drdy_timeout;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1584  		clkout->sys_clk_freq = l_dev->sys_clk_freq;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1585  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1586  		ret = litex_clk_read_clkout_dts(child_node, clkout);
553f9a11b145aa Pawel Czarnecki 2020-12-22  1587  		if (ret != 0)
553f9a11b145aa Pawel Czarnecki 2020-12-22 @1588  			return ret;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1589  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1590  		clkout_init.name = child_node->name;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1591  		clkout_init.ops = &litex_clk_ops;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1592  		clkout_init.num_parents = 0;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1593  		clkout_init.flags = CLK_SET_RATE_UNGATE | CLK_GET_RATE_NOCACHE;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1594  		clkout->clk_hw.init = &clkout_init;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1595  		clkout->base = l_dev->base;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1596  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1597  		duty.num = clkout->default_duty_num;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1598  		duty.den = clkout->default_duty_den;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1599  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1600  		/* set global divider and multiplier once */
553f9a11b145aa Pawel Czarnecki 2020-12-22  1601  		if (i == 0) {
553f9a11b145aa Pawel Czarnecki 2020-12-22  1602  			hw = &l_dev->clkouts[i].clk_hw;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1603  			litex_clk_enable(hw);
553f9a11b145aa Pawel Czarnecki 2020-12-22  1604  			ret = litex_clk_set_dm(hw);
553f9a11b145aa Pawel Czarnecki 2020-12-22  1605  			litex_clk_disable(hw);
553f9a11b145aa Pawel Czarnecki 2020-12-22  1606  			if (ret != 0)
553f9a11b145aa Pawel Czarnecki 2020-12-22  1607  				return ret;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1608  		}
553f9a11b145aa Pawel Czarnecki 2020-12-22  1609  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1610  		ret = litex_clk_set_def_clkout(&clkout->clk_hw,
553f9a11b145aa Pawel Czarnecki 2020-12-22  1611  						clkout->default_freq,
553f9a11b145aa Pawel Czarnecki 2020-12-22  1612  						clkout->default_phase, &duty);
553f9a11b145aa Pawel Czarnecki 2020-12-22  1613  		ret = devm_clk_hw_register(dev, &clkout->clk_hw);
553f9a11b145aa Pawel Czarnecki 2020-12-22  1614  		if (ret != 0) {
553f9a11b145aa Pawel Czarnecki 2020-12-22  1615  			pr_err("devm_clk_hw_register failure, %s ret: %d\n",
553f9a11b145aa Pawel Czarnecki 2020-12-22  1616  						child_node->name, ret);
553f9a11b145aa Pawel Czarnecki 2020-12-22  1617  			return ret;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1618  		}
553f9a11b145aa Pawel Czarnecki 2020-12-22  1619  
553f9a11b145aa Pawel Czarnecki 2020-12-22  1620  		ret = of_clk_add_hw_provider(child_node, of_clk_hw_simple_get,
553f9a11b145aa Pawel Czarnecki 2020-12-22  1621  							     &clkout->clk_hw);
553f9a11b145aa Pawel Czarnecki 2020-12-22  1622  		if (ret != 0)
553f9a11b145aa Pawel Czarnecki 2020-12-22  1623  			return ret;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1624  		i++;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1625  	}
553f9a11b145aa Pawel Czarnecki 2020-12-22  1626  	return 0;
553f9a11b145aa Pawel Czarnecki 2020-12-22  1627  }
553f9a11b145aa Pawel Czarnecki 2020-12-22  1628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
