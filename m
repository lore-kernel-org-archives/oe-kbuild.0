Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188E429D26E
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774177012; cv=none; b=ITWHUVrkaBJ4CYCpeDlP6rigSir++9AK6109UJAuyxg99sBerysMQfxI8iutSLPVnew6U0kXitizufL3TIOY5rRU5xhSiSfMh/UsIYXKe45Y8scC+pfriRSQSlmFEWho7fvQFV7aNB2l2Gw9HFE3lKChJrYVihqv5ZO/DJyTZYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774177012; c=relaxed/simple;
	bh=kZ8y6Tub/whCqOQ7ZSttoRbSDyvedHQ4rp8I7PL8SRo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JkTTx1n6bwyM1JkvKIFZHqQxlWSFqAE4ouyXfNwodRhaLYksBCi63EWmMfLNsWv9mPNYxjyOTH6PCweLekPnZ72IhcEhYB4YxIhOfGJZEjAF1DGWuLSTJhTfGlw0nbxisIN0NChY4OoNzZutxJxz4SmNy7X0BTg1FoNRkolbVtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxbHbVBi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxbHbVBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774177009; x=1805713009;
  h=date:from:to:cc:subject:message-id;
  bh=kZ8y6Tub/whCqOQ7ZSttoRbSDyvedHQ4rp8I7PL8SRo=;
  b=BxbHbVBizma95oPMGf+zfHspDtW1iJy4hanB6dfEwSz8wDm4ro07IMje
   XqAkYI8tmle4CXIMxjoN9Cssasy51VFwsY/C/VTOoFPHlolUMuE3BDHDX
   3VQoDuh4UOHob6NL03QaE6wFfRpJ93wJ914mn26g9RMq+Bz/LXZKqmUBL
   5A7HRE+TdlsipdQeGjXATpmzCNEq3N7LLt/DM7oxsbZQcSd9Ou8sZCBcV
   U7MlSZKMcauJ3a1K0HtFHPlY8XNyDyRQ1QIXurMd/Eocs0xQ8xZT+M/Pq
   RS9EPqRd90WBtOPEEpQyDKL+dzBesImmAJqmC5Kqu/FD0ezXGIdd8f5QH
   A==;
X-CSE-ConnectionGUID: 31UgheR+QGao+Mg9/gH9+Q==
X-CSE-MsgGUID: eszP9YWDRv22KVtcDn7GXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="85899629"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="85899629"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 03:56:48 -0700
X-CSE-ConnectionGUID: VSuPTgqpRtWPNYdt2CrDvw==
X-CSE-MsgGUID: J++fVi3OTweq23gioBKdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="246773884"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Mar 2026 03:56:47 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4GU8-0000000022J-2sIu;
	Sun, 22 Mar 2026 10:56:44 +0000
