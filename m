Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C738423A
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 03:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785295613; cv=none; b=aai+f/ZVITYc5hfcYmnkNBzXY2DtU/W/EH3lNnlT2S/M4Pa8GEDNWAVfwaNsUoZAnO3YYjnuyksWbNwlUqCiU7uw7T1w074yGFgEXDgb/JLNEdcwjVUUoGg7LlOkFAAJw8fWJSMwcviLBUWO3ly4iBfLM2GVqxE6xD/VtUfBomc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785295613; c=relaxed/simple;
	bh=WFiMA5Ca9+fcmaZAzdO/Q2PCPv615ixKjphRiBAuSuM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DEHdh2WStK+9RZ5pUbe5UbMnQza//N/5QcE0t3afyoHziz2rbB36PMxm8WIGgW4b/26dHE5jhuVVsUPA0zqMMw1311fXRBIYyf8f9lsTXzu+P+zukFH0KISkyLRDButuDYAOnHWJ7rbx7rIZnVqBfj5ADJ5zE9/MVKYOp8fs3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMO2bD5l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMO2bD5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785295606; x=1816831606;
  h=date:from:to:cc:subject:message-id;
  bh=WFiMA5Ca9+fcmaZAzdO/Q2PCPv615ixKjphRiBAuSuM=;
  b=jMO2bD5lyET7J4QT9ZyTshu/2pvqZ7uy9Dc/pnP1+wxbQrT/saAZxsSB
   1tEaz9lMUHTcF22fUbgRr0rsmcA27WmqOzH7niR+p3SaiSeBgLw3dYz82
   QJih09bQyOTRqC9ZSNRvTv4rinKrmDPEHXRr2ln5fD3skC/VdHrcXFtj3
   VtfCSrKy6rZ8Vmrma0IjGi4i4cXW1MUrEi4fnnOd/PGHTS+KnDDCCNz4S
   dJXDaaKWq1nDQpAHdWq2UwBi2CuuZyUEsBd3N/6Zt7s5x+qeFstJzIuZf
   kCVDsjg3YOoDRuJW3wxnu3dBqipGR/OxVGe9IsGjzQPQEfdLrvW1pADUu
   A==;
X-CSE-ConnectionGUID: oZLNMn1NT7yAU7XfV4xPcg==
X-CSE-MsgGUID: M28nJyjcQCuydN7PRJhpdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89569182"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="89569182"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 20:26:45 -0700
X-CSE-ConnectionGUID: mijz8U9jRr69sQo+hAoKWg==
X-CSE-MsgGUID: ibQG+6BlT7SJ5JTOSH0abA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="298108245"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Jul 2026 20:26:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wouwM-00000000f0J-38mg;
	Wed, 29 Jul 2026 03:26:42 +0000
Date: Wed, 29 Jul 2026 11:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/include/asm/irqflags.h:47:(.xiptext+0x47e):
 dangerous relocation: windowed longcall crosses 1GB boundary; return may
 fail: __sanitizer_cov_trace_const_cmp1
