Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA52388
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Apr 2023 01:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681348832; x=1712884832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9BiDvXS0XXkjGoZm7KRMjSUshU8cE48Sp+y47koLHY=;
  b=gqmzTb4IE6kogb70zx2sQcHsaIqoH8kLvKJnW6UxesbEOs5PwCT4LbNb
   UQXM8d1AJ7PQoyZT8xjqhpEBlcjLKaT9F5gAaoTCup7HUW7f/2NHLqS1o
   QdmshEoqSEVEULIvOfvFTCz/1BWReYzfiIkgnKpK16rXSj89/i+6dLFzv
   Vezt1Wue2w6UhFLZpiWe1ZFJsCOJSrrInKWY9ra/5IUHQtdI2JkpfBe2f
   Y+lgK7BZ1fe2SCAdRtJxuTe+Rlmc2UFXyRjMWYwPORLLwJ4kWcTx+2KSq
   Tu8WHBtYqKvElNVoCuFAKEPELsWwvbgtntMt6WWrONZKyOSZb3cKbgYFB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406897257"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="406897257"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 18:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="719612152"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="719612152"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Apr 2023 18:20:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmldV-000YDi-2u;
	Thu, 13 Apr 2023 01:20:29 +0000
Date: Thu, 13 Apr 2023 09:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 4/4] platform/x86/intel/pmc: core: Report duration of
 time in HW sleep state
Message-ID: <202304130930.YmSObKSJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/platform/x86/intel/pmc/core.c:1156:41: sparse: sparse: shift too big (32) for type unsigned long"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230412194917.7164-5-mario.limonciello@amd.com>
References: <20230412194917.7164-5-mario.limonciello@amd.com>
TO: Mario Limonciello <mario.limonciello@amd.com>
TO: Box David E <david.e.box@intel.com>
TO: jstultz@google.com
TO: pavel@ucw.cz
TO: svenva@chromium.org
TO: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
CC: Shyam-sundar.S-k@amd.com
CC: rrangel@chromium.org
CC: Jain Rajat <rajatja@google.com>
CC: hdegoede@redhat.com
CC: Mario Limonciello <mario.limonciello@amd.com>
CC: Mark Gross <markgross@kernel.org>
CC: platform-driver-x86@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/PM-Add-sysfs-files-to-represent-time-spent-in-hardware-sleep-state/20230413-035220
base:   09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
patch link:    https://lore.kernel.org/r/20230412194917.7164-5-mario.limonciello%40amd.com
patch subject: [PATCH v8 4/4] platform/x86/intel/pmc: core: Report duration of time in HW sleep state
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230413/202304130930.YmSObKSJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/315b1dd23cbedfd2848c8ac8ec1f77c3610b955e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/PM-Add-sysfs-files-to-represent-time-spent-in-hardware-sleep-state/20230413-035220
        git checkout 315b1dd23cbedfd2848c8ac8ec1f77c3610b955e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/intel/pmc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304130930.YmSObKSJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/intel/pmc/core.c:1156:41: sparse: sparse: shift too big (32) for type unsigned long

vim +1156 drivers/platform/x86/intel/pmc/core.c

