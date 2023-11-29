Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C33B2BB
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXojPJvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701277944; x=1732813944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PK1SWpioUPM7ruA6Lx79nt3PGSP0KPTvw86ErytKdew=;
  b=RXojPJvq3sJDW2yHGHGpKahA3EjdiFVvpS8gW5r4OiKgiR83W0VnlX8f
   O8EPDybX+NUZYo+3eCHS5cMuoplnxudjfnN5yn7qgO05KOb51l6CMZgZg
   WMpwBpZTn7G4J1g5EPcq4RnuhKqTUcKaJZjbkLcDqAtXnWDPzfF1goQ2+
   sfOe7d4VA+KMESSMgjULsM/sd7PnRqlXpFcSBakaUCbRqKnce35l/uajd
   QjLCJpzd5qAGuN3WXuTqcmVE/RROiEQ970Wa7sjT4E0eJeQb938/1JSuC
   9fDTMlQ4ZnY3YCiCgIPtHpmYxkZMdMGVuP8gStEYALYLEQxTyzwbgA4bb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="186572"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="186572"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 09:12:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="768975951"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="768975951"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Nov 2023 09:12:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8O6k-0000ZC-2C;
	Wed, 29 Nov 2023 17:12:18 +0000
Date: Thu, 30 Nov 2023 01:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V11 5/7] cpufreq: amd-pstate: Update amd-pstate preferred
 core ranking dynamically
Message-ID: <202311300033.L6FNuSrE-lkp@intel.com>
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
In-Reply-To: <20231129065437.290183-6-li.meng@amd.com>
References: <20231129065437.290183-6-li.meng@amd.com>
TO: Meng Li <li.meng@amd.com>

Hi Meng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/acpi-bus tip/x86/core linus/master v6.7-rc3 next-20231129]
[cannot apply to rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Meng-Li/x86-Drop-CPU_SUP_INTEL-from-SCHED_MC_PRIO-for-the-expansion/20231129-160700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231129065437.290183-6-li.meng%40amd.com
patch subject: [PATCH V11 5/7] cpufreq: amd-pstate: Update amd-pstate preferred core ranking dynamically
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-141-20231129 (https://download.01.org/0day-ci/archive/20231130/202311300033.L6FNuSrE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300033.L6FNuSrE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311300033.L6FNuSrE-lkp@intel.com/

smatch warnings:
drivers/cpufreq/amd-pstate.c:763 amd_pstate_update_highest_perf() error: potentially dereferencing uninitialized 'cpudata'.

vim +/cpudata +763 drivers/cpufreq/amd-pstate.c

1fe1f970bde956 Meng Li 2023-11-29  755  
b631665e8af8a7 Meng Li 2023-11-29  756  static void amd_pstate_update_highest_perf(unsigned int cpu)
b631665e8af8a7 Meng Li 2023-11-29  757  {
b631665e8af8a7 Meng Li 2023-11-29  758  	struct cpufreq_policy *policy;
b631665e8af8a7 Meng Li 2023-11-29  759  	struct amd_cpudata *cpudata;
b631665e8af8a7 Meng Li 2023-11-29  760  	u32 prev_high = 0, cur_high = 0;
b631665e8af8a7 Meng Li 2023-11-29  761  	int ret;
b631665e8af8a7 Meng Li 2023-11-29  762  
b631665e8af8a7 Meng Li 2023-11-29 @763  	if ((!amd_pstate_prefcore) || (!cpudata->hw_prefcore))
b631665e8af8a7 Meng Li 2023-11-29  764  		return;
b631665e8af8a7 Meng Li 2023-11-29  765  
b631665e8af8a7 Meng Li 2023-11-29  766  	ret = amd_pstate_get_highest_perf(cpu, &cur_high);
b631665e8af8a7 Meng Li 2023-11-29  767  	if (ret)
b631665e8af8a7 Meng Li 2023-11-29  768  		return;
b631665e8af8a7 Meng Li 2023-11-29  769  
b631665e8af8a7 Meng Li 2023-11-29  770  	policy = cpufreq_cpu_get(cpu);
b631665e8af8a7 Meng Li 2023-11-29  771  	cpudata = policy->driver_data;
b631665e8af8a7 Meng Li 2023-11-29  772  	prev_high = READ_ONCE(cpudata->prefcore_ranking);
b631665e8af8a7 Meng Li 2023-11-29  773  
b631665e8af8a7 Meng Li 2023-11-29  774  	if (prev_high != cur_high) {
b631665e8af8a7 Meng Li 2023-11-29  775  		WRITE_ONCE(cpudata->prefcore_ranking, cur_high);
b631665e8af8a7 Meng Li 2023-11-29  776  
b631665e8af8a7 Meng Li 2023-11-29  777  		if (cur_high < CPPC_MAX_PERF)
b631665e8af8a7 Meng Li 2023-11-29  778  			sched_set_itmt_core_prio((int)cur_high, cpu);
b631665e8af8a7 Meng Li 2023-11-29  779  	}
b631665e8af8a7 Meng Li 2023-11-29  780  
b631665e8af8a7 Meng Li 2023-11-29  781  	cpufreq_cpu_put(policy);
b631665e8af8a7 Meng Li 2023-11-29  782  }
b631665e8af8a7 Meng Li 2023-11-29  783  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
