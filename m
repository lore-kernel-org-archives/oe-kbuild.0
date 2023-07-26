Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249A81BEF1
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 21:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690405843; x=1721941843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BPzqYEa8NeD7cHQq1AI3wwXs3VH3QpfZGPTlJSl/B3g=;
  b=NGa0B13VaY1HyNmwu/Or8XaJ9rfIzeafjb2WVNm7/CWUPX43XYE5ufKG
   3ROmBHm20Ve1sxztdtwFoL8LaeR3mU9pYToJG/YjiuPH2KRoo4YOc71H8
   ws4xnU4CRl89sCrEAtZEst66Qz+F9CAxJpcF85lbM/y4YF2eOXHZ+L2bv
   6vnziS+85+5GNbcbuk9ssp7h8v6YOVpYNDkriVOYs85OIwsvIngX+0/ZI
   HkaUHX0TrHhTqLdOAs9S0kzfwMKzKODBQ5u4jmWdPtuPQYp2ZK3O2EPVC
   B7HlzXTkC09t2lcaJ7va4GEPXS8/MGFRONrWv/SlbeEBaFoaGp6ePgHza
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358129515"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="358129515"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 14:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057369633"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="1057369633"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 14:10:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOlmJ-0001Kx-27;
	Wed, 26 Jul 2023 21:10:39 +0000
Date: Thu, 27 Jul 2023 05:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307270518.CdmV7NKr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/mm/init.c:590:29: sparse: sparse: bad integer constant expression"
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
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230726]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-r071-20230725 (https://download.01.org/0day-ci/archive/20230727/202307270518.CdmV7NKr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270518.CdmV7NKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307270518.CdmV7NKr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/mm/init.c:590:29: sparse: sparse: bad integer constant expression
>> arch/x86/mm/init.c:590:29: sparse: sparse: static assertion failed: "clamp() low limit (typeof(((phys_addr_t)(start_pfn) << 12)))(r_start) greater than high limit (typeof(((phys_addr_t)(start_pfn) << 12)))(r_end)"
   arch/x86/mm/init.c:591:27: sparse: sparse: bad integer constant expression
>> arch/x86/mm/init.c:591:27: sparse: sparse: static assertion failed: "clamp() low limit (typeof(((phys_addr_t)(end_pfn) << 12)))(r_start) greater than high limit (typeof(((phys_addr_t)(end_pfn) << 12)))(r_end)"
--
   drivers/cpufreq/cpufreq_powersave.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/cpufreq_performance.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/cpufreq_userspace.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/freq_table.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/cpufreq.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
>> drivers/cpufreq/cpufreq.c:538:23: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/cpufreq.c:538:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   drivers/cpufreq/cpufreq.c:2126:23: sparse: sparse: bad integer constant expression
   drivers/cpufreq/cpufreq.c:2126:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/cpufreq_ondemand.c: note: in included file (through drivers/cpufreq/cpufreq_governor.h, drivers/cpufreq/cpufreq_ondemand.h):
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/cpufreq_governor.c: note: in included file (through drivers/cpufreq/cpufreq_governor.h):
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/cpufreq_governor_attr_set.c: note: in included file (through drivers/cpufreq/cpufreq_governor.h):
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/cpufreq-dt.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/speedstep-lib.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/cpufreq/p4-clockmod.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
>> drivers/firmware/sysfb_simplefb.c:60:34: sparse: sparse: too long token expansion
>> drivers/firmware/sysfb_simplefb.c:60:34: sparse: sparse: too long token expansion
--
   fs/ntfs3/fsntfs.c:2679:1: sparse: sparse: no newline at end of file
>> fs/ntfs3/fsntfs.c:419:17: sparse: sparse: bad integer constant expression
>> fs/ntfs3/fsntfs.c:419:17: sparse: sparse: static assertion failed: "clamp() low limit (typeof(len))(zlen2) greater than high limit (typeof(len))(zlen)"
--
>> drivers/powercap/dtpm.c:277:23: sparse: sparse: bad integer constant expression
>> drivers/powercap/dtpm.c:277:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(power_limit))(dtpm->power_min) greater than high limit (typeof(power_limit))(dtpm->power_max)"
--
>> drivers/spi/spi-dw-core.c:682:20: sparse: sparse: bad integer constant expression
>> drivers/spi/spi-dw-core.c:682:20: sparse: sparse: static assertion failed: "clamp() low limit 0U greater than high limit dws->max_mem_freq"
--
   arch/x86/kernel/cpu/aperfmperf.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   arch/x86/kernel/cpu/proc.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/base/power/qos.c: note: in included file (through include/trace/events/power.h):
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/base/power/wakeup.c: note: in included file (through include/trace/events/power.h):
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
   drivers/base/power/main.c: note: in included file (through include/trace/events/power.h):
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
--
>> drivers/leds/flash/leds-max77693.c:700:14: sparse: sparse: bad integer constant expression
>> drivers/leds/flash/leds-max77693.c:700:14: sparse: sparse: static assertion failed: "clamp() low limit (typeof(*v))(min) greater than high limit (typeof(*v))(max)"
--
   kernel/sched/fair.c: note: in included file (through kernel/sched/sched.h):
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   kernel/sched/fair.c:3521:16: sparse: sparse: bad integer constant expression
>> kernel/sched/fair.c:3521:16: sparse: sparse: static assertion failed: "clamp() low limit (long)((1UL << 1)) greater than high limit (long)(tg_shares)"
   kernel/sched/fair.c:9226:20: sparse: sparse: bad integer constant expression
