Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F658199385
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 19:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730316756; cv=none; b=PUVWf/BiKwhP47bZ2+vsIJNeUWlNPLJtR/5nY/PyvCQ7cM4IIM3rlrjiJp+LrWXXYJ0xTDLs1PoAdR85YStQmNEgFlbutIT7OrgX+hcK0aQGd+pjLLwJGpmEHLpy+XF8CQzjZYOHw4aQT4qiiRnDoZbG8MHNJfY6TNybiU+s+Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730316756; c=relaxed/simple;
	bh=Xv44w3ccOTolbiwGXvvIHzVpkv7ELwQaZxIbXAIdHE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfE9LaG6hK/SD5neQvc/BQGAZeRPH72xctRFzBWy6SrV0SUajo5frhEt6JNyf/27xZQ9DfRcq8FqrCKBIK/Asa8mXHKMYYuv1Ic/rxnEDeCXUr8ZKajmk1A93aiOPUc0B1iJoa2Cms+xpFoEpHdrykSTf4WVLK9mik5DMmLeL24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfZah8ru; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfZah8ru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730316753; x=1761852753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xv44w3ccOTolbiwGXvvIHzVpkv7ELwQaZxIbXAIdHE0=;
  b=MfZah8ruJqy087M+2ROzsoStBHntg0N9em3csB3a0GpzzK/ljU/bTGsV
   ScHonQM/xfKe91fCEPT7SE8G6//0nZ0Gi9DwildpBppGmgFJUVfUgPtK/
   91p+g8MRFt4quS6NpUvkQRssITjbHfx6XWsWZIkNXgF6aYF4q4PK+OLPE
   TyN0n+AKx/pKyjaZxkHMUY1DQvst4ikVn+4ZBbeAfnzLzQMEV6j0ac7w/
   F13Ot98rpGvCktc0qTH6WfkAYAFLiTS+jLdDZCmBa2j61dCtHsGIjSZtE
   15DerFVji9IgSshkKwkw92e/oP6HUNgb62LR6E/KvddvTQcQ5q37nPZn6
   A==;
X-CSE-ConnectionGUID: 0iaNEgNPSuKnsHRIbnqQbg==
X-CSE-MsgGUID: rtGcP3KWR/y3SayAhAoLPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47514136"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="47514136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 12:32:32 -0700
X-CSE-ConnectionGUID: S8FIvJjyQSqqxXnus7QlAQ==
X-CSE-MsgGUID: LfwXyP91T7GUZxeHB3Tz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="113270470"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2024 12:32:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6EQe-000fEu-2M;
	Wed, 30 Oct 2024 19:32:28 +0000
Date: Thu, 31 Oct 2024 03:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/ice/ice_ptp_hw.c:396:4-22: opportunity
 for str_enabled_disabled(dw24 . ts_pll_enable)
Message-ID: <202410310330.8TPsnZiY-lkp@intel.com>
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
TO: Karol Kolacinski <karol.kolacinski@intel.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Przemek Kitszel <przemyslaw.kitszel@intel.com>
CC: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1e939a21eb111a6d6067b38e8e04b8809b64c4e
commit: b390ecc2e375f8973c512a5041a69555069f502a ice: Change CGU regs struct to anonymous
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: xtensa-randconfig-r054-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310330.8TPsnZiY-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410310330.8TPsnZiY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:396:4-22: opportunity for str_enabled_disabled(dw24 . ts_pll_enable)
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c:474:4-22: opportunity for str_enabled_disabled(dw24 . ts_pll_enable)

vim +396 drivers/net/ethernet/intel/ice/ice_ptp_hw.c

