Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D834204E
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 12:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763659; cv=none; b=omQ3CKPHW21ijYVaeIOgr8ARZNwwSMGfOc4Yick+l42S9slQIoN75AukksKkN894p2adjHy5fBftN/7DoPNieUrfsgcZjUbJnjNNM8XDtdrYttg0ks47O/bnlaA5fKXCog3cJaGnDfDgXtjmOPLDNG79ile00ok/WeABy30TAnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763659; c=relaxed/simple;
	bh=kVVwoQdzQs/2POBU8iQJUufD4yAjUlQTRrYQrVS3jfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPFjjiFmS7N1EtDEGNC06BeFTfpB2kUeFchHC2euHKSpdx3qi9kVzVkeEeWBLChBY+i3ceN0CCHt5x/rjF4oKKcK1R2Nz27kBn0+BhsKMGSSXYw3Med11+HvdHmPC+frHN+CbvdILlucNezVjEYP6gGB70GUb7VCND6r5YOhyJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJ69jvHv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJ69jvHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764763657; x=1796299657;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kVVwoQdzQs/2POBU8iQJUufD4yAjUlQTRrYQrVS3jfY=;
  b=iJ69jvHv3Hh+YcIjaDXgwRT5igP3cIr9OopDkItvQyqQ+D07mIRMYwRB
   wBj1t/LyktWqZdCTUUZ2auA3fpWqB4Op2J7eGpVuBpQj1dX8L8c2zEHi1
   Tuj/evlbNmtrocguIV8MukoM/5UMfy+VVAqzW2PGYjk5ewDvQu2M2IZ+G
   eV3ccKyODBI4Gzs/+Lo7xSPhI60K3W+auifj3YwnVGETZtx7wUHBgIuoE
   spNo82PSEaQSYT+BCouV++igKSJ71V0SexYOGEw6RhTm+OC8BIMGaF5+g
   g5YdF+vs7rSRyvQjDhASYVJ/P9WHXLKZl135MavsNOF+ap0Ns54PNLSNl
   w==;
X-CSE-ConnectionGUID: 4ZtLZZ1uQ2OMC0Wt68sjTw==
X-CSE-MsgGUID: 2OdP45izRuio1qFj8CmHUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54302484"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="54302484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 04:07:36 -0800
X-CSE-ConnectionGUID: GMCNDISzS92n4zdVtbBg2A==
X-CSE-MsgGUID: jns7PEQRR625jWgoB4zGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="225615844"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Dec 2025 04:07:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQldr-00000000AxD-4AIq;
	Wed, 03 Dec 2025 12:07:31 +0000
Date: Wed, 3 Dec 2025 20:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpoimboe:orc-bpf 1/2] arch/x86/net/bpf_jit_comp.c:3392
 __arch_prepare_bpf_trampoline() error: we previously assumed 'im' could be
 null (see line 3307)
