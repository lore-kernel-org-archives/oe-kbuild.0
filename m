Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEACBA45
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Jun 2025 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749302156; cv=none; b=oX7JpviHlF413f1mnNQkP7fmA9//+0pxYiN6ih1wrP5acnPHvVqb1Gil0W5GQ+sz8JP8bPbyjt2WlFo3CSZXEmJTPEQxbVOlKZj8Jq13fPufz8/Cwp2daEDqb8MDCjb3f5KEOXseUw5R/bXSFDI7HCx3W3kxyEcbN9L/B7FPlDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749302156; c=relaxed/simple;
	bh=K91JZXFuC13vayCSYEx8VxmXy//io8jZ8E4AFjBldnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I76VbG2Y5KYwNrCbmR3SHltf48eZ2Q/uuaBe8+pucCkcA3LkY6YyWcrYo99f6VYgopX3z1PnMWtoV9+BdeAngorMm0HzB0j5jsXfrHJL4qNH1tkembjg5hkz8yajZq3yFgBYndC2HL0eGjTXPoPcyVXqxI33xFDEz9gVYiPQ6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idWCplka; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idWCplka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749302153; x=1780838153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K91JZXFuC13vayCSYEx8VxmXy//io8jZ8E4AFjBldnk=;
  b=idWCplkaZYHnCMaExHHmwJxV7GAL7qG40piA23PKIGZ6KWQWY4nB3frw
   DBzAkzL4P0Mj91UdTi3zYQOwhYDpkAMAjdNliXDqRrmX3jQcSSjwSVf56
   4vLB6m4u4DgqB4tlvMiCJ1VZmZ0JENzeEtBf2ccp9gpBb4c3LOEpe7nrP
   66v3kypG37YCIyZXRAWOt5Vb4OGpCYrt+EmsClWmn6EBGL1qf2ZQA/rz8
   rY08erqlDjUzpuKUKkbZ50ANUuCEfBy9YcDwNF6jAHl0s8iMWryJpmOEQ
   FR6MrJ5wzCPtVpYXwhWhQEIoblcu5c9GpaXw/vPC7BhLS/Jt9aKkQTYNF
   Q==;
X-CSE-ConnectionGUID: tEu00/GPTpq2UOmNfVfxcg==
X-CSE-MsgGUID: TXcrMTF9SXqnEN0t+9m6QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51534143"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="51534143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 06:15:52 -0700
X-CSE-ConnectionGUID: XdoIO/GZT4SP76wLdwBxAw==
X-CSE-MsgGUID: QojaSohQQmSwEnLCWmaVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="146072016"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2025 06:15:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNtOm-0005nv-1n;
	Sat, 07 Jun 2025 13:15:48 +0000
Date: Sat, 7 Jun 2025 21:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: cfi_probe_chip+0x75: cfi_qry_mode_on()
 missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202506072122.muaMjLXQ-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bdc7f8c5adad50dad2ec762e317f8b212f5782ac
commit: acae6b5bfffedc0440837c52584696dadb2fa334 objtool: Improve __noreturn annotation warning
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-003-20250607 (https://download.01.org/0day-ci/archive/20250607/202506072122.muaMjLXQ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506072122.muaMjLXQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506072122.muaMjLXQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cfi_probe_chip+0x75: cfi_qry_mode_on() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_read+0x36e: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_resume+0x13c: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_read_secsi_onechip+0x25b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fixup_sst39vf_rev_b+0xda: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_write_buffers+0x446: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: get_chip+0x4a5: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: put_chip+0x1b5: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: chip_ready+0xc6: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_check_err_status+0x13a: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x1b3: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_erase_chip+0x34b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_atmel_lock+0x159: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_atmel_unlock+0x149: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_reset+0x145: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_otp_walk+0x29f: cfi_qry_mode_on() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_otp_write+0x166: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_write_oneword+0x131: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_otp_lock+0x162: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: cfi_amdstd_panic_wait+0xc9: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_panic_write_oneword+0x1d6: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_erase_oneblock+0x2c9: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: jedec_probe_chip+0x2fe: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: jedec_reset+0x9c: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fixup_sst38vf640x_sectorsize+0x117: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
