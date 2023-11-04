Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A3196
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Nov 2023 00:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7aL6V6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699056716; x=1730592716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F8vwtQaLbfK9r4Cl7vuPvht+DiGB09grHERsuVnvuTs=;
  b=S7aL6V6HgRR+sbarbuea/wX76909lsik3UGhQu/DVwQQ2zfwAEhfxLua
   NtWbo7QKBykKfdukyWuAXfiBJd6WmFLty28YExFM2leU8vfe1S25KZAJu
   Okyw0LM09EcWsul688jsGx0aLrW89MTRi/tNte+CDr8xhSslyvVEc0vyn
   6Jl5g0ymRDHX0oHquuHilV5SwbkC+D0H/rzvbESuK3hFUjKmF8lQK12Yv
   2qJWNrPUfnVUHCVUxSOFBf3MtWbskgxEyRljhpspa3DMUuxqD/gD7nSP1
   a3vJiYjbAUAn5yh0ogL+SJpPWtfbLEFNkQeG8v5B616gmmV+CaDXbdVtV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1926661"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1926661"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 17:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="755308518"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="755308518"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Nov 2023 17:11:55 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz4GX-00036H-0G;
	Sat, 04 Nov 2023 00:11:53 +0000
Date: Sat, 4 Nov 2023 08:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kernel/static_call.c:98 __static_call_transform() error:
 uninitialized symbol 'op'.
Message-ID: <202311040809.Qvqiy97S-lkp@intel.com>
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
head:   e392ea4d4d00880bf94550151b1ace4f88a4b17a
commit: 923510c88d2b7d947c4217835fd9ca6bd65cc56c x86/static_call: Add support for Jcc tail-calls
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231104/202311040809.Qvqiy97S-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311040809.Qvqiy97S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311040809.Qvqiy97S-lkp@intel.com/

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
