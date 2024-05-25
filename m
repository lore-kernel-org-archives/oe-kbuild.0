Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3929D512
	for <oe-kbuild@lists.linux.dev>; Sat, 25 May 2024 23:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716681211; cv=none; b=E9lwKve1YyZpV1pyrBTxhQXRL6yoqsiNQ38JbTpjDWI9XWy9OOxSNDoxx2JdcqxEtcxMbxu9KTcKQxH/2uGG3qGQS+7Wsno2f5/XJP+PckmWrX9szef4c0YWhQyQfOa8QUlr1YhhNKlq+7ePhvfgQo4p1ZZhuvLFgPSgIrdB3kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716681211; c=relaxed/simple;
	bh=nQ/wRtzlciIfQsBt/nxOt/Cm5NNatj5fgPKgWjuiDns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WnP3aD21hBDPjWLd4qPAc6DLIUD8JULQ0vQVhihLhlvByNjKoZetiV92pDBc8c9jn3fQx8IMcUNUOokw/GOdJYGnvaikVbz8IjmKorqOSo0FaR46l484OEZrftzFurdDzUjBCBtTicOLIz1SwRmX23YeGylVjDjU6pME7wolTf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+zYdl/6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+zYdl/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716681208; x=1748217208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQ/wRtzlciIfQsBt/nxOt/Cm5NNatj5fgPKgWjuiDns=;
  b=G+zYdl/6Dh5yDgg8BCLtQK98GIH+jNaOXID0/Nu7yWS/WC7ja3AgG3i3
   UFGHmEnsK/Mpa88zfiM6TBcoKm/QVeNbqHkQ7oQt3yzYUGmOPxcFr3phh
   0McU8EOQXlgRr1bd1flMZRqoz2C3aW32pVW0qMVDFX1FMF7vbBe2i3u+R
   pPqs/mTI7lw5b1UrpnXe9CNlsPuqnUYucI/0S6eZoyztWKuvuKxGun2Ji
   1qBgqqS6+7FAfeGsuoZe0Pga3mOQH/FtIROejc2RI17YO2PK6fjAJ0ftv
   ySHFZ9j1yGZZ00EsxW8z75FPFtJoT09NSGq7JwiuNDTWTlSHp/WgFFpUb
   Q==;
X-CSE-ConnectionGUID: aONkdgO2SL+4QvWN4DNxPw==
X-CSE-MsgGUID: p3cTC/0dSuqSs42z7MfWeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="23691992"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="23691992"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 16:53:28 -0700
X-CSE-ConnectionGUID: G+OsOl8YQp2z4IQXvcEoRA==
X-CSE-MsgGUID: wHgsv0HpS3O5lTWDobxITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34974904"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 May 2024 16:53:27 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB1CV-0007Xn-2Z;
	Sat, 25 May 2024 23:53:23 +0000
Date: Sun, 26 May 2024 07:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 bpf-next 1/2] bpf: Relax precision marking in open
 coded iters and may_goto loop.
Message-ID: <202405260726.0H6QiGNy-lkp@intel.com>
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
In-Reply-To: <20240525031156.13545-1-alexei.starovoitov@gmail.com>
References: <20240525031156.13545-1-alexei.starovoitov@gmail.com>
TO: Alexei Starovoitov <alexei.starovoitov@gmail.com>
TO: bpf@vger.kernel.org
CC: daniel@iogearbox.net
CC: andrii@kernel.org
CC: martin.lau@kernel.org
CC: memxor@gmail.com
CC: eddyz87@gmail.com
CC: kernel-team@fb.com

