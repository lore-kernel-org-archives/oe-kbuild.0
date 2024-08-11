Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908133C9
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 01:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723340215; cv=none; b=C7pYK6a654JAwzhfym4UygRK4vcbJXqG6ccnnFL7PWbrFc2i7u++HOXVWKGgXywAC8OTWCONOPnI8ZIpGIsGmss2KTYu8Q8hUVdA1wc71oBUb8im5kp+lT19VvkaJT98GcnjPQMLc5MtJH1iySoQKcl9lb4LYJ/ia8s5i0F8Z28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723340215; c=relaxed/simple;
	bh=pQx0gpVlKJ99fO7sAoH2Ze65grKR43rxX0x/1kjlDbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=becs2UBYHlbN5LFKUD359vKw/M1lFVUmD3VaPpb5KcTjb92J9Q/cE+PS5bFv3Crt7YXpzaDORydwWg7aOVFWbj1SnVuoKGxs+L979FEFo2scWsM1kkmyug0ONrW8jpJ9NAU3+j5YhYr34/8s0zqWDmRi7rgogDPSEN8NZvVVNnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myGE84/e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myGE84/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723340213; x=1754876213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQx0gpVlKJ99fO7sAoH2Ze65grKR43rxX0x/1kjlDbc=;
  b=myGE84/eE7vAV/aFZcfiYjWR5iffkcx7NKru9CQAfhkCUxvQEbLLg4na
   WSlbYSWGW/xYD1JeOnvV9DgAiZc0T4g8gy4rfL1bR6SAzkK1/yqD9RsNO
   alP6jn/rp5PonX756os7b1mLeYCHw5ZdJppfvRWBg3xTFlvrQNOhadiAk
   6GDq1REjfielyDDyGP7oUe6JZvrve9B5h4LbzV65jD6mcj1eqExq3OUnm
   BgjOAHGs71EHLyLTBHwtfcsAxs8QmRKB41tFyrsme4NSHI7CymgnsgRja
   4hF5M2Zpyp4V9VzOmaownQ7kk8AFCLj5ULVpDJA4tDsX5NqaV0x5u+0gN
   g==;
X-CSE-ConnectionGUID: 7zS3WT+TTGCI9v9Zgr8wmQ==
X-CSE-MsgGUID: JA0FzpRFRYOgew8cuMx4aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32627631"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="32627631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 18:36:52 -0700
X-CSE-ConnectionGUID: BnURfP9TRM2Rrmrj1NgfBQ==
X-CSE-MsgGUID: iQNRFhBnTCmCkBF93ZfDKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="57883485"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 10 Aug 2024 18:36:50 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scxVo-000ATF-0T;
	Sun, 11 Aug 2024 01:36:48 +0000
Date: Sun, 11 Aug 2024 09:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] phy: starfive: jh7110-usb: Fix link configuration to
 controller
