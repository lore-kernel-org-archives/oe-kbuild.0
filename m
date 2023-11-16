Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C2217F0
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 05:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpsq5ZbB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700112160; x=1731648160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpNeCRHJ6bR8aIDedWEwQiFbW+7WKtLjPQOrcEpAqg4=;
  b=dpsq5ZbBkGBynS+UbtkhjRLEw/qjjA66iSYBVtjLL5kPiez616RRemBq
   4kUXN8wyGisB2j7q0h/w38nSjaOagKgsIJvCyr+z8Gtphqn4WOVA/EvCy
   dhJK+kHbIfCQD8hHywCfylse0znFYL1zAFXegyhyC1jy4LSJ1w9rW1iZU
   EzPw2+cf3JboBJCMqGiTn3nyKz4mDA+6jCDBVR3NRICrxYB6AUmByhn/Z
   l0h/+eygM3A3/S6hkAf9uLLxpaIOhzD2Jr30RkMRvRKaQ7j8BRunLujyu
   DD/iZsmWOVfegxWz4r6djhDwbG1xSIWXQ0MQtZpEPcX7NfZdueMAJgPi3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="455306805"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="455306805"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 21:22:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="909006330"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="909006330"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 21:22:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Upo-0001KR-1Z;
	Thu, 16 Nov 2023 05:22:36 +0000
Date: Thu, 16 Nov 2023 13:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pwm/pwm-atmel.c:479 atmel_pwm_enable_clk_if_on() warn:
 missing error code 'ret'
Message-ID: <202311161304.R1c9nMEh-lkp@intel.com>
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
TO: Guiting Shen <aarongt.shen@gmail.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: a2f68c7e312f94c8f78740449a88e8d7308ab18d pwm: atmel: Enable clk when pwm already enabled in bootloader
date:   4 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-r071-20231112 (https://download.01.org/0day-ci/archive/20231116/202311161304.R1c9nMEh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311161304.R1c9nMEh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311161304.R1c9nMEh-lkp@intel.com/

smatch warnings:
drivers/pwm/pwm-atmel.c:479 atmel_pwm_enable_clk_if_on() warn: missing error code 'ret'

vim +/ret +479 drivers/pwm/pwm-atmel.c

32b16d46e4154d Bo Shen      2013-12-13  465  
a2f68c7e312f94 Guiting Shen 2023-07-16  466  static int atmel_pwm_enable_clk_if_on(struct atmel_pwm_chip *atmel_pwm, bool on)
a2f68c7e312f94 Guiting Shen 2023-07-16  467  {
a2f68c7e312f94 Guiting Shen 2023-07-16  468  	unsigned int i, cnt = 0;
a2f68c7e312f94 Guiting Shen 2023-07-16  469  	unsigned long sr;
a2f68c7e312f94 Guiting Shen 2023-07-16  470  	int ret = 0;
a2f68c7e312f94 Guiting Shen 2023-07-16  471  
a2f68c7e312f94 Guiting Shen 2023-07-16  472  	sr = atmel_pwm_readl(atmel_pwm, PWM_SR) & PWM_SR_ALL_CH_MASK;
a2f68c7e312f94 Guiting Shen 2023-07-16  473  	if (!sr)
a2f68c7e312f94 Guiting Shen 2023-07-16  474  		return 0;
a2f68c7e312f94 Guiting Shen 2023-07-16  475  
a2f68c7e312f94 Guiting Shen 2023-07-16  476  	cnt = bitmap_weight(&sr, atmel_pwm->chip.npwm);
a2f68c7e312f94 Guiting Shen 2023-07-16  477  
a2f68c7e312f94 Guiting Shen 2023-07-16  478  	if (!on)
a2f68c7e312f94 Guiting Shen 2023-07-16 @479  		goto disable_clk;
a2f68c7e312f94 Guiting Shen 2023-07-16  480  
a2f68c7e312f94 Guiting Shen 2023-07-16  481  	for (i = 0; i < cnt; i++) {
a2f68c7e312f94 Guiting Shen 2023-07-16  482  		ret = clk_enable(atmel_pwm->clk);
a2f68c7e312f94 Guiting Shen 2023-07-16  483  		if (ret) {
a2f68c7e312f94 Guiting Shen 2023-07-16  484  			dev_err(atmel_pwm->chip.dev,
a2f68c7e312f94 Guiting Shen 2023-07-16  485  				"failed to enable clock for pwm %pe\n",
a2f68c7e312f94 Guiting Shen 2023-07-16  486  				ERR_PTR(ret));
a2f68c7e312f94 Guiting Shen 2023-07-16  487  
a2f68c7e312f94 Guiting Shen 2023-07-16  488  			cnt = i;
a2f68c7e312f94 Guiting Shen 2023-07-16  489  			goto disable_clk;
a2f68c7e312f94 Guiting Shen 2023-07-16  490  		}
a2f68c7e312f94 Guiting Shen 2023-07-16  491  	}
a2f68c7e312f94 Guiting Shen 2023-07-16  492  
a2f68c7e312f94 Guiting Shen 2023-07-16  493  	return 0;
a2f68c7e312f94 Guiting Shen 2023-07-16  494  
a2f68c7e312f94 Guiting Shen 2023-07-16  495  disable_clk:
a2f68c7e312f94 Guiting Shen 2023-07-16  496  	while (cnt--)
a2f68c7e312f94 Guiting Shen 2023-07-16  497  		clk_disable(atmel_pwm->clk);
a2f68c7e312f94 Guiting Shen 2023-07-16  498  
a2f68c7e312f94 Guiting Shen 2023-07-16  499  	return ret;
a2f68c7e312f94 Guiting Shen 2023-07-16  500  }
a2f68c7e312f94 Guiting Shen 2023-07-16  501  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
