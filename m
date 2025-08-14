Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F83922A4F8
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154055; cv=none; b=fHuvboNzyzDP63uwnBveSlZfqosayWo/tXtNiTRSBM0JdqtUu3WV9kgDzYohMrTwwl7X/DYGMrbQb2kpjpOfVjKDtdNOyMZL1ZvV1eMz0CRwk+Q/Ezw2h6WWuZuP5h7iSC8n7d0K4ZWDiXWdY0VYp11D/XaRhY1iNf427U6F3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154055; c=relaxed/simple;
	bh=dPm2m5xMJkgthcewVFIY0Mb5VzhbvT1bZ7hK5vwi9+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bV+UYv7/oLxKNfabMrmhBBOuI6F2kuP+CzS417D2cV2J95qyd4jeeJFFk9ULzutWWZJb1nGQd/F0CpulWRuUZqJJOIPQLScmAFJ2r8tQ4qSRYiSimpnPRFHcVa/UxKJJmBc4j65ty0tb1870kSOdRy9Du6VMDuxBQUUT/mDQHuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gl9uPmBk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gl9uPmBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755154052; x=1786690052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPm2m5xMJkgthcewVFIY0Mb5VzhbvT1bZ7hK5vwi9+Y=;
  b=Gl9uPmBknnssoyp8F70Jrp9c1fwD6Zsclt9Eqw9txCNqEZe42KwZwRxA
   vrZ8lVw1HJRJE1pVhpZjAAMxK5hL1ANyo6mVWbpNxLsPUAZceHC/iPyF5
   qZFCbNQruUt+NvD3tK+gq4IsAaVheI/Q/BwbvH2IwvrJ4YN2o6ovfgBcb
   /ef5gH2finAbxxy57nQe6WczH45ixNEvWHwQ172qgt1Lqj13bJFlv2gFR
   42UgVLhe3kmEz+rlToWZPXIsi7OwBbN48bwrjFqOFHQuY8fRWyFmy0NSG
   EHfN5UbkrzxwimsfOhIesEQI1L1o/OO41wBnOskBe1UkC/Lb7+5wKzPMA
   w==;
X-CSE-ConnectionGUID: d9GovLOCSrCMdOpCYJj4IQ==
X-CSE-MsgGUID: 8WscBvgDTe23UNpXLv+xzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68837996"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68837996"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 23:47:31 -0700
X-CSE-ConnectionGUID: vcUmHkoQTSa3gfhleDZfkQ==
X-CSE-MsgGUID: UqCuC6gWSiy6ajvlUd/ufA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="165863479"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Aug 2025 23:47:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umRkE-000AfX-1K;
	Thu, 14 Aug 2025 06:47:26 +0000
