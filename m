Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A392388396
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 04:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785212169; cv=none; b=bOuxEhXELHu6r5zgqmXR3j0UHeteWlXYlGUhZN1vht7FWUiKp/m4/yxFm9ot/HHRO1aLmulHrGEN4aI2FSEDqSi2XE90d2cf/rusRn5WJzQ1ADSgKngVcLo8s8cbM8OPFKdaH7kug/Jr04Kuq+wNNiBwxGNnA52UUWty1OTmbQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785212169; c=relaxed/simple;
	bh=CLqNHHO/TK0zOh5NReNeb2A9jxwqYb0MJZ9pCGvJJ80=;
	h=Date:From:To:Cc:Subject:Message-ID; b=okV5qO9O5FpHDghjImnzRvrP0sRyCNbxc0EfyZPiLTP2F/b8h9z48FVPzy/63bsY6FWC380Wk5B8gv3PjRYxeowWa2rjsLsbYU+xFv3JlSCLdlurjjyA1mRcrlWK2zuMmZC6crlKfjvlYT8f2LAPmph/ccmueE/Dqnc9UVXzhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdFMROsL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdFMROsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785212132; x=1816748132;
  h=date:from:to:cc:subject:message-id;
  bh=CLqNHHO/TK0zOh5NReNeb2A9jxwqYb0MJZ9pCGvJJ80=;
  b=mdFMROsLU468oqhc3aooYwnD26ILXYLRMXUofCiyPoalb9DSaRRu9y6m
   NZptFNzLMFeY/nPIPeKr2gzOZkPEfvYvgQCe4yiBuSw0/RcES+CZX7Aw/
   eLtAX9zQrhF11I4nNfa3ytJRxvSnbcW22YyEtZAY8Idx1g528d2pnyOKP
   XfVCxqfvehRK//Tg/SoI1Cyru0uFDEi+5i+Wg39/3M1+SzEaV3eqwSZl8
   UbUovuMw2O4IFG9k7vTkyDY90Bhsw0HWEL7WzukHLMLWoHc3FDLhCfwXQ
   5GajEzbdd42mSNDEpzrdzY2o4iwlLndMVClr5bLHIVfYIvrIHIS45SgCa
   A==;
X-CSE-ConnectionGUID: kHkrPaILR6K4NN3xgu2uUg==
X-CSE-MsgGUID: yJmiuc5sT4S5hUPOBLlYIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108585630"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="108585630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 21:15:25 -0700
X-CSE-ConnectionGUID: nyIS+YYiT26/ahok3WrTiA==
X-CSE-MsgGUID: YSuQbHtnQM6ogqIwcdYpBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="263905290"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Jul 2026 21:15:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woZDt-00000000dwB-3WKJ;
	Tue, 28 Jul 2026 04:15:21 +0000
Date: Tue, 28 Jul 2026 12:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/include/asm/irqflags.h:75:(.xiptext+0x45a):
 dangerous relocation: windowed longcall crosses 1GB boundary; return may
 fail: cfi_build_cmd
