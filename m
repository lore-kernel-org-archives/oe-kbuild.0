Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278696;
	b=th3fy86Vwq/mwSG9SlG+ZC/3n6F0+QIqkzmOTWMcsLPsAQshJzdxwPistnTq8JG2Rzhq
	 D82M6gh8vUpV5w9tG2NABl/Y3FwvhHXhDoh3ngCtqnwHZjaXYP6uvGq1tNWsXraAAmez6
	 735BtGQERQ84VakW7Sz4NamonUkLuztj5e0d9hXx+Lt4asigC6m6DGTTtNGwfvk+2cAed
	 U7tdqNKCBP5QMJaSLYavaLrG8RjDT1MdUffLhSJ8AB6J7DQKi/5i7Oz/lHc2UjVq83NIM
	 F8FStKxSKLCFWGut6T5eJaOeZ0VuANx9FZzu2OkIW7kqBy096nho2V7M9b0NuLh9xLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278696;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5/xD7HBKpdG53Fz1iftjcKWBvWhqn51q4RCpkhnFh3E=;
	b=M5AVJxabXg3G8iAAcMiw0p0JJqWSLPl+pIxjsX1Ltn8FkMV1pNVkOkr9N7AlYCxuMxPo
	 iJ4YlqIDAfIeYWT5XA3+s6QbP3QY9jjg1VpZlsfD3pEPdrvpz5wLtfrxe0tr8H3uRncfz
	 9TNsUvkYcfGWTcKfPsHgccgltWIiUmRZEkt26yuS5Z8Dpt9hPjXqnxHyIRsju5TeuKrJm
	 JC3MYiCvuOk20T4Mvu0fsUoU8+/8JWPA96F3VVjNV8u95eVjLRA6sUG31U2mR+AMnJQby
	 274coAxBJsIMZw96L+bsC8HaaemXBWwS2CL/YKTdnN9xYX9JkvU3Y3PqTOY0bkybQOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NazjlvDg;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D3606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 16:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721D3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NazjlvDg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795278694; x=1826814694;
  h=date:from:to:cc:subject:message-id;
  bh=HnvwVCkv+F9gaGVWp6nB0mSWNTO8EKDjECdncF/y1OM=;
  b=NazjlvDg/UcaygQRSTbhGc5bP7dfF40YO6v9WzjEAaDcAkZ4o0VXlqlp
   55YwyMfDDqVJoLiyVQBk6J5/UpFq8sWytTdV9xwVxbVYzVE5PLLqVXvSg
   EAjdml8+PTcT3QSCR5rhVt6e50xuxCgbxXfFFNmUofDlBiUHSA3Q1MqTS
   hyz+AbwaYYyMGMI8dp9UmghwuSz5K8XaLH4rM6B5UVGfUdUgP6kG6mD7E
   Cu5FxZ9U/ePt7b1qSlZbVClzUCWGC4fAMYsP+YcO44tCKjSxnBeyjPf4e
   k+DHi2+Mvn2Et7WvR0cBiFoAcj0xk6AlGN4HOWDtW5ETbfwI7woNzyTsB
   A==;
X-CSE-ConnectionGUID: ke5hvwRnSp+Ha3QeqXm3dQ==
X-CSE-MsgGUID: 6YweQjAhQmy2MTpQ/EaLXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4125388"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4125388"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 08:31:33 -0800
X-CSE-ConnectionGUID: bZE4efjdSoiMHriRoLI1gA==
X-CSE-MsgGUID: YGgKU0tUTb2nKTzHcmexkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10871370"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Nov 2026 08:31:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUnzu-000000004Lh-12ib;
	Sat, 21 Nov 2026 16:31:30 +0000
