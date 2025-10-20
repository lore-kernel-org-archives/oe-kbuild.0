Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9281F8AC8
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973032; cv=none; b=CZx+U9NZLG8NRhRf7NOTueREjy8COB+OgdJsC86egWLzk0qOpo5wDaDqtgMQcbhfTgIMnUJvM/M7ym4DKlTR6av/Q7Z0CdjQ0j6NZypV68Unddl5xqLLbRSgUKRL1v7BucgHiqELpAOzIOxPYZk2iag6GmlNQgYfO09f7Ka/Aik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973032; c=relaxed/simple;
	bh=SZG8483NT8DuEgR1XsqpOnVCNvP6i/GFymklknWGN2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZcQSSRzrTMp7Z5ZeTdvRrH/zLWE3kNm1dDbn9bk5Cbbkc3NNITpySA4aRZSdo+EEk6BoJTkSpTZLN+iT48FqLOFpIjqMGGfoYeMjzPSlO+KWp1tjwWa/nUg3h5GSRlJC5S9ysXnZqJmopnm/drutAndERAqEkgZ7TitwZuRgfoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQS1ky7L; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQS1ky7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760973031; x=1792509031;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SZG8483NT8DuEgR1XsqpOnVCNvP6i/GFymklknWGN2U=;
  b=HQS1ky7L4am6RWu1Biwl6JWFLqoOaa72nV7atrmNHhOwWGph6AmYbfd+
   ZJsIlzKpUbEITeGnrbTXDdbe+Dpvx7F08xpPNMopGGOolvKMF1olSCvi+
   RVEzWstj19ycV2SttEh8t8ckaQ4V1iyteROdx5LEk9QFmXeIKRHKEN5+Y
   XIjPwhS70emUN/ydFerbdMNGpJys1F8anzQMGFxlTI/IEamTlRgAiU244
   mq2DftgS/D3V2b84NCHCAQfg+maZ0d/rE/Mq6HdyYLKHCx0pDOLBvnlX1
   /56EE587QeV6qIg12eNKccOrvgL8b+saM16QOgPYaBeCmWlj69ktel6ER
   A==;
X-CSE-ConnectionGUID: bamaN4dhT9OhTSFj1SHfjg==
X-CSE-MsgGUID: mC21z99CSwW91gVmSFBgXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63128597"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="63128597"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 08:10:30 -0700
X-CSE-ConnectionGUID: uSX9m5CkTbuieTTGM0xgGg==
X-CSE-MsgGUID: YNzpkhtoTSulh5ACawOSdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183295888"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Oct 2025 08:10:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vArWk-0009vt-0B;
	Mon, 20 Oct 2025 15:10:26 +0000
Date: Mon, 20 Oct 2025 23:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pwm/pwm-imx27.c:353:41: sparse: sparse: unsigned value that
 used to be signed checked against zero?
