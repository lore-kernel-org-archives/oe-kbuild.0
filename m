Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB9B3C69C
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Oct 2023 19:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhzjXXuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696880206; x=1728416206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wG5KCGn88/EQNml4wNf3ISlDzDAynMRpr9ra+8d4wFI=;
  b=GhzjXXuGNs1L6mVr4SHcItR0+nKFS/45TPonBKBP/fcRqOjOU2/OV45+
   b/rSGao3dRcHNNViGoBB+eTstNZ+BMRPLEfXWTxkfS5xynn0UizZjYWsT
   3t1HcKX+D4XaocxLSrVbizJ5O0uzzFXZj+PxegzwrhsZluuV/4EL+BFjj
   2t/LS5VQDA0rqZcd9NvUcj9LQQ6XD2AbjBounOtQMybBpTVqgIUYI0dGH
   Ca84nFd+fxi2Pbw7Fmcf0jLFzgYoopdaqFORU5/EJip4vznpatsQbKuBi
   T3nhqHq4kbW0yQVDqMiyLQ/5Ys69l4A0i/b/PrI5gUenqEZndtojX10CR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2816378"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="2816378"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 12:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782616110"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="782616110"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Oct 2023 12:36:38 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpw3Q-0000ae-1O;
	Mon, 09 Oct 2023 19:36:36 +0000
Date: Tue, 10 Oct 2023 03:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 11/12] kernel/locking/spinlock_debug.c:60:9: sparse:
 sparse: too many errors
Message-ID: <202310100305.RriaR0FZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/locking/spinlock_debug.c:60:9: sparse: sparse: too many errors"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Nadav Amit <namit@vmware.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Uros Bizjak <ubizjak@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   ca4256348660cb2162668ec3d13d1f921d05374a
commit: 9a462b9eafa6dda16ea8429b151edb1fb535d744 [11/12] x86/percpu: Use compiler segment prefix qualifier
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-122-20231009 (https://download.01.org/0day-ci/archive/20231010/202310100305.RriaR0FZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100305.RriaR0FZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310100305.RriaR0FZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/locking/spinlock_debug.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h):
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
   kernel/locking/spinlock_debug.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/nmi.h):
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
   kernel/locking/spinlock_debug.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   kernel/locking/spinlock_debug.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h):
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
   kernel/locking/spinlock_debug.c: note: in included file:
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   kernel/locking/spinlock_debug.c:60:9: sparse: sparse: Expected ) at end of cast operator
   kernel/locking/spinlock_debug.c:60:9: sparse: sparse: got __seg_gs
   kernel/locking/spinlock_debug.c:60:9: sparse: sparse: Expected ) at end of cast operator
>> kernel/locking/spinlock_debug.c:60:9: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/locking/mutex.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/lockdep.h, ...):
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
   kernel/locking/mutex.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/sched/signal.h):
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
   kernel/locking/mutex.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   kernel/locking/mutex.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h):
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
   kernel/locking/mutex.c: note: in included file:
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   kernel/locking/mutex.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   kernel/locking/mutex.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
>> include/linux/idr.h:174:9: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/rcu/update.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h):
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
   kernel/rcu/update.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h):
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
   kernel/rcu/update.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/hardirq.h, ...):
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
   kernel/rcu/update.c: note: in included file:
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   kernel/rcu/update.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   kernel/rcu/update.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   kernel/rcu/update.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
>> include/linux/idr.h:174:9: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/rcu/tree.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h):
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
   kernel/rcu/tree.c: note: in included file (through include/linux/hardirq.h, include/linux/interrupt.h):
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
   kernel/rcu/tree.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/hardirq.h, ...):
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
   kernel/rcu/tree.c: note: in included file:
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   include/linux/interrupt.h:612:16: sparse: sparse: Expected ) at end of cast operator
   include/linux/interrupt.h:612:16: sparse: sparse: got __seg_gs
   kernel/rcu/tree.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   kernel/rcu/tree.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   kernel/rcu/tree.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
