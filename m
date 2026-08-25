Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2FD1990A7
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 04:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787631259; cv=none; b=SB7wh3AtMSYISenCwjN+CvSMHQ/GH3JOjbIPT3J/VlLsaSRq0P4mieDAFH5PB0Xpd2CjUjWtT/U/oxpLuSoxaYxAmHXa1dyj4yhjwftdHEDMMXnIb7lYuCRZeuX444TV/yNDNflz6pKJCKWKeSNCnrMJGSpdd+/M6Vn/wSOHcwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787631259; c=relaxed/simple;
	bh=AyZA6VgpMWd0/dQeeDm5qBUx8K5bOxgdxCclmhsmwiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WEMZ4KUmKVY0D9KOeVSbIXvgbK8+jaXEu8FAdXlf3saySHykBDlH68Vn9u5G6Rq+Z9Nv6Xikxxw1ElbcGc8eWZvsQ1WWJLpPP0jBoE3PapQ8qa6YsKsUkIa1MmcCaHTznW/ZJLIUhNs39j27NIbeZIB7IAm/+QBgOZ7sGQIBvAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0hVrURh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0hVrURh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787631257; x=1819167257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AyZA6VgpMWd0/dQeeDm5qBUx8K5bOxgdxCclmhsmwiY=;
  b=d0hVrURherNNlL+hZ0CsBGOgtTW7hPkcC94Ad4KxWTsZXZ3MCVfcDkNf
   UZG05oXU7u1K5mDkK6At9TYSXugD1evrhTOgQngEeCkN3AYCHKgNHS8/f
   /gOp449YJERLCSFWC2whHQnw0zeM/Eb6wbJyezJ70v+67dcqV0m0/CIj7
   Whs3R+wcoGGY9BePD7nMl0+nRD/tVLd+15sWLa2V1Bl1dWi11C1Cl2b8a
   2/AFwlJ7RZxzFSke53wJOKGe8JR+fWgctN+PQjIRCatAkY4OvjCewCpkC
   KxadWelh+9auL87j3baq/hmDcgJVSNIk+sf27iAB7Wc/CIveKZevhl78n
   A==;
X-CSE-ConnectionGUID: LQ1LLsikR5OPi0aujMloGw==
X-CSE-MsgGUID: Tp3KYQ/1RuCfMw7SRQiRAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99254363"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="99254363"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 21:14:17 -0700
X-CSE-ConnectionGUID: KVKl5sRES1CFauTVdHPhsw==
X-CSE-MsgGUID: xdbcpIkfQWudlTF7lxorEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="262869331"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Aug 2026 21:14:15 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyiY9-000000004xz-2Rv2;
	Tue, 25 Aug 2026 04:14:13 +0000
Date: Tue, 25 Aug 2026 12:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1] LoongArch: BPF: Implement arch_bpf_stack_walk()
Message-ID: <202608251231.fQmOHVs6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260813045306.21571-1-yangtiezhu@loongson.cn>
References: <20260813045306.21571-1-yangtiezhu@loongson.cn>
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
TO: Huacai Chen <chenhuacai@kernel.org>
TO: Hengqi Chen <hengqi.chen@gmail.com>
CC: loongarch@lists.linux.dev
CC: bpf@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: George Guo <guodongtai@kylinos.cn>

