Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50B27AC4B
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755503965; cv=none; b=RtONdI2C5CgVijpcqLdSn/fn8TkumURB+or/GHMQkFYQIUyLh0nAEdkWKW2Lc6kvkOCBXILzthjvmNYUxanh/FaaNccIO3M2zSmrCbpjtQWzT5W3jjYjkgqHjWKWF9EvWFYDiSR9/b5YDoVI0pISKhfg+YQWja4T7EC2KygOnOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755503965; c=relaxed/simple;
	bh=MfSFRO4fwgI5JfPXoYeuRYin5NKHNdboepmuc08czUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2hNbW+QV6Msop6Q1XrGZiDe2E180c0dc7jHAsDR7e2QtEfsXSZ42M0pwHqPn4kYswpBPlup/fJOD9VUEQNRJn2ehM0KAUPh1i1LfVFqfoOfxCkMc4DD5SumvfZm7eG5j+SkFwuHJZq9nyo5F3qzco65uIzsfzp+5YXd2Kk/yy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvT1paLL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvT1paLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755503963; x=1787039963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MfSFRO4fwgI5JfPXoYeuRYin5NKHNdboepmuc08czUI=;
  b=hvT1paLLhJ5BBfXxw7Z7l2x+iKWdWkOEi9wg6gQO5leJKVJ+lgfGejsy
   +kdLdEM8VkYDZ8gh4k8qz2mk+khJOAJan0ONNxAgWysgFXtAx63kIk5O+
   0NGga9Uvix6mY4o/sJ+TtBlbF7RV6Z34EbcM8IazyQ7waT/xDjVZP//HJ
   9dVDK/2oyDQB+RMvR/nCXA6lJ5+fBOxnfkZpvvEpm9bWiAEXb2P1AWH8Z
   9VaFjWntLRxV9oekqYzJXgPCweVfxzVjz3czjmQYqoC9hdAMfUhZSEVyT
   gG2IyMawQqyfT3HiYGzkpDltZmBW1AvNJ8EX+Wna861+VIZmV1ILkradE
   Q==;
X-CSE-ConnectionGUID: E2tVmSA8TguyvoqUi11jeA==
X-CSE-MsgGUID: lVok18QzTnKkbqbjeypwLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57632470"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57632470"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 00:59:22 -0700
X-CSE-ConnectionGUID: P2fJM2DnS0Os3KYjVajFIQ==
X-CSE-MsgGUID: kJVyEI4sR8WFhfwIL7TimA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="198364755"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Aug 2025 00:59:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unuli-000E23-0B;
	Mon, 18 Aug 2025 07:59:02 +0000
Date: Mon, 18 Aug 2025 15:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V6 3/5] power: supply: bq257xx: Add support for BQ257XX
 charger