>> include/linux/idr.h:174:9: sparse: sparse: too many errors
--
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/processor.h:504:9: sparse: sparse: got __seg_gs
   kernel/sched/build_utility.c: note: in included file (through include/linux/preempt.h, include/linux/smp.h, include/linux/sched/clock.h):
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
   kernel/sched/build_utility.c: note: in included file (through include/linux/hrtimer.h, include/linux/sched.h, include/linux/sched/signal.h, ...):
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
   kernel/sched/build_utility.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:180:9: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: Expected ) at end of cast operator
   arch/x86/include/asm/tlbflush.h:262:45: sparse: sparse: got __seg_gs
   kernel/sched/build_utility.c: note: in included file (through include/linux/idr.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/radix-tree.h:260:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/radix-tree.h:260:9: sparse: sparse: got __seg_gs
   kernel/sched/build_utility.c: note: in included file (through include/linux/kernfs.h, include/linux/sysfs.h, include/linux/kobject.h, ...):
   include/linux/idr.h:174:9: sparse: sparse: Expected ) at end of cast operator
   include/linux/idr.h:174:9: sparse: sparse: got __seg_gs
   kernel/sched/build_utility.c: note: in included file (through include/linux/tick.h, include/linux/sched/isolation.h):
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
   kernel/sched/build_utility.c: note: in included file (through include/linux/sched/isolation.h):
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_gs
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_gs
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
   include/linux/tick.h:312:32: sparse: sparse: got __seg_gs
   include/linux/tick.h:312:32: sparse: sparse: Expected ) at end of cast operator
>> include/linux/tick.h:312:32: sparse: sparse: too many errors

vim +60 kernel/locking/spinlock_debug.c

8a25d5debff2da lib/spinlock_debug.c            Ingo Molnar     2006-07-03  53  
4e101b0e6aa885 lib/spinlock_debug.c            Akinobu Mita    2011-10-31  54  static void spin_dump(raw_spinlock_t *lock, const char *msg)
fb1c8f93d869b3 lib/spinlock_debug.c            Ingo Molnar     2005-09-10  55  {
1a365e822372ba kernel/locking/spinlock_debug.c Marco Elver     2019-11-20  56  	struct task_struct *owner = READ_ONCE(lock->owner);
fb1c8f93d869b3 lib/spinlock_debug.c            Ingo Molnar     2005-09-10  57  
1a365e822372ba kernel/locking/spinlock_debug.c Marco Elver     2019-11-20  58  	if (owner == SPINLOCK_OWNER_INIT)
1a365e822372ba kernel/locking/spinlock_debug.c Marco Elver     2019-11-20  59  		owner = NULL;
51989b9ffeea58 lib/spinlock_debug.c            Dave Jones      2006-01-09 @60  	printk(KERN_EMERG "BUG: spinlock %s on CPU#%d, %s/%d\n",
bb44f116a14c4c lib/spinlock_debug.c            Ingo Molnar     2005-12-20  61  		msg, raw_smp_processor_id(),
ba25f9dcc4ea6e lib/spinlock_debug.c            Pavel Emelyanov 2007-10-18  62  		current->comm, task_pid_nr(current));
4b0681487bf72f lib/spinlock_debug.c            Stephen Boyd    2012-07-30  63  	printk(KERN_EMERG " lock: %pS, .magic: %08x, .owner: %s/%d, "
51989b9ffeea58 lib/spinlock_debug.c            Dave Jones      2006-01-09  64  			".owner_cpu: %d\n",
1a365e822372ba kernel/locking/spinlock_debug.c Marco Elver     2019-11-20  65  		lock, READ_ONCE(lock->magic),
fb1c8f93d869b3 lib/spinlock_debug.c            Ingo Molnar     2005-09-10  66  		owner ? owner->comm : "<none>",
ba25f9dcc4ea6e lib/spinlock_debug.c            Pavel Emelyanov 2007-10-18  67  		owner ? task_pid_nr(owner) : -1,
1a365e822372ba kernel/locking/spinlock_debug.c Marco Elver     2019-11-20  68  		READ_ONCE(lock->owner_cpu));
fb1c8f93d869b3 lib/spinlock_debug.c            Ingo Molnar     2005-09-10  69  	dump_stack();
fb1c8f93d869b3 lib/spinlock_debug.c            Ingo Molnar     2005-09-10  70  }
fb1c8f93d869b3 lib/spinlock_debug.c            Ingo Molnar     2005-09-10  71  

:::::: The code at line 60 was first introduced by commit
:::::: 51989b9ffeea58999054fe3f21bd0cd0bd207e5a [PATCH] printk levels for spinlock debug

:::::: TO: Dave Jones <davej@redhat.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
