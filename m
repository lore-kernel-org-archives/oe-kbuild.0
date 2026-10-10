Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0BC39768D
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Oct 2026 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643832; cv=none; b=i4UmFFeKdIr/PQXV/i7jtonrPeepms754H2cfkt4unvTX0gzbPrallM0vduFlktSGXvouml2rS4fBFwp4AnjO8B1D3aruBrGNPyo3nJM+P09TM04Lf6zN1twcK33EZ8NMN2ZKzwLC6Ops4XTQpfOY+OY78qAIT+9don0DUQW89A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643832; c=relaxed/simple;
	bh=pov6NwnfJBpt/eUAwfSZDDFNCY3G/KVuh6ooKVZ2v6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lB0lrjjFAw3549JygkWLT+iw+/TbZbj4Ukh0jYTTarAC5pzAje13I5N3LTfyI4BXAIgeSTG2fYKnKRZbJK2ujClC84XOVdql5reyMRE3J7XOEk1RcCgft4SGYrzEVOsEcvG9GwsGSmeUxCg4XUe0ck1DKG4V+w0SEs+V/9OT+BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrdAgw4N; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrdAgw4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791643831; x=1823179831;
  h=date:from:to:cc:subject:message-id;
  bh=pov6NwnfJBpt/eUAwfSZDDFNCY3G/KVuh6ooKVZ2v6s=;
  b=lrdAgw4NXPgXRmjDh/rooaPicUwSv31gUWZuY2rDh7d63jFeLJhhJd8+
   lDOM4Nolg56Og6fkzgJcdj9Eu8nVU1Yets0QPfszXygh6bML3LELFYyuZ
   A49Yr3Ls0f7tetPwybbSiHh28lb/li12ty3bb6d4uGLfYxeO6hj0ZEix6
   EbiB7WCF7viPPx5riKTu1BGdA8PoEPDFrHb3+2bhDkYU3DI/adq74jpLo
   hM+L1eimkGVifNi5/kGur9vwzTcP5vzw9qhwEYCmyFb1ZhqlwbYXvnWNJ
   gM9q1OxVDFuO/DsdE5KRLzjBuMXcoD9ciGpYW+KIQRRqXZI96vPR0TSVm
   w==;
X-CSE-ConnectionGUID: Cw0z5S6ETJqeB0MNMlORwA==
X-CSE-MsgGUID: kz+ggfqOTpSE8DkpC86+0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="516376"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="516376"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 07:50:30 -0700
X-CSE-ConnectionGUID: uEPhfA/sQPW3Vz0Pf2diRQ==
X-CSE-MsgGUID: tyCy4w/iTv659nBAgoO4dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="855308"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Oct 2026 07:50:30 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFYP4-00000000927-49yL;
	Sat, 10 Oct 2026 14:50:26 +0000
Date: Sat, 10 Oct 2026 16:49:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: cfi_staa_erase_varsize+0x545:
 cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202610101604.FJT4WAKR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Miguel Ojeda <ojeda@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
commit: 5febf432df1cfa5b25d99b54c32103fafbdd0eb9 kbuild: rust: keep Rust objects out of Clang LTO with inline helpers
date:   7 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-r2308-20261010 (https://download.01.org/0day-ci/archive/20261010/202610101604.FJT4WAKR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101604.FJT4WAKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5febf432df1c ("kbuild: rust: keep Rust objects out of Clang LTO with inline helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610101604.FJT4WAKR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cfi_staa_erase_varsize+0x545: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_staa_read+0x190: unreachable instruction
>> vmlinux.o: warning: objtool: cfi_staa_write_buffers+0x42b: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_staa_lock+0x1d0: unreachable instruction
>> vmlinux.o: warning: objtool: cfi_staa_unlock+0x1ec: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_staa_resume+0x137: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_read+0x451: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_resume+0x181: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fixup_sst38vf640x_sectorsize+0x11f: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_read_secsi_onechip+0x2a0: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fixup_sst39vf_rev_b+0xe2: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_write_buffers+0x230: unreachable instruction
>> vmlinux.o: warning: objtool: get_chip+0x2c1: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: put_chip+0x1c8: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: put_chip+0x277: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: chip_ready+0xce: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: chip_ready+0x9d: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_check_err_status+0x13b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x171: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x168: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_erase_chip+0x410: unreachable instruction
>> vmlinux.o: warning: objtool: do_atmel_lock+0x14d: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_atmel_unlock+0x143: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_reset+0x171: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_otp_walk+0x388: cfi_qry_mode_on() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_write+0x168: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_oneword+0x126: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_oneword+0x119: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_lock+0x16e: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_lock+0x75: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_panic_wait+0x106: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_panic_write_oneword+0x190: unreachable instruction
   vmlinux.o: warning: objtool: do_erase_oneblock+0x310: unreachable instruction
   vmlinux.o: warning: objtool: do_erase_oneblock+0x1fd: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_read+0x2fe: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_suspend+0x4ec: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_resume+0x191: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fixup_LH28F640BF+0x113: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_writev+0x290: unreachable instruction
   vmlinux.o: warning: objtool: inval_cache_and_wait_for_operation+0x69: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_point+0x54d: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_reset+0x171: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_otp_walk+0x6b6: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_read+0x161: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_xxlock_oneblock+0x14f: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_getlockstatus_oneblock+0xd3: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: jedec_probe_chip+0x150: unreachable instruction
   vmlinux.o: warning: objtool: jedec_reset+0x80: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
