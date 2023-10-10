Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F919464
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Oct 2023 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agxtWfQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696940491; x=1728476491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6+5l2IPvo2d8nhp6muOmasYQSIuWdmNGjEki7mrmtmU=;
  b=agxtWfQrJM9eRtkn5I2ZgBM8lknFJ89he/+ASxbKAokwxI3Dfiab0q/W
   k4/UQ1f+Osxuk16dVDcjJmfqeQtu+vUYS38D1vKmaWmBRM2pxQu69t72w
   BRsFGf2tc6PEY+llVQoUG8q6MfOAFJvsySMV9Br8bwFbV9wkm4MSGtjIV
   VW1wnF1iw8C4zPrvBYriMo3QcCu5Uc5kJUr88p0sLT7+olNSi/xkifj8W
   62McbFUQPzjEplmF5iUDcDDG8l7LwIOH/E5FBbUQ0zpYBPlUvdZ3R171j
   nVQxCD46MZB0aL6eLBOeAWalp1dkxYHBsxZlKcvR2MmFjYqWvzz/6Z//u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="364674776"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="364674776"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747056964"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="747056964"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2023 05:21:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqBjS-0000O8-1C;
	Tue, 10 Oct 2023 12:21:02 +0000
Date: Tue, 10 Oct 2023 20:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/13] include/linux/interrupt.h:612:16: sparse:
 sparse: too many errors
Message-ID: <202310102016.EJycBoUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/interrupt.h:612:16: sparse: sparse: too many errors"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Nadav Amit <namit@vmware.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Uros Bizjak <ubizjak@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   a3c7a64f9b764e200338130253dfe4488db03f4f
commit: 9a462b9eafa6dda16ea8429b151edb1fb535d744 [11/13] x86/percpu: Use compiler segment prefix qualifier
:::::: branch date: 20 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-122-20231010 (https://download.01.org/0day-ci/archive/20231010/202310102016.EJycBoUF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310102016.EJycBoUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310102016.EJycBoUF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/time.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/debugobjects.h, ...):
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
   arch/x86/kernel/time.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
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
   arch/x86/kernel/time.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/time.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/time.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/time.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/time.c: note: in included file:
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/x86_init.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/lockdep.h, ...):
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
   arch/x86/kernel/x86_init.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
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
   arch/x86/kernel/x86_init.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/x86_init.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/x86_init.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/x86_init.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, include/linux/pci.h):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/x86_init.c: note: in included file (through include/linux/pci.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/quirks.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/lockdep.h, ...):
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
   arch/x86/kernel/quirks.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
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
   arch/x86/kernel/quirks.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/quirks.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/quirks.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/quirks.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, include/linux/pci.h):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/quirks.c: note: in included file (through include/linux/pci.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/rtc.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   arch/x86/kernel/rtc.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
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
   arch/x86/kernel/rtc.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/rtc.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/rtc.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/rtc.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, include/linux/rtc.h, ...):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/rtc.c: note: in included file (through include/linux/rtc.h, include/linux/mc146818rtc.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/early-quirks.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/lockdep.h, ...):
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
   arch/x86/kernel/early-quirks.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
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
   arch/x86/kernel/early-quirks.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/early-quirks.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/early-quirks.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/early-quirks.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, include/linux/pci.h):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/early-quirks.c: note: in included file (through include/linux/pci.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/irq.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   arch/x86/kernel/irq.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
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
   arch/x86/kernel/irq.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/irq.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/irq.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/irq.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/irq.c: note: in included file:
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/hpet.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/debugobjects.h, ...):
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
   arch/x86/kernel/hpet.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
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
   arch/x86/kernel/hpet.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/hpet.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/hpet.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/hpet.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/hpet.c: note: in included file:
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/kvmclock.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/debugobjects.h, ...):
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
   arch/x86/kernel/kvmclock.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
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
   arch/x86/kernel/kvmclock.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/kvmclock.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/kvmclock.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/kvmclock.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, arch/x86/include/asm/kvm_para.h, ...):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/kvmclock.c: note: in included file (through arch/x86/include/asm/kvm_para.h, include/uapi/linux/kvm_para.h, include/linux/kvm_para.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/vmware.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/lockdep.h, ...):
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
   arch/x86/kernel/cpu/vmware.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
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
   arch/x86/kernel/cpu/vmware.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/vmware.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/vmware.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/vmware.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, arch/x86/include/asm/kvm_para.h, ...):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/vmware.c: note: in included file (through arch/x86/include/asm/kvm_para.h, arch/x86/include/asm/hypervisor.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/mtrr.c: note: in included file (through include/linux/preempt.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   arch/x86/kernel/cpu/mtrr/mtrr.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
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
   arch/x86/kernel/cpu/mtrr/mtrr.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/mtrr.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/mtrr.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/mtrr.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, arch/x86/include/asm/kvm_para.h, ...):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/mtrr.c: note: in included file (through arch/x86/include/asm/kvm_para.h, include/uapi/linux/kvm_para.h, include/linux/kvm_para.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/cleanup.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/lockdep.h, ...):
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
   arch/x86/kernel/cpu/mtrr/cleanup.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
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
   arch/x86/kernel/cpu/mtrr/cleanup.c: note: in included file (through include/linux/xarray.h, include/linux/radix-tree.h, include/linux/idr.h, ...):
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:415:23: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:415:23: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   include/linux/sched/mm.h:416:17: sparse: sparse: Expected ) at end of cast operator
   include/linux/sched/mm.h:416:17: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/cleanup.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/cleanup.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/cleanup.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h, include/linux/pci.h):
   include/linux/context_tracking_state.h:61:28: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:61:28: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:80:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:80:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   include/linux/context_tracking_state.h:92:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/context_tracking_state.h:92:16: sparse: sparse: got __seg_gs
   arch/x86/kernel/cpu/mtrr/cleanup.c: note: in included file (through include/linux/pci.h):
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
>> include/linux/interrupt.h:612:16: sparse: sparse: too many errors

vim +612 include/linux/interrupt.h

4dd53d891ca46d Venkatesh Pallipadi 2010-12-21  609  
4dd53d891ca46d Venkatesh Pallipadi 2010-12-21  610  static inline struct task_struct *this_cpu_ksoftirqd(void)
4dd53d891ca46d Venkatesh Pallipadi 2010-12-21  611  {
4dd53d891ca46d Venkatesh Pallipadi 2010-12-21 @612  	return this_cpu_read(ksoftirqd);
4dd53d891ca46d Venkatesh Pallipadi 2010-12-21  613  }
4dd53d891ca46d Venkatesh Pallipadi 2010-12-21  614  

:::::: The code at line 612 was first introduced by commit
:::::: 4dd53d891ca46dcc1fde0376a33540d3fd83cb9a softirqs: Free up pf flag PF_KSOFTIRQD

:::::: TO: Venkatesh Pallipadi <venki@google.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
