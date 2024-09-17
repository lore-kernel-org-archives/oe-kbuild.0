Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDC5A93D
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 01:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726538385; cv=none; b=myz3Qep8J3Ui0ZaOufaHkqlR+9FfRk+cGS0A67be6iBw2mr3jaroxTK//LmDSaG3Bx/stqLqO0x97W9gk0hv1IwQIBJzfmyKUd89ITLtYupG2JDCK2Dyx+o21vFPC7Givg0r/4aY7hEEzu+LETWxm2SYXqK8SzQth985+eAKRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726538385; c=relaxed/simple;
	bh=ca+mky54wadwjCwm5LczT8m0X70rVjhqmJ77gzehOyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJmC/bQ2P/s3ZSiuRunvfnLCRv4FP7s2HbPZLjCMpfOM9VdC1YY0SDrnE0L0s7SXcgy7YqjS8uAlxnor0X0ZvPtYhNbo1yuB/hTx1HQY68PUx2xZq18NBfTejaIgMad5DawdPqtDpGYgF1IN5ktNSoeTYiSEpvRfk+HoofEhxjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NR+lX354; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NR+lX354"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726538383; x=1758074383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ca+mky54wadwjCwm5LczT8m0X70rVjhqmJ77gzehOyY=;
  b=NR+lX354xofyXSZsVzB1XTnwsWm3CtqeR7O9PcNlEvsXRNMxoWkFWtFZ
   /9Zqjp8E5U6H5JIsnPoMTr/T+8sHpYl2w2ucxK9k/Kpl22FqDD+SkUNqF
   SFrTxGYfqP/6CddTT80cEVkBh65IB7T58/D1+2Hq1oGHZvCzr2u26Xq1X
   KLJUStM6zEfpf/KN0dxwKgPC/B8lDoTpyft2cUfI2qhq8Nz+44jh1TqKE
   /rBW0wI4MKBhdrVS7z249cQ9bWUVim5GPNIi3hm3soUZtSPk1ZvQoBxxw
   b4iNF/ifAuFozoL3IqrXHFb4iPPvpxQBP8qlZp+6n7mvd1OqJ3IlCxnAk
   A==;
X-CSE-ConnectionGUID: E8sTTss6QJifYn9+3fkNqw==
X-CSE-MsgGUID: vS+8jwuWSeaEQ2GI3TUHvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="28295493"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="28295493"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 18:59:43 -0700
X-CSE-ConnectionGUID: T+zM2+xRTfe7+Oq8k3Xe0Q==
X-CSE-MsgGUID: 6lzQLhDgSx23IiN3rI8c9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="68925192"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Sep 2024 18:59:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqNVD-000Aha-1X;
	Tue, 17 Sep 2024 01:59:39 +0000
Date: Tue, 17 Sep 2024 09:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/cpufreq/pxa2xx-cpufreq.c:195 pxa_set_target() error:
 uninitialized symbol 'pxa_freq_settings'.
Message-ID: <202409170906.msSRrEmm-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a430d95c5efa2b545d26a094eb5f624e36732af0
commit: 3f66425a4fc8663ad074cf70f432c681953bfcb7 cpufreq: Enable COMPILE_TEST on Arm drivers
date:   12 days ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 days ago
config: arm64-randconfig-r072-20240917 (https://download.01.org/0day-ci/archive/20240917/202409170906.msSRrEmm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409170906.msSRrEmm-lkp@intel.com/

smatch warnings:
drivers/cpufreq/pxa2xx-cpufreq.c:195 pxa_set_target() error: uninitialized symbol 'pxa_freq_settings'.

vim +/pxa_freq_settings +195 drivers/cpufreq/pxa2xx-cpufreq.c

592eb9997dc89cd arch/arm/mach-pxa/cpu-pxa.c        Robert Jarzmik   2008-05-07  183  
9c0ebcf78fde0ff drivers/cpufreq/pxa2xx-cpufreq.c   Viresh Kumar     2013-10-25  184  static int pxa_set_target(struct cpufreq_policy *policy, unsigned int idx)
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  185  {
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  186  	struct cpufreq_frequency_table *pxa_freqs_table;
03c229906311f3b drivers/cpufreq/pxa2xx-cpufreq.c   Fabian Frederick 2015-05-01  187  	const struct pxa_freqs *pxa_freq_settings;
d9278077385fd92 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  188  	struct pxa_cpufreq_data *data = cpufreq_get_driver_data();
d9278077385fd92 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  189  	unsigned int new_freq_cpu;
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  190  	int ret = 0;
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  191  
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  192  	/* Get the current policy */
65587f7d154ac58 arch/arm/mach-pxa/cpufreq-pxa2xx.c Marc Zyngier     2008-11-04  193  	find_freq_tables(&pxa_freqs_table, &pxa_freq_settings);
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  194  
592eb9997dc89cd arch/arm/mach-pxa/cpu-pxa.c        Robert Jarzmik   2008-05-07 @195  	new_freq_cpu = pxa_freq_settings[idx].khz;
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  196  
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  197  	if (freq_debug)
d9278077385fd92 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  198  		pr_debug("Changing CPU frequency from %d Mhz to %d Mhz\n",
d9278077385fd92 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  199  			 policy->cur / 1000,  new_freq_cpu / 1000);
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  200  
d4019f0a92ab802 drivers/cpufreq/pxa2xx-cpufreq.c   Viresh Kumar     2013-08-14  201  	if (vcc_core && new_freq_cpu > policy->cur) {
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  202  		ret = pxa_cpufreq_change_voltage(&pxa_freq_settings[idx]);
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  203  		if (ret)
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  204  			return ret;
d4019f0a92ab802 drivers/cpufreq/pxa2xx-cpufreq.c   Viresh Kumar     2013-08-14  205  	}
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  206  
d9278077385fd92 drivers/cpufreq/pxa2xx-cpufreq.c   Robert Jarzmik   2017-10-14  207  	clk_set_rate(data->clk_core, new_freq_cpu * 1000);
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  208  
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  209  	/*
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  210  	 * Even if voltage setting fails, we don't report it, as the frequency
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  211  	 * change succeeded. The voltage reduction is not a critical failure,
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  212  	 * only power savings will suffer from this.
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  213  	 *
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  214  	 * Note: if the voltage change fails, and a return value is returned, a
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  215  	 * bug is triggered (seems a deadlock). Should anybody find out where,
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  216  	 * the "return 0" should become a "return ret".
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  217  	 */
d4019f0a92ab802 drivers/cpufreq/pxa2xx-cpufreq.c   Viresh Kumar     2013-08-14  218  	if (vcc_core && new_freq_cpu < policy->cur)
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  219  		ret = pxa_cpufreq_change_voltage(&pxa_freq_settings[idx]);
3dbeef231e2247f arch/arm/mach-pxa/cpufreq-pxa2xx.c Robert Jarzmik   2009-05-17  220  
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  221  	return 0;
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  222  }
9e2697ff371b438 arch/arm/mach-pxa/cpu-pxa.c        Russell King     2007-12-14  223  

:::::: The code at line 195 was first introduced by commit
:::::: 592eb9997dc89cd0c8f89a505e5348bbddce70f6 [ARM] 5032/1: Added cpufreq support for pxa27x CPU

:::::: TO: Robert Jarzmik <rjarzmik@free.fr>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
