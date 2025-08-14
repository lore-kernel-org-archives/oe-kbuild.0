Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1710B1EB195
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 02:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755138522; cv=none; b=BCAbJtIQDa7TAAaCb+6440aSG0tb3EisEr9hFet1pHVKRFOE2JiV2evQVj7nVehiV4knhnQKIPo7SlVLghibhGqRxinezob4tUVFrOOfXQ3Gqt23FcRXEzNjUaoDB9s0qOqr5V0zshD6FgYn4oVTfuSKKi08sdkwSjva/P3MplQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755138522; c=relaxed/simple;
	bh=TfZhcx48A8k5JaW4mAmeW5CPWTPTuZS3YflVt68BSyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SQgeKE3KWb1DL6wkCQ1+zWhv/Kio/Wumi/sYoIEdDWEMttx3ZheIy3VrVnAUM1XQ6UGb1u+/lyagQrn66LCcO26vStzc829AAJsyyQpHWksYDXmjxs5avtrOLD83wEczos3JXywl+XhIHtIeUs6D4dSELTCHs8j/Da5R+2Kk4I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqW4XE0m; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqW4XE0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755138520; x=1786674520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TfZhcx48A8k5JaW4mAmeW5CPWTPTuZS3YflVt68BSyI=;
  b=iqW4XE0mkFYMY91G+bV4LYOuo59YL3S4LaQfMKsfAcqIBonlpcYB85Ke
   4J8oTdxSwgYZo9IOTprcGGCk3CzNuiUPWBycha4DFihmw/b5SM0z4AqUM
   l68nxdpx6BCi4fHXALgEGjJW5s5NhrRXYo+GHTNtu5acK9NquBO98WcJg
   hMUMr4FEpgfJIasJeCwn0yyuW5XSNcwNz8R6hx2OMwkfAG/Hi30FnAomZ
   LsR5KOIoImaDwASv6ZqtTPXOuthiK70MjxcfDjPzX8BpcWIX+JnLNiLvC
   FLH7YgPmCizpq97q5CL47aQSMrwI4P92ryCD8FLoR4hTBHRiOC3qNIcQv
   Q==;
X-CSE-ConnectionGUID: PGyp7nPvQz+KFEzJCLivmA==
X-CSE-MsgGUID: Gcx3mcUdRMSueIeT6uJQig==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="80024532"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="80024532"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 19:28:39 -0700
X-CSE-ConnectionGUID: 3zcPDta3Q86BIZXvFx7v6Q==
X-CSE-MsgGUID: O8hA2pZKQruoxDxK4+rfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170773777"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2025 19:28:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umNhh-000AWS-2c;
	Thu, 14 Aug 2025 02:28:33 +0000
Date: Thu, 14 Aug 2025 10:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V6 4/5] regulator: bq257xx: Add bq257xx boost regulator
 driver
