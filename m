Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65998210E4
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 02:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725071271; cv=none; b=P/k9/nwRrbNUM8YegO2jM8CFDIDr3U3voWXTLqT3agUlkSm7d/kydlo7acv2qqKTWxS4U13WWm6oJnRZTJwGvlPS/RI7I3cUdvrBa2otaVW2XU1X7NmgVNWVVEKM68Cy7oEPg6NRz+0Cao+h36+bcgHJBni/8FsKjI03tdLZCx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725071271; c=relaxed/simple;
	bh=SNr13UEWqdvrDEKszdJrn9leosvfjiFGqlp8prLRJeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RNEEigEMivS+alvVaVi7PdqvNyhUMxoL3C93PcCM+aCf7Qf+caMTqRptgK04ePaYEZtSr+KgC8gH6LLaWwCeNehQ2WR6pqR1tnyGz+BjD607r6d8Ge002CEz/HBA1Ru0G3L4DbdtnF8umb1JgzR0kXA9BPOrrElpVlGDcEB6dAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5bIGrEW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5bIGrEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725071269; x=1756607269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SNr13UEWqdvrDEKszdJrn9leosvfjiFGqlp8prLRJeg=;
  b=g5bIGrEWDRE2wPr32D/Pdymx4PY/yURv1qMQCUMJdeyI4sPlAyA6+Fzl
   Sqt6teHW0w0r1RfJdsu5mhYGypX60woXxVjZ+RhjPO51WLGjZOy8BHkYp
   rM/4ayZ4bBpqYikTjZ69lLdT6VMIUsT1W52Bi4fbflZuFN/RqGPhOWiQ6
   +xseuEdzd3Ay7eIhljcziv6o23cm/hyHTKGMcNfqo+CbUaNjH/RCjihaW
   iztdHtyGWyDSRBq64KxGH50Y4ke4kNXSVFmDImkSpHfYNopuRLpzmB9ZK
   pKM+U8bKmD0K7KihOYe0BnKCYvyWPACmAPZWa7j2j7563+z9Sg9RInt26
   w==;
X-CSE-ConnectionGUID: h+Q33lCGQWmIYN6JqdgiIg==
X-CSE-MsgGUID: 1KvgZJ8lTXSTtSpZBymclQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="41221944"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="41221944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 19:27:45 -0700
X-CSE-ConnectionGUID: ijEzaWgATHGojdAWdXGPUA==
X-CSE-MsgGUID: 5GUPlvsASSuu40Cgkd8j+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="68732242"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Aug 2024 19:27:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skDq2-0002IC-0y;
	Sat, 31 Aug 2024 02:27:42 +0000
Date: Sat, 31 Aug 2024 10:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_probe.c:(.xiptext+0xdf): dangerous relocation: windowed longcall
 crosses 1GB boundary; return may fail: __kmalloc_noprof
Message-ID: <202408311045.UWBQYRjC-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fb24560f31f9dff2c97707cfed6029bfebebaf1c
commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: xtensa-randconfig-s032-20220216 (https://download.01.org/0day-ci/archive/20240831/202408311045.UWBQYRjC-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311045.UWBQYRjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408311045.UWBQYRjC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
>> cfi_probe.c:(.xiptext+0xdf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0xef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_probe.c:(.xiptext+0xff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_probe.c:(.xiptext+0x2da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x303): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x318): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x4ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x8)
   cfi_probe.c:(.xiptext+0x4db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x537): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x550): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x62a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x692): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   cfi_util.c:(.xiptext+0x1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x48): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   cfi_util.c:(.xiptext+0x10e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x130): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x173): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   cfi_util.c:(.xiptext+0x1e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x212): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x244): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x267): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x296): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x2c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x2f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x322): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x350): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x37c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x390): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x3c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x3eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x418): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x42b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   cfi_util.c:(.xiptext+0x48f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
>> cfi_util.c:(.xiptext+0x49a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x943): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0xbfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0xc37): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0xd5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0xd6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0xffa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0x10be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x14db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x994)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x16c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0x16f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1f0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x1eb0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8fc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   cfi_cmdset_0002.c:(.text+0x1f9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x2003): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x28c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0x28f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1f0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x2b38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8fc)
   cfi_cmdset_0002.c:(.text+0x2bd7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8fc)
   cfi_cmdset_0002.c:(.text+0x2d2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8fc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x2e1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc50)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   cfi_cmdset_0002.c:(.xiptext+0x1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   cfi_cmdset_0002.c:(.xiptext+0x68): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x92): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0xc7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x206): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x25e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x328): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x35a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x360): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   cfi_cmdset_0002.c:(.xiptext+0x368): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x3a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe58)
   cfi_cmdset_0002.c:(.xiptext+0x3eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x3f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x3f9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x404): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x40c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x4a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x4de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x4eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x4f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x4fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x50e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x53a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x55c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5e0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0x5cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x652): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x65f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x665): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x670): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x682): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x6b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x6e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5e0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0x78a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x7e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x80b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x81f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x846): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xeb4)
   cfi_cmdset_0002.c:(.xiptext+0x84f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x878): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x888): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfa0)
   cfi_cmdset_0002.c:(.xiptext+0x896): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x8ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0xa0c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xa1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfa0)
   cfi_cmdset_0002.c:(.xiptext+0xa64): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xaaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xac0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xad6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xb4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
