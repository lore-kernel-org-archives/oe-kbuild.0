Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1ED469D
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Apr 2025 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592616; cv=none; b=nzrgqyvLkTvTzk/oniNjFX74OamEFAOOlOCvK/Mrvi23Zjn+dOvuA0XxX0TLHzKNRDy+rm8Z7tJysh2yy6IYSCi0Ksaq8Gr6ffCHsLw2Sxa6zUl2xtdXFfd3S7nSIgEEWcFCLSET84CiPBK3tQ17hbWC6uBs15cVHzs8YSjTTl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592616; c=relaxed/simple;
	bh=H0fuAPgnxOYKsWjx6Fxm3ovJh9Bz47+sTCfvBbfV1Do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIKiVJdGPCXVJdsx90Vo3iOagIRw2IQzORxf0wmkohhhfKteYG3deiTFORHW2WV+GIfBsn56mzNzVQlgrmaNYTzpy7RdQ7wIDOhZuwE+6Kn3ZjC4E4e0zYPxohFwSOU73bnuhNEBo9CKJ9yKRNjodvQ/awnlyhsMLbJz+1IWRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWBYhfan; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWBYhfan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743592612; x=1775128612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H0fuAPgnxOYKsWjx6Fxm3ovJh9Bz47+sTCfvBbfV1Do=;
  b=YWBYhfanxCRkvnrept7nkdrtBRiAtsx7Jfy01Y6MFE6u34t0p2E4I1X0
   dxxRYEqVwuNnQgo1pUwRm4ZoIv9sB2b3CWmklNWmSaIRm8hJX3fVzTG7A
   Hcc+5t5/dTzGNBmMixPkaro3kmrh4XFt0kllQeePZFnRDzcbreuVxcpOg
   2eA9WOWZqzUMmpFlKGeWseWZH+gloPlh2J8TaDPPqNV/7FzyMvmrBC/lH
   WvzUpI0LmyHnTXKJNSGmRl5uZZUVulZgFIz/19AzbhuZKCvHdNHhx7pwr
   2olfSmYCcA+ASi78jeI27InUhkOOVOKfI1CtyzwJIdSZsg7DQf2sgSKQf
   g==;
X-CSE-ConnectionGUID: XGjgvvqPTIuktRSQYwqJIg==
X-CSE-MsgGUID: PcWopceVQVCdK3BJ9aoNiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48820963"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="48820963"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 04:16:51 -0700
X-CSE-ConnectionGUID: Hc7U3XLyQeuAKs9UlT575A==
X-CSE-MsgGUID: fuWR7iV4SbK395vWlaaLMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="126920183"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2025 04:16:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzw5Q-000AeC-0f;
	Wed, 02 Apr 2025 11:16:48 +0000
Date: Wed, 2 Apr 2025 19:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_probe.c:(.xiptext+0xf3): dangerous relocation: windowed longcall
 crosses 1GB boundary; return may fail: __kmalloc_noprof
Message-ID: <202504021921.0sD1qEQe-lkp@intel.com>
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
head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: xtensa-randconfig-002-20250401 (https://download.01.org/0day-ci/archive/20250402/202504021921.0sD1qEQe-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021921.0sD1qEQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504021921.0sD1qEQe-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1436:(.exception.text+0x1fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   cfi_probe.c:(.xiptext+0xd5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
>> cfi_probe.c:(.xiptext+0xf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_probe.c:(.xiptext+0x112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_probe.c:(.xiptext+0x134): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x30e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x323): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x337): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x34c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x4ed): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x50a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x8)
   cfi_probe.c:(.xiptext+0x52b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x5a7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x5c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x5d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x604): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x6a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x6b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x708): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x724): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   cfi_util.c:(.xiptext+0x1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   cfi_util.c:(.xiptext+0xb3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0xcb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x103): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   cfi_util.c:(.xiptext+0x16c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x198): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x1c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x203): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x22b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x257): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x27c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x2ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x2e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x30f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x337): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x363): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x398): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x3c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   cfi_util.c:(.xiptext+0x433): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
>> cfi_util.c:(.xiptext+0x43e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_util.c:(.xiptext+0x45e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_util.c:(.xiptext+0x4f5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0020.o: in function `cfi_cmdset_0020':
   drivers/mtd/chips/cfi_cmdset_0020.c:128:(.text+0x17eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0xa1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0xce6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0xd18): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0xe27): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0xe3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x10ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0x11b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x17e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0x1816): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1d8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x2222): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x930)
   cfi_cmdset_0002.c:(.text+0x22ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x930)
   cfi_cmdset_0002.c:(.text+0x23f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x930)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x25a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x930)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x26ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x99c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x2753): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xef4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   cfi_cmdset_0002.c:(.text+0x29e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x2a5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x2f17): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0x2f48): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1d8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   cfi_cmdset_0002.c:(.xiptext+0x20): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   cfi_cmdset_0002.c:(.xiptext+0x7e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0xdf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x1ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x24e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x2fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x30c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   cfi_cmdset_0002.c:(.xiptext+0x312): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   cfi_cmdset_0002.c:(.xiptext+0x31c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x383): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x38b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x391): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x39b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x3a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x3c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x3da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xf30)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x472): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x4b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x4c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x4c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x4d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x4e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x50f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x52c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x6c8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0x5ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5e7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x64f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x65a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x660): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x66b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x67a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x6af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x6cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x6e8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x6c8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x74e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x762): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x777): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x78b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xf94)
   cfi_cmdset_0002.c:(.xiptext+0x7bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x7f6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x804): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1090)
   cfi_cmdset_0002.c:(.xiptext+0x812): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x836): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x84a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x85f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0x8d4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x907): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
