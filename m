Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1116279329
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 01:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774576317; cv=none; b=BLdG8pxqVfZTAzIAh0d57Qcg5T+HdCz9JRwkCAVPxgjHgBVjrqawny1ApZGwdcEMUonmKsyY8bLO4f+dwC4PYl4/bND8H27gUalOFMtgjec9yXxv+4QKlfd/NBgE16FgaFUaEY19EIaTzF6TYrwGzb+pBKl10Qbyy+qnE/Rs6D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774576317; c=relaxed/simple;
	bh=2NegYH4QBZCmtwDFHQK+uzaX5PBhxlvTQ8TkDvq01qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gs+zjMBguPnJjGWP9TNQb8EMX7eAIz/UNdJpoJ6S+mHqsOCTs8eXXFjifHU4cGqMXyITb0q674e2KA86WNHw5GhjkvpjHLs5eBUjMxPpxdlrIntK15yHqdUfmaT91bIUj9KprTB39goPxymmc3FRsS8g7S7JGw6dfoIbavZEM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRjObhlR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRjObhlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774576315; x=1806112315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2NegYH4QBZCmtwDFHQK+uzaX5PBhxlvTQ8TkDvq01qk=;
  b=FRjObhlRDBZ/Pfsj0MmZqsOff1Tm/LhLPDDcFt8oS3qtEVGqcX11xoLV
   Wl351o4szwHdPP0MwJkGFDE+FrI39gUNDF/HD+DCpbCzB9iFNmvm1lpu1
   w6Ad9U/hRwB4S3srQEXrO0Sd8k+/Qp030cz+tph2vOldaqO0hwqDBQMcc
   Jo+8iO9BaBRt1Ix2w/RpcBSR/ydsLhVU3mjYt9CosEGWa8Tuqr3yqhdaz
   lrE7lpxADGjuOUI1FItGuaxeV+K4vicoOTTPAAUAUlIDd8CspVZUq0jw7
   VM2x4epK/8OVSfdHvyUaBmYbB0yHplL5XZz+PhNNmAQf4cJHyawFTDvbV
   Q==;
X-CSE-ConnectionGUID: 5iDOX4E3RgK02O659RBRwg==
X-CSE-MsgGUID: uMYbCOJ4RLGRO0Vym7em2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75760867"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75760867"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 18:51:52 -0700
X-CSE-ConnectionGUID: jqY4Y1vYQmub7UoHHq74WQ==
X-CSE-MsgGUID: TR59ySk6QDOo+fzh9BrCUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="229954172"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 18:51:38 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5wMJ-000000009e5-0sJh;
	Fri, 27 Mar 2026 01:51:35 +0000
