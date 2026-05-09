Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA07A37EFE8
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 21:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778360972; cv=none; b=OnMwIyGuyLTeYP93daRJvtF+bv8+mT85KUAcyBkwCDcEFsTLDKNsByCPh4u7B+w/VqiFl0xsaCwK1HsRclQ3guf/7Nuvjim5XpcKmqLe3nMyh8dnJcVcc204byF1q0b76rcAUVxy4+kOjYH9ITmak4putjN5gVnP7MQl9TflhPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778360972; c=relaxed/simple;
	bh=Mte3zL3qMzQrtZq1pGTl6Uma/oRwDu2e2LYENc8XS10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YgWgMYYN6AuP2g7dHUjirqKp1QRVPJYcHTclFgcmfvWgs4rZMrMNPDsNJ3l3BAavVHlidz2J2OOoo6gewCMCYlDkjKdNGEzluueerOTX0Eyl80UoI8M2b/jk3far7IWHhtelJ2J3VDQpMwA3l3zw4NZoOMdBoNUajzk4/kqflAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPBMNv0i; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPBMNv0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778360970; x=1809896970;
  h=date:from:to:cc:subject:message-id;
  bh=Mte3zL3qMzQrtZq1pGTl6Uma/oRwDu2e2LYENc8XS10=;
  b=KPBMNv0ilkOoryd7kZHyFU1nayV5i508pgqU3rLq/FxFa5PaKSqHbEMM
   21/iXEhAYGuQKWZb5iHDpzRBgKDARgXZDV6Aj9QMDTdWezx2YHSID4PF2
   3iwnMHWJeh1ohLNVkdv4CYWyRjFXG7DnxOVp2GHULUsoZ1VBT2wJbnSqF
   UzWQWY8qwWpZYUE/aPMm9oEkq5x7+U2MDdNW93B71eLmUwfs4RvEKde5r
   SKi4HddemkMxbLbPwYw/tRzn+384GgrCt0fevV8X9XxKGZl8yknRq6Sxk
   mLJmphHVENqrBTqOE6RNXFChc6mXk123HK7SzVsn0HVgE24mCX/M3T8TD
   g==;
X-CSE-ConnectionGUID: heHYdjvxT+yTXDS4RzV4fg==
X-CSE-MsgGUID: jFwxallrTsKKrDIqDQmt/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79327896"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79327896"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 14:09:29 -0700
X-CSE-ConnectionGUID: TxL18sYVRyGoME/iS/TE5w==
X-CSE-MsgGUID: rhxDjWFXRVSKiow7cy+B6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="236102548"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 May 2026 14:09:27 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLovM-000000001Pt-3mdn;
	Sat, 09 May 2026 21:09:24 +0000
Date: Sun, 10 May 2026 05:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2646/4394]
 drivers/memory/tegra/tegra114-emc.c:520 tegra114_emc_prepare_timing_change()
 warn: variable dereferenced before check 'timing' (see line 515)
Message-ID: <202605100506.wJFmI6IM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Mikko Perttunen <mperttunen@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: dce208b5405f40c36320bb0ee07e9df8f7f2bea4 [2646/4394] memory: tegra: Add Tegra114 EMC driver
:::::: branch date: 32 hours ago
:::::: commit date: 5 days ago
config: um-randconfig-r072-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100506.wJFmI6IM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605100506.wJFmI6IM-lkp@intel.com/

smatch warnings:
drivers/memory/tegra/tegra114-emc.c:520 tegra114_emc_prepare_timing_change() warn: variable dereferenced before check 'timing' (see line 515)

vim +/timing +520 drivers/memory/tegra/tegra114-emc.c

