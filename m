Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1197207E0C
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Feb 2025 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740220817; cv=none; b=mf0I9dSRvbqIlpX87qE3U4lB5z89XRjIHS4WNKqnbeZ3wMnDDZJx+GKxKpEurOv4tJOhOFeABrVCySo7I/inOf7w1phxrNnOC9GInQtqv4mAmaArPy4JPTl5HGRY/1fGBtFJNavlKEdVscESSSwwrF2HdlRCp6Z0OeIDDMqUujE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740220817; c=relaxed/simple;
	bh=R5CJ8XsVtYJOl4+QQvSmdmIGPnSYsn4PX9ymrlQJfZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkTsuEkyrmw4T33O+ste9DEPiusirz9haeMFokAWzEdPzs2FWhG1jano0CN7/LCfS/qoToRin65x+FPe7pBEiweBxe/jLBL1te+XJao2rPVQXLJr+U1Qv7axSObl1Z8BuDxZu6uAdmBzFnGJWsHbqA3Hs2lPCy8/axCNBiFVX3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ur1ElIWG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ur1ElIWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740220815; x=1771756815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5CJ8XsVtYJOl4+QQvSmdmIGPnSYsn4PX9ymrlQJfZo=;
  b=Ur1ElIWGuCvg+t60KLPtvJRZ4ECm/UriyaVax344u08RGVh+uHGl1EWt
   2b5iUf1PymioZH9Iea875D28CGtVMCGDJvJ/LJi8DIhfw4Rv1icuppo9q
   /Xs1MpQMVqEjpIUQztebvisE9Spw0TMWl0gakQjHzymnQ9sH5QwH8Agpm
   vT/lyBiDg+ymGhwooEZvZ+87eVdvFrY4udRIwPrKv7iSAm++R0zPLG4qT
   c1qsUka5UCj/vwQ3Q2g2sRXD/jNJnBwI7yV3gMXfXSg2lgZuEHAdcqc0X
   slb0GewX8GY67Ttp08vPwWV3XLQ5RgXHhHxMHhxfuFVm3JObVc+XJLFms
   w==;
X-CSE-ConnectionGUID: IhpNIe3tToKdNfLpcNVlIQ==
X-CSE-MsgGUID: F77UimgWTOiVFA8irgMF4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40953909"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="40953909"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 02:40:12 -0800
X-CSE-ConnectionGUID: +bQ0a7C+SJyi5NSV8UOeHw==
X-CSE-MsgGUID: WAKJhAyJS0igtCi8EmQR/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115431120"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2025 02:40:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlmvY-0006UJ-1m;
	Sat, 22 Feb 2025 10:40:08 +0000
Date: Sat, 22 Feb 2025 18:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <202502221831.Jbh8AYue-lkp@intel.com>
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
In-Reply-To: <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
References: <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
TO: Mark Tseng <chun-jen.tseng@mediatek.com>
TO: "Rafael J . Wysocki" <rafael@kernel.org>
TO: Viresh Kumar <viresh.kumar@linaro.org>
TO: MyungJoo Ham <myungjoo.ham@samsung.com>
TO: Kyungmin Park <kyungmin.park@samsung.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: linux-pm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com
CC: chun-jen.tseng@mediatek.com

Hi Mark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Tseng/cpufreq-mediatek-using-global-lock-avoid-race-condition/20250214-154521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250214074353.1169864-2-chun-jen.tseng%40mediatek.com
patch subject: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race condition
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-r054-20250221 (https://download.01.org/0day-ci/archive/20250222/202502221831.Jbh8AYue-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502221831.Jbh8AYue-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/cpufreq/mediatek-cpufreq.c:353:4-10: preceding lock on line 327

vim +353 drivers/cpufreq/mediatek-cpufreq.c

1453863fb02a18 drivers/cpufreq/mt8173-cpufreq.c   Pi-Cheng Chen 2015-08-19  316  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  317  static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  318  				    unsigned long event, void *data)
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  319  {
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  320  	struct dev_pm_opp *opp;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  321  	struct dev_pm_opp *new_opp;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  322  	struct mtk_cpu_dvfs_info *info;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  323  	unsigned long freq, volt;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  324  	struct cpufreq_policy *policy;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  325  	int ret = 0;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  326  
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14 @327  	mutex_lock(&mtk_policy_lock);
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  328  	opp = data;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  329  	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  330  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  331  	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  332  		freq = dev_pm_opp_get_freq(opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  333  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  334  		if (info->current_freq == freq) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  335  			volt = dev_pm_opp_get_voltage(opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  336  			ret = mtk_cpufreq_set_voltage(info, volt);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  337  			if (ret)
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  338  				dev_err(info->cpu_dev,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  339  					"failed to scale voltage: %d\n", ret);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  340  		}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  341  	} else if (event == OPP_EVENT_DISABLE) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  342  		freq = dev_pm_opp_get_freq(opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  343  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  344  		/* case of current opp item is disabled */
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  345  		if (info->current_freq == freq) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  346  			freq = 1;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  347  			new_opp = dev_pm_opp_find_freq_ceil(info->cpu_dev,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  348  							    &freq);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  349  			if (IS_ERR(new_opp)) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  350  				dev_err(info->cpu_dev,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  351  					"all opp items are disabled\n");
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  352  				ret = PTR_ERR(new_opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 @353  				return notifier_from_errno(ret);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  354  			}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  355  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  356  			dev_pm_opp_put(new_opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  357  			policy = cpufreq_cpu_get(info->opp_cpu);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  358  			if (policy) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  359  				cpufreq_driver_target(policy, freq / 1000,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  360  						      CPUFREQ_RELATION_L);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  361  				cpufreq_cpu_put(policy);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  362  			}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  363  		}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  364  	}
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  365  	mutex_unlock(&mtk_policy_lock);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  366  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  367  	return notifier_from_errno(ret);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  368  }
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  369  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
