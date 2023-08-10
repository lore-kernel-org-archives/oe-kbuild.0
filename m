Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1B200A4
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Aug 2023 18:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691693720; x=1723229720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6e76fAuxIPkdC84Fpq5N6WMg4CjGU0QQMquQKw9J8tg=;
  b=Shstipo0cReBkc1gnLAvc0fpzdngYCa+fUU2BjFv0miRdAXy3gMd8/2e
   JLX0YsAXiiU2pDjw5HgWyCDJN8m/QeO9TSk/XVUFgkn9OeXSm8Z+f+xdO
   RvaXj7zpIrA75FW28D+0W0EqPtKKIDAsuuXla4Q7/9ZeiuZ5SWLl4LxqP
   LEinPSjmErZZbrabutFwcYcEwUSh+ciWKtgyULNoi4adYkyLfwHzqTeiK
   awdqpt1MQ+9/HCIrQsoezB7X/HDRh3pUTGJ8zZwM/dMr/dlbWRV670nI5
   P65iHjCyAlY1aBRj03I6CfhWZTKBeosk1zJvM9/0TGgSkdcJ27DtYF9Xc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="375208113"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="375208113"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 11:55:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="1063022048"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="1063022048"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Aug 2023 11:55:17 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUAoX-0007C4-0P;
	Thu, 10 Aug 2023 18:55:17 +0000
Date: Fri, 11 Aug 2023 02:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3394/8441] drivers/pwm/pwm-atmel.c:479
 atmel_pwm_enable_clk_if_on() warn: missing error code 'ret'
Message-ID: <202308110234.5VFNBwRh-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Guiting Shen <aarongt.shen@gmail.com>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: a2f68c7e312f94c8f78740449a88e8d7308ab18d [3394/8441] pwm: atmel: Enable clk when pwm already enabled in bootloader
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: nios2-randconfig-m031-20230809 (https://download.01.org/0day-ci/archive/20230811/202308110234.5VFNBwRh-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110234.5VFNBwRh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308110234.5VFNBwRh-lkp@intel.com/

New smatch warnings:
drivers/pwm/pwm-atmel.c:479 atmel_pwm_enable_clk_if_on() warn: missing error code 'ret'

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

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
