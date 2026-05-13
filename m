Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9FC3DE456
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660779; cv=none; b=NdAFnaQU0g49quhq4wG7BP62HLJ3BwBIIB+bvkhZrDeYjHUFkqLYzvU9gKkTBYX35pjLOCgvKzIWP1h7DDPO7inxQZAPt6hCpQqONuY18a1TH7ki+e+bYJTCnzhtRIyTd3tBkOuuaUwrTp2I6V3x1FZbi7cyEYqNG/wbLoXatjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660779; c=relaxed/simple;
	bh=Nhe/YOnZeAciBCq3MAntHGbXCH5+sW3ydeh+dyBhPVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HpAWIOXw/I1NIsUEP51sGmdnjaCip+exlTiFQFAzvumAoPcl3IGRmrTrc/PSqECBmJUTst1BCddtpXPfVHHC7yTKww2YWyZZoLUfP2Sz3YhdWpoixo/13j1wRDolpwkIMOZjz62You0dpOUNLH6Uad3/0Tk2/143tY0PO+nZWEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVK+HChH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVK+HChH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778660772; x=1810196772;
  h=date:from:to:cc:subject:message-id;
  bh=Nhe/YOnZeAciBCq3MAntHGbXCH5+sW3ydeh+dyBhPVA=;
  b=UVK+HChHmJPhtIGr/owJyzPfm6VPQ8IdwBto0mROmVtblGXmxVqmU4OS
   g33chFlxzOyLirYJHBBUC9LfxYJoD8nguCuzZSMR40JHODeKx/VLQ1ylZ
   TRhj1nkynIloH0/x+M/1x6c4ORwExpRlvZOuy+/pCnQ4Zcm5O2dYB1U/n
   OFLd9Ag/M0nbzVgjjWdSNn0rUiU9StESDD5bIrrBZe9Smwr1wuR70fySb
   qNquLoMAfX/dNcSW94h/SqeL9dtQDtKfbVts6+EzQ+UCtnnrnOzaWGuQ0
   0pZEggaDJSOSkdeghlo1pN+P13bT+T6rUCSLb+g9Oc/PhEOkG776rAXxR
   Q==;
X-CSE-ConnectionGUID: nT0n/8pKQ22IiK3hm55QdA==
X-CSE-MsgGUID: 1GYZn42mQral+peQh1+T0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="102248739"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="102248739"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 01:26:06 -0700
X-CSE-ConnectionGUID: wKSaXlPjSpaRV7hjGqchQg==
X-CSE-MsgGUID: SaBSjMTjQaGtK0PRm4p89Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233554493"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2026 01:26:04 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN4uo-000000003jx-0CWG;
	Wed, 13 May 2026 08:26:02 +0000
Date: Wed, 13 May 2026 16:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/verifier.c:15083 adjust_reg_min_max_vals() error:
 we previously assumed 'src_reg' could be null (see line 15060)