>> kernel/sched/fair.c:9226:20: sparse: sparse: static assertion failed: "clamp() low limit 1UL greater than high limit max_load_balance_interval"
   kernel/sched/fair.c:11091:20: sparse: sparse: bad integer constant expression
   kernel/sched/fair.c:11091:20: sparse: sparse: static assertion failed: "clamp() low limit 1UL greater than high limit max_load_balance_interval"
   kernel/sched/fair.c:5566:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5566:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5566:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9762:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9762:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9762:22: sparse:    struct task_struct *
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *
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
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   kernel/sched/core.c:264:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:264:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:264:56: sparse:    struct task_struct *
   kernel/sched/core.c:6285:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6285:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6285:32: sparse:    struct task_struct *
   kernel/sched/core.c:6316:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6316:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6316:23: sparse:    struct task_struct *
   kernel/sched/core.c:6324:46: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6324:46: sparse:    struct task_struct *
   kernel/sched/core.c:6324:46: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7128:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7128:17: sparse:    struct task_struct *
   kernel/sched/core.c:7128:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7344:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7344:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7344:22: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file:
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
   kernel/sched/build_policy.c: note: in included file (through kernel/sched/sched.h):
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
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
--
   kernel/sched/build_utility.c: note: in included file:
>> include/linux/cpufreq.h:866:23: sparse: sparse: bad integer constant expression
>> include/linux/cpufreq.h:866:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:934:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:934:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   include/linux/cpufreq.h:1019:23: sparse: sparse: bad integer constant expression
   include/linux/cpufreq.h:1019:23: sparse: sparse: static assertion failed: "clamp() low limit (typeof(target_freq))(policy->min) greater than high limit (typeof(target_freq))(policy->max)"
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/core_sched.c:276:37: sparse: sparse: incompatible types in conditional expression (different address spaces):
   kernel/sched/core_sched.c:276:37: sparse:    struct task_struct *
   kernel/sched/core_sched.c:276:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2111:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2111:25: sparse:    struct task_struct *

vim +590 arch/x86/mm/init.c

