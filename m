Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC1D2727FD
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 03:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784345902; cv=none; b=edtrm1O2qnViaGLunKsCYmw8//1IwBuZzMyVdx3LR7mhbkeoeanpUOacZP54OI0oLclQO80HftJ+8EjGz6VUgSwG7feruoFvgUT3o+Lc+NyQxMWbTJhVWXLgG7yMThhPb5fYrVyAM2M4HysjMKaFkyTR74N3mksBCF5EZ942lAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784345902; c=relaxed/simple;
	bh=/1OvPE038sm9C/DKtvkA3FLxt+yeS2NEtop8XNQCGkk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KUbQnzeSQApNpQuYVGufqPm63EOziP+SJr2G1KVuG2ac0bJBiqfwBWuvc9DDTkU2cxp1nDDzAxuIY5vFkMi37Ok9LKgutjHfUOhOjLRTy1OCAhZZ46w6nL43UzTz3K/5IRrAhDyaEtLGYPjQZMFQncByetr87Ct1IyYawIU6E2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbI4MXjm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbI4MXjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784345899; x=1815881899;
  h=date:from:to:cc:subject:message-id;
  bh=/1OvPE038sm9C/DKtvkA3FLxt+yeS2NEtop8XNQCGkk=;
  b=RbI4MXjmUzrsOU5FmGoQVA1XLSHFvS0zn8PigDjQMrZBu2ZrZ54z/ksy
   P/AMKZR9HVoGuNajDmxX652caTsC6wynvWgLK98GQU7kPMnFUK2Z2htRk
   dvIgQrM0w+v9RB9PI8FQyMKnHSOwKYwJuDuMD3oHefNbQO8Qtt1P5O7I8
   Fd00PDD5LS+iqaLjZATH6zFnVCoDo/pTOyBzrScCxRdXqsjBDZV1ArSCR
   MZgzPeAUQ62xjamMhMyN3hmlIux/Gy7V1X6HJ/30J047y3iNUD5r0YVYz
   ulhLiWHpj6CvWdzi0xWeb8jwv4y78yDIkwM7KmurbTw7yQPQ5nzO3cVCb
   g==;
X-CSE-ConnectionGUID: DfG5BYwbQvyBgGIBe3MXvQ==
X-CSE-MsgGUID: USyZKXWiQMaIsRRYRRI0SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="83998300"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="83998300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 20:38:18 -0700
X-CSE-ConnectionGUID: 61gNvD9+T7uFHgmud4tJfw==
X-CSE-MsgGUID: XqUN+7VwQmyX7phRh7cWfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="250596951"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2026 20:38:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkvsU-00000000TQN-3XEZ;
	Sat, 18 Jul 2026 03:38:14 +0000
