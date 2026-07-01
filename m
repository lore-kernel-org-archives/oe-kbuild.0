Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB653BA222
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jul 2026 12:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908931; cv=none; b=vDei/RC2G+xAKCvty6xQlDoKO4Jt9wwoQ6VYftzG+sKOjrNFRNBfVa0TISYeOguf/ENbO0d1WvLFku9i8wwFsL35TZzGyBKXw56KraWsTAub+aNScJiTZFoBhJw3bg9pTJ4gL6FKxYVIAgvctrOE4ZO2u9oteMi+l2FVuiL2OlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908931; c=relaxed/simple;
	bh=mTslVzUonHbHFb95ANCuN0y49SELhV5Hb6UtK8b9a8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ETiYBolVbjRAQe1z4KXkJwMyZOziuTIFBLDEFg5bR0OZ1ce2I9hEeZH3mNs5jr9cwebz/btgBnQUNzT7pStIPgw1Jyi3x4Jo8fMr0aj1nlMP3YxZwd4fgYpeVat5mraVlxKIEnIrQN4iM6pdSciPzpRigY6UDxrE4HrxFNbCeRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZcznWGc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZcznWGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782908928; x=1814444928;
  h=date:from:to:cc:subject:message-id;
  bh=mTslVzUonHbHFb95ANCuN0y49SELhV5Hb6UtK8b9a8k=;
  b=JZcznWGcx7fn49tDH5ZcDl4yzQZWofsK1Oy1AtzglDV9zAuMFfz2zhyq
   HWRMlIL1OPumPouIKRE/SsYlGLX/oG3tAD74y04AyQW3pA9sGBzwOcwsA
   HL5lBqh6TqArCJ+UmCrWrniBY5ufJdVYar0MQWIH9MqRC+W+MLl4lBnIG
   n9VoMhIgdTQs33FhFHxxXBTH7v+kxVqmS5I/wlHKMzSdPn9a5wYS9vADM
   BtkDIGxXO540Xw1ygQxjkm9Vky/o6z08uHmURowo8JFe9wuu/wJ7d6OBQ
   9aMnjP69F7b6utH0CX4SwJc1ULxV2Pa3DOU8c5MsT20mlfFTmwMCL35PC
   w==;
X-CSE-ConnectionGUID: PmeqaraLTOqCo+SwUAZegw==
X-CSE-MsgGUID: o8hqP1KuR+6+YlK59oO1xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94239722"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94239722"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:28:48 -0700
X-CSE-ConnectionGUID: kJzMFGtJQC+w9v0F4ncYRw==
X-CSE-MsgGUID: /TWUIfigSAWhrieUXFxQJw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jul 2026 05:28:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weu25-000000009Gm-16q9;
	Wed, 01 Jul 2026 12:28:35 +0000
Date: Wed, 01 Jul 2026 20:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_cmdset_0002.c:(.xiptext+0x6d2): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail: dump_stack
Message-ID: <202607012018.Ft9ON0mx-lkp@intel.com>
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
TO: Ye Bin <yebin10@huawei.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Ye,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   665159e246749578d4e4bfe106ee3b74edcdab18
commit: 6c2e6e2c1af1809d1d9cdbd50ac80f54f5995bdb dynamic_debug: add support for print stack
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: xtensa-randconfig-001-20260701 (https://download.01.org/0day-ci/archive/20260701/202607012018.Ft9ON0mx-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607012018.Ft9ON0mx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c2e6e2c1af1 ("dynamic_debug: add support for print stack")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607012018.Ft9ON0mx-lkp@intel.com/

All errors (new ones prefixed by >>):

   cfi_probe.c:(.xiptext+0x327): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30)
   cfi_probe.c:(.xiptext+0x336): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30)
   cfi_probe.c:(.xiptext+0x359): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x3aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x430): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x447): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x474): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x4f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x506): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x538): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x54a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x5a1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x5be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0xd57): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0xd8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0xf06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0xf17): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x1347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x186b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0x191a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk.isra.13':
   cfi_cmdset_0002.c:(.text+0x1e67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x1e7f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x21ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x7fc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x2356): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x7fc)
   cfi_cmdset_0002.c:(.text+0x23b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x7fc)
   cfi_cmdset_0002.c:(.text+0x24be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x7fc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x2646): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8f4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x2768): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0x2793): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x50)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x29da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x254)
   cfi_cmdset_0002.c:(.text+0x2a06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x50)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x2d32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbd4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x117): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x137): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x152): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x15a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x160): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x16c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x174): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x18c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x1a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8a0)
   cfi_cmdset_0002.c:(.xiptext+0x20f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x228): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x236): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x23c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready.isra.7':
   cfi_cmdset_0002.c:(.xiptext+0x25e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_cmdset_0002.c:(.xiptext+0x270): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x28b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset.isra.8':
   cfi_cmdset_0002.c:(.xiptext+0x318): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x32c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x342): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x390): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x3aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x3ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x3e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x3ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x3f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x3fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x40b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x432): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x450): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbd0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable.isra.16':
   cfi_cmdset_0002.c:(.xiptext+0x492): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x4b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0x51a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x52e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x543): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x576): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x596): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x5b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x5bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x5c5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x5d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x5df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x60e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x61a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x16e0)
   cfi_cmdset_0002.c:(.xiptext+0x638): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbd0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0x6b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x6c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