Message-ID: <202605131610.U3J29VqO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Emil Tsalapatis <emil@etsalapatis.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
commit: ac61bffe91d4bda08806e12957c6d64756d042db bpf: Allow instructions with arena source and non-arena dest registers
date:   4 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-r071-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131610.U3J29VqO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ac61bffe91d4 ("bpf: Allow instructions with arena source and non-arena dest registers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605131610.U3J29VqO-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:15083 adjust_reg_min_max_vals() error: we previously assumed 'src_reg' could be null (see line 15060)

vim +/src_reg +15083 kernel/bpf/verifier.c

f1174f77b50c94 Edward Cree             2017-08-07  15038  
f1174f77b50c94 Edward Cree             2017-08-07  15039  /* Handles ALU ops other than BPF_END, BPF_NEG and BPF_MOV: computes new min/max
f1174f77b50c94 Edward Cree             2017-08-07  15040   * and var_off.
f1174f77b50c94 Edward Cree             2017-08-07  15041   */
f1174f77b50c94 Edward Cree             2017-08-07  15042  static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
f1174f77b50c94 Edward Cree             2017-08-07  15043  				   struct bpf_insn *insn)
f1174f77b50c94 Edward Cree             2017-08-07  15044  {
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  15045  	struct bpf_verifier_state *vstate = env->cur_state;
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  15046  	struct bpf_func_state *state = vstate->frame[vstate->curframe];
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  15047  	struct bpf_reg_state *regs = state->regs, *dst_reg, *src_reg;
f1174f77b50c94 Edward Cree             2017-08-07  15048  	struct bpf_reg_state *ptr_reg = NULL, off_reg = {0};
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15049  	bool alu32 = (BPF_CLASS(insn->code) != BPF_ALU64);
f1174f77b50c94 Edward Cree             2017-08-07  15050  	u8 opcode = BPF_OP(insn->code);
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  15051  	int err;
f1174f77b50c94 Edward Cree             2017-08-07  15052  
f1174f77b50c94 Edward Cree             2017-08-07  15053  	dst_reg = &regs[insn->dst_reg];
ac61bffe91d4bd Emil Tsalapatis         2026-04-12  15054  	if (BPF_SRC(insn->code) == BPF_X)
ac61bffe91d4bd Emil Tsalapatis         2026-04-12  15055  		src_reg = &regs[insn->src_reg];
ac61bffe91d4bd Emil Tsalapatis         2026-04-12  15056  	else
f1174f77b50c94 Edward Cree             2017-08-07  15057  		src_reg = NULL;
6082b6c328b548 Alexei Starovoitov      2024-03-07  15058  
ac61bffe91d4bd Emil Tsalapatis         2026-04-12  15059  	/* Case where at least one operand is an arena. */
ac61bffe91d4bd Emil Tsalapatis         2026-04-12 @15060  	if (dst_reg->type == PTR_TO_ARENA || (src_reg && src_reg->type == PTR_TO_ARENA)) {
6082b6c328b548 Alexei Starovoitov      2024-03-07  15061  		struct bpf_insn_aux_data *aux = cur_aux(env);
6082b6c328b548 Alexei Starovoitov      2024-03-07  15062  
ac61bffe91d4bd Emil Tsalapatis         2026-04-12  15063  		if (dst_reg->type != PTR_TO_ARENA)
ac61bffe91d4bd Emil Tsalapatis         2026-04-12  15064  			*dst_reg = *src_reg;
ac61bffe91d4bd Emil Tsalapatis         2026-04-12  15065  
ac61bffe91d4bd Emil Tsalapatis         2026-04-12  15066  		dst_reg->subreg_def = env->insn_idx + 1;
ac61bffe91d4bd Emil Tsalapatis         2026-04-12  15067  
6082b6c328b548 Alexei Starovoitov      2024-03-07  15068  		if (BPF_CLASS(insn->code) == BPF_ALU64)
6082b6c328b548 Alexei Starovoitov      2024-03-07  15069  			/*
6082b6c328b548 Alexei Starovoitov      2024-03-07  15070  			 * 32-bit operations zero upper bits automatically.
6082b6c328b548 Alexei Starovoitov      2024-03-07  15071  			 * 64-bit operations need to be converted to 32.
6082b6c328b548 Alexei Starovoitov      2024-03-07  15072  			 */
6082b6c328b548 Alexei Starovoitov      2024-03-07  15073  			aux->needs_zext = true;
6082b6c328b548 Alexei Starovoitov      2024-03-07  15074  
6082b6c328b548 Alexei Starovoitov      2024-03-07  15075  		/* Any arithmetic operations are allowed on arena pointers */
6082b6c328b548 Alexei Starovoitov      2024-03-07  15076  		return 0;
6082b6c328b548 Alexei Starovoitov      2024-03-07  15077  	}
6082b6c328b548 Alexei Starovoitov      2024-03-07  15078  
f1174f77b50c94 Edward Cree             2017-08-07  15079  	if (dst_reg->type != SCALAR_VALUE)
f1174f77b50c94 Edward Cree             2017-08-07  15080  		ptr_reg = dst_reg;
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15081  
f1174f77b50c94 Edward Cree             2017-08-07  15082  	if (BPF_SRC(insn->code) == BPF_X) {
f1174f77b50c94 Edward Cree             2017-08-07 @15083  		if (src_reg->type != SCALAR_VALUE) {
f1174f77b50c94 Edward Cree             2017-08-07  15084  			if (dst_reg->type != SCALAR_VALUE) {
f1174f77b50c94 Edward Cree             2017-08-07  15085  				/* Combining two pointers by any ALU op yields
82abbf8d2fc46d Alexei Starovoitov      2017-12-18  15086  				 * an arbitrary scalar. Disallow all math except
82abbf8d2fc46d Alexei Starovoitov      2017-12-18  15087  				 * pointer subtraction
f1174f77b50c94 Edward Cree             2017-08-07  15088  				 */
dd066823db2ac4 Alexei Starovoitov      2018-09-12  15089  				if (opcode == BPF_SUB && env->allow_ptr_leaks) {
82abbf8d2fc46d Alexei Starovoitov      2017-12-18  15090  					mark_reg_unknown(env, regs, insn->dst_reg);
82abbf8d2fc46d Alexei Starovoitov      2017-12-18  15091  					return 0;
82abbf8d2fc46d Alexei Starovoitov      2017-12-18  15092  				}
61bd5218eef349 Jakub Kicinski          2017-10-09  15093  				verbose(env, "R%d pointer %s pointer prohibited\n",
f1174f77b50c94 Edward Cree             2017-08-07  15094  					insn->dst_reg,
f1174f77b50c94 Edward Cree             2017-08-07  15095  					bpf_alu_string[opcode >> 4]);
f1174f77b50c94 Edward Cree             2017-08-07  15096  				return -EACCES;
f1174f77b50c94 Edward Cree             2017-08-07  15097  			} else {
f1174f77b50c94 Edward Cree             2017-08-07  15098  				/* scalar += pointer
f1174f77b50c94 Edward Cree             2017-08-07  15099  				 * This is legal, but we have to reverse our
f1174f77b50c94 Edward Cree             2017-08-07  15100  				 * src/dest handling in computing the range
f1174f77b50c94 Edward Cree             2017-08-07  15101  				 */
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  15102  				err = mark_chain_precision(env, insn->dst_reg);
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  15103  				if (err)
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  15104  					return err;
82abbf8d2fc46d Alexei Starovoitov      2017-12-18  15105  				return adjust_ptr_min_max_vals(env, insn,
f1174f77b50c94 Edward Cree             2017-08-07  15106  							       src_reg, dst_reg);
f1174f77b50c94 Edward Cree             2017-08-07  15107  			}
f1174f77b50c94 Edward Cree             2017-08-07  15108  		} else if (ptr_reg) {
f1174f77b50c94 Edward Cree             2017-08-07  15109  			/* pointer += scalar */
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  15110  			err = mark_chain_precision(env, insn->src_reg);
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  15111  			if (err)
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  15112  				return err;
82abbf8d2fc46d Alexei Starovoitov      2017-12-18  15113  			return adjust_ptr_min_max_vals(env, insn,
f1174f77b50c94 Edward Cree             2017-08-07  15114  						       dst_reg, src_reg);
a3b666bfa9c9ed Andrii Nakryiko         2022-11-04  15115  		} else if (dst_reg->precise) {
a3b666bfa9c9ed Andrii Nakryiko         2022-11-04  15116  			/* if dst_reg is precise, src_reg should be precise as well */
a3b666bfa9c9ed Andrii Nakryiko         2022-11-04  15117  			err = mark_chain_precision(env, insn->src_reg);
a3b666bfa9c9ed Andrii Nakryiko         2022-11-04  15118  			if (err)
a3b666bfa9c9ed Andrii Nakryiko         2022-11-04  15119  				return err;
f1174f77b50c94 Edward Cree             2017-08-07  15120  		}
f1174f77b50c94 Edward Cree             2017-08-07  15121  	} else {
f1174f77b50c94 Edward Cree             2017-08-07  15122  		/* Pretend the src is a reg with a known value, since we only
f1174f77b50c94 Edward Cree             2017-08-07  15123  		 * need to be able to read from this state.
f1174f77b50c94 Edward Cree             2017-08-07  15124  		 */
f1174f77b50c94 Edward Cree             2017-08-07  15125  		off_reg.type = SCALAR_VALUE;
b03c9f9fdc37da Edward Cree             2017-08-07  15126  		__mark_reg_known(&off_reg, insn->imm);
f1174f77b50c94 Edward Cree             2017-08-07  15127  		src_reg = &off_reg;
82abbf8d2fc46d Alexei Starovoitov      2017-12-18  15128  		if (ptr_reg) /* pointer += K */
82abbf8d2fc46d Alexei Starovoitov      2017-12-18  15129  			return adjust_ptr_min_max_vals(env, insn,
f1174f77b50c94 Edward Cree             2017-08-07  15130  						       ptr_reg, src_reg);
f1174f77b50c94 Edward Cree             2017-08-07  15131  	}
f1174f77b50c94 Edward Cree             2017-08-07  15132  
f1174f77b50c94 Edward Cree             2017-08-07  15133  	/* Got here implies adding two SCALAR_VALUEs */
f1174f77b50c94 Edward Cree             2017-08-07  15134  	if (WARN_ON_ONCE(ptr_reg)) {
1995edc5f9089e Kumar Kartikeya Dwivedi 2024-12-03  15135  		print_verifier_state(env, vstate, vstate->curframe, true);
61bd5218eef349 Jakub Kicinski          2017-10-09  15136  		verbose(env, "verifier internal error: unexpected ptr_reg\n");
6b84d7895d7807 Luis Gerhorst           2025-06-03  15137  		return -EFAULT;
f1174f77b50c94 Edward Cree             2017-08-07  15138  	}
f1174f77b50c94 Edward Cree             2017-08-07  15139  	if (WARN_ON(!src_reg)) {
1995edc5f9089e Kumar Kartikeya Dwivedi 2024-12-03  15140  		print_verifier_state(env, vstate, vstate->curframe, true);
61bd5218eef349 Jakub Kicinski          2017-10-09  15141  		verbose(env, "verifier internal error: no src_reg\n");
6b84d7895d7807 Luis Gerhorst           2025-06-03  15142  		return -EFAULT;
f1174f77b50c94 Edward Cree             2017-08-07  15143  	}
7a433e519364c3 Puranjay Mohan          2026-02-04  15144  	/*
7a433e519364c3 Puranjay Mohan          2026-02-04  15145  	 * For alu32 linked register tracking, we need to check dst_reg's
7a433e519364c3 Puranjay Mohan          2026-02-04  15146  	 * umax_value before the ALU operation. After adjust_scalar_min_max_vals(),
7a433e519364c3 Puranjay Mohan          2026-02-04  15147  	 * alu32 ops will have zero-extended the result, making umax_value <= U32_MAX.
7a433e519364c3 Puranjay Mohan          2026-02-04  15148  	 */
7a433e519364c3 Puranjay Mohan          2026-02-04  15149  	u64 dst_umax = dst_reg->umax_value;
7a433e519364c3 Puranjay Mohan          2026-02-04  15150  
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15151  	err = adjust_scalar_min_max_vals(env, insn, dst_reg, *src_reg);
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15152  	if (err)
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15153  		return err;
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15154  	/*
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15155  	 * Compilers can generate the code
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15156  	 * r1 = r2
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15157  	 * r1 += 0x1
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15158  	 * if r2 < 1000 goto ...
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15159  	 * use r1 in memory access
7a433e519364c3 Puranjay Mohan          2026-02-04  15160  	 * So remember constant delta between r2 and r1 and update r1 after
7a433e519364c3 Puranjay Mohan          2026-02-04  15161  	 * 'if' condition.
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15162  	 */
3878ae04e9fc24 Daniel Borkmann         2024-10-16  15163  	if (env->bpf_capable &&
7a433e519364c3 Puranjay Mohan          2026-02-04  15164  	    (BPF_OP(insn->code) == BPF_ADD || BPF_OP(insn->code) == BPF_SUB) &&
d7f14173c0d586 Daniel Borkmann         2026-04-07  15165  	    dst_reg->id && is_reg_const(src_reg, alu32) &&
d7f14173c0d586 Daniel Borkmann         2026-04-07  15166  	    !(BPF_SRC(insn->code) == BPF_X && insn->src_reg == insn->dst_reg)) {
7a433e519364c3 Puranjay Mohan          2026-02-04  15167  		u64 val = reg_const_value(src_reg, alu32);
7a433e519364c3 Puranjay Mohan          2026-02-04  15168  		s32 off;
7a433e519364c3 Puranjay Mohan          2026-02-04  15169  
7a433e519364c3 Puranjay Mohan          2026-02-04  15170  		if (!alu32 && ((s64)val < S32_MIN || (s64)val > S32_MAX))
7a433e519364c3 Puranjay Mohan          2026-02-04  15171  			goto clear_id;
7a433e519364c3 Puranjay Mohan          2026-02-04  15172  
7a433e519364c3 Puranjay Mohan          2026-02-04  15173  		if (alu32 && (dst_umax > U32_MAX))
7a433e519364c3 Puranjay Mohan          2026-02-04  15174  			goto clear_id;
7a433e519364c3 Puranjay Mohan          2026-02-04  15175  
7a433e519364c3 Puranjay Mohan          2026-02-04  15176  		off = (s32)val;
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15177  
7a433e519364c3 Puranjay Mohan          2026-02-04  15178  		if (BPF_OP(insn->code) == BPF_SUB) {
7a433e519364c3 Puranjay Mohan          2026-02-04  15179  			/* Negating S32_MIN would overflow */
7a433e519364c3 Puranjay Mohan          2026-02-04  15180  			if (off == S32_MIN)
7a433e519364c3 Puranjay Mohan          2026-02-04  15181  				goto clear_id;
7a433e519364c3 Puranjay Mohan          2026-02-04  15182  			off = -off;
7a433e519364c3 Puranjay Mohan          2026-02-04  15183  		}
7a433e519364c3 Puranjay Mohan          2026-02-04  15184  
7a433e519364c3 Puranjay Mohan          2026-02-04  15185  		if (dst_reg->id & BPF_ADD_CONST) {
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15186  			/*
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15187  			 * If the register already went through rX += val
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15188  			 * we cannot accumulate another val into rx->off.
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15189  			 */
7a433e519364c3 Puranjay Mohan          2026-02-04  15190  clear_id:
1b327732c84640 Daniel Borkmann         2026-04-07  15191  			clear_scalar_id(dst_reg);
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15192  		} else {
7a433e519364c3 Puranjay Mohan          2026-02-04  15193  			if (alu32)
7a433e519364c3 Puranjay Mohan          2026-02-04  15194  				dst_reg->id |= BPF_ADD_CONST32;
7a433e519364c3 Puranjay Mohan          2026-02-04  15195  			else
7a433e519364c3 Puranjay Mohan          2026-02-04  15196  				dst_reg->id |= BPF_ADD_CONST64;
3d91c618aca403 Eduard Zingerman        2026-02-12  15197  			dst_reg->delta = off;
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15198  		}
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15199  	} else {
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15200  		/*
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15201  		 * Make sure ID is cleared otherwise dst_reg min/max could be
4bf79f9be434e0 Eduard Zingerman        2024-07-18  15202  		 * incorrectly propagated into other registers by sync_linked_regs()
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15203  		 */
1b327732c84640 Daniel Borkmann         2026-04-07  15204  		clear_scalar_id(dst_reg);
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15205  	}
98d7ca374ba4b3 Alexei Starovoitov      2024-06-12  15206  	return 0;
484611357c19f9 Josef Bacik             2016-09-28  15207  }
484611357c19f9 Josef Bacik             2016-09-28  15208  

:::::: The code at line 15083 was first introduced by commit
:::::: f1174f77b50c94eecaa658fdc56fa69b421de4b8 bpf/verifier: rework value tracking

:::::: TO: Edward Cree <ecree@solarflare.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
