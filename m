Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCE03D75
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Jul 2023 21:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690751846; x=1722287846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ZBmBaNfyHqrdjAL5aA6aGP4XSRv6g3jPH8VHVFJ28w=;
  b=S82ad6fvkNh92pGCYIRQRJOsGz+wlVbgQl5f3DHL6M4x3TIev6ym+4hc
   O9p/ckZYw7QgVxpsgCjWRw8nFlpN8toI9MDjNxaILkVNl3exighi8rsyL
   REJCN3F0xLxo2oFKcQCnDI1t2khkdlSnkQYPNxMnWfzRveDYlG31mTkF1
   U7HnMVp25MbKt2q8dwC6VnPmtcC9DT0l5WmUwqlkav3oHJmGe/AaIDag7
   ny039gSkcUj/spMVwErci4YWS/AoFM/7sUqjQlqwTQD7zKGSVbvZJGc0j
   oyX/pMvLf3XhGwTRNl8C60rVR/ZiYCJZzYdj+s5TXqsSzT/Hw60yUTeZ7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348483243"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="348483243"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 14:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="1058721686"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="1058721686"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2023 14:17:24 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQDn1-0004mV-14;
	Sun, 30 Jul 2023 21:17:23 +0000
Date: Mon, 31 Jul 2023 05:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH 4/7] sched/fair: Calculate the scan depth for idle
 balance based on system utilization
Message-ID: <202307310545.yIIAUNvV-lkp@intel.com>
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
In-Reply-To: <61e6fce60ca738215b6e5ad9033fb692c3a8fbb1.1690273854.git.yu.c.chen@intel.com>
References: <61e6fce60ca738215b6e5ad9033fb692c3a8fbb1.1690273854.git.yu.c.chen@intel.com>
TO: Chen Yu <yu.c.chen@intel.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.5-rc4]
[cannot apply to next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu/sched-topology-Assign-sd_share-for-all-non-NUMA-sched-domains/20230727-144634
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/61e6fce60ca738215b6e5ad9033fb692c3a8fbb1.1690273854.git.yu.c.chen%40intel.com
patch subject: [RFC PATCH 4/7] sched/fair: Calculate the scan depth for idle balance based on system utilization
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: m68k-randconfig-r052-20230730 (https://download.01.org/0day-ci/archive/20230731/202307310545.yIIAUNvV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310545.yIIAUNvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307310545.yIIAUNvV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:10303:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

vim +10303 kernel/sched/fair.c

68d8d6c49d1ef0 Chen Yu 2023-07-27  10279  
f3d2a482eb6ae1 Chen Yu 2023-07-27  10280  static void update_ilb_group_scan(struct lb_env *env,
f3d2a482eb6ae1 Chen Yu 2023-07-27  10281  				  unsigned long sum_util,
f3d2a482eb6ae1 Chen Yu 2023-07-27  10282  				  struct sched_domain_shared *sd_share)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10283  {
f3d2a482eb6ae1 Chen Yu 2023-07-27  10284  	u64 tmp, nr_scan;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10285  
f3d2a482eb6ae1 Chen Yu 2023-07-27  10286  	if (!sched_feat(ILB_UTIL))
f3d2a482eb6ae1 Chen Yu 2023-07-27  10287  		return;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10288  
f3d2a482eb6ae1 Chen Yu 2023-07-27  10289  	if (!sd_share)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10290  		return;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10291  
f3d2a482eb6ae1 Chen Yu 2023-07-27  10292  	if (env->idle == CPU_NEWLY_IDLE)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10293  		return;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10294  
f3d2a482eb6ae1 Chen Yu 2023-07-27  10295  	/*
f3d2a482eb6ae1 Chen Yu 2023-07-27  10296  	 * Limit the newidle balance scan depth based on overall system
f3d2a482eb6ae1 Chen Yu 2023-07-27  10297  	 * utilization:
f3d2a482eb6ae1 Chen Yu 2023-07-27  10298  	 * nr_groups_scan = nr_groups * (1 - util_ratio)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10299  	 * and util_ratio = sum_util / (sd_weight * SCHED_CAPACITY_SCALE)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10300  	 */
f3d2a482eb6ae1 Chen Yu 2023-07-27  10301  	nr_scan = env->sd->nr_groups * sum_util;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10302  	tmp = env->sd->span_weight * SCHED_CAPACITY_SCALE;
f3d2a482eb6ae1 Chen Yu 2023-07-27 @10303  	do_div(nr_scan, tmp);
f3d2a482eb6ae1 Chen Yu 2023-07-27  10304  	nr_scan = env->sd->nr_groups - nr_scan;
f3d2a482eb6ae1 Chen Yu 2023-07-27  10305  	if ((int)nr_scan != sd_share->nr_sg_scan)
f3d2a482eb6ae1 Chen Yu 2023-07-27  10306  		WRITE_ONCE(sd_share->nr_sg_scan, (int)nr_scan);
f3d2a482eb6ae1 Chen Yu 2023-07-27  10307  }
f3d2a482eb6ae1 Chen Yu 2023-07-27  10308  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
