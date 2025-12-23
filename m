Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FD82DEA90
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 13:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498387; cv=none; b=DZD/yfdzL4NBMkYmYaEUyRI8RnJTX/N/aEWyFWcc29KEvVmQwv3EGo9omW4eyxpohHwk0A1wdmu4wHXZzdXY6KJlkpEclf+vUtp/vem3VLylfdn+wucky6hbX3jV4kcSuxxiLSjHUVkV8jhie6myVd1C4OI7HQi4BFFppjqOTHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498387; c=relaxed/simple;
	bh=dRr2romA6tcePCnpdjad8WiONENOHOS/GOFpe4ei4Es=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hLKnz8CELc9JBVdcbogGxiz6eeaD83JmTAPOVYVujbTjXao+rkiEe8FsWPW9pe8sFJuOYKWPKZMtFpynZ5JptcT0ebrD0ytCCQ4j3aPfFZaBE4I05R6DsMVl5aikrLcOtrRaeIxyIHa0hGmE9QB+wnb6+Y3n7kYqunW6ZhAfN0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNmZ5Ogs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNmZ5Ogs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766498383; x=1798034383;
  h=date:from:to:cc:subject:message-id;
  bh=dRr2romA6tcePCnpdjad8WiONENOHOS/GOFpe4ei4Es=;
  b=kNmZ5OgsWxRtbht8cY7AlSJgbWif9vniThtnodaZKZQdQKWdMOBcDAFQ
   pnR1vIhvSnq6bGgm5Yt+wyse0NVV2T3A02d73glX8NOgN1u+V7Lt2Umnq
   2NH1C8lZZgWNcB8nCTA0T5VCARv8gnvTEtCPCRDNjLYePsdjVXjzSMMuq
   8yZFmv7qssXYDzaIG9WzFICp0wQkvm8F4se5LOavVrzjb97FGhs3vm+TY
   uU1BdDBxJFlb2z1wx5l4x51Ma3hgO3e1b6hxhgfDUpxwh+B29yef7iHc7
   Z2X2ROGyjVMAQnpMq/21FWYvAoveRJU3JgU6MkBXzuXFz1uKZV5oXkNi4
   g==;
X-CSE-ConnectionGUID: las4blD1QPW/hDqE/BhS9A==
X-CSE-MsgGUID: RbIa5VNjTDiD8nPYgsPXmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68102035"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68102035"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:59:37 -0800
X-CSE-ConnectionGUID: KpKzuk/zQKCcAunL9eHB3Q==
X-CSE-MsgGUID: CFNaPK8ASpKr2oNcnMWZZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="223267049"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 05:59:34 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2uV-00000000207-1PHB;
	Tue, 23 Dec 2025 13:58:57 +0000
Date: Tue, 23 Dec 2025 21:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/chips/cfi_cmdset_0002.c:601:(.text+0x6f7):
 dangerous relocation: windowed longcall crosses 1GB boundary; return may
 fail: cfi_read_pri
