Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358381;
	b=jJ9AEhGXWA2MnNHVyZKsPLdgmXDvlJwqRx316AGWLRroj21GA9l9E6pjeZQds8bWZXNC
	 Appw5MRVkcqv81lkRnpr/WBDAgA4gLkHJqwwDahRT+Lu1ItlkBq7apnmUJIu/7Ar3dCFC
	 N3GSoAbPmK3KR+XE/mIP9dmAXYRkNOVrJ9zpkIvJuTwYEozSr8Q2eFzso3kvOBmTqTZKc
	 QFqSWlHQoIzUioNDoheD6GXj6pr9OCt9aABueddlRX1zjZSjaWbP9uKyf5stqu2lY2Sud
	 uPrNrDyyPfAqGvWxjDVtyihIoOvIYtbarPzOySibu2K9/3dpHCZlBoKV67ErY/HENxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358381;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WAvj58ffSewHgahpiz8PED9ZkxmPjlZa/6X/BgxX6H8=;
	b=22vq+EttQFFUQ61tykQekfAa0/VPeB8tgs20etomGsGqOGSxgr7Nowg/d7qnqWH3Tv07
	 kUVH8qNGxMoJNGRMpuRSZEe1RqJRxHhybuwXT7aZw/JtTM3QCa44FpeOPgjDJoBq0vvyN
	 WgpahsLuGipKnSbgqz96FcJMWeQgQ2XxS+RWuTH4Z/MmsZvsZO+Qoo4V0o+enOYa8gzwW
	 8RgoPmT8+k7F3wzh9LE5W1Lv0ih3zS96j6nGfKfrDYmaqWloxVT2pi5jrzhOfwPq+iJZK
	 Y4Tf47rLGkoaK17JxWc1VgKsUonjs1K0o41K2sN5+YmN6A69jFi/r59krt+OKAcTBNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aAnRwAsd;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338DA606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 14:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 338DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aAnRwAsd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795358379; x=1826894379;
  h=date:from:to:cc:subject:message-id;
  bh=oRE5Y3BIeN5ZawcKo5UvZTMFRPAV4QzY1kY5WkVOZ4Q=;
  b=aAnRwAsd0e3rFuXZflDABOH1Jg8gonzBe7S6qWS2b+yIngKxO6MpIthM
   Afffxwp89epSmpb+Cb/5bNwnaBxD0p6uRFq8gRHBrIZ6AYbw/TO7/PYyb
   bxAEyVcR9egfqm7KY7JQXQUq0JOT4Yc4UrMIN5miPlSJp0QZ3Yqvb2UHB
   XkwttUP6jYsZaMpqZfIiiwNaQuw4hUv47sgJgdgzCzHdWM2elXS3JY0oZ
   eHmjlP9QaKswIAKPMQegMWQl8g60VFBJdmxyjypYXH/gCRknnpiXtak97
   1RyTGzesPODyaLJe34dN6RTNRx8E4PwhVFGLLWx0RlcZeF+wzysVGq9t4
   g==;
X-CSE-ConnectionGUID: yZjLIx2lRGOvF4KohmRnVw==
X-CSE-MsgGUID: tPyngjKAT7yROv0d2BEmkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4207399"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4207399"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 06:39:38 -0800
X-CSE-ConnectionGUID: U9DWhzbXQRCFsBd4Umf1Dg==
X-CSE-MsgGUID: RQ3C+8W4T9uOe9i6fTQBbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11382836"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2026 06:39:36 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV8j7-000000004ZC-3rsw;
	Sun, 22 Nov 2026 14:39:33 +0000
Date: Sun, 22 Nov 2026 15:39:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/jump_label.h:262:9: sparse: sparse: Trying to
 use reserved word 'return' as identifier
Message-ID: <20261122153500.gWTgf0am-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
commit: 769d603fc44f896e7f61de7f0cdb8b78d46bc8c8 raid6: hide internals
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-r2302-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122153500.gWTgf0am-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122153500.gWTgf0am-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 769d603fc44f ("raid6: hide internals")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122153500.gWTgf0am-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:228:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:228:19: sparse: sparse: got ->
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
   arch/powerpc/include/asm/hw_irq.h:240:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:240:19: sparse: sparse: got ->
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
   arch/powerpc/include/asm/hw_irq.h:392:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:392:19: sparse: sparse: got ->
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: got prep_irq_for_idle_irqsoff
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/percpu.h, include/linux/irqflags.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initialized
   include/linux/jump_label.h:258:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:258:29: sparse: sparse: got static_key_false
