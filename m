Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2640EBC
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Apr 2023 03:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680839864; x=1712375864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hIYP5T/H0rEW27xnutrI7UOGEzslvasyRG8Jzun3d5w=;
  b=cfg982StIDenRGmQ3Q0bDQ/gD43ah7LT+4P3ZCXNwb8SSIKbGbSMYO8c
   U5GRkIMJSkfj82i534mlfC5TKGiPduIIewOB0QdQfX3CfyMUQgJRv16UG
   aTmGkAywoXOpJqqdQKzMc26sW2VbUjFQCJ9C3zaadah/2HWNeB0MfC6u/
   P3pnUSFeW7i3WEWshdeNVAIBivap88R4uXUJVy1gNO92a/ywtOYfN0mWU
   PY1PBcatjXGpH/Z+//78xF93XeY8oSi0iJ9Zf8bdeFZiYI7vlOWKulEfE
   6aHC9zVeEAlv7mdcuzaK5lDEusFmGvjthhoXerUWflcQOZkfzFTRtRSur
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="342929450"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="342929450"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 20:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="689930400"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="689930400"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Apr 2023 20:57:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkdE5-000S6A-2J;
	Fri, 07 Apr 2023 03:57:25 +0000
Date: Fri, 7 Apr 2023 11:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clocksource/exynos_mct.c:635 mct_init_dt() warn: missing
 error code? 'ret'
Message-ID: <202304071112.kqnTNdLv-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Vincent Whitchurch <vincent.whitchurch@axis.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2afccfefe7be1f7346564fe619277110d341f9b
commit: e8550f0e7bde9bd31697e3c534d386f7f3b5787b clocksource/drivers/exynos_mct: Support frc-shared property
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230407/202304071112.kqnTNdLv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304071112.kqnTNdLv-lkp@intel.com/

smatch warnings:
drivers/clocksource/exynos_mct.c:635 mct_init_dt() warn: missing error code? 'ret'

vim +/ret +635 drivers/clocksource/exynos_mct.c

30d8bead5a3094 arch/arm/mach-exynos4/mct.c      Changhwan Youn     2011-03-11  612  
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  613  static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
228e3023eb0430 drivers/clocksource/exynos_mct.c Arnd Bergmann      2013-04-09  614  {
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  615  	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  616  	int ret;
36ba5d527e9567 arch/arm/mach-exynos/mct.c       Thomas Abraham     2013-03-09  617  
7cd925a8823d16 drivers/clocksource/exynos_mct.c Marek Szyprowski   2021-11-01  618  	ret = exynos4_timer_resources(np);
7cd925a8823d16 drivers/clocksource/exynos_mct.c Marek Szyprowski   2021-11-01  619  	if (ret)
7cd925a8823d16 drivers/clocksource/exynos_mct.c Marek Szyprowski   2021-11-01  620  		return ret;
3a062281129229 arch/arm/mach-exynos4/mct.c      Changhwan Youn     2011-10-04  621  
7cd925a8823d16 drivers/clocksource/exynos_mct.c Marek Szyprowski   2021-11-01  622  	ret = exynos4_timer_interrupts(np, int_type);
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  623  	if (ret)
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  624  		return ret;
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  625  
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  626  	ret = exynos4_clocksource_init(frc_shared);
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  627  	if (ret)
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  628  		return ret;
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  629  
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  630  	/*
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  631  	 * When the FRC is shared with a main processor, this secondary
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  632  	 * processor cannot use the global comparator.
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  633  	 */
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  634  	if (frc_shared)
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09 @635  		return ret;
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  636  
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  637  	return exynos4_clockevent_init();
30d8bead5a3094 arch/arm/mach-exynos4/mct.c      Changhwan Youn     2011-03-11  638  }
228e3023eb0430 drivers/clocksource/exynos_mct.c Arnd Bergmann      2013-04-09  639  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
