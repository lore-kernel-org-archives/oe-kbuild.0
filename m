Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389623AA
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 06:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667802271; x=1699338271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vN2pae+C4UTalCEl8ukFWjA3HEDy6Xnjz+r+XKOGVs0=;
  b=jK4Yxmg+HNZZmMrGhOZbqhciIFVMXnrH/bIJnPsI7SNcbPsw+goe1oek
   ctrOaozV90YA+QSoqDDrvjDTytOQRxP7+dK6aRZLqcBp7f0wZ9xYvMmXi
   gfdoYOzhZsknrBsV5MD/frd4trJcDiF5Z2dT96NyXkpJZai+Qx24i6L6f
   VmXWjDoIuEVBGymrt/wNHgv3INqsvmhlnMmNUJW2zz5K/1RT3xcTTrElI
   potPpPi4146iBixxL2sJ0w1JMMj8sGcpCPxipWS/0QytpD1m3HKjKCHNz
   DVuCigNEDxgk1qpYZa5gFKiSde5snzPutH4Ei2Tb1LQ0TddaFZEN7uTJ1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="310336873"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="310336873"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2022 22:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="778368852"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="778368852"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Nov 2022 22:24:30 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1orvYb-0000Oa-27;
	Mon, 07 Nov 2022 06:24:29 +0000
Date: Mon, 7 Nov 2022 14:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/events/amd/core.c:537:15: warning: Using pointer that is a
 temporary. [danglingTemporaryLifetime]
