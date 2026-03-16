Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D60283FC9
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 23:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773705467; cv=none; b=O/Ip5SAdHSGXyBQ2m3TNG+VjuonpJC5CqwVvq7LVWmB9kjB6bPJT9CqYHlf/IdOYPAGUtpUqQgSwDO1nxltkUvr6FCbwOyQJmfowaXNA9PYgKHhw4uLWLktNdIosoBJXvYb6gNfR27JMOxOIOYASpXitj245A8KSJvGXqLYHl5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773705467; c=relaxed/simple;
	bh=p+NtutF594+xz51LNFqFGzoBzE6Ce6ZZxVR6eRZGZsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mC70HyrMBmtTNcs/VhmnExLLnnQ+nTmOt5WVs2aVm2q5/MrgJexjQa5zONacZMjR087LOJ4FFCYaegmmihXJvQtJqJu1xcaCSVbRGAxapjSVhrI1TZ3ADhRf4ssMSdMKZCKoknvwfu5bI9xWYQDBS7xtaXw1dT4BS8FnZ4W4tOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Chx+KSvr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Chx+KSvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773705464; x=1805241464;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p+NtutF594+xz51LNFqFGzoBzE6Ce6ZZxVR6eRZGZsE=;
  b=Chx+KSvrI0dUp1iml+0NQKBLQ2pl2L/2Y+5IfeEcuZxrsytrQLI2JuV5
   +6TbtMCcXqIT9comlvrd5WBZat02M7vIBlk+C6nwcLi0Nq83HMSJqheS5
   T3PGZ2kFkx1QtQP0Ys9vAjM5JCO49iyKEEsCpDDi6l3RXKl8qTFOJO4Ij
   kP4ef8ZNnx1gj+dWbffnr+NO84bYf4EnfNu89uWw0LEo7HLX9fUKu9oYG
   9X/I5UhIDgIsQm3xOoT014wV5puBspXPQ1gyJNGJeKKpsEUL1Yxd1022A
   TIFSLCK1nVGaUXsJcffcPsZiI7mU7bihEfJDL9nN1qjIRkbn9QWCqyuQX
   A==;
X-CSE-ConnectionGUID: bKXVNlfTSQyeeWKXcHJeYA==
X-CSE-MsgGUID: UoV9Tvu6TuKcmlN5jIgsDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85048597"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85048597"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 16:57:43 -0700
X-CSE-ConnectionGUID: Bx3tk0YBToK6J0yzx+l7hA==
X-CSE-MsgGUID: +TrtgVVmTRCB86WFSn0dog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="246845600"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Mar 2026 16:57:41 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2HoZ-000000001UC-2GwG;
	Mon, 16 Mar 2026 23:57:39 +0000
Date: Tue, 17 Mar 2026 07:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/net/bpf_jit_comp.c:3418
 __arch_prepare_bpf_trampoline() error: we previously assumed 'im' could be
 null (see line 3333)
