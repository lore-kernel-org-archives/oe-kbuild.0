Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893077;
	b=JcPnSQpoQGD2Q20o5oAoSmnGkRwFqLXqwcGKpPcmSgx3YgD5obWQ5YLpRu94qowbkJdU
	 r8DSD3Ab3HkXt+FGr8JFYsLuITm2m0QzGXPXXKM/hDTsD/Wvmwk2+D0X1KsL16q6xYbji
	 F0N1+eLWGWYgx8EYlDRu5C5Alt1nOwET+KVmqz6Vmz6zyEoQ6Dl+F0f9+jpaTIBBJgPT/
	 zlMC4Zj/435WvoUWVab6f4nvH3t5wJXnJSg67/D/w+xtJHBrfPVCKyKgoOyXsGOpiJ8tb
	 YGti181QIuJbr2nYpe2YvMj++2rb6jrQhZKfqtDuxC4YIKzPlk5k8Ulb9mI54DS+etw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893077;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vUnk+gHD4AGLcaQKD7Bkp/O0MaZyYpxqPOpITahbJho=;
	b=MUVPzNlX1XwWZHZKGnpbOhbfUmS7eHGsDTrxMxAZsNTlIqxoJPDn+DZf2xLxIdWNRxdI
	 T0njsITKBoUYbcqqaJcvmzote3ef5lugmxB2xnqtSvRSrQ5CvXsn30LSEUDj+idu+VN5t
	 OgNr0q1DCxwPAfdyxe4lX2ZJOec61LuiFCNp+gtbwFTjCbGiMud2lOtIVe4A6/VpgpO+R
	 xu9x5CPz9AJeOwwukAA/MK54Eo3Pctu7V6auB6KRvZVK3Yfmqt/RwdW1cJr2PfjNg0V46
	 pqGUNW0S79Ms3De9qSNbZ+CEzxOIIaWZJo9xKfvWS5lF8W0uCGhRxXpbp5Hv1yfVFWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ivqs1IO+;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1B606A32C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 05:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D1B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ivqs1IO+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794893076; x=1826429076;
  h=date:from:to:cc:subject:message-id;
  bh=Dya0lL4GELoznjXPkP0S0x+hTl7y/bqklpPcpwzXB4g=;
  b=ivqs1IO+CX/ErHjWC2ME8cO9ABQ3z2LfOBH5PFSCwIntuAZwsvzWpjlZ
   pEWbpVh2/fSc4TCRG8STF+R2oRfdPG4OniG4dGVhTeVFb6ANTs5jicdLM
   L3aCrBm0ZSz7vno7w9dyrw7Nzw7f1SYmlv6344ibwUAOwMIuTR4d3GnFA
   wW7lQz06wwEJ6UCrjs4aWKSuHHtqgPvUGliyEBCSZtIiyNiMe7Vxa5CkS
   OACNVhkmVOSDK4YzvDXZH+q9V1FhKZaay8nDEFGBKurCP+ujyqsA/gp3b
   BJ0Uqc8mlOHh6t+gLnGhzARtUR9EtIe0Bz+spVAjhH82DEVITpoyLVL4A
   A==;
X-CSE-ConnectionGUID: GYVjIBpOQh6Is1fxvKcnhA==
X-CSE-MsgGUID: JvYYvKX/TamS/6FWVC+kRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3639002"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3639002"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 21:24:35 -0800
X-CSE-ConnectionGUID: gIAba3DCRKOTirFIwMLKgQ==
X-CSE-MsgGUID: v97iilvRTzWg5Sf0eEko1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9906090"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2026 21:24:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTBgF-000000002yy-1gA7;
	Tue, 17 Nov 2026 05:24:31 +0000
Date: Tue, 17 Nov 2026 06:23:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse:
 Trying to use reserved word 'void' as identifier
