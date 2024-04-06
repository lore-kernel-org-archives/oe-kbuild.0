Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E315537E2
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Apr 2024 22:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712442956; cv=none; b=NHbL9DzO8XbtxYozhN6ZOHzUPPkFH70Ed4yP52i5r4Nd37wyrYOmRD+YHzoF4Kbj6oxUBck+ZYPd1udOmMF6wbPJq6seyMpq2/QVIIuY69x7o9lG4abgd7XTa+n+1HXHK0sMsRK1PUDNIrdHxYCDo5CvzoVSYCwiUNdhDaNlObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712442956; c=relaxed/simple;
	bh=vTTdSd1JSzwem3C4ARNMRVVbSi6hXeAN3YpRREqW/mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MBt6IWpQ+fo6UWxri63rHghWALA8ljfd5SQyeLHXGVGETaZsL0UDOPMav+eng9ExEQZm2+nHfW4jxGwBIfpQYxGca8mDiHcP1xYmMUfszXdd3Acdhy219Qh16gjHTt7StuXfSJy+42T7mMmil6rAFads9AYx5qVycpo7ASUtIyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntX0t16e; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntX0t16e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712442954; x=1743978954;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vTTdSd1JSzwem3C4ARNMRVVbSi6hXeAN3YpRREqW/mQ=;
  b=ntX0t16eoNyEe1saD14fbArag7b6/3pgE40qB6ss6djwYQk5PrgebXEd
   ot5GLe3GKSl6EzSsCtri/UPKGL6LBlsN3Ou88RkJ4I5QcfXjXRoOkEBQ3
   zWhuX4fhcFyRXij2LiomM+CyW5MGEW+P08MAJQs/8H1nYzW5qPQJ3/2xJ
   EAcvvg9RVDMSa+kzT0QfiVnZvFOGpNgAuw5mRpyQuv3dPFnXNAzcnNKSM
   GxhQ+RvIf8gI1SxSp1hWuSOazqW7XMxWg5Oe+bLiZVNat39WYt18d7Wf8
   AavdMs0P81FBZcFjO3cC+3wZkQeFkEmT7kJMvGeSU8wwx0eY9oOJuxPHx
   Q==;
X-CSE-ConnectionGUID: iUUJ3YHNRj6Q+DgmqRjIfQ==
X-CSE-MsgGUID: 8C4zJ4+aSQyICMRsjk5plw==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="25251711"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="25251711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:35:52 -0700
X-CSE-ConnectionGUID: NY1LJygDRpSlMwHEC/VmKQ==
X-CSE-MsgGUID: a6Wh95IARiOjIQSH0pRurQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="42670575"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2024 15:35:51 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEdZ-0003ua-0S;
	Sat, 06 Apr 2024 22:35:49 +0000
Date: Sun, 7 Apr 2024 06:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pinctrl/nomadik/pinctrl-nomadik.c:966:1-7: preceding lock on
 line 900