Message-ID: <202408110917.hE9xidPH-lkp@intel.com>
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
In-Reply-To: <cd7b125c8c797f9d63440944df7121f9db0a49ad.1722457123.git.jan.kiszka@siemens.com>
References: <cd7b125c8c797f9d63440944df7121f9db0a49ad.1722457123.git.jan.kiszka@siemens.com>
TO: Jan Kiszka <jan.kiszka@siemens.com>
TO: Minda Chen <minda.chen@starfivetech.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Jan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Kiszka/dt-bindings-phy-jh7110-usb-phy-Add-sys-syscon-property/20240802-101748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/cd7b125c8c797f9d63440944df7121f9db0a49ad.1722457123.git.jan.kiszka%40siemens.com
patch subject: [PATCH 3/3] phy: starfive: jh7110-usb: Fix link configuration to controller
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: microblaze-randconfig-r072-20240810 (https://download.01.org/0day-ci/archive/20240811/202408110917.hE9xidPH-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408110917.hE9xidPH-lkp@intel.com/

smatch warnings:
drivers/phy/starfive/phy-jh7110-usb.c:148 jh7110_usb_phy_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +148 drivers/phy/starfive/phy-jh7110-usb.c

16d3a71c20cf2e Minda Chen 2023-06-29  108  
16d3a71c20cf2e Minda Chen 2023-06-29  109  static int jh7110_usb_phy_probe(struct platform_device *pdev)
16d3a71c20cf2e Minda Chen 2023-06-29  110  {
16d3a71c20cf2e Minda Chen 2023-06-29  111  	struct jh7110_usb2_phy *phy;
16d3a71c20cf2e Minda Chen 2023-06-29  112  	struct device *dev = &pdev->dev;
16d3a71c20cf2e Minda Chen 2023-06-29  113  	struct phy_provider *phy_provider;
0ed73d833230fd Jan Kiszka 2024-07-31  114  	u32 args[1];
16d3a71c20cf2e Minda Chen 2023-06-29  115  
16d3a71c20cf2e Minda Chen 2023-06-29  116  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
16d3a71c20cf2e Minda Chen 2023-06-29  117  	if (!phy)
16d3a71c20cf2e Minda Chen 2023-06-29  118  		return -ENOMEM;
16d3a71c20cf2e Minda Chen 2023-06-29  119  
16d3a71c20cf2e Minda Chen 2023-06-29  120  	phy->usb_125m_clk = devm_clk_get(dev, "125m");
16d3a71c20cf2e Minda Chen 2023-06-29  121  	if (IS_ERR(phy->usb_125m_clk))
16d3a71c20cf2e Minda Chen 2023-06-29  122  		return dev_err_probe(dev, PTR_ERR(phy->usb_125m_clk),
16d3a71c20cf2e Minda Chen 2023-06-29  123  			"Failed to get 125m clock\n");
16d3a71c20cf2e Minda Chen 2023-06-29  124  
16d3a71c20cf2e Minda Chen 2023-06-29  125  	phy->app_125m = devm_clk_get(dev, "app_125m");
16d3a71c20cf2e Minda Chen 2023-06-29  126  	if (IS_ERR(phy->app_125m))
16d3a71c20cf2e Minda Chen 2023-06-29  127  		return dev_err_probe(dev, PTR_ERR(phy->app_125m),
16d3a71c20cf2e Minda Chen 2023-06-29  128  			"Failed to get app 125m clock\n");
16d3a71c20cf2e Minda Chen 2023-06-29  129  
16d3a71c20cf2e Minda Chen 2023-06-29  130  	phy->regs = devm_platform_ioremap_resource(pdev, 0);
16d3a71c20cf2e Minda Chen 2023-06-29  131  	if (IS_ERR(phy->regs))
16d3a71c20cf2e Minda Chen 2023-06-29  132  		return dev_err_probe(dev, PTR_ERR(phy->regs),
16d3a71c20cf2e Minda Chen 2023-06-29  133  			"Failed to map phy base\n");
16d3a71c20cf2e Minda Chen 2023-06-29  134  
16d3a71c20cf2e Minda Chen 2023-06-29  135  	phy->phy = devm_phy_create(dev, NULL, &jh7110_usb2_phy_ops);
16d3a71c20cf2e Minda Chen 2023-06-29  136  	if (IS_ERR(phy->phy))
16d3a71c20cf2e Minda Chen 2023-06-29  137  		return dev_err_probe(dev, PTR_ERR(phy->phy),
16d3a71c20cf2e Minda Chen 2023-06-29  138  			"Failed to create phy\n");
16d3a71c20cf2e Minda Chen 2023-06-29  139  
16d3a71c20cf2e Minda Chen 2023-06-29  140  	phy_set_drvdata(phy->phy, phy);
16d3a71c20cf2e Minda Chen 2023-06-29  141  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
16d3a71c20cf2e Minda Chen 2023-06-29  142  
0ed73d833230fd Jan Kiszka 2024-07-31  143  	phy->sys_syscon =
0ed73d833230fd Jan Kiszka 2024-07-31  144  		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
0ed73d833230fd Jan Kiszka 2024-07-31  145  						     "starfive,sys-syscon",
0ed73d833230fd Jan Kiszka 2024-07-31  146  						     1, args);
0ed73d833230fd Jan Kiszka 2024-07-31  147  	if (IS_ERR(phy->sys_syscon))
0ed73d833230fd Jan Kiszka 2024-07-31 @148  		return dev_err_probe(dev, PTR_ERR(phy->phy),
0ed73d833230fd Jan Kiszka 2024-07-31  149  			"Failed to get sys-syscon\n");
0ed73d833230fd Jan Kiszka 2024-07-31  150  	phy->sys_phy_connect = args[0];
0ed73d833230fd Jan Kiszka 2024-07-31  151  
16d3a71c20cf2e Minda Chen 2023-06-29  152  	return PTR_ERR_OR_ZERO(phy_provider);
16d3a71c20cf2e Minda Chen 2023-06-29  153  }
16d3a71c20cf2e Minda Chen 2023-06-29  154  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
