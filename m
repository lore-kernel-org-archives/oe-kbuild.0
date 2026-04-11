Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1F933031C
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775905523; cv=none; b=PBs6SvDB6S+3I4gf/YjpPvp3vsqCssVE5jTfBzF6O9exHji/TYAIrg0rPSmbekIN16f9i8E7JRFyJUSRu3+HWCwMXv9Z7FPajUR4onXBXcbTb8JU4g6dE4x+HEvlwOGfvKN9IUrAKtEeC4Kckv2/F7LUsi/m9oP2FyeG+axbAoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775905523; c=relaxed/simple;
	bh=5pEbQZ8S0Knsfj02uWWfh3yBzzBxH2/iM6gz0+jKhh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NdkM25mYgmQ/20+UVZaV955mrgXyr3IFe86ZO9rMxwnFemyVSXiNQvh1ZzDLLeWr/M/ZoTp0ZZM46J9uk/Nkjzf/3eSRyx4Jnmc712k9zBV+nKjo66xWwfDd3safFxVDqG8C9YjtH/rmBfSDSlds1XlbtCBOh5G8c97aiUfg/Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrvT+55W; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrvT+55W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775905520; x=1807441520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5pEbQZ8S0Knsfj02uWWfh3yBzzBxH2/iM6gz0+jKhh8=;
  b=BrvT+55W5w5j1hc77Ns1lDRhMT910w/4SWuQjRNMonUk9sQDYrCVDGcU
   FsrXvGygrpV4ZhHPzVTw0E8dTom7VD9qlBZYsT+HIhGYB9QrnMiblTMoN
   fQhsUACRJCEqAqMSMwO98UwFUoiaer9zX8diDtkMN5wnakVeZZ+bCCglp
   RHn6oNNMd8A+VzmKzIYt2uxzf/QgLVxx65j91TGYsAFszBzmFa/rBXCqp
   iZjPz+ty/kyxDXePdKJP3LnBIlZzFqqBV9RV0Op6fXTjG2EbIqFgIeven
   s10ehe/XDP4uFT2KJThhS3NXqLoHnuZCT9UwBfiD8kwsKSLnMdzah4Xa5
   Q==;
X-CSE-ConnectionGUID: gmk+uEtoSleggJTO2SKdEQ==
X-CSE-MsgGUID: mk7mKPM0SVqEkKlAfZ5E+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79497472"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="79497472"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 04:05:20 -0700
X-CSE-ConnectionGUID: ySkWVnMBRwCJMZI2NzF23Q==
X-CSE-MsgGUID: ANxWJImeS8Kh0vLY1ovjww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="228297565"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 11 Apr 2026 04:05:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBW9M-00000000B41-2LT1;
	Sat, 11 Apr 2026 11:05:16 +0000
Date: Sat, 11 Apr 2026 13:04:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] ACPI: processor: idle: Fix incorrect power
 management decisions after power notify
Message-ID: <202604111336.AAgr6FPl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260407081141.2493581-3-lihuisong@huawei.com>
References: <20260407081141.2493581-3-lihuisong@huawei.com>
TO: Huisong Li <lihuisong@huawei.com>
TO: rafael@kernel.org
TO: lenb@kernel.org
CC: linux-acpi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linuxarm@huawei.com
CC: jonathan.cameron@huawei.com
CC: zhanjie9@hisilicon.com
CC: zhenglifeng1@huawei.com
CC: yubowen8@huawei.com
CC: wangzhi12@huawei.com
CC: zhangpengjie2@huawei.com
CC: wanghuiqiang@huawei.com
CC: lihuisong@huawei.com

Hi Huisong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.0-rc7]
[also build test WARNING on linus/master]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huisong-Li/cpuidle-Extract-and-export-no-lock-variants-of-cpuidle_unregister_device/20260411-041527
base:   v7.0-rc7
patch link:    https://lore.kernel.org/r/20260407081141.2493581-3-lihuisong%40huawei.com
patch subject: [PATCH v2 2/2] ACPI: processor: idle: Fix incorrect power management decisions after power notify
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260411/202604111336.AAgr6FPl-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111336.AAgr6FPl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604111336.AAgr6FPl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:42:
>> ./include/linux/cpuidle.h:230:13: warning: 'cpuidle_unregister_device_no_lock' defined but not used [-Wunused-function]
     230 | static void cpuidle_unregister_device_no_lock(struct cpuidle_device *dev) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cpuidle_unregister_device_no_lock +230 ./include/linux/cpuidle.h

