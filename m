Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844E156E4
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hj4Mafpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700047352; x=1731583352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wPBgPcoEIDsBalWrSfKQwfyS0lNE4RBEvIf+H8UEtFg=;
  b=hj4MafpliReAJUEM5o0fWNfqa+qc51GPPbly+koUm/erh6ExJBoie1Hc
   I4mnP3kpvMajL57rDN413HuIcWBtrFgZZ6OeqJrbgnMIY/4Y522AUvqnZ
   jqK2Cy54tCUCVdj3RT8UW0IUQ5AljAAzh/hn+g4zc5dSiFwPsOSNx/GCZ
   no6jw5kwwjlbeT6tbltQ5G4HZiW7+9cyB3zp98SmsBWZ/7+ClqPxekgBl
   OOZKq6f+41CzDYy+r7fJwtbINznw3+nFIkF/nVI/vPNJESyQBAhymUSbj
   X906Dq2c+GF/Dkcb2XU+dsKsw1zH/CAyRnAF3BGenH5xgcjOlFYYtp417
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="457353545"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="457353545"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 03:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="6131599"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Nov 2023 03:22:31 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3DyV-0000Gy-3A;
	Wed, 15 Nov 2023 11:22:27 +0000
Date: Wed, 15 Nov 2023 19:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
Message-ID: <202311151900.K9xc6Xqz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231114040110.54590-5-yangyicong@huawei.com>
References: <20231114040110.54590-5-yangyicong@huawei.com>
TO: Yicong Yang <yangyicong@huawei.com>
TO: catalin.marinas@arm.com
TO: will@kernel.org
TO: sudeep.holla@arm.com
TO: linux-arm-kernel@lists.infradead.org
CC: dietmar.eggemann@arm.com
CC: gregkh@linuxfoundation.org
CC: rafael@kernel.org
CC: jonathan.cameron@huawei.com
CC: prime.zeng@hisilicon.com
CC: linuxarm@huawei.com
CC: yangyicong@hisilicon.com
CC: linux-kernel@vger.kernel.org

Hi Yicong,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus arm/for-next kvmarm/next soc/for-next linus/master arm/fixes v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/arch_topology-Support-basic-SMT-control-for-the-driver/20231114-120544
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231114040110.54590-5-yangyicong%40huawei.com
patch subject: [PATCH v3 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-002-20231115 (https://download.01.org/0day-ci/archive/20231115/202311151900.K9xc6Xqz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311151900.K9xc6Xqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311151900.K9xc6Xqz-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cpu.c: In function 'cpuhp_smt_disable':
>> kernel/cpu.c:2687:23: error: implicit declaration of function 'cpu_down_maps_locked' [-Werror=implicit-function-declaration]
    2687 |                 ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
         |                       ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpu_down_maps_locked +2687 kernel/cpu.c

dc8d37ed304eee Arnd Bergmann    2019-12-10  2672  
dc8d37ed304eee Arnd Bergmann    2019-12-10  2673  int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval)
dc8d37ed304eee Arnd Bergmann    2019-12-10  2674  {
dc8d37ed304eee Arnd Bergmann    2019-12-10  2675  	int cpu, ret = 0;
dc8d37ed304eee Arnd Bergmann    2019-12-10  2676  
dc8d37ed304eee Arnd Bergmann    2019-12-10  2677  	cpu_maps_update_begin();
dc8d37ed304eee Arnd Bergmann    2019-12-10  2678  	for_each_online_cpu(cpu) {
dc8d37ed304eee Arnd Bergmann    2019-12-10  2679  		if (topology_is_primary_thread(cpu))
dc8d37ed304eee Arnd Bergmann    2019-12-10  2680  			continue;
38253464bc821d Michael Ellerman 2023-07-05  2681  		/*
38253464bc821d Michael Ellerman 2023-07-05  2682  		 * Disable can be called with CPU_SMT_ENABLED when changing
38253464bc821d Michael Ellerman 2023-07-05  2683  		 * from a higher to lower number of SMT threads per core.
38253464bc821d Michael Ellerman 2023-07-05  2684  		 */
38253464bc821d Michael Ellerman 2023-07-05  2685  		if (ctrlval == CPU_SMT_ENABLED && cpu_smt_thread_allowed(cpu))
38253464bc821d Michael Ellerman 2023-07-05  2686  			continue;
dc8d37ed304eee Arnd Bergmann    2019-12-10 @2687  		ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
dc8d37ed304eee Arnd Bergmann    2019-12-10  2688  		if (ret)
dc8d37ed304eee Arnd Bergmann    2019-12-10  2689  			break;
dc8d37ed304eee Arnd Bergmann    2019-12-10  2690  		/*
dc8d37ed304eee Arnd Bergmann    2019-12-10  2691  		 * As this needs to hold the cpu maps lock it's impossible
dc8d37ed304eee Arnd Bergmann    2019-12-10  2692  		 * to call device_offline() because that ends up calling
dc8d37ed304eee Arnd Bergmann    2019-12-10  2693  		 * cpu_down() which takes cpu maps lock. cpu maps lock
dc8d37ed304eee Arnd Bergmann    2019-12-10  2694  		 * needs to be held as this might race against in kernel
dc8d37ed304eee Arnd Bergmann    2019-12-10  2695  		 * abusers of the hotplug machinery (thermal management).
dc8d37ed304eee Arnd Bergmann    2019-12-10  2696  		 *
dc8d37ed304eee Arnd Bergmann    2019-12-10  2697  		 * So nothing would update device:offline state. That would
dc8d37ed304eee Arnd Bergmann    2019-12-10  2698  		 * leave the sysfs entry stale and prevent onlining after
dc8d37ed304eee Arnd Bergmann    2019-12-10  2699  		 * smt control has been changed to 'off' again. This is
dc8d37ed304eee Arnd Bergmann    2019-12-10  2700  		 * called under the sysfs hotplug lock, so it is properly
dc8d37ed304eee Arnd Bergmann    2019-12-10  2701  		 * serialized against the regular offline usage.
dc8d37ed304eee Arnd Bergmann    2019-12-10  2702  		 */
dc8d37ed304eee Arnd Bergmann    2019-12-10  2703  		cpuhp_offline_cpu_device(cpu);
dc8d37ed304eee Arnd Bergmann    2019-12-10  2704  	}
dc8d37ed304eee Arnd Bergmann    2019-12-10  2705  	if (!ret)
dc8d37ed304eee Arnd Bergmann    2019-12-10  2706  		cpu_smt_control = ctrlval;
dc8d37ed304eee Arnd Bergmann    2019-12-10  2707  	cpu_maps_update_done();
dc8d37ed304eee Arnd Bergmann    2019-12-10  2708  	return ret;
dc8d37ed304eee Arnd Bergmann    2019-12-10  2709  }
dc8d37ed304eee Arnd Bergmann    2019-12-10  2710  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
