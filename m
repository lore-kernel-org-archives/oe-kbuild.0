Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0463009D4
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840862; cv=none; b=bNS9dWK6D07+CRmKguIK2mfJGnyc/ymP/ufhuVMrNjMPvlSbU1A4rIAj4dWcrJza+uOJ6bZmrs7vSN97Ptlod2Hi5pzaUPDr+mn5JRMq0RKMXkZsHQC/7fcKdcqdURBoG3ym0a0anc/Psq2U5XZr0tmev8YHqAj8Xm10/AfluV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840862; c=relaxed/simple;
	bh=BpYNn0uJmKtOdNd9ercQKW8FhkxUw7T5K1rc5h5/HKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fQWbIBgj0EiUDlD2VRBtcu2O9AzoWwobXEgoooiLLIv055Lk5RW99zE/MgEePbfpSSvrYTwgXBvdE5gnCpOgGEmHtzjFLKI+d2E0VncxVCt+psAWhMDbvxmt6ebIbwdaXXwgID0ZpqgcTCSWoLA+FhVaVWfy+FIXl2y88su3XV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWBDQtRF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWBDQtRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768840860; x=1800376860;
  h=date:from:to:cc:subject:message-id;
  bh=BpYNn0uJmKtOdNd9ercQKW8FhkxUw7T5K1rc5h5/HKg=;
  b=gWBDQtRFT9YRFveomeJKGQQZI9VCqjLKCUTxqKu8IYTwzj4CmoXzJgrI
   iCcJOG2DaaRqcShT3ABepKlRUnxKC8sWYapPFdkJT6ERGd5YldGfOr2T6
   uGRwE6pMoG8H5X+cl4yLVNmQrA3QS5FJFSGAYTdo801LfSUVtIRNwwOyp
   yhZY/ZLBDAJqMnZE5dCJC+n5/9UxgQ7GaXtAvBGAgRLNzJh9zGFgKRaTP
   D297qLHsIUlS9hthNGXtcEBZ2LNzWLzQnd60etisM4JjaGZo0dUIYDkc+
   0SNhwmprN06t7hODHyS0/+RVxvD17YFIfDztjkYIna9ZPU5BncFZL9kQZ
   A==;
X-CSE-ConnectionGUID: Z3h5e8x/QreU/V2NKAfCFA==
X-CSE-MsgGUID: l2mW+fA8T1u5lTPnjWhFOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81424924"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="81424924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:40:59 -0800
X-CSE-ConnectionGUID: M9v6G+PHSRiBg2xgxxq1Tw==
X-CSE-MsgGUID: vP5QKzE4Q0OatSqP+PoapQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210407416"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2026 08:40:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhsJC-00000000O3m-3z69;
	Mon, 19 Jan 2026 16:40:54 +0000
Date: Tue, 20 Jan 2026 00:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/include/asm/irqflags.h:75:(.xiptext+0x2e3):
 dangerous relocation: windowed longcall crosses 1GB boundary; return may
 fail: __trace_set_current_state
