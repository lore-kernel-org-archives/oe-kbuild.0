Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CA822338
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323251; cv=none; b=LR3HY+P8LdwV5dA3gTUG2UaF2kDYi2+mhLsN42Orx24H6QO7F2/WDxCU1s4mRuKe4WG84PQU6TYR3NZMAaYTmEatzMvzaWWigCeMINwHm+/Qxogqlu1o2XuufI5pTULFTiq4WIcu7nyJtBZue6+hHU5KhwPl8SqcIEIgqIJFZIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323251; c=relaxed/simple;
	bh=p8+EgPORhgqpaVR1CZTdyeSo0XOr1ORupC45yR3KRTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1z7O8CYf5cHk/xpdE9W37yhJevBm8Zt6ZOsFnanVuH/R1xDWunlkzy8Y5GwTzqLcQURFxFRRycg12KRl0w9B/KRMlaAOXfYmgfqUvh+Ft7/HKhBbCgWMIN1GSqBQRM5eJOGGokvBb51sWDCGnxQ1ScuMN7I/NtZneul7tAGt6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Av2M+jVB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Av2M+jVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722323248; x=1753859248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8+EgPORhgqpaVR1CZTdyeSo0XOr1ORupC45yR3KRTc=;
  b=Av2M+jVBJXeiF5nY4lsNr+nou20WJhMx462P3i+DyJDWjkgcCai70jw/
   4/C8dFIDKN1W7+zjaXKUrYrcMu9QMLlg6E71O2OOjX+5CCJT4GDi4Ur45
   dG7ya9IB9WvYVcBIfFSWMQKzYLbTLKsdOkpPmzMaxTLgZyDiqCWOIACMB
   hUlCs1oEJsgDGu3Ma0ZtP0rq67ElfthbToyLKcf1GC9D42O0+v371GIyb
   gmblf+QXlDxFHLTYP0u++zjvWH88RJd351Cry4HSNVByLU/5fElMIs9i5
   XtGd4b7XRzshUKd0huTp8GIb6rJ48ebzE6hF42D47YP5b5vemzoByeS49
   w==;
X-CSE-ConnectionGUID: TjR0rLtIQF668SpYcDGhKg==
X-CSE-MsgGUID: 3GVxXxDsSXiCiN0k+Pp6Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30705861"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="30705861"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 00:07:27 -0700
X-CSE-ConnectionGUID: AP8MZU0ISB+pY9Sg5JigkQ==
X-CSE-MsgGUID: rzPIsfP7SoOg3XnJ96NiAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54483714"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jul 2024 00:07:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYgx9-000sam-2G;
	Tue, 30 Jul 2024 07:07:23 +0000