Hi Alexei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/selftests-bpf-Remove-i-zero-workaround-and-add-new-tests/20240525-111247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240525031156.13545-1-alexei.starovoitov%40gmail.com
patch subject: [PATCH v3 bpf-next 1/2] bpf: Relax precision marking in open coded iters and may_goto loop.
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: nios2-randconfig-r071-20240526 (https://download.01.org/0day-ci/archive/20240526/202405260726.0H6QiGNy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405260726.0H6QiGNy-lkp@intel.com/

New smatch warnings:
kernel/bpf/verifier.c:15315 check_cond_jmp_op() error: uninitialized symbol 'other_dst_reg'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/other_dst_reg +15315 kernel/bpf/verifier.c

75748837b7e569 Alexei Starovoitov 2020-10-08  15107  
58e2af8b3a6b58 Jakub Kicinski     2016-09-21  15108  static int check_cond_jmp_op(struct bpf_verifier_env *env,
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15109  			     struct bpf_insn *insn, int *insn_idx)
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15110  {
f4d7e40a5b7157 Alexei Starovoitov 2017-12-14  15111  	struct bpf_verifier_state *this_branch = env->cur_state;
f4d7e40a5b7157 Alexei Starovoitov 2017-12-14  15112  	struct bpf_verifier_state *other_branch;
f4d7e40a5b7157 Alexei Starovoitov 2017-12-14  15113  	struct bpf_reg_state *regs = this_branch->frame[this_branch->curframe]->regs;
fb8d251ee2a6bf Alexei Starovoitov 2019-06-15  15114  	struct bpf_reg_state *dst_reg, *other_branch_regs, *src_reg = NULL;
689049426b9d3b Alexei Starovoitov 2024-05-24  15115  	struct bpf_reg_state *eq_branch_regs, *other_dst_reg, *other_src_reg = NULL;
c31534267c180f Andrii Nakryiko    2023-11-01  15116  	struct bpf_reg_state fake_reg = {};
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15117  	u8 opcode = BPF_OP(insn->code);
689049426b9d3b Alexei Starovoitov 2024-05-24  15118  	bool is_jmp32, ignore_pred;
689049426b9d3b Alexei Starovoitov 2024-05-24  15119  	bool has_src_reg = false;
fb8d251ee2a6bf Alexei Starovoitov 2019-06-15  15120  	int pred = -1;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15121  	int err;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15122  
092ed0968bb648 Jiong Wang         2019-01-26  15123  	/* Only conditional jumps are expected to reach here. */
011832b97b311b Alexei Starovoitov 2024-03-05  15124  	if (opcode == BPF_JA || opcode > BPF_JCOND) {
092ed0968bb648 Jiong Wang         2019-01-26  15125  		verbose(env, "invalid BPF_JMP/JMP32 opcode %x\n", opcode);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15126  		return -EINVAL;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15127  	}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15128  
011832b97b311b Alexei Starovoitov 2024-03-05  15129  	if (opcode == BPF_JCOND) {
011832b97b311b Alexei Starovoitov 2024-03-05  15130  		struct bpf_verifier_state *cur_st = env->cur_state, *queued_st, *prev_st;
011832b97b311b Alexei Starovoitov 2024-03-05  15131  		int idx = *insn_idx;
011832b97b311b Alexei Starovoitov 2024-03-05  15132  
011832b97b311b Alexei Starovoitov 2024-03-05  15133  		if (insn->code != (BPF_JMP | BPF_JCOND) ||
011832b97b311b Alexei Starovoitov 2024-03-05  15134  		    insn->src_reg != BPF_MAY_GOTO ||
011832b97b311b Alexei Starovoitov 2024-03-05  15135  		    insn->dst_reg || insn->imm || insn->off == 0) {
011832b97b311b Alexei Starovoitov 2024-03-05  15136  			verbose(env, "invalid may_goto off %d imm %d\n",
011832b97b311b Alexei Starovoitov 2024-03-05  15137  				insn->off, insn->imm);
011832b97b311b Alexei Starovoitov 2024-03-05  15138  			return -EINVAL;
011832b97b311b Alexei Starovoitov 2024-03-05  15139  		}
011832b97b311b Alexei Starovoitov 2024-03-05  15140  		prev_st = find_prev_entry(env, cur_st->parent, idx);
011832b97b311b Alexei Starovoitov 2024-03-05  15141  
011832b97b311b Alexei Starovoitov 2024-03-05  15142  		/* branch out 'fallthrough' insn as a new state to explore */
011832b97b311b Alexei Starovoitov 2024-03-05  15143  		queued_st = push_stack(env, idx + 1, idx, false);
011832b97b311b Alexei Starovoitov 2024-03-05  15144  		if (!queued_st)
011832b97b311b Alexei Starovoitov 2024-03-05  15145  			return -ENOMEM;
011832b97b311b Alexei Starovoitov 2024-03-05  15146  
011832b97b311b Alexei Starovoitov 2024-03-05  15147  		queued_st->may_goto_depth++;
011832b97b311b Alexei Starovoitov 2024-03-05  15148  		if (prev_st)
011832b97b311b Alexei Starovoitov 2024-03-05  15149  			widen_imprecise_scalars(env, prev_st, queued_st);
011832b97b311b Alexei Starovoitov 2024-03-05  15150  		*insn_idx += insn->off;
011832b97b311b Alexei Starovoitov 2024-03-05  15151  		return 0;
011832b97b311b Alexei Starovoitov 2024-03-05  15152  	}
011832b97b311b Alexei Starovoitov 2024-03-05  15153  
d75e30dddf7344 Yafang Shao        2023-08-23  15154  	/* check src2 operand */
d75e30dddf7344 Yafang Shao        2023-08-23  15155  	err = check_reg_arg(env, insn->dst_reg, SRC_OP);
d75e30dddf7344 Yafang Shao        2023-08-23  15156  	if (err)
d75e30dddf7344 Yafang Shao        2023-08-23  15157  		return err;
d75e30dddf7344 Yafang Shao        2023-08-23  15158  
d75e30dddf7344 Yafang Shao        2023-08-23  15159  	dst_reg = &regs[insn->dst_reg];
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15160  	if (BPF_SRC(insn->code) == BPF_X) {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15161  		if (insn->imm != 0) {
092ed0968bb648 Jiong Wang         2019-01-26  15162  			verbose(env, "BPF_JMP/JMP32 uses reserved fields\n");
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15163  			return -EINVAL;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15164  		}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15165  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15166  		/* check src1 operand */
dc503a8ad98474 Edward Cree        2017-08-15  15167  		err = check_reg_arg(env, insn->src_reg, SRC_OP);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15168  		if (err)
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15169  			return err;
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  15170  
689049426b9d3b Alexei Starovoitov 2024-05-24  15171  		has_src_reg = true;
d75e30dddf7344 Yafang Shao        2023-08-23  15172  		src_reg = &regs[insn->src_reg];
d75e30dddf7344 Yafang Shao        2023-08-23  15173  		if (!(reg_is_pkt_pointer_any(dst_reg) && reg_is_pkt_pointer_any(src_reg)) &&
d75e30dddf7344 Yafang Shao        2023-08-23  15174  		    is_pointer_value(env, insn->src_reg)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  15175  			verbose(env, "R%d pointer comparison prohibited\n",
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  15176  				insn->src_reg);
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  15177  			return -EACCES;
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  15178  		}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15179  	} else {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15180  		if (insn->src_reg != BPF_REG_0) {
092ed0968bb648 Jiong Wang         2019-01-26  15181  			verbose(env, "BPF_JMP/JMP32 uses reserved fields\n");
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15182  			return -EINVAL;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15183  		}
c31534267c180f Andrii Nakryiko    2023-11-01  15184  		src_reg = &fake_reg;
c31534267c180f Andrii Nakryiko    2023-11-01  15185  		src_reg->type = SCALAR_VALUE;
c31534267c180f Andrii Nakryiko    2023-11-01  15186  		__mark_reg_known(src_reg, insn->imm);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15187  	}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15188  
092ed0968bb648 Jiong Wang         2019-01-26  15189  	is_jmp32 = BPF_CLASS(insn->code) == BPF_JMP32;
689049426b9d3b Alexei Starovoitov 2024-05-24  15190  	if (dst_reg->type != SCALAR_VALUE || src_reg->type != SCALAR_VALUE)
689049426b9d3b Alexei Starovoitov 2024-05-24  15191  		ignore_pred = false;
689049426b9d3b Alexei Starovoitov 2024-05-24  15192  	/*
689049426b9d3b Alexei Starovoitov 2024-05-24  15193  	 * Compilers often optimize loop exit condition to equality, so
689049426b9d3b Alexei Starovoitov 2024-05-24  15194  	 *      for (i = 0; i < 100; i++) arr[i] = 1
689049426b9d3b Alexei Starovoitov 2024-05-24  15195  	 * becomes
689049426b9d3b Alexei Starovoitov 2024-05-24  15196  	 *      for (i = 0; i != 100; i++) arr[1] = 1
689049426b9d3b Alexei Starovoitov 2024-05-24  15197  	 * Hence treat != and == conditions specially in the verifier.
689049426b9d3b Alexei Starovoitov 2024-05-24  15198  	 * Widen only not-predicted branch and keep predict branch as is. Example:
689049426b9d3b Alexei Starovoitov 2024-05-24  15199  	 *    r1 = 0
689049426b9d3b Alexei Starovoitov 2024-05-24  15200  	 *    goto L1
689049426b9d3b Alexei Starovoitov 2024-05-24  15201  	 * L2:
689049426b9d3b Alexei Starovoitov 2024-05-24  15202  	 *    arr[r1] = 1
689049426b9d3b Alexei Starovoitov 2024-05-24  15203  	 *    r1++
689049426b9d3b Alexei Starovoitov 2024-05-24  15204  	 * L1:
689049426b9d3b Alexei Starovoitov 2024-05-24  15205  	 *    if r1 != 100 goto L2
689049426b9d3b Alexei Starovoitov 2024-05-24  15206  	 *    fallthrough: r1=100 after widening
689049426b9d3b Alexei Starovoitov 2024-05-24  15207  	 *    other_branch: r1 stays as-is (0, 1, 2, ..)
689049426b9d3b Alexei Starovoitov 2024-05-24  15208  	 *
689049426b9d3b Alexei Starovoitov 2024-05-24  15209  	 *  Also recognize the case where both LHS and RHS are constant and
689049426b9d3b Alexei Starovoitov 2024-05-24  15210  	 *  equal to each other. In this case don't widen at all and take the
689049426b9d3b Alexei Starovoitov 2024-05-24  15211  	 *  predicted path. This key heuristic allows the verifier detect loop
689049426b9d3b Alexei Starovoitov 2024-05-24  15212  	 *  end condition and 'for (i = 0; i != 100; i++)' is validated just
689049426b9d3b Alexei Starovoitov 2024-05-24  15213  	 *  like bounded loop.
689049426b9d3b Alexei Starovoitov 2024-05-24  15214  	 */
689049426b9d3b Alexei Starovoitov 2024-05-24  15215  	else if (is_reg_const(dst_reg, is_jmp32) && is_reg_const(src_reg, is_jmp32) &&
689049426b9d3b Alexei Starovoitov 2024-05-24  15216  	    reg_const_value(dst_reg, is_jmp32) == reg_const_value(src_reg, is_jmp32))
689049426b9d3b Alexei Starovoitov 2024-05-24  15217  		ignore_pred = false;
689049426b9d3b Alexei Starovoitov 2024-05-24  15218  	else
689049426b9d3b Alexei Starovoitov 2024-05-24  15219  		ignore_pred = (get_loop_entry(this_branch) ||
689049426b9d3b Alexei Starovoitov 2024-05-24  15220  			       this_branch->may_goto_depth) &&
689049426b9d3b Alexei Starovoitov 2024-05-24  15221  				/* Gate widen_reg() logic */
689049426b9d3b Alexei Starovoitov 2024-05-24  15222  				env->bpf_capable;
689049426b9d3b Alexei Starovoitov 2024-05-24  15223  
c31534267c180f Andrii Nakryiko    2023-11-01  15224  	pred = is_branch_taken(dst_reg, src_reg, opcode, is_jmp32);
689049426b9d3b Alexei Starovoitov 2024-05-24  15225  	if (pred >= 0 && !ignore_pred) {
cac616db39c207 John Fastabend     2020-05-21  15226  		/* If we get here with a dst_reg pointer type it is because
cac616db39c207 John Fastabend     2020-05-21  15227  		 * above is_branch_taken() special cased the 0 comparison.
cac616db39c207 John Fastabend     2020-05-21  15228  		 */
cac616db39c207 John Fastabend     2020-05-21  15229  		if (!__is_pointer_value(false, dst_reg))
b5dc0163d8fd78 Alexei Starovoitov 2019-06-15  15230  			err = mark_chain_precision(env, insn->dst_reg);
6d94e741a8ff81 Alexei Starovoitov 2020-11-10  15231  		if (BPF_SRC(insn->code) == BPF_X && !err &&
6d94e741a8ff81 Alexei Starovoitov 2020-11-10  15232  		    !__is_pointer_value(false, src_reg))
b5dc0163d8fd78 Alexei Starovoitov 2019-06-15  15233  			err = mark_chain_precision(env, insn->src_reg);
b5dc0163d8fd78 Alexei Starovoitov 2019-06-15  15234  		if (err)
b5dc0163d8fd78 Alexei Starovoitov 2019-06-15  15235  			return err;
b5dc0163d8fd78 Alexei Starovoitov 2019-06-15  15236  	}
9183671af6dbf6 Daniel Borkmann    2021-05-28  15237  
689049426b9d3b Alexei Starovoitov 2024-05-24  15238  	if (pred < 0 || ignore_pred) {
689049426b9d3b Alexei Starovoitov 2024-05-24  15239  		other_branch = push_stack(env, *insn_idx + insn->off + 1, *insn_idx,
689049426b9d3b Alexei Starovoitov 2024-05-24  15240  					  false);
689049426b9d3b Alexei Starovoitov 2024-05-24  15241  		if (!other_branch)
689049426b9d3b Alexei Starovoitov 2024-05-24  15242  			return -EFAULT;
689049426b9d3b Alexei Starovoitov 2024-05-24  15243  		other_branch_regs = other_branch->frame[other_branch->curframe]->regs;
689049426b9d3b Alexei Starovoitov 2024-05-24  15244  		other_dst_reg = &other_branch_regs[insn->dst_reg];
689049426b9d3b Alexei Starovoitov 2024-05-24  15245  		if (has_src_reg)
689049426b9d3b Alexei Starovoitov 2024-05-24  15246  			other_src_reg = &other_branch_regs[insn->src_reg];
689049426b9d3b Alexei Starovoitov 2024-05-24  15247  	}
689049426b9d3b Alexei Starovoitov 2024-05-24  15248  
4f7b3e82589e0d Alexei Starovoitov 2018-12-03  15249  	if (pred == 1) {
9183671af6dbf6 Daniel Borkmann    2021-05-28  15250  		/* Only follow the goto, ignore fall-through. If needed, push
9183671af6dbf6 Daniel Borkmann    2021-05-28  15251  		 * the fall-through branch for simulation under speculative
9183671af6dbf6 Daniel Borkmann    2021-05-28  15252  		 * execution.
9183671af6dbf6 Daniel Borkmann    2021-05-28  15253  		 */
9183671af6dbf6 Daniel Borkmann    2021-05-28  15254  		if (!env->bypass_spec_v1 &&
9183671af6dbf6 Daniel Borkmann    2021-05-28  15255  		    !sanitize_speculative_path(env, insn, *insn_idx + 1,
9183671af6dbf6 Daniel Borkmann    2021-05-28  15256  					       *insn_idx))
9183671af6dbf6 Daniel Borkmann    2021-05-28  15257  			return -EFAULT;
1a8a315f008a58 Andrii Nakryiko    2023-10-11  15258  		if (env->log.level & BPF_LOG_LEVEL)
1a8a315f008a58 Andrii Nakryiko    2023-10-11  15259  			print_insn_state(env, this_branch->frame[this_branch->curframe]);
689049426b9d3b Alexei Starovoitov 2024-05-24  15260  		if (ignore_pred) {
689049426b9d3b Alexei Starovoitov 2024-05-24  15261  			/* dst and src regs are scalars. Widen them */
689049426b9d3b Alexei Starovoitov 2024-05-24  15262  			widen_reg(dst_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15263  			if (has_src_reg)
689049426b9d3b Alexei Starovoitov 2024-05-24  15264  				widen_reg(src_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15265  			/*
689049426b9d3b Alexei Starovoitov 2024-05-24  15266  			 * Widen other branch only if not comparing for equlity.
689049426b9d3b Alexei Starovoitov 2024-05-24  15267  			 * Example:
689049426b9d3b Alexei Starovoitov 2024-05-24  15268  			 *   r1 = 1
689049426b9d3b Alexei Starovoitov 2024-05-24  15269  			 *   if (r1 < 100)
689049426b9d3b Alexei Starovoitov 2024-05-24  15270  			 * will produce
689049426b9d3b Alexei Starovoitov 2024-05-24  15271  			 *   [0, 99] and [100, UMAX] after widening and reg_set_min_max().
689049426b9d3b Alexei Starovoitov 2024-05-24  15272  			 *
689049426b9d3b Alexei Starovoitov 2024-05-24  15273  			 *   r1 = 1
689049426b9d3b Alexei Starovoitov 2024-05-24  15274  			 *   if (r1 == 100)
689049426b9d3b Alexei Starovoitov 2024-05-24  15275  			 * will produce
689049426b9d3b Alexei Starovoitov 2024-05-24  15276  			 *    [1] and [100] after widening in other_branch and reg_set_min_max().
689049426b9d3b Alexei Starovoitov 2024-05-24  15277  			 */
689049426b9d3b Alexei Starovoitov 2024-05-24  15278  			if (opcode != BPF_JEQ && opcode != BPF_JNE) {
689049426b9d3b Alexei Starovoitov 2024-05-24  15279  				widen_reg(other_dst_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15280  				if (has_src_reg)
689049426b9d3b Alexei Starovoitov 2024-05-24  15281  					widen_reg(other_src_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15282  			}
689049426b9d3b Alexei Starovoitov 2024-05-24  15283  		} else {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15284  			*insn_idx += insn->off;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15285  			return 0;
689049426b9d3b Alexei Starovoitov 2024-05-24  15286  		}
4f7b3e82589e0d Alexei Starovoitov 2018-12-03  15287  	} else if (pred == 0) {
9183671af6dbf6 Daniel Borkmann    2021-05-28  15288  		/* Only follow the fall-through branch, since that's where the
9183671af6dbf6 Daniel Borkmann    2021-05-28  15289  		 * program will go. If needed, push the goto branch for
9183671af6dbf6 Daniel Borkmann    2021-05-28  15290  		 * simulation under speculative execution.
9183671af6dbf6 Daniel Borkmann    2021-05-28  15291  		 */
9183671af6dbf6 Daniel Borkmann    2021-05-28  15292  		if (!env->bypass_spec_v1 &&
9183671af6dbf6 Daniel Borkmann    2021-05-28  15293  		    !sanitize_speculative_path(env, insn,
9183671af6dbf6 Daniel Borkmann    2021-05-28  15294  					       *insn_idx + insn->off + 1,
9183671af6dbf6 Daniel Borkmann    2021-05-28  15295  					       *insn_idx))
9183671af6dbf6 Daniel Borkmann    2021-05-28  15296  			return -EFAULT;
1a8a315f008a58 Andrii Nakryiko    2023-10-11  15297  		if (env->log.level & BPF_LOG_LEVEL)
1a8a315f008a58 Andrii Nakryiko    2023-10-11  15298  			print_insn_state(env, this_branch->frame[this_branch->curframe]);
689049426b9d3b Alexei Starovoitov 2024-05-24  15299  		if (ignore_pred) {
689049426b9d3b Alexei Starovoitov 2024-05-24  15300  			if (opcode != BPF_JEQ && opcode != BPF_JNE) {
689049426b9d3b Alexei Starovoitov 2024-05-24  15301  				widen_reg(dst_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15302  				if (has_src_reg)
689049426b9d3b Alexei Starovoitov 2024-05-24  15303  					widen_reg(src_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15304  			}
689049426b9d3b Alexei Starovoitov 2024-05-24  15305  			widen_reg(other_dst_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15306  			if (has_src_reg)
689049426b9d3b Alexei Starovoitov 2024-05-24  15307  				widen_reg(other_src_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15308  		} else {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15309  			return 0;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15310  		}
689049426b9d3b Alexei Starovoitov 2024-05-24  15311  	}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15312  
484611357c19f9 Josef Bacik        2016-09-28  15313  	if (BPF_SRC(insn->code) == BPF_X) {
5f99f312bd3bed Andrii Nakryiko    2023-11-11  15314  		err = reg_set_min_max(env,
689049426b9d3b Alexei Starovoitov 2024-05-24 @15315  				      other_dst_reg, other_src_reg,
4621202adc5bc0 Andrii Nakryiko    2023-11-01  15316  				      dst_reg, src_reg, opcode, is_jmp32);
4621202adc5bc0 Andrii Nakryiko    2023-11-01  15317  	} else /* BPF_SRC(insn->code) == BPF_K */ {
5f99f312bd3bed Andrii Nakryiko    2023-11-11  15318  		err = reg_set_min_max(env,
689049426b9d3b Alexei Starovoitov 2024-05-24  15319  				      other_dst_reg,
4621202adc5bc0 Andrii Nakryiko    2023-11-01  15320  				      src_reg /* fake one */,
4621202adc5bc0 Andrii Nakryiko    2023-11-01  15321  				      dst_reg, src_reg /* same fake one */,
3f50f132d8400e John Fastabend     2020-03-30  15322  				      opcode, is_jmp32);
484611357c19f9 Josef Bacik        2016-09-28  15323  	}
5f99f312bd3bed Andrii Nakryiko    2023-11-11  15324  	if (err)
5f99f312bd3bed Andrii Nakryiko    2023-11-11  15325  		return err;
5f99f312bd3bed Andrii Nakryiko    2023-11-11  15326  
689049426b9d3b Alexei Starovoitov 2024-05-24  15327  	if (has_src_reg &&
4621202adc5bc0 Andrii Nakryiko    2023-11-01  15328  	    src_reg->type == SCALAR_VALUE && src_reg->id &&
689049426b9d3b Alexei Starovoitov 2024-05-24  15329  	    !WARN_ON_ONCE(src_reg->id != other_src_reg->id)) {
75748837b7e569 Alexei Starovoitov 2020-10-08  15330  		find_equal_scalars(this_branch, src_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15331  		find_equal_scalars(other_branch, other_src_reg);
75748837b7e569 Alexei Starovoitov 2020-10-08  15332  	}
e688c3db7ca69b Alexei Starovoitov 2020-10-14  15333  	if (dst_reg->type == SCALAR_VALUE && dst_reg->id &&
689049426b9d3b Alexei Starovoitov 2024-05-24  15334  	    !WARN_ON_ONCE(dst_reg->id != other_dst_reg->id)) {
75748837b7e569 Alexei Starovoitov 2020-10-08  15335  		find_equal_scalars(this_branch, dst_reg);
689049426b9d3b Alexei Starovoitov 2024-05-24  15336  		find_equal_scalars(other_branch, other_dst_reg);
75748837b7e569 Alexei Starovoitov 2020-10-08  15337  	}
75748837b7e569 Alexei Starovoitov 2020-10-08  15338  
befae75856ab40 Eduard Zingerman   2022-11-16  15339  	/* if one pointer register is compared to another pointer
befae75856ab40 Eduard Zingerman   2022-11-16  15340  	 * register check if PTR_MAYBE_NULL could be lifted.
befae75856ab40 Eduard Zingerman   2022-11-16  15341  	 * E.g. register A - maybe null
befae75856ab40 Eduard Zingerman   2022-11-16  15342  	 *      register B - not null
befae75856ab40 Eduard Zingerman   2022-11-16  15343  	 * for JNE A, B, ... - A is not null in the false branch;
befae75856ab40 Eduard Zingerman   2022-11-16  15344  	 * for JEQ A, B, ... - A is not null in the true branch.
8374bfd5a3c90a Hao Sun            2022-12-22  15345  	 *
8374bfd5a3c90a Hao Sun            2022-12-22  15346  	 * Since PTR_TO_BTF_ID points to a kernel struct that does
8374bfd5a3c90a Hao Sun            2022-12-22  15347  	 * not need to be null checked by the BPF program, i.e.,
8374bfd5a3c90a Hao Sun            2022-12-22  15348  	 * could be null even without PTR_MAYBE_NULL marking, so
8374bfd5a3c90a Hao Sun            2022-12-22  15349  	 * only propagate nullness when neither reg is that type.
befae75856ab40 Eduard Zingerman   2022-11-16  15350  	 */
689049426b9d3b Alexei Starovoitov 2024-05-24  15351  	if (!is_jmp32 && has_src_reg &&
befae75856ab40 Eduard Zingerman   2022-11-16  15352  	    __is_pointer_value(false, src_reg) && __is_pointer_value(false, dst_reg) &&
8374bfd5a3c90a Hao Sun            2022-12-22  15353  	    type_may_be_null(src_reg->type) != type_may_be_null(dst_reg->type) &&
8374bfd5a3c90a Hao Sun            2022-12-22  15354  	    base_type(src_reg->type) != PTR_TO_BTF_ID &&
8374bfd5a3c90a Hao Sun            2022-12-22  15355  	    base_type(dst_reg->type) != PTR_TO_BTF_ID) {
befae75856ab40 Eduard Zingerman   2022-11-16  15356  		eq_branch_regs = NULL;
befae75856ab40 Eduard Zingerman   2022-11-16  15357  		switch (opcode) {
befae75856ab40 Eduard Zingerman   2022-11-16  15358  		case BPF_JEQ:
befae75856ab40 Eduard Zingerman   2022-11-16  15359  			eq_branch_regs = other_branch_regs;
befae75856ab40 Eduard Zingerman   2022-11-16  15360  			break;
befae75856ab40 Eduard Zingerman   2022-11-16  15361  		case BPF_JNE:
befae75856ab40 Eduard Zingerman   2022-11-16  15362  			eq_branch_regs = regs;
befae75856ab40 Eduard Zingerman   2022-11-16  15363  			break;
befae75856ab40 Eduard Zingerman   2022-11-16  15364  		default:
befae75856ab40 Eduard Zingerman   2022-11-16  15365  			/* do nothing */
befae75856ab40 Eduard Zingerman   2022-11-16  15366  			break;
befae75856ab40 Eduard Zingerman   2022-11-16  15367  		}
befae75856ab40 Eduard Zingerman   2022-11-16  15368  		if (eq_branch_regs) {
befae75856ab40 Eduard Zingerman   2022-11-16  15369  			if (type_may_be_null(src_reg->type))
befae75856ab40 Eduard Zingerman   2022-11-16  15370  				mark_ptr_not_null_reg(&eq_branch_regs[insn->src_reg]);
befae75856ab40 Eduard Zingerman   2022-11-16  15371  			else
befae75856ab40 Eduard Zingerman   2022-11-16  15372  				mark_ptr_not_null_reg(&eq_branch_regs[insn->dst_reg]);
befae75856ab40 Eduard Zingerman   2022-11-16  15373  		}
befae75856ab40 Eduard Zingerman   2022-11-16  15374  	}
befae75856ab40 Eduard Zingerman   2022-11-16  15375  
092ed0968bb648 Jiong Wang         2019-01-26  15376  	/* detect if R == 0 where R is returned from bpf_map_lookup_elem().
092ed0968bb648 Jiong Wang         2019-01-26  15377  	 * NOTE: these optimizations below are related with pointer comparison
092ed0968bb648 Jiong Wang         2019-01-26  15378  	 *       which will never be JMP32.
092ed0968bb648 Jiong Wang         2019-01-26  15379  	 */
092ed0968bb648 Jiong Wang         2019-01-26  15380  	if (!is_jmp32 && BPF_SRC(insn->code) == BPF_K &&
1a0dc1ac1d2928 Alexei Starovoitov 2016-05-05  15381  	    insn->imm == 0 && (opcode == BPF_JEQ || opcode == BPF_JNE) &&
c25b2ae136039f Hao Luo            2021-12-16  15382  	    type_may_be_null(dst_reg->type)) {
840b9615d6e9d1 Joe Stringer       2018-10-02  15383  		/* Mark all identical registers in each branch as either
57a09bf0a41670 Thomas Graf        2016-10-18  15384  		 * safe or unknown depending R == 0 or R != 0 conditional.
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15385  		 */
840b9615d6e9d1 Joe Stringer       2018-10-02  15386  		mark_ptr_or_null_regs(this_branch, insn->dst_reg,
840b9615d6e9d1 Joe Stringer       2018-10-02  15387  				      opcode == BPF_JNE);
840b9615d6e9d1 Joe Stringer       2018-10-02  15388  		mark_ptr_or_null_regs(other_branch, insn->dst_reg,
840b9615d6e9d1 Joe Stringer       2018-10-02  15389  				      opcode == BPF_JEQ);
5beca081be9195 Daniel Borkmann    2017-11-01  15390  	} else if (!try_match_pkt_pointers(insn, dst_reg, &regs[insn->src_reg],
5beca081be9195 Daniel Borkmann    2017-11-01  15391  					   this_branch, other_branch) &&
5beca081be9195 Daniel Borkmann    2017-11-01  15392  		   is_pointer_value(env, insn->dst_reg)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  15393  		verbose(env, "R%d pointer comparison prohibited\n",
61bd5218eef349 Jakub Kicinski     2017-10-09  15394  			insn->dst_reg);
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  15395  		return -EACCES;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15396  	}
06ee7115b0d174 Alexei Starovoitov 2019-04-01  15397  	if (env->log.level & BPF_LOG_LEVEL)
2e5766483c8c5c Christy Lee        2021-12-16  15398  		print_insn_state(env, this_branch->frame[this_branch->curframe]);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15399  	return 0;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15400  }
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
