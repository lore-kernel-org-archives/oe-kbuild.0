Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795228176;
	b=fBcAK/OA9dU2nB7PmqsIAHuBfxtvEY8C3C1m794PIYkzPoCMQ9yix7iqgXKWAKKOZbth
	 /eo+nKYUbSyESAV2W/xWn+IR7QJ1l9YM2jxwXVh2LNm6GA+ratnFEfbtFuv2rCVlr3ILZ
	 XUpdHfHCmuRgDOc8b6YTfUJPuc/kKUf4PX4RDoVjLBUxcZ0CTVXPCmw/dSljDc0oV/tI9
	 /jPp+7sVQjc2+d+hEcP0L7U5FCygq9wEFq72l3w7xzs26+mr+TuoKEGibd1+DeDxQgJv1
	 QNGU8N0ixquF4k1QdmyafWc5Jri31qPKKq4hLe9GqM0ZFBk4oKCOr0/nu8KKndm1rbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795228176;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KXfuyhJbWS1+DE2JNL4cuvVkIrc2KfBJK1t5EtFGnlE=;
	b=tBlfqHAB2JGwn8FEy8vp16gJGR7UTW3ISvSICtK9YsD+knA0dY9Bz5pmztHLlB1LdtjK
	 8vKsj32awsk+7lnUgvWac6sgxYHTKCzALkuao9bbH3E3ielCALJqhmzl3dYIP+M6Q67ec
	 Vy3uzIL5EZYwAm6xXV7994haXtrxkoOlS+RNWWsI95O7b8317ygDxdXpbeh3FiiNpKube
	 aqK50YuDWtb9S86+AR0MkS6uooXzmPeM4mq2sQcEKe6oVacH2rMU2x/s1YyETXEiolopC
	 b1M3YHesBLfiskZS+rT7hyj2FVqO7F2D2A7j/eUoSjLfNQ5qrhlaPouMiXIXkTzCQmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TEGpENgW;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0877606A33E
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 02:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0877606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TEGpENgW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795228174; x=1826764174;
  h=date:from:to:cc:subject:message-id;
  bh=zShzfSYHQwaFI/ZB64CRHvAef4vb/3wwYJuaUI/jAyc=;
  b=TEGpENgWEaSzQ6pNv9TfPgkLIzCZz5nSmPA0YH8q8j76/e12LCFoR+ga
   VKCDozANPwRY+DOfz9atdb26tnoYhO/xZjTDHzln5utQ2mwUnHaE1svys
   yINK70OtrGLjsq5lIopLthtiIXPNjtJ1EmEVEY+uU6BPaTEwU22ki+DuE
   mShPaeIjBYRGg900R3LBnq7dwVIdZKjd+DZg5smZRuZAcO9aaTXWSF3qc
   hkT1sp5RgdZBCwL3xno0mvIyGo8+/XJi9gbgBOjutSKpZ1rZpoxzwkILP
   gn56PJpO97frhvQQ2YqyXPNtHxw0z8N/cKFU+TZTJmmKgbOWH21jBVDbC
   A==;
X-CSE-ConnectionGUID: 3X8KcAXaTCicjmS82xW49A==
X-CSE-MsgGUID: L2HK3Uw0QuS9ps7IQhUrTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3998504"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="3998504"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 18:29:33 -0800
X-CSE-ConnectionGUID: 6KOuzbiYQjaPxAphausi/g==
X-CSE-MsgGUID: 0u2bz281SUWCXN58s4qQ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11127300"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2026 18:29:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUar3-000000004DR-35In;
	Sat, 21 Nov 2026 02:29:29 +0000
Date: Sat, 21 Nov 2026 03:29:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 include/linux/signal.h:98:11: error: array index 3 is past the end of the
 array (that has type 'unsigned long[2]')
Message-ID: <20261121031821.L3mtupxq-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/acpi-static-table-irq-probe-defer-v2
head:   a75860f203b994ab67f8a876c7f568ac0f7f84c0
commit: 5df91ea5bcbef51cb967f3a07dd7c69c50681213 [3/10] ACPI: Introduce irq_get() for static fwnodes
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-2100-20261120 (https://download.01.org/0day-ci/archive/20261121/20261121031821.L3mtupxq-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121031821.L3mtupxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121031821.L3mtupxq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/xe/xe_amc.h:5:
   In file included from include/linux/i2c.h:13:
   include/linux/acpi.h:126:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     126 |         irq->flags = ACPI_STATIC_IRQ_FLAGS(trigger, polarity);
         |                      ^
   include/linux/acpi.h:71:3: note: expanded from macro 'ACPI_STATIC_IRQ_FLAGS'
      71 |         (FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))    | \
         |          ^
   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/xe/xe_amc.h:5:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
