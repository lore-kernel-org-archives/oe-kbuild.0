Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88B418BBAE
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764097347; cv=none; b=eN07Hfad+2E2pqJlHG2RmePHwmWTd2FkLbGou0jQM9gEZzZdJv07X922Hr2oajk4uCGMstRZyPt8/zIg7l0odhmSvDtYxzsW5q242s8gq8jrNTh1OejXxXsw176jx+vYiy0sMN9b9GrVc5NzoFmv7Q8JSwIQs+oc6GDOWZkWVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764097347; c=relaxed/simple;
	bh=SOwM7HfTqLsr4PqeF9oqJoGOOP75iw6ix9uO0IRWJmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9x/UEmwWd/qJqUm/bpn+dAo1sw4iHjV5CwF5xBWbVYimrVhY8gV0WngQ2+8wJKOtkHHqszQMsJEIfhAqCHL5yaLpWS30AXVF6onzUt4EZW8a7xFFDXwO42ZlEWNkgHMPpew6v7396KkUV66R8zk5ig4L7Ioi+xGTVtzNoo7Kiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PC7o0QuM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PC7o0QuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764097346; x=1795633346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOwM7HfTqLsr4PqeF9oqJoGOOP75iw6ix9uO0IRWJmA=;
  b=PC7o0QuM6VIjjs6OzFX+yKQXBRYCTy6xJI1knWp4hVJemIhujpL3HE9q
   iO7VGTnb9LW3ymulFk+uVocxGsVsQreHliTzeHTwV28bhTkfnwabqW87p
   SPDnF7lW8cQmryJf1/ph0Gq7dRin5+o7dV042mFkye9NrJVs3J/jbpcyd
   zvRZhqXSusw24nqOlKDXaDS/3N8SUoWQtLYk+wpp5cq2y0/oJTgKFUZ87
   8luDJnLFOvmjQ8kHgUSfeElFU8isxYw6BPDGcDzFtbK+nhuOfLSRe983g
   tAgetj5p8iGlfFvqIZ/dKL172nEK3NsXiidkk5+krGW+XLebG7BMqVqjS
   A==;
X-CSE-ConnectionGUID: V3Wi1fYaRMSwDQNTnyHPeA==
X-CSE-MsgGUID: H9mOxV2sRpyfhj9Z1UKg0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69988738"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="69988738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 11:02:11 -0800
X-CSE-ConnectionGUID: 8S13iSZ4Ty28Nria7ebEFw==
X-CSE-MsgGUID: 7eSVFLhVT6ibOnESNLq7pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="223691273"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2025 11:02:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNyIh-000000002BB-0895;
	Tue, 25 Nov 2025 19:02:07 +0000
Date: Wed, 26 Nov 2025 03:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11266/11746]
 drivers/pinctrl/nuvoton/pinctrl-ma35.c:316 ma35_gpio_get_mode() warn:
 subtract is higher precedence than shift
Message-ID: <202511260207.MAswlpNF-lkp@intel.com>
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
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   92fd6e84175befa1775e5c0ab682938eca27c0b2
commit: bb0e7fda87753a973cb4a86c22905b1177f00d4e [11266/11746] pinctrl: ma35: Convert to common field_{get,prep}() helpers
:::::: branch date: 10 hours ago
:::::: commit date: 24 hours ago
config: parisc-randconfig-r071-20251125 (https://download.01.org/0day-ci/archive/20251126/202511260207.MAswlpNF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511260207.MAswlpNF-lkp@intel.com/

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