c14fa0b63b5b42 Yinghai Lu      2012-11-16  567  
66520ebc2df3fe Jacob Shin      2012-11-16  568  /*
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  569   * We need to iterate through the E820 memory map and create direct mappings
09821ff1d50a1e Ingo Molnar     2017-01-28  570   * for only E820_TYPE_RAM and E820_KERN_RESERVED regions. We cannot simply
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  571   * create direct mappings for all pfns from [0 to max_low_pfn) and
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  572   * [4GB to max_pfn) because of possible memory holes in high addresses
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  573   * that cannot be marked as UC by fixed/variable range MTRRs.
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  574   * Depending on the alignment of E820 ranges, this may possibly result
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  575   * in using smaller size (i.e. 4K instead of 2M or 1G) page tables.
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  576   *
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  577   * init_mem_mapping() calls init_range_memory_mapping() with big range.
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  578   * That range would have hole in the middle or ends, and only ram parts
cf8b166d5c1c89 Zhang Yanfei    2013-05-09  579   * will be mapped in init_range_memory_mapping().
66520ebc2df3fe Jacob Shin      2012-11-16  580   */
8d57470d8f8596 Yinghai Lu      2012-11-16  581  static unsigned long __init init_range_memory_mapping(
b8fd39c036ab98 Yinghai Lu      2012-11-16  582  					   unsigned long r_start,
b8fd39c036ab98 Yinghai Lu      2012-11-16  583  					   unsigned long r_end)
66520ebc2df3fe Jacob Shin      2012-11-16  584  {
66520ebc2df3fe Jacob Shin      2012-11-16  585  	unsigned long start_pfn, end_pfn;
8d57470d8f8596 Yinghai Lu      2012-11-16  586  	unsigned long mapped_ram_size = 0;
66520ebc2df3fe Jacob Shin      2012-11-16  587  	int i;
66520ebc2df3fe Jacob Shin      2012-11-16  588  
66520ebc2df3fe Jacob Shin      2012-11-16  589  	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, NULL) {
b8fd39c036ab98 Yinghai Lu      2012-11-16 @590  		u64 start = clamp_val(PFN_PHYS(start_pfn), r_start, r_end);
b8fd39c036ab98 Yinghai Lu      2012-11-16 @591  		u64 end = clamp_val(PFN_PHYS(end_pfn), r_start, r_end);
b8fd39c036ab98 Yinghai Lu      2012-11-16  592  		if (start >= end)
66520ebc2df3fe Jacob Shin      2012-11-16  593  			continue;
66520ebc2df3fe Jacob Shin      2012-11-16  594  
c9b3234a6abada Yinghai Lu      2013-01-24  595  		/*
c9b3234a6abada Yinghai Lu      2013-01-24  596  		 * if it is overlapping with brk pgt, we need to
c9b3234a6abada Yinghai Lu      2013-01-24  597  		 * alloc pgt buf from memblock instead.
c9b3234a6abada Yinghai Lu      2013-01-24  598  		 */
c9b3234a6abada Yinghai Lu      2013-01-24  599  		can_use_brk_pgt = max(start, (u64)pgt_buf_end<<PAGE_SHIFT) >=
c9b3234a6abada Yinghai Lu      2013-01-24  600  				    min(end, (u64)pgt_buf_top<<PAGE_SHIFT);
c164fbb40c43f8 Logan Gunthorpe 2020-04-10  601  		init_memory_mapping(start, end, PAGE_KERNEL);
8d57470d8f8596 Yinghai Lu      2012-11-16  602  		mapped_ram_size += end - start;
c9b3234a6abada Yinghai Lu      2013-01-24  603  		can_use_brk_pgt = true;
66520ebc2df3fe Jacob Shin      2012-11-16  604  	}
8d57470d8f8596 Yinghai Lu      2012-11-16  605  
8d57470d8f8596 Yinghai Lu      2012-11-16  606  	return mapped_ram_size;
66520ebc2df3fe Jacob Shin      2012-11-16  607  }
66520ebc2df3fe Jacob Shin      2012-11-16  608  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