3a7496234d179a Jacob Keller       2021-10-13  336  
3a7496234d179a Jacob Keller       2021-10-13  337  /**
39ecb29df855ce Sergey Temerkhanov 2024-05-28  338   * ice_cfg_cgu_pll_e82x - Configure the Clock Generation Unit
d551d075b04382 Karol Kolacinski   2024-05-28  339   * @hw: pointer to the HW struct
39ecb29df855ce Sergey Temerkhanov 2024-05-28  340   * @clk_freq: Clock frequency to program
39ecb29df855ce Sergey Temerkhanov 2024-05-28  341   * @clk_src: Clock source to select (TIME_REF, or TCX0)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  342   *
39ecb29df855ce Sergey Temerkhanov 2024-05-28  343   * Configure the Clock Generation Unit with the desired clock frequency and
39ecb29df855ce Sergey Temerkhanov 2024-05-28  344   * time reference, enabling the PLL which drives the PTP hardware clock.
39ecb29df855ce Sergey Temerkhanov 2024-05-28  345   *
39ecb29df855ce Sergey Temerkhanov 2024-05-28  346   * Return:
39ecb29df855ce Sergey Temerkhanov 2024-05-28  347   * * %0       - success
39ecb29df855ce Sergey Temerkhanov 2024-05-28  348   * * %-EINVAL - input parameters are incorrect
39ecb29df855ce Sergey Temerkhanov 2024-05-28  349   * * %-EBUSY  - failed to lock TS PLL
39ecb29df855ce Sergey Temerkhanov 2024-05-28  350   * * %other   - CGU read/write failure
3a7496234d179a Jacob Keller       2021-10-13  351   */
39ecb29df855ce Sergey Temerkhanov 2024-05-28  352  static int ice_cfg_cgu_pll_e82x(struct ice_hw *hw,
39ecb29df855ce Sergey Temerkhanov 2024-05-28  353  				enum ice_time_ref_freq clk_freq,
39ecb29df855ce Sergey Temerkhanov 2024-05-28  354  				enum ice_clk_src clk_src)
3a7496234d179a Jacob Keller       2021-10-13  355  {
39ecb29df855ce Sergey Temerkhanov 2024-05-28  356  	union tspll_ro_bwm_lf bwm_lf;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  357  	union nac_cgu_dword19 dw19;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  358  	union nac_cgu_dword22 dw22;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  359  	union nac_cgu_dword24 dw24;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  360  	union nac_cgu_dword9 dw9;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  361  	int err;
3a7496234d179a Jacob Keller       2021-10-13  362  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  363  	if (clk_freq >= NUM_ICE_TIME_REF_FREQ) {
39ecb29df855ce Sergey Temerkhanov 2024-05-28  364  		dev_warn(ice_hw_to_dev(hw), "Invalid TIME_REF frequency %u\n",
39ecb29df855ce Sergey Temerkhanov 2024-05-28  365  			 clk_freq);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  366  		return -EINVAL;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  367  	}
3a7496234d179a Jacob Keller       2021-10-13  368  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  369  	if (clk_src >= NUM_ICE_CLK_SRC) {
39ecb29df855ce Sergey Temerkhanov 2024-05-28  370  		dev_warn(ice_hw_to_dev(hw), "Invalid clock source %u\n",
39ecb29df855ce Sergey Temerkhanov 2024-05-28  371  			 clk_src);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  372  		return -EINVAL;
3a7496234d179a Jacob Keller       2021-10-13  373  	}
3a7496234d179a Jacob Keller       2021-10-13  374  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  375  	if (clk_src == ICE_CLK_SRC_TCX0 &&
39ecb29df855ce Sergey Temerkhanov 2024-05-28  376  	    clk_freq != ICE_TIME_REF_FREQ_25_000) {
39ecb29df855ce Sergey Temerkhanov 2024-05-28  377  		dev_warn(ice_hw_to_dev(hw),
39ecb29df855ce Sergey Temerkhanov 2024-05-28  378  			 "TCX0 only supports 25 MHz frequency\n");
39ecb29df855ce Sergey Temerkhanov 2024-05-28  379  		return -EINVAL;
3a7496234d179a Jacob Keller       2021-10-13  380  	}
3a7496234d179a Jacob Keller       2021-10-13  381  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  382  	err = ice_read_cgu_reg_e82x(hw, NAC_CGU_DWORD9, &dw9.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  383  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  384  		return err;
3a7496234d179a Jacob Keller       2021-10-13  385  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  386  	err = ice_read_cgu_reg_e82x(hw, NAC_CGU_DWORD24, &dw24.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  387  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  388  		return err;
3a7496234d179a Jacob Keller       2021-10-13  389  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  390  	err = ice_read_cgu_reg_e82x(hw, TSPLL_RO_BWM_LF, &bwm_lf.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  391  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  392  		return err;
3a7496234d179a Jacob Keller       2021-10-13  393  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  394  	/* Log the current clock configuration */
39ecb29df855ce Sergey Temerkhanov 2024-05-28  395  	ice_debug(hw, ICE_DBG_PTP, "Current CGU configuration -- %s, clk_src %s, clk_freq %s, PLL %s\n",
b390ecc2e375f8 Karol Kolacinski   2024-05-28 @396  		  dw24.ts_pll_enable ? "enabled" : "disabled",
b390ecc2e375f8 Karol Kolacinski   2024-05-28  397  		  ice_clk_src_str(dw24.time_ref_sel),
b390ecc2e375f8 Karol Kolacinski   2024-05-28  398  		  ice_clk_freq_str(dw9.time_ref_freq_sel),
b390ecc2e375f8 Karol Kolacinski   2024-05-28  399  		  bwm_lf.plllock_true_lock_cri ? "locked" : "unlocked");
3a7496234d179a Jacob Keller       2021-10-13  400  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  401  	/* Disable the PLL before changing the clock source or frequency */
b390ecc2e375f8 Karol Kolacinski   2024-05-28  402  	if (dw24.ts_pll_enable) {
b390ecc2e375f8 Karol Kolacinski   2024-05-28  403  		dw24.ts_pll_enable = 0;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  404  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  405  		err = ice_write_cgu_reg_e82x(hw, NAC_CGU_DWORD24, dw24.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  406  		if (err)
3a7496234d179a Jacob Keller       2021-10-13  407  			return err;
3a7496234d179a Jacob Keller       2021-10-13  408  	}
3a7496234d179a Jacob Keller       2021-10-13  409  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  410  	/* Set the frequency */
b390ecc2e375f8 Karol Kolacinski   2024-05-28  411  	dw9.time_ref_freq_sel = clk_freq;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  412  	err = ice_write_cgu_reg_e82x(hw, NAC_CGU_DWORD9, dw9.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  413  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  414  		return err;
3a7496234d179a Jacob Keller       2021-10-13  415  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  416  	/* Configure the TS PLL feedback divisor */
39ecb29df855ce Sergey Temerkhanov 2024-05-28  417  	err = ice_read_cgu_reg_e82x(hw, NAC_CGU_DWORD19, &dw19.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  418  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  419  		return err;
3a7496234d179a Jacob Keller       2021-10-13  420  
b390ecc2e375f8 Karol Kolacinski   2024-05-28  421  	dw19.tspll_fbdiv_intgr = e822_cgu_params[clk_freq].feedback_div;
b390ecc2e375f8 Karol Kolacinski   2024-05-28  422  	dw19.tspll_ndivratio = 1;
3a7496234d179a Jacob Keller       2021-10-13  423  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  424  	err = ice_write_cgu_reg_e82x(hw, NAC_CGU_DWORD19, dw19.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  425  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  426  		return err;
3a7496234d179a Jacob Keller       2021-10-13  427  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  428  	/* Configure the TS PLL post divisor */
39ecb29df855ce Sergey Temerkhanov 2024-05-28  429  	err = ice_read_cgu_reg_e82x(hw, NAC_CGU_DWORD22, &dw22.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  430  	if (err)
3a7496234d179a Jacob Keller       2021-10-13  431  		return err;
3a7496234d179a Jacob Keller       2021-10-13  432  
b390ecc2e375f8 Karol Kolacinski   2024-05-28  433  	dw22.time1588clk_div = e822_cgu_params[clk_freq].post_pll_div;
b390ecc2e375f8 Karol Kolacinski   2024-05-28  434  	dw22.time1588clk_sel_div2 = 0;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  435  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  436  	err = ice_write_cgu_reg_e82x(hw, NAC_CGU_DWORD22, dw22.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  437  	if (err)
3a7496234d179a Jacob Keller       2021-10-13  438  		return err;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  439  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  440  	/* Configure the TS PLL pre divisor and clock source */
39ecb29df855ce Sergey Temerkhanov 2024-05-28  441  	err = ice_read_cgu_reg_e82x(hw, NAC_CGU_DWORD24, &dw24.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  442  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  443  		return err;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  444  
b390ecc2e375f8 Karol Kolacinski   2024-05-28  445  	dw24.ref1588_ck_div = e822_cgu_params[clk_freq].refclk_pre_div;
b390ecc2e375f8 Karol Kolacinski   2024-05-28  446  	dw24.tspll_fbdiv_frac = e822_cgu_params[clk_freq].frac_n_div;
b390ecc2e375f8 Karol Kolacinski   2024-05-28  447  	dw24.time_ref_sel = clk_src;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  448  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  449  	err = ice_write_cgu_reg_e82x(hw, NAC_CGU_DWORD24, dw24.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  450  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  451  		return err;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  452  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  453  	/* Finally, enable the PLL */
b390ecc2e375f8 Karol Kolacinski   2024-05-28  454  	dw24.ts_pll_enable = 1;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  455  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  456  	err = ice_write_cgu_reg_e82x(hw, NAC_CGU_DWORD24, dw24.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  457  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  458  		return err;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  459  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  460  	/* Wait to verify if the PLL locks */
39ecb29df855ce Sergey Temerkhanov 2024-05-28  461  	usleep_range(1000, 5000);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  462  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  463  	err = ice_read_cgu_reg_e82x(hw, TSPLL_RO_BWM_LF, &bwm_lf.val);
39ecb29df855ce Sergey Temerkhanov 2024-05-28  464  	if (err)
39ecb29df855ce Sergey Temerkhanov 2024-05-28  465  		return err;
39ecb29df855ce Sergey Temerkhanov 2024-05-28  466  
b390ecc2e375f8 Karol Kolacinski   2024-05-28  467  	if (!bwm_lf.plllock_true_lock_cri) {
39ecb29df855ce Sergey Temerkhanov 2024-05-28  468  		dev_warn(ice_hw_to_dev(hw), "CGU PLL failed to lock\n");
39ecb29df855ce Sergey Temerkhanov 2024-05-28  469  		return -EBUSY;
3a7496234d179a Jacob Keller       2021-10-13  470  	}
3a7496234d179a Jacob Keller       2021-10-13  471  
39ecb29df855ce Sergey Temerkhanov 2024-05-28  472  	/* Log the current clock configuration */
39ecb29df855ce Sergey Temerkhanov 2024-05-28  473  	ice_debug(hw, ICE_DBG_PTP, "New CGU configuration -- %s, clk_src %s, clk_freq %s, PLL %s\n",
b390ecc2e375f8 Karol Kolacinski   2024-05-28  474  		  dw24.ts_pll_enable ? "enabled" : "disabled",
b390ecc2e375f8 Karol Kolacinski   2024-05-28  475  		  ice_clk_src_str(dw24.time_ref_sel),
b390ecc2e375f8 Karol Kolacinski   2024-05-28  476  		  ice_clk_freq_str(dw9.time_ref_freq_sel),
b390ecc2e375f8 Karol Kolacinski   2024-05-28  477  		  bwm_lf.plllock_true_lock_cri ? "locked" : "unlocked");
3a7496234d179a Jacob Keller       2021-10-13  478  
3a7496234d179a Jacob Keller       2021-10-13  479  	return 0;
3a7496234d179a Jacob Keller       2021-10-13  480  }
3a7496234d179a Jacob Keller       2021-10-13  481  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
