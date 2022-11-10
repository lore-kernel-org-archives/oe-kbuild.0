Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94193185E
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Nov 2022 13:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668086787; x=1699622787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t/wpf0eqzKhy5yyx2KAu421jgKduuPSm7kt6Z2vBnig=;
  b=GpV/gimSZhjE6uTpt34EgCDXibLH6v9nBcDCH/fAWqFiSzXgk3hQDz5I
   Y/oUVM4jT5NYGoBwSAxLGje3RrttEW1dhXc2sTYbeI1//7PVwRdNj/Itg
   krH6BGiFw7kQyJI4VsK9UejkxJRF1kR+aqu7psmPxmxbjkeqrDBSH5D7n
   2xZJ1yUJOieMCtnNYIqBXLrst1GFMXdrCd0uUl5W3a5JVY1pIb1acFlSA
   YiiROEgMYiUqCCZ06YzlxCDbePD/SkqpIXgZ4fi3MZXZvelu8il3KfvOK
   7Y55QESNhwMSaPteDdXlyV9CDrk8WbvxX2/6tGGU0eGTnKq8WWKwELIiA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="375551867"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="375551867"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 05:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="668405848"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="668405848"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Nov 2022 05:26:25 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ot7ZZ-0002rL-0f;
	Thu, 10 Nov 2022 13:26:25 +0000
Date: Thu, 10 Nov 2022 21:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/perf/core-book3s.c:2474:10: warning: Using pointer that
 is a temporary. [danglingTemporaryLifetime]
Message-ID: <202211102101.7uiwpepc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/powerpc/perf/core-book3s.c:2474:10: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Nicholas Piggin <npiggin@gmail.com>

Hi Athira,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f67dd6ce0723ad013395f20a3f79d8a437d3f455
commit: 429a64f6e91fbfe4912d17247c27d0d66767b1c2 powerpc/perf: Only define power_pmu_wants_prompt_pmi() for CONFIG_PPC64
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 429a64f6e91fbfe4912d17247c27d0d66767b1c2
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/powerpc/perf/core-book3s.c:2474:10: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
     memset(cpuhw, 0, sizeof(*cpuhw));
            ^
   arch/powerpc/perf/core-book3s.c:2471:32: note: Address of variable taken here.
    struct cpu_hw_events *cpuhw = &per_cpu(cpu_hw_events, cpu);
                                  ^
   arch/powerpc/perf/core-book3s.c:2471:40: note: Temporary created here.
    struct cpu_hw_events *cpuhw = &per_cpu(cpu_hw_events, cpu);
                                          ^
   arch/powerpc/perf/core-book3s.c:2474:10: note: Using pointer that is a temporary.
     memset(cpuhw, 0, sizeof(*cpuhw));
            ^
   arch/powerpc/perf/core-book3s.c:2475:3: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
     cpuhw->mmcr.mmcr0 = MMCR0_FC;
     ^
   arch/powerpc/perf/core-book3s.c:2471:32: note: Address of variable taken here.
    struct cpu_hw_events *cpuhw = &per_cpu(cpu_hw_events, cpu);
                                  ^
   arch/powerpc/perf/core-book3s.c:2471:40: note: Temporary created here.
    struct cpu_hw_events *cpuhw = &per_cpu(cpu_hw_events, cpu);
                                          ^
   arch/powerpc/perf/core-book3s.c:2475:3: note: Using pointer that is a temporary.
     cpuhw->mmcr.mmcr0 = MMCR0_FC;
     ^
>> arch/powerpc/perf/core-book3s.c:1331:62: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     val &= ~(MMCR0_EBE | MMCR0_BHRBA | MMCR0_PMCC | MMCR0_PMAO |
                                                                ^

vim +2474 arch/powerpc/perf/core-book3s.c

0c9108b0837063 arch/powerpc/perf/core-book3s.c    Ravi Bangoria   2018-11-21  2468  
7c98bd72081c44 arch/powerpc/perf/core-book3s.c    Daniel Axtens   2016-09-06  2469  static int power_pmu_prepare_cpu(unsigned int cpu)
01d0287f068de2 arch/powerpc/kernel/perf_counter.c Paul Mackerras  2009-01-14  2470  {
cdd6c482c9ff9c arch/powerpc/kernel/perf_event.c   Ingo Molnar     2009-09-21  2471  	struct cpu_hw_events *cpuhw = &per_cpu(cpu_hw_events, cpu);
01d0287f068de2 arch/powerpc/kernel/perf_counter.c Paul Mackerras  2009-01-14  2472  
57ecde42cc7493 arch/powerpc/perf/core-book3s.c    Thomas Gleixner 2016-07-13  2473  	if (ppmu) {
01d0287f068de2 arch/powerpc/kernel/perf_counter.c Paul Mackerras  2009-01-14 @2474  		memset(cpuhw, 0, sizeof(*cpuhw));
78d76819e6f046 arch/powerpc/perf/core-book3s.c    Athira Rajeev   2020-07-17  2475  		cpuhw->mmcr.mmcr0 = MMCR0_FC;
01d0287f068de2 arch/powerpc/kernel/perf_counter.c Paul Mackerras  2009-01-14  2476  	}
57ecde42cc7493 arch/powerpc/perf/core-book3s.c    Thomas Gleixner 2016-07-13  2477  	return 0;
3f6da390539882 arch/powerpc/kernel/perf_event.c   Peter Zijlstra  2010-03-05  2478  }
3f6da390539882 arch/powerpc/kernel/perf_event.c   Peter Zijlstra  2010-03-05  2479  

:::::: The code at line 2474 was first introduced by commit
:::::: 01d0287f068de2934109ba9b989d8807526cccc2 powerpc/perf_counter: Make sure PMU gets enabled properly

:::::: TO: Paul Mackerras <paulus@samba.org>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
