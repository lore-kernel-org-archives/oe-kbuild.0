Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B1230BCF
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Apr 2025 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743588154; cv=none; b=Wh1wBK4an2TXHqNMXjjOBlQyy3cp76B+IzZqZyjJD8tWytmwAB4ZtsDEklsVGuwu1tsJ+FHE3eWsTsJYIptmMrSyKquCiu+CIrLgli1A4Od9PSN5XVfELptctRtwkuONQSL8PMDUFjGfrKhnu1aXruL+AARZBalcOVfwOKsIMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743588154; c=relaxed/simple;
	bh=vr5PaeHo3iKQwCvxX9Le1qV3M/91JvKxOgIc77Yd1qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJ/+w3RWZbiTN/lkRBxSzE+4xXCsF6p6skLfgvw85PBZOWAJyxsd9GyABz4hkky4Py1SnYh6NYsoQIiJEcid0c10qnG5YgG7oo+i9l6TG1qa60tKp28Vv69yHnQxEjvlJODgCIdtqXLRESpSl72bquFF8EasKj6afr9u1pEe+7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QM1CFf2h; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QM1CFf2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743588150; x=1775124150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vr5PaeHo3iKQwCvxX9Le1qV3M/91JvKxOgIc77Yd1qo=;
  b=QM1CFf2hBw8ZjoygdaJxBNImIjaDB/1VpwnsZ+ye6lG5VLyfCDodolZh
   vgCXEVpQWdx2pgJobGxKMcoKbvQbDv0b9sreg9PSEWruMBCJcOzt1sy82
   PjWMoKXJ/44ayJIl89/dRZvIdMd4yll822qlhCC4JS6rvc7AiW+ci+hlz
   AyidrQQpFqBC/ArBnSrPw/RdIqo4C6e+RVnpxOdsSWG9Pu/wAeqJOLYNk
   q/F+Xc7tc50hGkpnxrfEFY9ZUEyJxGlTglzmQVF7hflaVIVqyaRN2BsHG
   fJMzNwnFqKrRIV1XpRYQ/AF2tuIfhv0Oqh8PpzMLqx3VJmoziLeBD2plb
   g==;
X-CSE-ConnectionGUID: FnFkvdgST1GllWp44ehnwg==
X-CSE-MsgGUID: mzNyH9YqTOGpNvTDN2r8Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56310489"
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; 
   d="scan'208";a="56310489"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 03:02:29 -0700
X-CSE-ConnectionGUID: mhpkJPKQRmWQcDvOdh5lVw==
X-CSE-MsgGUID: S0FBX2SeSlGm6YUFtN6/MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; 
   d="scan'208";a="149837100"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Apr 2025 03:02:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzuvR-000Abm-2k;
	Wed, 02 Apr 2025 10:02:25 +0000
Date: Wed, 2 Apr 2025 18:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_cmdset_0002.c:(.xiptext+0x397): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: __trace_set_current_state
Message-ID: <202504021731.O70BW7N5-lkp@intel.com>
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
head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
commit: 26f80681a09b95fd64bcf33d02e258e78a30842b sched: Add sched tracepoints for RV task model
date:   9 days ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 days ago
config: xtensa-randconfig-002-20250401 (https://download.01.org/0day-ci/archive/20250402/202504021731.O70BW7N5-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021731.O70BW7N5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504021731.O70BW7N5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   cfi_probe.c:(.xiptext+0xd5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0xf3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
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
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0xa3f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0xd0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0xd3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0xe4b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0xe5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x1110): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0x11d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x181e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0x184e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1e0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x229a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x99c)
   cfi_cmdset_0002.c:(.text+0x2342): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x99c)
   cfi_cmdset_0002.c:(.text+0x2480): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x99c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x2638): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x99c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x273b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xa08)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x27e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf88)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   cfi_cmdset_0002.c:(.text+0x28c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x293b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x2fd2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xbc)
   cfi_cmdset_0002.c:(.text+0x3004): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1e0)
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
   cfi_cmdset_0002.c:(.xiptext+0x1f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x25f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x300): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x312): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x320): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   cfi_cmdset_0002.c:(.xiptext+0x326): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   cfi_cmdset_0002.c:(.xiptext+0x330): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
