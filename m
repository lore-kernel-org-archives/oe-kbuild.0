Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F0824BD
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 03:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768101524; cv=none; b=j/jtNBMoDzIXhzwW+mHc+IHd4SR8SlrRu8UCjdDLJFF8YQ5GJ2j+2U5g3acRoJs5nfDeVnetxzIzanlKDqffQgcNeNPj1aWR8DeKrVYxuBWTdV+Pk7XkjoqV4GVrJQICLGJPsi+ktFraFseJoBepUYuw2ipep9hBLodTj8GxTQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768101524; c=relaxed/simple;
	bh=43l5M6iUO5CvlGh9/keU4t45ZxqsPUc62Wg32kwLVSs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G9gfoG+PGv5S5bPgkxvs8dGBAHLSGLpAN9WMZ8qFhxxw1YJcxfa2tJeVNNZclx9JzUPmt361kNkEzsFyu/WPheNyYw6uOMxvo7HLOP3a/fND3rBhkZSShOH76nG+uSmKs6z4OoxtV+fNf09wSlAKGG04h5s9johBY21DHiPCGqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYIwDFaZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYIwDFaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768101522; x=1799637522;
  h=date:from:to:cc:subject:message-id;
  bh=43l5M6iUO5CvlGh9/keU4t45ZxqsPUc62Wg32kwLVSs=;
  b=FYIwDFaZwB3EFCn2MR1OTDbP3x+RHEqzeDF9Fzu6CL7N56K1BVQmQiKk
   y+0wSryQDH7wPCIdt2mhOpw1OgJv5sizKfnO7HpUugEu+UF4OaM7H3Gjs
   p+t72NHBwYAjC9iIKf+HTWyRILdV79p/BvvyYLpt8ENg3UrGaS1Txh2ro
   B6dWy9tQI8hevbhZAniwKWuHa77TPu3YPaMAfS+Gz82IxYrwj/dajkxx1
   ZJCytzbl0vEHH0HO3jgukC2esJj1E6LjuLM7l9292FJFbu4ZggoYFQ9lu
   Hs8S+kFaip3oGTdSwytS5QFB8asj2JudjhLxNqAXPMAGkaqiPNcBQTXXF
   Q==;
X-CSE-ConnectionGUID: SpdIa2t6Q5WsY4YSfWYORw==
X-CSE-MsgGUID: h2x4h7hrQc+1t8kJ1L5NoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="86842372"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="86842372"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 19:18:41 -0800
X-CSE-ConnectionGUID: hQXwbmXgS5qiKr3w6Ta8UA==
X-CSE-MsgGUID: FuRMFcUTTS6fKk+bH2k7BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="208842524"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2026 19:18:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1velyP-000000009WQ-2kK3;
	Sun, 11 Jan 2026 03:18:37 +0000
Date: Sun, 11 Jan 2026 11:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_cmdset_0002.c:(.xiptext+0x2ca): dangerous relocation:
 windowed longcall crosses 1GB boundary; return may fail:
 __trace_set_current_state
Message-ID: <202601111255.eMeE6C8E-lkp@intel.com>
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
TO: Gabriele Monaco <gmonaco@redhat.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Hi Gabriele,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   97313d6113ab4362ad15076f65560e65288fbcb8
commit: 26f80681a09b95fd64bcf33d02e258e78a30842b sched: Add sched tracepoints for RV task model
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: xtensa-randconfig-r072-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111255.eMeE6C8E-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111255.eMeE6C8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601111255.eMeE6C8E-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: DWARF error: could not find abbrev number 5311
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x66): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   cfi_probe.c:(.xiptext+0x85): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0xa3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0xb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_probe.c:(.xiptext+0xc3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_probe.c:(.xiptext+0xd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0xfe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c)
   cfi_probe.c:(.xiptext+0x122): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x13f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x15c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x17a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x197): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x1b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x24e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x264): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x27a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x290): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x29a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x94)
   cfi_probe.c:(.xiptext+0x2a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x94)
   cfi_probe.c:(.xiptext+0x2c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c)
   cfi_probe.c:(.xiptext+0x2d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3c)
   cfi_probe.c:(.xiptext+0x2f9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x34a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x36a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_probe.c:(.xiptext+0x396): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x3ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x3d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x458): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x46a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x49c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x4ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x505): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x522): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   xtensa-linux-ld: DWARF error: could not find abbrev number 81
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0xe07): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0xe3a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0xf1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0xf2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x12ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x187a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x192e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   cfi_cmdset_0002.c:(.text+0x1e1b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x1e34): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x21d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x848)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x23e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x848)
   cfi_cmdset_0002.c:(.text+0x243e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x848)
   cfi_cmdset_0002.c:(.text+0x2576): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x848)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   cfi_cmdset_0002.c:(.text+0x2716): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x8a0)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x2844): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x2872): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x19c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x2a54): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x2a82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x19c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x2dab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xb54)
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0xa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0x18): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   cfi_cmdset_0002.c:(.xiptext+0x2b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   cfi_cmdset_0002.c:(.xiptext+0xc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0xda): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   cfi_cmdset_0002.c:(.xiptext+0xee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x103): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x12b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   cfi_cmdset_0002.c:(.xiptext+0x148): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x1a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x1b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x20b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x256): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x26c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x28f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x29f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x2ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
>> cfi_cmdset_0002.c:(.xiptext+0x2ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x2e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x2ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x2f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x302): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x30c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x328): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xd00)
   cfi_cmdset_0002.c:(.xiptext+0x3b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x3d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x3de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x3ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   cfi_cmdset_0002.c:(.xiptext+0x422): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x42e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x44a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x468): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x477): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x488): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x4a2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x4bf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x4ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x4d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x4db): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x4ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x512): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x530): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac0)
   cfi_cmdset_0002.c:(.xiptext+0x576): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x58f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x60c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x61b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x62c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0x646): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0x662): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x66f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x675): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x680): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x692): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x6c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x6ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x169c)
   cfi_cmdset_0002.c:(.xiptext+0x6ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac0)
   cfi_cmdset_0002.c:(.xiptext+0x716): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x74e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x169c)
   cfi_cmdset_0002.c:(.xiptext+0x774): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x7aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x7b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x7c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1810)
   cfi_cmdset_0002.c:(.xiptext+0x7d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x7ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x37c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0x806): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x81c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3e4)
   cfi_cmdset_0002.c:(.xiptext+0x836): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x170c)
   cfi_cmdset_0002.c:(.xiptext+0x83f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x84e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x8a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x8bc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x8ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x8fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1810)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x926): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x169c)
   cfi_cmdset_0002.c:(.xiptext+0x93f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   cfi_cmdset_0002.c:(.xiptext+0x953): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x968): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x97e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x993): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0xa0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0xa1f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_cmdset_0002.c:(.xiptext+0xa3f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0xa5b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xa63): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xa69): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xa76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xa82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xabc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xac0)
   cfi_cmdset_0002.c:(.xiptext+0xadf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xb03): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb3e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x170c)
   cfi_cmdset_0002.c:(.xiptext+0xb46): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xb5a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0xb74): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xb82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1810)
   cfi_cmdset_0002.c:(.xiptext+0xb94): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xd50)
   cfi_cmdset_0002.c:(.xiptext+0xbb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x169c)
   cfi_cmdset_0002.c:(.xiptext+0xbd4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xbeb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xbfb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc1f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc35): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xd50)
   cfi_cmdset_0002.c:(.xiptext+0xc68): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xcbc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x170c)
   cfi_cmdset_0002.c:(.xiptext+0xcc4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
