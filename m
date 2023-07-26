Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43AAD47
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 09:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690363815; x=1721899815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pvP3vxTUzb2a/0yElcd5I7R5s2UbzKWZK7PAueIlG3I=;
  b=E9DRt6PJJ6B2UtHf0gUVK4KiqoVGwEpHAPYofD9CWfHoCwwp3WbUXu9i
   gKq7jCJdOAx9u7O33QmZipZnzN2OVK7FZjknPkBAWB9OC3RuMAUT+JKDV
   v4Y46MDf7KFOq7yrehA4mPjdDbJ4xowIWJXagNaOKJDlwzJrvIFaqOAiy
   365mpmvSLqa4qTTyEelZz6Dg5xXFXd25FVSzRaZMRlfn7gLj2X59v6WzY
   i8y8e1CTZyYR1F7vO7gYMtz0sJl2MZN8uKPZdfAlv1SA/fj3DqZZP/frB
   SQ2+idafMXPEqL5yFXkxofaafXl1Fto8dEkEemiLmldlvcK7+QFPo+uou
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="348245253"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="348245253"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 02:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="796511170"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="796511170"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 02:30:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOaqP-0000rT-1S;
	Wed, 26 Jul 2023 09:30:10 +0000
Date: Wed, 26 Jul 2023 17:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307261703.ZkkLW0jy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/kernel/check.c:117:25: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.5-rc3 next-20230726]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-i061-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261703.ZkkLW0jy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261703.ZkkLW0jy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307261703.ZkkLW0jy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/check.c:117:25: sparse: sparse: bad integer constant expression
>> arch/x86/kernel/check.c:117:25: sparse: sparse: static assertion failed: "clamp() low limit (phys_addr_t)(((1UL) << 12)) greater than high limit (phys_addr_t)(corruption_check_size)"
   arch/x86/kernel/check.c:119:23: sparse: sparse: bad integer constant expression
   arch/x86/kernel/check.c:119:23: sparse: sparse: static assertion failed: "clamp() low limit (phys_addr_t)(((1UL) << 12)) greater than high limit (phys_addr_t)(corruption_check_size)"
--
   drivers/cpufreq/intel_pstate.c: note: in included file:
   include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
>> drivers/cpufreq/intel_pstate.c:1383:31: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/intel_pstate.c:1383:31: sparse: sparse: static assertion failed: "clamp() low limit (int)(global.min_perf_pct) greater than high limit (int)(100)"
   drivers/cpufreq/intel_pstate.c:1416:31: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/intel_pstate.c:1416:31: sparse: sparse: static assertion failed: "clamp() low limit (int)(min_perf_pct_min()) greater than high limit (int)(global.max_perf_pct)"
   drivers/cpufreq/intel_pstate.c:1779:18: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/intel_pstate.c:1779:18: sparse: sparse: static assertion failed: "clamp() low limit (int32_t)(cpudata->vid.min) greater than high limit (int32_t)(cpudata->vid.max)"
   drivers/cpufreq/intel_pstate.c:2269:16: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/intel_pstate.c:2269:16: sparse: sparse: static assertion failed: "clamp() low limit (int)(min_pstate) greater than high limit (int)(max_pstate)"
   drivers/cpufreq/intel_pstate.c:2522:35: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/intel_pstate.c:2522:35: sparse: sparse: static assertion failed: "clamp() low limit (int32_t)(0) greater than high limit (int32_t)(max_policy_perf)"
   drivers/cpufreq/intel_pstate.c:2554:30: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/intel_pstate.c:2554:30: sparse: sparse: static assertion failed: "clamp() low limit (int32_t)(0) greater than high limit (int32_t)(global_max)"
   drivers/cpufreq/intel_pstate.c:2976:25: sparse: sparse: bad integer constant expression
   drivers/cpufreq/intel_pstate.c:2976:25: sparse: sparse: static assertion failed: "clamp() low limit (int)(min_pstate) greater than high limit (int)(max_pstate)"
--
>> arch/x86/mm/init_32.c:405:37: sparse: sparse: bad integer constant expression
>> arch/x86/mm/init_32.c:405:37: sparse: sparse: static assertion failed: "clamp() low limit (unsigned long)(start_pfn) greater than high limit (unsigned long)(end_pfn)"
   arch/x86/mm/init_32.c:407:39: sparse: sparse: bad integer constant expression
   arch/x86/mm/init_32.c:407:39: sparse: sparse: static assertion failed: "clamp() low limit (unsigned long)(start_pfn) greater than high limit (unsigned long)(end_pfn)"
