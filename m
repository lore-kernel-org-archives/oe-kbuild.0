Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1723437FF58
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 04:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774152785; cv=none; b=KCh4l3m/Aba+Zitevj1ECam0/Mnwkdk3RmjyG7eQnAAI0SHBDpdO9cGOrwUH5nViH3V78gMNZPVOTNzCWsDgoLQV8YCz1bFl7+A1EkH14CBJvKl2CVaKznYBbAApZFthGpeeT9loKsvJyFS0eOlZ/KZb+jptGcKmcEJtjMCmBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774152785; c=relaxed/simple;
	bh=rNpF8aLseqVU3a4l9COkq9Ne5nK+hyPuH8tI60+0b6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MipT8NJE2mM7EkPnpQug7lnFtQw7auJfACnyjKR+FsGVJRT0yjOBzT4/09X7IgkNFxdqRj7LZzeCo7Hin9lhDv1UaQAMoDh7HIfsjhWh63iD1kWB7BZJ7V9D0x56t+snZWPyWIKpWWkm2l3J9H2Tqmrgq/7cTmou3OyvtxFf6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjY+0pk7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjY+0pk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774152782; x=1805688782;
  h=date:from:to:cc:subject:message-id;
  bh=rNpF8aLseqVU3a4l9COkq9Ne5nK+hyPuH8tI60+0b6U=;
  b=EjY+0pk7jYECnc7GRiKhDabd1uSf4rqsbIiGZnaQGNA9K3sTTbUu3Rva
   G7pb2Q5sPgWCXG5aa2CVXUjjzQuUfaa0au+6AWDVBdBvQ540yKj4iyNu0
   x4VXWEjvL/YdaSpLsKKNwZUyFswLGih+T2VsTWTVCSbnFvqq2kfNpqoyC
   Feqo3JGRehrSJ19EGJiWoZ43RCx7PA2Fraj+KYuuMOwRNEm49blOPXlnu
   Q4rdcD5/qZU3v4VnS1b/ZsW93W8vwcFQzKtEVRhKETL9pUGn2DGgXhyVt
   IvLHlR6GpIPsY6Rztwew60qTDlVUWmS4FZlI1AkjmVsnjFEArLstYxW3m
   A==;
X-CSE-ConnectionGUID: 0UoUWHAVR1mNq4niF7de1w==
X-CSE-MsgGUID: H7+H1zg3SySlSEaO3rtfgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="74901975"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="74901975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 21:13:02 -0700
X-CSE-ConnectionGUID: 21ulS8tARiKMu3zPW4bVRg==
X-CSE-MsgGUID: PObDwGkSR+aO91SWvWRURA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="254154919"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Mar 2026 21:13:00 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4AAJ-000000001fF-0sZv;
	Sun, 22 Mar 2026 04:12:14 +0000