Message-ID: <202211071423.0NO7y8Dh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/events/amd/core.c:537:15: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sandipan Das <sandipan.das@amd.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: 9603aa79e851c652f6da873205c92213af36b24f perf/x86/amd/core: Refactor branch attributes
date:   2 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 9603aa79e851c652f6da873205c92213af36b24f
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/events/amd/core.c:537:15: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    WARN_ON_ONCE(cpuc->amd_nb);
                 ^
   arch/x86/events/amd/core.c:535:31: note: Address of variable taken here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                 ^
   arch/x86/events/amd/core.c:535:39: note: Temporary created here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                         ^
   arch/x86/events/amd/core.c:537:15: note: Using pointer that is a temporary.
    WARN_ON_ONCE(cpuc->amd_nb);
                 ^
   arch/x86/events/amd/core.c:542:2: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    cpuc->amd_nb = amd_alloc_nb(cpu);
    ^
   arch/x86/events/amd/core.c:535:31: note: Address of variable taken here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                 ^
   arch/x86/events/amd/core.c:539:6: note: Assuming condition is false
    if (!x86_pmu.amd_nb_constraints)
        ^
   arch/x86/events/amd/core.c:535:39: note: Temporary created here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                         ^
   arch/x86/events/amd/core.c:542:2: note: Using pointer that is a temporary.
    cpuc->amd_nb = amd_alloc_nb(cpu);
    ^
   arch/x86/events/amd/core.c:543:7: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    if (!cpuc->amd_nb)
         ^
   arch/x86/events/amd/core.c:535:31: note: Address of variable taken here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                 ^
   arch/x86/events/amd/core.c:539:6: note: Assuming condition is false
    if (!x86_pmu.amd_nb_constraints)
        ^
   arch/x86/events/amd/core.c:535:39: note: Temporary created here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                         ^
   arch/x86/events/amd/core.c:543:7: note: Using pointer that is a temporary.
    if (!cpuc->amd_nb)
         ^
   arch/x86/events/amd/core.c:552:16: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    void **onln = &cpuc->kfree_on_online[X86_PERF_KFREE_SHARED];
                  ^
   arch/x86/events/amd/core.c:551:31: note: Address of variable taken here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                 ^
   arch/x86/events/amd/core.c:552:16: note: Address of variable taken here.
    void **onln = &cpuc->kfree_on_online[X86_PERF_KFREE_SHARED];
                  ^
   arch/x86/events/amd/core.c:551:39: note: Temporary created here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                         ^
   arch/x86/events/amd/core.c:552:16: note: Using pointer that is a temporary.
    void **onln = &cpuc->kfree_on_online[X86_PERF_KFREE_SHARED];
                  ^
   arch/x86/events/amd/core.c:552:17: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    void **onln = &cpuc->kfree_on_online[X86_PERF_KFREE_SHARED];
                   ^
   arch/x86/events/amd/core.c:551:31: note: Address of variable taken here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                 ^
   arch/x86/events/amd/core.c:551:39: note: Temporary created here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                         ^
   arch/x86/events/amd/core.c:552:17: note: Using pointer that is a temporary.
    void **onln = &cpuc->kfree_on_online[X86_PERF_KFREE_SHARED];
                   ^
   arch/x86/events/amd/core.c:556:2: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    cpuc->perf_ctr_virt_mask = AMD64_EVENTSEL_HOSTONLY;
    ^
   arch/x86/events/amd/core.c:551:31: note: Address of variable taken here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                 ^
   arch/x86/events/amd/core.c:551:39: note: Temporary created here.
    struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
                                         ^
   arch/x86/events/amd/core.c:556:2: note: Using pointer that is a temporary.
    cpuc->perf_ctr_virt_mask = AMD64_EVENTSEL_HOSTONLY;
    ^
   arch/x86/events/amd/core.c:592:6: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
    if (cpuhw->amd_nb) {
        ^
   arch/x86/events/amd/core.c:590:10: note: Address of variable taken here.
    cpuhw = &per_cpu(cpu_hw_events, cpu);
            ^
   arch/x86/events/amd/core.c:590:18: note: Temporary created here.
    cpuhw = &per_cpu(cpu_hw_events, cpu);
                    ^
   arch/x86/events/amd/core.c:592:6: note: Using pointer that is a temporary.
    if (cpuhw->amd_nb) {
        ^
   arch/x86/events/amd/core.c:593:23: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
     struct amd_nb *nb = cpuhw->amd_nb;
                         ^
   arch/x86/events/amd/core.c:590:10: note: Address of variable taken here.
    cpuhw = &per_cpu(cpu_hw_events, cpu);
            ^
   arch/x86/events/amd/core.c:590:18: note: Temporary created here.
    cpuhw = &per_cpu(cpu_hw_events, cpu);
                    ^
   arch/x86/events/amd/core.c:593:23: note: Using pointer that is a temporary.
     struct amd_nb *nb = cpuhw->amd_nb;
                         ^
>> arch/x86/events/amd/core.c:1363:9: warning: Same expression on both sides of '-'. [duplicateExpression]
           __EVENT_CONSTRAINT(0, even_ctr_mask, 0,
           ^

vim +537 arch/x86/events/amd/core.c

21d59e3e2c403c arch/x86/events/amd/core.c           Sandipan Das    2022-04-21  532  
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  533  static int amd_pmu_cpu_prepare(int cpu)
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  534  {
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  535  	struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  536  
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23 @537  	WARN_ON_ONCE(cpuc->amd_nb);
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  538  
32b62f446827f6 arch/x86/events/amd/core.c           Peter Zijlstra  2016-03-25  539  	if (!x86_pmu.amd_nb_constraints)
95ca792c7582fd arch/x86/events/amd/core.c           Thomas Gleixner 2016-07-13  540  		return 0;
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  541  
c079c791c5a062 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-11-25  542  	cpuc->amd_nb = amd_alloc_nb(cpu);
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  543  	if (!cpuc->amd_nb)
95ca792c7582fd arch/x86/events/amd/core.c           Thomas Gleixner 2016-07-13  544  		return -ENOMEM;
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  545  
95ca792c7582fd arch/x86/events/amd/core.c           Thomas Gleixner 2016-07-13  546  	return 0;
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  547  }
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  548  

:::::: The code at line 537 was first introduced by commit
:::::: b38b24ead33417146e051453d04bf60b8d2d7e25 perf, x86: Fix AMD hotplug & constraint initialization

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
