Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAC511CB2
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Nov 2023 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAztS9O6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700422213; x=1731958213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lV3BjN0ZL9uAepWUH067bkqr0rFgjrrssqDHOj/Ejbc=;
  b=CAztS9O6nuKJkLsVLAEgEq+8Hkb+Klk+YGA4+Pa+YeIgBRzNaCL2GIz4
   deYUNINpivz8r86f4brEDVSUJah1maRC+50Uf/3q+vvAnCuTu3eu3uG/b
   dCJvkObUh66RvR0tNORXekNFoDDYjx84pKsby/VBPauxh488bsDc9+4G5
   jdpI/mhgD77lYxvuDJlkW3kPSMgDkG3WOprPce/xQwqsZq7VMBnAnxnjF
   VSXhC+t27OfAsenZyDof90paJaTHRDDTNzsrKnQqeZ0pCsUROv4FnDF2f
   ZVzmVM+eUIbe+BBv1D4KNLNQPJukzp1Da4Rixt8p+OWQrX8r+Uyi1HcZC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="10182781"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="10182781"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 11:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1097567139"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="1097567139"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Nov 2023 11:30:09 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4nUd-0005Th-2a;
	Sun, 19 Nov 2023 19:30:07 +0000
Date: Mon, 20 Nov 2023 03:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-linux-6.1.y-wip 83/90] drivers/bus/ti-sysc.c:3127:19:
 warning: cast to smaller integer type 'enum sysc_soc' from 'const void *'
Message-ID: <202311200340.grMKjVXZ-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Praneeth Bajjuri <praneeth@ti.com>
CC: Dhruva Gole <d-gole@ti.com>

Hi Tony,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   da9bbd5b8e9256096f5e068401df1bd53cc2e897
commit: ed53d4c9725f817d6ae0a2eba92a92a2a39d7f28 [83/90] bus: ti-sysc: Build driver for TI K3 SoCs
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200340.grMKjVXZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200340.grMKjVXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311200340.grMKjVXZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/ti-sysc.c:3127:19: warning: cast to smaller integer type 'enum sysc_soc' from 'const void *' [-Wvoid-pointer-to-enum-cast]
    3127 |                 sysc_soc->soc = (enum sysc_soc)match->data;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +3127 drivers/bus/ti-sysc.c

