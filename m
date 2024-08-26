Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372181990C1
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Aug 2024 19:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724700089; cv=none; b=QzsTvjEzCA3zOtl2h5dkQ8wdgfgtMdJtffydOJNXVpW/guL9e6T+JkxZKf59cAzxw3mH/sSQ4igOOWiMi/IrNttLothl1UqC9KlgTS8JiotANU/uVff2u852DZz+I4L2qorsPYwAHQXmmbIDcJctUSz1S31p4Q7IKIJHteT4EXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724700089; c=relaxed/simple;
	bh=PWsyvzONNqnxJYCVG3OAgrI8nOmhoyIJr4l/3ALHyyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUItPcZ0u8H3+OjPwcGPlTANbzbVtiEMdkKcm+E0f9ZAwrUzL/goAyFBsO7LcMYOAhH6jXo5CPBET4XtR+5B6rA/GUEzHPTHiR+Guw9UqWc3qK7daT92qE4mukpkRNdFcTa7dnNf+ZIbtgvCnU6B3aCBMZtPtZ1VJhGiMMsfg6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1FvA+S+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1FvA+S+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724700088; x=1756236088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PWsyvzONNqnxJYCVG3OAgrI8nOmhoyIJr4l/3ALHyyU=;
  b=I1FvA+S+sYtNkU4uerXZSKNJ+qKR0nTkPEK93MuLU4zChuoi1W1iWV4Z
   2mnaEUCkyi7G5fSr6MMiOvFoe/Gps5okzinCsW0Qu82brZf9nfM1DSyzB
   wG/N1ZUK8z85SBCJ4HPL30edZxqpj3J43YxvRf1pvAOHFgLGojpGRSQz+
   jX7HePtMd/PouUp5TwS61PphI8QGYGho95bYIWquHuazUiJ5wZ4DhdGPh
   HwdnlT3BXQvDmqQ+xdBXBk6SHGcWUTlx7ZZQANh9OS+F2Rsk0oug6s4JO
   nfAfUbhNk96sqqbIc173ZGT7vowd6xH+WPcknQrziiQoyeccJnDjjx/KG
   Q==;
X-CSE-ConnectionGUID: 2WVQv1G7THKhy1yjvF7r+w==
X-CSE-MsgGUID: fLkt1XwSQWyICPXOtf/MOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23012349"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="23012349"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 12:21:27 -0700
X-CSE-ConnectionGUID: Srv0A60QRpWRsCAXMeFIUA==
X-CSE-MsgGUID: iDsCUUdYQISp3q9PzF6g6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62929084"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Aug 2024 12:21:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sifHG-000HWw-2z;
	Mon, 26 Aug 2024 19:21:22 +0000
Date: Tue, 27 Aug 2024 03:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pmdomain/rockchip/pm-domains.c:203:2-8: preceding lock on
 line 199
Message-ID: <202408270318.V1lBIVDd-lkp@intel.com>
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
TO: Ulf Hansson <ulf.hansson@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>

Hi Ulf,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5be63fc19fcaa4c236b307420483578a56986a37
commit: e2ad626f8f409899baf1bf192d0533a851128b19 pmdomain: Rename the genpd subsystem to pmdomain
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: arc-randconfig-r063-20240826 (https://download.01.org/0day-ci/archive/20240827/202408270318.V1lBIVDd-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202408270318.V1lBIVDd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pmdomain/rockchip/pm-domains.c:203:2-8: preceding lock on line 199

vim +203 drivers/pmdomain/rockchip/pm-domains.c

defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  185  
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  186  /*
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  187   * Block PMU transitions and make sure they don't interfere with ARM Trusted
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  188   * Firmware operations. There are two conflicts, noted in the comments below.
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  189   *
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  190   * Caller must unblock PMU transitions via rockchip_pmu_unblock().
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  191   */
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  192  int rockchip_pmu_block(void)
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  193  {
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  194  	struct rockchip_pmu *pmu;
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  195  	struct generic_pm_domain *genpd;
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  196  	struct rockchip_pm_domain *pd;
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  197  	int i, ret;
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  198  
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05 @199  	mutex_lock(&dmc_pmu_mutex);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  200  
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  201  	/* No PMU (yet)? Then we just block rockchip_pmu_probe(). */
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  202  	if (!dmc_pmu)
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05 @203  		return 0;
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  204  	pmu = dmc_pmu;
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  205  
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  206  	/*
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  207  	 * mutex blocks all idle transitions: we can't touch the
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  208  	 * PMU_BUS_IDLE_REQ (our ".idle_offset") register while ARM Trusted
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  209  	 * Firmware might be using it.
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  210  	 */
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  211  	mutex_lock(&pmu->mutex);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  212  
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  213  	/*
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  214  	 * Power domain clocks: Per Rockchip, we *must* keep certain clocks
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  215  	 * enabled for the duration of power-domain transitions. Most
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  216  	 * transitions are handled by this driver, but some cases (in
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  217  	 * particular, DRAM DVFS / memory-controller idle) must be handled by
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  218  	 * firmware. Firmware can handle most clock management via a special
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  219  	 * "ungate" register (PMU_CRU_GATEDIS_CON0), but unfortunately, this
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  220  	 * doesn't handle PLLs. We can assist this transition by doing the
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  221  	 * clock management on behalf of firmware.
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  222  	 */
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  223  	for (i = 0; i < pmu->genpd_data.num_domains; i++) {
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  224  		genpd = pmu->genpd_data.domains[i];
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  225  		if (genpd) {
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  226  			pd = to_rockchip_pd(genpd);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  227  			ret = clk_bulk_enable(pd->num_clks, pd->clks);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  228  			if (ret < 0) {
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  229  				dev_err(pmu->dev,
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  230  					"failed to enable clks for domain '%s': %d\n",
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  231  					genpd->name, ret);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  232  				goto err;
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  233  			}
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  234  		}
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  235  	}
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  236  
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  237  	return 0;
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  238  
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  239  err:
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  240  	for (i = i - 1; i >= 0; i--) {
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  241  		genpd = pmu->genpd_data.domains[i];
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  242  		if (genpd) {
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  243  			pd = to_rockchip_pd(genpd);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  244  			clk_bulk_disable(pd->num_clks, pd->clks);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  245  		}
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  246  	}
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  247  	mutex_unlock(&pmu->mutex);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  248  	mutex_unlock(&dmc_pmu_mutex);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  249  
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  250  	return ret;
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  251  }
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  252  EXPORT_SYMBOL_GPL(rockchip_pmu_block);
defec178df76e0 drivers/soc/rockchip/pm_domains.c Brian Norris 2022-04-05  253  

:::::: The code at line 203 was first introduced by commit
:::::: defec178df76e0caadd4e8ef68f3d655a2088198 soc: rockchip: power-domain: Manage resource conflicts with firmware

:::::: TO: Brian Norris <briannorris@chromium.org>
:::::: CC: Chanwoo Choi <cw00.choi@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
