Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE031F61C
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Feb 2025 00:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739925582; cv=none; b=aCe9px5284rRtx4kxENjFVD6npXW1pqAeKvrx+XwAdApHOsBAUfgjx4o7LAjDfE+FX6Ws7j2faUs/MSctz9LyIOR8TJT0skX2OMqekV31zrl7XbouFjvLQdhBWFpdNN4DX/Ft0x4+FdDgPiYhZcTrE2btK9TEDV8J7LOLZNsEy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739925582; c=relaxed/simple;
	bh=CCGPumzoBG+X7/TjcfGzzplTjk9SjzCYjpLL8IXPQMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crBMTeuQFm06vGv1V7lKxeQAxsXRGd85NsNSjBP7FhexnHWNF3vt/SoxTm5rWggT7Usia3Z6vNLf02qSGDM9rP1b+FY/8TfaTsnLMM6i59JXU1ZCtS+5t0kFOUSoJcPxnZjDiyz4xdtStQVTyuZfoFJNqCLWUQfdJ6+O6g7V8yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aft5jBtE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aft5jBtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739925581; x=1771461581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CCGPumzoBG+X7/TjcfGzzplTjk9SjzCYjpLL8IXPQMI=;
  b=aft5jBtEAKhlTETUHkobDQZ35zM9RMdHaEzRoYgBEDdm6GwbGDVstW4X
   CuoPHRrGrmuyY6MVOSgXBOFbAvocgX2B/7zirjAxAsl772/2BWlxKwvJQ
   jeOGOedQ/PmyMsW6uEEx7RwG++aVKwJvtQDf+X5T/sr8S2mq5cFvvx3C+
   dHgMfJakc00CuQet96gcxe9zncxw4rzq51yTVhJchb9VhYntYoE+0wYGW
   TmJ7/+6PYNjZ6RPJNae1qvQGnMO4TJrVDIJKNATgyGW4c5X4sYphJXqeB
   gScVCYn+R+3FZMv1G9T5/6tWc4n0cpXS523+qATV/mc+oVkC3ZUKx6Z/P
   g==;
X-CSE-ConnectionGUID: ou+zvLaZTTCNdL3wfD77qA==
X-CSE-MsgGUID: LmwqLLXARSOfAJsma3TlTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28247045"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="28247045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:39:40 -0800
X-CSE-ConnectionGUID: zEFc3K3sTyS+wxINqh8pEA==
X-CSE-MsgGUID: swhGMV8aSOuUq/X5zHgljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119756485"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Feb 2025 16:39:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkY7k-00011H-1f;
	Wed, 19 Feb 2025 00:39:36 +0000
Date: Wed, 19 Feb 2025 08:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <202502190807.fz6fs2jz-lkp@intel.com>
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
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.14-rc3 next-20250218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Tseng/cpufreq-mediatek-using-global-lock-avoid-race-condition/20250214-154521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250214074353.1169864-2-chun-jen.tseng%40mediatek.com
patch subject: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race condition
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc-randconfig-r071-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190807.fz6fs2jz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502190807.fz6fs2jz-lkp@intel.com/

smatch warnings:
drivers/cpufreq/mediatek-cpufreq.c:367 mtk_cpufreq_opp_notifier() warn: inconsistent returns 'global &mtk_policy_lock'.

vim +367 drivers/cpufreq/mediatek-cpufreq.c

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
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  327  	mutex_lock(&mtk_policy_lock);
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
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  353  				return notifier_from_errno(ret);
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
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 @367  	return notifier_from_errno(ret);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  368  }
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  369  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
