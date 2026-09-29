Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28CD3AEF22
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668802; cv=none; b=J4DqtbsLePk57FULJm/IFeME4ewOQ84ateRe5wme//L4InRAGK0IswTF2EtXKUTJfFfq75ySwDbFQYaRa9TEe0/CqfxvmZpkj04L9W0/DaSQAuDLCRYqL5PAR7IIQfuTrrIiRuDoOPFcj7EIKduZGnrVqStdMMveHeJFMol2BpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668802; c=relaxed/simple;
	bh=VLGOw2Xp68z5YvX/AKaoW9bIm6lbJKUGnSRURb8cdpQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ojJEUVhSkldJyJ1VJnb8A9ml3CsajulI7H7wPXR9fY3Si2Gjs+JSIQSOoZQAukc5HXhZ8w24dS9g0+6hwU/Wiy7Lp2KFfa9pm7iZpMC4bSmB4ufG5Tr0kqjMh0O/IcmWOhf0DQXE59xkISsgrC1QfgrYMV/hASRQSlXnL8WGmG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7Q61S82; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7Q61S82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790668799; x=1822204799;
  h=date:from:to:cc:subject:message-id;
  bh=VLGOw2Xp68z5YvX/AKaoW9bIm6lbJKUGnSRURb8cdpQ=;
  b=U7Q61S82wmX72AM0Kiqy5Tv89kKVdzRDO/W40GAUcpBehiCMHU+3HsXt
   t8pZ2VYx6d2E9srbICKmH6is7PR3i8I8OccEsWRIWJw9QYyelJW3AzOyH
   vmA9fc2niNd9ua+pm4Q8stKKnSF/X56CnFAusEVbSNrcrEfdLtoYaNoKy
   dB1Z/wMAFUei2zObQDh9j7btMsCMnYADVTkq2fei0BArNvGfpWW0xPa59
   knzfZv7w40oK65hzvrLBnrGIPJnAVb2UGrNPN9WGPUwry5riqchLaLeMj
   /DA/gpc6oCK5fRz8hLRlrCjo8uPX4YVVvRg5xHix+QKRZiJ6t9ktKtd0P
   Q==;
X-CSE-ConnectionGUID: +MbnDU6fShOcqz8aH8t+9Q==
X-CSE-MsgGUID: EO9JFtpeS+WU4b6vVNIOpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="102041124"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="102041124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 00:59:57 -0700
X-CSE-ConnectionGUID: jVAiz55yRoq6TTIvi8kXEQ==
X-CSE-MsgGUID: oq8gLcmKT+SQT18NDEx44w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="301579465"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Sep 2026 00:59:56 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBSkk-000000001L9-2PLA;
	Tue, 29 Sep 2026 07:59:54 +0000
Date: Tue, 29 Sep 2026 09:59:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_probe.c:(.xiptext+0x18e): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: ftrace_likely_update
Message-ID: <202609290905.EfWPUMtI-lkp@intel.com>
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
TO: Gopi Krishna Menon <krishnagopi487@gmail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

Hi Gopi,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
commit: d496b6f42eb0455caf5d8cb30cf1f01b7fc2a747 mtd: cfi: use struct_size() helper for cfiq allocation
date:   1 year ago
:::::: branch date: 35 hours ago
:::::: commit date: 1 year ago
config: xtensa-randconfig-2001-20260929 (https://download.01.org/0day-ci/archive/20260929/202609290905.EfWPUMtI-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290905.EfWPUMtI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d496b6f42eb0 ("mtd: cfi: use struct_size() helper for cfiq allocation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609290905.EfWPUMtI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   cfi_probe.c:(.xiptext+0x9e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
>> cfi_probe.c:(.xiptext+0x18e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0x1a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0x1ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0x1df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0x1fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ftrace_likely_update
   cfi_probe.c:(.xiptext+0x20e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0x236): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_probe.c:(.xiptext+0x246): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_probe.c:(.xiptext+0x45c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x472): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x488): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x49e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x4a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x80)
   cfi_probe.c:(.xiptext+0x4b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x80)
   cfi_probe.c:(.xiptext+0x4de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x100)
   cfi_probe.c:(.xiptext+0x4eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x100)
   cfi_probe.c:(.xiptext+0x522): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x188)
   cfi_probe.c:(.xiptext+0x543): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x5fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_probe.c:(.xiptext+0x63e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x75c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x7a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x81e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x1630): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   cfi_cmdset_0002.c:(.text+0x1732): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   cfi_cmdset_0002.c:(.text+0x183e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_destroy':
   cfi_cmdset_0002.c:(.text+0x20a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xed4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x2316): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   cfi_cmdset_0002.c:(.text+0x2366): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1b8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_ppb_unlock':
   cfi_cmdset_0002.c:(.text+0x27f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   cfi_cmdset_0002.c:(.text+0x2842): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   cfi_cmdset_0002.c:(.text+0x29dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   cfi_cmdset_0002.c:(.text+0x2a28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x34d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe04)
   cfi_cmdset_0002.c:(.text+0x3798): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe04)
   cfi_cmdset_0002.c:(.text+0x37e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe04)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   cfi_cmdset_0002.c:(.text+0x3a78): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1734)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x3ce7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xe04)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_read_secsi_onechip':
   cfi_cmdset_0002.c:(.text+0x40c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk.isra.0':
   cfi_cmdset_0002.c:(.text+0x440b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x47ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x60c)
   cfi_cmdset_0002.c:(.text+0x484e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1b8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   cfi_cmdset_0002.c:(.xiptext+0x4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   cfi_cmdset_0002.c:(.xiptext+0xd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0xee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x102): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x117): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x1be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x31f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x327): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x34c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1008)
   cfi_cmdset_0002.c:(.xiptext+0x3c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x3e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x3ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x3f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x3fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x406): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x4e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x50c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x520): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x536): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x54a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x5aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1090)
   cfi_cmdset_0002.c:(.xiptext+0x5b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0x612): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x647): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x662): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   cfi_cmdset_0002.c:(.xiptext+0x74a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x7ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x7fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x866): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x88e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x89b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x8a1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x8ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x8c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
