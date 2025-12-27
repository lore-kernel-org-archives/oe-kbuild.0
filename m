Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A15245C0B
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 04:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766810523; cv=none; b=jgsvf3VagJie8JRb0uA8AQqnLjZFDSMoSZ5uuOqSgRjxERdu+Jm84Fyldo32uZ3n+/N+G+IoDMtHGZNKxdtWpo2T3wctPVEypZJq8Ea8+We1R35WMcC6bAx2ALZUXrK4JcBaZa3R2gjIaR09u/ufb0ZtPLzaBfJzkPwSvIPImWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766810523; c=relaxed/simple;
	bh=oZ6wSoPRcJDcti79yPK5xgiN8XRk0mk6AUGV5mzwvPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nnaCTyvE7BD/J/GdOC1tX5fvAQFBPHQX83XoRvGIwbCV50A/YfoDeuzUcudpABH0RFofcLAfrNNNl342n+gsS6iKduyhWkajq2Ll+FasVmRbwjPvMxHQZDu1GcXJdpK7tVrtT23SD7H6PzXl6HjLOoQU/U5nJ4M34nxoaFqtQJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDyExZ6k; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDyExZ6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766810520; x=1798346520;
  h=date:from:to:cc:subject:message-id;
  bh=oZ6wSoPRcJDcti79yPK5xgiN8XRk0mk6AUGV5mzwvPc=;
  b=jDyExZ6k0nrMxZAIfbL0MAK3cxPfSIPIgwvEKRYPNTAZtobNluVQpWoK
   cccjoM9i0AgDy55tVt4xhOLTy1iirEIuTUT/qIbBh8LGRiSfoQR3iMBrF
   ycTrB+VKSK0Rh24we1jC9BFnzAgMCw/CYHjb0ZpG+xY0CTNNtPFvGNN8T
   Jks6D824LM/PmbrD5fdlvu1ZELnKdT3rx8OhriLCUMUuLbmV0dawwIG49
   NINiQB8a9uyB1x8goDrQePspLhhiUDKgKOtvWQVzNg7r5I//IYvRYVqXZ
   9Bmr4tbJTgGpIdYj/YmPdwuj32l/TcMS/+/SRVWtJFybLJtARzLHmkYPt
   A==;
X-CSE-ConnectionGUID: TMCW0pIrRjyAdUw/a3uwvg==
X-CSE-MsgGUID: Xb1FDjQIQUy9v6MTi3C13A==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68607711"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68607711"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 20:41:59 -0800
X-CSE-ConnectionGUID: Yt+0caFSQYCZ2D869Isozg==
X-CSE-MsgGUID: N+OjoG0FQsi2bXs5/ybY2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="199633134"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Dec 2025 20:41:58 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZM7l-000000005YM-02Ho;
	Sat, 27 Dec 2025 04:41:53 +0000
