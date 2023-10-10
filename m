Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E117E
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Oct 2023 00:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtGQsOwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696896669; x=1728432669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UtRXXDI95Q8kNxAh6iqQdkdAZJcxe37mmnxOKemPEKs=;
  b=VtGQsOwOOkCOJSprI2L8YXQle9aSYPv1fuVTS75Mf9v5FItxPc0QvZZN
   h4jllCc+m9U+wq2SlKhg04ahRhb8y1gF/qlvz7R0afTOASOu3QzWSkJKn
   8N9S5w6JZK0wAhq9W2bknnqco/Ha7nKmEpevTaGlCZBMEXdVIhP0yEE1G
   n7eStixza+tJGtE56DD29dRXOAyPPgMbh8aO1Rw6e7AfOEjKoJE2qzJIj
   rRL6b7c9Ar4kMAO937zQ2n0prG0kvIUCkSE789pz/EnyYhB4lyVmsps2x
   GEDxsRWRe+oCXSdFTZ1rRzNkxaXbKxba8/cnJ3qFHrW63IRDKleyNeVyw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2864371"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="2864371"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 17:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="753202903"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="753202903"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 09 Oct 2023 17:11:05 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq0L1-0000rC-0S;
	Tue, 10 Oct 2023 00:11:03 +0000
Date: Tue, 10 Oct 2023 08:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 12/13] arch/x86/include/asm/preempt.h:104:16:
 sparse:    int preempt_offset
Message-ID: <202310100819.qy7sOelO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/include/asm/preempt.h:104:16: sparse:    int preempt_offset"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Uros Bizjak <ubizjak@gmail.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Nadav Amit <namit@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   a3c7a64f9b764e200338130253dfe4488db03f4f
commit: ca4256348660cb2162668ec3d13d1f921d05374a [12/13] x86/percpu: Use C for percpu read/write accessors
:::::: branch date: 8 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-123-20231009 (https://download.01.org/0day-ci/archive/20231010/202310100819.qy7sOelO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100819.qy7sOelO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310100819.qy7sOelO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/flex_proportions.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
   arch/x86/include/asm/percpu.h:550:49: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/percpu.h:550:49: sparse: sparse: got __seg_gs
   arch/x86/include/asm/percpu.h:564:33: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/percpu.h:564:33: sparse: sparse: got __seg_gs
   lib/flex_proportions.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/percpu_counter.h, ...):
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:27:16: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:38:19: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:38:19: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:61:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:61:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:66:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:66:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:71:18: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:71:18: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:80:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:85:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:95:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:95:16: sparse: sparse: got __seg_gs
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: got __seg_gs
   lib/flex_proportions.c: note: in included file (through include/linux/flex_proportions.h):
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   include/linux/seqlock.h:269:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/seqlock.h:269:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c:73:9: sparse: sparse: Expected ) at end of cast operator
   lib/flex_proportions.c:73:9: sparse: sparse: got __seg_gs
   lib/flex_proportions.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/percpu_counter.h, ...):
   arch/x86/include/asm/preempt.h:27:55: sparse: sparse: incompatible types for operation (&):
   arch/x86/include/asm/preempt.h:27:55: sparse:    void
   arch/x86/include/asm/preempt.h:27:55: sparse:    unsigned int
   arch/x86/include/asm/preempt.h:27:55: sparse: sparse: incompatible types for operation (&):
   arch/x86/include/asm/preempt.h:27:55: sparse:    void
   arch/x86/include/asm/preempt.h:27:55: sparse:    unsigned int
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: incompatible types for operation (==):
   arch/x86/include/asm/preempt.h:104:16: sparse:    void
>> arch/x86/include/asm/preempt.h:104:16: sparse:    int preempt_offset
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: incompatible types for operation (==):
   arch/x86/include/asm/preempt.h:104:16: sparse:    void
>> arch/x86/include/asm/preempt.h:104:16: sparse:    int preempt_offset

vim +104 arch/x86/include/asm/preempt.h

c2daa3bed53a81 Peter Zijlstra        2013-08-14   98  
c2daa3bed53a81 Peter Zijlstra        2013-08-14   99  /*
c2daa3bed53a81 Peter Zijlstra        2013-08-14  100   * Returns true when we need to resched and can (barring IRQ state).
c2daa3bed53a81 Peter Zijlstra        2013-08-14  101   */
fe32d3cd5e8eb0 Konstantin Khlebnikov 2015-07-15  102  static __always_inline bool should_resched(int preempt_offset)
c2daa3bed53a81 Peter Zijlstra        2013-08-14  103  {
64701838bf0575 Thomas Gleixner       2022-09-15 @104  	return unlikely(raw_cpu_read_4(pcpu_hot.preempt_count) == preempt_offset);
c2daa3bed53a81 Peter Zijlstra        2013-08-14  105  }
c2daa3bed53a81 Peter Zijlstra        2013-08-14  106  

:::::: The code at line 104 was first introduced by commit
:::::: 64701838bf0575ef8acb1ad2db5934e864f3e6c3 x86/percpu: Move preempt_count next to current_task

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
