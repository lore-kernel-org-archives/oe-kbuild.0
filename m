Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401463033E1
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 01:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783646384; cv=none; b=nmrxJIXy8tRI8pdJHyDpKbD7bcEvIxiiv1V3pEB32nVNrB6DQi9iD/1Crsui23aPCkVdUzPN4hcuzY4O2RSRY+iDYIylz2vsgcEAn+xJFBxV+hhsHle/9UaG4ywwcueZiGTinx0mx0ltf6/hrPRa+JRriy8foA06Y6JkYUS51Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783646384; c=relaxed/simple;
	bh=jEAGfB9RaUa4EihxYXiPujMdmGJ5pIWTGylONW4U16g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eCl6LN6HfpozFYvKdq5dfesWIV4x4iVC4foRqhrwctb7+FeJL6sqktLD0a13v7uwfJGJSzeS5+piUHezfvL4QwKkuFsIXbxw7XQs1mFyrxaMdYaPN59npcVzX/yuQv/YRvMq5L3NRqcyVeRAnqwTgoKi+dX69onJ1F0o7mSdNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeYyg9qc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeYyg9qc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783646382; x=1815182382;
  h=date:from:to:cc:subject:message-id;
  bh=jEAGfB9RaUa4EihxYXiPujMdmGJ5pIWTGylONW4U16g=;
  b=YeYyg9qcs419X/4nWrOYc1Mk4qQEhuEdWjyzfPw/ttn1IWJMRk2HPQCG
   rCBYMaECqHwi9xu3g7H2vvyEsApnsi9yXNvKoGpDbEasCttfNFvFiF5QK
   i2F7EmEBY9q8wjYi49JUsm3U57r82c8YWpKxp9mU9M5NWowXDCOnUQi0e
   dmIIYk+HtGL8qBwi4hcZ8yPPxPA//b1PqddhSnopxvg5WD5klr+C2t/S5
   2WEzk41uJUyVkE0IdO4SmjPc7hbM2tU0B0kgJCV2+KlvNFkEyhVe7w2b1
   Ry/f1wXWnHYzYUA2HrEdEQtea2z9AhrF74DjXJD6/e6Wiw5fT7TxFY4Uw
   Q==;
X-CSE-ConnectionGUID: 34oYT/erSd22cB9SCR+HYQ==
X-CSE-MsgGUID: XhfL7Yt2Q3qjBxmVyd146A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83322739"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83322739"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 18:19:41 -0700
X-CSE-ConnectionGUID: 0FBq22NPQjykDXk40XeSrQ==
X-CSE-MsgGUID: IBaRAU+aTUG7fqRxoZ72/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253008940"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2026 18:19:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whztw-00000000ILa-0UfV;
	Fri, 10 Jul 2026 01:19:36 +0000
Date: Fri, 10 Jul 2026 09:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [qcom:clk-for-7.3 13/20] drivers/clk/qcom/gdsc.c:505
 gdsc_init() warn: missing unwind goto?
