Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B273603EE
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722598; cv=none; b=OsRseYKh25R7UjlePfyVtK78eRxHrqiaF5uuA65jQbW+EF0M74LQIBFBhGfz2FPVC0C+1agKX7ummEdttnZ7GF7kVbIazIFZxUYhO5JhNUkLNJGtF0ST53V9Xw4MtJ67YyvEisBQ9v0lSQdlmrFrg1N6oMUmX2oSzJPeeys71+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722598; c=relaxed/simple;
	bh=pfbGVhfZxEDO/bSVIJThHc85CJLibeiFP1EgufFn4Ec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WE4yi6ypruwfM2GBOQaT5OjXvjKWLhnlsPIAaIsZSStypFCM5xn5sGE9VEuw6lKO2/NQHmRbaODk4GkZKkIeKADXXDenRgaxvSyUUUPiwm0X/XEYJhCPelaTYWUBBN8Ecnykh5aBhdRP5xUxbe20yRRpohRHgU7E9bth07LCMas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2DCVwpG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2DCVwpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790722595; x=1822258595;
  h=date:from:to:cc:subject:message-id;
  bh=pfbGVhfZxEDO/bSVIJThHc85CJLibeiFP1EgufFn4Ec=;
  b=l2DCVwpGTNlF8A9YLsYEBZ9UifXWGazO+0EU2ITszhXVSNUw4OFxdrYy
   mex6SNBjdX2ymqE9RjxHxtSdGNJeOb9mhkF/scaYqBQt17Xm54w3eDLMB
   1SA+kot74UxCq5dx1idRFm4VDa9MQDp29CrfO9pLtPvUXALnUKsCwPC3g
   PDw9gGKXjiqAPvsTxStv2y6iJzdwS7me2KJDhSiSc3kH9TYI/KNnMQqe7
   supNbd1fV0ic40Y3bD/QV6Mb78oBTfOzTvzNa9c+/tYSiLwhMoAKfb9g6
   V+B7ZEHz4H+Y6SlzvptQxoUNHfe5T6G6Cc6ktJd0QZGBRFvYzZDm+cDl4
   Q==;
X-CSE-ConnectionGUID: 3BWa4HUQQ+iZHiou6PRnQg==
X-CSE-MsgGUID: PbPteQ8sTGKqnTgTibTqvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90671666"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90671666"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 15:56:34 -0700
X-CSE-ConnectionGUID: /SmaqMUqRHqvHA9WWmANAg==
X-CSE-MsgGUID: kkqBgPGdTZq4f9crzFWmlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="279315509"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2026 15:56:33 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBgkQ-000000001b9-0goV;
	Tue, 29 Sep 2026 22:56:30 +0000
Date: Wed, 30 Sep 2026 00:56:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clocksource/timer-fsl-ftm.c:258 __ftm_clk_init()
 warn: 'clk' from clk_prepare_enable() not released on lines: 251.
Message-ID: <202609300032.prOzrvtY-lkp@intel.com>
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
TO: Ralf Lici <ralf@mandelbit.com>
CC: Antonio Quartulli <antonio@openvpn.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a243ede718463c7b481878656f1ff32a0ce0fd54
commit: 006208026819d5e9e5ec07b3e73d95960a059327 selftests: ovpn: validate peer VPN addresses
date:   9 days ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 days ago
config: arm-randconfig-r2202-20260929 (https://download.01.org/0day-ci/archive/20260930/202609300032.prOzrvtY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 006208026819 ("selftests: ovpn: validate peer VPN addresses")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609300032.prOzrvtY-lkp@intel.com/

smatch warnings:
drivers/clocksource/timer-fsl-ftm.c:258 __ftm_clk_init() warn: 'clk' from clk_prepare_enable() not released on lines: 251.

vim +/clk +258 drivers/clocksource/timer-fsl-ftm.c

2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  229  
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  230  static int __init __ftm_clk_init(struct device_node *np, char *cnt_name,
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  231  				 char *ftm_name)
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  232  {
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  233  	struct clk *clk;
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  234  	int err;
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  235  
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  236  	clk = of_clk_get_by_name(np, cnt_name);
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  237  	if (IS_ERR(clk)) {
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  238  		pr_err("ftm: Cannot get \"%s\": %ld\n", cnt_name, PTR_ERR(clk));
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  239  		return PTR_ERR(clk);
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  240  	}
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  241  	err = clk_prepare_enable(clk);
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  242  	if (err) {
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  243  		pr_err("ftm: clock failed to prepare+enable \"%s\": %d\n",
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  244  			cnt_name, err);
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  245  		return err;
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  246  	}
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  247  
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  248  	clk = of_clk_get_by_name(np, ftm_name);
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  249  	if (IS_ERR(clk)) {
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  250  		pr_err("ftm: Cannot get \"%s\": %ld\n", ftm_name, PTR_ERR(clk));
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  251  		return PTR_ERR(clk);
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  252  	}
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  253  	err = clk_prepare_enable(clk);
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  254  	if (err)
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  255  		pr_err("ftm: clock failed to prepare+enable \"%s\": %d\n",
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  256  			ftm_name, err);
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  257  
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23 @258  	return clk_get_rate(clk);
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  259  }
2529c3a3307970 drivers/clocksource/fsl_ftm_timer.c Xiubo Li 2014-05-23  260  

:::::: The code at line 258 was first introduced by commit
:::::: 2529c3a330797000d699d70c9a65b8525c6652de clocksource: Add Freescale FlexTimer Module (FTM) timer support

:::::: TO: Xiubo Li <Li.Xiubo@freescale.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