Message-ID: <202607281146.AzANXHym-lkp@intel.com>
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
TO: Nam Cao <namcao@linutronix.de>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: Gabriele Monaco <gmonaco@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62cc90241548d5570ee68e01aaba6506964e9811
commit: f74f8bb246cf22f27752977da62079cb615f55b2 rv: Add rtapp_sleep monitor
date:   1 year, 1 month ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 1 month ago
config: xtensa-randconfig-r054-20260727 (https://download.01.org/0day-ci/archive/20260728/202607281146.AzANXHym-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281146.AzANXHym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f74f8bb246cf ("rv: Add rtapp_sleep monitor")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607281146.AzANXHym-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,024cce87] overlaps section .data VMA [00000000,00389b9f]
   xtensa-linux-ld: section .init.data VMA [00389ba0,003a2e63] overlaps section .text VMA [00003000,024cce87]
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xc0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xcf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xd8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xe2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xf0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xfb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x104): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x10e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x126): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x134): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x13e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x14c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x158): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x160): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x16b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x174): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x18f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x198): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1b5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x20b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x220): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x228): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x241): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x247): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x265): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x282): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x290): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x29f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x2a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x2b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x2c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:198:(.xiptext+0x2cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:198:(.xiptext+0x2d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:200:(.xiptext+0x2de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:309:(.xiptext+0x2ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x304): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x30e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:313:(.xiptext+0x317): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x325): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x330): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0x338): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x343): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0x34c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x35c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x377): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x388): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0x39b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
>> drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x46a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x475): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:312:(.xiptext+0x4cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0x4d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x4ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   include/linux/mtd/cfi.h:314:(.xiptext+0x507): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x51f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x534): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:320:(.xiptext+0x548): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   include/linux/mtd/cfi.h:320:(.xiptext+0x55f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   include/linux/mtd/cfi.h:320:(.xiptext+0x576): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0x57f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x58d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x59b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x5a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x5b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x5bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x5cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x5d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x5de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x5f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x5fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:229:(.xiptext+0x606): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x612): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:229:(.xiptext+0x61c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x624): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x62f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x638): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x653): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:231:(.xiptext+0x65c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x676): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:232:(.xiptext+0x67f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x68d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x69b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x6a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x6b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x6bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x6cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x6d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x6de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x6f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x6fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x706): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x714): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x720): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x728): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x733): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x73c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x757): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x760): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x76e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x77a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x78b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x797): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:327:(.xiptext+0x7b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:328:(.xiptext+0x7c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:329:(.xiptext+0x7d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:329:(.xiptext+0x7dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:328:(.xiptext+0x7e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x7f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x7ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x808): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x812): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x82a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   arch/xtensa/include/uapi/asm/swab.h:67:(.xiptext+0x838): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:336:(.xiptext+0x842): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x850): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x85c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x864): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x86f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x878): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x893): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x89c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:327:(.xiptext+0x8bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:328:(.xiptext+0x8c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:329:(.xiptext+0x8d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:329:(.xiptext+0x8e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x8ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x8f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x903): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x90c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x916): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x92e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:336:(.xiptext+0x93c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x946): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x954): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x960): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x968): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x973): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x97c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x997): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x9a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x9ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x9c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x9d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:309:(.xiptext+0x9e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:309:(.xiptext+0x9ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:311:(.xiptext+0x9f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:312:(.xiptext+0xa00): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8)
   include/linux/mtd/cfi.h:314:(.xiptext+0xa08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0xa66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:314:(.xiptext+0xa6f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0xa7b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0xa8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0xa96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0xa9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0xab3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0xabb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> include/linux/mtd/cfi.h:320:(.xiptext+0xac1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0xac7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0xae0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:309:(.xiptext+0xae8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> include/linux/mtd/cfi.h:312:(.xiptext+0xb05): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   include/linux/mtd/cfi.h:314:(.xiptext+0xb14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0xb20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0xb28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0xb3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0xb4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0xb60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0xb83): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   include/linux/mtd/cfi.h:320:(.xiptext+0xb8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0xba7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0xbb0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0xbd4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:320:(.xiptext+0xbdf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0xc03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0xc0b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_early_fixup':
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0xc14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:85:(.xiptext+0xc27): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_probe.c:85:(.xiptext+0xc33): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0xc75): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xc80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:221:(.xiptext+0x32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:222:(.xiptext+0x38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0x4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x5c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:228:(.xiptext+0x6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:234:(.xiptext+0xa3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_util.c:237:(.xiptext+0xb1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:237:(.xiptext+0xbf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_util.c:240:(.xiptext+0xc8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:240:(.xiptext+0xd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_util.c:240:(.xiptext+0xe6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:287:(.xiptext+0x136): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x13c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x14a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x163): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x17b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x184): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x193): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x19c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x1aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x1c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x1cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:294:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x20a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x210): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x21e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x24c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x26c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x279): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x287): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x29f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x2c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:252:(.xiptext+0x2eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:253:(.xiptext+0x2f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x302): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x32e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x353): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:259:(.xiptext+0x35c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:259:(.xiptext+0x36b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_build_cmd_addr':
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x397): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:264:(.xiptext+0x3c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_util.c:264:(.xiptext+0x3d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x3e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x3ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x418): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_build_cmd_addr':
   drivers/mtd/chips/cfi_util.c:54:(.xiptext+0x43b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:54:(.xiptext+0x444): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:55:(.xiptext+0x452): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x47e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:213:(.xiptext+0x4a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:271:(.xiptext+0x4bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_send_gen_cmd':
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x4c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:208:(.xiptext+0x4d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_build_cmd_addr':
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x4fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:47:(.xiptext+0x522): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:54:(.xiptext+0x52b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:278:(.xiptext+0x59a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:278:(.xiptext+0x5a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:282:(.xiptext+0x5ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   drivers/mtd/chips/cfi_util.c:282:(.xiptext+0x5c9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:282:(.xiptext+0x5d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.c:282:(.xiptext+0x5df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:282:(.xiptext+0x5f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:282:(.xiptext+0x5ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x605): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x60b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x61e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x626): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x640): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x656): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x660): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x67a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x688): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x697): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:300:(.xiptext+0x6a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:306:(.xiptext+0x6ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:306:(.xiptext+0x6bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:304:(.xiptext+0x6c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.o: in function `kmalloc_noprof':
   include/linux/slab.h:909:(.xiptext+0x6d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/slab.h:909:(.xiptext+0x6da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.o: in function `arch_irqs_disabled_flags':
   arch/xtensa/include/asm/irqflags.h:75:(.xiptext+0x6e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:316:(.xiptext+0x700): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:316:(.xiptext+0x70a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:320:(.xiptext+0x713): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:322:(.xiptext+0x721): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:328:(.xiptext+0x72c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:328:(.xiptext+0x734): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:331:(.xiptext+0x73f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.o: in function `arch_local_irq_enable':
   arch/xtensa/include/asm/irqflags.h:61:(.xiptext+0x748): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:302:(.xiptext+0x758): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:309:(.xiptext+0x772): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:311:(.xiptext+0x783): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   include/linux/mtd/cfi.h:313:(.xiptext+0x79a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0020.o: in function `cfi_cmdset_0020':
   drivers/mtd/chips/cfi_cmdset_0020.c:128:(.text+0x2988): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
>> drivers/mtd/chips/cfi_cmdset_0002.c:2188:(.text+0x1196): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.c:2205:(.text+0x11e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2269:(.text+0x15f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.c:2275:(.text+0x1613): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0x1bb3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0x1cfb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2766:(.text+0x27bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.c:2775:(.text+0x27fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x330)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1858:(.text+0x3ad2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf54)
   drivers/mtd/chips/cfi_cmdset_0002.c:1882:(.text+0x3c0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf54)
   drivers/mtd/chips/cfi_cmdset_0002.c:1925:(.text+0x3e28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf54)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x4100): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf54)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2137:(.text+0x4348): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xfe0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2627:(.text+0x4502): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1924)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x4b1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x5456): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x5587): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x5edf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .xiptext
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x5f1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x330)
>> drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
>> drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0xc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_cmdset_0002.o:drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x37): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x47): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_cmdset_0002.c:834:(.xiptext+0x50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_use_status_reg':
   drivers/mtd/chips/cfi_cmdset_0002.c:125:(.xiptext+0x5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:126:(.xiptext+0x7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0xa8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:846:(.xiptext+0xca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0xd3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0xdb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:851:(.xiptext+0xee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:852:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x156): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x15c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x16f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x17b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x1da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x1e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x1f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1995:(.xiptext+0x20b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x220): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2012:(.xiptext+0x26a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2012:(.xiptext+0x270): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2012:(.xiptext+0x27f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x28a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x294): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x29c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x2ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x2c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x2d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x336): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x33c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x358): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x36c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x37f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x388): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x394): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x3a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x3af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x3c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x3cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x3db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x3e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x3f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x3fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x40b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x428): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x43b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x447): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x459): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x473): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x47c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x488): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x492): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1068:(.xiptext+0x498): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1068:(.xiptext+0x4b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1068:(.xiptext+0x4bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1068:(.xiptext+0x4c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1069:(.xiptext+0x4d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1069:(.xiptext+0x4f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x50d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1081:(.xiptext+0x520): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x52c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x53a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x543): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x556): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1093:(.xiptext+0x564): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1097:(.xiptext+0x581): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x5aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x5b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x5bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x5c1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1100:(.xiptext+0x5d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1101:(.xiptext+0x5db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1101:(.xiptext+0x5e1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x5ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x5f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1103:(.xiptext+0x604): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x61b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x621): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x627): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x638): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x17f8)
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x664): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x66e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x677): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x680): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x697): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x6a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x6bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x76e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1141:(.xiptext+0x777): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1143:(.xiptext+0x783): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x796): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x7a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x7ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x7d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x7db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x7e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x7e9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x803): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x80e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x814): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x81f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x82e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x838): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x84f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x858): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x86f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1949:(.xiptext+0x87c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x896): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x8a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x8b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12f8)
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x8bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x8c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x8e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0x946): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0x94e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1979:(.xiptext+0x967): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1979:(.xiptext+0x97b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0x990): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0x9c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1986:(.xiptext+0x9ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1986:(.xiptext+0x9da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0x9fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xa07): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xa0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xa15): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xa2f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xa3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xa40): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xa4b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xa5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xa64): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xa7b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xa84): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xa9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xaa7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0xace): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0xad7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0xadd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0xae8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0xb00): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0xb08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0xb14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12f8)
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0xb20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1668:(.xiptext+0xb2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0xb44): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1681:(.xiptext+0xbbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1682:(.xiptext+0xbc4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1683:(.xiptext+0xbcf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.c:1685:(.xiptext+0xbdb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0xbf7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1694:(.xiptext+0xc0b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0xc20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1695:(.xiptext+0xc34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_disable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1025:(.xiptext+0xc3f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1026:(.xiptext+0xc52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1026:(.xiptext+0xc5f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1702:(.xiptext+0xc6c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1702:(.xiptext+0xc76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x190c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1702:(.xiptext+0xc7f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0xd02): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0xd08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0xd16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0xd24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b2c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0xd32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0xd3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0xd42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xd4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xd5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_exit':
   drivers/mtd/chips/cfi_cmdset_0002.c:1293:(.xiptext+0xd63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0xd7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
..


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
