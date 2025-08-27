Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B04E32C8B
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280546; cv=none; b=SgYte+oNBZYqxw69oiqbdfmQ+jb6u1zwaMsb9k5CEkNWfzYUIRauE6H3HZ+HvxkwJZiqxnfh/Q4IzfpfsMt4qaftDSpUkl9A5luC2YEFvkkGJz8U5KHtPEiNNWsmo7Kxf78a3bVeefN2DorVzRFobW+t3zQWyKiW4MdHR5tTfUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280546; c=relaxed/simple;
	bh=LmP5YzW+zm66dVxgBa5SUk0Y9i73qP09veKbkF8zlF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GC5G8X5/F+rBipJZ4u9gAgE4WU7dBVm48nU9gexU02csV4c+vj/2UhygrecoScExoxI5PJfjqjwwAN2ggnpmauF248ZuSwHYwQfRpK2vlYXvHwqiv1CtPbld/cJ5y6UKVT0uGsG+Iend1n2Pch+jKsPmmuSn5AbtjMHHyC6jBKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnxDGuwa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnxDGuwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756280544; x=1787816544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LmP5YzW+zm66dVxgBa5SUk0Y9i73qP09veKbkF8zlF4=;
  b=DnxDGuwaYkt1jFgDfZUrnv5yzFJ8pUK9fTaZC9B5Hj5prnJZeyTCAwMM
   21tIAqegB22gtb1gcmv/3sm49+zYkHng3fDdNiVV38yK61J5X2fk6Qz84
   u5frU0KT30MJd0W2vAYZzpEP/2dMCCkfoGoosQnBbEN158p5+2ZVmzgsf
   VYPuvvzOMH2Yps3GOoF7j2qXFwaSFsZ1G0RIVtdTN/AgY7A2qyqG4HSRX
   MS0ELpvEynrzbWSBWTfGspiUJV6wGPywcarYNgElskyKgG/Fvo/WlRXXb
   W7KH5WCOJqjs9GdINqSMEJ4lAso3HB+3h0H/hZKeWkEeUxsyf6SZ1rxEV
   Q==;
X-CSE-ConnectionGUID: bMiBVkWHRfC8+tLL0FfOhw==
X-CSE-MsgGUID: 0WqRb44MTY+MCbSL/tfurg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69242222"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69242222"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 00:42:23 -0700
X-CSE-ConnectionGUID: BXP5D9FbRNSIr46XDQX4jQ==
X-CSE-MsgGUID: YXAZzg8EQ4Kz1UbGAcXi2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169066154"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 Aug 2025 00:42:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urAnT-000SmN-1X;
	Wed, 27 Aug 2025 07:42:19 +0000
Date: Wed, 27 Aug 2025 15:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: do_ppb_xxlock+0x150: cfi_send_gen_cmd()
 missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202508271527.WZt9FdcU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fab1beda7597fac1cecc01707d55eadb6bbe773c
commit: acae6b5bfffedc0440837c52584696dadb2fa334 objtool: Improve __noreturn annotation warning
date:   5 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-101-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271527.WZt9FdcU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271527.WZt9FdcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508271527.WZt9FdcU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: cfi_probe_chip+0x77: cfi_qry_mode_on() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_read+0x395: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_resume+0x134: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_read_secsi_onechip+0x274: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fixup_sst39vf_rev_b+0xe7: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_write_buffers+0x34a: unreachable instruction
   vmlinux.o: warning: objtool: get_chip+0x51b: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: put_chip+0x1a1: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: chip_ready+0xcb: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_check_err_status+0x131: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x194: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_erase_chip+0x369: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_atmel_lock+0x15b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_atmel_unlock+0x162: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_reset+0x11e: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_otp_walk+0x2db: cfi_qry_mode_on() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_write+0x16e: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_oneword+0x139: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_lock+0x16a: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_panic_wait+0xad: unreachable instruction
   vmlinux.o: warning: objtool: do_panic_write_oneword+0x22b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_erase_oneblock+0x2ec: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_ppb_xxlock+0x150: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_intelext_read+0x2ff: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_intelext_suspend+0x469: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_intelext_resume+0x171: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fixup_LH28F640BF+0xef: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_writev+0x2b5: unreachable instruction
>> vmlinux.o: warning: objtool: inval_cache_and_wait_for_operation+0x62: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: put_chip+0x1d4: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: chip_ready+0x8c: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x18e: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_intelext_point+0x4e6: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_intelext_reset+0x11e: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_intelext_otp_walk+0x714: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_otp_read+0x152: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_write_oneword+0x130: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_otp_lock+0x74: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_erase_oneblock+0x1bc: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_xxlock_oneblock+0x11a: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_getlockstatus_oneblock+0xc3: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: jedec_probe_chip+0xd7: unreachable instruction
   vmlinux.o: warning: objtool: jedec_reset+0xa0: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fixup_sst38vf640x_sectorsize+0xec: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