dce208b5405f40 Svyatoslav Ryhel 2026-04-27  506  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  507  static int tegra114_emc_prepare_timing_change(struct tegra_emc *emc,
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  508  					      unsigned long rate)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  509  {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  510  	struct emc_timing *timing = tegra114_emc_find_timing(emc, rate);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  511  	struct emc_timing *last = &emc->last_timing;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  512  	enum emc_dll_change dll_change;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  513  	unsigned int pre_wait = 0;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  514  	u32 val, mask;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27 @515  	bool next_dll_enabled = !(timing->emc_mode_1 & 0x1);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  516  	bool last_dll_enabled = !(last->emc_mode_1 & 0x1);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  517  	bool update = false;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  518  	unsigned int i;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  519  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27 @520  	if (!timing)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  521  		return -ENOENT;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  522  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  523  	if (next_dll_enabled == last_dll_enabled)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  524  		dll_change = DLL_CHANGE_NONE;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  525  	else if (next_dll_enabled)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  526  		dll_change = DLL_CHANGE_ON;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  527  	else
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  528  		dll_change = DLL_CHANGE_OFF;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  529  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  530  	/* Clear CLKCHANGE_COMPLETE interrupts */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  531  	writel(EMC_INTSTATUS_CLKCHANGE_COMPLETE, emc->regs + EMC_INTSTATUS);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  532  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  533  	/* Disable dynamic self-refresh */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  534  	val = readl(emc->regs + EMC_CFG);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  535  	if (val & EMC_CFG_PWR_MASK) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  536  		val &= ~EMC_CFG_POWER_FEATURES_MASK;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  537  		writel(val, emc->regs + EMC_CFG);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  538  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  539  		pre_wait = 5;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  540  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  541  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  542  	/* Disable SEL_DPD_CTRL for clock change */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  543  	if (emc->dram_type == DRAM_TYPE_DDR3)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  544  		mask = EMC_SEL_DPD_CTRL_DDR3_MASK;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  545  	else
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  546  		mask = EMC_SEL_DPD_CTRL_MASK;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  547  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  548  	val = readl(emc->regs + EMC_SEL_DPD_CTRL);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  549  	if (val & mask) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  550  		val &= ~mask;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  551  		writel(val, emc->regs + EMC_SEL_DPD_CTRL);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  552  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  553  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  554  	/* Prepare DQ/DQS for clock change */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  555  	val = readl(emc->regs + EMC_XM2DQSPADCTRL2);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  556  	if (timing->emc_xm2dqspadctrl2 & EMC_XM2DQSPADCTRL2_VREF_ENABLE &&
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  557  	    !(val & EMC_XM2DQSPADCTRL2_VREF_ENABLE)) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  558  		val |= EMC_XM2DQSPADCTRL2_VREF_ENABLE;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  559  		update = true;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  560  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  561  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  562  	if (timing->emc_xm2dqspadctrl2 & EMC_XM2DQSPADCTRL2_RX_FT_REC_ENABLE &&
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  563  	    !(val & EMC_XM2DQSPADCTRL2_RX_FT_REC_ENABLE)) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  564  		val |= EMC_XM2DQSPADCTRL2_RX_FT_REC_ENABLE;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  565  		update = true;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  566  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  567  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  568  	if (update) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  569  		writel(val, emc->regs + EMC_XM2DQSPADCTRL2);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  570  		if (pre_wait < 30)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  571  			pre_wait = 30;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  572  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  573  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  574  	/* Wait to settle */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  575  	if (pre_wait) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  576  		emc_seq_update_timing(emc);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  577  		udelay(pre_wait);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  578  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  579  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  580  	/* Program CTT_TERM control */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  581  	if (last->emc_ctt_term_ctrl != timing->emc_ctt_term_ctrl) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  582  		emc_seq_disable_auto_cal(emc);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  583  		writel(timing->emc_ctt_term_ctrl,
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  584  		       emc->regs + EMC_CTT_TERM_CTRL);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  585  		emc_seq_update_timing(emc);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  586  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  587  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  588  	/* Program burst shadow registers */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  589  	for (i = 0; i < ARRAY_SIZE(timing->emc_burst_data); ++i)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  590  		writel(timing->emc_burst_data[i],
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  591  		       emc->regs + emc_burst_regs[i]);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  592  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  593  	writel(timing->emc_xm2dqspadctrl2, emc->regs + EMC_XM2DQSPADCTRL2);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  594  	writel(timing->emc_zcal_interval, emc->regs + EMC_ZCAL_INTERVAL);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  595  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  596  	tegra_mc_write_emem_configuration(emc->mc, timing->rate);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  597  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  598  	val = timing->emc_cfg & ~EMC_CFG_POWER_FEATURES_MASK;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  599  	emc_ccfifo_writel(emc, val, EMC_CFG);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  600  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  601  	/* Program AUTO_CAL_CONFIG */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  602  	if (timing->emc_auto_cal_config2 != last->emc_auto_cal_config2)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  603  		emc_ccfifo_writel(emc, timing->emc_auto_cal_config2,
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  604  				  EMC_AUTO_CAL_CONFIG2);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  605  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  606  	if (timing->emc_auto_cal_config3 != last->emc_auto_cal_config3)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  607  		emc_ccfifo_writel(emc, timing->emc_auto_cal_config3,
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  608  				  EMC_AUTO_CAL_CONFIG3);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  609  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  610  	if (timing->emc_auto_cal_config != last->emc_auto_cal_config) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  611  		val = timing->emc_auto_cal_config;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  612  		val &= EMC_AUTO_CAL_CONFIG_AUTO_CAL_START;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  613  		emc_ccfifo_writel(emc, val, EMC_AUTO_CAL_CONFIG);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  614  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  615  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  616  	/* DDR3: predict MRS long wait count */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  617  	if (emc->dram_type == DRAM_TYPE_DDR3 &&
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  618  	    dll_change == DLL_CHANGE_ON) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  619  		u32 cnt = 512;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  620  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  621  		if (timing->emc_zcal_interval != 0 &&
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  622  		    last->emc_zcal_interval == 0)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  623  			cnt -= emc->dram_num * 256;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  624  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  625  		val = (timing->emc_mrs_wait_cnt
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  626  			& EMC_MRS_WAIT_CNT_SHORT_WAIT_MASK)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  627  			>> EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  628  		if (cnt < val)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  629  			cnt = val;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  630  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  631  		val = timing->emc_mrs_wait_cnt
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  632  			& ~EMC_MRS_WAIT_CNT_LONG_WAIT_MASK;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  633  		val |= (cnt << EMC_MRS_WAIT_CNT_LONG_WAIT_SHIFT)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  634  			& EMC_MRS_WAIT_CNT_LONG_WAIT_MASK;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  635  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  636  		writel(val, emc->regs + EMC_MRS_WAIT_CNT);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  637  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  638  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  639  	/* DDR3: Turn off DLL and enter self-refresh */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  640  	if (emc->dram_type == DRAM_TYPE_DDR3 && dll_change == DLL_CHANGE_OFF)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  641  		emc_ccfifo_writel(emc, timing->emc_mode_1, EMC_EMRS);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  642  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  643  	/* Disable refresh controller */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  644  	emc_ccfifo_writel(emc, EMC_REFCTRL_DEV_SEL(emc->dram_num),
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  645  			  EMC_REFCTRL);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  646  	if (emc->dram_type == DRAM_TYPE_DDR3)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  647  		emc_ccfifo_writel(emc, EMC_DRAM_DEV_SEL(emc->dram_num) |
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  648  				       EMC_SELF_REF_CMD_ENABLED,
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  649  				  EMC_SELF_REF);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  650  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  651  	/* Flow control marker */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  652  	emc_ccfifo_writel(emc, 1, EMC_STALL_THEN_EXE_AFTER_CLKCHANGE);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  653  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  654  	/* DDR3: Exit self-refresh */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  655  	if (emc->dram_type == DRAM_TYPE_DDR3)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  656  		emc_ccfifo_writel(emc, EMC_DRAM_DEV_SEL(emc->dram_num),
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  657  				  EMC_SELF_REF);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  658  	emc_ccfifo_writel(emc, EMC_REFCTRL_DEV_SEL(emc->dram_num) |
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  659  			       EMC_REFCTRL_ENABLE,
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  660  			  EMC_REFCTRL);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  661  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  662  	/* Set DRAM mode registers */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  663  	if (emc->dram_type == DRAM_TYPE_DDR3) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  664  		if (timing->emc_mode_1 != last->emc_mode_1)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  665  			emc_ccfifo_writel(emc, timing->emc_mode_1, EMC_EMRS);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  666  		if (timing->emc_mode_2 != last->emc_mode_2)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  667  			emc_ccfifo_writel(emc, timing->emc_mode_2, EMC_EMRS2);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  668  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  669  		if (timing->emc_mode_reset != last->emc_mode_reset ||
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  670  		    dll_change == DLL_CHANGE_ON) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  671  			val = timing->emc_mode_reset;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  672  			if (dll_change == DLL_CHANGE_ON) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  673  				val |= EMC_MODE_SET_DLL_RESET;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  674  				val |= EMC_MODE_SET_LONG_CNT;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  675  			} else {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  676  				val &= ~EMC_MODE_SET_DLL_RESET;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  677  			}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  678  			emc_ccfifo_writel(emc, val, EMC_MRS);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  679  		}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  680  	} else {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  681  		if (timing->emc_mode_2 != last->emc_mode_2)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  682  			emc_ccfifo_writel(emc, timing->emc_mode_2, EMC_MRW2);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  683  		if (timing->emc_mode_1 != last->emc_mode_1)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  684  			emc_ccfifo_writel(emc, timing->emc_mode_1, EMC_MRW);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  685  		if (timing->emc_mode_4 != last->emc_mode_4)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  686  			emc_ccfifo_writel(emc, timing->emc_mode_4, EMC_MRW4);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  687  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  688  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  689  	/*  Issue ZCAL command if turning ZCAL on */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  690  	if (timing->emc_zcal_interval != 0 && last->emc_zcal_interval == 0) {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  691  		emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_ZQ_CAL);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  692  		if (emc->dram_num > 1)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  693  			emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV1,
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  694  					  EMC_ZQ_CAL);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  695  	}
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  696  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  697  	/*  Write to RO register to remove stall after change */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  698  	emc_ccfifo_writel(emc, 0, EMC_CCFIFO_STATUS);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  699  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  700  	/* Disable AUTO_CAL for clock change */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  701  	emc_seq_disable_auto_cal(emc);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  702  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  703  	/* Read register to wait until programming has settled */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  704  	mc_readl(emc->mc, MC_EMEM_ADR_CFG);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  705  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  706  	return 0;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  707  }
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  708  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