1a022e3f1be117 Boris Ostrovsky   2012-03-13  202  
bf4d1b5ddb78f8 Daniel Lezcano    2012-10-31  203  extern struct cpuidle_driver *cpuidle_get_cpu_driver(struct cpuidle_device *dev);
9bd616e3dbedfc Catalin Marinas   2016-06-01  204  static inline struct cpuidle_device *cpuidle_get_device(void)
9bd616e3dbedfc Catalin Marinas   2016-06-01  205  {return __this_cpu_read(cpuidle_devices); }
4f86d3a8e29720 Len Brown         2007-10-03  206  #else
d91ee5863b71e8 Len Brown         2011-04-01  207  static inline void disable_cpuidle(void) { }
ef2b22ac540c01 Rafael J. Wysocki 2015-03-02  208  static inline bool cpuidle_not_available(struct cpuidle_driver *drv,
ef2b22ac540c01 Rafael J. Wysocki 2015-03-02  209  					 struct cpuidle_device *dev)
ef2b22ac540c01 Rafael J. Wysocki 2015-03-02  210  {return true; }
907e30f1bb4a96 Daniel Lezcano    2014-03-03  211  static inline int cpuidle_select(struct cpuidle_driver *drv,
45f1ff59e27ca5 Rafael J. Wysocki 2018-03-22  212  				 struct cpuidle_device *dev, bool *stop_tick)
907e30f1bb4a96 Daniel Lezcano    2014-03-03  213  {return -ENODEV; }
907e30f1bb4a96 Daniel Lezcano    2014-03-03  214  static inline int cpuidle_enter(struct cpuidle_driver *drv,
907e30f1bb4a96 Daniel Lezcano    2014-03-03  215  				struct cpuidle_device *dev, int index)
907e30f1bb4a96 Daniel Lezcano    2014-03-03  216  {return -ENODEV; }
907e30f1bb4a96 Daniel Lezcano    2014-03-03  217  static inline void cpuidle_reflect(struct cpuidle_device *dev, int index) { }
7dcddef6f769d7 Stephen Rothwell  2019-07-31  218  static inline u64 cpuidle_poll_time(struct cpuidle_driver *drv,
259231a045616c Marcelo Tosatti   2019-07-03  219  			     struct cpuidle_device *dev)
259231a045616c Marcelo Tosatti   2019-07-03  220  {return 0; }
4f86d3a8e29720 Len Brown         2007-10-03  221  static inline int cpuidle_register_driver(struct cpuidle_driver *drv)
6b2c676bf32be9 Len Brown         2010-05-11  222  {return -ENODEV; }
752138df0dc2da Len Brown         2010-05-22  223  static inline struct cpuidle_driver *cpuidle_get_driver(void) {return NULL; }
cbda56d5fefceb Rafael J. Wysocki 2019-11-18  224  static inline void cpuidle_driver_state_disabled(struct cpuidle_driver *drv,
cbda56d5fefceb Rafael J. Wysocki 2019-11-18  225  					       int idx, bool disable) { }
4f86d3a8e29720 Len Brown         2007-10-03  226  static inline void cpuidle_unregister_driver(struct cpuidle_driver *drv) { }
4f86d3a8e29720 Len Brown         2007-10-03  227  static inline int cpuidle_register_device(struct cpuidle_device *dev)
6b2c676bf32be9 Len Brown         2010-05-11  228  {return -ENODEV; }
4f86d3a8e29720 Len Brown         2007-10-03  229  static inline void cpuidle_unregister_device(struct cpuidle_device *dev) { }
163761198da6ad Huisong Li        2026-04-07 @230  static void cpuidle_unregister_device_no_lock(struct cpuidle_device *dev) {}
4c637b2175a0dc Daniel Lezcano    2013-04-23  231  static inline int cpuidle_register(struct cpuidle_driver *drv,
4c637b2175a0dc Daniel Lezcano    2013-04-23  232  				   const struct cpumask *const coupled_cpus)
4c637b2175a0dc Daniel Lezcano    2013-04-23  233  {return -ENODEV; }
4c637b2175a0dc Daniel Lezcano    2013-04-23  234  static inline void cpuidle_unregister(struct cpuidle_driver *drv) { }
4f86d3a8e29720 Len Brown         2007-10-03  235  static inline void cpuidle_pause_and_lock(void) { }
4f86d3a8e29720 Len Brown         2007-10-03  236  static inline void cpuidle_resume_and_unlock(void) { }
8651f97bd951d0 Preeti U Murthy   2012-07-09  237  static inline void cpuidle_pause(void) { }
8651f97bd951d0 Preeti U Murthy   2012-07-09  238  static inline void cpuidle_resume(void) { }
4f86d3a8e29720 Len Brown         2007-10-03  239  static inline int cpuidle_enable_device(struct cpuidle_device *dev)
6b2c676bf32be9 Len Brown         2010-05-11  240  {return -ENODEV; }
4f86d3a8e29720 Len Brown         2007-10-03  241  static inline void cpuidle_disable_device(struct cpuidle_device *dev) { }
1a022e3f1be117 Boris Ostrovsky   2012-03-13  242  static inline int cpuidle_play_dead(void) {return -ENODEV; }
87e9b9f1d86c2e Rafael J. Wysocki 2015-05-16  243  static inline struct cpuidle_driver *cpuidle_get_cpu_driver(
87e9b9f1d86c2e Rafael J. Wysocki 2015-05-16  244  	struct cpuidle_device *dev) {return NULL; }
9bd616e3dbedfc Catalin Marinas   2016-06-01  245  static inline struct cpuidle_device *cpuidle_get_device(void) {return NULL; }
87e9b9f1d86c2e Rafael J. Wysocki 2015-05-16  246  #endif
87e9b9f1d86c2e Rafael J. Wysocki 2015-05-16  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
