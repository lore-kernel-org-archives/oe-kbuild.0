Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA7C3A382E
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984303; cv=none; b=QBteobODeiF996axQAUWxO4An6qLPtuIsZiqBgHNoe1AUWMU59fzlMRhU/c9HmcPOCqCo8R5zmYLhv0AtvH4fVxYYRtusv5qh29A/DEngfsNvFyUJqtSzXVCuLU3Wpbdvu9Oemko/O9tlZEImAQ5EubxqzsX3Y8euaOCW3lmV28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984303; c=relaxed/simple;
	bh=irePccy4bUsHZ6cEdQinc8equEIcB0c2sdxXO9o11jc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uY44jY4ZdDHeTHyZM8nVWIncqQumItkk4/O6Cl5D5Zu7FslnGvNfBBao8L6Heox/R5swJXbrD76+vzot2fRBDOWHQoIqqyVPgVjvQhHe9iLRwM6LC6sHWRwaDspxamuMQ92uw2zOybM/MN37dCwk3ysX+bXUmIOKzM7cIU6CNZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PevrgyF2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PevrgyF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774984301; x=1806520301;
  h=date:from:to:cc:subject:message-id;
  bh=irePccy4bUsHZ6cEdQinc8equEIcB0c2sdxXO9o11jc=;
  b=PevrgyF210287pe7qwrr3oTn2mnfU7ZLYupa9ZQzhO8L603eDdcH8EwJ
   kN96CY8hBewPhVzAnHJsOHCgSlt8FwIcynGEFKXDQepbB8s8YIGaFs/SE
   2qwdDxciAaKiXEdfFc/wEalcuXcxLcHNLqjg33wsvftHL051LMMTABwZu
   X6NZRrVfOEH1g2LaW/V1UDpoBlkiv4RSst1dMrT5z5cFT+L5tHAjjIf/r
   wgON7IgBO37g/9SQjUJMeQUlvX6qJl6PB/47yO7y7KxJ28aPwoa1de6pL
   a5wMAxh4m4zHKIoXlt+DenzQJgkCiZjk0L0y2EBMJDjd7eSEX8ch4FJFP
   w==;
X-CSE-ConnectionGUID: X+CX7KMMSQ6tmOxiQuO9wQ==
X-CSE-MsgGUID: 595kVtD4TYa0w+YXPwDtfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93402225"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="93402225"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 12:11:40 -0700
X-CSE-ConnectionGUID: Y4HwwfU5TvOMh/hrHL7z7A==
X-CSE-MsgGUID: L2pEIK6bRyq86maJYVjZ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="264385165"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Mar 2026 12:11:39 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7eUy-000000004Al-0Oj1;
	Tue, 31 Mar 2026 19:11:36 +0000
Date: Wed, 01 Apr 2026 03:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/include/asm/current.h:24:(.xiptext+0x7f6):
 dangerous relocation: windowed longcall crosses 1GB boundary; return may
 fail: (.text+0xc48)