Message-ID: <202601200040.9xcqtLKw-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: xtensa-randconfig-r054-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200040.9xcqtLKw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200040.9xcqtLKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601200040.9xcqtLKw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0xb06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2461:(.xiptext+0xb3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x954)
   drivers/mtd/chips/cfi_cmdset_0002.c:2472:(.xiptext+0xb6f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `__raw_writew':
   include/asm-generic/io.h:159:(.xiptext+0xbd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb8c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `__raw_writel':
   include/asm-generic/io.h:167:(.xiptext+0xbde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2507:(.xiptext+0xc32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2507:(.xiptext+0xc4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2507:(.xiptext+0xc58): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc80)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load':
   include/linux/mtd/map.h:330:(.xiptext+0xccc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1688)
   include/linux/mtd/map.h:330:(.xiptext+0xce7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2043:(.xiptext+0xcff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2044:(.xiptext+0xd0b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_write':
   include/linux/mtd/map.h:414:(.xiptext+0xd5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load':
   include/linux/mtd/map.h:330:(.xiptext+0xe18): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2072:(.xiptext+0xea2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb8c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2078:(.xiptext+0xeac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0xf36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0xf54): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0xf6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0xf82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1668:(.xiptext+0x100a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x1026): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x1033): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_current':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x1039): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x1044): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x105a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1685:(.xiptext+0x108e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1688)
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0x10ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x954)
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0x1112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_read':
   include/linux/mtd/map.h:395:(.xiptext+0x116e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1688)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0x1192): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_write':
   include/linux/mtd/map.h:426:(.xiptext+0x120a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x1292): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x12dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x12ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc80)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2511:(.xiptext+0x1314): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1688)
   drivers/mtd/chips/cfi_cmdset_0002.c:2512:(.xiptext+0x133a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2521:(.xiptext+0x134e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2522:(.xiptext+0x1363): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2531:(.xiptext+0x1378): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2532:(.xiptext+0x138c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `__raw_writeb':
   include/asm-generic/io.h:151:(.xiptext+0x1426): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `__raw_writel':
   include/asm-generic/io.h:167:(.xiptext+0x1440): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_write':
   include/linux/mtd/map.h:427:(.xiptext+0x1448): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2544:(.xiptext+0x144e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2546:(.xiptext+0x145a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2544:(.xiptext+0x1466): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `raw_atomic_read':
   include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x149e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x954)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2560:(.xiptext+0x14cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2578:(.xiptext+0x1532): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb8c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2586:(.xiptext+0x153c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_writev':
   drivers/mtd/chips/cfi_cmdset_0001.c:1892:(.text+0x1704): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x55c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   drivers/mtd/chips/cfi_cmdset_0001.c:1684:(.text+0x1a63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x12b0)
   drivers/mtd/chips/cfi_cmdset_0001.c:1676:(.text+0x1b03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x12b0)
   drivers/mtd/chips/cfi_cmdset_0001.c:1697:(.text+0x1b9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x12b0)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `kmalloc_noprof':
   include/linux/slab.h:905:(.text+0x1f7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o:(.xiptext+0x56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.o:(.xiptext+0x6f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1177:(.xiptext+0x100): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1191:(.xiptext+0x13f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_readb':
   include/asm-generic/io.h:117:(.xiptext+0x1de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_readw':
   include/asm-generic/io.h:125:(.xiptext+0x1ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1205:(.xiptext+0x207): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_writew':
   include/asm-generic/io.h:159:(.xiptext+0x26b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_writel':
   include/asm-generic/io.h:167:(.xiptext+0x27a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_read':
   include/linux/mtd/map.h:393:(.xiptext+0x288): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   include/linux/mtd/map.h:395:(.xiptext+0x292): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `arch_irqs_disabled_flags':
>> arch/xtensa/include/asm/irqflags.h:75:(.xiptext+0x2e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x2fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x302): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x308): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `get_current':
>> arch/xtensa/include/asm/current.h:24:(.xiptext+0x312): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1238:(.xiptext+0x31c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x32a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1239:(.xiptext+0x337): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1249:(.xiptext+0x376): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1267:(.xiptext+0x492): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:1267:(.xiptext+0x4aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_writew':
   include/asm-generic/io.h:159:(.xiptext+0x513): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x562): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x5c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x5d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1726:(.xiptext+0x5e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1736:(.xiptext+0x5f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcc8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `is_LH28F640BF':
   drivers/mtd/chips/cfi_cmdset_0001.c:273:(.xiptext+0x61a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x15c8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1748:(.xiptext+0x62c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1759:(.xiptext+0x69e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_write':
   include/linux/mtd/map.h:426:(.xiptext+0x6de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/map.h:426:(.xiptext+0x794): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_read':
   include/linux/mtd/map.h:397:(.xiptext+0x802): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_writel':
   include/asm-generic/io.h:167:(.xiptext+0x842): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1788:(.xiptext+0x8cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1828:(.xiptext+0xa16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1837:(.xiptext+0xa6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1852:(.xiptext+0xaf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_read':
   include/linux/mtd/map.h:393:(.xiptext+0xb3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_write':
   include/linux/mtd/map.h:417:(.xiptext+0xba6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7b4)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_writel':
   include/asm-generic/io.h:167:(.xiptext+0xbae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1866:(.xiptext+0xbbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_write':
   include/linux/mtd/map.h:414:(.xiptext+0xbcc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/map.h:418:(.xiptext+0xbec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x15c8)
   include/linux/mtd/map.h:426:(.xiptext+0xbf8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1773:(.xiptext+0xc6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:1835:(.xiptext+0xc8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1835:(.xiptext+0xc9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcc8)
   drivers/mtd/chips/cfi_cmdset_0001.c:1887:(.xiptext+0xcb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x15c8)
   drivers/mtd/chips/cfi_cmdset_0001.c:1887:(.xiptext+0xcc6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2125:(.xiptext+0xd0b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_write':
   include/linux/mtd/map.h:414:(.xiptext+0xd53): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/map.h:427:(.xiptext+0xdc0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2163:(.xiptext+0xe20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7b4)
   drivers/mtd/chips/cfi_cmdset_0001.c:2163:(.xiptext+0xe28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_write':
   include/linux/mtd/map.h:413:(.xiptext+0xe4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_writel':
   include/asm-generic/io.h:167:(.xiptext+0xe6c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2168:(.xiptext+0xe7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcc8)
   drivers/mtd/chips/cfi_cmdset_0001.c:2176:(.xiptext+0xea4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x15c8)
   drivers/mtd/chips/cfi_cmdset_0001.c:2179:(.xiptext+0xeb0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2179:(.xiptext+0xef0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:1963:(.xiptext+0xf2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_write':
   include/linux/mtd/map.h:417:(.xiptext+0xf98): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/map.h:418:(.xiptext+0xfd9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:1990:(.xiptext+0x104f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1998:(.xiptext+0x109e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2003:(.xiptext+0x110c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7b4)
   drivers/mtd/chips/cfi_cmdset_0001.c:2003:(.xiptext+0x1114): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_write':
   include/linux/mtd/map.h:415:(.xiptext+0x1138): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x7b4)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_writew':
   include/asm-generic/io.h:159:(.xiptext+0x1140): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `inline_map_write':
   include/linux/mtd/map.h:426:(.xiptext+0x1150): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2008:(.xiptext+0x115e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__raw_writel':
   include/asm-generic/io.h:167:(.xiptext+0x1192): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2014:(.xiptext+0x11ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x15c8)
   drivers/mtd/chips/cfi_cmdset_0001.c:2021:(.xiptext+0x11bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2100:(.xiptext+0x12b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:314:(.xiptext+0x12e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/cfi.h:320:(.xiptext+0x12ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x1300): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested


vim +75 arch/xtensa/include/asm/irqflags.h

df9ee29270c11d David Howells 2010-10-07  69  
df9ee29270c11d David Howells 2010-10-07  70  static inline bool arch_irqs_disabled_flags(unsigned long flags)
df9ee29270c11d David Howells 2010-10-07  71  {
031d0112d780d4 Max Filippov  2013-03-31  72  #if XCHAL_EXCM_LEVEL < LOCKLEVEL || (1 << PS_EXCM_BIT) < LOCKLEVEL
031d0112d780d4 Max Filippov  2013-03-31  73  #error "XCHAL_EXCM_LEVEL and 1<<PS_EXCM_BIT must be no less than LOCKLEVEL"
031d0112d780d4 Max Filippov  2013-03-31  74  #endif
031d0112d780d4 Max Filippov  2013-03-31 @75  	return (flags & (PS_INTLEVEL_MASK | (1 << PS_EXCM_BIT))) >= LOCKLEVEL;
df9ee29270c11d David Howells 2010-10-07  76  }
df9ee29270c11d David Howells 2010-10-07  77  

:::::: The code at line 75 was first introduced by commit
:::::: 031d0112d780d4a8fe8b0bfba4ae446e4ddc5c66 xtensa: fix arch_irqs_disabled_flags implementation

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Chris Zankel <chris@zankel.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