Hi Tiezhu,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260821]
[also build test ERROR on linus/master]
[cannot apply to bpf-next/master bpf/master bpf-next/net v7.2 v7.2-rc7 v7.2-rc6 v7.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tiezhu-Yang/LoongArch-BPF-Implement-arch_bpf_stack_walk/20260813-125306
base:   next-20260821
patch link:    https://lore.kernel.org/r/20260813045306.21571-1-yangtiezhu%40loongson.cn
patch subject: [PATCH v1] LoongArch: BPF: Implement arch_bpf_stack_walk()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260825/202608251231.fQmOHVs6-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251231.fQmOHVs6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608251231.fQmOHVs6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/net/bpf_jit.c:2446:22: error: redefinition of 'walk_bpf_stackframe'
    2446 | static noinline void walk_bpf_stackframe(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
         |                      ^
   arch/loongarch/net/bpf_jit.c:2372:22: note: previous definition is here
    2372 | static noinline void walk_bpf_stackframe(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
         |                      ^
>> arch/loongarch/net/bpf_jit.c:2467:6: error: redefinition of 'arch_bpf_stack_walk'
    2467 | void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie)
         |      ^
   arch/loongarch/net/bpf_jit.c:2393:6: note: previous definition is here
    2393 | void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie)
         |      ^
   2 errors generated.


vim +/walk_bpf_stackframe +2446 arch/loongarch/net/bpf_jit.c

637f7446933b6d George Guo 2026-08-13  2445  
637f7446933b6d George Guo 2026-08-13 @2446  static noinline void walk_bpf_stackframe(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
637f7446933b6d George Guo 2026-08-13  2447  					 void *cookie, unsigned long fp)
637f7446933b6d George Guo 2026-08-13  2448  {
637f7446933b6d George Guo 2026-08-13  2449  	struct pt_regs dummyregs;
637f7446933b6d George Guo 2026-08-13  2450  	struct pt_regs *regs = &dummyregs;
637f7446933b6d George Guo 2026-08-13  2451  	struct unwind_state state;
637f7446933b6d George Guo 2026-08-13  2452  	unsigned long addr;
637f7446933b6d George Guo 2026-08-13  2453  
637f7446933b6d George Guo 2026-08-13  2454  	regs->regs[3] = (unsigned long)__builtin_frame_address(0);
637f7446933b6d George Guo 2026-08-13  2455  	regs->csr_era = (unsigned long)__builtin_return_address(0);
637f7446933b6d George Guo 2026-08-13  2456  	regs->regs[1] = 0;
637f7446933b6d George Guo 2026-08-13  2457  	regs->regs[22] = fp;
637f7446933b6d George Guo 2026-08-13  2458  
637f7446933b6d George Guo 2026-08-13  2459  	for (unwind_start(&state, current, regs);
637f7446933b6d George Guo 2026-08-13  2460  	     !unwind_done(&state); unwind_next_frame(&state)) {
637f7446933b6d George Guo 2026-08-13  2461  		addr = unwind_get_return_address(&state);
637f7446933b6d George Guo 2026-08-13  2462  		if (!addr || !consume_fn(cookie, (u64)addr, (u64)state.sp, (u64)state.fp))
637f7446933b6d George Guo 2026-08-13  2463  			break;
637f7446933b6d George Guo 2026-08-13  2464  	}
637f7446933b6d George Guo 2026-08-13  2465  }
637f7446933b6d George Guo 2026-08-13  2466  
637f7446933b6d George Guo 2026-08-13 @2467  void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie)
637f7446933b6d George Guo 2026-08-13  2468  {
637f7446933b6d George Guo 2026-08-13  2469  	unsigned long fp;
637f7446933b6d George Guo 2026-08-13  2470  
637f7446933b6d George Guo 2026-08-13  2471  	/*
637f7446933b6d George Guo 2026-08-13  2472  	 * Capture the live frame pointer ($r22) at the very front-line before
637f7446933b6d George Guo 2026-08-13  2473  	 * any kernel C code clobbers it. This must be a thin wrapper with no
637f7446933b6d George Guo 2026-08-13  2474  	 * large stack locals to prevent the compiler from reusing $r22 early.
637f7446933b6d George Guo 2026-08-13  2475  	 */
637f7446933b6d George Guo 2026-08-13  2476  	asm volatile("move %0, $r22" : "=r"(fp));
637f7446933b6d George Guo 2026-08-13  2477  	walk_bpf_stackframe(consume_fn, cookie, fp);
637f7446933b6d George Guo 2026-08-13  2478  }
637f7446933b6d George Guo 2026-08-13  2479  #endif /* CONFIG_UNWINDER_ORC */
637f7446933b6d George Guo 2026-08-13  2480  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