Message-ID: <202508181503.GrRD2T4C-lkp@intel.com>
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
In-Reply-To: <20250812214300.123129-4-macroalpha82@gmail.com>
References: <20250812214300.123129-4-macroalpha82@gmail.com>
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
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on sre-power-supply/for-next rockchip/for-next linus/master v6.17-rc2 next-20250818]
[cannot apply to lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-mfd-ti-bq25703a-Add-TI-BQ25703A-Charger/20250813-054704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250812214300.123129-4-macroalpha82%40gmail.com
patch subject: [PATCH V6 3/5] power: supply: bq257xx: Add support for BQ257XX charger
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: parisc-randconfig-r072-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181503.GrRD2T4C-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508181503.GrRD2T4C-lkp@intel.com/

smatch warnings:
drivers/power/supply/bq257xx_charger.c:392 bq25703_hw_init() warn: potential ! vs ~ typo

vim +392 drivers/power/supply/bq257xx_charger.c

7f3b6f1e51a925 Chris Morgan 2025-08-12  351  
7f3b6f1e51a925 Chris Morgan 2025-08-12  352  /**
7f3b6f1e51a925 Chris Morgan 2025-08-12  353   * bq25703_hw_init() - Set all the required registers to init the charger
7f3b6f1e51a925 Chris Morgan 2025-08-12  354   * @pdata: driver platform data
7f3b6f1e51a925 Chris Morgan 2025-08-12  355   *
7f3b6f1e51a925 Chris Morgan 2025-08-12  356   * Initialize the BQ25703 by first disabling the watchdog timer (which
7f3b6f1e51a925 Chris Morgan 2025-08-12  357   * shuts off the charger in the absence of periodic writes). Then, set
7f3b6f1e51a925 Chris Morgan 2025-08-12  358   * the charge current, charge voltage, minimum system voltage, and
7f3b6f1e51a925 Chris Morgan 2025-08-12  359   * input current limit. Disable low power mode to allow ADCs and
7f3b6f1e51a925 Chris Morgan 2025-08-12  360   * interrupts. Enable the ADC, start the ADC, set the ADC scale to
7f3b6f1e51a925 Chris Morgan 2025-08-12  361   * full, and enable each individual ADC channel.
7f3b6f1e51a925 Chris Morgan 2025-08-12  362   *
7f3b6f1e51a925 Chris Morgan 2025-08-12  363   * Return: Returns 0 on success or error code on error.
7f3b6f1e51a925 Chris Morgan 2025-08-12  364   */
7f3b6f1e51a925 Chris Morgan 2025-08-12  365  static int bq25703_hw_init(struct bq257xx_chg *pdata)
7f3b6f1e51a925 Chris Morgan 2025-08-12  366  {
7f3b6f1e51a925 Chris Morgan 2025-08-12  367  	struct regmap *regmap = pdata->bq->regmap;
7f3b6f1e51a925 Chris Morgan 2025-08-12  368  	int ret = 0;
7f3b6f1e51a925 Chris Morgan 2025-08-12  369  
7f3b6f1e51a925 Chris Morgan 2025-08-12  370  	regmap_update_bits(regmap, BQ25703_CHARGE_OPTION_0,
7f3b6f1e51a925 Chris Morgan 2025-08-12  371  			   BQ25703_WDTMR_ADJ_MASK,
7f3b6f1e51a925 Chris Morgan 2025-08-12  372  			   FIELD_PREP(BQ25703_WDTMR_ADJ_MASK,
7f3b6f1e51a925 Chris Morgan 2025-08-12  373  			   BQ25703_WDTMR_DISABLE));
7f3b6f1e51a925 Chris Morgan 2025-08-12  374  
7f3b6f1e51a925 Chris Morgan 2025-08-12  375  	ret = pdata->chip->bq257xx_set_ichg(pdata, pdata->ichg_max);
7f3b6f1e51a925 Chris Morgan 2025-08-12  376  	if (ret)
7f3b6f1e51a925 Chris Morgan 2025-08-12  377  		return ret;
7f3b6f1e51a925 Chris Morgan 2025-08-12  378  
7f3b6f1e51a925 Chris Morgan 2025-08-12  379  	ret = pdata->chip->bq257xx_set_vbatreg(pdata, pdata->vbat_max);
7f3b6f1e51a925 Chris Morgan 2025-08-12  380  	if (ret)
7f3b6f1e51a925 Chris Morgan 2025-08-12  381  		return ret;
7f3b6f1e51a925 Chris Morgan 2025-08-12  382  
7f3b6f1e51a925 Chris Morgan 2025-08-12  383  	ret = bq25703_set_min_vsys(pdata, pdata->vsys_min);
7f3b6f1e51a925 Chris Morgan 2025-08-12  384  	if (ret)
7f3b6f1e51a925 Chris Morgan 2025-08-12  385  		return ret;
7f3b6f1e51a925 Chris Morgan 2025-08-12  386  
7f3b6f1e51a925 Chris Morgan 2025-08-12  387  	ret = pdata->chip->bq257xx_set_iindpm(pdata, pdata->iindpm_max);
7f3b6f1e51a925 Chris Morgan 2025-08-12  388  	if (ret)
7f3b6f1e51a925 Chris Morgan 2025-08-12  389  		return ret;
7f3b6f1e51a925 Chris Morgan 2025-08-12  390  
7f3b6f1e51a925 Chris Morgan 2025-08-12  391  	regmap_update_bits(regmap, BQ25703_CHARGE_OPTION_0,
7f3b6f1e51a925 Chris Morgan 2025-08-12 @392  			   BQ25703_EN_LWPWR, !BQ25703_EN_LWPWR);
7f3b6f1e51a925 Chris Morgan 2025-08-12  393  
7f3b6f1e51a925 Chris Morgan 2025-08-12  394  	regmap_update_bits(regmap, BQ25703_ADC_OPTION,
7f3b6f1e51a925 Chris Morgan 2025-08-12  395  			   BQ25703_ADC_CONV_EN, BQ25703_ADC_CONV_EN);
7f3b6f1e51a925 Chris Morgan 2025-08-12  396  
7f3b6f1e51a925 Chris Morgan 2025-08-12  397  	regmap_update_bits(regmap, BQ25703_ADC_OPTION,
7f3b6f1e51a925 Chris Morgan 2025-08-12  398  			   BQ25703_ADC_START, BQ25703_ADC_START);
7f3b6f1e51a925 Chris Morgan 2025-08-12  399  
7f3b6f1e51a925 Chris Morgan 2025-08-12  400  	regmap_update_bits(regmap, BQ25703_ADC_OPTION,
7f3b6f1e51a925 Chris Morgan 2025-08-12  401  			   BQ25703_ADC_FULL_SCALE, BQ25703_ADC_FULL_SCALE);
7f3b6f1e51a925 Chris Morgan 2025-08-12  402  
7f3b6f1e51a925 Chris Morgan 2025-08-12  403  	regmap_update_bits(regmap, BQ25703_ADC_OPTION,
7f3b6f1e51a925 Chris Morgan 2025-08-12  404  			   BQ25703_ADC_CH_MASK,
7f3b6f1e51a925 Chris Morgan 2025-08-12  405  			   (BQ25703_ADC_CMPIN_EN | BQ25703_ADC_VBUS_EN |
7f3b6f1e51a925 Chris Morgan 2025-08-12  406  			   BQ25703_ADC_PSYS_EN | BQ25703_ADC_IIN_EN |
7f3b6f1e51a925 Chris Morgan 2025-08-12  407  			   BQ25703_ADC_IDCHG_EN | BQ25703_ADC_ICHG_EN |
7f3b6f1e51a925 Chris Morgan 2025-08-12  408  			   BQ25703_ADC_VSYS_EN | BQ25703_ADC_VBAT_EN));
7f3b6f1e51a925 Chris Morgan 2025-08-12  409  
7f3b6f1e51a925 Chris Morgan 2025-08-12  410  	return ret;
7f3b6f1e51a925 Chris Morgan 2025-08-12  411  }
7f3b6f1e51a925 Chris Morgan 2025-08-12  412  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
