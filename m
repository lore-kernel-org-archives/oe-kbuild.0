Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D301CB501
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 16:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480335; cv=none; b=D4o1mg0T/MvoT5A82upNBQbLkSvnkRMPsftv4G38uPrXA66AvPO5lKq8MU1LeDTx8KLHG8zCVi1mF47ethxLifarfVnlcUFwCnTE/kKoPGrgDCyae0fA0vtu1aUKFP2zJYUut9RTq25gMyEH47H9N+IChzKY6g2SvVdKzBwgmlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480335; c=relaxed/simple;
	bh=SAVnhkIzX4r/nXHfDeH7or8y+2SU9/rksn4s5ssjoHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBXotLFxpZY3U9kYBU89qGJxE4ijtMTq8dXe4neLRevVuVVtdjfAm/W8g3Je0X7MRL7JbiP7iWqqQcjykDg2W3WFs6hoZMi6TGtxj+g+PoO0TUmrAiyCqSZzoarWRjHL5iKxVUdS6mG2QkuLM62x1eKz6Lxqef0ddeYhBZ7lBAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJvT6ZMF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJvT6ZMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730480332; x=1762016332;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SAVnhkIzX4r/nXHfDeH7or8y+2SU9/rksn4s5ssjoHk=;
  b=jJvT6ZMFsJcDBx/31S0qmwoJztJlaSN1wPrzpLoJ91P7ITdYwgQ7PvcA
   KqvIYILbomgd8/Jvb0jAp65bd72eRfNiGUe8phQv8ZA1mHIoxACtnbNzs
   QS2moXo4giAUL2N8Ic2MVIHFxafhZjFq7M9FKnnQqP0CUlU4ZvTMRLVl3
   vMgYquKTXqtSp/hFAtTxS0tanCarR87jfqVtqVuiTtBu08NN9isFsPU3y
   HcdPtbYhWHEZ+0UfDsZsMP4Xo0kAAOEgQ1+KYfAjBHZH2jtXgEd6ciXSl
   Pq9SwSHP185Okyf2EEyVSaUK6oy8xwRQEiIJ3W2UayGV72rD9aDjs7IvN
   g==;
X-CSE-ConnectionGUID: wFsS0sEITo+N/0ozN5hZ7w==
X-CSE-MsgGUID: 0ABGLhh/THad1rdydirE+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="40832112"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="40832112"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 09:58:52 -0700
X-CSE-ConnectionGUID: TZWSwFgyRmiChTFZ1jnPrg==
X-CSE-MsgGUID: OBhSZ+grSNSHEoCYnL1xgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="83123624"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Nov 2024 09:58:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6uz1-000hmv-1x;
	Fri, 01 Nov 2024 16:58:47 +0000
Date: Sat, 2 Nov 2024 00:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clocksource/timer-atmel-st.c:247 atmel_st_timer_init() warn:
 'sclk' from clk_prepare_enable() not released on lines: 231.