Date: Sat, 21 Nov 2026 17:31:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:master 38/51]
 kernel/bpf/verifier.c:21688:(.text+0x40f58): relocation truncated to fit:
 R_OR1K_INSN_REL_26 against undefined symbol `bpf_prog_offload_verify_insn'
Message-ID: <20261121172259.3syfDbih-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   9867c61abbd44f7053a871566b3d982f62c6d8dc
commit: 09c84023b0b4ef040548929859de81177a15bab2 [38/51] bpf: Verify in passes
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: openrisc-randconfig-r2104-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121172259.3syfDbih-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121172259.3syfDbih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121172259.3syfDbih-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: kernel/bpf/verifier.o: in function `do_check_block':
   kernel/bpf/verifier.c:21688:(.text+0x40f58): undefined reference to `bpf_prog_offload_verify_insn'
>> kernel/bpf/verifier.c:21688:(.text+0x40f58): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `bpf_prog_offload_verify_insn'


vim +21688 kernel/bpf/verifier.c

3c41899af5d0855 Alexei Starovoitov      2026-11-20  21604  
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21605  /* Process the current state until it gets to the start of a basic block. */
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21606  static int do_check_block(struct bpf_verifier_env *env, int prev_insn_idx)
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21607  {
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21608  	struct bpf_verifier_state *state = env->cur_state;
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21609  	struct bpf_verifier_stack_elem *elem;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21610  	struct bpf_insn *insns = env->prog->insnsi;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21611  	int insn_cnt = env->prog->len;
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21612  	bool do_print_state = true, from_unproven;
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21613  	struct prog_requirements prog_requirements, new_requirements;
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21614  	bool again = prev_insn_idx == env->insn_idx;
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21615  	unsigned long ranges;
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21616  	bool stack_args;
37e13b091537b2e Alexei Starovoitov      2026-11-20  21617  	u32 held;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21618  
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21619  	mark_verifier_state_scratched(env);
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21620  	for (;;) {
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21621  		struct bpf_insn *insn;
dadb59104c6441f Luis Gerhorst           2025-07-05  21622  		struct bpf_insn_aux_data *insn_aux;
d83c595d9480edd Alexei Starovoitov      2026-11-20  21623  		struct bpf_insn_fixups fixups;
6762e3a0bce5fce Eduard Zingerman        2026-04-10  21624  		int err;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21625  
3c41899af5d0855 Alexei Starovoitov      2026-11-20  21626  		err = bpf_check_limits(env);
3c41899af5d0855 Alexei Starovoitov      2026-11-20  21627  		if (err)
3c41899af5d0855 Alexei Starovoitov      2026-11-20  21628  			return err;
8fd58560b71e97e Alexei Starovoitov      2026-11-07  21629  
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21630  		env->prev_insn_idx = prev_insn_idx;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21631  		if (env->insn_idx >= insn_cnt) {
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21632  			verbose(env, "invalid insn idx %d insn_cnt %d\n",
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21633  				env->insn_idx, insn_cnt);
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21634  			return -EFAULT;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21635  		}
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21636  
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21637  		insn = &insns[env->insn_idx];
dadb59104c6441f Luis Gerhorst           2025-07-05  21638  		insn_aux = &env->insn_aux_data[env->insn_idx];
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21639  
14c950ac2be8cad Kumar Kartikeya Dwivedi 2026-08-13  21640  		account_processed_insn(env);
14c950ac2be8cad Kumar Kartikeya Dwivedi 2026-08-13  21641  
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21642  		state->last_insn_idx = env->prev_insn_idx;
13f843c0177eeb3 Eduard Zingerman        2025-06-11  21643  		state->insn_idx = env->insn_idx;
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21644  		/*
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21645  		 * Record the incoming edge. A zero-offset conditional has identical
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21646  		 * successors, so its outcome cannot be reconstructed from the edge.
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21647  		 */
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21648  		if (!state->speculative && prev_insn_idx >= 0 && prev_insn_idx < insn_cnt) {
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21649  			struct bpf_insn *prev_insn = &insns[prev_insn_idx];
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21650  			int fallthrough_idx = prev_insn_idx + 1;
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21651  			int branch_idx = prev_insn_idx + bpf_jmp_offset(prev_insn) + 1;
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21652  			u8 class = BPF_CLASS(prev_insn->code);
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21653  			u8 opcode = BPF_OP(prev_insn->code);
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21654  
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21655  			if ((class == BPF_JMP || class == BPF_JMP32) &&
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21656  			    opcode != BPF_JA && opcode != BPF_CALL && opcode != BPF_EXIT &&
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21657  			    opcode <= BPF_JCOND && branch_idx != fallthrough_idx) {
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21658  				if (env->insn_idx == branch_idx)
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21659  					bpf_diag_record_branch(env, prev_insn_idx, true);
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21660  				else if (env->insn_idx == fallthrough_idx)
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21661  					bpf_diag_record_branch(env, prev_insn_idx, false);
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21662  			}
daf8248701b621d Kumar Kartikeya Dwivedi 2026-08-15  21663  		}
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21664  
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21665  		if (env->log.level & BPF_LOG_LEVEL2 && do_print_state) {
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21666  			verbose(env, "\nfrom %d to %d%s:",
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21667  				env->prev_insn_idx, env->insn_idx,
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21668  				env->cur_state->speculative ?
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21669  				" (speculative execution)" : "");
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21670  			print_verifier_state(env, state, state->curframe, true);
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21671  			do_print_state = false;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21672  		}
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21673  
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21674  		if (env->log.level & BPF_LOG_LEVEL) {
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21675  			if (verifier_state_scratched(env))
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21676  				print_insn_state(env, state, state->curframe);
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21677  
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21678  			verbose_linfo(env, env->insn_idx, "; ");
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21679  			env->prev_log_pos = env->log.end_pos;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21680  			verbose(env, "%d: ", env->insn_idx);
19dbb1347481105 Alexei Starovoitov      2026-04-02  21681  			bpf_verbose_insn(env, insn);
483a1bb0b6cf816 Eduard Zingerman        2026-08-07  21682  			verbose(env, "\n");
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21683  			env->prev_insn_print_pos = env->log.end_pos - env->prev_log_pos;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21684  			env->prev_log_pos = env->log.end_pos;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21685  		}
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21686  
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21687  		if (env->replay) {
8b7df50fd40d7ab Luis Gerhorst           2025-06-03 @21688  			err = bpf_prog_offload_verify_insn(env, env->insn_idx,
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21689  							   env->prev_insn_idx);
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21690  			if (err)
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21691  				return err;
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21692  		} else if (bpf_prog_is_offloaded(env->prog->aux)) {
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21693  			/* the driver cannot forget what an imprecise state shows */
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21694  			note_pessimized_insn(env, env->insn_idx);
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21695  		}
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21696  
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21697  		sanitize_mark_insn_seen(env);
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21698  		insn_aux->suspect_loops |= state->suspect_loops;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21699  		prev_insn_idx = env->insn_idx;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21700  
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21701  		/* Sanity check: precomputed constants must match verifier state */
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21702  		if (!state->speculative && !env->err && !env->extra_values &&
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21703  		    insn_aux->const_reg_mask) {
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21704  			struct bpf_reg_state *regs = cur_regs(env);
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21705  			u16 mask = insn_aux->const_reg_mask;
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21706  
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21707  			for (int r = 0; r < ARRAY_SIZE(insn_aux->const_reg_vals); r++) {
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21708  				u32 cval = insn_aux->const_reg_vals[r];
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21709  
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21710  				if (!(mask & BIT(r)))
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21711  					continue;
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21712  				if (regs[r].type != SCALAR_VALUE)
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21713  					continue;
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21714  				if (!tnum_is_const(regs[r].var_off))
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21715  					continue;
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21716  				if (verifier_bug_if((u32)regs[r].var_off.value != cval,
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21717  						    env, "const R%d: %u != %llu",
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21718  						    r, cval, regs[r].var_off.value))
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21719  					return -EFAULT;
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21720  			}
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21721  		}
f1606dd0ac49230 Alexei Starovoitov      2026-04-02  21722  
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21723  		/* Reduce verification complexity by stopping speculative path
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21724  		 * verification when a nospec is encountered.
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21725  		 */
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21726  		if (state->speculative && insn_aux->non_speculative_first)
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21727  			need_nospec(env, env->insn_idx);
dadb59104c6441f Luis Gerhorst           2025-07-05  21728  		if (state->speculative && insn_aux->nospec)
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21729  			goto process_bpf_exit;
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21730  		insn_aux->speculative_first |= !insn_aux->seen;
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21731  
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21732  		ranges = operands_with_range(env, insn);
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21733  		stack_args = cur_func(env)->out_stack_arg_cnt;
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21734  
d83c595d9480edd Alexei Starovoitov      2026-11-20  21735  		err = check_loop_guard(env) ?: check_recursion_guard(env);
eaea73907052141 Alexei Starovoitov      2026-11-07  21736  		if (err)
eaea73907052141 Alexei Starovoitov      2026-11-07  21737  			return err;
eaea73907052141 Alexei Starovoitov      2026-11-07  21738  
92907a9af652365 Alexei Starovoitov      2026-11-20  21739  		bpf_equations_before_insn(env);
37e13b091537b2e Alexei Starovoitov      2026-11-20  21740  		held = held_cnt(state);
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21741  		from_unproven = reads_from_unproven(env);
d83c595d9480edd Alexei Starovoitov      2026-11-20  21742  		fixups = insn_aux->fixups;
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21743  		prog_requirements = get_prog_requirements(env);
a46de5d64e18603 Alexei Starovoitov      2026-11-20  21744  		env->no_report = state->speculative;
92907a9af652365 Alexei Starovoitov      2026-11-20  21745  		err = do_check_insn(env, &do_print_state) ?: bpf_equations_after_insn(env);
a46de5d64e18603 Alexei Starovoitov      2026-11-20  21746  		env->no_report = false;
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21747  		new_requirements = get_prog_requirements(env);
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21748  		/* a join adds values only to a range */
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21749  		if ((ranges || stack_args || again) &&
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21750  		    memcmp(&prog_requirements, &new_requirements, sizeof(new_requirements)))
cd97aa1387d9478 Alexei Starovoitov      2026-11-20  21751  			note_pessimized_insn(env, prev_insn_idx);
762e1478d7c5da9 Alexei Starovoitov      2026-11-20  21752  		/* a call or an exit gave the state to the flow, the error is from there */
762e1478d7c5da9 Alexei Starovoitov      2026-11-20  21753  		if (err < 0 && !state->frame[0])
762e1478d7c5da9 Alexei Starovoitov      2026-11-20  21754  			return err;
37e13b091537b2e Alexei Starovoitov      2026-11-20  21755  		insn_aux->releases |= held_cnt(state) < held && err != PROCESS_BPF_EXIT;
37e13b091537b2e Alexei Starovoitov      2026-11-20  21756  		insn_aux->acquires |= held_cnt(state) > held;
d83c595d9480edd Alexei Starovoitov      2026-11-20  21757  		if (nospec_ends_path(env, state, err)) {
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21758  			/* Prevent this speculative path from ever reaching the
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21759  			 * insn that would have been unsafe to execute.
d83c595d9480edd Alexei Starovoitov      2026-11-20  21760  			 * What it noted does not apply to the other paths.
d83c595d9480edd Alexei Starovoitov      2026-11-20  21761  			 * check_fastcall_stack_contract() clears the pattern only once.
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21762  			 */
d83c595d9480edd Alexei Starovoitov      2026-11-20  21763  			fixups.fastcall_spills_num = insn_aux->fastcall_spills_num;
d83c595d9480edd Alexei Starovoitov      2026-11-20  21764  			insn_aux->fixups = fixups;
d83c595d9480edd Alexei Starovoitov      2026-11-20  21765  			need_nospec(env, prev_insn_idx);
d83c595d9480edd Alexei Starovoitov      2026-11-20  21766  			free_pushed_states(env);
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21767  			goto process_bpf_exit;
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21768  		} else if (error_is_recoverable(err) && !env->path_sensitive) {
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21769  			env->insn_idx = prev_insn_idx;
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21770  			if (bpf_same_insns_unproven(env))
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21771  				return err;
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21772  			if (from_unproven)
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21773  				bpf_note_reads_from_unproven(env, prev_insn_idx);
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21774  			else
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21775  				note_error(env, err);
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21776  			err = skip_unproven_insn(env, insn);
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21777  			if (err < 0)
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21778  				return err;
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21779  			if (err)
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21780  				goto process_bpf_exit;
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21781  			mark_from_unproven(env, prev_insn_idx, true);
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21782  			env->insn_idx++;
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21783  		} else if (err < 0) {
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21784  			return err;
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21785  		} else if (err == PROCESS_BPF_EXIT) {
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21786  			goto process_bpf_exit;
2ec74a053611edf Alexei Starovoitov      2026-04-11  21787  		} else if (err == INSN_IDX_UPDATED) {
2ec74a053611edf Alexei Starovoitov      2026-04-11  21788  		} else if (err == 0) {
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21789  			if (!bpf_pseudo_call(insn) && !bpf_is_callx(insn))
0e549bbe75ab747 Alexei Starovoitov      2026-11-20  21790  				mark_from_unproven(env, prev_insn_idx, from_unproven);
2ec74a053611edf Alexei Starovoitov      2026-04-11  21791  			env->insn_idx++;
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21792  		}
d6f1c85f22534d2 Luis Gerhorst           2025-06-03  21793  
d83c595d9480edd Alexei Starovoitov      2026-11-20  21794  		/* only a store that stays gets it, see bpf_convert_ctx_accesses() */
d83c595d9480edd Alexei Starovoitov      2026-11-20  21795  		if (state->speculative && insn_aux->nospec_result && !insn_aux->fastcall_pattern &&
d83c595d9480edd Alexei Starovoitov      2026-11-20  21796  		    bpf_is_mem_insn(insn) && BPF_MODE(insn->code) == BPF_MEM) {
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21797  process_bpf_exit:
14c950ac2be8cad Kumar Kartikeya Dwivedi 2026-08-13  21798  			account_current_path(env);
3c41899af5d0855 Alexei Starovoitov      2026-11-20  21799  			bpf_free_verifier_state(env, state, false);
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21800  			memset(state, 0, sizeof(*state));
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21801  			return flow_drain(env);
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21802  		}
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21803  
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21804  		/* if the insn pushed a part, the current state is a part too */
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21805  		for (elem = env->head; elem; elem = elem->next)
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21806  			again |= elem->again;
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21807  		err = flow_drain(env);
c9e31900b54cadf Eduard Zingerman        2025-06-11  21808  		if (err)
c9e31900b54cadf Eduard Zingerman        2025-06-11  21809  			return err;
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21810  
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21811  		/* the parts of a state meet at the next insn */
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21812  		if (env->insn_idx < insn_cnt &&
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21813  		    (again || bpf_flow_is_bb_start(env, env->insn_idx))) {
5395aa9bbeb5690 Alexei Starovoitov      2026-11-07  21814  			account_current_path(env);
0e5e78acdf2a625 Alexei Starovoitov      2026-11-20  21815  			return bpf_flow_deliver(env, state, env->insn_idx, prev_insn_idx, false);
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21816  		}
8b7df50fd40d7ab Luis Gerhorst           2025-06-03  21817  	}
17a5267067f3c37 Alexei Starovoitov      2014-09-26  21818  }
17a5267067f3c37 Alexei Starovoitov      2014-09-26  21819  

:::::: The code at line 21688 was first introduced by commit
:::::: 8b7df50fd40d7ab3b467c9739965b0e5a02e6113 bpf: Move insn if/else into do_check_insn()

:::::: TO: Luis Gerhorst <luis.gerhorst@fau.de>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
