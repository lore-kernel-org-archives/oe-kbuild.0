Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2E6194C61
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 07:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732607880; cv=none; b=m0zr/ZcvA3j7HQVIxBZnmVssse+jWzll3kTkZOBgxevfM1D2Y8Ns+M3/4bh9DIRDKpP0bRUzUBIx0zTWJCwrFzhN0aX/JP5vE2VS7W1WFc/kywWpIPek1qj0Ujba/iKw+LUGNs/Er28ZyjGomM2xq9lHSlwM+d2cU89ubm4T024=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732607880; c=relaxed/simple;
	bh=xon1bZn5S9Xl2fwCVLMNRfJATKPc4Iu9w5HzdEtXQ9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MReVZLZPCzsr1lEKes1HLl/7kCMfkIhrwrLEQhLLOobvxoMmJWi5xDegR5csHjnYa3hOl7QUvM6FtbBX9AXySe0FMjBmn3cWGOgN99VuW8NdZ3aFSqcgWjeiNzhMP+qfDMEz6LkNCnuz4kUZmC8f8eKfmoOJQjAsi7dhUVhrfB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKpCuQOW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKpCuQOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732607878; x=1764143878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xon1bZn5S9Xl2fwCVLMNRfJATKPc4Iu9w5HzdEtXQ9Y=;
  b=IKpCuQOW6FoIYKru1PbIA69JMrotDWWdf0+zHmV9o6uvfwl2LOuYxRDO
   o/XnJahmoenE2nPYQQurNJ+/zBMunnUTsGJpf1uG3aaDeJVmiFK/EeXyV
   kfO24cM+oqX0b5JAswx3UGsfmZzRb2ESReIfbbu04yJrmz4cMOifI0Pj1
   fZ/DRyI7oipAloXeaYXy8pvGBb7PZ4TTQQ2cXB0mYa5kK6O7GqQhj00X3
   ZsNdvWLUVL40S749GNndrDg++IKmv7LYJsehsDwyuxQoSXAbIziux6jX5
   iOnsiGJ3t8cX+Qfnt74iCs3mlf6y0CKj4O+L5dI6pyDav7ptQJ72Mjw9z
   Q==;
X-CSE-ConnectionGUID: e3hxkdlATgG7n6Xi/9EoUQ==
X-CSE-MsgGUID: 66U7fYtiTx2BX2NSpjG3MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32125148"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="32125148"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 23:57:57 -0800
X-CSE-ConnectionGUID: xYc49TEMSSmqjUtsUqaWsw==
X-CSE-MsgGUID: K4IO3WI8Sge0SMjUK/B76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="91338518"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Nov 2024 23:57:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFqSI-0007A9-0G;
	Tue, 26 Nov 2024 07:57:54 +0000
Date: Tue, 26 Nov 2024 15:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/sched.h:2205:(.xiptext+0x123): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail: warn_slowpath_fmt
Message-ID: <202411261553.LVj7ifpr-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kent Overstreet <kent.overstreet@linux.dev>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Kees Cook <keescook@chromium.org>

Hi Suren,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: xtensa-randconfig-r113-20241114 (https://download.01.org/0day-ci/archive/20241126/202411261553.LVj7ifpr-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241126/202411261553.LVj7ifpr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411261553.LVj7ifpr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `kmalloc_noprof':
   include/linux/slab.h:664:(.xiptext+0x103): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `alloc_tag_restore':
>> include/linux/sched.h:2205:(.xiptext+0x123): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: warn_slowpath_fmt
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x142): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x156): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x164): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x33f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x354): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x368): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x37e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.o: in function `cfi_early_fixup':
   drivers/mtd/chips/cfi_probe.c:86:(.xiptext+0x542): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0x20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:228:(.xiptext+0x3f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:250:(.xiptext+0x14c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:251:(.xiptext+0x162): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:256:(.xiptext+0x18a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:257:(.xiptext+0x19f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:258:(.xiptext+0x1b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:262:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x1ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:267:(.xiptext+0x212): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:268:(.xiptext+0x228): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:269:(.xiptext+0x23e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x254): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:274:(.xiptext+0x278): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:275:(.xiptext+0x28f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:276:(.xiptext+0x2a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:277:(.xiptext+0x2ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:288:(.xiptext+0x300): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:289:(.xiptext+0x316): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:293:(.xiptext+0x34b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `kmalloc_noprof':
   include/linux/slab.h:664:(.xiptext+0x3b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.o: in function `alloc_tag_restore':
   include/linux/sched.h:2205:(.xiptext+0x3d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: warn_slowpath_fmt
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2190:(.text+0x74f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:2207:(.text+0x797): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2271:(.text+0x9fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:2277:(.text+0xa12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0xcf6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0xdb7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2629:(.text+0x126f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xb48)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2768:(.text+0x14b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:2777:(.text+0x14cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x240)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x1c77): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x231c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa94)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x242b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x2497): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x2f88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x68)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x2fa2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x240)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1860:(.text+0x32a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa94)
   drivers/mtd/chips/cfi_cmdset_0002.c:1884:(.text+0x3396): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa94)
   drivers/mtd/chips/cfi_cmdset_0002.c:1927:(.text+0x3523): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa94)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2139:(.text+0x363b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe74)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x8f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0xa6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x1a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x1bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2010:(.xiptext+0x1d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x262): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x2ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x2ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x366): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x3b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x3c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x3f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1108:(.xiptext+0x402): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `_cond_resched':
   include/linux/sched.h:2010:(.xiptext+0x408): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x413): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1130:(.xiptext+0x45e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb40)
   drivers/mtd/chips/cfi_cmdset_0002.c:1132:(.xiptext+0x470): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x4ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1121:(.xiptext+0x4c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1122:(.xiptext+0x4c9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x4d5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1124:(.xiptext+0x4e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0x5ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd


vim +2205 include/linux/sched.h

22d407b164ff79 Suren Baghdasaryan 2024-03-21  2201  
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2202  static inline void alloc_tag_restore(struct alloc_tag *tag, struct alloc_tag *old)
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2203  {
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2204  #ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
22d407b164ff79 Suren Baghdasaryan 2024-03-21 @2205  	WARN(current->alloc_tag != tag, "current->alloc_tag was changed:\n");
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2206  #endif
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2207  	current->alloc_tag = old;
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2208  }
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2209  #else
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2210  #define alloc_tag_save(_tag)			NULL
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2211  #define alloc_tag_restore(_tag, _old)		do {} while (0)
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2212  #endif
22d407b164ff79 Suren Baghdasaryan 2024-03-21  2213  

:::::: The code at line 2205 was first introduced by commit
:::::: 22d407b164ff79de42d21f37d99f9ee7abdd51c8 lib: add allocation tagging support for memory allocation profiling

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