Message-ID: <202607100920.CUtNXkZl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Herman van Hazendonk <github.com@herrie.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-for-7.3
head:   d8638610e0c9ebab2800b7ad6c2c2a3737090da9
commit: eea55fc694e132aacbe2cf4be7f345115e3d1801 [13/20] clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-randconfig-r072-20260709 (https://download.01.org/0day-ci/archive/20260710/202607100920.CUtNXkZl-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607100920.CUtNXkZl-lkp@intel.com/

smatch warnings:
drivers/clk/qcom/gdsc.c:505 gdsc_init() warn: missing unwind goto?

vim +505 drivers/clk/qcom/gdsc.c

f7ccdaad612a09 Jagadeesh Kona       2024-06-24  428  
45dd0e55317ccb Stephen Boyd         2015-08-06  429  static int gdsc_init(struct gdsc *sc)
45dd0e55317ccb Stephen Boyd         2015-08-06  430  {
45dd0e55317ccb Stephen Boyd         2015-08-06  431  	u32 mask, val;
45dd0e55317ccb Stephen Boyd         2015-08-06  432  	int on, ret;
45dd0e55317ccb Stephen Boyd         2015-08-06  433  
45dd0e55317ccb Stephen Boyd         2015-08-06  434  	/*
45dd0e55317ccb Stephen Boyd         2015-08-06  435  	 * Disable HW trigger: collapse/restore occur based on registers writes.
45dd0e55317ccb Stephen Boyd         2015-08-06  436  	 * Disable SW override: Use hardware state-machine for sequencing.
45dd0e55317ccb Stephen Boyd         2015-08-06  437  	 * Configure wait time between states.
45dd0e55317ccb Stephen Boyd         2015-08-06  438  	 */
45dd0e55317ccb Stephen Boyd         2015-08-06  439  	mask = HW_CONTROL_MASK | SW_OVERRIDE_MASK |
45dd0e55317ccb Stephen Boyd         2015-08-06  440  	       EN_REST_WAIT_MASK | EN_FEW_WAIT_MASK | CLK_DIS_WAIT_MASK;
4e7c4d3652f96f Taniya Das           2022-02-24  441  
4e7c4d3652f96f Taniya Das           2022-02-24  442  	if (!sc->en_rest_wait_val)
4e7c4d3652f96f Taniya Das           2022-02-24  443  		sc->en_rest_wait_val = EN_REST_WAIT_VAL;
4e7c4d3652f96f Taniya Das           2022-02-24  444  	if (!sc->en_few_wait_val)
4e7c4d3652f96f Taniya Das           2022-02-24  445  		sc->en_few_wait_val = EN_FEW_WAIT_VAL;
4e7c4d3652f96f Taniya Das           2022-02-24  446  	if (!sc->clk_dis_wait_val)
4e7c4d3652f96f Taniya Das           2022-02-24  447  		sc->clk_dis_wait_val = CLK_DIS_WAIT_VAL;
4e7c4d3652f96f Taniya Das           2022-02-24  448  
4e7c4d3652f96f Taniya Das           2022-02-24  449  	val = sc->en_rest_wait_val << EN_REST_WAIT_SHIFT |
4e7c4d3652f96f Taniya Das           2022-02-24  450  		sc->en_few_wait_val << EN_FEW_WAIT_SHIFT |
4e7c4d3652f96f Taniya Das           2022-02-24  451  		sc->clk_dis_wait_val << CLK_DIS_WAIT_SHIFT;
4e7c4d3652f96f Taniya Das           2022-02-24  452  
45dd0e55317ccb Stephen Boyd         2015-08-06  453  	ret = regmap_update_bits(sc->regmap, sc->gdscr, mask, val);
45dd0e55317ccb Stephen Boyd         2015-08-06  454  	if (ret)
45dd0e55317ccb Stephen Boyd         2015-08-06  455  		return ret;
45dd0e55317ccb Stephen Boyd         2015-08-06  456  
3c53f5e2179874 Rajendra Nayak       2015-08-06  457  	/* Force gdsc ON if only ON state is supported */
3c53f5e2179874 Rajendra Nayak       2015-08-06  458  	if (sc->pwrsts == PWRSTS_ON) {
8b6af3b58cafc2 Akhil P Oommen       2023-01-02  459  		ret = gdsc_toggle_logic(sc, GDSC_ON, false);
3c53f5e2179874 Rajendra Nayak       2015-08-06  460  		if (ret)
3c53f5e2179874 Rajendra Nayak       2015-08-06  461  			return ret;
3c53f5e2179874 Rajendra Nayak       2015-08-06  462  	}
3c53f5e2179874 Rajendra Nayak       2015-08-06  463  
88051f55de5028 Stephen Boyd         2018-05-01  464  	on = gdsc_check_status(sc, GDSC_ON);
45dd0e55317ccb Stephen Boyd         2015-08-06  465  	if (on < 0)
45dd0e55317ccb Stephen Boyd         2015-08-06  466  		return on;
45dd0e55317ccb Stephen Boyd         2015-08-06  467  
9711759a87a041 Bjorn Andersson      2021-07-21  468  	if (on) {
9711759a87a041 Bjorn Andersson      2021-07-21  469  		/* The regulator must be on, sync the kernel state */
9711759a87a041 Bjorn Andersson      2021-07-21  470  		if (sc->rsupply) {
9711759a87a041 Bjorn Andersson      2021-07-21  471  			ret = regulator_enable(sc->rsupply);
9711759a87a041 Bjorn Andersson      2021-07-21  472  			if (ret < 0)
9711759a87a041 Bjorn Andersson      2021-07-21  473  				return ret;
9711759a87a041 Bjorn Andersson      2021-07-21  474  		}
9711759a87a041 Bjorn Andersson      2021-07-21  475  
a823bb9fbefbac Rajendra Nayak       2015-12-01  476  		/*
a823bb9fbefbac Rajendra Nayak       2015-12-01  477  		 * Votable GDSCs can be ON due to Vote from other masters.
a823bb9fbefbac Rajendra Nayak       2015-12-01  478  		 * If a Votable GDSC is ON, make sure we have a Vote.
a823bb9fbefbac Rajendra Nayak       2015-12-01  479  		 */
9711759a87a041 Bjorn Andersson      2021-07-21  480  		if (sc->flags & VOTABLE) {
e73cb8527c5975 Johan Hovold         2022-05-20  481  			ret = gdsc_update_collapse_bit(sc, false);
9711759a87a041 Bjorn Andersson      2021-07-21  482  			if (ret)
4cc47e8add6354 Stephen Boyd         2022-11-03  483  				goto err_disable_supply;
9711759a87a041 Bjorn Andersson      2021-07-21  484  		}
9711759a87a041 Bjorn Andersson      2021-07-21  485  
fda48bf5c86d88 Stephen Boyd         2020-10-16  486  		/*
9711759a87a041 Bjorn Andersson      2021-07-21  487  		 * Make sure the retain bit is set if the GDSC is already on,
9711759a87a041 Bjorn Andersson      2021-07-21  488  		 * otherwise we end up turning off the GDSC and destroying all
9711759a87a041 Bjorn Andersson      2021-07-21  489  		 * the register contents that we thought we were saving.
fda48bf5c86d88 Stephen Boyd         2020-10-16  490  		 */
9711759a87a041 Bjorn Andersson      2021-07-21  491  		if (sc->flags & RETAIN_FF_ENABLE)
fda48bf5c86d88 Stephen Boyd         2020-10-16  492  			gdsc_retain_ff_on(sc);
25708f73ff171b Taniya Das           2025-02-14  493  
25708f73ff171b Taniya Das           2025-02-14  494  		/* Turn on HW trigger mode if supported */
25708f73ff171b Taniya Das           2025-02-14  495  		if (sc->flags & HW_CTRL) {
25708f73ff171b Taniya Das           2025-02-14  496  			ret = gdsc_hwctrl(sc, true);
25708f73ff171b Taniya Das           2025-02-14  497  			if (ret < 0)
25708f73ff171b Taniya Das           2025-02-14  498  				goto err_disable_supply;
25708f73ff171b Taniya Das           2025-02-14  499  		}
25708f73ff171b Taniya Das           2025-02-14  500  
9711759a87a041 Bjorn Andersson      2021-07-21  501  	} else if (sc->flags & ALWAYS_ON) {
fb55bea1fe436b Rajendra Nayak       2018-03-23  502  		/* If ALWAYS_ON GDSCs are not ON, turn them ON */
eea55fc694e132 Herman van Hazendonk 2026-06-02  503  		ret = gdsc_enable(&sc->pd);
eea55fc694e132 Herman van Hazendonk 2026-06-02  504  		if (ret)
eea55fc694e132 Herman van Hazendonk 2026-06-02 @505  			return ret;
fb55bea1fe436b Rajendra Nayak       2018-03-23  506  		on = true;
fb55bea1fe436b Rajendra Nayak       2018-03-23  507  	}
fb55bea1fe436b Rajendra Nayak       2018-03-23  508  
014e193ccd197d Rajendra Nayak       2015-08-06  509  	if (on || (sc->pwrsts & PWRSTS_RET))
014e193ccd197d Rajendra Nayak       2015-08-06  510  		gdsc_force_mem_on(sc);
014e193ccd197d Rajendra Nayak       2015-08-06  511  	else
014e193ccd197d Rajendra Nayak       2015-08-06  512  		gdsc_clear_mem_on(sc);
014e193ccd197d Rajendra Nayak       2015-08-06  513  
9711759a87a041 Bjorn Andersson      2021-07-21  514  	if (sc->flags & ALWAYS_ON)
9711759a87a041 Bjorn Andersson      2021-07-21  515  		sc->pd.flags |= GENPD_FLAG_ALWAYS_ON;
7895861a963cfa Jordan Crouse        2018-11-26  516  	if (!sc->pd.power_off)
45dd0e55317ccb Stephen Boyd         2015-08-06  517  		sc->pd.power_off = gdsc_disable;
7895861a963cfa Jordan Crouse        2018-11-26  518  	if (!sc->pd.power_on)
45dd0e55317ccb Stephen Boyd         2015-08-06  519  		sc->pd.power_on = gdsc_enable;
f7ccdaad612a09 Jagadeesh Kona       2024-06-24  520  	if (sc->flags & HW_CTRL_TRIGGER) {
f7ccdaad612a09 Jagadeesh Kona       2024-06-24  521  		sc->pd.set_hwmode_dev = gdsc_set_hwmode;
f7ccdaad612a09 Jagadeesh Kona       2024-06-24  522  		sc->pd.get_hwmode_dev = gdsc_get_hwmode;
f7ccdaad612a09 Jagadeesh Kona       2024-06-24  523  	}
eab4c1ebdd6579 Johan Hovold         2022-09-29  524  
eab4c1ebdd6579 Johan Hovold         2022-09-29  525  	ret = pm_genpd_init(&sc->pd, NULL, !on);
eab4c1ebdd6579 Johan Hovold         2022-09-29  526  	if (ret)
4cc47e8add6354 Stephen Boyd         2022-11-03  527  		goto err_disable_supply;
45dd0e55317ccb Stephen Boyd         2015-08-06  528  
45dd0e55317ccb Stephen Boyd         2015-08-06  529  	return 0;
eab4c1ebdd6579 Johan Hovold         2022-09-29  530  
eab4c1ebdd6579 Johan Hovold         2022-09-29  531  err_disable_supply:
eab4c1ebdd6579 Johan Hovold         2022-09-29  532  	if (on && sc->rsupply)
eab4c1ebdd6579 Johan Hovold         2022-09-29  533  		regulator_disable(sc->rsupply);
eab4c1ebdd6579 Johan Hovold         2022-09-29  534  
eab4c1ebdd6579 Johan Hovold         2022-09-29  535  	return ret;
45dd0e55317ccb Stephen Boyd         2015-08-06  536  }
45dd0e55317ccb Stephen Boyd         2015-08-06  537  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