Date: Sun, 22 Mar 2026 12:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x3de): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 add_wait_queue
Message-ID: <202603221237.NvghCens-lkp@intel.com>
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
head:   113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: xtensa-randconfig-r051-20260321 (https://download.01.org/0day-ci/archive/20260322/202603221237.NvghCens-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221237.NvghCens-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603221237.NvghCens-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_cmdset_0002.c:2437:(.xiptext+0xcfb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2438:(.xiptext+0xd0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2448:(.xiptext+0xd6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2448:(.xiptext+0xd86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2455:(.xiptext+0xd9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0xdda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:2465:(.xiptext+0xe04): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2465:(.xiptext+0xe0c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0xe12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0xe20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0xe2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2468:(.xiptext+0xe78): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb90)
   drivers/mtd/chips/cfi_cmdset_0002.c:2478:(.xiptext+0xee6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2500:(.xiptext+0xf60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe08)
   drivers/mtd/chips/cfi_cmdset_0002.c:2501:(.xiptext+0xf68): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2507:(.xiptext+0x100e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2507:(.xiptext+0x1024): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x103b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1673:(.xiptext+0x10aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x10c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x10da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x1117): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0x113e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0x114b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x1151): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x115c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x1172): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1683:(.xiptext+0x119f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b04)
   drivers/mtd/chips/cfi_cmdset_0002.c:1695:(.xiptext+0x11ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb90)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0x12da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b04)
   drivers/mtd/chips/cfi_cmdset_0002.c:1772:(.xiptext+0x130b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x14b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x14c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xec8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2514:(.xiptext+0x14de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2522:(.xiptext+0x153f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b04)
   drivers/mtd/chips/cfi_cmdset_0002.c:2525:(.xiptext+0x1568): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2531:(.xiptext+0x157c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2531:(.xiptext+0x1592): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2532:(.xiptext+0x15a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2533:(.xiptext+0x15bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0x1626): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2540:(.xiptext+0x163e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2544:(.xiptext+0x1656): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.c:2555:(.xiptext+0x1692): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:2557:(.xiptext+0x16bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2557:(.xiptext+0x16c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2557:(.xiptext+0x16ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2557:(.xiptext+0x16d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x16e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2558:(.xiptext+0x1732): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb90)
   drivers/mtd/chips/cfi_cmdset_0002.c:2572:(.xiptext+0x17a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2586:(.xiptext+0x1818): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe08)
   drivers/mtd/chips/cfi_cmdset_0002.c:2591:(.xiptext+0x1820): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x18ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x18d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xec8)
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x18f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   include/linux/mtd/map.h:328:(.xiptext+0x19bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b04)
   include/linux/mtd/map.h:329:(.xiptext+0x19d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2042:(.xiptext+0x19f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2042:(.xiptext+0x1a03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2043:(.xiptext+0x1a2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2059:(.xiptext+0x1abc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   include/linux/mtd/map.h:328:(.xiptext+0x1af7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2071:(.xiptext+0x1b7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe08)
   drivers/mtd/chips/cfi_cmdset_0002.c:2074:(.xiptext+0x1b86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_writev':
   drivers/mtd/chips/cfi_cmdset_0001.c:1906:(.text+0x2372): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xee0)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   drivers/mtd/chips/cfi_cmdset_0001.c:1656:(.text+0x2577): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc30)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   include/linux/mtd/map.h:328:(.text+0x269e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc30)
   include/linux/mtd/map.h:378:(.text+0x27a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc30)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_cmdset_0001':
   drivers/mtd/chips/cfi_cmdset_0001.c:518:(.text+0x2dc6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o:(.xiptext+0xae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1176:(.xiptext+0x15f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1176:(.xiptext+0x17a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1205:(.xiptext+0x217): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1208:(.xiptext+0x23a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1218:(.xiptext+0x2ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1215:(.xiptext+0x2e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.c:1215:(.xiptext+0x2f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1221:(.xiptext+0x304): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   drivers/mtd/chips/cfi_cmdset_0001.c:1221:(.xiptext+0x30e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1236:(.xiptext+0x35b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x377): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0001.c:1238:(.xiptext+0x394): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0001.c:1238:(.xiptext+0x3ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
>> include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x3de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1238:(.xiptext+0x3e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1238:(.xiptext+0x3ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0001.c:1238:(.xiptext+0x3f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.c:1238:(.xiptext+0x400): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1239:(.xiptext+0x41f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0001.c:1242:(.xiptext+0x43a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1236:(.xiptext+0x452): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1267:(.xiptext+0x527): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0001.c:1136:(.xiptext+0x550): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x5a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d44)
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x5b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2104:(.xiptext+0x6e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:2104:(.xiptext+0x6f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1054)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x706): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1970:(.xiptext+0x763): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d44)
   drivers/mtd/chips/cfi_cmdset_0001.c:1970:(.xiptext+0x773): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1971:(.xiptext+0x78f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1975:(.xiptext+0x7ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1979:(.xiptext+0x7f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1990:(.xiptext+0x833): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1994:(.xiptext+0x85b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1998:(.xiptext+0x880): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:2003:(.xiptext+0x894): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2003:(.xiptext+0x8b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2021:(.xiptext+0x998): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xab0)
   drivers/mtd/chips/cfi_cmdset_0001.c:2021:(.xiptext+0x9a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2023:(.xiptext+0x9ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xab0)
   drivers/mtd/chips/cfi_cmdset_0001.c:2023:(.xiptext+0x9d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2040:(.xiptext+0xa44): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:2040:(.xiptext+0xa53): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1054)
   drivers/mtd/chips/cfi_cmdset_0001.c:2040:(.xiptext+0xa6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2133:(.xiptext+0xa9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d44)
   drivers/mtd/chips/cfi_cmdset_0001.c:2134:(.xiptext+0xaae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2138:(.xiptext+0xad3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2142:(.xiptext+0xb0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2142:(.xiptext+0xb30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/chips/cfi_cmdset_0001.c:2145:(.xiptext+0xb6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2169:(.xiptext+0xbc6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xab0)
   drivers/mtd/chips/cfi_cmdset_0001.c:2166:(.xiptext+0xbce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2179:(.xiptext+0xc52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:2179:(.xiptext+0xc5f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_oneword.constprop.10':
   drivers/mtd/chips/cfi_cmdset_0001.c:1569:(.xiptext+0xc72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1580:(.xiptext+0xc80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1054)
   drivers/mtd/chips/cfi_cmdset_0001.c:1580:(.xiptext+0xc96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1596:(.xiptext+0xcf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d44)
   drivers/mtd/chips/cfi_cmdset_0001.c:1603:(.xiptext+0xd58): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1607:(.xiptext+0xd7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:1614:(.xiptext+0xd8f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1615:(.xiptext+0xdaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1623:(.xiptext+0xe3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xab0)
   drivers/mtd/chips/cfi_cmdset_0001.c:1625:(.xiptext+0xe46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1641:(.xiptext+0xefe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x200)
   drivers/mtd/chips/cfi_cmdset_0001.c:1641:(.xiptext+0xf50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1727:(.xiptext+0xf63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1737:(.xiptext+0xf7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1744:(.xiptext+0xf8b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1054)
   drivers/mtd/chips/cfi_cmdset_0001.c:1736:(.xiptext+0xfa2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1751:(.xiptext+0x1008): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d44)
   drivers/mtd/chips/cfi_cmdset_0001.c:1754:(.xiptext+0x102b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1758:(.xiptext+0x105e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1759:(.xiptext+0x108a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d44)
   drivers/mtd/chips/cfi_cmdset_0001.c:1765:(.xiptext+0x1098): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1766:(.xiptext+0x10b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1774:(.xiptext+0x111a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1775:(.xiptext+0x1140): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1778:(.xiptext+0x115a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1789:(.xiptext+0x11ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   include/linux/mtd/map.h:360:(.xiptext+0x1338): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0001.c:1830:(.xiptext+0x1370): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1844:(.xiptext+0x13ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1847:(.xiptext+0x13cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.c:1851:(.xiptext+0x13df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1852:(.xiptext+0x13f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1869:(.xiptext+0x1496): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xab0)
   drivers/mtd/chips/cfi_cmdset_0001.c:1861:(.xiptext+0x149e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_to':
   include/linux/mtd/map.h:440:(.xiptext+0xf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_toio
   drivers/mtd/maps/map_funcs.o: in function `simple_map_write':
   include/linux/mtd/map.h:426:(.xiptext+0xae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `simple_map_read':
   include/linux/mtd/map.h:406:(.xiptext+0x168): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `simple_map_copy_from':
   include/linux/mtd/map.h:433:(.xiptext+0x1a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   include/linux/mtd/map.h:435:(.xiptext+0x1b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy_fromio


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
