Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777CCBD37
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jan 2023 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674296536; x=1705832536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1h7NUZW6WnA7K8SrpSIIxXjRGTTZotc3P3CieUNLpmM=;
  b=flkUERWuOjwzsytutRDBw+SfNizw6+EKMRyiZh7S3hMZLJQgv1J/UbxQ
   0eyXV8qZm+2zWpfIGQJL8Xkhro6IlccOSnOfBQBjyyV6yJ7GFHh0aBG1h
   DJwtMeDJcXEQhMDP9rMH2B6GTAl2A56ZM/FdRvJHnmY5ls5L33UZhMTKU
   oFdzDBDz4LtHqmN2buJw7TgUOoJIRX0zSMQyQfbcbc2IbGCfHAV4w0k9w
   dxqLJVMlqEL+1mJDsOdrJHrvbts4pFduIblzQogpgOt5L8mynlwaqNXbu
   8CQH2DEzeljnc367ETRB4wUf1PGLqXQx7+dqYyYlenixdhC4Hd7a4S1lQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323462817"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="323462817"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 02:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="724233470"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="724233470"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jan 2023 02:22:14 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJB0n-0003xa-3C;
	Sat, 21 Jan 2023 10:22:13 +0000
Date: Sat, 21 Jan 2023 18:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:x86/core 3/3] arch/x86/kernel/static_call.c:98
 __static_call_transform() error: uninitialized symbol 'op'.
Message-ID: <202301211834.noGVyk06-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   700f4c6d925823018a2d09f92de5405065d2ffec
commit: 700f4c6d925823018a2d09f92de5405065d2ffec [3/3] x86/static_call: Add support for Jcc tail-calls
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230121/202301211834.noGVyk06-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
arch/x86/kernel/static_call.c:98 __static_call_transform() error: uninitialized symbol 'op'.

vim +/op +98 arch/x86/kernel/static_call.c

700f4c6d925823 Peter Zijlstra  2023-01-20   43  
700f4c6d925823 Peter Zijlstra  2023-01-20   44  asm (".global __static_call_return\n\t"
700f4c6d925823 Peter Zijlstra  2023-01-20   45       ".type __static_call_return, @function\n\t"
700f4c6d925823 Peter Zijlstra  2023-01-20   46       ASM_FUNC_ALIGN "\n\t"
700f4c6d925823 Peter Zijlstra  2023-01-20   47       "__static_call_return:\n\t"
700f4c6d925823 Peter Zijlstra  2023-01-20   48       ANNOTATE_NOENDBR
700f4c6d925823 Peter Zijlstra  2023-01-20   49       ANNOTATE_RETPOLINE_SAFE
700f4c6d925823 Peter Zijlstra  2023-01-20   50       "ret; int3\n\t"
700f4c6d925823 Peter Zijlstra  2023-01-20   51       ".size __static_call_return, . - __static_call_return \n\t");
700f4c6d925823 Peter Zijlstra  2023-01-20   52  
c27c753ea6fd12 Thomas Gleixner 2022-07-12   53  static void __ref __static_call_transform(void *insn, enum insn_type type,
c27c753ea6fd12 Thomas Gleixner 2022-07-12   54  					  void *func, bool modinit)
e6d6c071f22de2 Josh Poimboeuf  2020-08-18   55  {
3f2a8fc4b15de1 Peter Zijlstra  2021-01-18   56  	const void *emulate = NULL;
452cddbff74b6a Peter Zijlstra  2020-08-18   57  	int size = CALL_INSN_SIZE;
452cddbff74b6a Peter Zijlstra  2020-08-18   58  	const void *code;
700f4c6d925823 Peter Zijlstra  2023-01-20   59  	u8 op, buf[6];
700f4c6d925823 Peter Zijlstra  2023-01-20   60  
700f4c6d925823 Peter Zijlstra  2023-01-20   61  	if ((type == JMP || type == RET) && (op = __is_Jcc(insn)))
700f4c6d925823 Peter Zijlstra  2023-01-20   62  		type = JCC;
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
700f4c6d925823 Peter Zijlstra  2023-01-20   89  
700f4c6d925823 Peter Zijlstra  2023-01-20   90  	case JCC:
700f4c6d925823 Peter Zijlstra  2023-01-20   91  		if (!func) {
700f4c6d925823 Peter Zijlstra  2023-01-20   92  			func = __static_call_return;
700f4c6d925823 Peter Zijlstra  2023-01-20   93  			if (cpu_feature_enabled(X86_FEATURE_RETHUNK))
700f4c6d925823 Peter Zijlstra  2023-01-20   94  				func = x86_return_thunk;
700f4c6d925823 Peter Zijlstra  2023-01-20   95  		}
700f4c6d925823 Peter Zijlstra  2023-01-20   96  
700f4c6d925823 Peter Zijlstra  2023-01-20   97  		buf[0] = 0x0f;
700f4c6d925823 Peter Zijlstra  2023-01-20  @98  		__text_gen_insn(buf+1, op, insn+1, func, 5);
700f4c6d925823 Peter Zijlstra  2023-01-20   99  		code = buf;
700f4c6d925823 Peter Zijlstra  2023-01-20  100  		size = 6;
700f4c6d925823 Peter Zijlstra  2023-01-20  101  
700f4c6d925823 Peter Zijlstra  2023-01-20  102  		break;
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