Message-ID: <202603170724.QnAw4z5m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2d1373e4246da3b58e1df058374ed6b101804e07
commit: ca45c84afb8c91a8d688b0012657099c24f59266 bpf: Add bpf_has_frame_poi=
nter()
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r073-20260316 (https://download.01.org/0day-ci/ar=
chive/20260317/202603170724.QnAw4z5m-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603170724.QnAw4z5m-lkp@intel.com/

smatch warnings:
arch/x86/net/bpf_jit_comp.c:3418 __arch_prepare_bpf_trampoline() error: we =
previously assumed 'im' could be null (see line 3333)

vim +/im +3418 arch/x86/net/bpf_jit_comp.c

fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3136 =20
116e04ba1459fc08 Leon Hwang         2024-07-14  3137  /* mov rax, qword ptr=
 [rbp - rounded_stack_depth - 8] */
116e04ba1459fc08 Leon Hwang         2024-07-14  3138  #define LOAD_TRAMP_TA=
IL_CALL_CNT_PTR(stack)	\
116e04ba1459fc08 Leon Hwang         2024-07-14  3139  	__LOAD_TCC_PTR(-roun=
d_up(stack, 8) - 8)
116e04ba1459fc08 Leon Hwang         2024-07-14  3140 =20
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3141  /* Example:
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3142   * __be16 eth_type_tr=
ans(struct sk_buff *skb, struct net_device *dev);
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3143   * its 'struct btf_fu=
nc_model' will be nr_args=3D2
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3144   * The assembly code =
when eth_type_trans is executing after trampoline:
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3145   *
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3146   * push rbp
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3147   * mov rbp, rsp
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3148   * sub rsp, 16       =
              // space for skb and dev
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3149   * push rbx          =
              // temp regs to pass start time
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3150   * mov qword ptr [rbp=
 - 16], rdi   // save skb pointer to stack
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3151   * mov qword ptr [rbp=
 - 8], rsi    // save dev pointer to stack
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3152   * call __bpf_prog_en=
ter           // rcu_read_lock and preempt_disable
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3153   * mov rbx, rax      =
              // remember start time in bpf stats are enabled
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3154   * lea rdi, [rbp - 16=
]             // R1=3D=3Dctx of bpf prog
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3155   * call addr_of_jited=
_FENTRY_prog
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3156   * movabsq rdi, 64bit=
_addr_of_struct_bpf_prog  // unused if bpf stats are off
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3157   * mov rsi, rbx      =
              // prog start time
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3158   * call __bpf_prog_ex=
it            // rcu_read_unlock, preempt_enable and stats math
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3159   * mov rdi, qword ptr=
 [rbp - 16]   // restore skb pointer from stack
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3160   * mov rsi, qword ptr=
 [rbp - 8]    // restore dev pointer from stack
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3161   * pop rbx
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3162   * leave
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3163   * ret
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3164   *
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3165   * eth_type_trans has=
 5 byte nop at the beginning. These 5 bytes will be
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3166   * replaced with 'cal=
l generated_bpf_trampoline'. When it returns
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3167   * eth_type_trans wil=
l continue executing with original skb and dev pointers.
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3168   *
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3169   * The assembly code =
when eth_type_trans is called from trampoline:
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3170   *
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3171   * push rbp
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3172   * mov rbp, rsp
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3173   * sub rsp, 24       =
              // space for skb, dev, return value
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3174   * push rbx          =
              // temp regs to pass start time
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3175   * mov qword ptr [rbp=
 - 24], rdi   // save skb pointer to stack
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3176   * mov qword ptr [rbp=
 - 16], rsi   // save dev pointer to stack
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3177   * call __bpf_prog_en=
ter           // rcu_read_lock and preempt_disable
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3178   * mov rbx, rax      =
              // remember start time if bpf stats are enabled
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3179   * lea rdi, [rbp - 24=
]             // R1=3D=3Dctx of bpf prog
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3180   * call addr_of_jited=
_FENTRY_prog  // bpf prog can access skb and dev
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3181   * movabsq rdi, 64bit=
_addr_of_struct_bpf_prog  // unused if bpf stats are off
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3182   * mov rsi, rbx      =
              // prog start time
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3183   * call __bpf_prog_ex=
it            // rcu_read_unlock, preempt_enable and stats math
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3184   * mov rdi, qword ptr=
 [rbp - 24]   // restore skb pointer from stack
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3185   * mov rsi, qword ptr=
 [rbp - 16]   // restore dev pointer from stack
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3186   * call eth_type_tran=
s+5           // execute body of eth_type_trans
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3187   * mov qword ptr [rbp=
 - 8], rax    // save return value
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3188   * call __bpf_prog_en=
ter           // rcu_read_lock and preempt_disable
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3189   * mov rbx, rax      =
              // remember start time in bpf stats are enabled
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3190   * lea rdi, [rbp - 24=
]             // R1=3D=3Dctx of bpf prog
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3191   * call addr_of_jited=
_FEXIT_prog   // bpf prog can access skb, dev, return value
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3192   * movabsq rdi, 64bit=
_addr_of_struct_bpf_prog  // unused if bpf stats are off
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3193   * mov rsi, rbx      =
              // prog start time
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3194   * call __bpf_prog_ex=
it            // rcu_read_unlock, preempt_enable and stats math
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3195   * mov rax, qword ptr=
 [rbp - 8]    // restore eth_type_trans's return value
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3196   * pop rbx
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3197   * leave
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3198   * add rsp, 8        =
              // skip eth_type_trans's frame
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3199   * ret               =
              // return to its caller
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3200   */
3ba026fca8786161 Song Liu           2023-12-06  3201  static int __arch_pre=
pare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_image,
3ba026fca8786161 Song Liu           2023-12-06  3202  					 void *rw_image_=
end, void *image,
85d33df357b63464 Martin KaFai Lau   2020-01-08  3203  					 const struct bt=
f_func_model *m, u32 flags,
f7e0beaf39d3868d Kui-Feng Lee       2022-05-10  3204  					 struct bpf_tram=
p_links *tlinks,
4d854f4f31ec4b31 Jiri Olsa          2022-09-26  3205  					 void *func_addr)
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3206  {
7f7880495770329d Pu Lehui           2023-01-05  3207  	int i, ret, nr_regs =
=3D m->nr_args, stack_size =3D 0;
473e3150e30a2db4 Menglong Dong      2023-07-13  3208  	int regs_off, nregs_=
off, ip_off, run_ctx_off, arg_stack_off, rbx_off;
f7e0beaf39d3868d Kui-Feng Lee       2022-05-10  3209  	struct bpf_tramp_lin=
ks *fentry =3D &tlinks[BPF_TRAMP_FENTRY];
f7e0beaf39d3868d Kui-Feng Lee       2022-05-10  3210  	struct bpf_tramp_lin=
ks *fexit =3D &tlinks[BPF_TRAMP_FEXIT];
f7e0beaf39d3868d Kui-Feng Lee       2022-05-10  3211  	struct bpf_tramp_lin=
ks *fmod_ret =3D &tlinks[BPF_TRAMP_MODIFY_RETURN];
4d854f4f31ec4b31 Jiri Olsa          2022-09-26  3212  	void *orig_call =3D =
func_addr;
ae24082331d9bbaa KP Singh           2020-03-04  3213  	u8 **branches =3D NU=
LL;
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3214  	u8 *prog;
356ed64991c6847a Hou Tao            2021-09-14  3215  	bool save_ret;
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3216 =20
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3217  	/*
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3218  	 * F_INDIRECT is onl=
y compatible with F_RET_FENTRY_RET, it is
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3219  	 * explicitly incomp=
atible with F_CALL_ORIG | F_SKIP_FRAME | F_IP_ARG
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3220  	 * because @func_add=
r.
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3221  	 */
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3222  	WARN_ON_ONCE((flags =
& BPF_TRAMP_F_INDIRECT) &&
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3223  		     (flags & ~(BPF=
_TRAMP_F_INDIRECT | BPF_TRAMP_F_RET_FENTRY_RET)));
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3224 =20
7f7880495770329d Pu Lehui           2023-01-05  3225  	/* extra registers f=
or struct arguments */
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3226  	for (i =3D 0; i < m-=
>nr_args; i++) {
a9c5ad31fbdc4dec Yonghong Song      2022-08-31  3227  		if (m->arg_flags[i]=
 & BTF_FMODEL_STRUCT_ARG)
7f7880495770329d Pu Lehui           2023-01-05  3228  			nr_regs +=3D (m->a=
rg_size[i] + 7) / 8 - 1;
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3229  	}
7f7880495770329d Pu Lehui           2023-01-05  3230 =20
473e3150e30a2db4 Menglong Dong      2023-07-13  3231  	/* x86-64 supports u=
p to MAX_BPF_FUNC_ARGS arguments. 1-6
473e3150e30a2db4 Menglong Dong      2023-07-13  3232  	 * are passed throug=
h regs, the remains are through stack.
473e3150e30a2db4 Menglong Dong      2023-07-13  3233  	 */
473e3150e30a2db4 Menglong Dong      2023-07-13  3234  	if (nr_regs > MAX_BP=
F_FUNC_ARGS)
a9c5ad31fbdc4dec Yonghong Song      2022-08-31  3235  		return -ENOTSUPP;
a9c5ad31fbdc4dec Yonghong Song      2022-08-31  3236 =20
5edf6a1983b90371 Jiri Olsa          2021-12-08  3237  	/* Generated trampol=
ine stack layout:
5edf6a1983b90371 Jiri Olsa          2021-12-08  3238  	 *
5edf6a1983b90371 Jiri Olsa          2021-12-08  3239  	 * RBP + 8         [=
 return address  ]
5edf6a1983b90371 Jiri Olsa          2021-12-08  3240  	 * RBP + 0         [=
 RBP             ]
5edf6a1983b90371 Jiri Olsa          2021-12-08  3241  	 *
5edf6a1983b90371 Jiri Olsa          2021-12-08  3242  	 * RBP - 8         [=
 return value    ]  BPF_TRAMP_F_CALL_ORIG or
5edf6a1983b90371 Jiri Olsa          2021-12-08  3243  	 *                  =
                    BPF_TRAMP_F_RET_FENTRY_RET flags
5edf6a1983b90371 Jiri Olsa          2021-12-08  3244  	 *
5edf6a1983b90371 Jiri Olsa          2021-12-08  3245  	 *                 [=
 reg_argN        ]  always
5edf6a1983b90371 Jiri Olsa          2021-12-08  3246  	 *                 [=
 ...             ]
5edf6a1983b90371 Jiri Olsa          2021-12-08  3247  	 * RBP - regs_off  [=
 reg_arg1        ]  program's ctx pointer
5edf6a1983b90371 Jiri Olsa          2021-12-08  3248  	 *
7f7880495770329d Pu Lehui           2023-01-05  3249  	 * RBP - nregs_off [=
 regs count	     ]  always
f92c1e183604c20c Jiri Olsa          2021-12-08  3250  	 *
5edf6a1983b90371 Jiri Olsa          2021-12-08  3251  	 * RBP - ip_off    [=
 traced function ]  BPF_TRAMP_F_IP_ARG flag
e384c7b7b46d0a5f Kui-Feng Lee       2022-05-10  3252  	 *
473e3150e30a2db4 Menglong Dong      2023-07-13  3253  	 * RBP - rbx_off   [=
 rbx value       ]  always
473e3150e30a2db4 Menglong Dong      2023-07-13  3254  	 *
e384c7b7b46d0a5f Kui-Feng Lee       2022-05-10  3255  	 * RBP - run_ctx_off=
 [ bpf_tramp_run_ctx ]
473e3150e30a2db4 Menglong Dong      2023-07-13  3256  	 *
473e3150e30a2db4 Menglong Dong      2023-07-13  3257  	 *                  =
   [ stack_argN ]  BPF_TRAMP_F_CALL_ORIG
473e3150e30a2db4 Menglong Dong      2023-07-13  3258  	 *                  =
   [ ...        ]
473e3150e30a2db4 Menglong Dong      2023-07-13  3259  	 *                  =
   [ stack_arg2 ]
473e3150e30a2db4 Menglong Dong      2023-07-13  3260  	 * RBP - arg_stack_o=
ff [ stack_arg1 ]
116e04ba1459fc08 Leon Hwang         2024-07-14  3261  	 * RSP              =
   [ tail_call_cnt_ptr ] BPF_TRAMP_F_TAIL_CALL_CTX
5edf6a1983b90371 Jiri Olsa          2021-12-08  3262  	 */
5edf6a1983b90371 Jiri Olsa          2021-12-08  3263 =20
356ed64991c6847a Hou Tao            2021-09-14  3264  	/* room for return v=
alue of orig_call or fentry prog */
356ed64991c6847a Hou Tao            2021-09-14  3265  	save_ret =3D flags &=
 (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
356ed64991c6847a Hou Tao            2021-09-14  3266  	if (save_ret)
356ed64991c6847a Hou Tao            2021-09-14  3267  		stack_size +=3D 8;
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3268 =20
7f7880495770329d Pu Lehui           2023-01-05  3269  	stack_size +=3D nr_r=
egs * 8;
5edf6a1983b90371 Jiri Olsa          2021-12-08  3270  	regs_off =3D stack_s=
ize;
5edf6a1983b90371 Jiri Olsa          2021-12-08  3271 =20
7f7880495770329d Pu Lehui           2023-01-05  3272  	/* regs count  */
f92c1e183604c20c Jiri Olsa          2021-12-08  3273  	stack_size +=3D 8;
7f7880495770329d Pu Lehui           2023-01-05  3274  	nregs_off =3D stack_=
size;
f92c1e183604c20c Jiri Olsa          2021-12-08  3275 =20
7e6f3cd89f04a0a5 Jiri Olsa          2021-07-14  3276  	if (flags & BPF_TRAM=
P_F_IP_ARG)
7e6f3cd89f04a0a5 Jiri Olsa          2021-07-14  3277  		stack_size +=3D 8; =
/* room for IP address argument */
7e6f3cd89f04a0a5 Jiri Olsa          2021-07-14  3278 =20
5edf6a1983b90371 Jiri Olsa          2021-12-08  3279  	ip_off =3D stack_siz=
e;
5edf6a1983b90371 Jiri Olsa          2021-12-08  3280 =20
473e3150e30a2db4 Menglong Dong      2023-07-13  3281  	stack_size +=3D 8;
473e3150e30a2db4 Menglong Dong      2023-07-13  3282  	rbx_off =3D stack_si=
ze;
473e3150e30a2db4 Menglong Dong      2023-07-13  3283 =20
e384c7b7b46d0a5f Kui-Feng Lee       2022-05-10  3284  	stack_size +=3D (siz=
eof(struct bpf_tramp_run_ctx) + 7) & ~0x7;
e384c7b7b46d0a5f Kui-Feng Lee       2022-05-10  3285  	run_ctx_off =3D stac=
k_size;
e384c7b7b46d0a5f Kui-Feng Lee       2022-05-10  3286 =20
473e3150e30a2db4 Menglong Dong      2023-07-13  3287  	if (nr_regs > 6 && (=
flags & BPF_TRAMP_F_CALL_ORIG)) {
473e3150e30a2db4 Menglong Dong      2023-07-13  3288  		/* the space that u=
sed to pass arguments on-stack */
473e3150e30a2db4 Menglong Dong      2023-07-13  3289  		stack_size +=3D (nr=
_regs - get_nr_used_regs(m)) * 8;
473e3150e30a2db4 Menglong Dong      2023-07-13  3290  		/* make sure the st=
ack pointer is 16-byte aligned if we
473e3150e30a2db4 Menglong Dong      2023-07-13  3291  		 * need pass argume=
nts on stack, which means
473e3150e30a2db4 Menglong Dong      2023-07-13  3292  		 *  [stack_size + 8=
(rbp) + 8(rip) + 8(origin rip)]
473e3150e30a2db4 Menglong Dong      2023-07-13  3293  		 * should be 16-byt=
e aligned. Following code depend on
473e3150e30a2db4 Menglong Dong      2023-07-13  3294  		 * that stack_size =
is already 8-byte aligned.
473e3150e30a2db4 Menglong Dong      2023-07-13  3295  		 */
373f2f44c300815c Menglong Dong      2025-11-18  3296  		if (bpf_trampoline_=
use_jmp(flags)) {
373f2f44c300815c Menglong Dong      2025-11-18  3297  			/* no rip in the "=
jmp" case */
373f2f44c300815c Menglong Dong      2025-11-18  3298  			stack_size +=3D (s=
tack_size % 16) ? 8 : 0;
373f2f44c300815c Menglong Dong      2025-11-18  3299  		} else {
473e3150e30a2db4 Menglong Dong      2023-07-13  3300  			stack_size +=3D (s=
tack_size % 16) ? 0 : 8;
473e3150e30a2db4 Menglong Dong      2023-07-13  3301  		}
373f2f44c300815c Menglong Dong      2025-11-18  3302  	}
473e3150e30a2db4 Menglong Dong      2023-07-13  3303 =20
473e3150e30a2db4 Menglong Dong      2023-07-13  3304  	arg_stack_off =3D st=
ack_size;
473e3150e30a2db4 Menglong Dong      2023-07-13  3305 =20
47c9214dcbea9043 Menglong Dong      2025-11-18  3306  	if (flags & BPF_TRAM=
P_F_CALL_ORIG) {
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3307  		/* skip patched cal=
l instruction and point orig_call to actual
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3308  		 * body of the kern=
el function.
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3309  		 */
72e213a7ccf9dc78 Peter Zijlstra     2025-02-07  3310  		if (is_endbr(orig_c=
all))
5891271055888962 Peter Zijlstra     2022-03-08  3311  			orig_call +=3D END=
BR_INSN_SIZE;
4b3da77b72ad6b3c Daniel Borkmann    2019-11-22  3312  		orig_call +=3D X86_=
PATCH_SIZE;
5891271055888962 Peter Zijlstra     2022-03-08  3313  	}
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3314 =20
3ba026fca8786161 Song Liu           2023-12-06  3315  	prog =3D rw_image;
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3316 =20
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3317  	if (flags & BPF_TRAM=
P_F_INDIRECT) {
ee3e2469b3463d28 Peter Zijlstra     2022-09-15  3318  		/*
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3319  		 * Indirect call fo=
r bpf_struct_ops
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3320  		 */
0c92385dc05ee963 Peter Zijlstra     2025-02-24  3321  		emit_cfi(&prog, ima=
ge,
0c92385dc05ee963 Peter Zijlstra     2025-02-24  3322  			 cfi_get_func_hash=
(func_addr),
0c92385dc05ee963 Peter Zijlstra     2025-02-24  3323  			 cfi_get_func_arit=
y(func_addr));
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3324  	} else {
ee3e2469b3463d28 Peter Zijlstra     2022-09-15  3325  		/*
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3326  		 * Direct-call fent=
ry stub, as such it needs accounting for the
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3327  		 * __fentry__ call.
ee3e2469b3463d28 Peter Zijlstra     2022-09-15  3328  		 */
6a537453000a9163 Joan Bruguera Mic=C3=B3 2024-04-01  3329  		x86_call_depth=
_emit_accounting(&prog, NULL, image);
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3330  	}
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3331  	EMIT1(0x55);		 /* pu=
sh rbp */
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3332  	EMIT3(0x48, 0x89, 0x=
E5); /* mov rbp, rsp */
ca45c84afb8c91a8 Josh Poimboeuf     2025-12-03 @3333  	if (im)
ca45c84afb8c91a8 Josh Poimboeuf     2025-12-03  3334  		im->ksym.fp_start =
=3D prog - (u8 *)rw_image;
ca45c84afb8c91a8 Josh Poimboeuf     2025-12-03  3335 =20
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3336  	if (!is_imm8(stack_s=
ize)) {
473e3150e30a2db4 Menglong Dong      2023-07-13  3337  		/* sub rsp, stack_s=
ize */
473e3150e30a2db4 Menglong Dong      2023-07-13  3338  		EMIT3_off32(0x48, 0=
x81, 0xEC, stack_size);
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3339  	} else {
473e3150e30a2db4 Menglong Dong      2023-07-13  3340  		/* sub rsp, stack_s=
ize */
473e3150e30a2db4 Menglong Dong      2023-07-13  3341  		EMIT4(0x48, 0x83, 0=
xEC, stack_size);
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3342  	}
2b5dcb31a19a2e0a Leon Hwang         2023-09-12  3343  	if (flags & BPF_TRAM=
P_F_TAIL_CALL_CTX)
2b5dcb31a19a2e0a Leon Hwang         2023-09-12  3344  		EMIT1(0x50);		/* pu=
sh rax */
473e3150e30a2db4 Menglong Dong      2023-07-13  3345  	/* mov QWORD PTR [rb=
p - rbx_off], rbx */
473e3150e30a2db4 Menglong Dong      2023-07-13  3346  	emit_stx(&prog, BPF_=
DW, BPF_REG_FP, BPF_REG_6, -rbx_off);
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3347 =20
a9c5ad31fbdc4dec Yonghong Song      2022-08-31  3348  	/* Store number of a=
rgument registers of the traced function:
7f7880495770329d Pu Lehui           2023-01-05  3349  	 *   mov rax, nr_regs
7f7880495770329d Pu Lehui           2023-01-05  3350  	 *   mov QWORD PTR [=
rbp - nregs_off], rax
f92c1e183604c20c Jiri Olsa          2021-12-08  3351  	 */
7f7880495770329d Pu Lehui           2023-01-05  3352  	emit_mov_imm64(&prog=
, BPF_REG_0, 0, (u32) nr_regs);
7f7880495770329d Pu Lehui           2023-01-05  3353  	emit_stx(&prog, BPF_=
DW, BPF_REG_FP, BPF_REG_0, -nregs_off);
f92c1e183604c20c Jiri Olsa          2021-12-08  3354 =20
7e6f3cd89f04a0a5 Jiri Olsa          2021-07-14  3355  	if (flags & BPF_TRAM=
P_F_IP_ARG) {
7e6f3cd89f04a0a5 Jiri Olsa          2021-07-14  3356  		/* Store IP address=
 of the traced function:
4d854f4f31ec4b31 Jiri Olsa          2022-09-26  3357  		 * movabsq rax, fun=
c_addr
5edf6a1983b90371 Jiri Olsa          2021-12-08  3358  		 * mov QWORD PTR [r=
bp - ip_off], rax
7e6f3cd89f04a0a5 Jiri Olsa          2021-07-14  3359  		 */
4d854f4f31ec4b31 Jiri Olsa          2022-09-26  3360  		emit_mov_imm64(&pro=
g, BPF_REG_0, (long) func_addr >> 32, (u32) (long) func_addr);
5edf6a1983b90371 Jiri Olsa          2021-12-08  3361  		emit_stx(&prog, BPF=
_DW, BPF_REG_FP, BPF_REG_0, -ip_off);
7e6f3cd89f04a0a5 Jiri Olsa          2021-07-14  3362  	}
7e6f3cd89f04a0a5 Jiri Olsa          2021-07-14  3363 =20
373f2f44c300815c Menglong Dong      2025-11-18  3364  	save_args(m, &prog, =
regs_off, false, flags);
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3365 =20
e21aa341785c679d Alexei Starovoitov 2021-03-16  3366  	if (flags & BPF_TRAM=
P_F_CALL_ORIG) {
e21aa341785c679d Alexei Starovoitov 2021-03-16  3367  		/* arg1: mov rdi, i=
m */
e21aa341785c679d Alexei Starovoitov 2021-03-16  3368  		emit_mov_imm64(&pro=
g, BPF_REG_1, (long) im >> 32, (u32) (long) im);
3ba026fca8786161 Song Liu           2023-12-06  3369  		if (emit_rsb_call(&=
prog, __bpf_tramp_enter,
3ba026fca8786161 Song Liu           2023-12-06  3370  				  image + (prog -=
 (u8 *)rw_image))) {
e21aa341785c679d Alexei Starovoitov 2021-03-16  3371  			ret =3D -EINVAL;
e21aa341785c679d Alexei Starovoitov 2021-03-16  3372  			goto cleanup;
e21aa341785c679d Alexei Starovoitov 2021-03-16  3373  		}
e21aa341785c679d Alexei Starovoitov 2021-03-16  3374  	}
e21aa341785c679d Alexei Starovoitov 2021-03-16  3375 =20
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3376  	if (fentry->nr_links=
) {
e384c7b7b46d0a5f Kui-Feng Lee       2022-05-10  3377  		if (invoke_bpf(m, &=
prog, fentry, regs_off, run_ctx_off,
3ba026fca8786161 Song Liu           2023-12-06  3378  			       flags & BPF=
_TRAMP_F_RET_FENTRY_RET, image, rw_image))
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3379  			return -EINVAL;
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3380  	}
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3381 =20
f7e0beaf39d3868d Kui-Feng Lee       2022-05-10  3382  	if (fmod_ret->nr_lin=
ks) {
f7e0beaf39d3868d Kui-Feng Lee       2022-05-10  3383  		branches =3D kcallo=
c(fmod_ret->nr_links, sizeof(u8 *),
ae24082331d9bbaa KP Singh           2020-03-04  3384  				   GFP_KERNEL);
ae24082331d9bbaa KP Singh           2020-03-04  3385  		if (!branches)
ae24082331d9bbaa KP Singh           2020-03-04  3386  			return -ENOMEM;
ae24082331d9bbaa KP Singh           2020-03-04  3387 =20
5edf6a1983b90371 Jiri Olsa          2021-12-08  3388  		if (invoke_bpf_mod_=
ret(m, &prog, fmod_ret, regs_off,
3ba026fca8786161 Song Liu           2023-12-06  3389  				       run_ctx_of=
f, branches, image, rw_image)) {
ae24082331d9bbaa KP Singh           2020-03-04  3390  			ret =3D -EINVAL;
ae24082331d9bbaa KP Singh           2020-03-04  3391  			goto cleanup;
ae24082331d9bbaa KP Singh           2020-03-04  3392  		}
ae24082331d9bbaa KP Singh           2020-03-04  3393  	}
ae24082331d9bbaa KP Singh           2020-03-04  3394 =20
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3395  	if (flags & BPF_TRAM=
P_F_CALL_ORIG) {
473e3150e30a2db4 Menglong Dong      2023-07-13  3396  		restore_regs(m, &pr=
og, regs_off);
373f2f44c300815c Menglong Dong      2025-11-18  3397  		save_args(m, &prog,=
 arg_stack_off, true, flags);
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3398 =20
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3399  		if (flags & BPF_TRA=
MP_F_TAIL_CALL_CTX) {
116e04ba1459fc08 Leon Hwang         2024-07-14  3400  			/* Before calling =
the original function, load the
116e04ba1459fc08 Leon Hwang         2024-07-14  3401  			 * tail_call_cnt_p=
tr from stack to rax.
2b5dcb31a19a2e0a Leon Hwang         2023-09-12  3402  			 */
116e04ba1459fc08 Leon Hwang         2024-07-14  3403  			LOAD_TRAMP_TAIL_CA=
LL_CNT_PTR(stack_size);
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3404  		}
2b5dcb31a19a2e0a Leon Hwang         2023-09-12  3405 =20
316cba62dfb7878b Jiri Olsa          2022-07-19  3406  		if (flags & BPF_TRA=
MP_F_ORIG_STACK) {
2b5dcb31a19a2e0a Leon Hwang         2023-09-12  3407  			emit_ldx(&prog, BP=
F_DW, BPF_REG_6, BPF_REG_FP, 8);
2b5dcb31a19a2e0a Leon Hwang         2023-09-12  3408  			EMIT2(0xff, 0xd3);=
 /* call *rbx */
316cba62dfb7878b Jiri Olsa          2022-07-19  3409  		} else {
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3410  			/* call original f=
unction */
3ba026fca8786161 Song Liu           2023-12-06  3411  			if (emit_rsb_call(=
&prog, orig_call, image + (prog - (u8 *)rw_image))) {
ae24082331d9bbaa KP Singh           2020-03-04  3412  				ret =3D -EINVAL;
ae24082331d9bbaa KP Singh           2020-03-04  3413  				goto cleanup;
ae24082331d9bbaa KP Singh           2020-03-04  3414  			}
316cba62dfb7878b Jiri Olsa          2022-07-19  3415  		}
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3416  		/* remember return =
value in a stack for bpf prog to access */
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3417  		emit_stx(&prog, BPF=
_DW, BPF_REG_FP, BPF_REG_0, -8);
3ba026fca8786161 Song Liu           2023-12-06 @3418  		im->ip_after_call =
=3D image + (prog - (u8 *)rw_image);
00bc8988807985e3 Leon Hwang         2024-01-04  3419  		emit_nops(&prog, X8=
6_PATCH_SIZE);
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3420  	}
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3421 =20
f7e0beaf39d3868d Kui-Feng Lee       2022-05-10  3422  	if (fmod_ret->nr_lin=
ks) {
ae24082331d9bbaa KP Singh           2020-03-04  3423  		/* From Intel 64 an=
d IA-32 Architectures Optimization
ae24082331d9bbaa KP Singh           2020-03-04  3424  		 * Reference Manual=
, 3.4.1.4 Code Alignment, Assembly/Compiler
ae24082331d9bbaa KP Singh           2020-03-04  3425  		 * Coding Rule 11: =
All branch targets should be 16-byte
ae24082331d9bbaa KP Singh           2020-03-04  3426  		 * aligned.
ae24082331d9bbaa KP Singh           2020-03-04  3427  		 */
ae24082331d9bbaa KP Singh           2020-03-04  3428  		emit_align(&prog, 1=
6);
ae24082331d9bbaa KP Singh           2020-03-04  3429  		/* Update the branc=
hes saved in invoke_bpf_mod_ret with the
ae24082331d9bbaa KP Singh           2020-03-04  3430  		 * aligned address =
of do_fexit.
ae24082331d9bbaa KP Singh           2020-03-04  3431  		 */
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3432  		for (i =3D 0; i < f=
mod_ret->nr_links; i++) {
3ba026fca8786161 Song Liu           2023-12-06  3433  			emit_cond_near_jum=
p(&branches[i], image + (prog - (u8 *)rw_image),
3ba026fca8786161 Song Liu           2023-12-06  3434  					    image + (bra=
nches[i] - (u8 *)rw_image), X86_JNE);
ae24082331d9bbaa KP Singh           2020-03-04  3435  		}
ae24082331d9bbaa KP Singh           2020-03-04  3436  	}
ae24082331d9bbaa KP Singh           2020-03-04  3437 =20
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3438  	if (fexit->nr_links)=
 {
3ba026fca8786161 Song Liu           2023-12-06  3439  		if (invoke_bpf(m, &=
prog, fexit, regs_off, run_ctx_off,
3ba026fca8786161 Song Liu           2023-12-06  3440  			       false, imag=
e, rw_image)) {
ae24082331d9bbaa KP Singh           2020-03-04  3441  			ret =3D -EINVAL;
ae24082331d9bbaa KP Singh           2020-03-04  3442  			goto cleanup;
ae24082331d9bbaa KP Singh           2020-03-04  3443  		}
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3444  	}
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3445 =20
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3446  	if (flags & BPF_TRAM=
P_F_RESTORE_REGS)
473e3150e30a2db4 Menglong Dong      2023-07-13  3447  		restore_regs(m, &pr=
og, regs_off);
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3448 =20
ae24082331d9bbaa KP Singh           2020-03-04  3449  	/* This needs to be =
done regardless. If there were fmod_ret programs,
ae24082331d9bbaa KP Singh           2020-03-04  3450  	 * the return value =
is only updated on the stack and still needs to be
ae24082331d9bbaa KP Singh           2020-03-04  3451  	 * restored to R0.
ae24082331d9bbaa KP Singh           2020-03-04  3452  	 */
e21aa341785c679d Alexei Starovoitov 2021-03-16  3453  	if (flags & BPF_TRAM=
P_F_CALL_ORIG) {
3ba026fca8786161 Song Liu           2023-12-06  3454  		im->ip_epilogue =3D =
image + (prog - (u8 *)rw_image);
e21aa341785c679d Alexei Starovoitov 2021-03-16  3455  		/* arg1: mov rdi, i=
m */
e21aa341785c679d Alexei Starovoitov 2021-03-16  3456  		emit_mov_imm64(&pro=
g, BPF_REG_1, (long) im >> 32, (u32) (long) im);
3ba026fca8786161 Song Liu           2023-12-06  3457  		if (emit_rsb_call(&=
prog, __bpf_tramp_exit, image + (prog - (u8 *)rw_image))) {
e21aa341785c679d Alexei Starovoitov 2021-03-16  3458  			ret =3D -EINVAL;
e21aa341785c679d Alexei Starovoitov 2021-03-16  3459  			goto cleanup;
e21aa341785c679d Alexei Starovoitov 2021-03-16  3460  		}
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3461  	} else if (flags & B=
PF_TRAMP_F_TAIL_CALL_CTX) {
116e04ba1459fc08 Leon Hwang         2024-07-14  3462  		/* Before running t=
he original function, load the
116e04ba1459fc08 Leon Hwang         2024-07-14  3463  		 * tail_call_cnt_pt=
r from stack to rax.
2b5dcb31a19a2e0a Leon Hwang         2023-09-12  3464  		 */
116e04ba1459fc08 Leon Hwang         2024-07-14  3465  		LOAD_TRAMP_TAIL_CAL=
L_CNT_PTR(stack_size);
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3466  	}
2b5dcb31a19a2e0a Leon Hwang         2023-09-12  3467 =20
356ed64991c6847a Hou Tao            2021-09-14  3468  	/* restore return va=
lue of orig_call or fentry prog back into RAX */
356ed64991c6847a Hou Tao            2021-09-14  3469  	if (save_ret)
356ed64991c6847a Hou Tao            2021-09-14  3470  		emit_ldx(&prog, BPF=
_DW, BPF_REG_0, BPF_REG_FP, -8);
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3471 =20
473e3150e30a2db4 Menglong Dong      2023-07-13  3472  	emit_ldx(&prog, BPF_=
DW, BPF_REG_6, BPF_REG_FP, -rbx_off);
ca45c84afb8c91a8 Josh Poimboeuf     2025-12-03  3473 =20
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3474  	EMIT1(0xC9); /* leav=
e */
ca45c84afb8c91a8 Josh Poimboeuf     2025-12-03  3475  	if (im)
ca45c84afb8c91a8 Josh Poimboeuf     2025-12-03  3476  		im->ksym.fp_end =3D =
prog - (u8 *)rw_image;
ca45c84afb8c91a8 Josh Poimboeuf     2025-12-03  3477 =20
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3478  	if (flags & BPF_TRAM=
P_F_SKIP_FRAME) {
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3479  		/* skip our return =
address and return to parent */
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3480  		EMIT4(0x48, 0x83, 0=
xC4, 8); /* add rsp, 8 */
2cd3e3772e41377f Peter Zijlstra     2023-12-15  3481  	}
3ba026fca8786161 Song Liu           2023-12-06  3482  	emit_return(&prog, i=
mage + (prog - (u8 *)rw_image));
85d33df357b63464 Martin KaFai Lau   2020-01-08  3483  	/* Make sure the tra=
mpoline generation logic doesn't overflow */
3ba026fca8786161 Song Liu           2023-12-06  3484  	if (WARN_ON_ONCE(pro=
g > (u8 *)rw_image_end - BPF_INSN_SAFETY)) {
ae24082331d9bbaa KP Singh           2020-03-04  3485  		ret =3D -EFAULT;
ae24082331d9bbaa KP Singh           2020-03-04  3486  		goto cleanup;
ae24082331d9bbaa KP Singh           2020-03-04  3487  	}
3ba026fca8786161 Song Liu           2023-12-06  3488  	ret =3D prog - (u8 *=
)rw_image + BPF_INSN_SAFETY;
ae24082331d9bbaa KP Singh           2020-03-04  3489 =20
ae24082331d9bbaa KP Singh           2020-03-04  3490  cleanup:
ae24082331d9bbaa KP Singh           2020-03-04  3491  	kfree(branches);
ae24082331d9bbaa KP Singh           2020-03-04  3492  	return ret;
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3493  }
fec56f5890d93fc2 Alexei Starovoitov 2019-11-14  3494 =20

:::::: The code at line 3418 was first introduced by commit
:::::: 3ba026fca8786161b0c4d75be396e61d6816e0a1 x86, bpf: Use bpf_prog_pack=
 for bpf trampoline

:::::: TO: Song Liu <song@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