Date: Sat, 27 Dec 2025 12:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/slab.h:909:(.xiptext+0x2e5): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 __sanitizer_cov_trace_pc
Message-ID: <202512271211.6KKtUWoC-lkp@intel.com>
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
head:   04688d6128b7c8b4ccec2913e7f2ff1c4437da96
commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747 mtd: cfi: use struct_size() helper for cfiq allocation
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: xtensa-randconfig-r133-20251226 (https://download.01.org/0day-ci/archive/20251227/202512271211.6KKtUWoC-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271211.6KKtUWoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512271211.6KKtUWoC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x98): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0xa7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0xb0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0xba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0xc8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0xd3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0xdc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0xe6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0xfe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x10c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x116): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x124): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x130): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x138): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x143): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x14c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x167): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x170): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:198:(.xiptext+0x18d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:200:(.xiptext+0x19a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:309:(.xiptext+0x1a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:311:(.xiptext+0x1ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   include/linux/mtd/cfi.h:313:(.xiptext+0x1c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:313:(.xiptext+0x1d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   include/linux/mtd/cfi.h:314:(.xiptext+0x1e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/cfi.h:314:(.xiptext+0x1f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   include/linux/mtd/cfi.h:314:(.xiptext+0x207): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0x210): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x216): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   include/linux/mtd/cfi.h:314:(.xiptext+0x21c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x23c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x25f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0x270): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x27f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x28a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x296): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0x2a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0x2af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0x2b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0x2c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:208:(.xiptext+0x2d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `kmalloc_noprof':
>> include/linux/slab.h:909:(.xiptext+0x2e5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/slab.h:909:(.xiptext+0x2ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x2fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x308): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x310): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x31b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x324): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x33f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x348): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x35a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x36e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:320:(.xiptext+0x44f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   include/linux/mtd/cfi.h:320:(.xiptext+0x45c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
>> arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x4bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x4c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
>> arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x4df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x4f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x50e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:231:(.xiptext+0x523): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:231:(.xiptext+0x537): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x54c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:232:(.xiptext+0x556): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1c)
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x562): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1c)
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x572): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x57b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x58c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x595): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x5a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12c)
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x5b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12c)
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x5c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x5df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x5f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x5fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x607): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x617): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_probe.c:202:(.xiptext+0x622): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x62f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x638): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x646): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x651): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x65f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x66a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x68b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x693): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x6af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x6be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x6c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x6d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x6e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:273:(.xiptext+0x6ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x6f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:276:(.xiptext+0x706): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0x711): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `arch_local_irq_enable':
>> arch/xtensa/include/asm/irqflags.h:61:(.xiptext+0x724): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_early_fixup':
   drivers/mtd/chips/cfi_probe.c:83:(.xiptext+0x72d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x733): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x739): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x751): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x75b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:85:(.xiptext+0x778): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:85:(.xiptext+0x786): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:86:(.xiptext+0x792): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:86:(.xiptext+0x79a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x7af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x7bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:285:(.xiptext+0x7d1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x7fd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x806): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x81d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x828): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x848): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x852): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x864): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x876): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x881): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x8a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x8ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x8c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:102:(.xiptext+0x8d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:102:(.xiptext+0x8dd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0x8f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x8fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:115:(.xiptext+0x940): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:115:(.xiptext+0x95c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x966): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_check_err_status':
   drivers/mtd/chips/cfi_cmdset_0002.c:159:(.text+0xe3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `fixup_convert_atmel_pri':
   drivers/mtd/chips/cfi_cmdset_0002.c:980:(.text+0xfba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_reboot':
   drivers/mtd/chips/cfi_cmdset_0002.c:2667:(.text+0x1786): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbe8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_atmel_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2652:(.text+0x191f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:601:(.text+0x1f87): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.c:601:(.text+0x1fe6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:657:(.text+0x21cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.c:657:(.text+0x21f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2211:(.text+0x289c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1390)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2263:(.text+0x2a50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:2278:(.text+0x2b97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1560:(.text+0x39e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.c:1577:(.text+0x3a3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x374)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_read_secsi_onechip':
   drivers/mtd/chips/cfi_cmdset_0002.c:1321:(.text+0x3daf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1390)
   drivers/mtd/chips/cfi_cmdset_0002.c:2307:(.text+0x3f2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1390)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load_partial':
   include/linux/mtd/map.h:366:(.text+0x41d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1390)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:2361:(.text+0x434c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1820)
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x17): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x7b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_use_status_reg':
   drivers/mtd/chips/cfi_cmdset_0002.c:125:(.xiptext+0x9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:125:(.xiptext+0xab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:126:(.xiptext+0xbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0xd0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:846:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:846:(.xiptext+0x10b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x11e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x12f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x14b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:851:(.xiptext+0x157): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:851:(.xiptext+0x162): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:852:(.xiptext+0x172): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x17c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x193): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x1a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x1aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x1b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x1cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x1de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x1ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x1fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x208): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x216): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x22a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x23b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x24f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x25b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc


vim +909 include/linux/slab.h

67f2df3b82d091 Kees Cook             2024-07-01  815  
a0a44d9175b349 Vlastimil Babka       2024-05-27  816  /*
a0a44d9175b349 Vlastimil Babka       2024-05-27  817   * The following functions are not to be used directly and are intended only
a0a44d9175b349 Vlastimil Babka       2024-05-27  818   * for internal use from kmalloc() and kmalloc_node()
a0a44d9175b349 Vlastimil Babka       2024-05-27  819   * with the exception of kunit tests
a0a44d9175b349 Vlastimil Babka       2024-05-27  820   */
a0a44d9175b349 Vlastimil Babka       2024-05-27  821  
a0a44d9175b349 Vlastimil Babka       2024-05-27  822  void *__kmalloc_noprof(size_t size, gfp_t flags)
a0a44d9175b349 Vlastimil Babka       2024-05-27  823  				__assume_kmalloc_alignment __alloc_size(1);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  824  
67f2df3b82d091 Kees Cook             2024-07-01  825  void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
a0a44d9175b349 Vlastimil Babka       2024-05-27  826  				__assume_kmalloc_alignment __alloc_size(1);
a0a44d9175b349 Vlastimil Babka       2024-05-27  827  
a0a44d9175b349 Vlastimil Babka       2024-05-27  828  void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t flags, size_t size)
a0a44d9175b349 Vlastimil Babka       2024-05-27  829  				__assume_kmalloc_alignment __alloc_size(3);
7bd230a26648ac Suren Baghdasaryan    2024-03-21  830  
a0a44d9175b349 Vlastimil Babka       2024-05-27  831  void *__kmalloc_cache_node_noprof(struct kmem_cache *s, gfp_t gfpflags,
a0a44d9175b349 Vlastimil Babka       2024-05-27  832  				  int node, size_t size)
a0a44d9175b349 Vlastimil Babka       2024-05-27  833  				__assume_kmalloc_alignment __alloc_size(4);
7bd230a26648ac Suren Baghdasaryan    2024-03-21  834  
a0a44d9175b349 Vlastimil Babka       2024-05-27  835  void *__kmalloc_large_noprof(size_t size, gfp_t flags)
a0a44d9175b349 Vlastimil Babka       2024-05-27  836  				__assume_page_alignment __alloc_size(1);
a0c3b940023eef Harry Yoo             2022-08-17  837  
a0a44d9175b349 Vlastimil Babka       2024-05-27  838  void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
a0a44d9175b349 Vlastimil Babka       2024-05-27  839  				__assume_page_alignment __alloc_size(1);
a0c3b940023eef Harry Yoo             2022-08-17  840  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  841  /**
838de63b101147 Vlastimil Babka       2022-11-10  842   * kmalloc - allocate kernel memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  843   * @size: how many bytes of memory are required.
838de63b101147 Vlastimil Babka       2022-11-10  844   * @flags: describe the allocation context
f1b6eb6e6be149 Christoph Lameter     2013-09-04  845   *
f1b6eb6e6be149 Christoph Lameter     2013-09-04  846   * kmalloc is the normal method of allocating memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  847   * for objects smaller than page size in the kernel.
7e3528c3660a2e Randy Dunlap          2013-11-22  848   *
59bb47985c1db2 Vlastimil Babka       2019-10-06  849   * The allocated object address is aligned to at least ARCH_KMALLOC_MINALIGN
59bb47985c1db2 Vlastimil Babka       2019-10-06  850   * bytes. For @size of power of two bytes, the alignment is also guaranteed
ad59baa3169591 Vlastimil Babka       2024-07-03  851   * to be at least to the size. For other sizes, the alignment is guaranteed to
ad59baa3169591 Vlastimil Babka       2024-07-03  852   * be at least the largest power-of-two divisor of @size.
59bb47985c1db2 Vlastimil Babka       2019-10-06  853   *
01598ba6b1a863 Mike Rapoport         2018-11-11  854   * The @flags argument may be one of the GFP flags defined at
e9d198f2be851f Thorsten Scherer      2023-03-12  855   * include/linux/gfp_types.h and described at
01598ba6b1a863 Mike Rapoport         2018-11-11  856   * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
7e3528c3660a2e Randy Dunlap          2013-11-22  857   *
01598ba6b1a863 Mike Rapoport         2018-11-11  858   * The recommended usage of the @flags is described at
2370ae4b1d5aa7 Mauro Carvalho Chehab 2020-04-10  859   * :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
7e3528c3660a2e Randy Dunlap          2013-11-22  860   *
01598ba6b1a863 Mike Rapoport         2018-11-11  861   * Below is a brief outline of the most useful GFP flags
7e3528c3660a2e Randy Dunlap          2013-11-22  862   *
01598ba6b1a863 Mike Rapoport         2018-11-11  863   * %GFP_KERNEL
01598ba6b1a863 Mike Rapoport         2018-11-11  864   *	Allocate normal kernel ram. May sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  865   *
01598ba6b1a863 Mike Rapoport         2018-11-11  866   * %GFP_NOWAIT
01598ba6b1a863 Mike Rapoport         2018-11-11  867   *	Allocation will not sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  868   *
01598ba6b1a863 Mike Rapoport         2018-11-11  869   * %GFP_ATOMIC
01598ba6b1a863 Mike Rapoport         2018-11-11  870   *	Allocation will not sleep.  May use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  871   *
7e3528c3660a2e Randy Dunlap          2013-11-22  872   * Also it is possible to set different flags by OR'ing
7e3528c3660a2e Randy Dunlap          2013-11-22  873   * in one or more of the following additional @flags:
7e3528c3660a2e Randy Dunlap          2013-11-22  874   *
838de63b101147 Vlastimil Babka       2022-11-10  875   * %__GFP_ZERO
838de63b101147 Vlastimil Babka       2022-11-10  876   *	Zero the allocated memory before returning. Also see kzalloc().
838de63b101147 Vlastimil Babka       2022-11-10  877   *
01598ba6b1a863 Mike Rapoport         2018-11-11  878   * %__GFP_HIGH
01598ba6b1a863 Mike Rapoport         2018-11-11  879   *	This allocation has high priority and may use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  880   *
01598ba6b1a863 Mike Rapoport         2018-11-11  881   * %__GFP_NOFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  882   *	Indicate that this allocation is in no way allowed to fail
7e3528c3660a2e Randy Dunlap          2013-11-22  883   *	(think twice before using).
7e3528c3660a2e Randy Dunlap          2013-11-22  884   *
01598ba6b1a863 Mike Rapoport         2018-11-11  885   * %__GFP_NORETRY
01598ba6b1a863 Mike Rapoport         2018-11-11  886   *	If memory is not immediately available,
7e3528c3660a2e Randy Dunlap          2013-11-22  887   *	then give up at once.
7e3528c3660a2e Randy Dunlap          2013-11-22  888   *
01598ba6b1a863 Mike Rapoport         2018-11-11  889   * %__GFP_NOWARN
01598ba6b1a863 Mike Rapoport         2018-11-11  890   *	If allocation fails, don't issue any warnings.
7e3528c3660a2e Randy Dunlap          2013-11-22  891   *
01598ba6b1a863 Mike Rapoport         2018-11-11  892   * %__GFP_RETRY_MAYFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  893   *	Try really hard to succeed the allocation but fail
dcda9b04713c3f Michal Hocko          2017-07-12  894   *	eventually.
f1b6eb6e6be149 Christoph Lameter     2013-09-04  895   */
7bd230a26648ac Suren Baghdasaryan    2024-03-21  896  static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
f1b6eb6e6be149 Christoph Lameter     2013-09-04  897  {
6fa57d78aa7f21 Kees Cook             2022-11-17  898  	if (__builtin_constant_p(size) && size) {
cc252eae85e095 Vlastimil Babka       2018-10-26  899  		unsigned int index;
3bf019334fbbb5 Kees Cook             2022-11-17  900  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  901  		if (size > KMALLOC_MAX_CACHE_SIZE)
a0a44d9175b349 Vlastimil Babka       2024-05-27  902  			return __kmalloc_large_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  903  
cc252eae85e095 Vlastimil Babka       2018-10-26  904  		index = kmalloc_index(size);
a0a44d9175b349 Vlastimil Babka       2024-05-27  905  		return __kmalloc_cache_noprof(
3c615294058429 GONG, Ruiqi           2023-07-14  906  				kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
f1b6eb6e6be149 Christoph Lameter     2013-09-04  907  				flags, size);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  908  	}
7bd230a26648ac Suren Baghdasaryan    2024-03-21 @909  	return __kmalloc_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  910  }
7bd230a26648ac Suren Baghdasaryan    2024-03-21  911  #define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
ce6a50263d4dde Christoph Lameter     2013-01-10  912  

:::::: The code at line 909 was first introduced by commit
:::::: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
