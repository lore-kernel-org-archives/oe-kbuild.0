Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3775D3FD4
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Apr 2025 02:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856427; cv=none; b=PFxvru57BEKWyMzQbRm03KZqQtuFovEq5dkiaadPcmYge26rkJAJ9nAabDV4jLM2sEftcstSaAnj3d/OTqV2Gd0hGhV3dkP3ug7HuKgxqnPIm2zTxvXefULZTSCh7IPmnhxYhjNGSajRI7FL5C9b/FPrIURuBGt3BXZuQC/HRbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856427; c=relaxed/simple;
	bh=AXhGfc5mwGcGfdSgUfzOonxyxhtaN6ZVJkJyoSeRafg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2XFei35V3dLVLLjkhC3SR77CvFj7uiJlJHyxkdsYF1FLAh+BJmdCr45D1sbaAFP79yCggPPSO1fW8V9nQODX/PvM/dziKZ7IUvhsX/gUCHGMWSlVV5F3cW04/kRwximc6Nih5e4HIZcZKYdDwz5va1P++jympCVV6t73K+ECmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3o/Bnnb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3o/Bnnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744856425; x=1776392425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AXhGfc5mwGcGfdSgUfzOonxyxhtaN6ZVJkJyoSeRafg=;
  b=T3o/BnnbjaXEzvidEUNTs+R9qBje319ErLsQJqekJ/eI/XOGgLLbvJ28
   j1tjzZ9kzb1IyyReO8phDFyrIYMr4inpsubjjRPNvpVqth5lpUKWXCdeC
   hILC/Z5Da+DabdaJMmWmY9CJ24HDSdLDYliUM29hDgn7msEWhIZbSbxmD
   +LKP3a7jZDPL3psQ2LpHMuxMmu8Ox3MJADaD5SmEYpdtggJ2BLDob527A
   paGdLg8I21FFwL0sJx2PqYNmbXADuBICbTWrMM2Va3AxXcxcAhcic5V2F
   XL+WqPMIXqAaWAQIM3PJHHrsl+WICp9Ajka2QMaAtSCUYElnGQcoSX1dI
   g==;
X-CSE-ConnectionGUID: GsX2RinfTMydgmC73/GHRQ==
X-CSE-MsgGUID: 6QokeT0eQ5yALOCG3+9EbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46518688"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="46518688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 19:20:24 -0700
X-CSE-ConnectionGUID: Nh6cXhfYSOqfBidyC9Ajfg==
X-CSE-MsgGUID: NAo/JwtqRQ6KOn7CZcIO4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="167842137"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Apr 2025 19:20:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5ErV-000Kl7-0E;
	Thu, 17 Apr 2025 02:20:21 +0000
Date: Thu, 17 Apr 2025 10:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: cfi_cmdset_0002.c:(.xiptext+0x282): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: __trace_set_current_state
Message-ID: <202504171010.I8oViMm6-lkp@intel.com>
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