Message-ID: <202611170515.n6xpVVRk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: Manual check reason: "low confidence static check first_new_problem: arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: Trying to use reserved word 'void' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: 769d603fc44f896e7f61de7f0cdb8b78d46bc8c8 raid6: hide internals
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-r2304-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170515.n6xpVVRk-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170515.n6xpVVRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 769d603fc44f ("raid6: hide internals")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611170515.n6xpVVRk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/linux/llist.h:245:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:245:1: sparse: sparse: got }
   include/linux/llist.h:252:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:252:13: sparse: sparse: got ->
   include/linux/llist.h:253:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/llist.h:253:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:253:16: sparse: sparse: got new_last
   include/linux/llist.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:254:1: sparse: sparse: got }
   include/linux/llist.h:266:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:266:1: sparse: sparse: got }
   include/linux/llist.h:271:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:271:1: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in function declarator
   include/linux/llist.h:283:16: sparse: sparse: got (
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in nested declarator
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in function declarator
   include/linux/llist.h:283:16: sparse: sparse: got *
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:284:1: sparse: sparse: got }
   include/linux/llist.h:290:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:290:13: sparse: sparse: got ->
   include/linux/llist.h:291:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/llist.h:291:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:291:16: sparse: sparse: got first
   include/linux/llist.h:292:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:292:1: sparse: sparse: got }
   include/linux/llist.h:312:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:312:13: sparse: sparse: got llist_del_first_this
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/mutex_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/osq_lock.h:28:13: sparse: sparse: Expected ; at end of declaration
   include/linux/osq_lock.h:28:13: sparse: sparse: got osq_lock
   include/linux/osq_lock.h:31:20: sparse: sparse: Expected ; at end of declaration
   include/linux/osq_lock.h:31:20: sparse: sparse: got osq_is_locked
   include/linux/osq_lock.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/osq_lock.h:34:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/mutex_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/spinlock_types.h:28:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types.h:28:9: sparse: sparse: got }
   include/linux/spinlock_types.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types.h:29:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/mutex_types.h:42:33: sparse: sparse: expected ; at end of declaration
   include/linux/mutex_types.h:42:33: sparse: sparse: Expected } at end of specifier
   include/linux/mutex_types.h:42:33: sparse: sparse: got owner
   include/linux/mutex_types.h:54:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/mutex_types.h:54:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/hrtimer_types.h:44:41: sparse: sparse: expected ; at end of declaration
   include/linux/hrtimer_types.h:44:41: sparse: sparse: Expected } at end of specifier
   include/linux/hrtimer_types.h:44:41: sparse: sparse: got is_queued
   include/linux/hrtimer_types.h:45:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:45:41: sparse: sparse: got is_rel
   include/linux/hrtimer_types.h:46:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:46:41: sparse: sparse: got is_soft
   include/linux/hrtimer_types.h:47:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:47:41: sparse: sparse: got is_hard
   include/linux/hrtimer_types.h:48:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:48:41: sparse: sparse: got is_lazy
   include/linux/hrtimer_types.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/hrtimer_types.h:51:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/hw_irq.h:209:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:209:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:212:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:217:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: got debug_smp_processor_id
>> arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:229:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:229:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: got debug_smp_processor_id
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:241:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:241:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:252:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:252:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:252:16: sparse: sparse: got false
   arch/powerpc/include/asm/hw_irq.h:253:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:253:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:316:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:324:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:324:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:334:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:334:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:345:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:345:20: sparse: sparse: got should_hard_irq_enable
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got {
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got {
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:351:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:351:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:362:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:362:13: sparse: sparse: got 1
   arch/powerpc/include/asm/hw_irq.h:362:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:370:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:372:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:372:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:377:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:377:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:377:16: sparse: sparse: got true
   arch/powerpc/include/asm/hw_irq.h:378:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:378:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: got debug_smp_processor_id
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: got prep_irq_for_idle_irqsoff
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
--
   include/linux/llist.h:245:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:245:1: sparse: sparse: got }
   include/linux/llist.h:252:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:252:13: sparse: sparse: got ->
   include/linux/llist.h:253:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/llist.h:253:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:253:16: sparse: sparse: got new_last
   include/linux/llist.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:254:1: sparse: sparse: got }
   include/linux/llist.h:266:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:266:1: sparse: sparse: got }
   include/linux/llist.h:271:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:271:1: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in function declarator
   include/linux/llist.h:283:16: sparse: sparse: got (
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in nested declarator
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in function declarator
   include/linux/llist.h:283:16: sparse: sparse: got *
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:284:1: sparse: sparse: got }
   include/linux/llist.h:290:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:290:13: sparse: sparse: got ->
   include/linux/llist.h:291:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/llist.h:291:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:291:16: sparse: sparse: got first
   include/linux/llist.h:292:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:292:1: sparse: sparse: got }
   include/linux/llist.h:312:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:312:13: sparse: sparse: got llist_del_first_this
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/mutex_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/osq_lock.h:28:13: sparse: sparse: Expected ; at end of declaration
   include/linux/osq_lock.h:28:13: sparse: sparse: got osq_lock
   include/linux/osq_lock.h:31:20: sparse: sparse: Expected ; at end of declaration
   include/linux/osq_lock.h:31:20: sparse: sparse: got osq_is_locked
   include/linux/osq_lock.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/osq_lock.h:34:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/mutex_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/spinlock_types.h:28:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types.h:28:9: sparse: sparse: got }
   include/linux/spinlock_types.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types.h:29:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/mutex_types.h:42:33: sparse: sparse: expected ; at end of declaration
   include/linux/mutex_types.h:42:33: sparse: sparse: Expected } at end of specifier
   include/linux/mutex_types.h:42:33: sparse: sparse: got owner
   include/linux/mutex_types.h:54:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/mutex_types.h:54:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/hrtimer_types.h:44:41: sparse: sparse: expected ; at end of declaration
   include/linux/hrtimer_types.h:44:41: sparse: sparse: Expected } at end of specifier
   include/linux/hrtimer_types.h:44:41: sparse: sparse: got is_queued
   include/linux/hrtimer_types.h:45:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:45:41: sparse: sparse: got is_rel
   include/linux/hrtimer_types.h:46:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:46:41: sparse: sparse: got is_soft
   include/linux/hrtimer_types.h:47:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:47:41: sparse: sparse: got is_hard
   include/linux/hrtimer_types.h:48:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:48:41: sparse: sparse: got is_lazy
   include/linux/hrtimer_types.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/hrtimer_types.h:51:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/hw_irq.h:209:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:209:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:212:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:217:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: got debug_smp_processor_id
>> arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:229:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:229:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: got debug_smp_processor_id
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:241:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:241:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:252:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:252:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:252:16: sparse: sparse: got false
   arch/powerpc/include/asm/hw_irq.h:253:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:253:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:316:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:324:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:324:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:334:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:334:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:345:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:345:20: sparse: sparse: got should_hard_irq_enable
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got {
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got {
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:351:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:351:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:362:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:362:13: sparse: sparse: got 1
   arch/powerpc/include/asm/hw_irq.h:362:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:370:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:372:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:372:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:377:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:377:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:377:16: sparse: sparse: got true
   arch/powerpc/include/asm/hw_irq.h:378:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:378:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: got debug_smp_processor_id
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: got prep_irq_for_idle_irqsoff
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
--
   include/linux/llist.h:245:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:245:1: sparse: sparse: got }
   include/linux/llist.h:252:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:252:13: sparse: sparse: got ->
   include/linux/llist.h:253:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/llist.h:253:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:253:16: sparse: sparse: got new_last
   include/linux/llist.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:254:1: sparse: sparse: got }
   include/linux/llist.h:266:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:266:1: sparse: sparse: got }
   include/linux/llist.h:271:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:271:1: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in function declarator
   include/linux/llist.h:283:16: sparse: sparse: got (
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in nested declarator
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in function declarator
   include/linux/llist.h:283:16: sparse: sparse: got *
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:284:1: sparse: sparse: got }
   include/linux/llist.h:290:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:290:13: sparse: sparse: got ->
   include/linux/llist.h:291:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/llist.h:291:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:291:16: sparse: sparse: got first
   include/linux/llist.h:292:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:292:1: sparse: sparse: got }
   include/linux/llist.h:312:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:312:13: sparse: sparse: got llist_del_first_this
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/mutex_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/osq_lock.h:28:13: sparse: sparse: Expected ; at end of declaration
   include/linux/osq_lock.h:28:13: sparse: sparse: got osq_lock
   include/linux/osq_lock.h:31:20: sparse: sparse: Expected ; at end of declaration
   include/linux/osq_lock.h:31:20: sparse: sparse: got osq_is_locked
   include/linux/osq_lock.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/osq_lock.h:34:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/mutex_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/spinlock_types.h:28:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types.h:28:9: sparse: sparse: got }
   include/linux/spinlock_types.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types.h:29:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/mutex_types.h:42:33: sparse: sparse: expected ; at end of declaration
   include/linux/mutex_types.h:42:33: sparse: sparse: Expected } at end of specifier
   include/linux/mutex_types.h:42:33: sparse: sparse: got owner
   include/linux/mutex_types.h:54:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/mutex_types.h:54:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/hrtimer_types.h:44:41: sparse: sparse: expected ; at end of declaration
   include/linux/hrtimer_types.h:44:41: sparse: sparse: Expected } at end of specifier
   include/linux/hrtimer_types.h:44:41: sparse: sparse: got is_queued
   include/linux/hrtimer_types.h:45:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:45:41: sparse: sparse: got is_rel
   include/linux/hrtimer_types.h:46:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:46:41: sparse: sparse: got is_soft
   include/linux/hrtimer_types.h:47:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:47:41: sparse: sparse: got is_hard
   include/linux/hrtimer_types.h:48:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:48:41: sparse: sparse: got is_lazy
   include/linux/hrtimer_types.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/hrtimer_types.h:51:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/hw_irq.h:209:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:209:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:212:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:217:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: got debug_smp_processor_id
>> arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:229:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:229:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: got debug_smp_processor_id
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:241:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:241:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:252:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:252:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:252:16: sparse: sparse: got false
   arch/powerpc/include/asm/hw_irq.h:253:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:253:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:316:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:324:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:324:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:334:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:334:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:345:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:345:20: sparse: sparse: got should_hard_irq_enable
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got {
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got {
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:351:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:351:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:362:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:362:13: sparse: sparse: got 1
   arch/powerpc/include/asm/hw_irq.h:362:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:370:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:372:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:372:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:377:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:377:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:377:16: sparse: sparse: got true
   arch/powerpc/include/asm/hw_irq.h:378:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:378:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: got debug_smp_processor_id
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: got prep_irq_for_idle_irqsoff
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
--
   include/linux/llist.h:245:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:245:1: sparse: sparse: got }
   include/linux/llist.h:252:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:252:13: sparse: sparse: got ->
   include/linux/llist.h:253:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/llist.h:253:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:253:16: sparse: sparse: got new_last
   include/linux/llist.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:254:1: sparse: sparse: got }
   include/linux/llist.h:266:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:266:1: sparse: sparse: got }
   include/linux/llist.h:271:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:271:1: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in function declarator
   include/linux/llist.h:283:16: sparse: sparse: got (
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in nested declarator
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ) in function declarator
   include/linux/llist.h:283:16: sparse: sparse: got *
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word '__typeof__' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:283:16: sparse: sparse: got {
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:283:16: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:283:16: sparse: sparse: got }
   include/linux/llist.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:284:1: sparse: sparse: got }
   include/linux/llist.h:290:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:290:13: sparse: sparse: got ->
   include/linux/llist.h:291:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/llist.h:291:16: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:291:16: sparse: sparse: got first
   include/linux/llist.h:292:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/llist.h:292:1: sparse: sparse: got }
   include/linux/llist.h:312:13: sparse: sparse: Expected ; at end of declaration
   include/linux/llist.h:312:13: sparse: sparse: got llist_del_first_this
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/mutex_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/osq_lock.h:28:13: sparse: sparse: Expected ; at end of declaration
   include/linux/osq_lock.h:28:13: sparse: sparse: got osq_lock
   include/linux/osq_lock.h:31:20: sparse: sparse: Expected ; at end of declaration
   include/linux/osq_lock.h:31:20: sparse: sparse: got osq_is_locked
   include/linux/osq_lock.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/osq_lock.h:34:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/mutex_types.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/spinlock_types.h:28:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types.h:28:9: sparse: sparse: got }
   include/linux/spinlock_types.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/spinlock_types.h:29:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/mutex_types.h:42:33: sparse: sparse: expected ; at end of declaration
   include/linux/mutex_types.h:42:33: sparse: sparse: Expected } at end of specifier
   include/linux/mutex_types.h:42:33: sparse: sparse: got owner
   include/linux/mutex_types.h:54:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/mutex_types.h:54:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/hrtimer_types.h:44:41: sparse: sparse: expected ; at end of declaration
   include/linux/hrtimer_types.h:44:41: sparse: sparse: Expected } at end of specifier
   include/linux/hrtimer_types.h:44:41: sparse: sparse: got is_queued
   include/linux/hrtimer_types.h:45:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:45:41: sparse: sparse: got is_rel
   include/linux/hrtimer_types.h:46:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:46:41: sparse: sparse: got is_soft
   include/linux/hrtimer_types.h:47:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:47:41: sparse: sparse: got is_hard
   include/linux/hrtimer_types.h:48:41: sparse: sparse: Expected ; at end of declaration
   include/linux/hrtimer_types.h:48:41: sparse: sparse: got is_lazy
   include/linux/hrtimer_types.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/hrtimer_types.h:51:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   arch/powerpc/include/asm/hw_irq.h:209:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:209:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:212:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:217:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: got debug_smp_processor_id
