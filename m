Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70710AD5A
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Feb 2023 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675531797; x=1707067797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hqOBDGi/FoWSKCu8BC/pOnBai3KkICzCTknNH5Pyjc0=;
  b=HWMQ73ufszbd+7Zcz5lT/JHiM2/6cpcamiZqr2jMWooSZFRTK+33zk6H
   KYA6AC6tIEO99OoUqlY1kb+6UvrzzzVdXauKNgEQQP+5rsxVQUQpJdnxc
   il8Ibx256QzSAFePLXTQE0lRdQsQq1FD6J1MKa5XXR/Jj6lBS/NH2L1VV
   9fewYV16VgNXiz0b41HrpXkrNLBb24bhf2t8nuYECbE+l7hPjaIKbgjeA
   /R8CcXuQyPTFFm/tx8KsK9rhjkLwA4MwL7kfvjv2VR5eszBk5IwaiEw4Q
   W8rOnJ9xCOoEBoTedVRGgX/11CZaKca5Mahbescjzg3gUrHsscxtuWJvC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="415181484"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="415181484"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 09:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698410430"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="698410430"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2023 09:29:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOMMJ-0001SS-2a;
	Sat, 04 Feb 2023 17:29:51 +0000
Date: Sun, 5 Feb 2023 01:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:x86/alternatives 4/4] arch/x86/kernel/static_call.c:98
 __static_call_transform() error: uninitialized symbol 'op'.
Message-ID: <202302050128.jb3rspDg-lkp@intel.com>
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
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/alternatives
head:   923510c88d2b7d947c4217835fd9ca6bd65cc56c
commit: 923510c88d2b7d947c4217835fd9ca6bd65cc56c [4/4] x86/static_call: Add support for Jcc tail-calls
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230205/202302050128.jb3rspDg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

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
https://github.com/intel/lkp-tests