Message-ID: <202510202357.PRIj4qyl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pwm/pwm-imx27.c:353:41: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Clark Wang <xiaoning.wang@nxp.com>
CC: "Uwe Kleine-König" <ukleinek@kernel.org>
CC: Jun Li <jun.li@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   211ddde0823f1442e4ad052a2f30f050145ccada
commit: a25351e4c7740eb22561a3ee4ef17611c6f410b0 pwm: imx27: Workaround of the pwm output bug when decrease the duty cycle
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: powerpc64-randconfig-r132-20251020 (https://download.01.org/0day-ci/archive/20251020/202510202357.PRIj4qyl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510202357.PRIj4qyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510202357.PRIj4qyl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-imx27.c:353:41: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/pwm/pwm-imx27.c:353:30: sparse: signed value source
   drivers/pwm/pwm-imx27.c:354:40: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/pwm/pwm-imx27.c:354:29: sparse: signed value source

vim +353 drivers/pwm/pwm-imx27.c

a058cbc1790110 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-06-19  219  
d80f8206905c1a drivers/pwm/pwm-imx27.c Uwe Kleine-König 2019-01-07  220  static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
71523d1812aca6 drivers/pwm/pwm-imx27.c Uwe Kleine-König 2019-08-24  221  			   const struct pwm_state *state)
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  222  {
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  223  	unsigned long period_cycles, duty_cycles, prescale, period_us, tmp;
d80f8206905c1a drivers/pwm/pwm-imx27.c Uwe Kleine-König 2019-01-07  224  	struct pwm_imx27_chip *imx = to_pwm_imx27_chip(chip);
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  225  	unsigned long long c;
aef1a3799b5cb3 drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-04-16  226  	unsigned long long clkrate;
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  227  	unsigned long flags;
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  228  	int val;
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  229  	int ret;
326ed314fefebb drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  230  	u32 cr;
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  231  
aef1a3799b5cb3 drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-04-16  232  	clkrate = clk_get_rate(imx->clk_per);
aef1a3799b5cb3 drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-04-16  233  	c = clkrate * state->period;
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  234  
aef1a3799b5cb3 drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-04-16  235  	do_div(c, NSEC_PER_SEC);
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  236  	period_cycles = c;
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  237  
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  238  	prescale = period_cycles / 0x10000 + 1;
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  239  
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  240  	period_cycles /= prescale;
aef1a3799b5cb3 drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-04-16  241  	c = clkrate * state->duty_cycle;
1ce65396e6b238 drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-12-07  242  	do_div(c, NSEC_PER_SEC);
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  243  	duty_cycles = c;
1ce65396e6b238 drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-12-07  244  	duty_cycles /= prescale;
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  245  
5776ac2eb33164 arch/arm/plat-mxc/pwm.c Jason Chen       2011-12-19  246  	/*
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  247  	 * according to imx pwm RM, the real period value should be PERIOD
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  248  	 * value in PWMPR plus 2.
5776ac2eb33164 arch/arm/plat-mxc/pwm.c Jason Chen       2011-12-19  249  	 */
5776ac2eb33164 arch/arm/plat-mxc/pwm.c Jason Chen       2011-12-19  250  	if (period_cycles > 2)
5776ac2eb33164 arch/arm/plat-mxc/pwm.c Jason Chen       2011-12-19  251  		period_cycles -= 2;
5776ac2eb33164 arch/arm/plat-mxc/pwm.c Jason Chen       2011-12-19  252  	else
5776ac2eb33164 arch/arm/plat-mxc/pwm.c Jason Chen       2011-12-19  253  		period_cycles = 0;
5776ac2eb33164 arch/arm/plat-mxc/pwm.c Jason Chen       2011-12-19  254  
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  255  	/*
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  256  	 * Wait for a free FIFO slot if the PWM is already enabled, and flush
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  257  	 * the FIFO if the PWM was disabled and is about to be enabled.
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  258  	 */
1706175c682fdb drivers/pwm/pwm-imx27.c Uwe Kleine-König 2024-01-26  259  	if (pwm->state.enabled) {
d80f8206905c1a drivers/pwm/pwm-imx27.c Uwe Kleine-König 2019-01-07  260  		pwm_imx27_wait_fifo_slot(chip, pwm);
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  261  	} else {
aad4e530c241cb drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-02-10  262  		ret = pwm_imx27_clk_prepare_enable(imx);
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  263  		if (ret)
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  264  			return ret;
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  265  
d80f8206905c1a drivers/pwm/pwm-imx27.c Uwe Kleine-König 2019-01-07  266  		pwm_imx27_sw_reset(chip);
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  267  	}
0ca1a11a1d816c drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  268  
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  269  	val = readl(imx->mmio_base + MX3_PWMPR);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  270  	val = val >= MX3_PWMPR_MAX ? MX3_PWMPR_MAX : val;
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  271  	cr = readl(imx->mmio_base + MX3_PWMCR);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  272  	tmp = NSEC_PER_SEC * (u64)(val + 2) * MX3_PWMCR_PRESCALER_GET(cr);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  273  	tmp = DIV_ROUND_UP_ULL(tmp, clkrate);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  274  	period_us = DIV_ROUND_UP_ULL(tmp, 1000);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  275  
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  276  	/*
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  277  	 * ERR051198:
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  278  	 * PWM: PWM output may not function correctly if the FIFO is empty when
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  279  	 * a new SAR value is programmed
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  280  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  281  	 * Description:
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  282  	 * When the PWM FIFO is empty, a new value programmed to the PWM Sample
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  283  	 * register (PWM_PWMSAR) will be directly applied even if the current
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  284  	 * timer period has not expired.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  285  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  286  	 * If the new SAMPLE value programmed in the PWM_PWMSAR register is
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  287  	 * less than the previous value, and the PWM counter register
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  288  	 * (PWM_PWMCNR) that contains the current COUNT value is greater than
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  289  	 * the new programmed SAMPLE value, the current period will not flip
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  290  	 * the level. This may result in an output pulse with a duty cycle of
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  291  	 * 100%.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  292  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  293  	 * Consider a change from
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  294  	 *     ________
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  295  	 *    /        \______/
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  296  	 *    ^      *        ^
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  297  	 * to
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  298  	 *     ____
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  299  	 *    /    \__________/
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  300  	 *    ^               ^
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  301  	 * At the time marked by *, the new write value will be directly applied
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  302  	 * to SAR even the current period is not over if FIFO is empty.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  303  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  304  	 *     ________        ____________________
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  305  	 *    /        \______/                    \__________/
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  306  	 *    ^               ^      *        ^               ^
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  307  	 *    |<-- old SAR -->|               |<-- new SAR -->|
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  308  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  309  	 * That is the output is active for a whole period.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  310  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  311  	 * Workaround:
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  312  	 * Check new SAR less than old SAR and current counter is in errata
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  313  	 * windows, write extra old SAR into FIFO and new SAR will effect at
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  314  	 * next period.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  315  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  316  	 * Sometime period is quite long, such as over 1 second. If add old SAR
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  317  	 * into FIFO unconditional, new SAR have to wait for next period. It
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  318  	 * may be too long.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  319  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  320  	 * Turn off the interrupt to ensure that not IRQ and schedule happen
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  321  	 * during above operations. If any irq and schedule happen, counter
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  322  	 * in PWM will be out of data and take wrong action.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  323  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  324  	 * Add a safety margin 1.5us because it needs some time to complete
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  325  	 * IO write.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  326  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  327  	 * Use writel_relaxed() to minimize the interval between two writes to
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  328  	 * the SAR register to increase the fastest PWM frequency supported.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  329  	 *
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  330  	 * When the PWM period is longer than 2us(or <500kHz), this workaround
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  331  	 * can solve this problem. No software workaround is available if PWM
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  332  	 * period is shorter than IO write. Just try best to fill old data
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  333  	 * into FIFO.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  334  	 */
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  335  	c = clkrate * 1500;
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  336  	do_div(c, NSEC_PER_SEC);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  337  
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  338  	local_irq_save(flags);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  339  	val = FIELD_GET(MX3_PWMSR_FIFOAV, readl_relaxed(imx->mmio_base + MX3_PWMSR));
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  340  
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  341  	if (duty_cycles < imx->duty_cycle && (cr & MX3_PWMCR_EN)) {
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  342  		if (period_us < 2) { /* 2us = 500 kHz */
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  343  			/* Best effort attempt to fix up >500 kHz case */
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  344  			udelay(3 * period_us);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  345  			writel_relaxed(imx->duty_cycle, imx->mmio_base + MX3_PWMSAR);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  346  			writel_relaxed(imx->duty_cycle, imx->mmio_base + MX3_PWMSAR);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  347  		} else if (val < MX3_PWMSR_FIFOAV_2WORDS) {
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  348  			val = readl_relaxed(imx->mmio_base + MX3_PWMCNR);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  349  			/*
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  350  			 * If counter is close to period, controller may roll over when
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  351  			 * next IO write.
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  352  			 */
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08 @353  			if ((val + c >= duty_cycles && val < imx->duty_cycle) ||
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  354  			    val + c >= period_cycles)
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  355  				writel_relaxed(imx->duty_cycle, imx->mmio_base + MX3_PWMSAR);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  356  		}
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  357  	}
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  358  	writel_relaxed(duty_cycles, imx->mmio_base + MX3_PWMSAR);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  359  	local_irq_restore(flags);
a25351e4c7740e drivers/pwm/pwm-imx27.c Clark Wang       2024-10-08  360  
29693248edf108 drivers/pwm/pwm-imx.c   Sascha Hauer     2012-03-15  361  	writel(period_cycles, imx->mmio_base + MX3_PWMPR);
a058cbc1790110 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-06-19  362  
a3597d6c89d70f drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  363  	/*
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  364  	 * Store the duty cycle for future reference in cases where the
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  365  	 * MX3_PWMSAR register can't be read (i.e. when the PWM is disabled).
a3597d6c89d70f drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  366  	 */
a3597d6c89d70f drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  367  	imx->duty_cycle = duty_cycles;
a3597d6c89d70f drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  368  
9f617ada9f823d drivers/pwm/pwm-imx.c   Michal Vokáč     2018-10-01  369  	cr = MX3_PWMCR_PRESCALER_SET(prescale) |
9f617ada9f823d drivers/pwm/pwm-imx.c   Michal Vokáč     2018-10-01  370  	     MX3_PWMCR_STOPEN | MX3_PWMCR_DOZEN | MX3_PWMCR_WAITEN |
9f617ada9f823d drivers/pwm/pwm-imx.c   Michal Vokáč     2018-10-01  371  	     FIELD_PREP(MX3_PWMCR_CLKSRC, MX3_PWMCR_CLKSRC_IPG_HIGH) |
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  372  	     MX3_PWMCR_DBGEN;
66ad6a613abeee drivers/pwm/pwm-imx.c   Sascha Hauer     2012-08-28  373  
326ed314fefebb drivers/pwm/pwm-imx.c   Lukasz Majewski  2017-01-29  374  	if (state->polarity == PWM_POLARITY_INVERSED)
9f617ada9f823d drivers/pwm/pwm-imx.c   Michal Vokáč     2018-10-01  375  		cr |= FIELD_PREP(MX3_PWMCR_POUTC,
9f617ada9f823d drivers/pwm/pwm-imx.c   Michal Vokáč     2018-10-01  376  				MX3_PWMCR_POUTC_INVERTED);
a058cbc1790110 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-06-19  377  
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  378  	if (state->enabled)
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  379  		cr |= MX3_PWMCR_EN;
bd88d319abe9a4 drivers/pwm/pwm-imx27.c Thierry Reding   2019-10-17  380  
29693248edf108 drivers/pwm/pwm-imx.c   Sascha Hauer     2012-03-15  381  	writel(cr, imx->mmio_base + MX3_PWMCR);
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  382  
15d4dbd6015918 drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-02-09  383  	if (!state->enabled)
aad4e530c241cb drivers/pwm/pwm-imx27.c Uwe Kleine-König 2020-02-10  384  		pwm_imx27_clk_disable_unprepare(imx);
19e73333236a61 drivers/pwm/pwm-imx.c   Sascha Hauer     2012-07-03  385  
140827c148f2f3 drivers/pwm/pwm-imx.c   Sascha Hauer     2012-08-28  386  	return 0;
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  387  }
166091b1894df3 arch/arm/plat-mxc/pwm.c Sascha Hauer     2009-01-16  388  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
