Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C347C;
	Mon, 23 Jan 2023 12:02:59 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id y1so6067434wru.2;
        Mon, 23 Jan 2023 04:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bA4iCK2P0kpfk3RD6UVoxkxc8xGUII6wrYB2Fp7DXj8=;
        b=qq3cnI8DwN6ktr1Qh82mQd7OMy4MwTqsRSwoDLPHaVM0YiD+LdpWqWF8p3ipU6Z9cc
         cHmO8XZfr42ruWdWX5wMifEBPiykZ7vyTdMFzJFYePPtbi7iUSU5y00+Rp6IAZQ/clKP
         IAl0FYuVyBn4n+7lIcqpmVZ9wF7auoiUvtkYKIysr2OZ+ewMdsQNFkq67Znpj4qm1Nw4
         88HkWd6MUFmsZCfNDCZd+n0oE71rcowJcBmzVcuf21JIit4tgtFmWeUpJYA6bIcP+wFi
         V6xzdFccCuTfodR/LOrMXIhhvBF1drUmZAFCM5rKCMlJeI2M49T/2k4IO2cM/QTo3oPR
         l7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bA4iCK2P0kpfk3RD6UVoxkxc8xGUII6wrYB2Fp7DXj8=;
        b=rTqFfmHh0s5c5FVkiY1JjmBpUEnblWs5qhiwjsKU+l7PIv/7cz+ZRMTCE4Xj6Y5GvA
         rrcnP5mwK5Onlt7S6st/g92PI7pFFR2C17eN/vCJgVFr8Op0q8qzSHshyk1meQAjlywN
         ttEtQOl8HubtoRYfoNp1ZnGbUh1NMnwGcGDpNO33ap05+SKGRRyvhdsiaxFFkMzIrqgB
         k4n4jrsYcm0nxBgJRzWhTlL35KBw1BZ4DEvH0GVoty6c+uLua1jvUTYUS5w8oMenEe2p
         7y2FnPqDIS5/wr0KraqA1tPRCO8iPbXAOEaRHi1pwxerRkzbmdVQHfP1WO52dW8b6UdF
         cJmg==
X-Gm-Message-State: AFqh2kptsz/EP30SYF7bTioTLSe2/mTY6FUT+Nr5u8UDfVwXteZAFSgl
	0Gm6VPgT00Ppwb6RlmJ0xuwdslrF9qE=
X-Google-Smtp-Source: AMrXdXuGcU5jUtMDoTKSraUjnCYWXo93//sjsd0t2xjAO5U+Ze5H+PiEzpER+aGQ90pLDruE4dEpHw==
X-Received: by 2002:adf:e50a:0:b0:2be:a904:fbd5 with SMTP id j10-20020adfe50a000000b002bea904fbd5mr10176626wrm.29.1674475377717;
        Mon, 23 Jan 2023 04:02:57 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020adf8b92000000b002365730eae8sm4383622wra.55.2023.01.23.04.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:02:57 -0800 (PST)
Date: Mon, 23 Jan 2023 15:02:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 3/3] arch/x86/kernel/static_call.c:98
 __static_call_transform() error: uninitialized symbol 'op'.
Message-ID: <Y853bqEhA5NDC3Ar@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   700f4c6d925823018a2d09f92de5405065d2ffec
commit: 700f4c6d925823018a2d09f92de5405065d2ffec [3/3] x86/static_call: Add support for Jcc tail-calls
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230121/202301211834.noGVyk06-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
arch/x86/kernel/static_call.c:98 __static_call_transform() error: uninitialized symbol 'op'.

vim +/op +98 arch/x86/kernel/static_call.c

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

Smatch is concerned that type can start as "JCC".

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