Message-ID: <202512032036.mGr2egSM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git orc-bpf
head:   a18505975662328c8ffb1090dded890c6f8c1004
commit: fd2bc5b4e261a680774b28f6100509fd5ebad2f0 [1/2] bpf: Add bpf_has_frame_pointer()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-161-20251203 (https://download.01.org/0day-ci/archive/20251203/202512032036.mGr2egSM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512032036.mGr2egSM-lkp@intel.com/

New smatch warnings:
arch/x86/net/bpf_jit_comp.c:3392 __arch_prepare_bpf_trampoline() error: we previously assumed 'im' could be null (see line 3307)

Old smatch warnings:
arch/x86/net/bpf_jit_comp.c:2283 do_jit() error: uninitialized symbol 'start_of_ldx'.

vim +/im +3392 arch/x86/net/bpf_jit_comp.c

fec56f5890d93f Alexei Starovoitov 2019-11-14  3115  
116e04ba1459fc Leon Hwang         2024-07-14  3116  /* mov rax, qword ptr [rbp - rounded_stack_depth - 8] */
116e04ba1459fc Leon Hwang         2024-07-14  3117  #define LOAD_TRAMP_TAIL_CALL_CNT_PTR(stack)	\
116e04ba1459fc Leon Hwang         2024-07-14  3118  	__LOAD_TCC_PTR(-round_up(stack, 8) - 8)
116e04ba1459fc Leon Hwang         2024-07-14  3119  
fec56f5890d93f Alexei Starovoitov 2019-11-14  3120  /* Example:
fec56f5890d93f Alexei Starovoitov 2019-11-14  3121   * __be16 eth_type_trans(struct sk_buff *skb, struct net_device *dev);
fec56f5890d93f Alexei Starovoitov 2019-11-14  3122   * its 'struct btf_func_model' will be nr_args=2
fec56f5890d93f Alexei Starovoitov 2019-11-14  3123   * The assembly code when eth_type_trans is executing after trampoline:
fec56f5890d93f Alexei Starovoitov 2019-11-14  3124   *
fec56f5890d93f Alexei Starovoitov 2019-11-14  3125   * push rbp
fec56f5890d93f Alexei Starovoitov 2019-11-14  3126   * mov rbp, rsp
fec56f5890d93f Alexei Starovoitov 2019-11-14  3127   * sub rsp, 16                     // space for skb and dev
fec56f5890d93f Alexei Starovoitov 2019-11-14  3128   * push rbx                        // temp regs to pass start time
fec56f5890d93f Alexei Starovoitov 2019-11-14  3129   * mov qword ptr [rbp - 16], rdi   // save skb pointer to stack
fec56f5890d93f Alexei Starovoitov 2019-11-14  3130   * mov qword ptr [rbp - 8], rsi    // save dev pointer to stack
fec56f5890d93f Alexei Starovoitov 2019-11-14  3131   * call __bpf_prog_enter           // rcu_read_lock and preempt_disable
fec56f5890d93f Alexei Starovoitov 2019-11-14  3132   * mov rbx, rax                    // remember start time in bpf stats are enabled
fec56f5890d93f Alexei Starovoitov 2019-11-14  3133   * lea rdi, [rbp - 16]             // R1==ctx of bpf prog
fec56f5890d93f Alexei Starovoitov 2019-11-14  3134   * call addr_of_jited_FENTRY_prog
fec56f5890d93f Alexei Starovoitov 2019-11-14  3135   * movabsq rdi, 64bit_addr_of_struct_bpf_prog  // unused if bpf stats are off
fec56f5890d93f Alexei Starovoitov 2019-11-14  3136   * mov rsi, rbx                    // prog start time
fec56f5890d93f Alexei Starovoitov 2019-11-14  3137   * call __bpf_prog_exit            // rcu_read_unlock, preempt_enable and stats math
fec56f5890d93f Alexei Starovoitov 2019-11-14  3138   * mov rdi, qword ptr [rbp - 16]   // restore skb pointer from stack
fec56f5890d93f Alexei Starovoitov 2019-11-14  3139   * mov rsi, qword ptr [rbp - 8]    // restore dev pointer from stack
fec56f5890d93f Alexei Starovoitov 2019-11-14  3140   * pop rbx
fec56f5890d93f Alexei Starovoitov 2019-11-14  3141   * leave
fec56f5890d93f Alexei Starovoitov 2019-11-14  3142   * ret
fec56f5890d93f Alexei Starovoitov 2019-11-14  3143   *
fec56f5890d93f Alexei Starovoitov 2019-11-14  3144   * eth_type_trans has 5 byte nop at the beginning. These 5 bytes will be
fec56f5890d93f Alexei Starovoitov 2019-11-14  3145   * replaced with 'call generated_bpf_trampoline'. When it returns
fec56f5890d93f Alexei Starovoitov 2019-11-14  3146   * eth_type_trans will continue executing with original skb and dev pointers.
fec56f5890d93f Alexei Starovoitov 2019-11-14  3147   *
fec56f5890d93f Alexei Starovoitov 2019-11-14  3148   * The assembly code when eth_type_trans is called from trampoline:
fec56f5890d93f Alexei Starovoitov 2019-11-14  3149   *
fec56f5890d93f Alexei Starovoitov 2019-11-14  3150   * push rbp
fec56f5890d93f Alexei Starovoitov 2019-11-14  3151   * mov rbp, rsp
fec56f5890d93f Alexei Starovoitov 2019-11-14  3152   * sub rsp, 24                     // space for skb, dev, return value
fec56f5890d93f Alexei Starovoitov 2019-11-14  3153   * push rbx                        // temp regs to pass start time
fec56f5890d93f Alexei Starovoitov 2019-11-14  3154   * mov qword ptr [rbp - 24], rdi   // save skb pointer to stack
fec56f5890d93f Alexei Starovoitov 2019-11-14  3155   * mov qword ptr [rbp - 16], rsi   // save dev pointer to stack
fec56f5890d93f Alexei Starovoitov 2019-11-14  3156   * call __bpf_prog_enter           // rcu_read_lock and preempt_disable
fec56f5890d93f Alexei Starovoitov 2019-11-14  3157   * mov rbx, rax                    // remember start time if bpf stats are enabled
fec56f5890d93f Alexei Starovoitov 2019-11-14  3158   * lea rdi, [rbp - 24]             // R1==ctx of bpf prog
fec56f5890d93f Alexei Starovoitov 2019-11-14  3159   * call addr_of_jited_FENTRY_prog  // bpf prog can access skb and dev
fec56f5890d93f Alexei Starovoitov 2019-11-14  3160   * movabsq rdi, 64bit_addr_of_struct_bpf_prog  // unused if bpf stats are off
fec56f5890d93f Alexei Starovoitov 2019-11-14  3161   * mov rsi, rbx                    // prog start time
fec56f5890d93f Alexei Starovoitov 2019-11-14  3162   * call __bpf_prog_exit            // rcu_read_unlock, preempt_enable and stats math
fec56f5890d93f Alexei Starovoitov 2019-11-14  3163   * mov rdi, qword ptr [rbp - 24]   // restore skb pointer from stack
fec56f5890d93f Alexei Starovoitov 2019-11-14  3164   * mov rsi, qword ptr [rbp - 16]   // restore dev pointer from stack
fec56f5890d93f Alexei Starovoitov 2019-11-14  3165   * call eth_type_trans+5           // execute body of eth_type_trans
fec56f5890d93f Alexei Starovoitov 2019-11-14  3166   * mov qword ptr [rbp - 8], rax    // save return value
fec56f5890d93f Alexei Starovoitov 2019-11-14  3167   * call __bpf_prog_enter           // rcu_read_lock and preempt_disable
fec56f5890d93f Alexei Starovoitov 2019-11-14  3168   * mov rbx, rax                    // remember start time in bpf stats are enabled
fec56f5890d93f Alexei Starovoitov 2019-11-14  3169   * lea rdi, [rbp - 24]             // R1==ctx of bpf prog
fec56f5890d93f Alexei Starovoitov 2019-11-14  3170   * call addr_of_jited_FEXIT_prog   // bpf prog can access skb, dev, return value
fec56f5890d93f Alexei Starovoitov 2019-11-14  3171   * movabsq rdi, 64bit_addr_of_struct_bpf_prog  // unused if bpf stats are off
fec56f5890d93f Alexei Starovoitov 2019-11-14  3172   * mov rsi, rbx                    // prog start time
fec56f5890d93f Alexei Starovoitov 2019-11-14  3173   * call __bpf_prog_exit            // rcu_read_unlock, preempt_enable and stats math
fec56f5890d93f Alexei Starovoitov 2019-11-14  3174   * mov rax, qword ptr [rbp - 8]    // restore eth_type_trans's return value
fec56f5890d93f Alexei Starovoitov 2019-11-14  3175   * pop rbx
fec56f5890d93f Alexei Starovoitov 2019-11-14  3176   * leave
fec56f5890d93f Alexei Starovoitov 2019-11-14  3177   * add rsp, 8                      // skip eth_type_trans's frame
fec56f5890d93f Alexei Starovoitov 2019-11-14  3178   * ret                             // return to its caller
fec56f5890d93f Alexei Starovoitov 2019-11-14  3179   */
3ba026fca87861 Song Liu           2023-12-06  3180  static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_image,
3ba026fca87861 Song Liu           2023-12-06  3181  					 void *rw_image_end, void *image,
85d33df357b634 Martin KaFai Lau   2020-01-08  3182  					 const struct btf_func_model *m, u32 flags,
f7e0beaf39d386 Kui-Feng Lee       2022-05-10  3183  					 struct bpf_tramp_links *tlinks,
4d854f4f31ec4b Jiri Olsa          2022-09-26  3184  					 void *func_addr)
fec56f5890d93f Alexei Starovoitov 2019-11-14  3185  {
7f788049577032 Pu Lehui           2023-01-05  3186  	int i, ret, nr_regs = m->nr_args, stack_size = 0;
473e3150e30a2d Menglong Dong      2023-07-13  3187  	int regs_off, nregs_off, ip_off, run_ctx_off, arg_stack_off, rbx_off;
f7e0beaf39d386 Kui-Feng Lee       2022-05-10  3188  	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
f7e0beaf39d386 Kui-Feng Lee       2022-05-10  3189  	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
f7e0beaf39d386 Kui-Feng Lee       2022-05-10  3190  	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
4d854f4f31ec4b Jiri Olsa          2022-09-26  3191  	void *orig_call = func_addr;
ae24082331d9bb KP Singh           2020-03-04  3192  	u8 **branches = NULL;
fec56f5890d93f Alexei Starovoitov 2019-11-14  3193  	u8 *prog;
356ed64991c684 Hou Tao            2021-09-14  3194  	bool save_ret;
fec56f5890d93f Alexei Starovoitov 2019-11-14  3195  
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3196  	/*
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3197  	 * F_INDIRECT is only compatible with F_RET_FENTRY_RET, it is
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3198  	 * explicitly incompatible with F_CALL_ORIG | F_SKIP_FRAME | F_IP_ARG
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3199  	 * because @func_addr.
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3200  	 */
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3201  	WARN_ON_ONCE((flags & BPF_TRAMP_F_INDIRECT) &&
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3202  		     (flags & ~(BPF_TRAMP_F_INDIRECT | BPF_TRAMP_F_RET_FENTRY_RET)));
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3203  
7f788049577032 Pu Lehui           2023-01-05  3204  	/* extra registers for struct arguments */
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3205  	for (i = 0; i < m->nr_args; i++) {
a9c5ad31fbdc4d Yonghong Song      2022-08-31  3206  		if (m->arg_flags[i] & BTF_FMODEL_STRUCT_ARG)
7f788049577032 Pu Lehui           2023-01-05  3207  			nr_regs += (m->arg_size[i] + 7) / 8 - 1;
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3208  	}
7f788049577032 Pu Lehui           2023-01-05  3209  
473e3150e30a2d Menglong Dong      2023-07-13  3210  	/* x86-64 supports up to MAX_BPF_FUNC_ARGS arguments. 1-6
473e3150e30a2d Menglong Dong      2023-07-13  3211  	 * are passed through regs, the remains are through stack.
473e3150e30a2d Menglong Dong      2023-07-13  3212  	 */
473e3150e30a2d Menglong Dong      2023-07-13  3213  	if (nr_regs > MAX_BPF_FUNC_ARGS)
a9c5ad31fbdc4d Yonghong Song      2022-08-31  3214  		return -ENOTSUPP;
a9c5ad31fbdc4d Yonghong Song      2022-08-31  3215  
5edf6a1983b903 Jiri Olsa          2021-12-08  3216  	/* Generated trampoline stack layout:
5edf6a1983b903 Jiri Olsa          2021-12-08  3217  	 *
5edf6a1983b903 Jiri Olsa          2021-12-08  3218  	 * RBP + 8         [ return address  ]
5edf6a1983b903 Jiri Olsa          2021-12-08  3219  	 * RBP + 0         [ RBP             ]
5edf6a1983b903 Jiri Olsa          2021-12-08  3220  	 *
5edf6a1983b903 Jiri Olsa          2021-12-08  3221  	 * RBP - 8         [ return value    ]  BPF_TRAMP_F_CALL_ORIG or
5edf6a1983b903 Jiri Olsa          2021-12-08  3222  	 *                                      BPF_TRAMP_F_RET_FENTRY_RET flags
5edf6a1983b903 Jiri Olsa          2021-12-08  3223  	 *
5edf6a1983b903 Jiri Olsa          2021-12-08  3224  	 *                 [ reg_argN        ]  always
5edf6a1983b903 Jiri Olsa          2021-12-08  3225  	 *                 [ ...             ]
5edf6a1983b903 Jiri Olsa          2021-12-08  3226  	 * RBP - regs_off  [ reg_arg1        ]  program's ctx pointer
5edf6a1983b903 Jiri Olsa          2021-12-08  3227  	 *
7f788049577032 Pu Lehui           2023-01-05  3228  	 * RBP - nregs_off [ regs count	     ]  always
f92c1e183604c2 Jiri Olsa          2021-12-08  3229  	 *
5edf6a1983b903 Jiri Olsa          2021-12-08  3230  	 * RBP - ip_off    [ traced function ]  BPF_TRAMP_F_IP_ARG flag
e384c7b7b46d0a Kui-Feng Lee       2022-05-10  3231  	 *
473e3150e30a2d Menglong Dong      2023-07-13  3232  	 * RBP - rbx_off   [ rbx value       ]  always
473e3150e30a2d Menglong Dong      2023-07-13  3233  	 *
e384c7b7b46d0a Kui-Feng Lee       2022-05-10  3234  	 * RBP - run_ctx_off [ bpf_tramp_run_ctx ]
473e3150e30a2d Menglong Dong      2023-07-13  3235  	 *
473e3150e30a2d Menglong Dong      2023-07-13  3236  	 *                     [ stack_argN ]  BPF_TRAMP_F_CALL_ORIG
473e3150e30a2d Menglong Dong      2023-07-13  3237  	 *                     [ ...        ]
473e3150e30a2d Menglong Dong      2023-07-13  3238  	 *                     [ stack_arg2 ]
473e3150e30a2d Menglong Dong      2023-07-13  3239  	 * RBP - arg_stack_off [ stack_arg1 ]
116e04ba1459fc Leon Hwang         2024-07-14  3240  	 * RSP                 [ tail_call_cnt_ptr ] BPF_TRAMP_F_TAIL_CALL_CTX
5edf6a1983b903 Jiri Olsa          2021-12-08  3241  	 */
5edf6a1983b903 Jiri Olsa          2021-12-08  3242  
356ed64991c684 Hou Tao            2021-09-14  3243  	/* room for return value of orig_call or fentry prog */
356ed64991c684 Hou Tao            2021-09-14  3244  	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
356ed64991c684 Hou Tao            2021-09-14  3245  	if (save_ret)
356ed64991c684 Hou Tao            2021-09-14  3246  		stack_size += 8;
fec56f5890d93f Alexei Starovoitov 2019-11-14  3247  
7f788049577032 Pu Lehui           2023-01-05  3248  	stack_size += nr_regs * 8;
5edf6a1983b903 Jiri Olsa          2021-12-08  3249  	regs_off = stack_size;
5edf6a1983b903 Jiri Olsa          2021-12-08  3250  
7f788049577032 Pu Lehui           2023-01-05  3251  	/* regs count  */
f92c1e183604c2 Jiri Olsa          2021-12-08  3252  	stack_size += 8;
7f788049577032 Pu Lehui           2023-01-05  3253  	nregs_off = stack_size;
f92c1e183604c2 Jiri Olsa          2021-12-08  3254  
7e6f3cd89f04a0 Jiri Olsa          2021-07-14  3255  	if (flags & BPF_TRAMP_F_IP_ARG)
7e6f3cd89f04a0 Jiri Olsa          2021-07-14  3256  		stack_size += 8; /* room for IP address argument */
7e6f3cd89f04a0 Jiri Olsa          2021-07-14  3257  
5edf6a1983b903 Jiri Olsa          2021-12-08  3258  	ip_off = stack_size;
5edf6a1983b903 Jiri Olsa          2021-12-08  3259  
473e3150e30a2d Menglong Dong      2023-07-13  3260  	stack_size += 8;
473e3150e30a2d Menglong Dong      2023-07-13  3261  	rbx_off = stack_size;
473e3150e30a2d Menglong Dong      2023-07-13  3262  
e384c7b7b46d0a Kui-Feng Lee       2022-05-10  3263  	stack_size += (sizeof(struct bpf_tramp_run_ctx) + 7) & ~0x7;
e384c7b7b46d0a Kui-Feng Lee       2022-05-10  3264  	run_ctx_off = stack_size;
e384c7b7b46d0a Kui-Feng Lee       2022-05-10  3265  
473e3150e30a2d Menglong Dong      2023-07-13  3266  	if (nr_regs > 6 && (flags & BPF_TRAMP_F_CALL_ORIG)) {
473e3150e30a2d Menglong Dong      2023-07-13  3267  		/* the space that used to pass arguments on-stack */
473e3150e30a2d Menglong Dong      2023-07-13  3268  		stack_size += (nr_regs - get_nr_used_regs(m)) * 8;
473e3150e30a2d Menglong Dong      2023-07-13  3269  		/* make sure the stack pointer is 16-byte aligned if we
473e3150e30a2d Menglong Dong      2023-07-13  3270  		 * need pass arguments on stack, which means
473e3150e30a2d Menglong Dong      2023-07-13  3271  		 *  [stack_size + 8(rbp) + 8(rip) + 8(origin rip)]
473e3150e30a2d Menglong Dong      2023-07-13  3272  		 * should be 16-byte aligned. Following code depend on
473e3150e30a2d Menglong Dong      2023-07-13  3273  		 * that stack_size is already 8-byte aligned.
473e3150e30a2d Menglong Dong      2023-07-13  3274  		 */
473e3150e30a2d Menglong Dong      2023-07-13  3275  		stack_size += (stack_size % 16) ? 0 : 8;
473e3150e30a2d Menglong Dong      2023-07-13  3276  	}
473e3150e30a2d Menglong Dong      2023-07-13  3277  
473e3150e30a2d Menglong Dong      2023-07-13  3278  	arg_stack_off = stack_size;
473e3150e30a2d Menglong Dong      2023-07-13  3279  
58912710558889 Peter Zijlstra     2022-03-08  3280  	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
fec56f5890d93f Alexei Starovoitov 2019-11-14  3281  		/* skip patched call instruction and point orig_call to actual
fec56f5890d93f Alexei Starovoitov 2019-11-14  3282  		 * body of the kernel function.
fec56f5890d93f Alexei Starovoitov 2019-11-14  3283  		 */
72e213a7ccf9dc Peter Zijlstra     2025-02-07  3284  		if (is_endbr(orig_call))
58912710558889 Peter Zijlstra     2022-03-08  3285  			orig_call += ENDBR_INSN_SIZE;
4b3da77b72ad6b Daniel Borkmann    2019-11-22  3286  		orig_call += X86_PATCH_SIZE;
58912710558889 Peter Zijlstra     2022-03-08  3287  	}
fec56f5890d93f Alexei Starovoitov 2019-11-14  3288  
3ba026fca87861 Song Liu           2023-12-06  3289  	prog = rw_image;
fec56f5890d93f Alexei Starovoitov 2019-11-14  3290  
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3291  	if (flags & BPF_TRAMP_F_INDIRECT) {
ee3e2469b3463d Peter Zijlstra     2022-09-15  3292  		/*
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3293  		 * Indirect call for bpf_struct_ops
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3294  		 */
0c92385dc05ee9 Peter Zijlstra     2025-02-24  3295  		emit_cfi(&prog, image,
0c92385dc05ee9 Peter Zijlstra     2025-02-24  3296  			 cfi_get_func_hash(func_addr),
0c92385dc05ee9 Peter Zijlstra     2025-02-24  3297  			 cfi_get_func_arity(func_addr));
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3298  	} else {
ee3e2469b3463d Peter Zijlstra     2022-09-15  3299  		/*
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3300  		 * Direct-call fentry stub, as such it needs accounting for the
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3301  		 * __fentry__ call.
ee3e2469b3463d Peter Zijlstra     2022-09-15  3302  		 */
6a537453000a91 Joan Bruguera Micó 2024-04-01  3303  		x86_call_depth_emit_accounting(&prog, NULL, image);
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3304  	}
fec56f5890d93f Alexei Starovoitov 2019-11-14  3305  	EMIT1(0x55);		 /* push rbp */
fec56f5890d93f Alexei Starovoitov 2019-11-14  3306  	EMIT3(0x48, 0x89, 0xE5); /* mov rbp, rsp */
fd2bc5b4e261a6 Josh Poimboeuf     2025-12-01 @3307  	if (im)
fd2bc5b4e261a6 Josh Poimboeuf     2025-12-01  3308  		im->ksym.fp_start = prog - (u8 *)rw_image;
fd2bc5b4e261a6 Josh Poimboeuf     2025-12-01  3309  
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3310  	if (!is_imm8(stack_size)) {
473e3150e30a2d Menglong Dong      2023-07-13  3311  		/* sub rsp, stack_size */
473e3150e30a2d Menglong Dong      2023-07-13  3312  		EMIT3_off32(0x48, 0x81, 0xEC, stack_size);
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3313  	} else {
473e3150e30a2d Menglong Dong      2023-07-13  3314  		/* sub rsp, stack_size */
473e3150e30a2d Menglong Dong      2023-07-13  3315  		EMIT4(0x48, 0x83, 0xEC, stack_size);
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3316  	}
2b5dcb31a19a2e Leon Hwang         2023-09-12  3317  	if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
2b5dcb31a19a2e Leon Hwang         2023-09-12  3318  		EMIT1(0x50);		/* push rax */
473e3150e30a2d Menglong Dong      2023-07-13  3319  	/* mov QWORD PTR [rbp - rbx_off], rbx */
473e3150e30a2d Menglong Dong      2023-07-13  3320  	emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_6, -rbx_off);
fec56f5890d93f Alexei Starovoitov 2019-11-14  3321  
a9c5ad31fbdc4d Yonghong Song      2022-08-31  3322  	/* Store number of argument registers of the traced function:
7f788049577032 Pu Lehui           2023-01-05  3323  	 *   mov rax, nr_regs
7f788049577032 Pu Lehui           2023-01-05  3324  	 *   mov QWORD PTR [rbp - nregs_off], rax
f92c1e183604c2 Jiri Olsa          2021-12-08  3325  	 */
7f788049577032 Pu Lehui           2023-01-05  3326  	emit_mov_imm64(&prog, BPF_REG_0, 0, (u32) nr_regs);
7f788049577032 Pu Lehui           2023-01-05  3327  	emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_0, -nregs_off);
f92c1e183604c2 Jiri Olsa          2021-12-08  3328  
7e6f3cd89f04a0 Jiri Olsa          2021-07-14  3329  	if (flags & BPF_TRAMP_F_IP_ARG) {
7e6f3cd89f04a0 Jiri Olsa          2021-07-14  3330  		/* Store IP address of the traced function:
4d854f4f31ec4b Jiri Olsa          2022-09-26  3331  		 * movabsq rax, func_addr
5edf6a1983b903 Jiri Olsa          2021-12-08  3332  		 * mov QWORD PTR [rbp - ip_off], rax
7e6f3cd89f04a0 Jiri Olsa          2021-07-14  3333  		 */
4d854f4f31ec4b Jiri Olsa          2022-09-26  3334  		emit_mov_imm64(&prog, BPF_REG_0, (long) func_addr >> 32, (u32) (long) func_addr);
5edf6a1983b903 Jiri Olsa          2021-12-08  3335  		emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_0, -ip_off);
7e6f3cd89f04a0 Jiri Olsa          2021-07-14  3336  	}
7e6f3cd89f04a0 Jiri Olsa          2021-07-14  3337  
473e3150e30a2d Menglong Dong      2023-07-13  3338  	save_args(m, &prog, regs_off, false);
fec56f5890d93f Alexei Starovoitov 2019-11-14  3339  
e21aa341785c67 Alexei Starovoitov 2021-03-16  3340  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
e21aa341785c67 Alexei Starovoitov 2021-03-16  3341  		/* arg1: mov rdi, im */
e21aa341785c67 Alexei Starovoitov 2021-03-16  3342  		emit_mov_imm64(&prog, BPF_REG_1, (long) im >> 32, (u32) (long) im);
3ba026fca87861 Song Liu           2023-12-06  3343  		if (emit_rsb_call(&prog, __bpf_tramp_enter,
3ba026fca87861 Song Liu           2023-12-06  3344  				  image + (prog - (u8 *)rw_image))) {
e21aa341785c67 Alexei Starovoitov 2021-03-16  3345  			ret = -EINVAL;
e21aa341785c67 Alexei Starovoitov 2021-03-16  3346  			goto cleanup;
e21aa341785c67 Alexei Starovoitov 2021-03-16  3347  		}
e21aa341785c67 Alexei Starovoitov 2021-03-16  3348  	}
e21aa341785c67 Alexei Starovoitov 2021-03-16  3349  
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3350  	if (fentry->nr_links) {
e384c7b7b46d0a Kui-Feng Lee       2022-05-10  3351  		if (invoke_bpf(m, &prog, fentry, regs_off, run_ctx_off,
3ba026fca87861 Song Liu           2023-12-06  3352  			       flags & BPF_TRAMP_F_RET_FENTRY_RET, image, rw_image))
fec56f5890d93f Alexei Starovoitov 2019-11-14  3353  			return -EINVAL;
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3354  	}
fec56f5890d93f Alexei Starovoitov 2019-11-14  3355  
f7e0beaf39d386 Kui-Feng Lee       2022-05-10  3356  	if (fmod_ret->nr_links) {
f7e0beaf39d386 Kui-Feng Lee       2022-05-10  3357  		branches = kcalloc(fmod_ret->nr_links, sizeof(u8 *),
ae24082331d9bb KP Singh           2020-03-04  3358  				   GFP_KERNEL);
ae24082331d9bb KP Singh           2020-03-04  3359  		if (!branches)
ae24082331d9bb KP Singh           2020-03-04  3360  			return -ENOMEM;
ae24082331d9bb KP Singh           2020-03-04  3361  
5edf6a1983b903 Jiri Olsa          2021-12-08  3362  		if (invoke_bpf_mod_ret(m, &prog, fmod_ret, regs_off,
3ba026fca87861 Song Liu           2023-12-06  3363  				       run_ctx_off, branches, image, rw_image)) {
ae24082331d9bb KP Singh           2020-03-04  3364  			ret = -EINVAL;
ae24082331d9bb KP Singh           2020-03-04  3365  			goto cleanup;
ae24082331d9bb KP Singh           2020-03-04  3366  		}
ae24082331d9bb KP Singh           2020-03-04  3367  	}
ae24082331d9bb KP Singh           2020-03-04  3368  
fec56f5890d93f Alexei Starovoitov 2019-11-14  3369  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
473e3150e30a2d Menglong Dong      2023-07-13  3370  		restore_regs(m, &prog, regs_off);
473e3150e30a2d Menglong Dong      2023-07-13  3371  		save_args(m, &prog, arg_stack_off, true);
fec56f5890d93f Alexei Starovoitov 2019-11-14  3372  
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3373  		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX) {
116e04ba1459fc Leon Hwang         2024-07-14  3374  			/* Before calling the original function, load the
116e04ba1459fc Leon Hwang         2024-07-14  3375  			 * tail_call_cnt_ptr from stack to rax.
2b5dcb31a19a2e Leon Hwang         2023-09-12  3376  			 */
116e04ba1459fc Leon Hwang         2024-07-14  3377  			LOAD_TRAMP_TAIL_CALL_CNT_PTR(stack_size);
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3378  		}
2b5dcb31a19a2e Leon Hwang         2023-09-12  3379  
316cba62dfb787 Jiri Olsa          2022-07-19  3380  		if (flags & BPF_TRAMP_F_ORIG_STACK) {
2b5dcb31a19a2e Leon Hwang         2023-09-12  3381  			emit_ldx(&prog, BPF_DW, BPF_REG_6, BPF_REG_FP, 8);
2b5dcb31a19a2e Leon Hwang         2023-09-12  3382  			EMIT2(0xff, 0xd3); /* call *rbx */
316cba62dfb787 Jiri Olsa          2022-07-19  3383  		} else {
fec56f5890d93f Alexei Starovoitov 2019-11-14  3384  			/* call original function */
3ba026fca87861 Song Liu           2023-12-06  3385  			if (emit_rsb_call(&prog, orig_call, image + (prog - (u8 *)rw_image))) {
ae24082331d9bb KP Singh           2020-03-04  3386  				ret = -EINVAL;
ae24082331d9bb KP Singh           2020-03-04  3387  				goto cleanup;
ae24082331d9bb KP Singh           2020-03-04  3388  			}
316cba62dfb787 Jiri Olsa          2022-07-19  3389  		}
fec56f5890d93f Alexei Starovoitov 2019-11-14  3390  		/* remember return value in a stack for bpf prog to access */
fec56f5890d93f Alexei Starovoitov 2019-11-14  3391  		emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_0, -8);
3ba026fca87861 Song Liu           2023-12-06 @3392  		im->ip_after_call = image + (prog - (u8 *)rw_image);
00bc8988807985 Leon Hwang         2024-01-04  3393  		emit_nops(&prog, X86_PATCH_SIZE);
fec56f5890d93f Alexei Starovoitov 2019-11-14  3394  	}
fec56f5890d93f Alexei Starovoitov 2019-11-14  3395  
f7e0beaf39d386 Kui-Feng Lee       2022-05-10  3396  	if (fmod_ret->nr_links) {
ae24082331d9bb KP Singh           2020-03-04  3397  		/* From Intel 64 and IA-32 Architectures Optimization
ae24082331d9bb KP Singh           2020-03-04  3398  		 * Reference Manual, 3.4.1.4 Code Alignment, Assembly/Compiler
ae24082331d9bb KP Singh           2020-03-04  3399  		 * Coding Rule 11: All branch targets should be 16-byte
ae24082331d9bb KP Singh           2020-03-04  3400  		 * aligned.
ae24082331d9bb KP Singh           2020-03-04  3401  		 */
ae24082331d9bb KP Singh           2020-03-04  3402  		emit_align(&prog, 16);
ae24082331d9bb KP Singh           2020-03-04  3403  		/* Update the branches saved in invoke_bpf_mod_ret with the
ae24082331d9bb KP Singh           2020-03-04  3404  		 * aligned address of do_fexit.
ae24082331d9bb KP Singh           2020-03-04  3405  		 */
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3406  		for (i = 0; i < fmod_ret->nr_links; i++) {
3ba026fca87861 Song Liu           2023-12-06  3407  			emit_cond_near_jump(&branches[i], image + (prog - (u8 *)rw_image),
3ba026fca87861 Song Liu           2023-12-06  3408  					    image + (branches[i] - (u8 *)rw_image), X86_JNE);
ae24082331d9bb KP Singh           2020-03-04  3409  		}
ae24082331d9bb KP Singh           2020-03-04  3410  	}
ae24082331d9bb KP Singh           2020-03-04  3411  
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3412  	if (fexit->nr_links) {
3ba026fca87861 Song Liu           2023-12-06  3413  		if (invoke_bpf(m, &prog, fexit, regs_off, run_ctx_off,
3ba026fca87861 Song Liu           2023-12-06  3414  			       false, image, rw_image)) {
ae24082331d9bb KP Singh           2020-03-04  3415  			ret = -EINVAL;
ae24082331d9bb KP Singh           2020-03-04  3416  			goto cleanup;
ae24082331d9bb KP Singh           2020-03-04  3417  		}
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3418  	}
fec56f5890d93f Alexei Starovoitov 2019-11-14  3419  
fec56f5890d93f Alexei Starovoitov 2019-11-14  3420  	if (flags & BPF_TRAMP_F_RESTORE_REGS)
473e3150e30a2d Menglong Dong      2023-07-13  3421  		restore_regs(m, &prog, regs_off);
fec56f5890d93f Alexei Starovoitov 2019-11-14  3422  
ae24082331d9bb KP Singh           2020-03-04  3423  	/* This needs to be done regardless. If there were fmod_ret programs,
ae24082331d9bb KP Singh           2020-03-04  3424  	 * the return value is only updated on the stack and still needs to be
ae24082331d9bb KP Singh           2020-03-04  3425  	 * restored to R0.
ae24082331d9bb KP Singh           2020-03-04  3426  	 */
e21aa341785c67 Alexei Starovoitov 2021-03-16  3427  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
3ba026fca87861 Song Liu           2023-12-06  3428  		im->ip_epilogue = image + (prog - (u8 *)rw_image);
e21aa341785c67 Alexei Starovoitov 2021-03-16  3429  		/* arg1: mov rdi, im */
e21aa341785c67 Alexei Starovoitov 2021-03-16  3430  		emit_mov_imm64(&prog, BPF_REG_1, (long) im >> 32, (u32) (long) im);
3ba026fca87861 Song Liu           2023-12-06  3431  		if (emit_rsb_call(&prog, __bpf_tramp_exit, image + (prog - (u8 *)rw_image))) {
e21aa341785c67 Alexei Starovoitov 2021-03-16  3432  			ret = -EINVAL;
e21aa341785c67 Alexei Starovoitov 2021-03-16  3433  			goto cleanup;
e21aa341785c67 Alexei Starovoitov 2021-03-16  3434  		}
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3435  	} else if (flags & BPF_TRAMP_F_TAIL_CALL_CTX) {
116e04ba1459fc Leon Hwang         2024-07-14  3436  		/* Before running the original function, load the
116e04ba1459fc Leon Hwang         2024-07-14  3437  		 * tail_call_cnt_ptr from stack to rax.
2b5dcb31a19a2e Leon Hwang         2023-09-12  3438  		 */
116e04ba1459fc Leon Hwang         2024-07-14  3439  		LOAD_TRAMP_TAIL_CALL_CNT_PTR(stack_size);
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3440  	}
2b5dcb31a19a2e Leon Hwang         2023-09-12  3441  
356ed64991c684 Hou Tao            2021-09-14  3442  	/* restore return value of orig_call or fentry prog back into RAX */
356ed64991c684 Hou Tao            2021-09-14  3443  	if (save_ret)
356ed64991c684 Hou Tao            2021-09-14  3444  		emit_ldx(&prog, BPF_DW, BPF_REG_0, BPF_REG_FP, -8);
fec56f5890d93f Alexei Starovoitov 2019-11-14  3445  
473e3150e30a2d Menglong Dong      2023-07-13  3446  	emit_ldx(&prog, BPF_DW, BPF_REG_6, BPF_REG_FP, -rbx_off);
fd2bc5b4e261a6 Josh Poimboeuf     2025-12-01  3447  
fec56f5890d93f Alexei Starovoitov 2019-11-14  3448  	EMIT1(0xC9); /* leave */
fd2bc5b4e261a6 Josh Poimboeuf     2025-12-01  3449  	if (im)
fd2bc5b4e261a6 Josh Poimboeuf     2025-12-01  3450  		im->ksym.fp_end = prog - (u8 *)rw_image;
fd2bc5b4e261a6 Josh Poimboeuf     2025-12-01  3451  
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3452  	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
fec56f5890d93f Alexei Starovoitov 2019-11-14  3453  		/* skip our return address and return to parent */
fec56f5890d93f Alexei Starovoitov 2019-11-14  3454  		EMIT4(0x48, 0x83, 0xC4, 8); /* add rsp, 8 */
2cd3e3772e4137 Peter Zijlstra     2023-12-15  3455  	}
3ba026fca87861 Song Liu           2023-12-06  3456  	emit_return(&prog, image + (prog - (u8 *)rw_image));
85d33df357b634 Martin KaFai Lau   2020-01-08  3457  	/* Make sure the trampoline generation logic doesn't overflow */
3ba026fca87861 Song Liu           2023-12-06  3458  	if (WARN_ON_ONCE(prog > (u8 *)rw_image_end - BPF_INSN_SAFETY)) {
ae24082331d9bb KP Singh           2020-03-04  3459  		ret = -EFAULT;
ae24082331d9bb KP Singh           2020-03-04  3460  		goto cleanup;
ae24082331d9bb KP Singh           2020-03-04  3461  	}
3ba026fca87861 Song Liu           2023-12-06  3462  	ret = prog - (u8 *)rw_image + BPF_INSN_SAFETY;
ae24082331d9bb KP Singh           2020-03-04  3463  
ae24082331d9bb KP Singh           2020-03-04  3464  cleanup:
ae24082331d9bb KP Singh           2020-03-04  3465  	kfree(branches);
ae24082331d9bb KP Singh           2020-03-04  3466  	return ret;
fec56f5890d93f Alexei Starovoitov 2019-11-14  3467  }
fec56f5890d93f Alexei Starovoitov 2019-11-14  3468  

:::::: The code at line 3392 was first introduced by commit
:::::: 3ba026fca8786161b0c4d75be396e61d6816e0a1 x86, bpf: Use bpf_prog_pack for bpf trampoline

:::::: TO: Song Liu <song@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
