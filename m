Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF6020FF
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Apr 2023 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680418854; x=1711954854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPbDWkxaUaD8rtdWNBeoBMzcumSgMtiowwTQanp22yg=;
  b=KSyjC9dEBUK5Kn/3LEpdRiJl2G6kjPUwMe5ltDs+6zQ30aN0gyiPxRj3
   K6XTAUKQcpw2hYPAmoUV+TEnHGhafnLbTP+1C+F4AanbRNQqJfyLU/Xuc
   Lom1p6dfOM1sywa75HdaBj1W92jUyQS96XUrgKqwBhRLkyfwdIdDdedBU
   n8uXk6/xpRCpTeUUrK2WjwlVKOdmYCrR0fpqi/heJAwz3Oh4eBmb5zcjz
   Hhkby++Bi2ANeM6A358c6Vb0DeJLZG21tg+iLTdEKqfCODiXJr99eZgmF
   KDWckmSEnmfnLXY8rErEcL3762cv4rFAj/N/uFPhy/xoyfTlrloCf0Lco
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="339205642"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="339205642"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 00:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="1015315848"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="1015315848"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Apr 2023 00:00:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pirhr-000NHr-1o;
	Sun, 02 Apr 2023 07:00:51 +0000
Date: Sun, 2 Apr 2023 15:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clocksource/exynos_mct.c:635 mct_init_dt() warn: missing
 error code? 'ret'
Message-ID: <202304021446.46XVKag0-lkp@intel.com>
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
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: e8550f0e7bde9bd31697e3c534d386f7f3b5787b clocksource/drivers/exynos_mct: Support frc-shared property
date:   6 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230402/202304021446.46XVKag0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304021446.46XVKag0-lkp@intel.com/

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
