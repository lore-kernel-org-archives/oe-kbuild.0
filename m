Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370B346A604
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Sep 2026 21:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471496; cv=none; b=MhLZDfT4GgpAB0rvxakdRNbBolSZVG0eaL6+682nXRYsxFFgRDo48FdUTBc/BpNQLJCp2dl/UMI3z8ZCm/Juq2FZHUo4aQWPxXJ8qa0RWnbaJMzhh/hlGiJwHPO+ISr71AeOZQbM9nE4w2uyVthUpGYeI/2id3WmMeB4PwwZmS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471496; c=relaxed/simple;
	bh=VAAXm2y62wJWoEUg9nZY27aSOTvhgqFdbmdVHL4kRJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A0UavgTRDXj3GDMRVVUH0ZULFS2+uPYBVFh1CqMT3ekH/ia7UVW5eFZj0qlgVb2Yhd7lWhgwAMcYpVjSG5OUJTXfWhZX9gN6fODPfjzqgA8mE6TDjilsoU9hoIZyXPqSkUEqrt+4uo+ucIGPJBej6ezUMIKn4YHhaGfd6BEbAaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjdT85fF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjdT85fF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788471493; x=1820007493;
  h=date:from:to:cc:subject:message-id;
  bh=VAAXm2y62wJWoEUg9nZY27aSOTvhgqFdbmdVHL4kRJE=;
  b=OjdT85fFy1eLKYivlPlrmM0iSpED1maKRpGtEzyFNiMGp/6R5wQcjhjF
   yjQXbYKDdosztZ/dWS+iIjUWbFTY5Id1V5o2FyjDDmWUp3HOZpK+NDF88
   BGVtQfvqzJCF0GHaMZMEhICJDFJbjMU8xDH8q4XLIRH+nVaAl6jtIeVpk
   UYgrAQ9awgmUAjjFpMoGc/HS+C56EQbTYdSrsSeb3nPSXN/+aY0kirH7I
   pqv4I4Fhe+8RxNDD5qxY+pKWO8TWEOmBCACEoHulcoQGIhPUqCta0kBVo
   sV/s/AdIEEktKPO56GymA1/rHQ1HEgon/cnmIqiSddjyFVeQqZSxPTi/L
   w==;
X-CSE-ConnectionGUID: BWG9qxhVRmKGV6pT+0uDyw==
X-CSE-MsgGUID: oQqr9gLDQUOQ1n07srFnWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89002114"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="89002114"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 14:38:12 -0700
X-CSE-ConnectionGUID: IKKsS0ScRAi3xoZjd+KfqQ==
X-CSE-MsgGUID: evmVqgOPQW6v7yci8TgPyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="294715579"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Sep 2026 14:38:12 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2F8L-000000005OM-1qpt;
	Thu, 03 Sep 2026 21:38:09 +0000
Date: Fri, 04 Sep 2026 05:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [clk:clk-pile 49/57]
 drivers/clk/davinci/da8xx-cfgchip.c:766:18-25: ERROR: PTR_ERR applied after
 initialization to constant on line 747
Message-ID: <202609040506.Zt9NVe7R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-clk@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
TO: Rosen Penev <rosenp@gmail.com>
CC: Brian Masney <bmasney@redhat.com>

Hi Rosen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-pile
head:   91b1b8d437abe0cd83210d8f257b785a63047aa9
commit: 551ba775497e93d93bb849f6ee572ca768cbaa3e [49/57] clk: davinci: add COMPILE_TEST support
:::::: branch date: 3 hours ago
:::::: commit date: 22 hours ago
config: sparc64-randconfig-r054-20260904 (https://download.01.org/0day-ci/archive/20260904/202609040506.Zt9NVe7R-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7a5f8a04e602ea1d74f4a9f28fdd4d5592611e68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609040506.Zt9NVe7R-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/davinci/da8xx-cfgchip.c:766:18-25: ERROR: PTR_ERR applied after initialization to constant on line 747

vim +766 drivers/clk/davinci/da8xx-cfgchip.c

1e88a8d64f2212 David Lechner 2018-03-15  741  
1e88a8d64f2212 David Lechner 2018-03-15  742  static int da8xx_cfgchip_probe(struct platform_device *pdev)
1e88a8d64f2212 David Lechner 2018-03-15  743  {
1e88a8d64f2212 David Lechner 2018-03-15  744  	struct device *dev = &pdev->dev;
1e88a8d64f2212 David Lechner 2018-03-15  745  	struct da8xx_cfgchip_clk_platform_data *pdata = dev->platform_data;
1e88a8d64f2212 David Lechner 2018-03-15  746  	da8xx_cfgchip_init clk_init = NULL;
1e88a8d64f2212 David Lechner 2018-03-15 @747  	struct regmap *regmap = NULL;
1e88a8d64f2212 David Lechner 2018-03-15  748  
409c39ec92a35e Rob Herring   2023-10-06  749  	clk_init = device_get_match_data(dev);
409c39ec92a35e Rob Herring   2023-10-06  750  	if (clk_init) {
f9848cfa4bec95 David Hunter  2024-07-20  751  		struct device_node *parent __free(device_node) = of_get_parent(dev->of_node);
1e88a8d64f2212 David Lechner 2018-03-15  752  
1e88a8d64f2212 David Lechner 2018-03-15  753  		regmap = syscon_node_to_regmap(parent);
1e88a8d64f2212 David Lechner 2018-03-15  754  	} else if (pdev->id_entry && pdata) {
1e88a8d64f2212 David Lechner 2018-03-15  755  		clk_init = (void *)pdev->id_entry->driver_data;
1e88a8d64f2212 David Lechner 2018-03-15  756  		regmap = pdata->cfgchip;
1e88a8d64f2212 David Lechner 2018-03-15  757  	}
1e88a8d64f2212 David Lechner 2018-03-15  758  
1e88a8d64f2212 David Lechner 2018-03-15  759  	if (!clk_init) {
1e88a8d64f2212 David Lechner 2018-03-15  760  		dev_err(dev, "unable to find driver data\n");
1e88a8d64f2212 David Lechner 2018-03-15  761  		return -EINVAL;
1e88a8d64f2212 David Lechner 2018-03-15  762  	}
1e88a8d64f2212 David Lechner 2018-03-15  763  
1e88a8d64f2212 David Lechner 2018-03-15  764  	if (IS_ERR_OR_NULL(regmap)) {
1e88a8d64f2212 David Lechner 2018-03-15  765  		dev_err(dev, "no regmap for CFGCHIP syscon\n");
1e88a8d64f2212 David Lechner 2018-03-15 @766  		return regmap ? PTR_ERR(regmap) : -ENOENT;
1e88a8d64f2212 David Lechner 2018-03-15  767  	}
1e88a8d64f2212 David Lechner 2018-03-15  768  
1e88a8d64f2212 David Lechner 2018-03-15  769  	return clk_init(dev, regmap);
1e88a8d64f2212 David Lechner 2018-03-15  770  }
1e88a8d64f2212 David Lechner 2018-03-15  771  

:::::: The code at line 766 was first introduced by commit
:::::: 1e88a8d64f221208801bb279ee7452df0b6d609f clk: davinci: New driver for TI DA8XX CFGCHIP clocks

:::::: TO: David Lechner <david@lechnology.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