Date: Sun, 22 Mar 2026 18:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/overflow.h:53:(.xiptext+0x163): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 ftrace_likely_update
Message-ID: <202603221844.2Iwlmi3S-lkp@intel.com>
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
head:   113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f
commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747 mtd: cfi: use struct_size() helper for cfiq allocation
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
config: xtensa-randconfig-r051-20260321 (https://download.01.org/0day-ci/archive/20260322/202603221844.2Iwlmi3S-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221844.2Iwlmi3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603221844.2Iwlmi3S-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: section .text VMA [0000000000003000,0000000002141037] overlaps section .data VMA [0000000000000000,0000000000b9c51b]
   xtensa-linux-ld: section .init.data VMA [0000000000b9c520,0000000000bda84b] overlaps section .text VMA [0000000000003000,0000000002141037]
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1423:(.exception.text+0x21b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0x12c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
>> include/linux/overflow.h:53:(.xiptext+0x163): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   include/linux/overflow.h:53:(.xiptext+0x17b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/slab.h:909:(.xiptext+0x196): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x1c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x1d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x1ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x427): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x43c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x452): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x468): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x472): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x80)
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x47e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x80)
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0x4a9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x503): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x140)
   drivers/mtd/chips/cfi_probe.c:273:(.xiptext+0x512): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x140)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x60e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x650): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:143:(.xiptext+0x738): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:155:(.xiptext+0x778): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:170:(.xiptext+0x7dd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0x5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x6c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:228:(.xiptext+0x7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:250:(.xiptext+0x190): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:251:(.xiptext+0x1a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:256:(.xiptext+0x1e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:257:(.xiptext+0x1f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:258:(.xiptext+0x20b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:262:(.xiptext+0x244): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x25a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:267:(.xiptext+0x296): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:268:(.xiptext+0x2ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:269:(.xiptext+0x2c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x2d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:274:(.xiptext+0x314): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:275:(.xiptext+0x32b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:276:(.xiptext+0x340): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:277:(.xiptext+0x356): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:288:(.xiptext+0x3e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:289:(.xiptext+0x3f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:293:(.xiptext+0x436): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   include/linux/slab.h:909:(.xiptext+0x4c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:316:(.xiptext+0x4ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_util.c:333:(.xiptext+0x534): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:951:(.text+0xf32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x48)
   drivers/mtd/chips/cfi_cmdset_0002.c:915:(.text+0x1032): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x48)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   arch/xtensa/include/uapi/asm/swab.h:60:(.text+0x1a6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x48)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2766:(.text+0x1aaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x34c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2621:(.text+0x1b9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xb9c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:622:(.text+0x1da6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.c:807:(.text+0x22e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x48)
   drivers/mtd/chips/cfi_cmdset_0002.c:758:(.text+0x2336): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x48)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2260:(.text+0x24d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x48)
   drivers/mtd/chips/cfi_cmdset_0002.c:2265:(.text+0x2520): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x48)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.text+0x2f04): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1380)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1838:(.text+0x31f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1380)
   drivers/mtd/chips/cfi_cmdset_0002.c:1866:(.text+0x3337): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1380)
   drivers/mtd/chips/cfi_cmdset_0002.c:1909:(.text+0x3548): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1380)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2109:(.text+0x3746): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x18b0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_read_secsi_onechip':
   drivers/mtd/chips/cfi_cmdset_0002.c:1304:(.text+0x3b7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1341:(.text+0x3c04): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1425:(.text+0x422f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x48)
   drivers/mtd/chips/cfi_cmdset_0002.c:1430:(.text+0x426b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x34c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x74): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0x8f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x1e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x1f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x20a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x267): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1040:(.xiptext+0x290): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x362): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x3c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x456): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x498): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1105:(.xiptext+0x4b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x4c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1108:(.xiptext+0x4d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x4e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested


vim +53 include/linux/overflow.h

f0907827a8a9152 Rasmus Villemoes 2018-05-08  45  
9b80e4c4ddaca35 Kees Cook        2020-08-12  46  /*
9b80e4c4ddaca35 Kees Cook        2020-08-12  47   * Allows for effectively applying __must_check to a macro so we can have
9b80e4c4ddaca35 Kees Cook        2020-08-12  48   * both the type-agnostic benefits of the macros while also being able to
9b80e4c4ddaca35 Kees Cook        2020-08-12  49   * enforce that the return value is, in fact, checked.
9b80e4c4ddaca35 Kees Cook        2020-08-12  50   */
9b80e4c4ddaca35 Kees Cook        2020-08-12  51  static inline bool __must_check __must_check_overflow(bool overflow)
9b80e4c4ddaca35 Kees Cook        2020-08-12  52  {
9b80e4c4ddaca35 Kees Cook        2020-08-12 @53  	return unlikely(overflow);
9b80e4c4ddaca35 Kees Cook        2020-08-12  54  }
9b80e4c4ddaca35 Kees Cook        2020-08-12  55  

:::::: The code at line 53 was first introduced by commit
:::::: 9b80e4c4ddaca3501177ed41e49d0928ba2122a8 overflow: Add __must_check attribute to check_*() helpers

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
