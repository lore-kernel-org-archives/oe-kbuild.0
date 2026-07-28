Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955D5409635
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273513; cv=none; b=WfcS5sP1HKl9bZJf2ws3QbwlOMOLE/bKG+CRYAeLh9kgiS2Bm2ktOW8dVzthaZ4/2gcbxUVkMFscmkw7+zOEwAt4hjsUcTs4wiKgcqOMwoxMzuXqtsNSCsl1uREOIWm5CngD8F0D5wy9405KojMWQf/Cbr85Lw3G/5gFoR1+ePQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273513; c=relaxed/simple;
	bh=ZO78adFUYau0ICO4h4zdmV1qB2R9Cj4kn9iCmhAR7K8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dFy5MqEA9diaP9DJAhbOwze945jojLcU+Wj1zTP3ohZUSlkXoO/mwkuwtKn0s7i5Kuw2NYvq9ZYgIyhDLo6v/hAOqoUuPve+Ye0NINITSWKRX76iERIsGPNlLd58dVA5CkBojBGtexsUdcr97gjBZxE8KPpq0OV+uXKxDoMgDzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVKwxy4j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVKwxy4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785273512; x=1816809512;
  h=date:from:to:cc:subject:message-id;
  bh=ZO78adFUYau0ICO4h4zdmV1qB2R9Cj4kn9iCmhAR7K8=;
  b=IVKwxy4jeESOu2p8S0ubQ7qQ0R4gNHyer1E6RpF1awwllkgWBHsNc7cw
   Qg8mrULoFHnrtsPn6PoMSsVBZMwjfrcyFE/Lih+nYKMO3U3Cn3mMv/ZhL
   RYDrHnVprRWCRqhfbKNGwI+kx/MZ5XgWUeJPVUxUyjKPFD7XzO5P9CZ+3
   8nRJ7GatyRaEovBiHMsbpb4/fLXGpksnvKs+FuXe5pMIrXRIC88zOjjII
   iDaVoWjfwFdHvcBXV335lRF9DXE/V81ADQG9pdOuS5MwDupTQ7wGWY1YV
   +oZ0hZNYKt1AP3LvL5AuCn1EHCgJLTt6ZltijqtUfboWFusEz7K1TJrOG
   w==;
X-CSE-ConnectionGUID: lkifaC0kRNCW66w131j0rw==
X-CSE-MsgGUID: GS/wEysnSYWy/t+2qcYAyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85637516"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85637516"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 14:18:31 -0700
X-CSE-ConnectionGUID: 2+ujQOidSFGt3wjo3yMxew==
X-CSE-MsgGUID: 535NvG8AT7K8ZrzoUM51qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="260453132"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Jul 2026 14:18:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wopBy-00000000enD-2EAp;
	Tue, 28 Jul 2026 21:18:26 +0000
