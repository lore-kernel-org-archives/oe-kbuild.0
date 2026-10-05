Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEADC3DB65A
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 13:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205665; cv=none; b=mQEY9MBfZeAsm3syGxeD+IUNsQqSqfQ01LOHoEJBQ4JsUMl/Bgyjilim7gv0msSBKz/Ucd/s7yCm7i14D3FVS2aFksCVwCT7bMGMqi6wuCuXwzraZjSmSBlUdlCyXe5jW/ujY7XK1a/JZfPVItCF+Ts7qLTj5EEVb4YWwQVaRZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205665; c=relaxed/simple;
	bh=bYd5xcWBCSkzerjDyULV/D1572BERrbZOvLpO9t1dn8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tnzTw9JGevgXp9Hasc8mjnmT/VSOflzhUMXjXeFajCEwvHhRSwKpOxWpTvveeIYdslJY0qepNMfBa5qvp0N7yOqGE8YM2H+u3JcxVvMBJmKkIZD0QH2M32c2+HLjksK4Sp0jN3XIYtXr3UNOluokfofVlPnQEexiHF6PnnD8A80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8vY2RyK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8vY2RyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791205664; x=1822741664;
  h=date:from:to:cc:subject:message-id;
  bh=bYd5xcWBCSkzerjDyULV/D1572BERrbZOvLpO9t1dn8=;
  b=O8vY2RyKWruOYSrvxx1R+oHqXmYsz1xi525VjVVaB3L9sRaWIDB1v8Gk
   URtrE2azQVCv4key8oxFEZq+bepYcJOTop7ijsSR1MQX0UeWRLeLnSah/
   x98eZwQC9usQE1yTBNO6nnZr9/ecngwGod/Nn5y9eAX+92ysmRzq1Ivxv
   CTbhjBmzhBxjWFK7tGeK+ch7Brfnd6o6mvW3nFPepDxJQJneZM3+IGUys
   odHmvc0pQ7Aa3H7aEaZI1xHx+hZkGkQJjOfEnA2FAfAKspTv4S7iCZFLT
   2DvOsk6xBrBBeJVMuR6e0Hf0Vxop/rUdU2hrdg5Jyh2VDeBYwIZ8DmWIX
   w==;
X-CSE-ConnectionGUID: gMvKtyh3QouKFeg9Sype/w==
X-CSE-MsgGUID: jpx9qQUdTgSU97Sc8/M0bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90909194"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="90909194"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 06:07:24 -0700
X-CSE-ConnectionGUID: qf3ExmliRhqO+qD0O1Hukg==
X-CSE-MsgGUID: yy4FIY1SSGaFPRkxDPZ+2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="304770114"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2026 06:07:20 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDiPW-00000000087-2GAb;
	Mon, 05 Oct 2026 13:07:18 +0000
Date: Mon, 05 Oct 2026 15:07:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pinctrl/nuvoton/pinctrl-ma35.c:316
 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
Message-ID: <202610051504.fdWUQuRM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
commit: bb0e7fda87753a973cb4a86c22905b1177f00d4e pinctrl: ma35: Convert to common field_{get,prep}() helpers
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-r2201-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051504.fdWUQuRM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bb0e7fda8775 ("pinctrl: ma35: Convert to common field_{get,prep}() helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610051504.fdWUQuRM-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/nuvoton/pinctrl-ma35.c:316 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:316 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:316 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:316 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:674 ma35_pinconf_get_pull() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:674 ma35_pinconf_get_pull() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:674 ma35_pinconf_get_pull() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:674 ma35_pinconf_get_pull() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:850 ma35_pinconf_get_slew_rate() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:850 ma35_pinconf_get_slew_rate() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:850 ma35_pinconf_get_slew_rate() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:850 ma35_pinconf_get_slew_rate() warn: subtract is higher precedence than shift

Old smatch warnings:
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift

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