Message-ID: <202508141051.hwl2Erq6-lkp@intel.com>
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
In-Reply-To: <20250812214300.123129-5-macroalpha82@gmail.com>
References: <20250812214300.123129-5-macroalpha82@gmail.com>
TO: Chris Morgan <macroalpha82@gmail.com>
TO: linux-rockchip@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: broonie@kernel.org
CC: lee@kernel.org
CC: lgirdwood@gmail.com
CC: sre@kernel.org
CC: heiko@sntech.de
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: Chris Morgan <macromorgan@hotmail.com>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on sre-power-supply/for-next rockchip/for-next linus/master v6.17-rc1 next-20250813]
[cannot apply to lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-mfd-ti-bq25703a-Add-TI-BQ25703A-Charger/20250813-054704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250812214300.123129-5-macroalpha82%40gmail.com
patch subject: [PATCH V6 4/5] regulator: bq257xx: Add bq257xx boost regulator driver
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: m68k-randconfig-r073-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141051.hwl2Erq6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508141051.hwl2Erq6-lkp@intel.com/

smatch warnings:
drivers/regulator/bq257xx-regulator.c:161 bq257xx_regulator_probe() error: uninitialized symbol 'init_data'.

vim +/init_data +161 drivers/regulator/bq257xx-regulator.c

d6db7dce7cd965 Chris Morgan 2025-08-12  137  
d6db7dce7cd965 Chris Morgan 2025-08-12  138  static int bq257xx_regulator_probe(struct platform_device *pdev)
d6db7dce7cd965 Chris Morgan 2025-08-12  139  {
d6db7dce7cd965 Chris Morgan 2025-08-12  140  	struct device *dev = &pdev->dev;
d6db7dce7cd965 Chris Morgan 2025-08-12  141  	struct bq257xx_device *bq = dev_get_drvdata(pdev->dev.parent);
d6db7dce7cd965 Chris Morgan 2025-08-12  142  	struct bq257xx_reg_data *pdata;
d6db7dce7cd965 Chris Morgan 2025-08-12  143  	struct device_node *np = dev->of_node;
d6db7dce7cd965 Chris Morgan 2025-08-12  144  	struct regulator_init_data *init_data;
d6db7dce7cd965 Chris Morgan 2025-08-12  145  	struct regulator_config cfg = {};
d6db7dce7cd965 Chris Morgan 2025-08-12  146  
d6db7dce7cd965 Chris Morgan 2025-08-12  147  	pdev->dev.of_node = pdev->dev.parent->of_node;
d6db7dce7cd965 Chris Morgan 2025-08-12  148  	pdev->dev.of_node_reused = true;
d6db7dce7cd965 Chris Morgan 2025-08-12  149  
d6db7dce7cd965 Chris Morgan 2025-08-12  150  	pdata = devm_kzalloc(&pdev->dev, sizeof(struct bq257xx_reg_data), GFP_KERNEL);
d6db7dce7cd965 Chris Morgan 2025-08-12  151  	if (!pdata)
d6db7dce7cd965 Chris Morgan 2025-08-12  152  		return -ENOMEM;
d6db7dce7cd965 Chris Morgan 2025-08-12  153  
d6db7dce7cd965 Chris Morgan 2025-08-12  154  	pdata->bq = bq;
d6db7dce7cd965 Chris Morgan 2025-08-12  155  	pdata->desc = bq25703_vbus_desc;
d6db7dce7cd965 Chris Morgan 2025-08-12  156  
d6db7dce7cd965 Chris Morgan 2025-08-12  157  	platform_set_drvdata(pdev, pdata);
d6db7dce7cd965 Chris Morgan 2025-08-12  158  	bq257xx_reg_dt_parse_gpio(pdev);
d6db7dce7cd965 Chris Morgan 2025-08-12  159  
d6db7dce7cd965 Chris Morgan 2025-08-12  160  	cfg.dev = &pdev->dev;
d6db7dce7cd965 Chris Morgan 2025-08-12 @161  	cfg.init_data = init_data;
d6db7dce7cd965 Chris Morgan 2025-08-12  162  	cfg.driver_data = pdata;
d6db7dce7cd965 Chris Morgan 2025-08-12  163  	cfg.of_node = np;
d6db7dce7cd965 Chris Morgan 2025-08-12  164  	cfg.regmap = dev_get_regmap(pdev->dev.parent, NULL);
d6db7dce7cd965 Chris Morgan 2025-08-12  165  	if (!cfg.regmap)
d6db7dce7cd965 Chris Morgan 2025-08-12  166  		return -ENODEV;
d6db7dce7cd965 Chris Morgan 2025-08-12  167  
d6db7dce7cd965 Chris Morgan 2025-08-12  168  	pdata->bq257xx_reg = devm_regulator_register(dev, &pdata->desc, &cfg);
d6db7dce7cd965 Chris Morgan 2025-08-12  169  	if (IS_ERR(pdata->bq257xx_reg)) {
d6db7dce7cd965 Chris Morgan 2025-08-12  170  		return dev_err_probe(&pdev->dev, PTR_ERR(pdata->bq257xx_reg),
d6db7dce7cd965 Chris Morgan 2025-08-12  171  				     "error registering bq257xx regulator");
d6db7dce7cd965 Chris Morgan 2025-08-12  172  	}
d6db7dce7cd965 Chris Morgan 2025-08-12  173  
d6db7dce7cd965 Chris Morgan 2025-08-12  174  	return 0;
d6db7dce7cd965 Chris Morgan 2025-08-12  175  }
d6db7dce7cd965 Chris Morgan 2025-08-12  176  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