Message-ID: <202404070655.nKBH4F8n-lkp@intel.com>
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
TO: "Théo Lebrun" <theo.lebrun@bootlin.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2f80ac809875855ac843f9e5e7480604b5cbff5
commit: ae82f5d2b18a6c6cd95f8896010b221780114cac pinctrl: nomadik: Kconfig: allow building with COMPILE_TEST
date:   5 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 weeks ago
config: hexagon-randconfig-r053-20240406 (https://download.01.org/0day-ci/archive/20240407/202404070655.nKBH4F8n-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404070655.nKBH4F8n-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:966:1-7: preceding lock on line 900

vim +966 drivers/pinctrl/nomadik/pinctrl-nomadik.c

dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  857  
03e9f0cac5da6a drivers/pinctrl/nomadik/pinctrl-nomadik.c Linus Walleij      2014-09-03  858  static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned function,
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  859  		       unsigned group)
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  860  {
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  861  	struct nmk_pinctrl *npct = pinctrl_dev_get_drvdata(pctldev);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  862  	const struct nmk_pingroup *g;
966942ae493650 drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  863  	static unsigned int slpm[NMK_MAX_BANKS];
f84b4171312a59 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2013-08-15  864  	unsigned long flags = 0;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  865  	bool glitch;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  866  	int ret = -EINVAL;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  867  	int i;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  868  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  869  	g = &npct->soc->groups[group];
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  870  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  871  	if (g->altsetting < 0)
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  872  		return -EINVAL;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  873  
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  874  	dev_dbg(npct->dev, "enable group %s, %u pins\n", g->grp.name, g->grp.npins);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  875  
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  876  	/*
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  877  	 * If we're setting altfunc C by setting both AFSLA and AFSLB to 1,
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  878  	 * we may pass through an undesired state. In this case we take
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  879  	 * some extra care.
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  880  	 *
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  881  	 * Safe sequence used to switch IOs between GPIO and Alternate-C mode:
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  882  	 *  - Save SLPM registers (since we have a shadow register in the
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  883  	 *    nmk_chip we're using that as backup)
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  884  	 *  - Set SLPM=0 for the IOs you want to switch and others to 1
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  885  	 *  - Configure the GPIO registers for the IOs that are being switched
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  886  	 *  - Set IOFORCE=1
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  887  	 *  - Modify the AFLSA/B registers for the IOs that are being switched
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  888  	 *  - Set IOFORCE=0
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  889  	 *  - Restore SLPM registers
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  890  	 *  - Any spurious wake up event during switch sequence to be ignored
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  891  	 *    and cleared
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  892  	 *
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  893  	 * We REALLY need to save ALL slpm registers, because the external
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  894  	 * IOFORCE will switch *all* ports to their sleepmode setting to as
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  895  	 * to avoid glitches. (Not just one port!)
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  896  	 */
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  897  	glitch = ((g->altsetting & NMK_GPIO_ALT_C) == NMK_GPIO_ALT_C);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  898  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  899  	if (glitch) {
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02 @900  		spin_lock_irqsave(&nmk_gpio_slpm_lock, flags);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  901  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  902  		/* Initially don't put any pins to sleep when switching */
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  903  		memset(slpm, 0xff, sizeof(slpm));
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  904  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  905  		/*
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  906  		 * Then mask the pins that need to be sleeping now when we're
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  907  		 * switching to the ALT C function.
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  908  		 */
53cf6b72e07486 drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  909  		for (i = 0; i < g->grp.npins; i++) {
53cf6b72e07486 drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  910  			unsigned int bit = g->grp.pins[i] % NMK_GPIO_PER_CHIP;
53cf6b72e07486 drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  911  			slpm[g->grp.pins[i] / NMK_GPIO_PER_CHIP] &= ~BIT(bit);
53cf6b72e07486 drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  912  		}
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  913  		nmk_gpio_glitch_slpm_init(slpm);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  914  	}
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  915  
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  916  	for (i = 0; i < g->grp.npins; i++) {
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  917  		struct nmk_gpio_chip *nmk_chip;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  918  		unsigned bit;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  919  
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  920  		nmk_chip = find_nmk_gpio_from_pin(g->grp.pins[i]);
6ca7d2e3525451 drivers/pinctrl/nomadik/pinctrl-nomadik.c Linus Walleij      2015-06-17  921  		if (!nmk_chip) {
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  922  			dev_err(npct->dev,
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  923  				"invalid pin offset %d in group %s at index %d\n",
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  924  				g->grp.pins[i], g->grp.name, i);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  925  			goto out_glitch;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  926  		}
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  927  		dev_dbg(npct->dev, "setting pin %d to altsetting %d\n", g->grp.pins[i], g->altsetting);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  928  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  929  		clk_enable(nmk_chip->clk);
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  930  		bit = g->grp.pins[i] % NMK_GPIO_PER_CHIP;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  931  		/*
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  932  		 * If the pin is switching to altfunc, and there was an
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  933  		 * interrupt installed on it which has been lazy disabled,
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  934  		 * actually mask the interrupt to prevent spurious interrupts
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  935  		 * that would occur while the pin is under control of the
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  936  		 * peripheral. Only SKE does this.
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  937  		 */
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  938  		nmk_gpio_disable_lazy_irq(nmk_chip, bit);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  939  
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  940  		__nmk_gpio_set_mode_safe(nmk_chip, bit,
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  941  			(g->altsetting & NMK_GPIO_ALT_C), glitch);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  942  		clk_disable(nmk_chip->clk);
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  943  
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  944  		/*
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  945  		 * Call PRCM GPIOCR config function in case ALTC
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  946  		 * has been selected:
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  947  		 * - If selection is a ALTCx, some bits in PRCM GPIOCR registers
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  948  		 *   must be set.
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  949  		 * - If selection is pure ALTC and previous selection was ALTCx,
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  950  		 *   then some bits in PRCM GPIOCR registers must be cleared.
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  951  		 */
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  952  		if ((g->altsetting & NMK_GPIO_ALT_C) == NMK_GPIO_ALT_C)
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  953  			nmk_prcm_altcx_set_mode(npct, g->grp.pins[i],
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  954  				g->altsetting >> NMK_GPIO_ALT_CX_SHIFT);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  955  	}
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  956  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  957  	/* When all pins are successfully reconfigured we get here */
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  958  	ret = 0;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  959  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  960  out_glitch:
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  961  	if (glitch) {
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  962  		nmk_gpio_glitch_slpm_restore(slpm);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  963  		spin_unlock_irqrestore(&nmk_gpio_slpm_lock, flags);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  964  	}
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  965  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02 @966  	return ret;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  967  }
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  968  

:::::: The code at line 966 was first introduced by commit
:::::: dbfe8ca259e1f899ca02ea33d903fa21bbea67c5 pinctrl/nomadik: implement pin multiplexing

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