Date: Tue, 30 Jul 2024 15:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/include/asm/current.h:24:(.xiptext+0x2c2): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 remove_wait_queue
Message-ID: <202407301511.IYbzETRm-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94ede2a3e9135764736221c080ac7c0ad993dc2d
commit: 86e50ab6f8a0f5d5e933bece9d0b1d0ddaa4162e arch/xtensa: always_inline get_current() and current_thread_info()
date:   3 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: xtensa-randconfig-r015-20211222 (https://download.01.org/0day-ci/archive/20240730/202407301511.IYbzETRm-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301511.IYbzETRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407301511.IYbzETRm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0xbc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc4)
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0xde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0xfb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.o: in function `__fswab16':
   include/uapi/linux/swab.h:51:(.xiptext+0x118): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x136): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x153): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   include/uapi/linux/swab.h:51:(.xiptext+0x170): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:233:(.xiptext+0x1a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x202): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:202:(.xiptext+0x217): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x22b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x240): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x24a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x70)
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x256): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x70)
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x273): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc4)
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x282): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc4)
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:222:(.xiptext+0x10): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0x20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:227:(.xiptext+0x2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x90): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0xa6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:250:(.xiptext+0xce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:251:(.xiptext+0xe3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:252:(.xiptext+0xf8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:257:(.xiptext+0x11c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:258:(.xiptext+0x133): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:262:(.xiptext+0x157): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x16f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:264:(.xiptext+0x187): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:267:(.xiptext+0x19f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:269:(.xiptext+0x1c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:271:(.xiptext+0x1ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:274:(.xiptext+0x204): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:276:(.xiptext+0x230): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:277:(.xiptext+0x246): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:288:(.xiptext+0x27e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:292:(.xiptext+0x2b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x2fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   drivers/mtd/chips/cfi_util.c:312:(.xiptext+0x314): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2190:(.text+0xb8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x40)
   drivers/mtd/chips/cfi_cmdset_0002.c:2207:(.text+0xbc0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x40)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2271:(.text+0xc9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x40)
   drivers/mtd/chips/cfi_cmdset_0002.c:2277:(.text+0xcac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x40)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0xe67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0x1167): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x40)
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0x1207): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x40)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2768:(.text+0x1746): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x40)
   drivers/mtd/chips/cfi_cmdset_0002.c:2777:(.text+0x1763): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x168)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x1a9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x40)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x1aba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x168)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x1ba8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x1bc4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x1fd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6a4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2629:(.text+0x201b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x968)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1860:(.text+0x235a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6a4)
   drivers/mtd/chips/cfi_cmdset_0002.c:1884:(.text+0x23b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6a4)
   drivers/mtd/chips/cfi_cmdset_0002.c:1927:(.text+0x24aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6a4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2139:(.text+0x2583): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xba0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x48): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x58)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0x5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0x73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   drivers/mtd/chips/cfi_cmdset_0002.c:1997:(.xiptext+0x104): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x118): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x12e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x17b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x1bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1082:(.xiptext+0x206): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x22a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1101:(.xiptext+0x24c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x25a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x260): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.c:1103:(.xiptext+0x26a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x2aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x2b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x2b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_current':
>> arch/xtensa/include/asm/current.h:24:(.xiptext+0x2c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x2cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x2f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x284)
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x35c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `usecs_to_jiffies':
   include/linux/jiffies.h:574:(.xiptext+0x3a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x3ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x3b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x3bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x3ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1964:(.xiptext+0x40a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8bc)
   drivers/mtd/chips/cfi_cmdset_0002.c:1982:(.xiptext+0x452): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1988:(.xiptext+0x466): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1992:(.xiptext+0x47b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0x4de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1665:(.xiptext+0x4eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1665:(.xiptext+0x4f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1668:(.xiptext+0x4fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1675:(.xiptext+0x50b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0x53a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1058)
   drivers/mtd/chips/cfi_cmdset_0002.c:1681:(.xiptext+0x558): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8bc)
   drivers/mtd/chips/cfi_cmdset_0002.c:1703:(.xiptext+0x5ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1058)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   drivers/mtd/chips/cfi_cmdset_0002.c:1765:(.xiptext+0x5ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1773:(.xiptext+0x628): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x378)
   drivers/mtd/chips/cfi_cmdset_0002.c:1787:(.xiptext+0x642): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1074)
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x64b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0x666): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0x674): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x111c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0x682): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1742:(.xiptext+0x69b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x310)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0x70b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1f4c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:1798:(.xiptext+0x720): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1804:(.xiptext+0x72e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x111c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2513:(.xiptext+0x75a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1058)
   drivers/mtd/chips/cfi_cmdset_0002.c:2513:(.xiptext+0x77a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2513:(.xiptext+0x78e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2516:(.xiptext+0x7a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2519:(.xiptext+0x7b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2519:(.xiptext+0x7cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0x83a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0x842): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0x848): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2540:(.xiptext+0x854): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2540:(.xiptext+0x85e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2545:(.xiptext+0x896): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8bc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2554:(.xiptext+0x8ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2562:(.xiptext+0x900): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1074)
   drivers/mtd/chips/cfi_cmdset_0002.c:2563:(.xiptext+0x908): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2593:(.xiptext+0x98b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1f4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2602:(.xiptext+0x99e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2604:(.xiptext+0x9ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x111c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2412:(.xiptext+0x9d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1058)
   drivers/mtd/chips/cfi_cmdset_0002.c:2412:(.xiptext+0x9fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2412:(.xiptext+0xa0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2416:(.xiptext+0xa23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2419:(.xiptext+0xa38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2421:(.xiptext+0xa4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2424:(.xiptext+0xa60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2439:(.xiptext+0xac2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2439:(.xiptext+0xaca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2440:(.xiptext+0xad0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2440:(.xiptext+0xadc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2441:(.xiptext+0xae6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2445:(.xiptext+0xb1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x8bc)
   drivers/mtd/chips/cfi_cmdset_0002.c:2454:(.xiptext+0xb52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2462:(.xiptext+0xb88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1074)
   drivers/mtd/chips/cfi_cmdset_0002.c:2463:(.xiptext+0xb90): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:2471:(.xiptext+0xbb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2474:(.xiptext+0xbc6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x111c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2475:(.xiptext+0xbdb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2034)
   drivers/mtd/chips/cfi_cmdset_0002.c:2488:(.xiptext+0xc00): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1058)
   drivers/mtd/chips/cfi_cmdset_0002.c:2496:(.xiptext+0xc1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2504:(.xiptext+0xc33): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2505:(.xiptext+0xc43): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2022:(.xiptext+0xc67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2022:(.xiptext+0xc7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2034)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2034:(.xiptext+0xcb0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2049:(.xiptext+0xd06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1074)
   drivers/mtd/chips/cfi_cmdset_0002.c:2049:(.xiptext+0xd0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/maps/map_funcs.o: in function `inline_map_write':
   include/linux/mtd/map.h:426:(.xiptext+0x3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `inline_map_read':
   include/asm-generic/io.h:133:(.xiptext+0x80): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/maps/map_funcs.o: in function `inline_map_copy_from':
   include/linux/mtd/map.h:435:(.xiptext+0x9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/maps/map_funcs.o: in function `inline_map_copy_to':
   include/linux/mtd/map.h:440:(.xiptext+0xb3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy


vim +24 arch/xtensa/include/asm/current.h

9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23  21  
86e50ab6f8a0f5 arch/xtensa/include/asm/current.h Suren Baghdasaryan 2024-07-04  22  static __always_inline struct task_struct *get_current(void)
9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23  23  {
9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23 @24  	return current_thread_info()->task;
9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23  25  }
9a8fd558990215 include/asm-xtensa/current.h      Chris Zankel       2005-06-23  26  

:::::: The code at line 24 was first introduced by commit
:::::: 9a8fd5589902153a134111ed7a40f9cca1f83254 [PATCH] xtensa: Architecture support for Tensilica Xtensa Part 6

:::::: TO: Chris Zankel <czankel@tensilica.com>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
