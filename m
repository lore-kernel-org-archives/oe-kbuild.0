Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4780D3BE178
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 23:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331292; cv=none; b=i1YjE0xa8E8cl8Yln0n0CdYOA9sEMNKp8ZidLktXjxW98DR8/UMGj+QpS5LaUuj+I3SRz7b8XPPofPTBL4ypbgCQFP9yqvVtNtLgzgwiR3uOsUbbOtooQPbEmywa208odlwYPGK3jqAjILtuGWUy0an0guYptezqaQlacUQtwbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331292; c=relaxed/simple;
	bh=6nvWkoFQ86NURC9PIwPLQZBoCY+k1FbmCvp8xbHvnZ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NrfgRghfVi2IFc7nKqlyScmPro7r6y0Pwx9gRhgzMESwjZnwLody6labdSX3GvcmYnj2NdqpPGvJfZMvAtVNEml2WOqoXbXoKeRmdCVsvsoNqNZazQIXjSFexI+MxjLgjRb5XL/Y2yp8lpJaBT+8inQ6Ec1QS0SquYP6HClW3pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcOl2rdt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcOl2rdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784331285; x=1815867285;
  h=date:from:to:cc:subject:message-id;
  bh=6nvWkoFQ86NURC9PIwPLQZBoCY+k1FbmCvp8xbHvnZ4=;
  b=ZcOl2rdtlYBoyvRumsDh0714DD8WeVRVbR1IwlpBaOIeV4tfTU3CRGd/
   ZVhppQLvmHJU8gjHtpkr3wX/TBCW17038iRZM9jo/hEIdCcS8QbgpH7rA
   WsYQY990mKg3ee2yTXesPglxQmadglEwsLcVS2DNM16ieo3vW2KGXJwj/
   hc+p1b+m0hgzBu1AGSODXKUwfjpyhL1mrwM8h8C1jlnts5cOclejxNOxy
   OBn+V+Kl7S4KbIPqbnujhaf1MS6IkqVSisptI44iDqY9ZgcILEe1lE6eY
   2nZo7yK3OMu0H+aPt0rSjak9CUkAUbdG71mWQ+Ub8rOayVj572PA+vgC7
   A==;
X-CSE-ConnectionGUID: VFXYv/d4ScqaKbyvxXBIyw==
X-CSE-MsgGUID: hXOV0G8eQcSWjZKtOT++Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95655804"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="95655804"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:34:43 -0700
X-CSE-ConnectionGUID: 00YzQGulQZitUHUxWtfkWQ==
X-CSE-MsgGUID: aZOg7f4uSRGcHy7FPfvK9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="260713605"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Jul 2026 16:34:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wks4l-00000000TFH-0uME;
	Fri, 17 Jul 2026 23:34:39 +0000
Date: Sat, 18 Jul 2026 07:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0x879):
 dangerous relocation: windowed longcall crosses 1GB boundary; return may
 fail: __tsan_func_entry
