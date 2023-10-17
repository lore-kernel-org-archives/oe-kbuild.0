Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4546C11728
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 06:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQWYloab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697525779; x=1729061779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B34YoCDyAiD3nbXtXHqUdA6G4NTDo8gwCdZe7pIQ70U=;
  b=NQWYloaboRzpOkWcAjbyP/ibmbQVmt4jpnxFdIeJOCbOEwX1iU2T/5bF
   Rhfm+avuWr1Q+u/qQ3d7f+2hm5XstVoN/5cev4iwBg09mmcTRjkolQi3o
   hwkfKd+AZVm8X8gETTzFPKKS87vMK1rQ/l04CYNVGubpkbRvuJ/GFPVpJ
   LD56BiWpX5fH47VVPjrmwVVixaEf+IG/Y3DoqCjRyOMXkYoKR6etuuyfA
   e/KVDY8ZXllB2tUhcYdf0fIcJnVmGFtTuq/HtJEkOsfX/juPvW/NkriSO
   UjMz5BjAMmavivta6HXV3038qgFyDhD4e1bBnqz4la9mPUVAVX74T9Vkk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="388576019"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="388576019"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 23:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929662512"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="929662512"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Oct 2023 23:56:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsdzy-0009Bd-2z;
	Tue, 17 Oct 2023 06:56:14 +0000
Date: Tue, 17 Oct 2023 14:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kernel/static_call.c:98 __static_call_transform() error:
 uninitialized symbol 'op'.
Message-ID: <202310171457.4H1delI9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 923510c88d2b7d947c4217835fd9ca6bd65cc56c x86/static_call: Add support for Jcc tail-calls
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171457.4H1delI9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171457.4H1delI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310171457.4H1delI9-lkp@intel.com/

smatch warnings:
arch/x86/kernel/static_call.c:98 __static_call_transform() error: uninitialized symbol 'op'.

vim +/op +98 arch/x86/kernel/static_call.c

