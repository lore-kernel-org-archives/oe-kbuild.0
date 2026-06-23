Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832ABC8EB
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 21:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782250720; cv=none; b=AOBN1OXiW4mTWdgNNYihZAWqasih4B+d9XQV7nB7wEqSeEX/12PoYTM41mmaMxcSiVmUQPvwjS4BCWYddObxG4VHG54F8Ciy+OcnnCqi8mXkEkKa9kY162RWGIDPFgauOt8uJbp8dJbvzBzcNETLwgjnSLZaoXldhpuSBZ/w4bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782250720; c=relaxed/simple;
	bh=ne6hxRAuec7eT/GtxBtSC3IwkMXH5tGtBLMWKoiPz3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K3kpfhg53/UJNP61J0hmb3sbFChM0GyyoMBx9EiJXj2m2prTsmCyr+Tqn/sX2VzSXQuV42PfTAu7bciDWQusC9p2mLqlKuCZODnaVVOkND/j/OpLmS6Mmqd5BLBmUEfDckBk8RzCJ0a1ZykJCh4jltSqVAI9yyvqHLJ4A8Ginfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLFPf3Ks; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLFPf3Ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782250718; x=1813786718;
  h=date:from:to:cc:subject:message-id;
  bh=ne6hxRAuec7eT/GtxBtSC3IwkMXH5tGtBLMWKoiPz3s=;
  b=XLFPf3KskFxgnlAgjk83v/Ot73BiOJVzdOxPh8l0klpqOdHpkyVyV+x5
   cUEqJd9a/UPzDyjX1vP3w82oRJZQL0umWCA8IhLalJWIIxdxvELDcGI/m
   RoncwAR5/0k7cOBU7j9+xRSNX8YM0GR4VUcRafyH5JAFqARu1pV93UbUd
   PpnkUagIphpFBgIBxduZBjTlOaHZ2+JXjCEpYq47QaBWGWAJ69pVklN2L
   VjoPVjuuWZHOg8WQquREV7v+qRLGMv8/NP21TonMny9aQbUhBjwPsjs7K
   jGAygT5Nqh0xitpwQ7n6C7myOqynQMxkZSyjV89tR0w1Mjoa7DcURqXJo
   g==;
X-CSE-ConnectionGUID: lOO+loAUTOa3LzFhdRzXAw==
X-CSE-MsgGUID: wZBsMsAuSj+QEn6Gu5PGwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82874312"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82874312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:38:37 -0700
X-CSE-ConnectionGUID: Oxyg+sKyRGmyMZovMNly8w==
X-CSE-MsgGUID: D0cLCzHQRSCqt+Ef/xUq5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="243256753"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2026 14:38:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc8pG-000000002u5-1Tuw;
	Tue, 23 Jun 2026 21:38:34 +0000
Date: Wed, 24 Jun 2026 05:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pinctrl/nuvoton/pinctrl-ma35.c:316
 ma35_gpio_get_mode() warn: subtract is higher precedence than shift
Message-ID: <202606240514.41sx30Tz-lkp@intel.com>
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
head:   f31c00c377ccf07c85442712f7c940a855cb3371
commit: bb0e7fda87753a973cb4a86c22905b1177f00d4e pinctrl: ma35: Convert to common field_{get,prep}() helpers
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: xtensa-randconfig-r071-20260624 (https://download.01.org/0day-ci/archive/20260624/202606240514.41sx30Tz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bb0e7fda8775 ("pinctrl: ma35: Convert to common field_{get,prep}() helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606240514.41sx30Tz-lkp@intel.com/

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
