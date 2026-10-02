Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1664D179C
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960967; cv=none; b=jJid5vREgJ1qk0d4+WGzqm5CVvSpNu/hcVxCMvhEJSgziE4iiUtURwFAFmpFpW7IRcL7tUFJBO+YeKilxUkRMZd05a+2xlP/fZ/t9e4pJYpaJgz/LE4clJv8QvW8+80OlrPCjsU0TQBdl9bERCPBby8PxMBxx7kIK8RI9DxZIAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960967; c=relaxed/simple;
	bh=z83794+pXlAcqbTr9bIjcf3dMzdsTCMXY4PsPZWJPgk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U9rshpYuss+P39PNHyaJL/yE7+cBDu8wuappvx3roUYKy/97JujILIYGDFWvDJQoaYzVyOMPIeZFWcxJifc0IW4Q8PHmkX6dMzxLkw56qMkMLpEPWdIKL82ndsHtntnXNXseKxMGdAP9yTMmGz2XsRPGbDfBVT7uhNHDNWgy2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaQ+HgHN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaQ+HgHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790960964; x=1822496964;
  h=date:from:to:cc:subject:message-id;
  bh=z83794+pXlAcqbTr9bIjcf3dMzdsTCMXY4PsPZWJPgk=;
  b=LaQ+HgHNlLQ9dHmQyig8NTt+ZYk9vUE5As67N7peayWGJlN3VfQM7Zdq
   R+3ihqPFtZizvcb7h6ZOh0WQgE25jkM5fKvklFjKtZjtT1nQ5eKd+USR7
   mbNZ2z5g+isywzEQyXQ4S12TdiH7hOwCJ52Ux5iHfKC9hcjxszf2+V8g7
   BexQPlSJoDXgTSzznhRx68GrCK2N4RAQU77ztDBgcUxeu8Ki7LbHMi5im
   vOn7v9+3pBGpu4w4SPvzvOk4RfBOBf1lKIe9MORFmFldtUV2QhD6W4xvO
   Pj/lL/6awkYLssOjrK06CaT9Y79yXCIRgjwtV/PMG0JO9TbVPI3x0yu8d
   A==;
X-CSE-ConnectionGUID: RuYB8VpgSz+sXIdwpKdXYA==
X-CSE-MsgGUID: LTkM/RmqQwWJKBsxHQzPqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="102252069"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102252069"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 10:09:22 -0700
X-CSE-ConnectionGUID: 6eViVJ1cSYOOpUlp20owcQ==
X-CSE-MsgGUID: hXy82DzoR/y0uWSJUX0Ucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274942994"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2026 10:09:21 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCgl4-00000000TIJ-3PoR;
	Fri, 02 Oct 2026 17:09:18 +0000
Date: Sat, 03 Oct 2026 01:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clocksource/timer-mediatek.c:313:21: warning:
 variable 'clk_bus' set but not used
Message-ID: <202610030158.tLq3nt4t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Luca-Leonardo-Scorcia/clocksource-drivers-timer-mediatek-Fix-random-crash-at-boot/20261002-091926, commit: 0c8c1bddeb603ee5834db94da982745e97c68119"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Luca Leonardo Scorcia <l.scorcia@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/clocksource-drivers-timer-mediatek-Fix-random-crash-at-boot/20261002-091926
head:   0c8c1bddeb603ee5834db94da982745e97c68119
commit: 0c8c1bddeb603ee5834db94da982745e97c68119 clocksource/drivers/timer-mediatek: Request and enable the bus clock
date:   10 hours ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: nios2-randconfig-1001-20261002 (https://download.01.org/0day-ci/archive/20261003/202610030158.tLq3nt4t-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030158.tLq3nt4t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030158.tLq3nt4t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clocksource/timer-mediatek.c: In function 'mtk_gpt_init':
>> drivers/clocksource/timer-mediatek.c:313:21: warning: variable 'clk_bus' set but not used [-Wunused-but-set-variable]
     313 |         struct clk *clk_bus;
         |                     ^~~~~~~


vim +/clk_bus +313 drivers/clocksource/timer-mediatek.c

e3af677607d9dac drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  309  
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  310  static int mtk_gpt_init(struct platform_device *pdev)
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  311  {
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  312  	struct device_node *node = pdev->dev.of_node;
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02 @313  	struct clk *clk_bus;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  314  	int ret;
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  315  
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  316  	clk_bus = devm_clk_get_optional_enabled(&pdev->dev, "bus");
0c8c1bddeb603ee drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  317  
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  318  	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  319  	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  320  	to.clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  321  	to.clkevt.set_state_oneshot = mtk_gpt_clkevt_shutdown;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  322  	to.clkevt.tick_resume = mtk_gpt_clkevt_shutdown;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  323  	to.clkevt.set_next_event = mtk_gpt_clkevt_next_event;
75ac5cc2ee6b499 drivers/clocksource/timer-mediatek.c Evan Benn             2021-05-12  324  	to.clkevt.suspend = mtk_gpt_suspend;
75ac5cc2ee6b499 drivers/clocksource/timer-mediatek.c Evan Benn             2021-05-12  325  	to.clkevt.resume = mtk_gpt_resume;
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  326  	to.of_irq.handler = mtk_gpt_interrupt;
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  327  
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  328  	ret = timer_of_init(node, &to);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  329  	if (ret)
41d49e7939de5ec drivers/clocksource/timer-mediatek.c Fabien Parent         2019-09-19  330  		return ret;
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  331  
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  332  	/* Configure clock source */
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  333  	mtk_gpt_setup(&to, TIMER_CLK_SRC, GPT_CTRL_OP_FREERUN);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  334  	clocksource_mmio_init(timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC),
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  335  			      node->name, timer_of_rate(&to), 300, 32,
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  336  			      clocksource_mmio_readl_up);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  337  	gpt_sched_reg = timer_of_base(&to) + GPT_CNT_REG(TIMER_CLK_SRC);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  338  	sched_clock_register(mtk_gpt_read_sched_clock, 32, timer_of_rate(&to));
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  339  
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  340  	/* Configure clock event */
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  341  	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  342  	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  343  					TIMER_SYNC_TICKS, 0xffffffff);
d4a19eb3b15a4ba drivers/clocksource/mtk_timer.c      Matthias Brugger      2015-02-19  344  
a0858f937960d24 drivers/clocksource/timer-mediatek.c Stanley Chu           2018-07-06  345  	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
44a6e9864ca801e drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  346  	enable_irq(timer_of_irq(&to));
d4a19eb3b15a4ba drivers/clocksource/mtk_timer.c      Matthias Brugger      2015-02-19  347  
d64e24ce5fdddd7 drivers/clocksource/mtk_timer.c      Daniel Lezcano        2016-05-31  348  	return 0;
ecb3530dd59ddd5 drivers/clocksource/mtk_timer.c      Matthias Brugger      2014-07-18  349  }
322dca3aa6d9da7 drivers/clocksource/timer-mediatek.c Luca Leonardo Scorcia 2026-10-02  350  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