feaa8baee82abab Tony Lindgren     2020-02-24  3093  
feaa8baee82abab Tony Lindgren     2020-02-24  3094  /*
9d881361206ebcf Tony Lindgren     2021-09-21  3095   * One time init to detect the booted SoC, disable unavailable features
9d881361206ebcf Tony Lindgren     2021-09-21  3096   * and initialize list for optional cpu_pm notifier.
9d881361206ebcf Tony Lindgren     2021-09-21  3097   *
feaa8baee82abab Tony Lindgren     2020-02-24  3098   * Note that we initialize static data shared across all ti-sysc instances
feaa8baee82abab Tony Lindgren     2020-02-24  3099   * so ddata is only used for SoC type. This can be called from module_init
feaa8baee82abab Tony Lindgren     2020-02-24  3100   * once we no longer need to rely on platform data.
feaa8baee82abab Tony Lindgren     2020-02-24  3101   */
9d881361206ebcf Tony Lindgren     2021-09-21  3102  static int sysc_init_static_data(struct sysc *ddata)
feaa8baee82abab Tony Lindgren     2020-02-24  3103  {
feaa8baee82abab Tony Lindgren     2020-02-24  3104  	const struct soc_device_attribute *match;
feaa8baee82abab Tony Lindgren     2020-02-24  3105  	struct ti_sysc_platform_data *pdata;
feaa8baee82abab Tony Lindgren     2020-02-24  3106  	unsigned long features = 0;
5f7259a578e9c67 Tony Lindgren     2021-03-08  3107  	struct device_node *np;
feaa8baee82abab Tony Lindgren     2020-02-24  3108  
feaa8baee82abab Tony Lindgren     2020-02-24  3109  	if (sysc_soc)
feaa8baee82abab Tony Lindgren     2020-02-24  3110  		return 0;
feaa8baee82abab Tony Lindgren     2020-02-24  3111  
feaa8baee82abab Tony Lindgren     2020-02-24  3112  	sysc_soc = kzalloc(sizeof(*sysc_soc), GFP_KERNEL);
feaa8baee82abab Tony Lindgren     2020-02-24  3113  	if (!sysc_soc)
feaa8baee82abab Tony Lindgren     2020-02-24  3114  		return -ENOMEM;
feaa8baee82abab Tony Lindgren     2020-02-24  3115  
feaa8baee82abab Tony Lindgren     2020-02-24  3116  	mutex_init(&sysc_soc->list_lock);
feaa8baee82abab Tony Lindgren     2020-02-24  3117  	INIT_LIST_HEAD(&sysc_soc->disabled_modules);
9d881361206ebcf Tony Lindgren     2021-09-21  3118  	INIT_LIST_HEAD(&sysc_soc->restored_modules);
feaa8baee82abab Tony Lindgren     2020-02-24  3119  	sysc_soc->general_purpose = true;
feaa8baee82abab Tony Lindgren     2020-02-24  3120  
feaa8baee82abab Tony Lindgren     2020-02-24  3121  	pdata = dev_get_platdata(ddata->dev);
feaa8baee82abab Tony Lindgren     2020-02-24  3122  	if (pdata && pdata->soc_type_gp)
feaa8baee82abab Tony Lindgren     2020-02-24  3123  		sysc_soc->general_purpose = pdata->soc_type_gp();
feaa8baee82abab Tony Lindgren     2020-02-24  3124  
feaa8baee82abab Tony Lindgren     2020-02-24  3125  	match = soc_device_match(sysc_soc_match);
feaa8baee82abab Tony Lindgren     2020-02-24  3126  	if (match && match->data)
e59829853456e23 Tony Lindgren     2023-11-14 @3127  		sysc_soc->soc = (enum sysc_soc)match->data;
feaa8baee82abab Tony Lindgren     2020-02-24  3128  
5f7259a578e9c67 Tony Lindgren     2021-03-08  3129  	/*
5f7259a578e9c67 Tony Lindgren     2021-03-08  3130  	 * Check and warn about possible old incomplete dtb. We now want to see
5f7259a578e9c67 Tony Lindgren     2021-03-08  3131  	 * simple-pm-bus instead of simple-bus in the dtb for genpd using SoCs.
5f7259a578e9c67 Tony Lindgren     2021-03-08  3132  	 */
5f7259a578e9c67 Tony Lindgren     2021-03-08  3133  	switch (sysc_soc->soc) {
5f7259a578e9c67 Tony Lindgren     2021-03-08  3134  	case SOC_AM3:
5f7259a578e9c67 Tony Lindgren     2021-03-08  3135  	case SOC_AM4:
4adcf4c28f6dc19 Tony Lindgren     2021-03-12  3136  	case SOC_4430 ... SOC_4470:
4adcf4c28f6dc19 Tony Lindgren     2021-03-12  3137  	case SOC_5430:
4adcf4c28f6dc19 Tony Lindgren     2021-03-12  3138  	case SOC_DRA7:
5f7259a578e9c67 Tony Lindgren     2021-03-08  3139  		np = of_find_node_by_path("/ocp");
5f7259a578e9c67 Tony Lindgren     2021-03-08  3140  		WARN_ONCE(np && of_device_is_compatible(np, "simple-bus"),
5f7259a578e9c67 Tony Lindgren     2021-03-08  3141  			  "ti-sysc: Incomplete old dtb, please update\n");
5f7259a578e9c67 Tony Lindgren     2021-03-08  3142  		break;
5f7259a578e9c67 Tony Lindgren     2021-03-08  3143  	default:
5f7259a578e9c67 Tony Lindgren     2021-03-08  3144  		break;
5f7259a578e9c67 Tony Lindgren     2021-03-08  3145  	}
5f7259a578e9c67 Tony Lindgren     2021-03-08  3146  
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3147  	/* Ignore devices that are not available on HS and EMU SoCs */
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3148  	if (!sysc_soc->general_purpose) {
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3149  		switch (sysc_soc->soc) {
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3150  		case SOC_3430 ... SOC_3630:
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3151  			sysc_add_disabled(0x48304000);	/* timer12 */
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3152  			break;
a6d90e9f22328f0 Kevin Hilman      2021-07-20  3153  		case SOC_AM3:
a6d90e9f22328f0 Kevin Hilman      2021-07-20  3154  			sysc_add_disabled(0x48310000);  /* rng */
e879f855e590b40 Nathan Chancellor 2021-08-15  3155  			break;
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3156  		default:
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3157  			break;
52fbb5aabb5cf62 Yang Li           2021-02-02  3158  		}
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3159  	}
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3160  
feaa8baee82abab Tony Lindgren     2020-02-24  3161  	match = soc_device_match(sysc_soc_feat_match);
feaa8baee82abab Tony Lindgren     2020-02-24  3162  	if (!match)
feaa8baee82abab Tony Lindgren     2020-02-24  3163  		return 0;
feaa8baee82abab Tony Lindgren     2020-02-24  3164  
feaa8baee82abab Tony Lindgren     2020-02-24  3165  	if (match->data)
feaa8baee82abab Tony Lindgren     2020-02-24  3166  		features = (unsigned long)match->data;
feaa8baee82abab Tony Lindgren     2020-02-24  3167  
feaa8baee82abab Tony Lindgren     2020-02-24  3168  	/*
feaa8baee82abab Tony Lindgren     2020-02-24  3169  	 * Add disabled devices to the list based on the module base.
feaa8baee82abab Tony Lindgren     2020-02-24  3170  	 * Note that this must be done before we attempt to access the
feaa8baee82abab Tony Lindgren     2020-02-24  3171  	 * device and have module revision checks working.
feaa8baee82abab Tony Lindgren     2020-02-24  3172  	 */
feaa8baee82abab Tony Lindgren     2020-02-24  3173  	if (features & DIS_ISP)
feaa8baee82abab Tony Lindgren     2020-02-24  3174  		sysc_add_disabled(0x480bd400);
feaa8baee82abab Tony Lindgren     2020-02-24  3175  	if (features & DIS_IVA)
feaa8baee82abab Tony Lindgren     2020-02-24  3176  		sysc_add_disabled(0x5d000000);
feaa8baee82abab Tony Lindgren     2020-02-24  3177  	if (features & DIS_SGX)
feaa8baee82abab Tony Lindgren     2020-02-24  3178  		sysc_add_disabled(0x50000000);
feaa8baee82abab Tony Lindgren     2020-02-24  3179  
feaa8baee82abab Tony Lindgren     2020-02-24  3180  	return 0;
feaa8baee82abab Tony Lindgren     2020-02-24  3181  }
feaa8baee82abab Tony Lindgren     2020-02-24  3182  

:::::: The code at line 3127 was first introduced by commit
:::::: e59829853456e23c433d2182233dd00d04577f0d bus: ti-sysc: Fix build warning for 64-bit build

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
