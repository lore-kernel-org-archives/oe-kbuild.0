Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255F243956
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 01:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792026224; cv=none; b=UxQF4Kxj/6kCUHb0LB/8vhxEgj6ZlaVJg7ReEgCTzALfjJG5btt3Bg/ncTFEnKNg3VTp1iIvLKbKoERZjuATMrppuMRoSdOx3x5Z6Lq9HmfQfl0AnweMHTP2/rd5YtsSB0/T3RCyDCsMiG5zKRDyY9NRYWBpjtb2qDsB0YqFOOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792026224; c=relaxed/simple;
	bh=hdzoq2G49qw/SxxpAezlSH5a6Tmf0hsZFmHGDMgNtIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sUbPupS1uPGTZ4mhtfH9s3OWH3aBGvdWci7/VajDCdNSzSHaiUMfeOFkR3J7kURxRLu/+KJybU6WXCL2Oa2tBebcf1j6DvgC6d8WkFB3sQfHngpmw7A5FGvCbO4Jp3Yd7Wos8WJN30pRMzRJTfqD0n8LyPujLKGJLn0brznr7VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhW8ciN6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhW8ciN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792026222; x=1823562222;
  h=date:from:to:cc:subject:message-id;
  bh=hdzoq2G49qw/SxxpAezlSH5a6Tmf0hsZFmHGDMgNtIQ=;
  b=HhW8ciN6/3L57j/XSByZyPtbNN+KDDBoGabkCKENVWbm6XwI1+1RLK58
   /UVNG+O0j+tsdw7Gqgom8RKAtZNT+KTcYaG5dSlR5phX74viLaU8VdATa
   ZJilY3UjHn+4oDwNH9JyaFpEuUfgUuFr3OCzQCQIgvKOvGWiNqtoWdwh0
   c+D9eyOpn5wFFBEhUCIHuwjMXR/bEgJU6ohPBpyq0CTzQ69+I+djj2llb
   pL6LWwFZQ4I8zrkqLeZPoqf8hv7qtW8BdN1oAmfVRt7nO1WEJQqzwvA6R
   IOl3QZe/K1nPJk3jTKg3QjNDPBTPQrY5Kgfwz+Ojkga6esy+2GbybaeYC
   Q==;
X-CSE-ConnectionGUID: KN7eR4qgRzePG0ofgh+gIA==
X-CSE-MsgGUID: x2it5B1XTAivkRO2eTBxBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="815877"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="815877"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 18:03:42 -0700
X-CSE-ConnectionGUID: tEjoBagmSCeGQHnVush17A==
X-CSE-MsgGUID: j64uqfIbQL2FxkbyzuckMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1896167"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Oct 2026 18:03:40 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH9sg-00000000BTv-1ZKV;
	Thu, 15 Oct 2026 01:03:38 +0000
Date: Thu, 15 Oct 2026 03:02:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pinctrl/nuvoton/pinctrl-ma35.c:756
 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than
 shift
Message-ID: <202610150337.EgF3D8xd-lkp@intel.com>
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
head:   0fcb05b72344f40806cbe810de8872f1698bf053
commit: bb0e7fda87753a973cb4a86c22905b1177f00d4e pinctrl: ma35: Convert to common field_{get,prep}() helpers
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: m68k-randconfig-r2201-20261014 (https://download.01.org/0day-ci/archive/20261015/202610150337.EgF3D8xd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bb0e7fda8775 ("pinctrl: ma35: Convert to common field_{get,prep}() helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610150337.EgF3D8xd-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift
drivers/pinctrl/nuvoton/pinctrl-ma35.c:756 ma35_pinconf_get_drive_strength() warn: subtract is higher precedence than shift

Old smatch warnings:
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

vim +756 drivers/pinctrl/nuvoton/pinctrl-ma35.c

f805e356313bbc Jacky Huang 2024-05-21  744  
f805e356313bbc Jacky Huang 2024-05-21  745  static int ma35_pinconf_get_drive_strength(struct ma35_pinctrl *npctl, unsigned int pin,
f805e356313bbc Jacky Huang 2024-05-21  746  					   u32 *strength)
f805e356313bbc Jacky Huang 2024-05-21  747  {
f805e356313bbc Jacky Huang 2024-05-21  748  	unsigned int port, group_num;
f805e356313bbc Jacky Huang 2024-05-21  749  	void __iomem *base;
f805e356313bbc Jacky Huang 2024-05-21  750  	u32 regval, ds_val;
f805e356313bbc Jacky Huang 2024-05-21  751  
f805e356313bbc Jacky Huang 2024-05-21  752  	ma35_gpio_cla_port(pin, &group_num, &port);
f805e356313bbc Jacky Huang 2024-05-21  753  	base = npctl->ctrl->pin_banks[group_num].reg_base;
f805e356313bbc Jacky Huang 2024-05-21  754  
f805e356313bbc Jacky Huang 2024-05-21  755  	regval = readl(base + MA35_GP_DS_REG(port));
f805e356313bbc Jacky Huang 2024-05-21 @756  	ds_val = field_get(MA35_GP_DS_MASK(port), regval);
f805e356313bbc Jacky Huang 2024-05-21  757  
f805e356313bbc Jacky Huang 2024-05-21  758  	if (ma35_pinconf_get_power_source(npctl, pin) == MVOLT_1800)
f805e356313bbc Jacky Huang 2024-05-21  759  		*strength = ds_1800mv_tbl[ds_val];
f805e356313bbc Jacky Huang 2024-05-21  760  	else
f805e356313bbc Jacky Huang 2024-05-21  761  		*strength = ds_3300mv_tbl[ds_val];
f805e356313bbc Jacky Huang 2024-05-21  762  
f805e356313bbc Jacky Huang 2024-05-21  763  	return 0;
f805e356313bbc Jacky Huang 2024-05-21  764  }
f805e356313bbc Jacky Huang 2024-05-21  765  

:::::: The code at line 756 was first introduced by commit
:::::: f805e356313bbcafef48808c14eb9ce7f4ff2560 pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver

:::::: TO: Jacky Huang <ychuang3@nuvoton.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
