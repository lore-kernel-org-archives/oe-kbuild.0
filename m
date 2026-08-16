Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898B233E346
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 02:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786848519; cv=none; b=NS0jLCATx1iIqb6xG55W8C8v6ngs7pAB2hpX+I/wj19r0gWlT6Y9s/nibA2ohAWj+XOC65kr6u7j/9lQxWHEFJyGQJgvnxgeSYSH1ktbP8HDD0ModtB5p3IrlsxCXeGKuDjx7qhxYfYtSNgcwLwl/HPm/UyZXuS8B9ByBDpu6qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786848519; c=relaxed/simple;
	bh=dqNXZ4Q2InMbYvs8X5YI765Y1Pt7f4DQI/4WDv+jgjE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tFRY3sH9vHf8RSoQEL61tdXMtxgVBUJy4E89VNRee8ZxdcLAGwiceMqdo6ZJZTm1CeGntMfriKf8ftmV2QLbc8r+7+aqyD4Ee0y84FBC8co74da33dQ/YktN3CGuwTjaaDAOgqVKFd9sc3lrbZcJk2PTBz2RZzgztXL/91hMceQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoZbDa3K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoZbDa3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786848518; x=1818384518;
  h=date:from:to:cc:subject:message-id;
  bh=dqNXZ4Q2InMbYvs8X5YI765Y1Pt7f4DQI/4WDv+jgjE=;
  b=QoZbDa3Kqn8QhsNZ6WVpNpqm3WVWFCx1Ls14g2ONkohb3w3pwMVZGl2w
   5MPOwZgHi0Cu6mL78t1uZhbUVhrRyyHKd3Guf5odVSQ8ZUyNtrdZ6MvkI
   kAOjOKbWDLXTWLJD1HcJRgVwt89prXyqunXHHzyB501o/d2LrACAsftPi
   Wlhx1QdOMfA5eiA4FgP5TolZWt3mif4WrsQzVfktg30TAL5VSPTGiZXdk
   bLRC9cFq4DzQp6LvQd76ldhBB8N7lduoY0NExFinTD4biCW+c1kcnh9Og
   v05PNDkce/6ED4XGuK+aPfInnXXPXt+6qH/tsWIimmZsr13Cz++wZ07le
   Q==;
X-CSE-ConnectionGUID: 1hthNcKpQOCmMBrffv9jsQ==
X-CSE-MsgGUID: wnkR6UppSoCaTeNXlZgEnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87290284"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87290284"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 19:48:37 -0700
X-CSE-ConnectionGUID: 4YQYJ911QMOSGlAen98FQQ==
X-CSE-MsgGUID: A01vyMZjRoCwolcbX0W5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="260345788"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Aug 2026 19:48:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvQvJ-00000000chi-1JlZ;
	Sun, 16 Aug 2026 02:48:33 +0000
Date: Sun, 16 Aug 2026 10:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_probe.c:(.xiptext+0xdf): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: ftrace_likely_update
Message-ID: <202608161044.BzPdnZzG-lkp@intel.com>
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

Hi Gopi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747 mtd: cfi: use struct_size() helper for cfiq allocation
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: xtensa-randconfig-001-20260816 (https://download.01.org/0day-ci/archive/20260816/202608161044.BzPdnZzG-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161044.BzPdnZzG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d496b6f42eb0 ("mtd: cfi: use struct_size() helper for cfiq allocation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608161044.BzPdnZzG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1424:(.exception.text+0x243): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   xtensa-linux-ld: DWARF error: could not find abbrev number 305191
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5c)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   cfi_probe.c:(.xiptext+0xac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
>> cfi_probe.c:(.xiptext+0xdf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0xf7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0x10e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0x137): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_probe.c:(.xiptext+0x14c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_probe.c:(.xiptext+0x15b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_probe.c:(.xiptext+0x176): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x1ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5c)
   cfi_probe.c:(.xiptext+0x330): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x346): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x35c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x372): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x37c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb0)
   cfi_probe.c:(.xiptext+0x388): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb0)
   cfi_probe.c:(.xiptext+0x3b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5c)
   cfi_probe.c:(.xiptext+0x3bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5c)
   cfi_probe.c:(.xiptext+0x3f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x466): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_probe.c:(.xiptext+0x4b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x598): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x5dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x63d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   xtensa-linux-ld: DWARF error: could not find abbrev number 1386042
   drivers/mtd/chips/cfi_util.o:(.xiptext+0x1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   cfi_util.c:(.xiptext+0x34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x43): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x1e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_util.c:(.xiptext+0x1fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x20f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   cfi_util.c:(.xiptext+0x23e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x253): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x268): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x298): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x30b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x320): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x358): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x36e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x384): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x39a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x3d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_util.c:(.xiptext+0x3ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x3ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   cfi_util.c:(.xiptext+0x43b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x466): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_util.c:(.xiptext+0x4a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   cfi_util.c:(.xiptext+0x4d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_util.c:(.xiptext+0x574): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   xtensa-linux-ld: DWARF error: could not find abbrev number 87
   drivers/mtd/chips/cfi_cmdset_0020.o: in function `cfi_cmdset_0020':
   cfi_cmdset_0020.c:(.text+0x30c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   xtensa-linux-ld: DWARF error: could not find abbrev number 45
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x1192): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   cfi_cmdset_0002.c:(.text+0x1286): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   cfi_cmdset_0002.c:(.text+0x189a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x18b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x2072): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   cfi_cmdset_0002.c:(.text+0x20ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x318)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x2582): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   cfi_cmdset_0002.c:(.text+0x25c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x318)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0x27c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   cfi_cmdset_0002.c:(.text+0x281a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0x29ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   cfi_cmdset_0002.c:(.text+0x29ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x2fe7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x34ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x9bc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x35a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x108c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x37d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x108c)
   cfi_cmdset_0002.c:(.text+0x38be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x108c)
   cfi_cmdset_0002.c:(.text+0x3a1f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x108c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x3c1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x148c)
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0x2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2c)
   cfi_cmdset_0002.c:(.xiptext+0x4b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   cfi_cmdset_0002.c:(.xiptext+0x20e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x226): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   cfi_cmdset_0002.c:(.xiptext+0x23a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