Date: Sat, 18 Jul 2026 11:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x1f36): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 __tsan_read4
Message-ID: <202607181140.rXrR3nHa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ian Rogers <irogers@google.com>
CC: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: a339671db64b12bb02492557d2b0658811286277 vdso: Switch get/put_unaligned() from packed struct to memcpy()
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: xtensa-randconfig-001-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181140.rXrR3nHa-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181140.rXrR3nHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to memcpy()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607181140.rXrR3nHa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0002.c:2543:(.xiptext+0x1873): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2544:(.xiptext+0x187f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2545:(.xiptext+0x188b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2546:(.xiptext+0x189a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2548:(.xiptext+0x18b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2552:(.xiptext+0x18cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2555:(.xiptext+0x18da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x18e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x25f0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2557:(.xiptext+0x18f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x1908): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2558:(.xiptext+0x1920): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2560:(.xiptext+0x1934): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2563:(.xiptext+0x194f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:2572:(.xiptext+0x198c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2573:(.xiptext+0x199c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2573:(.xiptext+0x19a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2586:(.xiptext+0x19c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2586:(.xiptext+0x19c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2591:(.xiptext+0x19d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2591:(.xiptext+0x19e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2594:(.xiptext+0x19f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2591:(.xiptext+0x1a00): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2600:(.xiptext+0x1a10): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2601:(.xiptext+0x1a1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2603:(.xiptext+0x1a34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2603:(.xiptext+0x1a3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1a4b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1a57): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1a6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1a76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1a84): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1a90): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1aa6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1aae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1abc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1ac8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1ade): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1ae6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1af3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1b96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1baa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1bb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1bb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1bc4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1bce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1bde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1bec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x1bfe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   drivers/mtd/chips/cfi_cmdset_0002.c:2414:(.xiptext+0x1c24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1eb8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x1c3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   include/linux/mtd/map.h:380:(.xiptext+0x1c60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/map.h:383:(.xiptext+0x1c6f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2417:(.xiptext+0x1c7b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2421:(.xiptext+0x1c9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2431:(.xiptext+0x1cb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2431:(.xiptext+0x1ccf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2484)
   drivers/mtd/chips/cfi_cmdset_0002.c:2431:(.xiptext+0x1cd7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2432:(.xiptext+0x1cdd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:2432:(.xiptext+0x1cee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.c:2436:(.xiptext+0x1d7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0002.c:2436:(.xiptext+0x1d83): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2437:(.xiptext+0x1d94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2437:(.xiptext+0x1da2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2437:(.xiptext+0x1db0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x25f0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2438:(.xiptext+0x1dc4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2438:(.xiptext+0x1dd2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:2439:(.xiptext+0x1e20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2440:(.xiptext+0x1e3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2440:(.xiptext+0x1e50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2440:(.xiptext+0x1e6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:2441:(.xiptext+0x1e74): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2441:(.xiptext+0x1e84): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2441:(.xiptext+0x1e93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2443:(.xiptext+0x1eab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2444:(.xiptext+0x1eb4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2444:(.xiptext+0x1ec0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2445:(.xiptext+0x1ed0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2448:(.xiptext+0x1ee6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2448:(.xiptext+0x1ef3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2448:(.xiptext+0x1f03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2452:(.xiptext+0x1f1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2455:(.xiptext+0x1f27): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
>> include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x1f36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
>> arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x1f46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0x1f57): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2460:(.xiptext+0x1f7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:2469:(.xiptext+0x1fc7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2472:(.xiptext+0x1fda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2478:(.xiptext+0x2002): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2486:(.xiptext+0x2013): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2491:(.xiptext+0x2026): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2491:(.xiptext+0x2033): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2501:(.xiptext+0x206a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2501:(.xiptext+0x2074): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2503:(.xiptext+0x208b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2484)
   drivers/mtd/chips/cfi_cmdset_0002.c:2503:(.xiptext+0x2093): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2504:(.xiptext+0x2099): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0002.c:2507:(.xiptext+0x20aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_suspend':
   drivers/mtd/chips/cfi_cmdset_0001.c:2583:(.text+0x130a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_read':
   drivers/mtd/chips/cfi_cmdset_0001.c:1541:(.text+0x3b96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xaf4)
   drivers/mtd/chips/cfi_cmdset_0001.c:1514:(.text+0x3c7f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xaf4)
   drivers/mtd/chips/cfi_cmdset_0001.c:1567:(.text+0x3d72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xaf4)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_point':
   drivers/mtd/chips/cfi_cmdset_0001.c:1430:(.text+0x3f38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xd68)
   drivers/mtd/chips/cfi_cmdset_0001.o:drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0x66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0001.o:drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0x6f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.o:drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0x80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.o:drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0x94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o:drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0xdb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.o:drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0xec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0x10b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0x120): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1162:(.xiptext+0x133): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1164:(.xiptext+0x147): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1164:(.xiptext+0x158): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1171:(.xiptext+0x16b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1176:(.xiptext+0x17c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1177:(.xiptext+0x1b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1178:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1179:(.xiptext+0x1f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1191:(.xiptext+0x20b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1191:(.xiptext+0x222): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0001.c:1192:(.xiptext+0x230): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1192:(.xiptext+0x23f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1190:(.xiptext+0x250): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1195:(.xiptext+0x260): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.c:1204:(.xiptext+0x272): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1204:(.xiptext+0x27e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1205:(.xiptext+0x286): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1215:(.xiptext+0x2ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_cmdset_0001.c:1220:(.xiptext+0x2e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1220:(.xiptext+0x2ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0001.c:1221:(.xiptext+0x2fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0001.c:1221:(.xiptext+0x30a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1222:(.xiptext+0x31a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0001.c:1224:(.xiptext+0x322): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1225:(.xiptext+0x32c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_write4
   drivers/mtd/chips/cfi_cmdset_0001.c:1235:(.xiptext+0x33b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.c:1235:(.xiptext+0x343): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1236:(.xiptext+0x349): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0001.c:1236:(.xiptext+0x354): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   arch/xtensa/include/asm/irqflags.h:47:(.xiptext+0x35e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1246:(.xiptext+0x366): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x386): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x393): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x3a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x3b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x3c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x3d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1239:(.xiptext+0x3f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1236:(.xiptext+0x437): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0001.c:1249:(.xiptext+0x452): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   drivers/mtd/chips/cfi_cmdset_0001.c:1250:(.xiptext+0x477): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   drivers/mtd/chips/cfi_cmdset_0001.c:1251:(.xiptext+0x494): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0001.c:1202:(.xiptext+0x4f9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0001.c:1267:(.xiptext+0x504): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1213:(.xiptext+0x517): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1213:(.xiptext+0x523): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1218:(.xiptext+0x533): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1218:(.xiptext+0x548): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0001.c:1217:(.xiptext+0x553): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1267:(.xiptext+0x565): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.c:1267:(.xiptext+0x56e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0001.c:1137:(.xiptext+0x5f9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_cmdset_0001.c:1137:(.xiptext+0x602): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1138:(.xiptext+0x60e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x63a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x648): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x24d4)
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x656): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x662): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x67c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x692): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x6ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off


vim +457 include/linux/atomic/atomic-arch-fallback.h

e01cc1e8c2ad73 Uros Bizjak  2023-09-25  443  
ad8110706f3811 Mark Rutland 2023-06-05  444  /**
ad8110706f3811 Mark Rutland 2023-06-05  445   * raw_atomic_read() - atomic load with relaxed ordering
ad8110706f3811 Mark Rutland 2023-06-05  446   * @v: pointer to atomic_t
ad8110706f3811 Mark Rutland 2023-06-05  447   *
ad8110706f3811 Mark Rutland 2023-06-05  448   * Atomically loads the value of @v with relaxed ordering.
ad8110706f3811 Mark Rutland 2023-06-05  449   *
ad8110706f3811 Mark Rutland 2023-06-05  450   * Safe to use in noinstr code; prefer atomic_read() elsewhere.
ad8110706f3811 Mark Rutland 2023-06-05  451   *
ad8110706f3811 Mark Rutland 2023-06-05  452   * Return: The value loaded from @v.
ad8110706f3811 Mark Rutland 2023-06-05  453   */
1d78814d41701c Mark Rutland 2023-06-05  454  static __always_inline int
1d78814d41701c Mark Rutland 2023-06-05  455  raw_atomic_read(const atomic_t *v)
1d78814d41701c Mark Rutland 2023-06-05  456  {
1d78814d41701c Mark Rutland 2023-06-05 @457  	return arch_atomic_read(v);
1d78814d41701c Mark Rutland 2023-06-05  458  }
9257959a6e5b4f Mark Rutland 2023-06-05  459  

:::::: The code at line 457 was first introduced by commit
:::::: 1d78814d41701c216e28fcf2656526146dec4a1a locking/atomic: scripts: simplify raw_atomic*() definitions

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