923510c88d2b7d Peter Zijlstra  2023-01-26   43  
923510c88d2b7d Peter Zijlstra  2023-01-26   44  asm (".global __static_call_return\n\t"
923510c88d2b7d Peter Zijlstra  2023-01-26   45       ".type __static_call_return, @function\n\t"
923510c88d2b7d Peter Zijlstra  2023-01-26   46       ASM_FUNC_ALIGN "\n\t"
923510c88d2b7d Peter Zijlstra  2023-01-26   47       "__static_call_return:\n\t"
923510c88d2b7d Peter Zijlstra  2023-01-26   48       ANNOTATE_NOENDBR
923510c88d2b7d Peter Zijlstra  2023-01-26   49       ANNOTATE_RETPOLINE_SAFE
923510c88d2b7d Peter Zijlstra  2023-01-26   50       "ret; int3\n\t"
923510c88d2b7d Peter Zijlstra  2023-01-26   51       ".size __static_call_return, . - __static_call_return \n\t");
923510c88d2b7d Peter Zijlstra  2023-01-26   52  
c27c753ea6fd12 Thomas Gleixner 2022-07-12   53  static void __ref __static_call_transform(void *insn, enum insn_type type,
c27c753ea6fd12 Thomas Gleixner 2022-07-12   54  					  void *func, bool modinit)
e6d6c071f22de2 Josh Poimboeuf  2020-08-18   55  {
3f2a8fc4b15de1 Peter Zijlstra  2021-01-18   56  	const void *emulate = NULL;
452cddbff74b6a Peter Zijlstra  2020-08-18   57  	int size = CALL_INSN_SIZE;
452cddbff74b6a Peter Zijlstra  2020-08-18   58  	const void *code;
923510c88d2b7d Peter Zijlstra  2023-01-26   59  	u8 op, buf[6];
923510c88d2b7d Peter Zijlstra  2023-01-26   60  
923510c88d2b7d Peter Zijlstra  2023-01-26   61  	if ((type == JMP || type == RET) && (op = __is_Jcc(insn)))
923510c88d2b7d Peter Zijlstra  2023-01-26   62  		type = JCC;
452cddbff74b6a Peter Zijlstra  2020-08-18   63  
452cddbff74b6a Peter Zijlstra  2020-08-18   64  	switch (type) {
452cddbff74b6a Peter Zijlstra  2020-08-18   65  	case CALL:
7825451fa4dc04 Peter Zijlstra  2022-09-15   66  		func = callthunks_translate_call_dest(func);
452cddbff74b6a Peter Zijlstra  2020-08-18   67  		code = text_gen_insn(CALL_INSN_OPCODE, insn, func);
3f2a8fc4b15de1 Peter Zijlstra  2021-01-18   68  		if (func == &__static_call_return0) {
3f2a8fc4b15de1 Peter Zijlstra  2021-01-18   69  			emulate = code;
3f2a8fc4b15de1 Peter Zijlstra  2021-01-18   70  			code = &xor5rax;
3f2a8fc4b15de1 Peter Zijlstra  2021-01-18   71  		}
3f2a8fc4b15de1 Peter Zijlstra  2021-01-18   72  
452cddbff74b6a Peter Zijlstra  2020-08-18   73  		break;
452cddbff74b6a Peter Zijlstra  2020-08-18   74  
452cddbff74b6a Peter Zijlstra  2020-08-18   75  	case NOP:
a89dfde3dc3c2d Peter Zijlstra  2021-03-12   76  		code = x86_nops[5];
452cddbff74b6a Peter Zijlstra  2020-08-18   77  		break;
452cddbff74b6a Peter Zijlstra  2020-08-18   78  
452cddbff74b6a Peter Zijlstra  2020-08-18   79  	case JMP:
452cddbff74b6a Peter Zijlstra  2020-08-18   80  		code = text_gen_insn(JMP32_INSN_OPCODE, insn, func);
452cddbff74b6a Peter Zijlstra  2020-08-18   81  		break;
452cddbff74b6a Peter Zijlstra  2020-08-18   82  
452cddbff74b6a Peter Zijlstra  2020-08-18   83  	case RET:
ee88d363d15617 Peter Zijlstra  2022-06-14   84  		if (cpu_feature_enabled(X86_FEATURE_RETHUNK))
770ae1b709528a Peter Zijlstra  2022-09-15   85  			code = text_gen_insn(JMP32_INSN_OPCODE, insn, x86_return_thunk);
ee88d363d15617 Peter Zijlstra  2022-06-14   86  		else
e463a09af2f067 Peter Zijlstra  2021-12-04   87  			code = &retinsn;
452cddbff74b6a Peter Zijlstra  2020-08-18   88  		break;
923510c88d2b7d Peter Zijlstra  2023-01-26   89  
923510c88d2b7d Peter Zijlstra  2023-01-26   90  	case JCC:
923510c88d2b7d Peter Zijlstra  2023-01-26   91  		if (!func) {
923510c88d2b7d Peter Zijlstra  2023-01-26   92  			func = __static_call_return;
923510c88d2b7d Peter Zijlstra  2023-01-26   93  			if (cpu_feature_enabled(X86_FEATURE_RETHUNK))
923510c88d2b7d Peter Zijlstra  2023-01-26   94  				func = x86_return_thunk;
923510c88d2b7d Peter Zijlstra  2023-01-26   95  		}
923510c88d2b7d Peter Zijlstra  2023-01-26   96  
923510c88d2b7d Peter Zijlstra  2023-01-26   97  		buf[0] = 0x0f;
923510c88d2b7d Peter Zijlstra  2023-01-26  @98  		__text_gen_insn(buf+1, op, insn+1, func, 5);
923510c88d2b7d Peter Zijlstra  2023-01-26   99  		code = buf;
923510c88d2b7d Peter Zijlstra  2023-01-26  100  		size = 6;
923510c88d2b7d Peter Zijlstra  2023-01-26  101  
923510c88d2b7d Peter Zijlstra  2023-01-26  102  		break;
452cddbff74b6a Peter Zijlstra  2020-08-18  103  	}
e6d6c071f22de2 Josh Poimboeuf  2020-08-18  104  
452cddbff74b6a Peter Zijlstra  2020-08-18  105  	if (memcmp(insn, code, size) == 0)
e6d6c071f22de2 Josh Poimboeuf  2020-08-18  106  		return;
e6d6c071f22de2 Josh Poimboeuf  2020-08-18  107  
c27c753ea6fd12 Thomas Gleixner 2022-07-12  108  	if (system_state == SYSTEM_BOOTING || modinit)
a945c8345ec0de Peter Zijlstra  2020-08-18  109  		return text_poke_early(insn, code, size);
a945c8345ec0de Peter Zijlstra  2020-08-18  110  
3f2a8fc4b15de1 Peter Zijlstra  2021-01-18  111  	text_poke_bp(insn, code, size, emulate);
e6d6c071f22de2 Josh Poimboeuf  2020-08-18  112  }
e6d6c071f22de2 Josh Poimboeuf  2020-08-18  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