Message-ID: <202411020024.Q2g0yMrK-lkp@intel.com>
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
head:   6c52d4da1c742cd01a797a4d0a2d3c5a60dc9bfe
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: alpha-randconfig-r071-20241101 (https://download.01.org/0day-ci/archive/20241102/202411020024.Q2g0yMrK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411020024.Q2g0yMrK-lkp@intel.com/

New smatch warnings:
drivers/clocksource/timer-atmel-st.c:247 atmel_st_timer_init() warn: 'sclk' from clk_prepare_enable() not released on lines: 231.

Old smatch warnings:
drivers/clocksource/timer-atmel-st.c:247 atmel_st_timer_init() warn: 'irq' from request_irq() not released on lines: 219,225,231.

vim +/sclk +247 drivers/clocksource/timer-atmel-st.c

5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  179  
73a59c1c4af06c arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  180  /*
5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  181   * ST (system timer) module supports both clockevents and clocksource.
73a59c1c4af06c arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  182   */
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  183  static int __init atmel_st_timer_init(struct device_node *node)
73a59c1c4af06c arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  184  {
216ab8f155fba6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  185  	struct clk *sclk;
216ab8f155fba6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  186  	unsigned int sclk_rate, val;
0afb46b248eff6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  187  	int irq, ret;
adf2edfd6003c4 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  188  
adf2edfd6003c4 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  189  	regmap_st = syscon_node_to_regmap(node);
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  190  	if (IS_ERR(regmap_st)) {
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  191  		pr_err("Unable to get regmap\n");
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  192  		return PTR_ERR(regmap_st);
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  193  	}
454c46df839456 arch/arm/mach-at91/at91rm9200_time.c Joachim Eastwood  2012-10-28  194  
5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  195  	/* Disable all timer interrupts, and clear any pending ones */
adf2edfd6003c4 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  196  	regmap_write(regmap_st, AT91_ST_IDR,
5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  197  		AT91_ST_PITS | AT91_ST_WDOVF | AT91_ST_RTTINC | AT91_ST_ALMS);
adf2edfd6003c4 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  198  	regmap_read(regmap_st, AT91_ST_SR, &val);
adf2edfd6003c4 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  199  
adf2edfd6003c4 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  200  	/* Get the interrupts property */
0afb46b248eff6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  201  	irq  = irq_of_parse_and_map(node, 0);
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  202  	if (!irq) {
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  203  		pr_err("Unable to get IRQ from DT\n");
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  204  		return -EINVAL;
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  205  	}
73a59c1c4af06c arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  206  
2a6f9902c6a799 arch/arm/mach-at91rm9200/time.c      Andrew Victor     2006-06-19  207  	/* Make IRQs happen for the system timer */
0afb46b248eff6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  208  	ret = request_irq(irq, at91rm9200_timer_interrupt,
0afb46b248eff6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  209  			  IRQF_SHARED | IRQF_TIMER | IRQF_IRQPOLL,
0afb46b248eff6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-13  210  			  "at91_tick", regmap_st);
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  211  	if (ret) {
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  212  		pr_err("Unable to setup IRQ\n");
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  213  		return ret;
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  214  	}
73a59c1c4af06c arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  215  
216ab8f155fba6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  216  	sclk = of_clk_get(node, 0);
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  217  	if (IS_ERR(sclk)) {
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  218  		pr_err("Unable to get slow clock\n");
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  219  		return PTR_ERR(sclk);
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  220  	}
216ab8f155fba6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  221  
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  222  	ret = clk_prepare_enable(sclk);
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  223  	if (ret) {
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  224  		pr_err("Could not enable slow clock\n");
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  225  		return ret;
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  226  	}
216ab8f155fba6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  227  
216ab8f155fba6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  228  	sclk_rate = clk_get_rate(sclk);
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  229  	if (!sclk_rate) {
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  230  		pr_err("Invalid slow clock rate\n");
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  231  		return -EINVAL;
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06  232  	}
216ab8f155fba6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  233  	timer_latch = (sclk_rate + HZ / 2) / HZ;
216ab8f155fba6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  234  
5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  235  	/* The 32KiHz "Slow Clock" (tick every 30517.58 nanoseconds) is used
5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  236  	 * directly for the clocksource and all clockevents, after adjusting
5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  237  	 * its prescaler from the 1 Hz default.
5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  238  	 */
adf2edfd6003c4 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-03-12  239  	regmap_write(regmap_st, AT91_ST_RTMR, 1);
73a59c1c4af06c arch/arm/mach-at91rm9200/time.c      SAN People        2006-01-09  240  
5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  241  	/* Setup timer clockevent, with minimum of two ticks (important!!) */
320ab2b0b1e08e arch/arm/mach-at91/at91rm9200_time.c Rusty Russell     2008-12-13  242  	clkevt.cpumask = cpumask_of(0);
216ab8f155fba6 drivers/clocksource/timer-atmel-st.c Alexandre Belloni 2015-08-16  243  	clockevents_config_and_register(&clkevt, sclk_rate,
1c283531115bda arch/arm/mach-at91/at91rm9200_time.c Uwe Kleine-König  2013-10-08  244  					2, AT91_ST_ALMV);
2a6f9902c6a799 arch/arm/mach-at91rm9200/time.c      Andrew Victor     2006-06-19  245  
5e802dfab7bbbe arch/arm/mach-at91/at91rm9200_time.c David Brownell    2007-07-31  246  	/* register clocksource */
adbaf5254152f3 drivers/clocksource/timer-atmel-st.c Daniel Lezcano    2016-06-06 @247  	return clocksource_register_hz(&clk32k, sclk_rate);

:::::: The code at line 247 was first introduced by commit
:::::: adbaf5254152f322b873d0a9cd0f150dd30c64aa clocksource/drivers/atmel-st: Convert init function to return error

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