>> arch/powerpc/include/asm/hw_irq.h:228:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:229:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:229:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:238:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: got debug_smp_processor_id
   arch/powerpc/include/asm/hw_irq.h:240:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:241:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:241:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:252:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:252:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:252:16: sparse: sparse: got false
   arch/powerpc/include/asm/hw_irq.h:253:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:253:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:316:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:324:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:324:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:334:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:334:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:345:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:345:20: sparse: sparse: got should_hard_irq_enable
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:348:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got {
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:349:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got {
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:350:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:351:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:351:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:362:13: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:362:13: sparse: sparse: got 1
   arch/powerpc/include/asm/hw_irq.h:362:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:370:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got (
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:370:21: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:372:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:372:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:377:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:377:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:377:16: sparse: sparse: got true
   arch/powerpc/include/asm/hw_irq.h:378:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:378:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: Expected ) in nested declarator
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: got debug_smp_processor_id
   arch/powerpc/include/asm/hw_irq.h:392:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: got prep_irq_for_idle_irqsoff
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional

vim +/void +228 arch/powerpc/include/asm/hw_irq.h

^1da177e4c3f41 include/asm-ppc64/hw_irq.h        Linus Torvalds 2005-04-16  218  
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  219  static inline void set_pmi_irq_pending(void)
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  220  {
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  221  	/*
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  222  	 * Invoked from PMU callback functions to set PMI bit in the paca.
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  223  	 * This has to be called with irq's disabled (via hard_irq_disable()).
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  224  	 */
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  225  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21 @226  		WARN_ON_ONCE(mfmsr() & MSR_EE);
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  227  
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21 @228  	get_paca()->irq_happened |= PACA_IRQ_PMI;
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  229  }
2c9ac51b850d84 arch/powerpc/include/asm/hw_irq.h Athira Rajeev  2021-07-21  230  

:::::: The code at line 228 was first introduced by commit
:::::: 2c9ac51b850d84ee496b0a5d832ce66d411ae552 powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting an overflown PMC

:::::: TO: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
