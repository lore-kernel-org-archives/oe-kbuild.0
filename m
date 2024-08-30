Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E318A15B117
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Aug 2024 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050201; cv=none; b=Xp0qWva+Wk/eSOzu5cYFecEQPGKZfVnlOP4vufojM4PqFFVpTe7Kjo3bXCXG45cx55QXaRwRTDzMv1fDueKebr1AEKM1yNZXrFNaDMMufBdm0/8H1J3Ai7LrZbhXnOorELgxobbbSHtUSoNg/6rg68AMPUEmZxrWFOnVDIhuSWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050201; c=relaxed/simple;
	bh=Ud6IfZOyh5z/KGkU/VVp8h0CyrQM6JOyKweIrxxoIHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHrSnEfrNRZ61r0vW8yhMECr4oNIahf4uQ1QASB6tJ0qQMutFWQQau0hvERV7ooHmnHFFMUTR3FT4L7RT82eYdCqyScBsgbt+sFEASwWEx7Ma6QTxXQy1xWQ2jiDNdS8LVpo4bJc5LSYvLsLyK/4SN541r9eRfWXKK3vE4Ucyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhkfF5OA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhkfF5OA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725050199; x=1756586199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ud6IfZOyh5z/KGkU/VVp8h0CyrQM6JOyKweIrxxoIHU=;
  b=bhkfF5OA5KqDOcoA9rDV8h9PmCCbzqQP2x08zL9aEtx5W7YSNudxO0C1
   uPlD/iMuLiCs55StSiWz97aOGtKKpLr53SFGV0i3qnozQiDXGl0I9CAxl
   B/ThYDOg3oU9+5ZAEvMcA7wZ0tkjYcQ9ci4d3m9OGRqKTbkvqdBU9Y/pQ
   DmrUKOAIGej6XSO3vI2ESxeVGeFVBaN3hfo//K4X7HnyRK8YT4zqdoUFz
   Bamw0wKMjnmGC5ftlm7MXdvIir5XmGmea4T6o2YMU7MXxLTKK2AyQ9sC3
   /TkYwtzpILuBBlad9C+ppvwEV6LX3d0HdeI8ywJrP6k7Pkd+HMdKWfsLs
   Q==;
X-CSE-ConnectionGUID: qAB/NDMzTMGMPuYAVfd0Yw==
X-CSE-MsgGUID: N+bacvQeTeu0pG7DISsWqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23842773"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23842773"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 13:36:38 -0700
X-CSE-ConnectionGUID: sJInWuiHQEW83Nj77F6lVA==
X-CSE-MsgGUID: v7zvfhWLRZuLEqnWhqE0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="64754733"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Aug 2024 13:36:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk8ME-00025G-2q;
	Fri, 30 Aug 2024 20:36:34 +0000
Date: Sat, 31 Aug 2024 04:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_probe.c:(.xiptext+0xef): dangerous relocation: windowed longcall
 crosses 1GB boundary; return may fail: memset
Message-ID: <202408310459.6XOid7BV-lkp@intel.com>
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
TO: Max Filippov <jcmvbkbc@gmail.com>