Date: Wed, 29 Jul 2026 05:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xcd0): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 ftrace_likely_update
Message-ID: <202607290523.3dD7yeUe-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Finn Thain <fthain@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62cc90241548d5570ee68e01aaba6506964e9811
commit: 80047d84eed25e9c92cfb9169980a0dfec110246 atomic: add alignment check to instrumented atomic operations
date:   6 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 6 months ago
config: xtensa-randconfig-r054-20260727 (https://download.01.org/0day-ci/archive/20260729/202607290523.3dD7yeUe-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290523.3dD7yeUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80047d84eed2 ("atomic: add alignment check to instrumented atomic operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607290523.3dD7yeUe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x7af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:327:(.xiptext+0x7ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:328:(.xiptext+0x7dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:329:(.xiptext+0x7eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:329:(.xiptext+0x7f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x7fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x80c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x817): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x820): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x82a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x842): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:336:(.xiptext+0x850): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x85a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x868): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x874): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x87c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x887): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x890): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x8ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x8b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:327:(.xiptext+0x8d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:328:(.xiptext+0x8df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:329:(.xiptext+0x8eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:329:(.xiptext+0x8f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:328:(.xiptext+0x8fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x90c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x917): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:330:(.xiptext+0x920): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:330:(.xiptext+0x92a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab16':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x942): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   arch/xtensa/include/uapi/asm/swab.h:67:(.xiptext+0x950): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:336:(.xiptext+0x95a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x968): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x974): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x97c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:336:(.xiptext+0x987): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:336:(.xiptext+0x990): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x9ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query16':
   include/linux/mtd/cfi.h:336:(.xiptext+0x9b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x9c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x9dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x9eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x9f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:309:(.xiptext+0xa03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:311:(.xiptext+0xa0c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:311:(.xiptext+0xa14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8)
   include/linux/mtd/cfi.h:314:(.xiptext+0xa1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0xaae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   include/linux/mtd/cfi.h:320:(.xiptext+0xab7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0xac3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0xad2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0xade): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0xae7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:309:(.xiptext+0xafb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:309:(.xiptext+0xb03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:311:(.xiptext+0xb09): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   include/linux/mtd/cfi.h:311:(.xiptext+0xb0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:313:(.xiptext+0xb28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:313:(.xiptext+0xb30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0xb4d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   include/linux/mtd/cfi.h:314:(.xiptext+0xb5c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0xb68): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:314:(.xiptext+0xb70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:314:(.xiptext+0xb84): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   include/linux/mtd/cfi.h:320:(.xiptext+0xb94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0xba8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   include/linux/mtd/cfi.h:320:(.xiptext+0xbcb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   include/linux/mtd/cfi.h:320:(.xiptext+0xbd4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__arch_swab32':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0xbef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:273:(.xiptext+0xbf8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0xc1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.o: in function `arch_local_irq_enable':
   arch/xtensa/include/asm/irqflags.h:61:(.xiptext+0xc24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_early_fixup':
   drivers/mtd/chips/cfi_probe.c:85:(.xiptext+0xc35): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:85:(.xiptext+0xc41): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0xc67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0xc6f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0xc80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0xc8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0xc9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_cmp4
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0xcab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0xcb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
>> drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xcd0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xcdb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xce4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xcf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xcfc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xd16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xd22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp1
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xd2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xd43): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xd53): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
>> drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xd63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: warn_slowpath_fmt
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xd72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xd78): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0xd87): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0xdc8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0xdd3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
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
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x605): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x60b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x61e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp2
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x626): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x640): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x656): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x660): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x67a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_const_cmp4
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x688): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':


vim +98 drivers/mtd/chips/cfi_probe.c

b1c97e2335f24db Aaron Sierra    2018-04-30   90  
^1da177e4c3f415 Linus Torvalds  2005-04-16   91  /* check for QRY.
^1da177e4c3f415 Linus Torvalds  2005-04-16   92     in: interleave,type,mode
^1da177e4c3f415 Linus Torvalds  2005-04-16   93     ret: table index, <0 for error
^1da177e4c3f415 Linus Torvalds  2005-04-16   94   */
^1da177e4c3f415 Linus Torvalds  2005-04-16   95  
^1da177e4c3f415 Linus Torvalds  2005-04-16   96  static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
^1da177e4c3f415 Linus Torvalds  2005-04-16   97  				   unsigned long *chip_map, struct cfi_private *cfi)
^1da177e4c3f415 Linus Torvalds  2005-04-16  @98  {
^1da177e4c3f415 Linus Torvalds  2005-04-16   99  	int i;
^1da177e4c3f415 Linus Torvalds  2005-04-16  100  
^1da177e4c3f415 Linus Torvalds  2005-04-16  101  	if ((base + 0) >= map->size) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  102  		printk(KERN_NOTICE
^1da177e4c3f415 Linus Torvalds  2005-04-16  103  			"Probe at base[0x00](0x%08lx) past the end of the map(0x%08lx)\n",
^1da177e4c3f415 Linus Torvalds  2005-04-16  104  			(unsigned long)base, map->size -1);
^1da177e4c3f415 Linus Torvalds  2005-04-16  105  		return 0;
^1da177e4c3f415 Linus Torvalds  2005-04-16  106  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  107  	if ((base + 0xff) >= map->size) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  108  		printk(KERN_NOTICE
^1da177e4c3f415 Linus Torvalds  2005-04-16  109  			"Probe at base[0x55](0x%08lx) past the end of the map(0x%08lx)\n",
^1da177e4c3f415 Linus Torvalds  2005-04-16  110  			(unsigned long)base + 0x55, map->size -1);
^1da177e4c3f415 Linus Torvalds  2005-04-16  111  		return 0;
^1da177e4c3f415 Linus Torvalds  2005-04-16  112  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  113  
^1da177e4c3f415 Linus Torvalds  2005-04-16  114  	xip_disable();
c314dfdc358847e David Woodhouse 2008-08-07  115  	if (!cfi_qry_mode_on(base, map, cfi)) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  116  		xip_enable(base, map, cfi);
^1da177e4c3f415 Linus Torvalds  2005-04-16  117  		return 0;
^1da177e4c3f415 Linus Torvalds  2005-04-16  118  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  119  
^1da177e4c3f415 Linus Torvalds  2005-04-16  120  	if (!cfi->numchips) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  121  		/* This is the first time we're called. Set up the CFI
^1da177e4c3f415 Linus Torvalds  2005-04-16  122  		   stuff accordingly and return */
^1da177e4c3f415 Linus Torvalds  2005-04-16  123  		return cfi_chip_setup(map, cfi);
^1da177e4c3f415 Linus Torvalds  2005-04-16  124  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  125  
^1da177e4c3f415 Linus Torvalds  2005-04-16  126  	/* Check each previous chip to see if it's an alias */
^1da177e4c3f415 Linus Torvalds  2005-04-16  127   	for (i=0; i < (base >> cfi->chipshift); i++) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  128   		unsigned long start;
^1da177e4c3f415 Linus Torvalds  2005-04-16  129   		if(!test_bit(i, chip_map)) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  130  			/* Skip location; no valid chip at this address */
^1da177e4c3f415 Linus Torvalds  2005-04-16  131   			continue;
^1da177e4c3f415 Linus Torvalds  2005-04-16  132   		}
^1da177e4c3f415 Linus Torvalds  2005-04-16  133   		start = i << cfi->chipshift;
^1da177e4c3f415 Linus Torvalds  2005-04-16  134  		/* This chip should be in read mode if it's one
^1da177e4c3f415 Linus Torvalds  2005-04-16  135  		   we've already touched. */
c314dfdc358847e David Woodhouse 2008-08-07  136  		if (cfi_qry_present(map, start, cfi)) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  137  			/* Eep. This chip also had the QRY marker.
^1da177e4c3f415 Linus Torvalds  2005-04-16  138  			 * Is it an alias for the new one? */
c314dfdc358847e David Woodhouse 2008-08-07  139  			cfi_qry_mode_off(start, map, cfi);
^1da177e4c3f415 Linus Torvalds  2005-04-16  140  
^1da177e4c3f415 Linus Torvalds  2005-04-16  141  			/* If the QRY marker goes away, it's an alias */
c314dfdc358847e David Woodhouse 2008-08-07  142  			if (!cfi_qry_present(map, start, cfi)) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  143  				xip_allowed(base, map);
^1da177e4c3f415 Linus Torvalds  2005-04-16  144  				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
^1da177e4c3f415 Linus Torvalds  2005-04-16  145  				       map->name, base, start);
^1da177e4c3f415 Linus Torvalds  2005-04-16  146  				return 0;
^1da177e4c3f415 Linus Torvalds  2005-04-16  147  			}
^1da177e4c3f415 Linus Torvalds  2005-04-16  148  			/* Yes, it's actually got QRY for data. Most
^1da177e4c3f415 Linus Torvalds  2005-04-16  149  			 * unfortunate. Stick the new chip in read mode
^1da177e4c3f415 Linus Torvalds  2005-04-16  150  			 * too and if it's the same, assume it's an alias. */
^1da177e4c3f415 Linus Torvalds  2005-04-16  151  			/* FIXME: Use other modes to do a proper check */
c314dfdc358847e David Woodhouse 2008-08-07  152  			cfi_qry_mode_off(base, map, cfi);
^1da177e4c3f415 Linus Torvalds  2005-04-16  153  
c314dfdc358847e David Woodhouse 2008-08-07  154  			if (cfi_qry_present(map, base, cfi)) {
^1da177e4c3f415 Linus Torvalds  2005-04-16  155  				xip_allowed(base, map);
^1da177e4c3f415 Linus Torvalds  2005-04-16  156  				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
^1da177e4c3f415 Linus Torvalds  2005-04-16  157  				       map->name, base, start);
^1da177e4c3f415 Linus Torvalds  2005-04-16  158  				return 0;
^1da177e4c3f415 Linus Torvalds  2005-04-16  159  			}
^1da177e4c3f415 Linus Torvalds  2005-04-16  160  		}
^1da177e4c3f415 Linus Torvalds  2005-04-16  161  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  162  
^1da177e4c3f415 Linus Torvalds  2005-04-16  163  	/* OK, if we got to here, then none of the previous chips appear to
^1da177e4c3f415 Linus Torvalds  2005-04-16  164  	   be aliases for the current one. */
^1da177e4c3f415 Linus Torvalds  2005-04-16  165  	set_bit((base >> cfi->chipshift), chip_map); /* Update chip map */
^1da177e4c3f415 Linus Torvalds  2005-04-16  166  	cfi->numchips++;
^1da177e4c3f415 Linus Torvalds  2005-04-16  167  
^1da177e4c3f415 Linus Torvalds  2005-04-16  168  	/* Put it back into Read Mode */
c314dfdc358847e David Woodhouse 2008-08-07  169  	cfi_qry_mode_off(base, map, cfi);
^1da177e4c3f415 Linus Torvalds  2005-04-16  170  	xip_allowed(base, map);
^1da177e4c3f415 Linus Torvalds  2005-04-16  171  
^1da177e4c3f415 Linus Torvalds  2005-04-16  172  	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
^1da177e4c3f415 Linus Torvalds  2005-04-16  173  	       map->name, cfi->interleave, cfi->device_type*8, base,
^1da177e4c3f415 Linus Torvalds  2005-04-16  174  	       map->bankwidth*8);
^1da177e4c3f415 Linus Torvalds  2005-04-16  175  
^1da177e4c3f415 Linus Torvalds  2005-04-16  176  	return 1;
^1da177e4c3f415 Linus Torvalds  2005-04-16  177  }
^1da177e4c3f415 Linus Torvalds  2005-04-16  178  

:::::: The code at line 98 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