Date: Thu, 14 Aug 2025 14:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x4f6): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 __trace_set_current_state
Message-ID: <202508141430.1zs50YvS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gabriele Monaco <gmonaco@redhat.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dfc0f6373094dd88e1eaf76c44f2ff01b65db851
commit: 26f80681a09b95fd64bcf33d02e258e78a30842b sched: Add sched tracepoints for RV task model
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: xtensa-randconfig-r122-20250813 (https://download.01.org/0day-ci/archive/20250814/202508141430.1zs50YvS-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250814/202508141430.1zs50YvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508141430.1zs50YvS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x4c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x4db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x4e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x4f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x50b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x558): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x563): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x576): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x58b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x5d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x5e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:325:(.xiptext+0x5fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:327:(.xiptext+0x616): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:330:(.xiptext+0x624): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x678): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:327:(.xiptext+0x690): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:330:(.xiptext+0x6a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x6f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x70b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:309:(.xiptext+0x71a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   include/linux/mtd/cfi.h:309:(.xiptext+0x725): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:311:(.xiptext+0x732): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:314:(.xiptext+0x742): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x4)
   include/linux/mtd/cfi.h:314:(.xiptext+0x74a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x756): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:314:(.xiptext+0x760): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:320:(.xiptext+0x76b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/cfi.h:320:(.xiptext+0x778): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/uapi/asm/swab.h:24:(.xiptext+0x782): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:309:(.xiptext+0x79e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/uapi/asm/swab.h:60:(.xiptext+0x7d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   include/linux/mtd/cfi.h:320:(.xiptext+0x7ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   include/linux/mtd/cfi.h:320:(.xiptext+0x808): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:276:(.xiptext+0x81e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   arch/xtensa/include/asm/irqflags.h:61:(.xiptext+0x83d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:85:(.xiptext+0x84c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:86:(.xiptext+0x85f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x870): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x89a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x8f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x905): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x910): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x91f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x92c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:286:(.xiptext+0x950): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kcsan_check_access
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x978): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:102:(.xiptext+0x982): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x99a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   arch/xtensa/include/asm/irqflags.h:22:(.xiptext+0x9a9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x9b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:115:(.xiptext+0x9bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x9cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x9d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   arch/xtensa/include/asm/irqflags.h:61:(.xiptext+0x9ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `fixup_use_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:282:(.text+0x10bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:515:(.text+0x160b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13c)
   drivers/mtd/chips/cfi_cmdset_0002.c:658:(.text+0x164e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13c)
   drivers/mtd/chips/cfi_cmdset_0002.c:707:(.text+0x183c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13c)
   drivers/mtd/chips/cfi_cmdset_0002.c:707:(.text+0x1853): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2216:(.text+0x1c1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2263:(.text+0x1d14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_atmel_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2637:(.text+0x26f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2642:(.text+0x272e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x2bc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:2372:(.text+0x3578): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xdd8)
   drivers/mtd/chips/cfi_cmdset_0002.c:2398:(.text+0x3667): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xdd8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_ppb_unlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2846:(.text+0x380a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xdd8)
   drivers/mtd/chips/cfi_cmdset_0002.c:2899:(.text+0x39b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe58)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_secsi_read':
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.text+0x3d5c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xdd8)
   drivers/mtd/chips/cfi_cmdset_0002.c:1304:(.text+0x3df4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1680)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1823:(.text+0x3fdc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x13c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1825:(.text+0x4010): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x2bc)
   drivers/mtd/chips/cfi_cmdset_0002.c:1865:(.text+0x41d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
>> include/linux/mtd/map.h:330:(.text+0x425f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x43): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x4f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x78): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0xa2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0xc0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0xd3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2012:(.xiptext+0xe2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2012:(.xiptext+0xf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x106): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x113): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1032:(.xiptext+0x124): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x142): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1036:(.xiptext+0x150): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1038:(.xiptext+0x15e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1040:(.xiptext+0x172): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x188): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x193): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x19f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x1ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:834:(.xiptext+0x1c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x1cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:126:(.xiptext+0x1f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x206): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0x220): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:846:(.xiptext+0x24e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:846:(.xiptext+0x25a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x2c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   drivers/mtd/chips/cfi_cmdset_0002.c:865:(.xiptext+0x2d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x2e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x320): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x332): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x35b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x36c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x397): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:872:(.xiptext+0x3ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x3d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x3e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x406): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x413): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   drivers/mtd/chips/cfi_cmdset_0002.c:1068:(.xiptext+0x427): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1068:(.xiptext+0x436): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1068:(.xiptext+0x447): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1068:(.xiptext+0x458): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x466): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x472): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x47a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1069:(.xiptext+0x4a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x4bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1093:(.xiptext+0x4cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1097:(.xiptext+0x4d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1097:(.xiptext+0x4e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
>> drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x4f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1081:(.xiptext+0x504): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1100:(.xiptext+0x50e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1101:(.xiptext+0x51c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1101:(.xiptext+0x524): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x52a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x536): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x540): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x548): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x56e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x57e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x19c4)
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x586): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x59b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x5b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x60c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x616): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x624): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x63f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1124:(.xiptext+0x648): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x652): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x65e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x672): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x67a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1130:(.xiptext+0x684): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1132:(.xiptext+0x68f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1133:(.xiptext+0x6a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1134:(.xiptext+0x6af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1143:(.xiptext+0x6cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x6da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x6f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x704): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x716): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x72f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x73b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x746): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x754): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x766): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x774): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x77e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x78f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1648:(.xiptext+0x79e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x7a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x7af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x7b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x7c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x7d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0x803): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0x80c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0x827): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0x848): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb0c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1668:(.xiptext+0x88a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1673:(.xiptext+0x896): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0x8a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x8b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x8ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_cmdset_0002.c:1677:(.xiptext+0x8e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
>> include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x8ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0x8fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x908): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
>> arch/xtensa/include/asm/current.h:24:(.xiptext+0x91a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1680:(.xiptext+0x928): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1680:(.xiptext+0x932): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1681:(.xiptext+0x943): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1683:(.xiptext+0x952): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1684:(.xiptext+0x958): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1684:(.xiptext+0x963): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1685:(.xiptext+0x96b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0x97a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1693:(.xiptext+0x988): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1025:(.xiptext+0x9ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1026:(.xiptext+0x9cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb0c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xa02): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xa0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xa22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xa2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xa3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xa52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xa5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xa67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xa73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0xa87): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1949:(.xiptext+0xa8f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   include/linux/jiffies.h:587:(.xiptext+0xa9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1950:(.xiptext+0xaa7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0xabc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0xac4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0xad0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0xadc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0xaf2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0xafb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
>> include/linux/atomic/atomic-arch-fallback.h:457:(.xiptext+0xb08): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0xb1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0xb28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1958:(.xiptext+0xb3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1a4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1958:(.xiptext+0xb47): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1962:(.xiptext+0xb70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1963:(.xiptext+0xb7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b78)
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0xb8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1972:(.xiptext+0xb9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0xbae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1979:(.xiptext+0xbbe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1979:(.xiptext+0xbca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0xbd8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xbee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xbf7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xc03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xc0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xc23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xc2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xc37): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0xc43): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xc5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1740:(.xiptext+0xc63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1293:(.xiptext+0xc6f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.xiptext+0xcb0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0xcc0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0xcd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0xce7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0xcfc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0xd0c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1301:(.xiptext+0xd20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1301:(.xiptext+0xd34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1301:(.xiptext+0xd4f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1304:(.xiptext+0xd74): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xd83): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xd8f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xdde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xdeb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0xe04): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1280:(.xiptext+0xe60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1280:(.xiptext+0xe6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1280:(.xiptext+0xe84): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1280:(.xiptext+0xe94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b78)
   drivers/mtd/chips/cfi_cmdset_0002.c:1282:(.xiptext+0xea2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1282:(.xiptext+0xeb3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1282:(.xiptext+0xec2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1284:(.xiptext+0xed6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_cmdset_0002.c:1284:(.xiptext+0xef2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_cmdset_0002.c:1287:(.xiptext+0xf19): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x394)
   drivers/mtd/chips/cfi_cmdset_0002.c:1733:(.xiptext+0xf24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1733:(.xiptext+0xf3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1733:(.xiptext+0xf47): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1733:(.xiptext+0xf63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1753:(.xiptext+0xf78): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1765:(.xiptext+0xf93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1765:(.xiptext+0xf9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0xfaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1767:(.xiptext+0xfba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1768:(.xiptext+0xfd3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0xfde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1771:(.xiptext+0xfec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1772:(.xiptext+0xff7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1025:(.xiptext+0x100f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   arch/xtensa/include/asm/irqflags.h:75:(.xiptext+0x101c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x102b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x1040): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x104c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x105b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1782:(.xiptext+0x106b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1785:(.xiptext+0x107c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1788:(.xiptext+0x109a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:1788:(.xiptext+0x10ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:1798:(.xiptext+0x10cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read_range
   drivers/mtd/chips/cfi_cmdset_0002.c:1802:(.xiptext+0x10f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1807:(.xiptext+0x110a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x112e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x113f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x1150): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x115f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x1196): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x11a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x11b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1a4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1810:(.xiptext+0x11be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2021:(.xiptext+0x11f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2030:(.xiptext+0x1203): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_cmdset_0002.c:2031:(.xiptext+0x1223): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2033:(.xiptext+0x122f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2037:(.xiptext+0x123b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   include/linux/mtd/map.h:325:(.xiptext+0x124a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/map.h:328:(.xiptext+0x1267): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/map.h:330:(.xiptext+0x127c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
>> include/linux/mtd/map.h:330:(.xiptext+0x128a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b78)
>> include/linux/mtd/map.h:330:(.xiptext+0x1296): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
>> include/linux/mtd/map.h:330:(.xiptext+0x12a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x12bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x12c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2042:(.xiptext+0x12de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2043:(.xiptext+0x12f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1025:(.xiptext+0x130f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:2046:(.xiptext+0x135a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2047:(.xiptext+0x1366): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2047:(.xiptext+0x1370): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2047:(.xiptext+0x1388): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2047:(.xiptext+0x1390): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2047:(.xiptext+0x139c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2050:(.xiptext+0x13a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2050:(.xiptext+0x13bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2050:(.xiptext+0x13c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2052:(.xiptext+0x13d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2055:(.xiptext+0x13dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2056:(.xiptext+0x13f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2056:(.xiptext+0x13fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2059:(.xiptext+0x1407): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2059:(.xiptext+0x1412): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   include/linux/mtd/map.h:326:(.xiptext+0x142a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   include/linux/mtd/map.h:326:(.xiptext+0x1432): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/map.h:328:(.xiptext+0x143e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/map.h:328:(.xiptext+0x1448): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   include/linux/mtd/map.h:330:(.xiptext+0x145e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   include/linux/mtd/map.h:330:(.xiptext+0x1468): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2061:(.xiptext+0x147e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2061:(.xiptext+0x148a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   drivers/mtd/chips/cfi_cmdset_0002.c:2059:(.xiptext+0x149f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2059:(.xiptext+0x14aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2071:(.xiptext+0x14b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2071:(.xiptext+0x14d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2074:(.xiptext+0x14e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2074:(.xiptext+0x14f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2078:(.xiptext+0x1506): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:2080:(.xiptext+0x1514): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2084:(.xiptext+0x151e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2085:(.xiptext+0x1530): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2085:(.xiptext+0x1538): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2086:(.xiptext+0x153e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2087:(.xiptext+0x154a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x1556): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x1561): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x156f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x157e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write1
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x15a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb0c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x15bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_volatile_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x15d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x15eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x15fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x1604): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x1628): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x163c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x1652): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1a4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x165a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x1686): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2512:(.xiptext+0x1697): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write_range
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x16b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2514:(.xiptext+0x16c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   arch/xtensa/include/asm/current.h:24:(.xiptext+0x16cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_write4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2514:(.xiptext+0x16de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   include/linux/mtd/map.h:381:(.xiptext+0x1703): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2519:(.xiptext+0x1716): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2521:(.xiptext+0x1724): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b78)
   drivers/mtd/chips/cfi_cmdset_0002.c:2522:(.xiptext+0x1732): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2524:(.xiptext+0x173f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read1
   drivers/mtd/chips/cfi_cmdset_0002.c:2528:(.xiptext+0x1750): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2528:(.xiptext+0x1762): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2531:(.xiptext+0x176b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2531:(.xiptext+0x177c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2532:(.xiptext+0x1792): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:1025:(.xiptext+0x17a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2546:(.xiptext+0x17c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:2536:(.xiptext+0x17fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2536:(.xiptext+0x180a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2536:(.xiptext+0x1814): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2536:(.xiptext+0x182c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2536:(.xiptext+0x1834): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2537:(.xiptext+0x1840): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2537:(.xiptext+0x184a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2537:(.xiptext+0x1860): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2537:(.xiptext+0x1868): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2538:(.xiptext+0x1876): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2538:(.xiptext+0x1880): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2538:(.xiptext+0x1898): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2538:(.xiptext+0x18a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0x18ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0x18b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0x18d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2540:(.xiptext+0x18d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __tsan_read4


vim +1098 drivers/mtd/chips/cfi_cmdset_0002.c

02b15e343aeefb Todd Poynor      2005-06-07  1042  
02b15e343aeefb Todd Poynor      2005-06-07  1043  /*
02b15e343aeefb Todd Poynor      2005-06-07  1044   * When a delay is required for the flash operation to complete, the
02b15e343aeefb Todd Poynor      2005-06-07  1045   * xip_udelay() function is polling for both the given timeout and pending
02b15e343aeefb Todd Poynor      2005-06-07  1046   * (but still masked) hardware interrupts.  Whenever there is an interrupt
02b15e343aeefb Todd Poynor      2005-06-07  1047   * pending then the flash erase operation is suspended, array mode restored
02b15e343aeefb Todd Poynor      2005-06-07  1048   * and interrupts unmasked.  Task scheduling might also happen at that
02b15e343aeefb Todd Poynor      2005-06-07  1049   * point.  The CPU eventually returns from the interrupt or the call to
02b15e343aeefb Todd Poynor      2005-06-07  1050   * schedule() and the suspended flash operation is resumed for the remaining
02b15e343aeefb Todd Poynor      2005-06-07  1051   * of the delay period.
02b15e343aeefb Todd Poynor      2005-06-07  1052   *
02b15e343aeefb Todd Poynor      2005-06-07  1053   * Warning: this function _will_ fool interrupt latency tracing tools.
02b15e343aeefb Todd Poynor      2005-06-07  1054   */
02b15e343aeefb Todd Poynor      2005-06-07  1055  
02b15e343aeefb Todd Poynor      2005-06-07  1056  static void __xipram xip_udelay(struct map_info *map, struct flchip *chip,
02b15e343aeefb Todd Poynor      2005-06-07  1057  				unsigned long adr, int usec)
02b15e343aeefb Todd Poynor      2005-06-07  1058  {
02b15e343aeefb Todd Poynor      2005-06-07  1059  	struct cfi_private *cfi = map->fldrv_priv;
02b15e343aeefb Todd Poynor      2005-06-07  1060  	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
02b15e343aeefb Todd Poynor      2005-06-07  1061  	map_word status, OK = CMD(0x80);
02b15e343aeefb Todd Poynor      2005-06-07  1062  	unsigned long suspended, start = xip_currtime();
02b15e343aeefb Todd Poynor      2005-06-07  1063  	flstate_t oldstate;
02b15e343aeefb Todd Poynor      2005-06-07  1064  
02b15e343aeefb Todd Poynor      2005-06-07  1065  	do {
02b15e343aeefb Todd Poynor      2005-06-07  1066  		cpu_relax();
02b15e343aeefb Todd Poynor      2005-06-07  1067  		if (xip_irqpending() && extp &&
02b15e343aeefb Todd Poynor      2005-06-07 @1068  		    ((chip->state == FL_ERASING && (extp->EraseSuspend & 2))) &&
02b15e343aeefb Todd Poynor      2005-06-07  1069  		    (cfi_interleave_is_1(cfi) || chip->oldstate == FL_READY)) {
02b15e343aeefb Todd Poynor      2005-06-07  1070  			/*
02b15e343aeefb Todd Poynor      2005-06-07  1071  			 * Let's suspend the erase operation when supported.
02b15e343aeefb Todd Poynor      2005-06-07  1072  			 * Note that we currently don't try to suspend
02b15e343aeefb Todd Poynor      2005-06-07  1073  			 * interleaved chips if there is already another
02b15e343aeefb Todd Poynor      2005-06-07  1074  			 * operation suspended (imagine what happens
02b15e343aeefb Todd Poynor      2005-06-07  1075  			 * when one chip was already done with the current
02b15e343aeefb Todd Poynor      2005-06-07  1076  			 * operation while another chip suspended it, then
02b15e343aeefb Todd Poynor      2005-06-07  1077  			 * we resume the whole thing at once).  Yes, it
02b15e343aeefb Todd Poynor      2005-06-07  1078  			 * can happen!
02b15e343aeefb Todd Poynor      2005-06-07  1079  			 */
02b15e343aeefb Todd Poynor      2005-06-07  1080  			map_write(map, CMD(0xb0), adr);
02b15e343aeefb Todd Poynor      2005-06-07  1081  			usec -= xip_elapsed_since(start);
02b15e343aeefb Todd Poynor      2005-06-07  1082  			suspended = xip_currtime();
02b15e343aeefb Todd Poynor      2005-06-07  1083  			do {
02b15e343aeefb Todd Poynor      2005-06-07  1084  				if (xip_elapsed_since(suspended) > 100000) {
02b15e343aeefb Todd Poynor      2005-06-07  1085  					/*
02b15e343aeefb Todd Poynor      2005-06-07  1086  					 * The chip doesn't want to suspend
02b15e343aeefb Todd Poynor      2005-06-07  1087  					 * after waiting for 100 msecs.
02b15e343aeefb Todd Poynor      2005-06-07  1088  					 * This is a critical error but there
02b15e343aeefb Todd Poynor      2005-06-07  1089  					 * is not much we can do here.
02b15e343aeefb Todd Poynor      2005-06-07  1090  					 */
02b15e343aeefb Todd Poynor      2005-06-07  1091  					return;
02b15e343aeefb Todd Poynor      2005-06-07  1092  				}
02b15e343aeefb Todd Poynor      2005-06-07  1093  				status = map_read(map, adr);
02b15e343aeefb Todd Poynor      2005-06-07  1094  			} while (!map_word_andequal(map, status, OK, OK));
02b15e343aeefb Todd Poynor      2005-06-07  1095  
02b15e343aeefb Todd Poynor      2005-06-07  1096  			/* Suspend succeeded */
02b15e343aeefb Todd Poynor      2005-06-07  1097  			oldstate = chip->state;
02b15e343aeefb Todd Poynor      2005-06-07 @1098  			if (!map_word_bitsset(map, status, CMD(0x40)))
02b15e343aeefb Todd Poynor      2005-06-07  1099  				break;
02b15e343aeefb Todd Poynor      2005-06-07  1100  			chip->state = FL_XIP_WHILE_ERASING;
02b15e343aeefb Todd Poynor      2005-06-07  1101  			chip->erase_suspended = 1;
02b15e343aeefb Todd Poynor      2005-06-07  1102  			map_write(map, CMD(0xf0), adr);
02b15e343aeefb Todd Poynor      2005-06-07  1103  			(void) map_read(map, adr);
ca5c23c3b8882d Paulius Zaleckas 2008-02-27  1104  			xip_iprefetch();
02b15e343aeefb Todd Poynor      2005-06-07  1105  			local_irq_enable();
c4e773764cead9 Stefani Seibold  2010-04-18  1106  			mutex_unlock(&chip->mutex);
ca5c23c3b8882d Paulius Zaleckas 2008-02-27  1107  			xip_iprefetch();
02b15e343aeefb Todd Poynor      2005-06-07  1108  			cond_resched();
02b15e343aeefb Todd Poynor      2005-06-07  1109  
02b15e343aeefb Todd Poynor      2005-06-07  1110  			/*
02b15e343aeefb Todd Poynor      2005-06-07  1111  			 * We're back.  However someone else might have
02b15e343aeefb Todd Poynor      2005-06-07  1112  			 * decided to go write to the chip if we are in
02b15e343aeefb Todd Poynor      2005-06-07  1113  			 * a suspended erase state.  If so let's wait
02b15e343aeefb Todd Poynor      2005-06-07  1114  			 * until it's done.
02b15e343aeefb Todd Poynor      2005-06-07  1115  			 */
c4e773764cead9 Stefani Seibold  2010-04-18  1116  			mutex_lock(&chip->mutex);
02b15e343aeefb Todd Poynor      2005-06-07  1117  			while (chip->state != FL_XIP_WHILE_ERASING) {
02b15e343aeefb Todd Poynor      2005-06-07  1118  				DECLARE_WAITQUEUE(wait, current);
02b15e343aeefb Todd Poynor      2005-06-07  1119  				set_current_state(TASK_UNINTERRUPTIBLE);
02b15e343aeefb Todd Poynor      2005-06-07  1120  				add_wait_queue(&chip->wq, &wait);
c4e773764cead9 Stefani Seibold  2010-04-18  1121  				mutex_unlock(&chip->mutex);
02b15e343aeefb Todd Poynor      2005-06-07  1122  				schedule();
02b15e343aeefb Todd Poynor      2005-06-07  1123  				remove_wait_queue(&chip->wq, &wait);
c4e773764cead9 Stefani Seibold  2010-04-18  1124  				mutex_lock(&chip->mutex);
02b15e343aeefb Todd Poynor      2005-06-07  1125  			}
02b15e343aeefb Todd Poynor      2005-06-07  1126  			/* Disallow XIP again */
02b15e343aeefb Todd Poynor      2005-06-07  1127  			local_irq_disable();
02b15e343aeefb Todd Poynor      2005-06-07  1128  
420962884379bd Gerlando Falauto 2012-07-03  1129  			/* Correct Erase Suspend Hangups for M29EW */
420962884379bd Gerlando Falauto 2012-07-03  1130  			cfi_fixup_m29ew_erase_suspend(map, adr);
02b15e343aeefb Todd Poynor      2005-06-07  1131  			/* Resume the write or erase operation */
08968041bef437 Guillaume LECERF 2010-10-26  1132  			map_write(map, cfi->sector_erase_cmd, adr);
02b15e343aeefb Todd Poynor      2005-06-07  1133  			chip->state = oldstate;
02b15e343aeefb Todd Poynor      2005-06-07  1134  			start = xip_currtime();
02b15e343aeefb Todd Poynor      2005-06-07  1135  		} else if (usec >= 1000000/HZ) {
02b15e343aeefb Todd Poynor      2005-06-07  1136  			/*
02b15e343aeefb Todd Poynor      2005-06-07  1137  			 * Try to save on CPU power when waiting delay
02b15e343aeefb Todd Poynor      2005-06-07  1138  			 * is at least a system timer tick period.
02b15e343aeefb Todd Poynor      2005-06-07  1139  			 * No need to be extremely accurate here.
02b15e343aeefb Todd Poynor      2005-06-07  1140  			 */
02b15e343aeefb Todd Poynor      2005-06-07  1141  			xip_cpu_idle();
02b15e343aeefb Todd Poynor      2005-06-07  1142  		}
02b15e343aeefb Todd Poynor      2005-06-07  1143  		status = map_read(map, adr);
02b15e343aeefb Todd Poynor      2005-06-07  1144  	} while (!map_word_andequal(map, status, OK, OK)
02b15e343aeefb Todd Poynor      2005-06-07  1145  		 && xip_elapsed_since(start) < usec);
02b15e343aeefb Todd Poynor      2005-06-07  1146  }
02b15e343aeefb Todd Poynor      2005-06-07  1147  

:::::: The code at line 1098 was first introduced by commit
:::::: 02b15e343aeefb49f8cac949be599d78250a568f [MTD] XIP for AMD CFI flash.

:::::: TO: Todd Poynor <tpoynor@mvista.com>
:::::: CC: Thomas Gleixner <tglx@mtd.linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
