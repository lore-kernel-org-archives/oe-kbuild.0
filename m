Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5F330AD00
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 05:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773206080; cv=none; b=KZIFFutOADBA22qhc3XjM5lx6ggJRVjFBjwUy/FJdxZQ4oPgoHbKgF3vTDY57YI2w8YPBEe3PPcV2TN1W9iOvAz0axMe4bOZIu/Q3/804cAjII/MMshGlgwkBJslsPbvLq3AA30ayiNikxrLc6R0enTuJLcWxesh4niXqN/zWHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773206080; c=relaxed/simple;
	bh=0ru5fmoSqE4g+eDEMyMOptRL4ukV3jgx4FMEZlZWsTg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hfxUj7iZcIxudKhl7lGGZx7NcVOQQhQcLciXsJedILB31EbqS4IBA9hS6YpA1/sqI7tvi5eO58yx8yu6hhHyzVEA3eeWnkJmHQJX6NnADErk2Z37eCjXLqY3XZzWWKDy6VYZvf/K5PM3DRvSJSaJKhO2X9POm6hQCkpnplHvFE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUJJyGmv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUJJyGmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773206078; x=1804742078;
  h=date:from:to:cc:subject:message-id;
  bh=0ru5fmoSqE4g+eDEMyMOptRL4ukV3jgx4FMEZlZWsTg=;
  b=IUJJyGmvi8R4i1hCFn9NVx8nEu/cRtLDNJpmdMf62y8Bg6urafP70+OE
   OPZx+yqFyYc39rL5uzvNRpJhTPr76+Z2V5ld2+CDFYPMyZ2ioaeR0xpeE
   nneuSBx4eBCsjQcSXLNpmVbLJlWkM74DG+4+jJCPYUNjNyH6NahsZ0lgy
   VPLCDXTRmLUsqVa5jff2FQ/QVhd5RUQXhUe5F1nOAPY1SBeBITGxgNeeU
   QzK4kcDF2UiZlJUN36aLV/e031V9Fc1icc+p6K/4SsnatTfCFJg21EhOf
   Uw4eY0kVnvWrNTxqrfQDJutc52O3pIPCAUA8P9CfzPgGA1z8zfanGO0Io
   A==;
X-CSE-ConnectionGUID: zKl7pc0wQaySgg7i/DA8HQ==
X-CSE-MsgGUID: Kpd7WH9QRausJgchAFD1Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73288583"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="73288583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 22:14:38 -0700
X-CSE-ConnectionGUID: CDJq+84LTvSzzKCm8an0fQ==
X-CSE-MsgGUID: 9LrnVBlKSBSAB8VnU/9Kdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219592523"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Mar 2026 22:14:37 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Btx-000000000j7-3j2C;
	Wed, 11 Mar 2026 05:14:33 +0000
Date: Wed, 11 Mar 2026 13:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pinctrl/nuvoton/pinctrl-ma35.c:316
 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
Message-ID: <202603111303.ltrBMeFy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b29fb8829bff243512bb8c8908fd39406f9fd4c3
commit: bb0e7fda87753a973cb4a86c22905b1177f00d4e pinctrl: ma35: Convert to common field_{get,prep}() helpers
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-r073-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111303.ltrBMeFy-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603111303.ltrBMeFy-lkp@intel.com/

smatch warnings:
drivers/pinctrl/nuvoton/pinctrl-ma35.c:316 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:316 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:316 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:316 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:674 ma35_pinconf_get_pull() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:674 ma35_pinconf_get_pull() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:674 ma35_pinconf_get_pull() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:674 ma35_pinconf_get_pull() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:850 ma35_pinconf_get_slew_rate() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:850 ma35_pinconf_get_slew_rate() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:850 ma35_pinconf_get_slew_rate() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:850 ma35_pinconf_get_slew_rate() warn: subtract is higher precedence than shift

vim +316 drivers/pinctrl/nuvoton/pinctrl-ma35.c

f805e356313bbc Jacky Huang 2024-05-21  311  
f805e356313bbc Jacky Huang 2024-05-21  312  static u32 ma35_gpio_get_mode(void __iomem *reg_mode, unsigned int gpio)
f805e356313bbc Jacky Huang 2024-05-21  313  {
f805e356313bbc Jacky Huang 2024-05-21  314  	u32 regval = readl(reg_mode);
f805e356313bbc Jacky Huang 2024-05-21  315  
f805e356313bbc Jacky Huang 2024-05-21 @316  	return field_get(MA35_GP_MODE_MASK(gpio), regval);
f805e356313bbc Jacky Huang 2024-05-21  317  }
f805e356313bbc Jacky Huang 2024-05-21  318  

:::::: The code at line 316 was first introduced by commit
:::::: f805e356313bbcafef48808c14eb9ce7f4ff2560 pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver

:::::: TO: Jacky Huang <ychuang3@nuvoton.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
