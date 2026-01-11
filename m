Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F2D125A0
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 06:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768112272; cv=none; b=afzcL3+StTv1Dx0jHk8ySQ1hktjL0v8Jyg0qzK1vC1mTjKcMwvC2f8HpelZpOoRP735rmbN1fEpE6i+KhiAPcZ0Toag7A7f/GdaX+dkZX9dg0DPXM6CsswmQdB4Tv42bT9Pi/RF2KRWN9jp4e0VKrkMHjKex9EUYiFby7xAerpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768112272; c=relaxed/simple;
	bh=1fnu7V+BXCQ5+PXz6jJIGyGoM2XX271Hr/qnIuLO2hQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZCHsDDEFF2NWNS3NU9mZZ2EpGrFmUr2pqLLLkvNztA1x9G7ZkiT7P9azROR7O4CY16IwP2LU6qA7x1qsJvF2ykE+F9b3cI8l1oTSmS81tqlZrEDrGNw0ndBCbC8ICgU+4cLqBofesKtZd9M3p7M+q8SFtEVFs2Wccuq5QIWsB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DL232m3v; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DL232m3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768112270; x=1799648270;
  h=date:from:to:cc:subject:message-id;
  bh=1fnu7V+BXCQ5+PXz6jJIGyGoM2XX271Hr/qnIuLO2hQ=;
  b=DL232m3v8UnsZ7vCEHmg41M4botcNyz/ocI/gPfZ/Uf9SQXA0HKiaOXy
   TIJZ8osiSUACQ08StmT5VlfX6swzAmwagd5Pkf46fhVTedRFCPEEYhANS
   MxEL6KGGQwOh3lU4zl+0fPmXfxSx6VXUgFySKKLBJ+EV7E4xUiC3/yKmX
   Inh1hSQKUGbIMYWev9cHCbKuCc5Cv8/Db6FckTACJ0o+z16oqlsfJqy7d
   CunUt5tOoxUgrYRPN7DnzRs6add8EFybQ4obS4KgBJbXyxSvE9THGp7HI
   hTJCyS26UAo9XbZGs2CBR0sUUFLrbroo2GqCTQ3SVRAtPtKAo+yRiVQp0
   g==;
X-CSE-ConnectionGUID: iwOwg7Y3TIu6K0GhWi5JSw==
X-CSE-MsgGUID: Xlg47smWTQCyixRVZMXV/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="94901424"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="94901424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 22:17:50 -0800
X-CSE-ConnectionGUID: VgozLa+JTf2CGWzD2VSWIQ==
X-CSE-MsgGUID: sKd7n9EzQIiGc7JbAWPBTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="208296018"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jan 2026 22:17:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veolm-000000009gb-2y6d;
	Sun, 11 Jan 2026 06:17:46 +0000
Date: Sun, 11 Jan 2026 14:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_probe.c:(.xiptext+0xa8): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: ftrace_likely_update
Message-ID: <202601111502.M5dRkRiK-lkp@intel.com>
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
TO: Gopi Krishna Menon <krishnagopi487@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   755bc1335e3b116b702205b72eb57b7b8aef2bb2
commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747 mtd: cfi: use struct_size() helper for cfiq allocation
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: xtensa-randconfig-r072-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111502.M5dRkRiK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111502.M5dRkRiK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601111502.M5dRkRiK-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: DWARF error: could not find abbrev number 849441
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c)
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x8d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
>> cfi_probe.c:(.xiptext+0xa8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0xb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0xc8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0xd7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_probe.c:(.xiptext+0xe7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_probe.c:(.xiptext+0xfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x126): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c)
   cfi_probe.c:(.xiptext+0x14a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x167): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x184): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x1a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x1bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x1dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x276): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x28c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x94)
   cfi_probe.c:(.xiptext+0x2ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x94)
   cfi_probe.c:(.xiptext+0x2ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c)
   cfi_probe.c:(.xiptext+0x2fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c)
   cfi_probe.c:(.xiptext+0x321): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x372): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x392): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_probe.c:(.xiptext+0x3be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x3d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x400): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x480): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x492): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x4c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x4d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x52d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x54a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   xtensa-linux-ld: DWARF error: could not find abbrev number 12735
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0xe07): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0xe3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0xf1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0xf2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x12ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x187a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x192e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   cfi_cmdset_0002.c:(.text+0x1e1f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x1e38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x21dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x844)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x23ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x844)
   cfi_cmdset_0002.c:(.text+0x2442): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x844)
   cfi_cmdset_0002.c:(.text+0x257a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x844)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x271a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x89c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x2848): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x2876): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x198)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x2a58): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x2a86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x198)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x2daf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xb50)
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0xa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0x18): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   cfi_cmdset_0002.c:(.xiptext+0x2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   cfi_cmdset_0002.c:(.xiptext+0xc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0xda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   cfi_cmdset_0002.c:(.xiptext+0xee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x103): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x12b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   cfi_cmdset_0002.c:(.xiptext+0x148): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x19e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x1b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x207): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x252): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x268): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x28b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x29b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x2aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x2c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x2e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x2eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x2f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x2fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x308): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x324): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x343): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xd00)
   cfi_cmdset_0002.c:(.xiptext+0x3b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x3cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x3da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