>> include/linux/signal.h:98:11: error: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Werror,-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/xe/xe_amc.h:5:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:98:25: error: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Werror,-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/xe/xe_amc.h:5:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
>> include/linux/signal.h:114:11: error: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/xe/xe_amc.h:5:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:114:27: error: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/xe/xe_amc.h:5:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:115:5: error: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/xe/xe_amc.h:5:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:115:21: error: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/xe/xe_amc.h:5:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:157:1: error: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/xe/xe_amc.h:5:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:


vim +98 include/linux/signal.h

^1da177e4c3f415 Linus Torvalds  2005-04-16   93  
71fabd5e4835309 George Anzinger 2006-01-08   94  static inline int sigisemptyset(sigset_t *set)
71fabd5e4835309 George Anzinger 2006-01-08   95  {
71fabd5e4835309 George Anzinger 2006-01-08   96  	switch (_NSIG_WORDS) {
71fabd5e4835309 George Anzinger 2006-01-08   97  	case 4:
71fabd5e4835309 George Anzinger 2006-01-08  @98  		return (set->sig[3] | set->sig[2] |
71fabd5e4835309 George Anzinger 2006-01-08   99  			set->sig[1] | set->sig[0]) == 0;
71fabd5e4835309 George Anzinger 2006-01-08  100  	case 2:
71fabd5e4835309 George Anzinger 2006-01-08  101  		return (set->sig[1] | set->sig[0]) == 0;
71fabd5e4835309 George Anzinger 2006-01-08  102  	case 1:
71fabd5e4835309 George Anzinger 2006-01-08  103  		return set->sig[0] == 0;
71fabd5e4835309 George Anzinger 2006-01-08  104  	default:
1c3bea0e71892ef Oleg Nesterov   2014-10-13  105  		BUILD_BUG();
71fabd5e4835309 George Anzinger 2006-01-08  106  		return 0;
71fabd5e4835309 George Anzinger 2006-01-08  107  	}
71fabd5e4835309 George Anzinger 2006-01-08  108  }
71fabd5e4835309 George Anzinger 2006-01-08  109  
c7be96af89d4b53 Waiman Long     2016-12-14  110  static inline int sigequalsets(const sigset_t *set1, const sigset_t *set2)
c7be96af89d4b53 Waiman Long     2016-12-14  111  {
c7be96af89d4b53 Waiman Long     2016-12-14  112  	switch (_NSIG_WORDS) {
c7be96af89d4b53 Waiman Long     2016-12-14  113  	case 4:
c7be96af89d4b53 Waiman Long     2016-12-14 @114  		return	(set1->sig[3] == set2->sig[3]) &&
c7be96af89d4b53 Waiman Long     2016-12-14  115  			(set1->sig[2] == set2->sig[2]) &&
c7be96af89d4b53 Waiman Long     2016-12-14  116  			(set1->sig[1] == set2->sig[1]) &&
c7be96af89d4b53 Waiman Long     2016-12-14  117  			(set1->sig[0] == set2->sig[0]);
c7be96af89d4b53 Waiman Long     2016-12-14  118  	case 2:
c7be96af89d4b53 Waiman Long     2016-12-14  119  		return	(set1->sig[1] == set2->sig[1]) &&
c7be96af89d4b53 Waiman Long     2016-12-14  120  			(set1->sig[0] == set2->sig[0]);
c7be96af89d4b53 Waiman Long     2016-12-14  121  	case 1:
c7be96af89d4b53 Waiman Long     2016-12-14  122  		return	set1->sig[0] == set2->sig[0];
c7be96af89d4b53 Waiman Long     2016-12-14  123  	}
c7be96af89d4b53 Waiman Long     2016-12-14  124  	return 0;
c7be96af89d4b53 Waiman Long     2016-12-14  125  }
c7be96af89d4b53 Waiman Long     2016-12-14  126  

:::::: The code at line 98 was first introduced by commit
:::::: 71fabd5e4835309b4feca6209122ce56c595c461 [PATCH] sigaction should clear all signals on SIG_IGN, not just < 32

:::::: TO: George Anzinger <george@mvista.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
