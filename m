Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064DE20468E
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776287268; cv=none; b=Rv5XT6DpN+1ROLvKBFQ0ZMLLJNGzoHntMugIPrWMfFcEOjNrEph/HlA0qkJXnhq/ptiQ1PSuyVp4cU0btSRlubX8XVWvlPX81lvgUxqXnCoaXBOfS6D7gHAcAERPuGUArXo/ygbCgqgYaiQXZ4LHB98iXyt66vs5ReVGxM5PVgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776287268; c=relaxed/simple;
	bh=7iPWY8hVrdB5de0yU+8/sPnEisrKGx+cX3OI+z86kLU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JcD5TPB4WX3nDjARcixpct3c24HXLyY15LUCRvtQTuUMlEKSP/TssWXyT70Z0fLtL1BHMlFcfYktkrGhezxWkZvXE9/uZDI0ubwh8PVLZ57vWFQghWYMXBRbcTbjPGjc61y21Uv1PeIl0RaQrfLsdPeGLCc91DswHNL0PTAixL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVV2FMcb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVV2FMcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776287264; x=1807823264;
  h=date:from:to:cc:subject:message-id;
  bh=7iPWY8hVrdB5de0yU+8/sPnEisrKGx+cX3OI+z86kLU=;
  b=XVV2FMcbR5Dmqc0oDsnhvIvUskWn/q9wSfFVUYmdCbFiIWBoOlpGwke2
   /3CWaNyBom91H5xYZ6cjLFpUTsQD37IjnEetNGjHmPYyjfc+iMaEjFbXx
   Y+Q93AFIIBmP28tbXxZQNWujQNbMf6SdRnoR0Yy+bftO+5jELROsBe4Ju
   5VFFM7J5DSG8k1BABAeQ4Sy9gBtZCxvHJxdApVCObicaKZQFKU9QCi8wC
   XOtuOydPl3YUFsEYUmKqJbpnPyLIQjQMNjM4bLKVle09JweDrpFZw779i
   FrK/BkjrG09uWPdofiBoRsDvYI5l/sBi1peokYAVAg63XAER3cdXKMNCv
   Q==;
X-CSE-ConnectionGUID: We84q92jQ3mPW3l7VVpaJA==
X-CSE-MsgGUID: 1Jc1RUS8R0ipnukvEiGSCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77460759"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77460759"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 14:07:44 -0700
X-CSE-ConnectionGUID: 5leiQG90Qcm5cVqewUYCqw==
X-CSE-MsgGUID: vTdlJc3eTWiSGRFsStFNEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="229505209"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Apr 2026 14:07:42 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD7SV-000000000wM-3AZy;
	Wed, 15 Apr 2026 21:07:39 +0000
Date: Thu, 16 Apr 2026 05:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11987/13789] ERROR: modpost:
 __ex_table+0x2584 references non-executable section '.exitcall.exit'
Message-ID: <202604160434.7WlTsW2B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Dave Airlie <airlied@redhat.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e6efabc0afca02efa263aba533f35d90117ab283
commit: af35e741e2f2dbef75500921e8fce17cf4f08fbd [11987/13789] Merge drm/drm-next into drm-xe-next
:::::: branch date: 31 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-002-20260415 (https://download.01.org/0day-ci/archive/20260416/202604160434.7WlTsW2B-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160434.7WlTsW2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604160434.7WlTsW2B-lkp@intel.com/

Note: the linux-next/master HEAD e6efabc0afca02efa263aba533f35d90117ab283 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x2404 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x240c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x240c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2410 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2410 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2418 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2418 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x241c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x241c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2424 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2424 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2428 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2428 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2430 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2430 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2434 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2434 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x243c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x243c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2440 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2440 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2488 (section: __ex_table) -> .L.str.38 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x2488 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2490 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2490 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2494 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2494 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x249c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x249c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b4 (section: __ex_table) -> .L.str.6 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x24b4 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b8 (section: __ex_table) -> $d (section: .debug_info)
ERROR: modpost: __ex_table+0x24b8 references non-executable section '.debug_info'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2500 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2500 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2508 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2508 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x250c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x250c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2514 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2514 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2518 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2518 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2520 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2520 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2524 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2524 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x252c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x252c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2530 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2530 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2538 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2538 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x253c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x253c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2544 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2544 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2548 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2548 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2550 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2550 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2554 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2554 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x255c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x255c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2560 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2560 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2568 (section: __ex_table) -> .L.str.71 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x2568 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2580 (section: __ex_table) -> __UNIQUE_ID_modinfo_348 (section: .modinfo)
ERROR: modpost: __ex_table+0x2580 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2584 (section: __ex_table) -> __exitcall_xillyusb_exit (section: .exitcall.exit)
>> ERROR: modpost: __ex_table+0x2584 references non-executable section '.exitcall.exit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x258c (section: __ex_table) -> xillyusb_probe._entry (section: .data.rel.ro)
ERROR: modpost: __ex_table+0x258c references non-executable section '.data.rel.ro'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2590 (section: __ex_table) -> xillyusb_probe._entry_ptr (section: .printk_index)
ERROR: modpost: __ex_table+0x2590 references non-executable section '.printk_index'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2598 (section: __ex_table) -> .L0  (section: .debug_loclists)
ERROR: modpost: __ex_table+0x2598 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x259c (section: __ex_table) -> .L0  (section: .debug_addr)
ERROR: modpost: __ex_table+0x259c references non-executable section '.debug_addr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25f8 (section: __ex_table) -> $d (section: .debug_line)
ERROR: modpost: __ex_table+0x25f8 references non-executable section '.debug_line'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2604 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2604 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2608 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2608 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2610 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2610 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2614 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2634 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2634 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2638 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2640 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2640 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2644 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x264c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x264c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2650 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2650 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2658 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2658 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x265c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x265c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2664 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2664 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2668 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2670 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2670 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2674 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x267c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x267c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2680 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2688 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2688 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x268c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x268c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2694 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2694 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2698 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x26d0 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