Message-ID: <202607291020.1yypQ4CB-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
commit: cd2464a059d6e88eecda87d71d3dbc87175289f0 init.h: discard exitcall symbols early
date:   9 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 weeks ago
config: xtensa-randconfig-r054-20260727 (https://download.01.org/0day-ci/archive/20260729/202607291020.1yypQ4CB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291020.1yypQ4CB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cd2464a059d6 ("init.h: discard exitcall symbols early")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607291020.1yypQ4CB-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [00003000,02a856ff] overlaps section .data VMA [00000000,004309d7]
   xtensa-linux-ld: section .init.data VMA [004309e0,0044eaef] overlaps section .text VMA [00003000,02a856ff]
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xc4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xd3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xdc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xe6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xf4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0xff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x108): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x12a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x138): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x142): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x150): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x15c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x164): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x16f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x178): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x193): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x19c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1b9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1d5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x1f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x206): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x213): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x21f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x22f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x244): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x24c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x252): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x258): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x27c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x29a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x2a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x2b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o:drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x2bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x2c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:198:(.xiptext+0x2d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:309:(.xiptext+0x2df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:309:(.xiptext+0x2e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:311:(.xiptext+0x2f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:312:(.xiptext+0x300): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:313:(.xiptext+0x318): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x322): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0x32b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x339): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x344): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0x34c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x357): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0x360): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x370): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x38b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x39c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0x3af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `arch_local_irq_save':
>> arch/xtensa/include/asm/irqflags.h:47:(.xiptext+0x47e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x489): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:311:(.xiptext+0x4df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0x4e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x502): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   include/linux/mtd/cfi.h:314:(.xiptext+0x51b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0x533): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x548): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:320:(.xiptext+0x55c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   include/linux/mtd/cfi.h:320:(.xiptext+0x573): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   include/linux/mtd/cfi.h:320:(.xiptext+0x58a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0x593): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x5a1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0x5af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x5b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x5c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x5d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x5df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x5e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x5f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x604): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x610): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:229:(.xiptext+0x61a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x628): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:229:(.xiptext+0x634): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x63c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x647): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:230:(.xiptext+0x650): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x66b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:231:(.xiptext+0x674): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:232:(.xiptext+0x68e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x697): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x6a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x6af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x6b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x6c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x6d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x6df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x6e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x6f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x704): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x710): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x71a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x728): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x734): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x73c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x747): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x750): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x76b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x774): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x782): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x78e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x79f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x7ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:327:(.xiptext+0x7ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:328:(.xiptext+0x7d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:329:(.xiptext+0x7e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:329:(.xiptext+0x7f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:328:(.xiptext+0x7fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x808): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x813): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x81c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x826): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x83e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   arch/xtensa/include/uapi/asm/swab.h:67:(.xiptext+0x84c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:336:(.xiptext+0x856): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x864): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x870): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x878): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x883): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x88c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x8a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x8b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:327:(.xiptext+0x8cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:328:(.xiptext+0x8dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:329:(.xiptext+0x8eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:329:(.xiptext+0x8f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x8fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x90a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x916): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x91f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x92a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4


vim +47 arch/xtensa/include/asm/irqflags.h

df9ee29270c11d David Howells 2010-10-07  25  
df9ee29270c11d David Howells 2010-10-07  26  static inline unsigned long arch_local_irq_save(void)
df9ee29270c11d David Howells 2010-10-07  27  {
df9ee29270c11d David Howells 2010-10-07  28  	unsigned long flags;
38fef73c21d117 Max Filippov  2015-07-16  29  #if XTENSA_FAKE_NMI
900f492836df43 Sinan Kaya    2019-05-14  30  #if defined(CONFIG_DEBUG_MISC) && (LOCKLEVEL | TOPLEVEL) >= XCHAL_DEBUGLEVEL
38fef73c21d117 Max Filippov  2015-07-16  31  	unsigned long tmp;
38fef73c21d117 Max Filippov  2015-07-16  32  
38fef73c21d117 Max Filippov  2015-07-16  33  	asm volatile("rsr	%0, ps\t\n"
38fef73c21d117 Max Filippov  2015-07-16  34  		     "extui	%1, %0, 0, 4\t\n"
38fef73c21d117 Max Filippov  2015-07-16  35  		     "bgei	%1, "__stringify(LOCKLEVEL)", 1f\t\n"
38fef73c21d117 Max Filippov  2015-07-16  36  		     "rsil	%0, "__stringify(LOCKLEVEL)"\n"
38fef73c21d117 Max Filippov  2015-07-16  37  		     "1:"
38fef73c21d117 Max Filippov  2015-07-16  38  		     : "=a" (flags), "=a" (tmp) :: "memory");
38fef73c21d117 Max Filippov  2015-07-16  39  #else
38fef73c21d117 Max Filippov  2015-07-16  40  	asm volatile("rsr	%0, ps\t\n"
38fef73c21d117 Max Filippov  2015-07-16  41  		     "or	%0, %0, %1\t\n"
38fef73c21d117 Max Filippov  2015-07-16  42  		     "xsr	%0, ps\t\n"
38fef73c21d117 Max Filippov  2015-07-16  43  		     "rsync"
38fef73c21d117 Max Filippov  2015-07-16  44  		     : "=&a" (flags) : "a" (LOCKLEVEL) : "memory");
38fef73c21d117 Max Filippov  2015-07-16  45  #endif
38fef73c21d117 Max Filippov  2015-07-16  46  #else
df9ee29270c11d David Howells 2010-10-07 @47  	asm volatile("rsil	%0, "__stringify(LOCKLEVEL)
df9ee29270c11d David Howells 2010-10-07  48  		     : "=a" (flags) :: "memory");
38fef73c21d117 Max Filippov  2015-07-16  49  #endif
df9ee29270c11d David Howells 2010-10-07  50  	return flags;
df9ee29270c11d David Howells 2010-10-07  51  }
df9ee29270c11d David Howells 2010-10-07  52  

:::::: The code at line 47 was first introduced by commit
:::::: df9ee29270c11dba7d0fe0b83ce47a4d8e8d2101 Fix IRQ flag handling naming

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
