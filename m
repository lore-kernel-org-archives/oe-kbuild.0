Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316173;
	b=gBaDheFHfiJFaaqZO2d2BhF2R+OddbJUvae0Pc8moJc64doBCtGkP4Gwcpe19c5kRi+T
	 zA2IBDCV3U5wgGcqfEuY+k3J5khhqPSkpy45SpxK08/jgZL8wpexhssD3KAPoTb5U3jUl
	 rvYX5Zs6BhG7aMh0doRoYCUHHizIIcfkUZJGMlGT0aEXedfZwspUKi2k7Z3MVkB20S29x
	 cnHiCYDWU9tqtHThybBzvcC890t8FIH+HUk7o/tB8ayrysR9vy8NLRkCMZRizYw5iNPS6
	 64nI4WMf8zwlKRQBE3wb/8vgWA1+VHM3Vcv3X55FcAEb17QJAM/EoA7DXYLowJXkKKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316173;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rJCWBq7S2yfDcNGAnnfqZHU0gL88KcstQjBdMqp/OXw=;
	b=MtoF/5GNGD1kuS+RWYeCORQIMwD/6SFngVL+L9CkrEHQEf/S3XAAxTAXtJHWVSKomIUi
	 A9dSlSXvnPf43DHyne51gnrHd1TehxjE3VdMpW++Eto89LqGtu0+SpYvICFuy0ubzKu39
	 5OreuSZGDQHCINJ6ggnZABc98ftmBEI/GFHmlMwJVNBnDoKruHcDyrtSb/bqHBW/aq4vI
	 yijPNmmzjNZ+hTvwQuo5GCVglqEm5UZvQF0DTYoTC37fC6/gwttWPtml60wxVDhHImX6J
	 TveTyImxY+CAXoC1K6EpTaeWWq1pKwYy9rNTe9lXPINV9ajesN2ayz20miGLrWxypAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BpmtxeC9;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA6D606A32C
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 02:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA6D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BpmtxeC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795316173; x=1826852173;
  h=date:from:to:cc:subject:message-id;
  bh=KFNGwUCtNe+HqAbOY6j3ojwAqE1eM1mbguW59O2cvP0=;
  b=BpmtxeC9c5Q3qqlH1xiFFQkjnxNDC3aTItPUdo0MV5nYWD1E/m7uinVR
   /sgAUIGXjqfox/GZ441Gy+bcp2CVzwfg2YLILzNnXlpFWsBFfAThd0jxp
   BV31MuntQ3m9rxLtsBOTh2++94dCtkeuejLqqJDX5rcavrfOKTTnVnJ13
   KVMFUSUGRZdyzqbrSLDcZtPwTtA7g68u20CqEgXvEmVe3H8NctKMqCrBa
   JAAgXV7Z4VF8nxLd6nEQ7NvS6xpUKyNQ0JeeEbBW0/x3ywFEuAOzo8lTJ
   9XJiRbZQWGdS/XBovJ8p9KWI4VuL0AvJMrrVKkXUs9D8LaUQC5WToWGb6
   A==;
X-CSE-ConnectionGUID: BEOWAUGQSQSXjmSSm9j68Q==
X-CSE-MsgGUID: 8fuguADCQ0SUNvqMol+NLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4050238"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4050238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 18:56:11 -0800
X-CSE-ConnectionGUID: alA/YR4KQFmElH4VbDMvSw==
X-CSE-MsgGUID: O9deUHU8SQe0/PcaNJOecA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11090733"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2026 18:56:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUxkM-000000004Tf-47Ig;
	Sun, 22 Nov 2026 02:56:06 +0000
Date: Sun, 22 Nov 2026 03:56:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_cmdset_0002.c:(.xiptext+0xa1e): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail: dump_stack
Message-ID: <20261122034752.1ZRq278e-lkp@intel.com>
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
head:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
commit: 6c2e6e2c1af1809d1d9cdbd50ac80f54f5995bdb dynamic_debug: add support for print stack
date:   1 year ago
:::::: branch date: 86 minutes ago
:::::: commit date: 1 year ago
config: xtensa-randconfig-r2311-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122034752.1ZRq278e-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122034752.1ZRq278e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c2e6e2c1af1 ("dynamic_debug: add support for print stack")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122034752.1ZRq278e-lkp@intel.com/

