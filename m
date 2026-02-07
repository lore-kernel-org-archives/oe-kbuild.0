Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD811D6193
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770462343; cv=none; b=NnrRwOX+UsIu12VnAOYyaFwpf3qqcVhOLGw8PhtrjjfXktkJBjC8ljyNLT+r/3ggFOy3B5Xf2CQGnI6je14tFrvYzNXs0Z5kqYIsiAjT1Pi058178+atlYnYaOBgd5KXXYj5FudunUKI6ZKfdJ2vWelTjZtdawsAmCGQT6/sczU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770462343; c=relaxed/simple;
	bh=/K4J8+SxWhckwsNMyAXWQ5qwgHfQ79A3c9GZFJZnuxk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KgtZHDrIcSXay6hcGR2q0ATRybGhwk3TBBQAMQhEeLqNsvXHcHkd3T9DICtGVnYId2x1781Z8XY0yJZb5r/goLXFQJbvbIOHxMmyYy5doT+uaJUcC5/sK3MZqZ1lsbs02EOSnaehs84O4NYtrkYox2Pge/jjSLki3do55naf1jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YC3CtHxz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YC3CtHxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770462343; x=1801998343;
  h=date:from:to:cc:subject:message-id;
  bh=/K4J8+SxWhckwsNMyAXWQ5qwgHfQ79A3c9GZFJZnuxk=;
  b=YC3CtHxzWqnM7yyiCqT9KxJNv80xjoYA96Cr0rlC/BOnkz46pDk0WxaP
   KnqVVA5bed9GSaC4nQQ5NSWZIC/7+cnCJvCMcHtDgUFPG53rkF5JR2ZiM
   Khr7YFbU3q7zLigAyC3DXqZ1MVcXPznz7afmRA3BOm9zM0opDMwURC7Ne
   hUS4tEY/xNG4mf2OhzPIH5+7S0LgSNTLOlSuIZ76GLNk7vNSQMhbS2XIq
   dsfTSeYZwFMm3mC4xjQ8pKu5lhIjxExgCk4vnJ0bTzQqaQ94M1w8jPx5y
   6VwKqShmYd8yOrA6v44kn4t8XqLdTWgSK+UfDBMRSnst+gnF/8CwA0j2f
   g==;
X-CSE-ConnectionGUID: 7ZhrFrS5SfC1A9ImaU2uRw==
X-CSE-MsgGUID: jXrRjMneTVCUK3dz5VFIOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70847811"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="70847811"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 03:05:42 -0800
X-CSE-ConnectionGUID: lqGZv5D9Q8mswOmSFjtLqA==
X-CSE-MsgGUID: wE+MwCFxTwiWQzDxZN3Sjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="234059160"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2026 03:05:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vog8A-00000000lbS-344S;
	Sat, 07 Feb 2026 11:05:38 +0000
Date: Sat, 07 Feb 2026 19:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/overflow.h:53:(.xiptext+0x203): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 ftrace_likely_update
Message-ID: <202602071921.1cIMmzB8-lkp@intel.com>
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
head:   2687c848e57820651b9f69d30c4710f4219f7dbf
commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747 mtd: cfi: use struct_size() helper for cfiq allocation
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: xtensa-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071921.1cIMmzB8-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071921.1cIMmzB8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602071921.1cIMmzB8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x16a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.c:198:(.xiptext+0x170): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:200:(.xiptext+0x18c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x98)
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0x1a9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:208:(.xiptext+0x1b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:208:(.xiptext+0x1c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:208:(.xiptext+0x1d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:211:(.xiptext+0x1e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__must_check_overflow':
>> include/linux/overflow.h:53:(.xiptext+0x203): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   include/linux/overflow.h:53:(.xiptext+0x21b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.o: in function `kmalloc_noprof':
   include/linux/slab.h:909:(.xiptext+0x233): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:212:(.xiptext+0x242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:212:(.xiptext+0x254): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:212:(.xiptext+0x262): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x26b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x277): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x287): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x29e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x2ad): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x2bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x2c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x2c9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x2cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0x2f9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0x303): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x98)
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x316): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x323): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__fswab16':
   include/uapi/linux/swab.h:51:(.xiptext+0x335): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x352): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x36f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x38c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x3aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x3c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x3e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x436): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x447): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x462): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x474): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x482): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x498): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x4af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x4c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x4db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x4f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x4fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d4)
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x508): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d4)
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x51a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x52b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x53c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x54a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x552): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x563): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x98)
   drivers/mtd/chips/cfi_probe.c:273:(.xiptext+0x572): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x98)
   drivers/mtd/chips/cfi_probe.c:276:(.xiptext+0x580): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0x59d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_early_fixup':
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5a9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5d9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x610): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x61f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:86:(.xiptext+0x627): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:83:(.xiptext+0x637): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x642): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x663): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:285:(.xiptext+0x66b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x782): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0x78a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0x79a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0x7ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0x7ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:102:(.xiptext+0x7c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:102:(.xiptext+0x7cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0x7dd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0x7ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0x800): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0x80e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x816): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x826): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `arch_local_save_flags':
   arch/xtensa/include/asm/irqflags.h:22:(.xiptext+0x831): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x846): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x858): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x867): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x86f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x875): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:115:(.xiptext+0x87b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:115:(.xiptext+0x894): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x8b5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:115:(.xiptext+0x8c1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:120:(.xiptext+0x8d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:120:(.xiptext+0x8e5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:120:(.xiptext+0x8f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:123:(.xiptext+0x8ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `generic_test_bit':
   include/asm-generic/bitops/generic-non-atomic.h:128:(.xiptext+0x911): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':


vim +53 include/linux/overflow.h

f0907827a8a915 Rasmus Villemoes 2018-05-08  45  
9b80e4c4ddaca3 Kees Cook        2020-08-12  46  /*
9b80e4c4ddaca3 Kees Cook        2020-08-12  47   * Allows for effectively applying __must_check to a macro so we can have
9b80e4c4ddaca3 Kees Cook        2020-08-12  48   * both the type-agnostic benefits of the macros while also being able to
9b80e4c4ddaca3 Kees Cook        2020-08-12  49   * enforce that the return value is, in fact, checked.
9b80e4c4ddaca3 Kees Cook        2020-08-12  50   */
9b80e4c4ddaca3 Kees Cook        2020-08-12  51  static inline bool __must_check __must_check_overflow(bool overflow)
9b80e4c4ddaca3 Kees Cook        2020-08-12  52  {
9b80e4c4ddaca3 Kees Cook        2020-08-12 @53  	return unlikely(overflow);
9b80e4c4ddaca3 Kees Cook        2020-08-12  54  }
9b80e4c4ddaca3 Kees Cook        2020-08-12  55  

:::::: The code at line 53 was first introduced by commit
:::::: 9b80e4c4ddaca3501177ed41e49d0928ba2122a8 overflow: Add __must_check attribute to check_*() helpers

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