Message-ID: <202607180751.8jMHdJts-lkp@intel.com>
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
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747 mtd: cfi: use struct_size() helper for cfiq allocation
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: xtensa-randconfig-001-20260718 (https://download.01.org/0day-ci/archive/20260718/202607180751.8jMHdJts-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180751.8jMHdJts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d496b6f42eb0 ("mtd: cfi: use struct_size() helper for cfiq allocation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607180751.8jMHdJts-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .init.data VMA [002dc320,0031520b] overlaps section .text VMA [00003000,01d06477]
   `xe_configfs_exit' referenced in section `.rodata' of drivers/gpu/drm/xe/xe_module.o: defined in discarded section `.exit.text' of drivers/gpu/drm/xe/xe_configfs.o
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xc9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xd2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xe0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xf7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x113): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x124): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x17e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x18d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:198:(.xiptext+0x1a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:309:(.xiptext+0x1b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   include/linux/mtd/cfi.h:309:(.xiptext+0x1cd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   include/linux/mtd/cfi.h:311:(.xiptext+0x1d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   include/linux/mtd/cfi.h:314:(.xiptext+0x1e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/cfi.h:314:(.xiptext+0x1f9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x222): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:320:(.xiptext+0x22c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0x242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/asm/irqflags.h:61:(.xiptext+0x254): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x2a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x2c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x2cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:309:(.xiptext+0x2ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0x300): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:312:(.xiptext+0x30f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   include/linux/mtd/cfi.h:314:(.xiptext+0x32f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   include/linux/mtd/cfi.h:320:(.xiptext+0x340): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:320:(.xiptext+0x34f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0x36f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x380): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x38f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x3af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_probe.c:229:(.xiptext+0x3c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:229:(.xiptext+0x3cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_probe.c:229:(.xiptext+0x3e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x400): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x40f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x422): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x43f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:231:(.xiptext+0x44a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_probe.c:231:(.xiptext+0x46f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_probe.c:232:(.xiptext+0x4a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x4c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x4d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x4e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x50c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x522): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x52a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x53f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x547): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x55b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x563): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x578): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x580): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x594): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x5a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x5f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x5ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x612): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x626): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:330:(.xiptext+0x674): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x67e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:336:(.xiptext+0x69a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x6b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:325:(.xiptext+0x6c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:336:(.xiptext+0x714): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:336:(.xiptext+0x72c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x742): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:314:(.xiptext+0x794): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   include/linux/mtd/cfi.h:314:(.xiptext+0x7aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:320:(.xiptext+0x7b9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x7c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x7d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:309:(.xiptext+0x7e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x58)
   include/linux/mtd/cfi.h:311:(.xiptext+0x7ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
>> drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0x879): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x882): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:285:(.xiptext+0x8ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x8db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x8ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x91a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x96b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x97c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   arch/xtensa/include/asm/irqflags.h:47:(.xiptext+0x9a1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:115:(.xiptext+0x9b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x9c5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:127:(.xiptext+0x9ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kcsan_check_access
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   include/asm-generic/bitops/generic-non-atomic.h:128:(.xiptext+0xa19): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:133:(.xiptext+0xa23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_probe.c:136:(.xiptext+0xa3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:139:(.xiptext+0xa4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:152:(.xiptext+0xa5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:221:(.xiptext+0x88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_util.c:222:(.xiptext+0x90): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:222:(.xiptext+0x9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0xac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0xbc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:228:(.xiptext+0xca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:230:(.xiptext+0xd7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:231:(.xiptext+0xf4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:232:(.xiptext+0x10a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:235:(.xiptext+0x13a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_util.c:244:(.xiptext+0x147): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:287:(.xiptext+0x1bd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x1ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x1d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x1f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x1fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x210): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x21e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x248): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x253): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:215:(.xiptext+0x264): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x2a5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x2b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x2bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x2d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x2e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x302): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x30e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x338): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x344): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x35c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x368): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x37b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x387): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:43:(.xiptext+0x3a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x3b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x3db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:252:(.xiptext+0x3e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x3fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x407): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x42b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x437): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x45f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x46b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x47e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:259:(.xiptext+0x48a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x4af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x4bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x4d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:207:(.xiptext+0x4e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x4ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x51a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x526): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x53b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:43:(.xiptext+0x547): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x56c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x578): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:42:(.xiptext+0x5a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:43:(.xiptext+0x5b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x5c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:55:(.xiptext+0x5cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x5f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x5fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x613): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x61f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x62b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:271:(.xiptext+0x656): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x662): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x678): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:275:(.xiptext+0x683): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x69b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x6aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x6ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_exit
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x749): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_func_entry
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x752): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x760): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4


vim +277 drivers/mtd/chips/cfi_probe.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  239  
^1da177e4c3f41 Linus Torvalds   2005-04-16  240  	for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  241  		cfi->cfiq->EraseRegionInfo[i] = le32_to_cpu(cfi->cfiq->EraseRegionInfo[i]);
^1da177e4c3f41 Linus Torvalds   2005-04-16  242  
^1da177e4c3f41 Linus Torvalds   2005-04-16  243  #ifdef DEBUG_CFI
^1da177e4c3f41 Linus Torvalds   2005-04-16  244  		printk("  Erase Region #%d: BlockSize 0x%4.4X bytes, %d blocks\n",
^1da177e4c3f41 Linus Torvalds   2005-04-16  245  		       i, (cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff,
^1da177e4c3f41 Linus Torvalds   2005-04-16  246  		       (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1);
^1da177e4c3f41 Linus Torvalds   2005-04-16  247  #endif
^1da177e4c3f41 Linus Torvalds   2005-04-16  248  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  249  
54b93a49d8dd90 Guillaume LECERF 2010-04-24  250  	if (cfi->cfiq->P_ID == P_ID_SST_OLD) {
54b93a49d8dd90 Guillaume LECERF 2010-04-24  251  		addr_unlock1 = 0x5555;
54b93a49d8dd90 Guillaume LECERF 2010-04-24  252  		addr_unlock2 = 0x2AAA;
54b93a49d8dd90 Guillaume LECERF 2010-04-24  253  	}
54b93a49d8dd90 Guillaume LECERF 2010-04-24  254  
8473044d644553 Guillaume LECERF 2010-04-24  255  	/*
8473044d644553 Guillaume LECERF 2010-04-24  256  	 * Note we put the device back into Read Mode BEFORE going into Auto
8473044d644553 Guillaume LECERF 2010-04-24  257  	 * Select Mode, as some devices support nesting of modes, others
8473044d644553 Guillaume LECERF 2010-04-24  258  	 * don't. This way should always work.
8473044d644553 Guillaume LECERF 2010-04-24  259  	 * On cmdset 0001 the writes of 0xaa and 0x55 are not needed, and
8473044d644553 Guillaume LECERF 2010-04-24  260  	 * so should be treated as nops or illegal (and so put the device
8473044d644553 Guillaume LECERF 2010-04-24  261  	 * back into Read Mode, which is a nop in this case).
8473044d644553 Guillaume LECERF 2010-04-24  262  	 */
8473044d644553 Guillaume LECERF 2010-04-24  263  	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
ad7026fef6c771 Guillaume LECERF 2010-04-24  264  	cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
ad7026fef6c771 Guillaume LECERF 2010-04-24  265  	cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type, NULL);
ad7026fef6c771 Guillaume LECERF 2010-04-24  266  	cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
8473044d644553 Guillaume LECERF 2010-04-24  267  	cfi->mfr = cfi_read_query16(map, base);
8473044d644553 Guillaume LECERF 2010-04-24  268  	cfi->id = cfi_read_query16(map, base + ofs_factor);
8473044d644553 Guillaume LECERF 2010-04-24  269  
8473044d644553 Guillaume LECERF 2010-04-24  270  	/* Get AMD/Spansion extended JEDEC ID */
8473044d644553 Guillaume LECERF 2010-04-24  271  	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
8473044d644553 Guillaume LECERF 2010-04-24  272  		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
8473044d644553 Guillaume LECERF 2010-04-24  273  			  cfi_read_query(map, base + 0xf * ofs_factor);
8473044d644553 Guillaume LECERF 2010-04-24  274  
8473044d644553 Guillaume LECERF 2010-04-24  275  	/* Put it back into Read Mode */
8473044d644553 Guillaume LECERF 2010-04-24  276  	cfi_qry_mode_off(base, map, cfi);
8473044d644553 Guillaume LECERF 2010-04-24 @277  	xip_allowed(base, map);
8473044d644553 Guillaume LECERF 2010-04-24  278  
b1c97e2335f24d Aaron Sierra     2018-04-30  279  	cfi_early_fixup(cfi, cfi_early_fixup_table);
b1c97e2335f24d Aaron Sierra     2018-04-30  280  
771a115a6df06c Guillaume LECERF 2010-06-29  281  	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank. Manufacturer ID %#08x Chip ID %#08x\n",
^1da177e4c3f41 Linus Torvalds   2005-04-16  282  	       map->name, cfi->interleave, cfi->device_type*8, base,
771a115a6df06c Guillaume LECERF 2010-06-29  283  	       map->bankwidth*8, cfi->mfr, cfi->id);
^1da177e4c3f41 Linus Torvalds   2005-04-16  284  
^1da177e4c3f41 Linus Torvalds   2005-04-16  285  	return 1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  286  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  287  

:::::: The code at line 277 was first introduced by commit
:::::: 8473044d644553ca3c939249490d1c5ef5f6d4e6 mtd: cfi_probe: enter Auto Select Mode after filling cfi->cfiq members

:::::: TO: Guillaume LECERF <glecerf@gmail.com>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
