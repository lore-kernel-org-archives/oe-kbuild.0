Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B0846BF
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 06:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733899623; cv=none; b=oZmU6nr1H/ZD7RK/VWdkl/291hQd/9Tko1WX8pMm1tIf78DHFqq422wwv8iLjC3nGmEhpvM7ELvKyYVO4iN8rZSa2oQ/HUEAbWcp8e3dFIt2f5b459cLPoZDazsHHF0VVUiSQ8mTIJSctNWUXWjKWmy7fKIBeKOihXShSMvzock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733899623; c=relaxed/simple;
	bh=7u4gjv9vJgRWroR5AgfyphhdLf1dAQrnZn9zHh2M1ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hohyTYWBROF+qxI2pzwwWL44eR++/6KQ8uaO+0eJ8DmNt6clfTtyO0Cv5xRJcTSEbtCaYkv5ZZr6GzXSVeFObTCndn1FUrYi059RV6tunQUOvCvgw8MFaEJPPf6B/liCn7tP9bN55U+QqF3XtXFW1YopdjYDBMiD0db5qB8g+AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKgm+jlX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKgm+jlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733899621; x=1765435621;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7u4gjv9vJgRWroR5AgfyphhdLf1dAQrnZn9zHh2M1ls=;
  b=TKgm+jlX8R/ixHGJa7P3A28IJIERPKoo8MUYdGpVWJ4WSCj3fxDDcD7/
   T/kJVykLxfUNJabkmqb2wdPHFE+aYxUWrJqELFjLhMcs0gQ6L7KauLEP4
   4SLiinwkT083Ol0yOfj/ThpXJRk/JEXH9xtQimYaGM5Qsgpa6h2snm2Vc
   KpYDF7BpRR+TSmCFrx3MQJi7wEX/A4WmvVR/5ijtwZzzBCtSNZjsBPxgD
   N/EhTaqf+aosXkEu1ZJQcR1im9WsYA0h5rYHrW35dBUwHjFS6GNVxEbri
   y19dHTJQhtYnAkTs2hMpF7qaSmr8s8QRmSNWCEDvHRD0Fa+U7IZcWj31E
   Q==;
X-CSE-ConnectionGUID: JN+EgNY6Tv66b3eRdpP8qQ==
X-CSE-MsgGUID: gBB//Qg9RhaHdOsVREZ+Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="59659332"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="59659332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 22:47:00 -0800
X-CSE-ConnectionGUID: YQivA+MKS4Kxu2HLrOh8Rw==
X-CSE-MsgGUID: zrN96JfJSx+RIWU3e7UlOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95390562"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2024 22:46:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLGUq-0006NJ-37;
	Wed, 11 Dec 2024 06:46:56 +0000
Date: Wed, 11 Dec 2024 14:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clocksource/timer-atmel-st.c:247 atmel_st_timer_init() warn:
 'irq' from request_irq() not released on lines: 219,225,231.