--
>> drivers/net/virtio_net.c:1719:25: sparse: sparse: bad integer constant expression
>> drivers/net/virtio_net.c:1719:25: sparse: sparse: static assertion failed: "clamp() low limit (unsigned int)(rq->min_buf_len) greater than high limit (unsigned int)(((1UL) << 12) - hdr_len)"
--
   kernel/sched/fair.c: note: in included file (through kernel/sched/sched.h):
   include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   kernel/sched/fair.c: note: in included file:
>> kernel/sched/sched.h:3066:16: sparse: sparse: bad integer constant expression
>> kernel/sched/sched.h:3066:16: sparse: sparse: static assertion failed: "clamp() low limit min_util greater than high limit max_util"
   kernel/sched/fair.c:3521:16: sparse: sparse: bad integer constant expression
   kernel/sched/fair.c:3521:16: sparse: sparse: static assertion failed: "clamp() low limit (long)((1UL << 1)) greater than high limit (long)(tg_shares)"
   kernel/sched/fair.c:4356:16: sparse: sparse: bad integer constant expression
>> kernel/sched/fair.c:4356:16: sparse: sparse: static assertion failed: "clamp() low limit uclamp_min greater than high limit uclamp_max"
   kernel/sched/fair.c:9226:20: sparse: sparse: bad integer constant expression
   kernel/sched/fair.c:9226:20: sparse: sparse: static assertion failed: "clamp() low limit 1UL greater than high limit max_load_balance_interval"
   kernel/sched/fair.c:11091:20: sparse: sparse: bad integer constant expression
   kernel/sched/fair.c:11091:20: sparse: sparse: static assertion failed: "clamp() low limit 1UL greater than high limit max_load_balance_interval"
   kernel/sched/fair.c:9762:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9762:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9762:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6167:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
--
   kernel/sched/core.c: note: in included file (through kernel/sched/sched.h):
   include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   kernel/sched/core.c: note: in included file:
>> kernel/sched/sched.h:3066:16: sparse: sparse: bad integer constant expression
>> kernel/sched/sched.h:3066:16: sparse: sparse: static assertion failed: "clamp() low limit min_util greater than high limit max_util"
>> kernel/sched/core.c:1492:17: sparse: sparse: bad integer constant expression
>> kernel/sched/core.c:1492:17: sparse: sparse: static assertion failed: "clamp() low limit tg_min greater than high limit tg_max"
   kernel/sched/core.c:7128:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7128:17: sparse:    struct task_struct *
   kernel/sched/core.c:7128:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7344:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7344:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7344:22: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/core.c:2178:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2178:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2178:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2273:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2273:9: sparse:    struct task_struct *
--
   kernel/sched/build_utility.c: note: in included file:
   include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/sched.h:3066:16: sparse: sparse: bad integer constant expression
>> kernel/sched/sched.h:3066:16: sparse: sparse: static assertion failed: "clamp() low limit min_util greater than high limit max_util"
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
--
   kernel/sched/build_policy.c: note: in included file (through kernel/sched/sched.h):
   include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/sched.h:3066:16: sparse: sparse: bad integer constant expression
>> kernel/sched/sched.h:3066:16: sparse: sparse: static assertion failed: "clamp() low limit min_util greater than high limit max_util"
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:961:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:961:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:961:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2418:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2418:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2418:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2121:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2121:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2121:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2317:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2317:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2317:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2425:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2425:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2425:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2649:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2649:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2649:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *

vim +117 arch/x86/kernel/check.c