>> include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:262:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:262:16: sparse: sparse: got false
   include/linux/jump_label.h:263:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:263:1: sparse: sparse: got }
   include/linux/jump_label.h:269:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:269:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:269:16: sparse: sparse: got false
   include/linux/jump_label.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:270:1: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in nested declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got (
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got !
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:282:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:282:12: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:282:12: sparse: sparse: got {
   include/linux/jump_label.h:285:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:285:9: sparse: sparse: got }
   include/linux/jump_label.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:286:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:286:16: sparse: sparse: got true
   include/linux/jump_label.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:287:1: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got (
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got {
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got !
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:293:20: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:293:20: sparse: sparse: got &
   include/linux/jump_label.h:294:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:294:1: sparse: sparse: got }
   include/linux/jump_label.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:302:1: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got (
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got {
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got !
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:311:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:311:24: sparse: sparse: got (
   include/linux/jump_label.h:311:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got (
   include/linux/jump_label.h:312:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got !
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:312:17: sparse: sparse: got }
   include/linux/jump_label.h:313:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:314:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:314:9: sparse: sparse: got }
   include/linux/jump_label.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:316:1: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got (
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got {
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got !
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:322:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:322:24: sparse: sparse: got (
   include/linux/jump_label.h:322:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got (
   include/linux/jump_label.h:323:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got !
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:323:17: sparse: sparse: got }
   include/linux/jump_label.h:324:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:325:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:325:9: sparse: sparse: got }
   include/linux/jump_label.h:327:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:327:1: sparse: sparse: got }
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
--
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:228:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:228:19: sparse: sparse: got ->
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
   arch/powerpc/include/asm/hw_irq.h:240:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:240:19: sparse: sparse: got ->
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
   arch/powerpc/include/asm/hw_irq.h:392:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:392:19: sparse: sparse: got ->
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: got prep_irq_for_idle_irqsoff
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/percpu.h, include/linux/irqflags.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initialized
   include/linux/jump_label.h:258:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:258:29: sparse: sparse: got static_key_false
>> include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:262:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:262:16: sparse: sparse: got false
   include/linux/jump_label.h:263:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:263:1: sparse: sparse: got }
   include/linux/jump_label.h:269:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:269:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:269:16: sparse: sparse: got false
   include/linux/jump_label.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:270:1: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in nested declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got (
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got !
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:282:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:282:12: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:282:12: sparse: sparse: got {
   include/linux/jump_label.h:285:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:285:9: sparse: sparse: got }
   include/linux/jump_label.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:286:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:286:16: sparse: sparse: got true
   include/linux/jump_label.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:287:1: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got (
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got {
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got !
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:293:20: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:293:20: sparse: sparse: got &
   include/linux/jump_label.h:294:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:294:1: sparse: sparse: got }
   include/linux/jump_label.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:302:1: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got (
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got {
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got !
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:311:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:311:24: sparse: sparse: got (
   include/linux/jump_label.h:311:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got (
   include/linux/jump_label.h:312:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got !
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:312:17: sparse: sparse: got }
   include/linux/jump_label.h:313:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:314:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:314:9: sparse: sparse: got }
   include/linux/jump_label.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:316:1: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got (
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got {
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got !
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:322:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:322:24: sparse: sparse: got (
   include/linux/jump_label.h:322:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got (
   include/linux/jump_label.h:323:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got !
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:323:17: sparse: sparse: got }
   include/linux/jump_label.h:324:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:325:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:325:9: sparse: sparse: got }
   include/linux/jump_label.h:327:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:327:1: sparse: sparse: got }
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
--
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:228:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:228:19: sparse: sparse: got ->
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
   arch/powerpc/include/asm/hw_irq.h:240:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:240:19: sparse: sparse: got ->
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
   arch/powerpc/include/asm/hw_irq.h:392:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:392:19: sparse: sparse: got ->
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: got prep_irq_for_idle_irqsoff
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/percpu.h, include/linux/irqflags.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initialized
   include/linux/jump_label.h:258:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:258:29: sparse: sparse: got static_key_false
>> include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:262:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:262:16: sparse: sparse: got false
   include/linux/jump_label.h:263:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:263:1: sparse: sparse: got }
   include/linux/jump_label.h:269:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:269:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:269:16: sparse: sparse: got false
   include/linux/jump_label.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:270:1: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in nested declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got (
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got !
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:282:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:282:12: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:282:12: sparse: sparse: got {
   include/linux/jump_label.h:285:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:285:9: sparse: sparse: got }
   include/linux/jump_label.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:286:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:286:16: sparse: sparse: got true
   include/linux/jump_label.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:287:1: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got (
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got {
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got !
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:293:20: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:293:20: sparse: sparse: got &
   include/linux/jump_label.h:294:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:294:1: sparse: sparse: got }
   include/linux/jump_label.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:302:1: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got (
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got {
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got !
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:311:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:311:24: sparse: sparse: got (
   include/linux/jump_label.h:311:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got (
   include/linux/jump_label.h:312:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got !
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:312:17: sparse: sparse: got }
   include/linux/jump_label.h:313:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:314:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:314:9: sparse: sparse: got }
   include/linux/jump_label.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:316:1: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got (
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got {
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got !
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:322:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:322:24: sparse: sparse: got (
   include/linux/jump_label.h:322:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got (
   include/linux/jump_label.h:323:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got !
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:323:17: sparse: sparse: got }
   include/linux/jump_label.h:324:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:325:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:325:9: sparse: sparse: got }
   include/linux/jump_label.h:327:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:327:1: sparse: sparse: got }
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
--
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:226:17: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:228:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:228:19: sparse: sparse: got ->
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
   arch/powerpc/include/asm/hw_irq.h:240:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:240:19: sparse: sparse: got ->
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
   arch/powerpc/include/asm/hw_irq.h:392:19: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:392:19: sparse: sparse: got ->
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:394:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:399:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:402:13: sparse: sparse: got prep_irq_for_idle_irqsoff
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/percpu.h, include/linux/irqflags.h, include/linux/spinlock.h, include/linux/sched.h, ...):
   include/linux/jump_label.h:80:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:80:13: sparse: sparse: got static_key_initialized
   include/linux/jump_label.h:258:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:258:29: sparse: sparse: got static_key_false
>> include/linux/jump_label.h:262:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:262:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:262:16: sparse: sparse: got false
   include/linux/jump_label.h:263:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:263:1: sparse: sparse: got }
   include/linux/jump_label.h:269:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:269:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:269:16: sparse: sparse: got false
   include/linux/jump_label.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:270:1: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in nested declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got (
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
>> include/linux/jump_label.h:276:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got {
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:276:9: sparse: sparse: got !
   include/linux/jump_label.h:276:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:276:9: sparse: sparse: got }
   include/linux/jump_label.h:282:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:282:12: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:282:12: sparse: sparse: got {
   include/linux/jump_label.h:285:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:285:9: sparse: sparse: got }
   include/linux/jump_label.h:286:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:286:16: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:286:16: sparse: sparse: got true
   include/linux/jump_label.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:287:1: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got (
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:292:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got {
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:292:9: sparse: sparse: got !
   include/linux/jump_label.h:292:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:292:9: sparse: sparse: got }
   include/linux/jump_label.h:293:20: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:293:20: sparse: sparse: got &
   include/linux/jump_label.h:294:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:294:1: sparse: sparse: got }
   include/linux/jump_label.h:302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:302:1: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got (
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:309:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got {
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:309:9: sparse: sparse: got !
   include/linux/jump_label.h:309:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:309:9: sparse: sparse: got }
   include/linux/jump_label.h:311:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:311:24: sparse: sparse: got (
   include/linux/jump_label.h:311:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got (
   include/linux/jump_label.h:312:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:312:17: sparse: sparse: got !
   include/linux/jump_label.h:312:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:312:17: sparse: sparse: got }
   include/linux/jump_label.h:313:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:314:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:314:9: sparse: sparse: got }
   include/linux/jump_label.h:316:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:316:1: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got (
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got "%s(): static key '%pS' used before call to jump_label_init()"
   include/linux/jump_label.h:320:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got {
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:320:9: sparse: sparse: got !
   include/linux/jump_label.h:320:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:320:9: sparse: sparse: got }
   include/linux/jump_label.h:322:24: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:322:24: sparse: sparse: got (
   include/linux/jump_label.h:322:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got (
   include/linux/jump_label.h:323:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ) in function declarator
   include/linux/jump_label.h:323:17: sparse: sparse: got !
   include/linux/jump_label.h:323:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:323:17: sparse: sparse: got }
   include/linux/jump_label.h:324:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/jump_label.h:325:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:325:9: sparse: sparse: got }
   include/linux/jump_label.h:327:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:327:1: sparse: sparse: got }
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration

vim +/return +262 include/linux/jump_label.h

91a1d97ef482c1 Peter Zijlstra          2024-03-13  257  
c5905afb0ee655 Ingo Molnar             2012-02-24  258  static __always_inline bool static_key_false(struct static_key *key)
c5905afb0ee655 Ingo Molnar             2012-02-24  259  {
2f0df49c89acaa Steven Rostedt (VMware  2020-12-11  260) 	if (unlikely_notrace(static_key_count(key) > 0))
c5905afb0ee655 Ingo Molnar             2012-02-24  261  		return true;
c5905afb0ee655 Ingo Molnar             2012-02-24 @262  	return false;
c5905afb0ee655 Ingo Molnar             2012-02-24  263  }
c5905afb0ee655 Ingo Molnar             2012-02-24  264  
c5905afb0ee655 Ingo Molnar             2012-02-24  265  static __always_inline bool static_key_true(struct static_key *key)
d430d3d7e646eb Jason Baron             2011-03-16  266  {
2f0df49c89acaa Steven Rostedt (VMware  2020-12-11  267) 	if (likely_notrace(static_key_count(key) > 0))
d430d3d7e646eb Jason Baron             2011-03-16  268  		return true;
d430d3d7e646eb Jason Baron             2011-03-16  269  	return false;
d430d3d7e646eb Jason Baron             2011-03-16  270  }
bf5438fca2950b Jason Baron             2010-09-17  271  
eb8c507296f603 Dmitry Safonov          2022-11-23  272  static inline bool static_key_fast_inc_not_disabled(struct static_key *key)
d430d3d7e646eb Jason Baron             2011-03-16  273  {
eb8c507296f603 Dmitry Safonov          2022-11-23  274  	int v;
eb8c507296f603 Dmitry Safonov          2022-11-23  275  
5cdda5117e125e Borislav Petkov         2017-10-18 @276  	STATIC_KEY_CHECK_USE(key);
eb8c507296f603 Dmitry Safonov          2022-11-23  277  	/*
eb8c507296f603 Dmitry Safonov          2022-11-23  278  	 * Prevent key->enabled getting negative to follow the same semantics
eb8c507296f603 Dmitry Safonov          2022-11-23  279  	 * as for CONFIG_JUMP_LABEL=y, see kernel/jump_label.c comment.
eb8c507296f603 Dmitry Safonov          2022-11-23  280  	 */
eb8c507296f603 Dmitry Safonov          2022-11-23  281  	v = atomic_read(&key->enabled);
eb8c507296f603 Dmitry Safonov          2022-11-23  282  	do {
eb8c507296f603 Dmitry Safonov          2022-11-23  283  		if (v < 0 || (v + 1) < 0)
eb8c507296f603 Dmitry Safonov          2022-11-23  284  			return false;
eb8c507296f603 Dmitry Safonov          2022-11-23  285  	} while (!likely(atomic_try_cmpxchg(&key->enabled, &v, v + 1)));
eb8c507296f603 Dmitry Safonov          2022-11-23  286  	return true;
d430d3d7e646eb Jason Baron             2011-03-16  287  }
eb8c507296f603 Dmitry Safonov          2022-11-23  288  #define static_key_slow_inc(key)	static_key_fast_inc_not_disabled(key)
bf5438fca2950b Jason Baron             2010-09-17  289  

:::::: The code at line 262 was first introduced by commit
:::::: c5905afb0ee6550b42c49213da1c22d67316c194 static keys: Introduce 'struct static_key', static_key_true()/false() and static_key_slow_[inc|dec]()

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