Hi Max,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fb24560f31f9dff2c97707cfed6029bfebebaf1c
commit: 03ce34cf8f50e4c62f9a4b62caffdba1165ca977 xtensa: add XIP-aware MTD support
date:   1 year ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year ago
config: xtensa-randconfig-s032-20220216 (https://download.01.org/0day-ci/archive/20240831/202408310459.6XOid7BV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310459.6XOid7BV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408310459.6XOid7BV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   cfi_probe.c:(.xiptext+0xdf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc
>> cfi_probe.c:(.xiptext+0xef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
>> cfi_probe.c:(.xiptext+0xff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
>> cfi_probe.c:(.xiptext+0x2da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x2ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x303): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x318): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x4ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x8)
>> cfi_probe.c:(.xiptext+0x4db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x537): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x550): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x62a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x692): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
>> cfi_util.c:(.xiptext+0x1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
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
>> cfi_util.c:(.xiptext+0x37c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x390): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x3c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x3eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x418): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_util.c:(.xiptext+0x42b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
>> cfi_util.c:(.xiptext+0x48f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_util.c:(.xiptext+0x49a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
>> cfi_cmdset_0002.c:(.text+0x7d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0x814): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0x937): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0x94a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0xbd7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0xc9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x10b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x990)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x12a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0x12d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1ec)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x1a8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8f4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
>> cfi_cmdset_0002.c:(.text+0x1b77): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
>> cfi_cmdset_0002.c:(.text+0x1bdf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x24a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa4)
   cfi_cmdset_0002.c:(.text+0x24cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1ec)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x2714): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8f4)
   cfi_cmdset_0002.c:(.text+0x27b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8f4)
   cfi_cmdset_0002.c:(.text+0x2904): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8f4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x29f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc70)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
>> cfi_cmdset_0002.c:(.text+0x2bff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
>> cfi_cmdset_0002.c:(.xiptext+0x1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
>> cfi_cmdset_0002.c:(.xiptext+0x68): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x92): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0xc7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x202): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x25a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x324): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
>> cfi_cmdset_0002.c:(.xiptext+0x356): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
>> cfi_cmdset_0002.c:(.xiptext+0x35c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
>> cfi_cmdset_0002.c:(.xiptext+0x364): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
>> cfi_cmdset_0002.c:(.xiptext+0x39f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa34)
>> cfi_cmdset_0002.c:(.xiptext+0x3e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x3ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
>> cfi_cmdset_0002.c:(.xiptext+0x3f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
>> cfi_cmdset_0002.c:(.xiptext+0x3ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x407): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x49b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x4d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x4e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x4e9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x4f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x506): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x532): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x554): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5e0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0x5c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x64a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x657): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x65d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x668): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x67a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x6ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x6dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5e0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0x782): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x7da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x803): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x817): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x83e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa90)
   cfi_cmdset_0002.c:(.xiptext+0x847): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x870): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x880): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb7c)
   cfi_cmdset_0002.c:(.xiptext+0x88e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x8b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0xa0c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xa1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb7c)
   cfi_cmdset_0002.c:(.xiptext+0xa28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xa74): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xaa3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xaba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xad0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xae6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb4c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xb54): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xb5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xb66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xb6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xba2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5e0)
   cfi_cmdset_0002.c:(.xiptext+0xbc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xbdf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa90)
   cfi_cmdset_0002.c:(.xiptext+0xc36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   cfi_cmdset_0002.c:(.xiptext+0xc86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xc94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb7c)
   cfi_cmdset_0002.c:(.xiptext+0xcca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xd20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd74): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xdbf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memcpy
   cfi_cmdset_0002.c:(.xiptext+0xe17): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa90)
   cfi_cmdset_0002.c:(.xiptext+0xe7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   cfi_cmdset_0002.c:(.xiptext+0xf5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xf6c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb7c)
   cfi_cmdset_0002.c:(.xiptext+0xf7a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xfcc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xfe4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xffc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1014): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x102a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x109c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x10a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x10aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x10b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x10be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x10f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x5e0)
   cfi_cmdset_0002.c:(.xiptext+0x1113): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x112e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x117e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa90)
   cfi_cmdset_0002.c:(.xiptext+0x1186): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `read_pri_intelext':
   cfi_cmdset_0001.c:(.text+0x722): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_write':
   cfi_cmdset_0001.c:(.text+0x1484): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c4)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_lock':
   cfi_cmdset_0001.c:(.text+0x17f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c4)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   cfi_cmdset_0001.c:(.text+0x1d3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c4)
   cfi_cmdset_0001.c:(.text+0x1dd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c4)
   cfi_cmdset_0001.c:(.text+0x1efe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4c4)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_writev':
   cfi_cmdset_0001.c:(.text+0x206b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa64)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