All errors (new ones prefixed by >>):

   cfi_probe.c:(.xiptext+0x3f9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x447): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x49a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x4b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x4cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x4f9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x58c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x59e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x5cd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x5df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x635): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x652): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   xtensa-linux-ld: DWARF error: could not find abbrev number 1726898040
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0xe2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0xf00): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x18fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x192a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x2c0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x1a27): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x954)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x1c57): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0x20af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x20ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0x22d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x22ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x2b92): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xfc4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   cfi_cmdset_0002.c:(.text+0x3206): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x327c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x38ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xfc4)
   cfi_cmdset_0002.c:(.text+0x3987): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xfc4)
   cfi_cmdset_0002.c:(.text+0x3b36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xfc4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x3c38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13f8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x3ea6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x3ed0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x2c0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0x2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   cfi_cmdset_0002.c:(.xiptext+0x1a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   cfi_cmdset_0002.c:(.xiptext+0x21e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x251): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x2da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x3ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x44e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x462): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x46a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x470): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x47a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x484): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x49f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x4b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbc4)
   cfi_cmdset_0002.c:(.xiptext+0x580): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5b5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x5c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x5d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   cfi_cmdset_0002.c:(.xiptext+0x5da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   cfi_cmdset_0002.c:(.xiptext+0x5e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x66c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x6af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x6ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x6d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x6dd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x6e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x6fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x722): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x742): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x9a0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x7a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x7b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xdc4)
   cfi_cmdset_0002.c:(.xiptext+0x7be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x7e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x80b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x877): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x88b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xccc)
   cfi_cmdset_0002.c:(.xiptext+0x8e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0x9e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x9f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xdc4)
   cfi_cmdset_0002.c:(.xiptext+0xa12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
>> cfi_cmdset_0002.c:(.xiptext+0xa1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xa42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x19c4)
   cfi_cmdset_0002.c:(.xiptext+0xa62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa7b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xaab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xac2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xadb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0xb58): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xb60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xb66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xb72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xb7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xbb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x9a0)
   cfi_cmdset_0002.c:(.xiptext+0xbd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xbfc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xccc)
   cfi_cmdset_0002.c:(.xiptext+0xc62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xd0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0xd33): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0xdba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xdc7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xdcd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xdd8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xdee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xe23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xe2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x19c4)
   cfi_cmdset_0002.c:(.xiptext+0xe4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x9a0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0xeea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xef9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xf1f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x19c4)
   cfi_cmdset_0002.c:(.xiptext+0xf63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xfeb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xff7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   cfi_cmdset_0002.c:(.xiptext+0x111e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x112c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xdc4)
   cfi_cmdset_0002.c:(.xiptext+0x114f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x115e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0x1183): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x19c4)
   cfi_cmdset_0002.c:(.xiptext+0x11a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x11bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x11db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x11f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x120c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x127f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x129a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x12a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x12a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x12b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x12be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x12f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x9a0)
   cfi_cmdset_0002.c:(.xiptext+0x1316): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x133c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x139a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xccc)
   cfi_cmdset_0002.c:(.xiptext+0x13a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x141e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x142e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xdc4)
   cfi_cmdset_0002.c:(.xiptext+0x145c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x1465): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   cfi_cmdset_0002.c:(.xiptext+0x14a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x14b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0x14d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x19c4)
   cfi_cmdset_0002.c:(.xiptext+0x14f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1513): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1522): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1557): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x159f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0x15fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1687): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xccc)
   cfi_cmdset_0002.c:(.xiptext+0x1692): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1423:(.exception.text+0x27b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   xtensa-linux-ld: DWARF error: could not find abbrev number 115
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   cfi_util.c:(.xiptext+0x1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   cfi_util.c:(.xiptext+0x190): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x21c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x233): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x256): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x26e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x283): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x298): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