c9f86d6ca6b5e2 drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1097  
6c96a78c7b3201 drivers/platform/x86/intel_pmc_core.c Rajat Jain          2019-04-17  1098  static int pmc_core_probe(struct platform_device *pdev)
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1099  {
6c96a78c7b3201 drivers/platform/x86/intel_pmc_core.c Rajat Jain          2019-04-17  1100  	static bool device_initialized;
7dc4dc563dd40c drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1101  	struct pmc_dev *pmcdev;
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1102  	const struct x86_cpu_id *cpu_id;
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1103  	void (*core_init)(struct pmc_dev *pmcdev);
745698c37c08f4 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-02-02  1104  	u64 slp_s0_addr;
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1105  
6c96a78c7b3201 drivers/platform/x86/intel_pmc_core.c Rajat Jain          2019-04-17  1106  	if (device_initialized)
6c96a78c7b3201 drivers/platform/x86/intel_pmc_core.c Rajat Jain          2019-04-17  1107  		return -ENODEV;
6c96a78c7b3201 drivers/platform/x86/intel_pmc_core.c Rajat Jain          2019-04-17  1108  
7dc4dc563dd40c drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1109  	pmcdev = devm_kzalloc(&pdev->dev, sizeof(*pmcdev), GFP_KERNEL);
7dc4dc563dd40c drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1110  	if (!pmcdev)
7dc4dc563dd40c drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1111  		return -ENOMEM;
7dc4dc563dd40c drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1112  
7dc4dc563dd40c drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1113  	platform_set_drvdata(pdev, pmcdev);
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1114  	pmcdev->pdev = pdev;
7dc4dc563dd40c drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1115  
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1116  	cpu_id = x86_match_cpu(intel_pmc_core_ids);
21ae43570940f8 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-01-19  1117  	if (!cpu_id)
21ae43570940f8 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-01-19  1118  		return -ENODEV;
21ae43570940f8 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-01-19  1119  
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1120  	core_init = (void  (*)(struct pmc_dev *))cpu_id->driver_data;
745698c37c08f4 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-02-02  1121  
661405bd817b20 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2018-02-02  1122  	/*
43e82d8aa92503 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela     2019-11-18  1123  	 * Coffee Lake has CPU ID of Kaby Lake and Cannon Lake PCH. So here
43e82d8aa92503 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela     2019-11-18  1124  	 * Sunrisepoint PCH regmap can't be used. Use Cannon Lake PCH regmap
661405bd817b20 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2018-02-02  1125  	 * in this case.
661405bd817b20 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2018-02-02  1126  	 */
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1127  	if (core_init == spt_core_init && !pci_dev_present(pmc_pci_ids))
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1128  		core_init = cnp_core_init;
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1129  
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1130  	mutex_init(&pmcdev->lock);
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1131  	core_init(pmcdev);
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1132  
661405bd817b20 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2018-02-02  1133  
7d505758b1e556 drivers/platform/x86/intel_pmc_core.c M. Vefa Bicakci     2019-08-15  1134  	if (lpit_read_residency_count_address(&slp_s0_addr)) {
21ae43570940f8 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-01-19  1135  		pmcdev->base_addr = PMC_BASE_ADDR_DEFAULT;
7d505758b1e556 drivers/platform/x86/intel_pmc_core.c M. Vefa Bicakci     2019-08-15  1136  
7d505758b1e556 drivers/platform/x86/intel_pmc_core.c M. Vefa Bicakci     2019-08-15  1137  		if (page_is_ram(PHYS_PFN(pmcdev->base_addr)))
7d505758b1e556 drivers/platform/x86/intel_pmc_core.c M. Vefa Bicakci     2019-08-15  1138  			return -ENODEV;
7d505758b1e556 drivers/platform/x86/intel_pmc_core.c M. Vefa Bicakci     2019-08-15  1139  	} else {
745698c37c08f4 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-02-02  1140  		pmcdev->base_addr = slp_s0_addr - pmcdev->map->slp_s0_offset;
7d505758b1e556 drivers/platform/x86/intel_pmc_core.c M. Vefa Bicakci     2019-08-15  1141  	}
745698c37c08f4 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-02-02  1142  
21ae43570940f8 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-01-19  1143  	pmcdev->regbase = ioremap(pmcdev->base_addr,
21ae43570940f8 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-01-19  1144  				  pmcdev->map->regmap_length);
21ae43570940f8 drivers/platform/x86/intel_pmc_core.c Srinivas Pandruvada 2018-01-19  1145  	if (!pmcdev->regbase)
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1146  		return -ENOMEM;
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1147  
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1148  	if (pmcdev->core_configure)
284c01b72ac9ca drivers/platform/x86/intel/pmc/core.c Gayatri Kammela     2022-11-14  1149  		pmcdev->core_configure(pmcdev);
428131364f0073 drivers/platform/x86/intel_pmc_core.c Gayatri Kammela     2021-04-16  1150  
7dc4dc563dd40c drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1151  	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(pmcdev);
45b6f75eab6aab drivers/platform/x86/intel_pmc_core.c David E. Box        2021-08-13  1152  	pmc_core_get_low_power_modes(pdev);
c9f86d6ca6b5e2 drivers/platform/x86/intel_pmc_core.c David E. Box        2021-04-16  1153  	pmc_core_do_dmi_quirks(pmcdev);
173943b3dae570 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-10-07  1154  
151675540a2f93 drivers/platform/x86/intel_pmc_core.c Greg Kroah-Hartman  2019-06-12  1155  	pmc_core_dbgfs_register(pmcdev);
315b1dd23cbedf drivers/platform/x86/intel/pmc/core.c Mario Limonciello   2023-04-12 @1156  	pm_report_max_hw_sleep(((1UL << 32) - 1) * pmc_core_adjust_slp_s0_step(pmcdev, 1));
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1157  
6c96a78c7b3201 drivers/platform/x86/intel_pmc_core.c Rajat Jain          2019-04-17  1158  	device_initialized = true;
6c96a78c7b3201 drivers/platform/x86/intel_pmc_core.c Rajat Jain          2019-04-17  1159  	dev_info(&pdev->dev, " initialized\n");
6c96a78c7b3201 drivers/platform/x86/intel_pmc_core.c Rajat Jain          2019-04-17  1160  
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1161  	return 0;
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1162  }
b740d2e9233cb3 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj   2016-05-26  1163  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