>> cfi_cmdset_0002.c:(.xiptext+0x6d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0x6f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x16e0)
   cfi_cmdset_0002.c:(.xiptext+0x71c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x758): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x768): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1810)
   cfi_cmdset_0002.c:(.xiptext+0x776): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x78f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x954)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x7b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x9bc)
   cfi_cmdset_0002.c:(.xiptext+0x7ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1734)
   cfi_cmdset_0002.c:(.xiptext+0x7d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   cfi_cmdset_0002.c:(.xiptext+0x818): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x82f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x83b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0x908): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x938): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x946): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1810)
   cfi_cmdset_0002.c:(.xiptext+0x968): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x97e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x98a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0x9ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x16e0)
   cfi_cmdset_0002.c:(.xiptext+0x9c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0xa9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xaa6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xaac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xaba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xac2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xafa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbd0)
   cfi_cmdset_0002.c:(.xiptext+0xb1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xb3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1734)
   cfi_cmdset_0002.c:(.xiptext+0xb80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   cfi_cmdset_0002.c:(.xiptext+0xbec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xbfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1810)
   cfi_cmdset_0002.c:(.xiptext+0xc0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcac)
   cfi_cmdset_0002.c:(.xiptext+0xc2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0xc42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xc4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xc70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x16e0)
   cfi_cmdset_0002.c:(.xiptext+0xc88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xcab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xccf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xce6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xcac)
   cfi_cmdset_0002.c:(.xiptext+0xd18): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd6c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1734)
   cfi_cmdset_0002.c:(.xiptext+0xd74): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   cfi_cmdset_0002.c:(.xiptext+0xe10): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0xe42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xe50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1810)
   cfi_cmdset_0002.c:(.xiptext+0xe73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0xe8b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xe9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xebc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x16e0)
   cfi_cmdset_0002.c:(.xiptext+0xede): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xef2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xf07): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xf1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xf30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xf8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0xfa6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xfae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xfb4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xfc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xfca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x1000): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbd0)
   cfi_cmdset_0002.c:(.xiptext+0x101c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x103e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1076): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1734)
   cfi_cmdset_0002.c:(.xiptext+0x1080): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_otp_walk.isra.15':
   cfi_cmdset_0001.c:(.text+0x1322): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x3d8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_lock':
   cfi_cmdset_0001.c:(.text+0x15cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_write':
   cfi_cmdset_0001.c:(.text+0x161a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   cfi_cmdset_0001.c:(.text+0x16da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c8)
   cfi_cmdset_0001.c:(.text+0x1788): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c8)
   cfi_cmdset_0001.c:(.text+0x17fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_cmdset_0001':
   cfi_cmdset_0001.c:(.text+0x1a26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_writev':
   cfi_cmdset_0001.c:(.text+0x2420): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xb50)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   cfi_cmdset_0001.c:(.xiptext+0x72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xd7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x140): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x156): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
