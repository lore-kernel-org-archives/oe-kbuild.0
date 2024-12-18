Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B0B192B94
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517899; cv=none; b=gv6n+Oq/+yEZZKtFDyH6SBjO/ePyphLQ60F7wI6rY98ZTakCmpPwOVlfnjxs2uh9E1+grlcD8VXsW2SswaWLdcTH6qBkTVegCo4uZuUt7YRtzpYtbnd0xfRxqjrrJ+3o6izvkLz7dRwB7Sr0Mft74YFnfofFvY1rQgy1hKcsHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517899; c=relaxed/simple;
	bh=JIkGNKTbEA0BrhrtNJE19KBMLR6fyJLrQPmR2wj0Evw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTuy72NCkO4cOtWg5X/bYz2koa/CXAeFpeSQUVla7y8BokzC2iuE3/Fm7+OeF4MJ5Hft6MovIxXsFX8SM1WHoae/XYQvcQjtavkK23T4jQ/mLj2H6HwPdf89IVKD4OrVMQfyzsFrOy+UdxfbcKn7SfiTz1sh83W0u7ddx43ErgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GW41J4lK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GW41J4lK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734517897; x=1766053897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIkGNKTbEA0BrhrtNJE19KBMLR6fyJLrQPmR2wj0Evw=;
  b=GW41J4lKfyjTtLe0AuwS8zZUndxWB7AvjAeBKWvvypr6BugMK0wIYP3c
   gWt4Dh32aqmhD+ADPIThfzhaRWZfjJlssR7bRbOLD/DwikiQlTJjTGmEF
   dJBNAOX3tsGXATn2R3m+I0MAd9BuePA49b+aAtap8MGRP6kgBE8k5dTIz
   tQhgEtTR5aEsUcNzD5G5kBZ21VXy6fZ5AeFIzRfEqLLoqfUDqcfgu24cR
   LA2MO+hgVlYyVra7Cx7cw7RRLGAD8kE/VVQfNiOqR/kR2fKe7/UgdOxtw
   5dAuhbCn51WhB7jwZ666Qt/6C8vjjSRh0PnajuloDExGmOAISbP0/O9HA
   g==;
X-CSE-ConnectionGUID: xLzelgJVQ4uuQ1R/Vpb+1A==
X-CSE-MsgGUID: P6WKLz3GRzinX4pDCLDkCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="37822536"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="37822536"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 02:31:36 -0800
X-CSE-ConnectionGUID: h8vPome7T9eVvEqlliBlRQ==
X-CSE-MsgGUID: 9SPzdlNBT7OH49e/c0gWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98635476"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Dec 2024 02:31:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNrL2-000GHi-0z;
	Wed, 18 Dec 2024 10:31:32 +0000
Date: Wed, 18 Dec 2024 18:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_probe.c:(.xiptext+0xcb): dangerous relocation: windowed longcall
 crosses 1GB boundary; return may fail: __kmalloc_noprof
Message-ID: <202412181854.S1NXbDS8-lkp@intel.com>
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
head:   aef25be35d23ec768eed08bfcf7ca3cf9685bc28
commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: xtensa-randconfig-r113-20241217 (https://download.01.org/0day-ci/archive/20241218/202412181854.S1NXbDS8-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241218/202412181854.S1NXbDS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412181854.S1NXbDS8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   cfi_probe.c:(.xiptext+0x8a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac)
   cfi_probe.c:(.xiptext+0xa9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
>> cfi_probe.c:(.xiptext+0xcb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0xda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_probe.c:(.xiptext+0xec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_probe.c:(.xiptext+0xff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x122): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac)
   cfi_probe.c:(.xiptext+0x146): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x163): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x180): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x19e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x1bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x210): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x272): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x287): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x29b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x50)
   cfi_probe.c:(.xiptext+0x2c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x50)
   cfi_probe.c:(.xiptext+0x2e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac)
   cfi_probe.c:(.xiptext+0x2f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac)
   cfi_probe.c:(.xiptext+0x315): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x367): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x3f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x40c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x438): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x4c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x4d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x525): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x542): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   cfi_util.c:(.xiptext+0x20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   cfi_util.c:(.xiptext+0xec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x12a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x13f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x154): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x178): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x18f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x1fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x21e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x234): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x24a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x260): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   cfi_util.c:(.xiptext+0x2a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x2f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   cfi_util.c:(.xiptext+0x34e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
>> cfi_util.c:(.xiptext+0x35c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_util.c:(.xiptext+0x373): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_util.c:(.xiptext+0x3b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_util.c:(.xiptext+0x3cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_util.c:(.xiptext+0x3f5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `read_pri_intelext':
   cfi_cmdset_0001.c:(.text+0x650): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_lock':
   cfi_cmdset_0001.c:(.text+0x1b9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8a0)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_write':
   cfi_cmdset_0001.c:(.text+0x1bec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8a0)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   cfi_cmdset_0001.c:(.text+0x1cac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8a0)
   cfi_cmdset_0001.c:(.text+0x1d3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8a0)
   cfi_cmdset_0001.c:(.text+0x1dab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8a0)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_writev':
   cfi_cmdset_0001.c:(.text+0x1e50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xad0)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_otp_walk':
   cfi_cmdset_0001.c:(.text+0x1fd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xefc)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   cfi_cmdset_0001.c:(.xiptext+0x1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   cfi_cmdset_0001.c:(.xiptext+0xc8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x12c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x148): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x194): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x1a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x1c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x1e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0001.c:(.xiptext+0x1ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x1f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   cfi_cmdset_0001.c:(.xiptext+0x1fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x213): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0001.c:(.xiptext+0x219): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30)
   cfi_cmdset_0001.c:(.xiptext+0x226): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x30)
   cfi_cmdset_0001.c:(.xiptext+0x23a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0001.c:(.xiptext+0x242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x248): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0001.c:(.xiptext+0x254): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0001.c:(.xiptext+0x25f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x277): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0001.c:(.xiptext+0x286): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x29e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   cfi_cmdset_0001.c:(.xiptext+0x38e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x39c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1490)
   cfi_cmdset_0001.c:(.xiptext+0x3aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x3c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0x3d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x3f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x41f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x444): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x44d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   cfi_cmdset_0001.c:(.xiptext+0x493): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x4b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x4da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfe4)
   cfi_cmdset_0001.c:(.xiptext+0x4e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   cfi_cmdset_0001.c:(.xiptext+0x523): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0x532): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x56b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_cmdset_0001.c:(.xiptext+0x584): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   cfi_cmdset_0001.c:(.xiptext+0x62a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x638): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1490)
   cfi_cmdset_0001.c:(.xiptext+0x646): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x66c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0x67b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x692): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x6aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x6ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x712): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x71c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x742): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x763): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x77b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x794): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x7aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfe4)
   cfi_cmdset_0001.c:(.xiptext+0x7b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x7c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x7e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfe4)
   cfi_cmdset_0001.c:(.xiptext+0x7ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x7fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0x80c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x828): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_oneword':
   cfi_cmdset_0001.c:(.xiptext+0x8d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x8ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x8f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1490)
   cfi_cmdset_0001.c:(.xiptext+0x902): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x92b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1b30)
   cfi_cmdset_0001.c:(.xiptext+0x96a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x988): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x9aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x9ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x9d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfe4)
   cfi_cmdset_0001.c:(.xiptext+0x9da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x9ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0x9fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xa12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
