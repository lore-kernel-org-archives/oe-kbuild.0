Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C461FBF4
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Sep 2023 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695198425; x=1726734425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hT8WP168oqMDa8vxyazugiPVz9DmaZHZFdEsNyMrvBU=;
  b=Ae04MekEUwuKuTBGzoyLW73HrrE2t9mx77HJoxo2OP6Qa9ABpJcSM2Jg
   v26qLeBbFQOWGn+Xrn2kjc8emdz1AwLfVdlPQ1AXcsPps8DZfm0rKZbN5
   1C82rd+EGeDFl9j0hcRxp23gxPL9X+i/mMiEjuTSWZAn8rkaKEzw7505W
   USBusTFOFqKts6n4Lxa9XAXGYltJBOKNUv0Dj3wLvo8W/EeFYb4YFI+Ru
   LNiwc/QXzsky/XUw0xWGbY6lbIpA7SY+ZBMDlsfZRz07jnnBpaEDbimL3
   A+xSvuOpwScXVd+ZaddnEBjmRbQfRRDCfKROccLxvHnsL8c0M6+tjNzpP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377468788"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="377468788"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 01:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781607040"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="781607040"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Sep 2023 01:27:01 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qisXy-0008VY-2A;
	Wed, 20 Sep 2023 08:26:58 +0000
Date: Wed, 20 Sep 2023 16:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [shuah-kselftest:next 3/7] drivers/cpufreq/amd-pstate.c:715
 amd_pstate_get_highest_perf() error: uninitialized symbol
 'cppc_highest_perf'.
Message-ID: <202309201624.7GMHAqZh-lkp@intel.com>
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
TO: Meng Li <li.meng@amd.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
CC: Perry Yuan <Perry.Yuan@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
head:   51e62bd93e8872663b9994b78d04709b1a529ed6
commit: 3f391b72cf155be461a1f1744c0bcbd84f348506 [3/7] cpufreq: amd-pstate: Enable amd-pstate preferred core supporting.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201624.7GMHAqZh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309201624.7GMHAqZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309201624.7GMHAqZh-lkp@intel.com/

smatch warnings:
drivers/cpufreq/amd-pstate.c:715 amd_pstate_get_highest_perf() error: uninitialized symbol 'cppc_highest_perf'.

vim +/cppc_highest_perf +715 drivers/cpufreq/amd-pstate.c

3f391b72cf155b Meng Li 2023-09-18  693  
3f391b72cf155b Meng Li 2023-09-18  694  /*
3f391b72cf155b Meng Li 2023-09-18  695   * Get the highest performance register value.
3f391b72cf155b Meng Li 2023-09-18  696   * @cpu: CPU from which to get highest performance.
3f391b72cf155b Meng Li 2023-09-18  697   * @highest_perf: Return address.
3f391b72cf155b Meng Li 2023-09-18  698   *
3f391b72cf155b Meng Li 2023-09-18  699   * Return: 0 for success, -EIO otherwise.
3f391b72cf155b Meng Li 2023-09-18  700   */
3f391b72cf155b Meng Li 2023-09-18  701  static int amd_pstate_get_highest_perf(int cpu, u32 *highest_perf)
3f391b72cf155b Meng Li 2023-09-18  702  {
3f391b72cf155b Meng Li 2023-09-18  703  	int ret;
3f391b72cf155b Meng Li 2023-09-18  704  	u64 cppc_highest_perf;
3f391b72cf155b Meng Li 2023-09-18  705  
3f391b72cf155b Meng Li 2023-09-18  706  	if (boot_cpu_has(X86_FEATURE_CPPC)) {
3f391b72cf155b Meng Li 2023-09-18  707  		u64 cap1;
3f391b72cf155b Meng Li 2023-09-18  708  
3f391b72cf155b Meng Li 2023-09-18  709  		ret = rdmsrl_safe_on_cpu(cpu, MSR_AMD_CPPC_CAP1, &cap1);
3f391b72cf155b Meng Li 2023-09-18  710  		if (ret)
3f391b72cf155b Meng Li 2023-09-18  711  			return ret;
3f391b72cf155b Meng Li 2023-09-18  712  		WRITE_ONCE(*highest_perf, AMD_CPPC_HIGHEST_PERF(cap1));
3f391b72cf155b Meng Li 2023-09-18  713  	} else {
3f391b72cf155b Meng Li 2023-09-18  714  		ret = cppc_get_highest_perf(cpu, &cppc_highest_perf);
3f391b72cf155b Meng Li 2023-09-18 @715  		*highest_perf = (u32)(cppc_highest_perf & 0xFFFF);
3f391b72cf155b Meng Li 2023-09-18  716  	}
3f391b72cf155b Meng Li 2023-09-18  717  
3f391b72cf155b Meng Li 2023-09-18  718  	return (ret);
3f391b72cf155b Meng Li 2023-09-18  719  }
3f391b72cf155b Meng Li 2023-09-18  720  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