>> cfi_cmdset_0002.c:(.xiptext+0x397): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x3ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x3b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x3bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x3c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x3d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x3f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x408): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xf54)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x4aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x4ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x507): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x512): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x518): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x523): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x532): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x55f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x57c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x6ec)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0x612): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x628): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x63f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x69e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x6bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x6c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x6cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x6d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x6e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x71b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x737): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x754): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x6ec)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x7ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x81e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfb8)
   cfi_cmdset_0002.c:(.xiptext+0x827): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x862): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x870): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x10bc)
   cfi_cmdset_0002.c:(.xiptext+0x87e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x8a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0x940): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x973): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   cfi_cmdset_0002.c:(.xiptext+0xa22): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xa30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x10bc)
   cfi_cmdset_0002.c:(.xiptext+0xa84): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x204)
   cfi_cmdset_0002.c:(.xiptext+0xab8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0xad2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xae8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xaf7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xbb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc04): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfb8)
   cfi_cmdset_0002.c:(.xiptext+0xc0c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   cfi_cmdset_0002.c:(.xiptext+0xcdc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xcea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x10bc)
   cfi_cmdset_0002.c:(.xiptext+0xd24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0xd47): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0xe1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xe26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xe2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xe38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xe42): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xe7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x6ec)
   cfi_cmdset_0002.c:(.xiptext+0xe9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xec2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xef8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfb8)
   cfi_cmdset_0002.c:(.xiptext+0xf00): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0xfcc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xfda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x10bc)
   cfi_cmdset_0002.c:(.xiptext+0x1014): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x1036): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x104a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x105f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1074): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x1088): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x109f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x10ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x111a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x1122): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x1128): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x1134): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x113e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x1178): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x6ec)
   cfi_cmdset_0002.c:(.xiptext+0x119a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x11bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x11fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xfb8)
   cfi_cmdset_0002.c:(.xiptext+0x1202): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `read_pri_intelext':
   cfi_cmdset_0001.c:(.text+0x563): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_write_words':
   cfi_cmdset_0001.c:(.text+0x1f90): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x744)
   cfi_cmdset_0001.c:(.text+0x203e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x744)
   cfi_cmdset_0001.c:(.text+0x20d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x744)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_writev':
   cfi_cmdset_0001.c:(.text+0x21b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x968)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   cfi_cmdset_0001.c:(.xiptext+0x1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x3c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   cfi_cmdset_0001.c:(.xiptext+0xdc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x16f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x187): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x1ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x1e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x21e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x238): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0001.c:(.xiptext+0x24a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x258): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   cfi_cmdset_0001.c:(.xiptext+0x25e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   cfi_cmdset_0001.c:(.xiptext+0x268): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
>> cfi_cmdset_0001.c:(.xiptext+0x2c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0001.c:(.xiptext+0x2d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0001.c:(.xiptext+0x2e0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x2e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0001.c:(.xiptext+0x2f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0001.c:(.xiptext+0x2fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x310): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0001.c:(.xiptext+0x31f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x337): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   cfi_cmdset_0001.c:(.xiptext+0x3c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0001.c:(.xiptext+0x3d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   cfi_cmdset_0001.c:(.xiptext+0x4d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x4e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1100)
   cfi_cmdset_0001.c:(.xiptext+0x520): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0001.c:(.xiptext+0x52f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x546): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x55e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x59e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x5bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x5cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x5f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x612): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0x624): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x640): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x666): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x67c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x697): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x6ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb94)
   cfi_cmdset_0001.c:(.xiptext+0x6b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0001.c:(.xiptext+0x6c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x6e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb94)
   cfi_cmdset_0001.c:(.xiptext+0x6ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_oneword.constprop.0':
   cfi_cmdset_0001.c:(.xiptext+0x76c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x779): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x788): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0x796): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1100)
   cfi_cmdset_0001.c:(.xiptext+0x7d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0001.c:(.xiptext+0x80e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x82b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x83c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0x84e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x866): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x89e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x8ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0x8c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb94)
   cfi_cmdset_0001.c:(.xiptext+0x8ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_write_buffer':
   cfi_cmdset_0001.c:(.xiptext+0x9d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x9e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0x9f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0xa06): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1100)
   cfi_cmdset_0001.c:(.xiptext+0xa40): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0001.c:(.xiptext+0xa57): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xa7f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xa96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xaa0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb34)
   cfi_cmdset_0001.c:(.xiptext+0xaae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xac6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xb0b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xb33): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xb4b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xb6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xbba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xc9f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xcce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xcf2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xd0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xd1e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   cfi_cmdset_0001.c:(.xiptext+0xd2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xd46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xd7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xd8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xdaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb94)
   cfi_cmdset_0001.c:(.xiptext+0xdb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   cfi_cmdset_0001.c:(.xiptext+0xe58): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0001.c:(.xiptext+0xe68): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xe3c)
   cfi_cmdset_0001.c:(.xiptext+0xe98): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0001.c:(.xiptext+0xea7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xec3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xee6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xf09): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xf12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   cfi_cmdset_0001.c:(.xiptext+0xf46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0001.c:(.xiptext+0xf67): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0001.c:(.xiptext+0xf88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb94)
   cfi_cmdset_0001.c:(.xiptext+0xf90): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1436:(.exception.text+0x1fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   cfi_util.c:(.xiptext+0x1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x2c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   cfi_util.c:(.xiptext+0xb3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0xcb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_util.c:(.xiptext+0x103): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