Message-ID: <202604010306.W6one6Wj-lkp@intel.com>
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
TO: Gabriele Monaco <gmonaco@redhat.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: 26f80681a09b95fd64bcf33d02e258e78a30842b sched: Add sched tracepoints for RV task model
date:   1 year ago
:::::: branch date: 22 hours ago
:::::: commit date: 1 year ago
config: xtensa-randconfig-r054-20260329 (https://download.01.org/0day-ci/archive/20260401/202604010306.W6one6Wj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010306.W6one6Wj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604010306.W6one6Wj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.c:143:(.xiptext+0x5d9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:144:(.xiptext+0x5eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:127:(.xiptext+0x641): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `arch_atomic_or':
   arch/xtensa/include/asm/atomic.h:257:(.xiptext+0x65e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0xcb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0xd78): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2627:(.text+0x14f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x798)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x1733): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2188:(.text+0x1b77): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2205:(.text+0x1bab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2269:(.text+0x1d02): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2275:(.text+0x1d13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1858:(.text+0x2254): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xd08)
   drivers/mtd/chips/cfi_cmdset_0002.c:1882:(.text+0x2314): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xd08)
   drivers/mtd/chips/cfi_cmdset_0002.c:1925:(.text+0x243c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xd08)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2137:(.text+0x2544): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1078)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x29e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xd08)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x2b27): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x2b97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x30e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x310c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1c0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0x53): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   drivers/mtd/chips/cfi_cmdset_0002.c:864:(.xiptext+0xca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:1995:(.xiptext+0x116): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x12e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x142): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x157): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x1c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x1de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x23c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x286): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x2d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x2eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1121:(.xiptext+0x2f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1122:(.xiptext+0x2f9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x304): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1124:(.xiptext+0x30e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x32c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1130:(.xiptext+0x342): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x448)
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x3af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1105:(.xiptext+0x3c9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x3da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x3e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x412): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x42b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1040:(.xiptext+0x448): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x4ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `usecs_to_jiffies':
   include/linux/jiffies.h:587:(.xiptext+0x4ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x4f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1958:(.xiptext+0x50e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x51b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1960:(.xiptext+0x521): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1961:(.xiptext+0x52c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1963:(.xiptext+0x53e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x566): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0x586): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x9e4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1718:(.xiptext+0x5e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1721:(.xiptext+0x5f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1723:(.xiptext+0x600): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc48)
   drivers/mtd/chips/cfi_cmdset_0002.c:1725:(.xiptext+0x60e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_enter':
   drivers/mtd/chips/cfi_cmdset_0002.c:1280:(.xiptext+0x632): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1282:(.xiptext+0x646): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1284:(.xiptext+0x65b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0x6a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_exit':
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.xiptext+0x6c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0x6d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0x6ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1301:(.xiptext+0x700): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1744:(.xiptext+0x72a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb50)
   drivers/mtd/chips/cfi_cmdset_0002.c:1746:(.xiptext+0x733): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x79e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2414:(.xiptext+0x7e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_current':
>> arch/xtensa/include/asm/current.h:24:(.xiptext+0x7f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc48)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_ff':
   include/linux/mtd/map.h:381:(.xiptext+0x814): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2422:(.xiptext+0x838): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1488)
   drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0x858): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2432:(.xiptext+0x86f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2436:(.xiptext+0x884): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2436:(.xiptext+0x89b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2437:(.xiptext+0x8af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2438:(.xiptext+0x8c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2448:(.xiptext+0x91e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:2448:(.xiptext+0x938): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2452:(.xiptext+0x940): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2455:(.xiptext+0x946): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2455:(.xiptext+0x952): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0x95e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2461:(.xiptext+0x98f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x9e4)
   drivers/mtd/chips/cfi_cmdset_0002.c:2469:(.xiptext+0x9af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2486:(.xiptext+0x9c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2491:(.xiptext+0xa04): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb50)
   drivers/mtd/chips/cfi_cmdset_0002.c:2491:(.xiptext+0xa0c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2507:(.xiptext+0xa7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xa94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xaab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0xac0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1668:(.xiptext+0xb12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
>> arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0xb2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0xb3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0xb41): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0xb4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0xb62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1684:(.xiptext+0xb97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1685:(.xiptext+0xba2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1488)
   drivers/mtd/chips/cfi_cmdset_0002.c:1694:(.xiptext+0xbc3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x9e4)
   drivers/mtd/chips/cfi_cmdset_0002.c:1709:(.xiptext+0xc16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1753:(.xiptext+0xc4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1766:(.xiptext+0xc6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1488)
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0xc97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1788:(.xiptext+0xd0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1788:(.xiptext+0xd2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0xd9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2511:(.xiptext+0xde4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2511:(.xiptext+0xdf2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc48)
   drivers/mtd/chips/cfi_cmdset_0002.c:2511:(.xiptext+0xe12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2514:(.xiptext+0xe36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1488)
   drivers/mtd/chips/cfi_cmdset_0002.c:2521:(.xiptext+0xe58): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2522:(.xiptext+0xe70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2528:(.xiptext+0xe86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2531:(.xiptext+0xe9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2532:(.xiptext+0xeaf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0xf12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:2540:(.xiptext+0xf2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2540:(.xiptext+0xf34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2541:(.xiptext+0xf3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2548:(.xiptext+0xf46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2548:(.xiptext+0xf52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2572:(.xiptext+0xf83): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x9e4)
   drivers/mtd/chips/cfi_cmdset_0002.c:2557:(.xiptext+0xfa3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2560:(.xiptext+0xfbc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2586:(.xiptext+0xff8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb50)
   drivers/mtd/chips/cfi_cmdset_0002.c:2572:(.xiptext+0x1000): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2604:(.xiptext+0x107e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x109a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x10a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc48)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2030:(.xiptext+0x110f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2032:(.xiptext+0x1133): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1488)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load':
   include/linux/mtd/map.h:328:(.xiptext+0x1150): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   include/linux/mtd/map.h:330:(.xiptext+0x116a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   include/linux/mtd/map.h:330:(.xiptext+0x1178): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2042:(.xiptext+0x119e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2052:(.xiptext+0x1209): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2055:(.xiptext+0x1212): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load':
   include/linux/mtd/map.h:327:(.xiptext+0x1247): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2061:(.xiptext+0x129e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb50)
   drivers/mtd/chips/cfi_cmdset_0002.c:2063:(.xiptext+0x12a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_writev':
   drivers/mtd/chips/cfi_cmdset_0001.c:1916:(.text+0x19fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x3f0)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   drivers/mtd/chips/cfi_cmdset_0001.c:1666:(.text+0x1b5f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe3c)
   drivers/mtd/chips/cfi_cmdset_0001.c:1687:(.text+0x1c10): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe3c)
   drivers/mtd/chips/cfi_cmdset_0001.c:1711:(.text+0x1ca6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe3c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `read_pri_intelext':
   drivers/mtd/chips/cfi_cmdset_0001.c:401:(.text+0x1f12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o:drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0x52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.o:drivers/mtd/chips/cfi_cmdset_0001.c:1161:(.xiptext+0x6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1177:(.xiptext+0xf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1177:(.xiptext+0x10c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1192:(.xiptext+0x158): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1204:(.xiptext+0x174): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1210:(.xiptext+0x198): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1215:(.xiptext+0x1b5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.c:1220:(.xiptext+0x1c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1221:(.xiptext+0x1d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1236:(.xiptext+0x21f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0001.c:1246:(.xiptext+0x236): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x23e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x244): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x250): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.c:1238:(.xiptext+0x25a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `get_current':
>> arch/xtensa/include/asm/current.h:24:(.xiptext+0x26c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1240:(.xiptext+0x27e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1243:(.xiptext+0x29b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1218:(.xiptext+0x352): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:1267:(.xiptext+0x36b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1134:(.xiptext+0x388): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x3f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:1726:(.xiptext+0x462): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1726:(.xiptext+0x470): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1736:(.xiptext+0x484): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1736:(.xiptext+0x492): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xec8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `is_LH28F640BF':
   drivers/mtd/chips/cfi_cmdset_0001.c:273:(.xiptext+0x4bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1908)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1748:(.xiptext+0x4d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1750:(.xiptext+0x4fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1759:(.xiptext+0x540): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1769:(.xiptext+0x56a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1770:(.xiptext+0x582): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1780:(.xiptext+0x5a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1787:(.xiptext+0x5ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `map_word_load_partial':
   include/linux/mtd/map.h:360:(.xiptext+0x6e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1829:(.xiptext+0x716): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1836:(.xiptext+0x737): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1840:(.xiptext+0x752): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1844:(.xiptext+0x76f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1847:(.xiptext+0x782): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1852:(.xiptext+0x79c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa38)
   drivers/mtd/chips/cfi_cmdset_0001.c:1852:(.xiptext+0x7a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1855:(.xiptext+0x7b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:1860:(.xiptext+0x7c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1882:(.xiptext+0x7db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1883:(.xiptext+0x80e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1884:(.xiptext+0x818): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1908)
   drivers/mtd/chips/cfi_cmdset_0001.c:1885:(.xiptext+0x826): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1862:(.xiptext+0x83e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1887:(.xiptext+0x8de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x900): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x90e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xec8)
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x938): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1908)
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x947): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x95f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1983:(.xiptext+0x977): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1972:(.xiptext+0x9b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1978:(.xiptext+0x9d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1978:(.xiptext+0x9e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1980:(.xiptext+0xa07): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1985:(.xiptext+0xa26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1991:(.xiptext+0xa46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1998:(.xiptext+0xa64): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2000:(.xiptext+0xa7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa38)
   drivers/mtd/chips/cfi_cmdset_0001.c:2003:(.xiptext+0xa82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2035:(.xiptext+0xa96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2014:(.xiptext+0xab2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa38)
   drivers/mtd/chips/cfi_cmdset_0001.c:2017:(.xiptext+0xaba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2019:(.xiptext+0xaca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:2021:(.xiptext+0xada): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2023:(.xiptext+0xaf2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2007:(.xiptext+0xb52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:2008:(.xiptext+0xb73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1908)
   drivers/mtd/chips/cfi_cmdset_0001.c:2009:(.xiptext+0xb82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2104:(.xiptext+0xc7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:2104:(.xiptext+0xc94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:2104:(.xiptext+0xca2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xec8)
   drivers/mtd/chips/cfi_cmdset_0001.c:2123:(.xiptext+0xcc0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1908)
   drivers/mtd/chips/cfi_cmdset_0001.c:2123:(.xiptext+0xccf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2123:(.xiptext+0xceb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2131:(.xiptext+0xd0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2138:(.xiptext+0xd31): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2138:(.xiptext+0xd3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/chips/cfi_cmdset_0001.c:2143:(.xiptext+0xd6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2146:(.xiptext+0xd8b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:2149:(.xiptext+0xdac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa38)
   drivers/mtd/chips/cfi_cmdset_0001.c:2149:(.xiptext+0xdb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2179:(.xiptext+0xe42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:2179:(.xiptext+0xe67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2179:(.xiptext+0xe74): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1569:(.xiptext+0xe88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1569:(.xiptext+0xe96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xec8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0001.c:1569:(.xiptext+0xec0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1908)
   drivers/mtd/chips/cfi_cmdset_0001.c:1589:(.xiptext+0xefe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1590:(.xiptext+0xf1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1598:(.xiptext+0xf3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1599:(.xiptext+0xf4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.c:1603:(.xiptext+0xf66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa38)
   drivers/mtd/chips/cfi_cmdset_0001.c:1607:(.xiptext+0xf6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1609:(.xiptext+0xf7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:1614:(.xiptext+0xf90): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1636:(.xiptext+0xfaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1424:(.exception.text+0x1e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':


vim +24 arch/xtensa/include/asm/current.h

9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23  21  
86e50ab6f8a0f5 arch/xtensa/include/asm/current.h Suren Baghdasaryan 2024-07-04  22  static __always_inline struct task_struct *get_current(void)
9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23  23  {
9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23 @24  	return current_thread_info()->task;
9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23  25  }
9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23  26  

:::::: The code at line 24 was first introduced by commit
:::::: 9a8fd5589902153a134111ed7a40f9cca1f83254 [PATCH] xtensa: Architecture support for Tensilica Xtensa Part 6

:::::: TO: Chris Zankel <czankel@tensilica.com>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