6784f7d0a5016a Arjan van de Ven 2008-10-05   90  
6784f7d0a5016a Arjan van de Ven 2008-10-05   91  
6784f7d0a5016a Arjan van de Ven 2008-10-05   92  void __init setup_bios_corruption_check(void)
6784f7d0a5016a Arjan van de Ven 2008-10-05   93  {
8d89ac808417e9 Tejun Heo        2011-07-12   94  	phys_addr_t start, end;
8d89ac808417e9 Tejun Heo        2011-07-12   95  	u64 i;
6784f7d0a5016a Arjan van de Ven 2008-10-05   96  
6784f7d0a5016a Arjan van de Ven 2008-10-05   97  	if (memory_corruption_check == -1) {
6784f7d0a5016a Arjan van de Ven 2008-10-05   98  		memory_corruption_check =
6784f7d0a5016a Arjan van de Ven 2008-10-05   99  #ifdef CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK
6784f7d0a5016a Arjan van de Ven 2008-10-05  100  			1
6784f7d0a5016a Arjan van de Ven 2008-10-05  101  #else
6784f7d0a5016a Arjan van de Ven 2008-10-05  102  			0
6784f7d0a5016a Arjan van de Ven 2008-10-05  103  #endif
6784f7d0a5016a Arjan van de Ven 2008-10-05  104  			;
6784f7d0a5016a Arjan van de Ven 2008-10-05  105  	}
6784f7d0a5016a Arjan van de Ven 2008-10-05  106  
6784f7d0a5016a Arjan van de Ven 2008-10-05  107  	if (corruption_check_size == 0)
6784f7d0a5016a Arjan van de Ven 2008-10-05  108  		memory_corruption_check = 0;
6784f7d0a5016a Arjan van de Ven 2008-10-05  109  
6784f7d0a5016a Arjan van de Ven 2008-10-05  110  	if (!memory_corruption_check)
6784f7d0a5016a Arjan van de Ven 2008-10-05  111  		return;
6784f7d0a5016a Arjan van de Ven 2008-10-05  112  
6784f7d0a5016a Arjan van de Ven 2008-10-05  113  	corruption_check_size = round_up(corruption_check_size, PAGE_SIZE);
6784f7d0a5016a Arjan van de Ven 2008-10-05  114  
fc6daaf9315187 Tony Luck        2015-06-24  115  	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE, &start, &end,
fc6daaf9315187 Tony Luck        2015-06-24  116  				NULL) {
8d89ac808417e9 Tejun Heo        2011-07-12 @117  		start = clamp_t(phys_addr_t, round_up(start, PAGE_SIZE),
8d89ac808417e9 Tejun Heo        2011-07-12  118  				PAGE_SIZE, corruption_check_size);
8d89ac808417e9 Tejun Heo        2011-07-12  119  		end = clamp_t(phys_addr_t, round_down(end, PAGE_SIZE),
8d89ac808417e9 Tejun Heo        2011-07-12  120  			      PAGE_SIZE, corruption_check_size);
8d89ac808417e9 Tejun Heo        2011-07-12  121  		if (start >= end)
8d89ac808417e9 Tejun Heo        2011-07-12  122  			continue;
6784f7d0a5016a Arjan van de Ven 2008-10-05  123  
24aa07882b672f Tejun Heo        2011-07-12  124  		memblock_reserve(start, end - start);
8d89ac808417e9 Tejun Heo        2011-07-12  125  		scan_areas[num_scan_areas].addr = start;
8d89ac808417e9 Tejun Heo        2011-07-12  126  		scan_areas[num_scan_areas].size = end - start;
6784f7d0a5016a Arjan van de Ven 2008-10-05  127  
6784f7d0a5016a Arjan van de Ven 2008-10-05  128  		/* Assume we've already mapped this early memory */
8d89ac808417e9 Tejun Heo        2011-07-12  129  		memset(__va(start), 0, end - start);
6784f7d0a5016a Arjan van de Ven 2008-10-05  130  
8d89ac808417e9 Tejun Heo        2011-07-12  131  		if (++num_scan_areas >= MAX_SCAN_AREAS)
8d89ac808417e9 Tejun Heo        2011-07-12  132  			break;
6784f7d0a5016a Arjan van de Ven 2008-10-05  133  	}
6784f7d0a5016a Arjan van de Ven 2008-10-05  134  
a7bd1dafdcc13e Naga Chumbalkar  2011-02-25  135  	if (num_scan_areas)
b1e3a25f587901 He Zhe           2018-08-14  136  		pr_info("Scanning %d areas for low memory corruption\n", num_scan_areas);
6784f7d0a5016a Arjan van de Ven 2008-10-05  137  }
6784f7d0a5016a Arjan van de Ven 2008-10-05  138  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