Message-ID: <202412111400.YxwyqyfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f92f4749861b06fed908d336b4dee1326003291b
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: microblaze-randconfig-r073-20241210 (https://download.01.org/0day-ci/archive/20241211/202412111400.YxwyqyfB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412111400.YxwyqyfB-lkp@intel.com/

smatch warnings:
drivers/clocksource/timer-atmel-st.c:247 atmel_st_timer_init() warn: 'irq' from request_irq() not released on lines: 219,225,231.
drivers/clocksource/timer-atmel-st.c:247 atmel_st_timer_init() warn: 'sclk' from clk_prepare_enable() not released on lines: 231.

vim +/irq +247 drivers/clocksource/timer-atmel-st.c

5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  179  
73a59c1c4af06c6 arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  180  /*
5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  181   * ST (system timer) module supports both clockevents and clocksource.
73a59c1c4af06c6 arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  182   */
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  183  static int __init atmel_st_timer_init(struct device_node *node)
73a59c1c4af06c6 arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  184  {
216ab8f155fba65 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  185  	struct clk *sclk;
216ab8f155fba65 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  186  	unsigned int sclk_rate, val;
0afb46b248eff66 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  187  	int irq, ret;
adf2edfd6003c40 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  188  
adf2edfd6003c40 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  189  	regmap_st = syscon_node_to_regmap(node);
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  190  	if (IS_ERR(regmap_st)) {
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  191  		pr_err("Unable to get regmap\n");
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  192  		return PTR_ERR(regmap_st);
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  193  	}
454c46df8394560 arch/arm/mach-at91/at91rm9200_time.c Joachim Eastwood  2012-10-28  194  
5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  195  	/* Disable all timer interrupts, and clear any pending ones */
adf2edfd6003c40 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  196  	regmap_write(regmap_st, AT91_ST_IDR,
5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  197  		AT91_ST_PITS | AT91_ST_WDOVF | AT91_ST_RTTINC | AT91_ST_ALMS);
adf2edfd6003c40 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  198  	regmap_read(regmap_st, AT91_ST_SR, &val);
adf2edfd6003c40 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  199  
adf2edfd6003c40 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  200  	/* Get the interrupts property */
0afb46b248eff66 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  201  	irq  = irq_of_parse_and_map(node, 0);
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  202  	if (!irq) {
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  203  		pr_err("Unable to get IRQ from DT\n");
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  204  		return -EINVAL;
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  205  	}
73a59c1c4af06c6 arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  206  
2a6f9902c6a799a arch/arm/mach-at91rm9200/time.c      Andrew Victor     2006-06-19  207  	/* Make IRQs happen for the system timer */
0afb46b248eff66 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  208  	ret = request_irq(irq, at91rm9200_timer_interrupt,
0afb46b248eff66 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  209  			  IRQF_SHARED | IRQF_TIMER | IRQF_IRQPOLL,
0afb46b248eff66 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  210  			  "at91_tick", regmap_st);
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  211  	if (ret) {
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  212  		pr_err("Unable to setup IRQ\n");
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  213  		return ret;
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  214  	}
73a59c1c4af06c6 arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  215  
216ab8f155fba65 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  216  	sclk = of_clk_get(node, 0);
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  217  	if (IS_ERR(sclk)) {
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  218  		pr_err("Unable to get slow clock\n");
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  219  		return PTR_ERR(sclk);
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  220  	}
216ab8f155fba65 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  221  
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  222  	ret = clk_prepare_enable(sclk);
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  223  	if (ret) {
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  224  		pr_err("Could not enable slow clock\n");
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  225  		return ret;
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  226  	}
216ab8f155fba65 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  227  
216ab8f155fba65 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  228  	sclk_rate = clk_get_rate(sclk);
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  229  	if (!sclk_rate) {
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  230  		pr_err("Invalid slow clock rate\n");
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  231  		return -EINVAL;
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  232  	}
216ab8f155fba65 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  233  	timer_latch = (sclk_rate + HZ / 2) / HZ;
216ab8f155fba65 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  234  
5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  235  	/* The 32KiHz "Slow Clock" (tick every 30517.58 nanoseconds) is used
5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  236  	 * directly for the clocksource and all clockevents, after adjusting
5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  237  	 * its prescaler from the 1 Hz default.
5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  238  	 */
adf2edfd6003c40 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  239  	regmap_write(regmap_st, AT91_ST_RTMR, 1);
73a59c1c4af06c6 arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  240  
5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  241  	/* Setup timer clockevent, with minimum of two ticks (important!!) */
320ab2b0b1e08e3 arch/arm/mach-at91/at91rm9200_time.c Rusty Russell     2008-12-13  242  	clkevt.cpumask = cpumask_of(0);
216ab8f155fba65 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  243  	clockevents_config_and_register(&clkevt, sclk_rate,
1c283531115bda7 arch/arm/mach-at91/at91rm9200_time.c Uwe Kleine-König  2013-10-08  244  					2, AT91_ST_ALMV);
2a6f9902c6a799a arch/arm/mach-at91rm9200/time.c      Andrew Victor     2006-06-19  245  
5e802dfab7bbbee arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  246  	/* register clocksource */
adbaf5254152f32 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06 @247  	return clocksource_register_hz(&clk32k, sclk_rate);

:::::: The code at line 247 was first introduced by commit
:::::: adbaf5254152f322b873d0a9cd0f150dd30c64aa clocksource/drivers/atmel-st: Convert init function to return error

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