Date: Fri, 27 Mar 2026 09:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCHv2] firmware/tegra: add COMPILE_TEST
Message-ID: <202603270938.4x8EN1r4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/clk/tegra/clk-dfll.c:1721:61: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260324015722.12507-1-rosenp@gmail.com>
References: <20260324015722.12507-1-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: linux-tegra@vger.kernel.org
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Thierry Reding <thierry.reding@gmail.com>
CC: Jonathan Hunter <jonathanh@nvidia.com>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260325]
[cannot apply to tegra/for-next clk/clk-next drm-tegra/drm/tegra/for-next v7.0-rc5 v7.0-rc4 v7.0-rc3 linus/master v7.0-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/firmware-tegra-add-COMPILE_TEST/20260326-124230
base:   next-20260325
patch link:    https://lore.kernel.org/r/20260324015722.12507-1-rosenp%40gmail.com
patch subject: [PATCHv2] firmware/tegra: add COMPILE_TEST
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: mips-randconfig-r131-20260327 (https://download.01.org/0day-ci/archive/20260327/202603270938.4x8EN1r4-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270938.4x8EN1r4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603270938.4x8EN1r4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/tegra/clk-dfll.c:1721:61: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/clk/tegra/clk-dfll.c:1721:61: sparse: signed value source

vim +1721 drivers/clk/tegra/clk-dfll.c

36541f0499fe025 Joseph Lo        2019-01-04  1686  
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1687  /**
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1688   * dfll_build_i2c_lut - build the I2C voltage register lookup table
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1689   * @td: DFLL instance
36541f0499fe025 Joseph Lo        2019-01-04  1690   * @v_max: Vmax from OPP table
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1691   *
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1692   * The DFLL hardware has 33 bytes of look-up table RAM that must be filled with
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1693   * PMIC voltage register values that span the entire DFLL operating range.
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1694   * This function builds the look-up table based on the OPP table provided by
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1695   * the soc-specific platform driver (td->soc->opp_dev) and the PMIC
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1696   * register-to-voltage mapping queried from the regulator framework.
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1697   *
36541f0499fe025 Joseph Lo        2019-01-04  1698   * On success, fills in td->lut and returns 0, or -err on failure.
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1699   */
36541f0499fe025 Joseph Lo        2019-01-04  1700  static int dfll_build_i2c_lut(struct tegra_dfll *td, unsigned long v_max)
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1701  {
36541f0499fe025 Joseph Lo        2019-01-04  1702  	unsigned long rate, v, v_opp;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1703  	int ret = -EINVAL;
36541f0499fe025 Joseph Lo        2019-01-04  1704  	int j, selector, lut;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1705  
27ed2f7e7ca5c38 Thierry Reding   2016-04-08  1706  	v = td->soc->cvb->min_millivolts * 1000;
c5a132a84a692f8 Stephen Boyd     2015-08-25  1707  	lut = find_vdd_map_entry_exact(td, v);
c5a132a84a692f8 Stephen Boyd     2015-08-25  1708  	if (lut < 0)
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1709  		goto out;
36541f0499fe025 Joseph Lo        2019-01-04  1710  	td->lut[0] = lut;
36541f0499fe025 Joseph Lo        2019-01-04  1711  	td->lut_bottom = 0;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1712  
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1713  	for (j = 1, rate = 0; ; rate++) {
36541f0499fe025 Joseph Lo        2019-01-04  1714  		struct dev_pm_opp *opp;
36541f0499fe025 Joseph Lo        2019-01-04  1715  
62a8a094b0e1de7 Tuomas Tynkkynen 2015-05-13  1716  		opp = dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1717  		if (IS_ERR(opp))
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1718  			break;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1719  		v_opp = dev_pm_opp_get_voltage(opp);
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1720  
27ed2f7e7ca5c38 Thierry Reding   2016-04-08 @1721  		if (v_opp <= td->soc->cvb->min_millivolts * 1000)
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1722  			td->dvco_rate_min = dev_pm_opp_get_freq(opp);
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1723  
8a31d9d94297b1e Viresh Kumar     2017-01-23  1724  		dev_pm_opp_put(opp);
8a31d9d94297b1e Viresh Kumar     2017-01-23  1725  
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1726  		for (;;) {
36541f0499fe025 Joseph Lo        2019-01-04  1727  			v += max(1UL, (v_max - v) / (MAX_DFLL_VOLTAGES - j));
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1728  			if (v >= v_opp)
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1729  				break;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1730  
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1731  			selector = find_vdd_map_entry_min(td, v);
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1732  			if (selector < 0)
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1733  				goto out;
36541f0499fe025 Joseph Lo        2019-01-04  1734  			if (selector != td->lut[j - 1])
36541f0499fe025 Joseph Lo        2019-01-04  1735  				td->lut[j++] = selector;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1736  		}
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1737  
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1738  		v = (j == MAX_DFLL_VOLTAGES - 1) ? v_max : v_opp;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1739  		selector = find_vdd_map_entry_exact(td, v);
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1740  		if (selector < 0)
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1741  			goto out;
36541f0499fe025 Joseph Lo        2019-01-04  1742  		if (selector != td->lut[j - 1])
36541f0499fe025 Joseph Lo        2019-01-04  1743  			td->lut[j++] = selector;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1744  
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1745  		if (v >= v_max)
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1746  			break;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1747  	}
36541f0499fe025 Joseph Lo        2019-01-04  1748  	td->lut_size = j;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1749  
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1750  	if (!td->dvco_rate_min)
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1751  		dev_err(td->dev, "no opp above DFLL minimum voltage %d mV\n",
27ed2f7e7ca5c38 Thierry Reding   2016-04-08  1752  			td->soc->cvb->min_millivolts);
36541f0499fe025 Joseph Lo        2019-01-04  1753  	else {
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1754  		ret = 0;
36541f0499fe025 Joseph Lo        2019-01-04  1755  		for (j = 0; j < td->lut_size; j++)
36541f0499fe025 Joseph Lo        2019-01-04  1756  			td->lut_uv[j] =
36541f0499fe025 Joseph Lo        2019-01-04  1757  				regulator_list_voltage(td->vdd_reg,
36541f0499fe025 Joseph Lo        2019-01-04  1758  						       td->lut[j]);
36541f0499fe025 Joseph Lo        2019-01-04  1759  	}
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1760  
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1761  out:
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1762  	return ret;
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1763  }
c4fe70ada40f53e Tuomas Tynkkynen 2015-05-13  1764  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
