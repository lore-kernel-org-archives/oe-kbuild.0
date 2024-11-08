Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6167B1D0E20
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 07:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731050219; cv=none; b=RsfKxZ9OOzLWp2twh2lK5QdIG+5/dPAFbyyER50QRnZEOw0d4NmTkBjcUwWRWZdhXYlTj9zF/bYV6VvqyQrCA3OKoEbJgCIYKzUm7VA7JTRZrNtEq1g4jXSLsNdH7bF8JjfrUh5lfR1fTz1IIOs4j1YVv0D4mchbe4bdEbVwhOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731050219; c=relaxed/simple;
	bh=H+26EpGfHSmPt8x7eYkcxUugYt1TThZeiILquQR8Bao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUyzOwC5TctW8j4yOVQqYit5S793XjoCyeUWYvilDTmPaXkMe07JGi8OZgIVVfWTsQO5qcz8Vm6jXRqFBp3WndmTviark8uwmC7/sV4tJAwyYrVmw5g/phCaAIpLlOmQKNYWyIXbz0hSaiox1bFqUcmhyFtCqnAiN4J8PwQYRWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHdlHIIx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHdlHIIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731050218; x=1762586218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+26EpGfHSmPt8x7eYkcxUugYt1TThZeiILquQR8Bao=;
  b=JHdlHIIxwivBtOr2LJboaa19ed8aPzWf7SspkLG/K1JCS9u4xzIzwrgP
   RZIlpYxOMpR+ivfLNbuM302wCYuEt/fp/jiEmjDZiKWWIhlc2adXX+Ov/
   ncy7+roZRev4Ko7J9rqGsut7KWEnfNMR0lNW0DEPh3yL4vEL2eJbSF6Ro
   bqqqJmZNGyf39TZVjiR0sRyrxMZu2nKrce9iEn166WKAyGnkVv4PU2/oA
   A9rkZ3jk4n0CwH6BQUHFWB0HMCSr4Gxq2wkoPuINsCT5+wbaMGTHQDlDW
   0shw8i6rSofXs4tpsG8xgpnRILoSB6RFoA6j2CqMw7i/fX6bjAOzXd27h
   w==;
X-CSE-ConnectionGUID: eSEchyNhTSObnSwIqAXI7Q==
X-CSE-MsgGUID: /2qjUykISxWpiINAzKsmag==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41482433"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41482433"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 23:16:55 -0800
X-CSE-ConnectionGUID: dOcDhVbdRw2tdSFpQSyNrg==
X-CSE-MsgGUID: ZuSHPNJZRHqQp+vmsHtnaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85410947"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Nov 2024 23:16:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9JEh-000r8Z-0I;
	Fri, 08 Nov 2024 07:16:51 +0000
Date: Fri, 8 Nov 2024 15:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/cpufreq/pxa2xx-cpufreq.c:195 pxa_set_target() error:
 uninitialized symbol 'pxa_freq_settings'.
Message-ID: <202411081749.XyI5jgjY-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Viresh Kumar <viresh.kumar@linaro.org>

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   906bd684e4b1e517dd424a354744c5b0aebef8af
commit: 81746019b9fbb9fbf7c522dcbeefb572ac0f9458 cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
date:   9 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 weeks ago
config: sparc-randconfig-r071-20241107 (https://download.01.org/0day-ci/archive/20241108/202411081749.XyI5jgjY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411081749.XyI5jgjY-lkp@intel.com/

smatch warnings:
drivers/cpufreq/pxa2xx-cpufreq.c:195 pxa_set_target() error: uninitialized symbol 'pxa_freq_settings'.

vim +/pxa_freq_settings +195 drivers/cpufreq/pxa2xx-cpufreq.c

592eb9997dc89c arch/arm/mach-pxa/cpu-pxa.c        Robert Jarzmik   2008-05-07  183  
9c0ebcf78fde0f drivers/cpufreq/pxa2xx-cpufreq.c   Viresh Kumar     2013-10-25  184  static int pxa_set_target(struct cpufreq_policy *policy, unsigned int idx)
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  185  {
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  186  	struct cpufreq_frequency_table *pxa_freqs_table;
03c229906311f3 drivers/cpufreq/pxa2xx-cpufreq.c   Fabian Frederick 2015-05-01  187  	const struct pxa_freqs *pxa_freq_settings;
d9278077385fd9 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  188  	struct pxa_cpufreq_data *data = cpufreq_get_driver_data();
d9278077385fd9 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  189  	unsigned int new_freq_cpu;
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  190  	int ret = 0;
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  191  
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  192  	/* Get the current policy */
65587f7d154ac5 arch/arm/mach-pxa/cpufreq-pxa2xx.c Marc Zyngier     2008-11-04  193  	find_freq_tables(&pxa_freqs_table, &pxa_freq_settings);
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  194  
592eb9997dc89c arch/arm/mach-pxa/cpu-pxa.c        Robert Jarzmik   2008-05-07 @195  	new_freq_cpu = pxa_freq_settings[idx].khz;
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  196  
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  197  	if (freq_debug)
d9278077385fd9 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  198  		pr_debug("Changing CPU frequency from %d Mhz to %d Mhz\n",
d9278077385fd9 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  199  			 policy->cur / 1000,  new_freq_cpu / 1000);
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  200  
d4019f0a92ab80 drivers/cpufreq/pxa2xx-cpufreq.c   Viresh Kumar     2013-08-14  201  	if (vcc_core && new_freq_cpu > policy->cur) {
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  202  		ret = pxa_cpufreq_change_voltage(&pxa_freq_settings[idx]);
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  203  		if (ret)
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  204  			return ret;
d4019f0a92ab80 drivers/cpufreq/pxa2xx-cpufreq.c   Viresh Kumar     2013-08-14  205  	}
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  206  
d9278077385fd9 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  207  	clk_set_rate(data->clk_core, new_freq_cpu * 1000);
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  208  
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  209  	/*
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  210  	 * Even if voltage setting fails, we don't report it, as the frequency
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  211  	 * change succeeded. The voltage reduction is not a critical failure,
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  212  	 * only power savings will suffer from this.
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  213  	 *
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  214  	 * Note: if the voltage change fails, and a return value is returned, a
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  215  	 * bug is triggered (seems a deadlock). Should anybody find out where,
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  216  	 * the "return 0" should become a "return ret".
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  217  	 */
d4019f0a92ab80 drivers/cpufreq/pxa2xx-cpufreq.c   Viresh Kumar     2013-08-14  218  	if (vcc_core && new_freq_cpu < policy->cur)
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  219  		ret = pxa_cpufreq_change_voltage(&pxa_freq_settings[idx]);
3dbeef231e2247 arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  220  
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  221  	return 0;
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  222  }
9e2697ff371b43 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  223  

:::::: The code at line 195 was first introduced by commit
:::::: 592eb9997dc89cd0c8f89a505e5348bbddce70f6 [ARM] 5032/1: Added cpufreq support for pxa27x CPU

:::::: TO: Robert Jarzmik <rjarzmik@free.fr>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