Hi Gabriele,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1336865c4c90fcc649df0435a7c86c30030a723
commit: 26f80681a09b95fd64bcf33d02e258e78a30842b sched: Add sched tracepoints for RV task model
date:   3 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 weeks ago
config: xtensa-randconfig-r051-20250416 (https://download.01.org/0day-ci/archive/20250417/202504171010.I8oViMm6-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171010.I8oViMm6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504171010.I8oViMm6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x55): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa0)
   drivers/mtd/chips/cfi_probe.o:(.xiptext+0x71): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   cfi_probe.c:(.xiptext+0x93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   cfi_probe.c:(.xiptext+0xa2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_probe.c:(.xiptext+0xb2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_probe.c:(.xiptext+0xc6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0xee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa0)
   cfi_probe.c:(.xiptext+0x112): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x12f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x14c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x16a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x187): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x1a4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x18)
   cfi_probe.c:(.xiptext+0x1e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: .text
   cfi_probe.c:(.xiptext+0x23c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x254): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x26b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x280): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_probe.c:(.xiptext+0x28b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x48)
   cfi_probe.c:(.xiptext+0x297): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x48)
   cfi_probe.c:(.xiptext+0x2b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa0)
   cfi_probe.c:(.xiptext+0x2c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa0)
   cfi_probe.c:(.xiptext+0x2e5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x336): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x388): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x3a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_probe.c:(.xiptext+0x3c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x431): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x443): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x46d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x47f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x4ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x4ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_fixup_m29ew_erase_suspend':
   cfi_cmdset_0002.c:(.text+0xcbf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `put_chip.constprop.0':
   cfi_cmdset_0002.c:(.text+0xd6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_atmel_lock':
   cfi_cmdset_0002.c:(.text+0x1106): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x111f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_read_user_prot_reg':
   cfi_cmdset_0002.c:(.text+0x1618): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x1646): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x190)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   cfi_cmdset_0002.c:(.text+0x1808): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x1836): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x190)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_ppb_xxlock':
   cfi_cmdset_0002.c:(.text+0x1ac6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x1af8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_ppb_unlock':
   cfi_cmdset_0002.c:(.text+0x1c02): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   cfi_cmdset_0002.c:(.text+0x1c13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   cfi_cmdset_0002.c:(.text+0x1e23): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x23f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc0c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load.isra.0':
   cfi_cmdset_0002.c:(.text+0x2557): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc0c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_write':
   cfi_cmdset_0002.c:(.text+0x25ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc0c)
   cfi_cmdset_0002.c:(.text+0x26d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc0c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x27b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x598)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   cfi_cmdset_0002.c:(.text+0x2862): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xc74)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   cfi_cmdset_0002.c:(.xiptext+0xe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x48)
   cfi_cmdset_0002.c:(.xiptext+0x1f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   cfi_cmdset_0002.c:(.xiptext+0xd0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xfa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x126): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   cfi_cmdset_0002.c:(.xiptext+0x144): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x1a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0x1f7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x257): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
>> cfi_cmdset_0002.c:(.xiptext+0x282): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x29e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x2a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x2ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x2b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x2c3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x2dc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x2fb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb4c)
   cfi_cmdset_0002.c:(.xiptext+0x36a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x384): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x392): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x3a0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __might_resched
   cfi_cmdset_0002.c:(.xiptext+0x3d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x3f3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x41e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x437): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x442): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x448): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x453): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x462): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x48a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x4a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x99c)
   cfi_cmdset_0002.c:(.xiptext+0x4ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x404)
   cfi_cmdset_0002.c:(.xiptext+0x506): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbcc)
   cfi_cmdset_0002.c:(.xiptext+0x50f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x536): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x544): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc64)
   cfi_cmdset_0002.c:(.xiptext+0x552): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x56b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x3a8)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   cfi_cmdset_0002.c:(.xiptext+0x5b0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x5be): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc64)
   cfi_cmdset_0002.c:(.xiptext+0x5d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x214c)
   cfi_cmdset_0002.c:(.xiptext+0x5eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x60f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2350)
   cfi_cmdset_0002.c:(.xiptext+0x628): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   cfi_cmdset_0002.c:(.xiptext+0x63f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x64f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x673): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x68a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x214c)
   cfi_cmdset_0002.c:(.xiptext+0x6ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x710): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbcc)
   cfi_cmdset_0002.c:(.xiptext+0x718): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x75e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x772): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x212c)
   cfi_cmdset_0002.c:(.xiptext+0x780): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x790): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc64)
   cfi_cmdset_0002.c:(.xiptext+0x7ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x7d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2350)
   cfi_cmdset_0002.c:(.xiptext+0x7f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x806): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x81b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x830): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   cfi_cmdset_0002.c:(.xiptext+0x844): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x8af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x8cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x8d3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x8d9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x8e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x8f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0x92a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x99c)
   cfi_cmdset_0002.c:(.xiptext+0x94a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x972): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xbcc)
   cfi_cmdset_0002.c:(.xiptext+0x9b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x9ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa13): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xa4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0xa73): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0xa8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xa9b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xaa1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xaac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xabe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xaee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xafa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2350)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0xb18): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x99c)
   cfi_cmdset_0002.c:(.xiptext+0xb86): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xbaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2350)
   cfi_cmdset_0002.c:(.xiptext+0xbd0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xc88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry':
   cfi_cmdset_0002.c:(.xiptext+0xc9c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x212c)
   cfi_cmdset_0002.c:(.xiptext+0xcaa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   cfi_cmdset_0002.c:(.xiptext+0xcb8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xc64)
   cfi_cmdset_0002.c:(.xiptext+0xcd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xcf8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x2350)
   cfi_cmdset_0002.c:(.xiptext+0xd14): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd3f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd54): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   cfi_cmdset_0002.c:(.xiptext+0xd68): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd7f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