Message-ID: <202512232143.Ce0kAuXd-lkp@intel.com>
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
TO: Jocelyn Falempe <jfalempe@redhat.com>
CC: John Ogness <john.ogness@linutronix.de>
CC: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: f7b42442c4ac142ab5e261858cec48eb6c9c1567 drm/log: Introduce a new boot logger to draw the kmsg on the screen
date:   1 year ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year ago
config: xtensa-randconfig-r052-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232143.Ce0kAuXd-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232143.Ce0kAuXd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512232143.Ce0kAuXd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0x1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `inline_map_read':
   include/asm-generic/io.h:133:(.xiptext+0xab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0xf0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x106): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:250:(.xiptext+0x12e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:251:(.xiptext+0x143): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:252:(.xiptext+0x158): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:257:(.xiptext+0x17c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:258:(.xiptext+0x193): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:262:(.xiptext+0x1b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x1ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:264:(.xiptext+0x1e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:267:(.xiptext+0x1f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:269:(.xiptext+0x21c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x233): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:271:(.xiptext+0x248): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:274:(.xiptext+0x25e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:276:(.xiptext+0x28c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:277:(.xiptext+0x2a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:288:(.xiptext+0x2d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x310): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.c:294:(.xiptext+0x32c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_query':
   include/linux/mtd/cfi.h:314:(.xiptext+0x3e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   include/linux/mtd/cfi.h:314:(.xiptext+0x3ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_read.isra.0.part.0':
>> drivers/mtd/chips/cfi_cmdset_0002.c:601:(.text+0x6f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_enter':
   drivers/mtd/chips/cfi_cmdset_0002.c:1284:(.text+0xf97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_exit':
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.text+0xffb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_check_err_status':
   drivers/mtd/chips/cfi_cmdset_0002.c:146:(.text+0x111c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2179:(.text+0x112e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `__udelay':
   arch/xtensa/include/asm/delay.h:43:(.text+0x1332): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `__raw_writew':
>> include/asm-generic/io.h:160:(.text+0x1410): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_atmel_unlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2681:(.text+0x1872): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_atmel_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2636:(.text+0x18f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_copy_from':
   include/linux/mtd/map.h:435:(.text+0x20ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x730)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:2350:(.text+0x2237): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe0)
   drivers/mtd/chips/cfi_cmdset_0002.c:2349:(.text+0x224f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x33c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1439:(.text+0x247a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf84)
   drivers/mtd/chips/cfi_cmdset_0002.c:1426:(.text+0x264a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf84)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_enter':
   drivers/mtd/chips/cfi_cmdset_0002.c:1287:(.text+0x2712): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf84)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1815:(.text+0x2873): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf84)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1844:(.text+0x2967): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa9c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_read':
   include/linux/mtd/map.h:397:(.text+0x2bee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load_partial':
   include/linux/mtd/map.h:352:(.text+0x2c06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x33c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x62): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_write':
   include/linux/mtd/map.h:416:(.xiptext+0x98): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5b4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_read':
   include/linux/mtd/map.h:395:(.xiptext+0xcc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5b4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `__raw_readw':
   include/asm-generic/io.h:125:(.xiptext+0xd2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_use_status_reg':
   drivers/mtd/chips/cfi_cmdset_0002.c:125:(.xiptext+0x11b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `__raw_readb':
   include/asm-generic/io.h:117:(.xiptext+0x150): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5b4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   drivers/mtd/chips/cfi_cmdset_0002.c:869:(.xiptext+0x1ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1718:(.xiptext+0x1fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12d0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1718:(.xiptext+0x20a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1723:(.xiptext+0x22c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1726:(.xiptext+0x240): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_enter':
   drivers/mtd/chips/cfi_cmdset_0002.c:1280:(.xiptext+0x256): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1287:(.xiptext+0x292): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0x2a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0x2bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_exit':
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.xiptext+0x2d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0x2fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x123c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0x303): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1747:(.xiptext+0x356): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1060:(.xiptext+0x3c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x408): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5b4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_write':
   include/linux/mtd/map.h:413:(.xiptext+0x459): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5b4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `__raw_writel':
   include/asm-generic/io.h:168:(.xiptext+0x47e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x4fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x512): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_write':
   include/linux/mtd/map.h:415:(.xiptext+0x520): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   include/linux/mtd/map.h:416:(.xiptext+0x526): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   include/linux/mtd/map.h:417:(.xiptext+0x532): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `_cond_resched':
   include/linux/sched.h:2066:(.xiptext+0x59e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x5a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x5ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x5b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x5c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x5ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x617): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x11e0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_write':
   include/linux/mtd/map.h:414:(.xiptext+0x6af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1141:(.xiptext+0x6f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `inline_map_write':
   include/linux/mtd/map.h:413:(.xiptext+0x778): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   include/linux/mtd/map.h:413:(.xiptext+0x786): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x12d0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x7b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xd18)
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x7cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x7e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2414:(.xiptext+0x7f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2410:(.xiptext+0x80e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_ff':
   include/linux/mtd/map.h:381:(.xiptext+0x823): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2417:(.xiptext+0x837): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd


vim +601 drivers/mtd/chips/cfi_cmdset_0002.c

420962884379bd Gerlando Falauto    2012-07-03  599  
^1da177e4c3f41 Linus Torvalds      2005-04-16  600  struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
^1da177e4c3f41 Linus Torvalds      2005-04-16 @601  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  602  	struct cfi_private *cfi = map->fldrv_priv;
1648eaaa1575ea Stefan Roese        2013-01-18  603  	struct device_node __maybe_unused *np = map->device_node;
^1da177e4c3f41 Linus Torvalds      2005-04-16  604  	struct mtd_info *mtd;
^1da177e4c3f41 Linus Torvalds      2005-04-16  605  	int i;
^1da177e4c3f41 Linus Torvalds      2005-04-16  606  
95b93a0cd46682 Burman Yan          2006-11-15  607  	mtd = kzalloc(sizeof(*mtd), GFP_KERNEL);
5c8b1fbb2e1bfa Jingoo Han          2014-02-06  608  	if (!mtd)
^1da177e4c3f41 Linus Torvalds      2005-04-16  609  		return NULL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  610  	mtd->priv = map;
^1da177e4c3f41 Linus Torvalds      2005-04-16  611  	mtd->type = MTD_NORFLASH;
^1da177e4c3f41 Linus Torvalds      2005-04-16  612  
^1da177e4c3f41 Linus Torvalds      2005-04-16  613  	/* Fill in the default mtd operations */
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  614  	mtd->_erase   = cfi_amdstd_erase_varsize;
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  615  	mtd->_write   = cfi_amdstd_write_words;
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  616  	mtd->_read    = cfi_amdstd_read;
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  617  	mtd->_sync    = cfi_amdstd_sync;
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  618  	mtd->_suspend = cfi_amdstd_suspend;
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  619  	mtd->_resume  = cfi_amdstd_resume;
dc7e9ecdd6a41e Christian Riesch    2014-03-06  620  	mtd->_read_user_prot_reg = cfi_amdstd_read_user_prot_reg;
dc7e9ecdd6a41e Christian Riesch    2014-03-06  621  	mtd->_read_fact_prot_reg = cfi_amdstd_read_fact_prot_reg;
dc7e9ecdd6a41e Christian Riesch    2014-03-06  622  	mtd->_get_fact_prot_info = cfi_amdstd_get_fact_prot_info;
dc7e9ecdd6a41e Christian Riesch    2014-03-06  623  	mtd->_get_user_prot_info = cfi_amdstd_get_user_prot_info;
af7447505732ea Christian Riesch    2014-03-06  624  	mtd->_write_user_prot_reg = cfi_amdstd_write_user_prot_reg;
4f5cb243823b3a Christian Riesch    2014-03-06  625  	mtd->_lock_user_prot_reg = cfi_amdstd_lock_user_prot_reg;
^1da177e4c3f41 Linus Torvalds      2005-04-16  626  	mtd->flags   = MTD_CAP_NORFLASH;
^1da177e4c3f41 Linus Torvalds      2005-04-16  627  	mtd->name    = map->name;
783ed81ff39d3f Artem B. Bityutskiy 2006-06-14  628  	mtd->writesize = 1;
13ce77f46c79a3 Anatolij Gustschin  2011-02-10  629  	mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
d261c72ae03066 Anatolij Gustschin  2010-12-16  630  
0a32a10264d151 Brian Norris        2011-07-19  631  	pr_debug("MTD %s(): write buffer size %d\n", __func__,
0a32a10264d151 Brian Norris        2011-07-19  632  			mtd->writebufsize);
^1da177e4c3f41 Linus Torvalds      2005-04-16  633  
3c3c10bba1e4cc Artem Bityutskiy    2012-01-30  634  	mtd->_panic_write = cfi_amdstd_panic_write;
eafe1311aa3cdb Kevin Cernekee      2010-04-29  635  	mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
eafe1311aa3cdb Kevin Cernekee      2010-04-29  636  
^1da177e4c3f41 Linus Torvalds      2005-04-16  637  	if (cfi->cfi_mode==CFI_MODE_CFI){
^1da177e4c3f41 Linus Torvalds      2005-04-16  638  		unsigned char bootloc;
^1da177e4c3f41 Linus Torvalds      2005-04-16  639  		__u16 adr = primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;
^1da177e4c3f41 Linus Torvalds      2005-04-16  640  		struct cfi_pri_amdstd *extp;
^1da177e4c3f41 Linus Torvalds      2005-04-16  641  
^1da177e4c3f41 Linus Torvalds      2005-04-16  642  		extp = (struct cfi_pri_amdstd*)cfi_read_pri(map, adr, sizeof(*extp), "Amd/Fujitsu");
564b84978df2bf Guillaume LECERF    2010-04-24  643  		if (extp) {
564b84978df2bf Guillaume LECERF    2010-04-24  644  			/*
564b84978df2bf Guillaume LECERF    2010-04-24  645  			 * It's a real CFI chip, not one for which the probe
564b84978df2bf Guillaume LECERF    2010-04-24  646  			 * routine faked a CFI structure.
564b84978df2bf Guillaume LECERF    2010-04-24  647  			 */
fefae48bf8caab Wolfgang Grandegger 2009-01-08  648  			cfi_fixup_major_minor(cfi, extp);
fefae48bf8caab Wolfgang Grandegger 2009-01-08  649  
e17f47a14b3418 Guillaume LECERF    2010-07-02  650  			/*
c9ddab25d1b62b Gernot Hoyler       2011-04-11  651  			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4, 1.5
631dd1a885b6d7 Justin P. Mattock   2010-10-18  652  			 * see: http://cs.ozerki.net/zap/pub/axim-x5/docs/cfi_r20.pdf, page 19
631dd1a885b6d7 Justin P. Mattock   2010-10-18  653  			 *      http://www.spansion.com/Support/AppNotes/cfi_100_20011201.pdf
5da195326b7e22 Guillaume LECERF    2010-08-05  654  			 *      http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf
c9ddab25d1b62b Gernot Hoyler       2011-04-11  655  			 *      http://www.spansion.com/Support/Datasheets/S29GL_128S_01GS_00_02_e.pdf
e17f47a14b3418 Guillaume LECERF    2010-07-02  656  			 */
d88f977b85d251 Todd Poynor         2005-07-20  657  			if (extp->MajorVersion != '1' ||
c9ddab25d1b62b Gernot Hoyler       2011-04-11  658  			    (extp->MajorVersion == '1' && (extp->MinorVersion < '0' || extp->MinorVersion > '5'))) {
d88f977b85d251 Todd Poynor         2005-07-20  659  				printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
e17f47a14b3418 Guillaume LECERF    2010-07-02  660  				       "version %c.%c (%#02x/%#02x).\n",
e17f47a14b3418 Guillaume LECERF    2010-07-02  661  				       extp->MajorVersion, extp->MinorVersion,
e17f47a14b3418 Guillaume LECERF    2010-07-02  662  				       extp->MajorVersion, extp->MinorVersion);
d88f977b85d251 Todd Poynor         2005-07-20  663  				kfree(extp);
d88f977b85d251 Todd Poynor         2005-07-20  664  				kfree(mtd);
d88f977b85d251 Todd Poynor         2005-07-20  665  				return NULL;
d88f977b85d251 Todd Poynor         2005-07-20  666  			}
d88f977b85d251 Todd Poynor         2005-07-20  667  
e17f47a14b3418 Guillaume LECERF    2010-07-02  668  			printk(KERN_INFO "  Amd/Fujitsu Extended Query version %c.%c.\n",
e17f47a14b3418 Guillaume LECERF    2010-07-02  669  			       extp->MajorVersion, extp->MinorVersion);
e17f47a14b3418 Guillaume LECERF    2010-07-02  670  
^1da177e4c3f41 Linus Torvalds      2005-04-16  671  			/* Install our own private info structure */
^1da177e4c3f41 Linus Torvalds      2005-04-16  672  			cfi->cmdset_priv = extp;
^1da177e4c3f41 Linus Torvalds      2005-04-16  673  
^1da177e4c3f41 Linus Torvalds      2005-04-16  674  			/* Apply cfi device specific fixups */
^1da177e4c3f41 Linus Torvalds      2005-04-16  675  			cfi_fixup(mtd, cfi_fixup_table);
^1da177e4c3f41 Linus Torvalds      2005-04-16  676  

:::::: The code at line 601 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
