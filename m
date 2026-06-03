Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDEF478E5B
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jun 2026 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488838; cv=none; b=dKj2wBle6U6BoQq4knZF0qns1kP1Fi1q/HjQISkJ8ITK6fU5J7KsJa8i+C3AnWX2JJK+wwrp2jopDYl986q8SZxKzDn/GArRFh5sGr/mbJ/b0BT5kz8zCwSulTjNumhNd2XdtQ6dDEK5VjRbg0+cCWg58MKsb4x5zi2gGWQh2KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488838; c=relaxed/simple;
	bh=wm/z+xWiKi2qcNS2Vw1+eaeznJxTGgE+Jm6wMr2LDmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QHGW6yFxPELpQlnYiT3G49WfVb2vKPGJPhqi/7C0eAUWHddJXJw6V7NXKOTsFMgMu1MpqVpVdN5WsxPACcU/KRZHUmFAGFyNn8KiqJYqQvvCNbdE3NyeJZq12Qn2+9yNpfNSR6zMqspKTCXCbDS5ZwFTli5HdgppIXa6V88zdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPc8Q8xh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPc8Q8xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780488833; x=1812024833;
  h=date:from:to:cc:subject:message-id;
  bh=wm/z+xWiKi2qcNS2Vw1+eaeznJxTGgE+Jm6wMr2LDmw=;
  b=MPc8Q8xh7MbBgi0GudumNyjsC+lIvJnL/HJxA8r3yh9xVCRlTwOKhZ4k
   VQRaOhHpMvnLlbgHHRGLQn67370oon82XHj985f8r8bgk0dBHbA2ebF35
   BDOBo21A/BsVyD312hBqGDfWNOIOyp542FJDmfvriUG2lyioBpSZsAS/6
   +kq/8gP3rMEjltzfdTyutJTOOpexaG89h8+gJWC60kgLU9brnJZ6edd+P
   8D22eKFSyKW4c2D1TkzRxbaNTObdMSQ//WBtjYGCQiq9RGYSu7VRRZDl7
   0+CsDf4L4AD3V7kBk8N3TQLo2NECbBY9QDwTGuFvhjvtmeT/Kwlrylh3B
   w==;
X-CSE-ConnectionGUID: Wn0HauD7SDWRwBOPrnnogA==
X-CSE-MsgGUID: njjC3r92TsqRpi7lQT+tvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92401518"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="92401518"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 05:13:53 -0700
X-CSE-ConnectionGUID: fR5fNh26QHSg4zHKXo7Y7w==
X-CSE-MsgGUID: rHgm1TIKSuigonpmQP4iBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="249301118"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jun 2026 05:13:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUkTk-00000000DOk-3tZG;
	Wed, 03 Jun 2026 12:13:48 +0000
Date: Wed, 03 Jun 2026 20:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bpf-next:master 20/51] kernel/bpf/verifier.c:13118:7-9:
 WARNING: Unsigned expression compared with zero: id < 0
Message-ID: <202606032034.X5zQztsi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Amery Hung <ameryhung@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   b93c55b4932dd7e32dca8cf34a3443cc87a02906
commit: 308c7a0ae8859b34d9d90a3dff953b2d14242145 [20/51] bpf: Refactor object relationship tracking and fix dynptr UAF bug
:::::: branch date: 32 hours ago
:::::: commit date: 35 hours ago
config: sparc-randconfig-r061-20260603 (https://download.01.org/0day-ci/archive/20260603/202606032034.X5zQztsi-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606032034.X5zQztsi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/verifier.c:13118:7-9: WARNING: Unsigned expression compared with zero: id < 0

vim +13118 kernel/bpf/verifier.c

a923819fb2c5be Kumar Kartikeya Dwivedi 2023-09-13  12799  
07236eab7a3139 Andrii Nakryiko         2023-03-08  12800  static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
07236eab7a3139 Andrii Nakryiko         2023-03-08  12801  			    int *insn_idx_p)
07236eab7a3139 Andrii Nakryiko         2023-03-08  12802  {
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12803  	bool sleepable, rcu_lock, rcu_unlock, preempt_disable, preempt_enable;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12804  	struct bpf_reg_state *regs = cur_regs(env);
07236eab7a3139 Andrii Nakryiko         2023-03-08  12805  	const char *func_name, *ptr_type_name;
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12806  	const struct btf_type *t, *ptr_type;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12807  	struct bpf_kfunc_call_arg_meta meta;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12808  	struct bpf_insn_aux_data *insn_aux;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12809  	int err, insn_idx = *insn_idx_p;
308c7a0ae8859b Amery Hung              2026-05-28  12810  	u32 i, nargs, ptr_type_id, id;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12811  	const struct btf_param *args;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12812  	struct btf *desc_btf;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12813  
07236eab7a3139 Andrii Nakryiko         2023-03-08  12814  	/* skip for now, but return error when we find this in fixup_kfunc_call */
07236eab7a3139 Andrii Nakryiko         2023-03-08  12815  	if (!insn->imm)
07236eab7a3139 Andrii Nakryiko         2023-03-08  12816  		return 0;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12817  
f8a8faceab9953 Alexei Starovoitov      2026-04-12  12818  	err = bpf_fetch_kfunc_arg_meta(env, insn->imm, insn->off, &meta);
08ca87d6324350 Ihor Solodrai           2026-01-20  12819  	if (err == -EACCES && meta.func_name)
08ca87d6324350 Ihor Solodrai           2026-01-20  12820  		verbose(env, "calling kernel function %s is not allowed\n", meta.func_name);
07236eab7a3139 Andrii Nakryiko         2023-03-08  12821  	if (err)
07236eab7a3139 Andrii Nakryiko         2023-03-08  12822  		return err;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12823  	desc_btf = meta.btf;
08ca87d6324350 Ihor Solodrai           2026-01-20  12824  	func_name = meta.func_name;
07236eab7a3139 Andrii Nakryiko         2023-03-08  12825  	insn_aux = &env->insn_aux_data[insn_idx];
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12826  
f8a8faceab9953 Alexei Starovoitov      2026-04-12  12827  	insn_aux->is_iter_next = bpf_is_iter_next_kfunc(&meta);
06accc8779c1d5 Andrii Nakryiko         2023-03-08  12828  
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12829  	if (!insn->off &&
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12830  	    (insn->imm == special_kfunc_list[KF_bpf_res_spin_lock] ||
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12831  	     insn->imm == special_kfunc_list[KF_bpf_res_spin_lock_irqsave])) {
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12832  		struct bpf_verifier_state *branch;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12833  		struct bpf_reg_state *regs;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12834  
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12835  		branch = push_stack(env, env->insn_idx + 1, env->insn_idx, false);
6ea5fc92a0fc1c Anton Protopopov        2025-10-19  12836  		if (IS_ERR(branch)) {
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12837  			verbose(env, "failed to push state for failed lock acquisition\n");
6ea5fc92a0fc1c Anton Protopopov        2025-10-19  12838  			return PTR_ERR(branch);
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12839  		}
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12840  
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12841  		regs = branch->frame[branch->curframe]->regs;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12842  
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12843  		/* Clear r0-r5 registers in forked state */
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12844  		for (i = 0; i < CALLER_SAVED_REGS; i++)
c82834a5a11f74 Alexei Starovoitov      2026-04-12  12845  			bpf_mark_reg_not_init(env, &regs[caller_saved[i]]);
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12846  
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12847  		mark_reg_unknown(env, regs, BPF_REG_0);
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12848  		err = __mark_reg_s32_range(env, regs, BPF_REG_0, -MAX_ERRNO, -1);
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12849  		if (err) {
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12850  			verbose(env, "failed to mark s32 range for retval in forked state for lock\n");
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12851  			return err;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12852  		}
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12853  		__mark_btf_func_reg_size(env, regs, BPF_REG_0, sizeof(u32));
f95695f2c46592 Yonghong Song           2025-05-23  12854  	} else if (!insn->off && insn->imm == special_kfunc_list[KF___bpf_trap]) {
f95695f2c46592 Yonghong Song           2025-05-23  12855  		verbose(env, "unexpected __bpf_trap() due to uninitialized variable?\n");
f95695f2c46592 Yonghong Song           2025-05-23  12856  		return -EFAULT;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12857  	}
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12858  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12859  	if (is_kfunc_destructive(&meta) && !capable(CAP_SYS_BOOT)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12860  		verbose(env, "destructive kfunc calls require CAP_SYS_BOOT capability\n");
4dd48c6f1f8329 Artem Savkov            2022-08-10  12861  		return -EACCES;
4dd48c6f1f8329 Artem Savkov            2022-08-10  12862  	}
4dd48c6f1f8329 Artem Savkov            2022-08-10  12863  
f8a8faceab9953 Alexei Starovoitov      2026-04-12  12864  	sleepable = bpf_is_kfunc_sleepable(&meta);
dfe6625df48ec5 Benjamin Tissoires      2024-02-21  12865  	if (sleepable && !in_sleepable(env)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12866  		verbose(env, "program must be sleepable to call sleepable kfunc %s\n", func_name);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12867  		return -EACCES;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12868  	}
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  12869  
f233d485591854 Kumar Kartikeya Dwivedi 2025-10-07  12870  	/* Track non-sleepable context for kfuncs, same as for helpers. */
f233d485591854 Kumar Kartikeya Dwivedi 2025-10-07  12871  	if (!in_sleepable_context(env))
f233d485591854 Kumar Kartikeya Dwivedi 2025-10-07  12872  		insn_aux->non_sleepable = true;
f233d485591854 Kumar Kartikeya Dwivedi 2025-10-07  12873  
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12874  	/* Check the arguments */
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12875  	err = check_kfunc_args(env, &meta, insn_idx);
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12876  	if (err < 0)
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12877  		return err;
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12878  
d457072576a6a6 Ihor Solodrai           2026-03-27  12879  	if (is_bpf_rbtree_add_kfunc(meta.func_id)) {
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12880  		err = push_callback_call(env, insn, insn_idx, meta.subprogno,
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12881  					 set_rbtree_add_callback_state);
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12882  		if (err) {
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12883  			verbose(env, "kfunc %s#%d failed callback verification\n",
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12884  				func_name, meta.func_id);
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12885  			return err;
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12886  		}
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12887  	}
ab5cfac139ab85 Eduard Zingerman        2023-11-21  12888  
5c919acef85147 Jiri Olsa               2024-04-30  12889  	if (meta.func_id == special_kfunc_list[KF_bpf_session_cookie]) {
5c919acef85147 Jiri Olsa               2024-04-30  12890  		meta.r0_size = sizeof(u64);
5c919acef85147 Jiri Olsa               2024-04-30  12891  		meta.r0_rdonly = false;
5c919acef85147 Jiri Olsa               2024-04-30  12892  	}
5c919acef85147 Jiri Olsa               2024-04-30  12893  
b97931a25a4bc7 Ihor Solodrai           2026-01-20  12894  	if (is_bpf_wq_set_callback_kfunc(meta.func_id)) {
81f1d7a583fa1f Benjamin Tissoires      2024-04-20  12895  		err = push_callback_call(env, insn, insn_idx, meta.subprogno,
81f1d7a583fa1f Benjamin Tissoires      2024-04-20  12896  					 set_timer_callback_state);
81f1d7a583fa1f Benjamin Tissoires      2024-04-20  12897  		if (err) {
81f1d7a583fa1f Benjamin Tissoires      2024-04-20  12898  			verbose(env, "kfunc %s#%d failed callback verification\n",
81f1d7a583fa1f Benjamin Tissoires      2024-04-20  12899  				func_name, meta.func_id);
81f1d7a583fa1f Benjamin Tissoires      2024-04-20  12900  			return err;
81f1d7a583fa1f Benjamin Tissoires      2024-04-20  12901  		}
81f1d7a583fa1f Benjamin Tissoires      2024-04-20  12902  	}
81f1d7a583fa1f Benjamin Tissoires      2024-04-20  12903  
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12904  	if (is_task_work_add_kfunc(meta.func_id)) {
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12905  		err = push_callback_call(env, insn, insn_idx, meta.subprogno,
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12906  					 set_task_work_schedule_callback_state);
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12907  		if (err) {
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12908  			verbose(env, "kfunc %s#%d failed callback verification\n",
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12909  				func_name, meta.func_id);
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12910  			return err;
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12911  		}
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12912  	}
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12913  
9bb00b2895cbfe Yonghong Song           2022-11-23  12914  	rcu_lock = is_kfunc_bpf_rcu_read_lock(&meta);
9bb00b2895cbfe Yonghong Song           2022-11-23  12915  	rcu_unlock = is_kfunc_bpf_rcu_read_unlock(&meta);
9bb00b2895cbfe Yonghong Song           2022-11-23  12916  
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12917  	preempt_disable = is_kfunc_bpf_preempt_disable(&meta);
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12918  	preempt_enable = is_kfunc_bpf_preempt_enable(&meta);
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12919  
4167096cb96432 Puranjay Mohan          2025-11-17  12920  	if (rcu_lock) {
4167096cb96432 Puranjay Mohan          2025-11-17  12921  		env->cur_state->active_rcu_locks++;
4167096cb96432 Puranjay Mohan          2025-11-17  12922  	} else if (rcu_unlock) {
308c7a0ae8859b Amery Hung              2026-05-28  12923  		struct bpf_stack_state *stack;
9bb00b2895cbfe Yonghong Song           2022-11-23  12924  		struct bpf_func_state *state;
9bb00b2895cbfe Yonghong Song           2022-11-23  12925  		struct bpf_reg_state *reg;
dfab99df147b0d Chuyi Zhou              2023-10-18  12926  		u32 clear_mask = (1 << STACK_SPILL) | (1 << STACK_ITER);
9bb00b2895cbfe Yonghong Song           2022-11-23  12927  
4167096cb96432 Puranjay Mohan          2025-11-17  12928  		if (env->cur_state->active_rcu_locks == 0) {
4167096cb96432 Puranjay Mohan          2025-11-17  12929  			verbose(env, "unmatched rcu read unlock (kernel function %s)\n", func_name);
9bb00b2895cbfe Yonghong Song           2022-11-23  12930  			return -EINVAL;
4167096cb96432 Puranjay Mohan          2025-11-17  12931  		}
4167096cb96432 Puranjay Mohan          2025-11-17  12932  		if (--env->cur_state->active_rcu_locks == 0) {
308c7a0ae8859b Amery Hung              2026-05-28  12933  			bpf_for_each_reg_in_vstate_mask(env->cur_state, state, reg, stack, clear_mask, ({
9bb00b2895cbfe Yonghong Song           2022-11-23  12934  				if (reg->type & MEM_RCU) {
fca1aa75518c03 Yonghong Song           2022-12-03  12935  					reg->type &= ~(MEM_RCU | PTR_MAYBE_NULL);
9bb00b2895cbfe Yonghong Song           2022-11-23  12936  					reg->type |= PTR_UNTRUSTED;
9bb00b2895cbfe Yonghong Song           2022-11-23  12937  				}
9bb00b2895cbfe Yonghong Song           2022-11-23  12938  			}));
4167096cb96432 Puranjay Mohan          2025-11-17  12939  		}
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12940  	} else if (preempt_disable) {
1995edc5f9089e Kumar Kartikeya Dwivedi 2024-12-03  12941  		env->cur_state->active_preempt_locks++;
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12942  	} else if (preempt_enable) {
cd9840c413e328 Puranjay Mohan          2026-03-18  12943  		if (env->cur_state->active_preempt_locks == 0) {
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12944  			verbose(env, "unmatched attempt to enable preemption (kernel function %s)\n", func_name);
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12945  			return -EINVAL;
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12946  		}
cd9840c413e328 Puranjay Mohan          2026-03-18  12947  		env->cur_state->active_preempt_locks--;
cd9840c413e328 Puranjay Mohan          2026-03-18  12948  	}
fc7566ad0a826c Kumar Kartikeya Dwivedi 2024-04-24  12949  
cd9840c413e328 Puranjay Mohan          2026-03-18  12950  	if (sleepable && !in_sleepable_context(env)) {
cd9840c413e328 Puranjay Mohan          2026-03-18  12951  		verbose(env, "kernel func %s is sleepable within %s\n",
cd9840c413e328 Puranjay Mohan          2026-03-18  12952  			func_name, non_sleepable_context_description(env));
cd9840c413e328 Puranjay Mohan          2026-03-18  12953  		return -EACCES;
cd9840c413e328 Puranjay Mohan          2026-03-18  12954  	}
cd9840c413e328 Puranjay Mohan          2026-03-18  12955  
cd9840c413e328 Puranjay Mohan          2026-03-18  12956  	if (in_rbtree_lock_required_cb(env) && (rcu_lock || rcu_unlock)) {
cd9840c413e328 Puranjay Mohan          2026-03-18  12957  		verbose(env, "Calling bpf_rcu_read_{lock,unlock} in unnecessary rbtree callback\n");
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12958  		return -EACCES;
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12959  	}
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12960  
1512231b6cc860 Kumar Kartikeya Dwivedi 2025-09-17  12961  	if (is_kfunc_rcu_protected(&meta) && !in_rcu_cs(env)) {
1512231b6cc860 Kumar Kartikeya Dwivedi 2025-09-17  12962  		verbose(env, "kernel func %s requires RCU critical section protection\n", func_name);
1512231b6cc860 Kumar Kartikeya Dwivedi 2025-09-17  12963  		return -EACCES;
1512231b6cc860 Kumar Kartikeya Dwivedi 2025-09-17  12964  	}
1512231b6cc860 Kumar Kartikeya Dwivedi 2025-09-17  12965  
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  12966  	/* In case of release function, we get register number of refcounted
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12967  	 * PTR_TO_BTF_ID in bpf_kfunc_arg_meta, do the release now.
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  12968  	 */
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12969  	if (meta.release_regno) {
8d8771dc03e483 Mykyta Yatsenko         2025-10-26  12970  		struct bpf_reg_state *reg = &regs[meta.release_regno];
8d8771dc03e483 Mykyta Yatsenko         2025-10-26  12971  
308c7a0ae8859b Amery Hung              2026-05-28  12972  		if (meta.dynptr.id) {
8d8771dc03e483 Mykyta Yatsenko         2025-10-26  12973  			err = unmark_stack_slots_dynptr(env, reg);
8d8771dc03e483 Mykyta Yatsenko         2025-10-26  12974  		} else {
308c7a0ae8859b Amery Hung              2026-05-28  12975  			err = release_reference(env, reg->id);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  12976  		}
8d8771dc03e483 Mykyta Yatsenko         2025-10-26  12977  		if (err)
8d8771dc03e483 Mykyta Yatsenko         2025-10-26  12978  			return err;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  12979  	}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  12980  
d457072576a6a6 Ihor Solodrai           2026-03-27  12981  	if (is_bpf_list_push_kfunc(meta.func_id) || is_bpf_rbtree_add_kfunc(meta.func_id)) {
308c7a0ae8859b Amery Hung              2026-05-28  12982  		id = regs[BPF_REG_2].id;
022ac075088366 Eduard Zingerman        2026-02-12  12983  		insn_aux->insert_off = regs[BPF_REG_2].var_off.value;
2140a6e3422de2 Dave Marchevsky         2023-06-01  12984  		insn_aux->kptr_struct_meta = btf_find_struct_meta(meta.arg_btf, meta.arg_btf_id);
308c7a0ae8859b Amery Hung              2026-05-28  12985  		ref_convert_owning_non_owning(env, id);
6a3cd3318ff656 Dave Marchevsky         2023-02-12  12986  	}
6a3cd3318ff656 Dave Marchevsky         2023-02-12  12987  
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  12988  	if (meta.func_id == special_kfunc_list[KF_bpf_throw]) {
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  12989  		if (!bpf_jit_supports_exceptions()) {
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  12990  			verbose(env, "JIT does not support calling kfunc %s#%d\n",
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  12991  				func_name, meta.func_id);
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  12992  			return -ENOTSUPP;
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  12993  		}
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  12994  		env->seen_exception = true;
a923819fb2c5be Kumar Kartikeya Dwivedi 2023-09-13  12995  
a923819fb2c5be Kumar Kartikeya Dwivedi 2023-09-13  12996  		/* In the case of the default callback, the cookie value passed
a923819fb2c5be Kumar Kartikeya Dwivedi 2023-09-13  12997  		 * to bpf_throw becomes the return value of the program.
a923819fb2c5be Kumar Kartikeya Dwivedi 2023-09-13  12998  		 */
a923819fb2c5be Kumar Kartikeya Dwivedi 2023-09-13  12999  		if (!env->exception_callback_subprog) {
5fad52bee30414 Andrii Nakryiko         2023-12-02  13000  			err = check_return_code(env, BPF_REG_1, "R1");
a923819fb2c5be Kumar Kartikeya Dwivedi 2023-09-13  13001  			if (err < 0)
a923819fb2c5be Kumar Kartikeya Dwivedi 2023-09-13  13002  				return err;
a923819fb2c5be Kumar Kartikeya Dwivedi 2023-09-13  13003  		}
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  13004  	}
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  13005  
64e1360524b9ef Ihor Solodrai           2026-01-20  13006  	for (i = 0; i < CALLER_SAVED_REGS; i++) {
64e1360524b9ef Ihor Solodrai           2026-01-20  13007  		u32 regno = caller_saved[i];
64e1360524b9ef Ihor Solodrai           2026-01-20  13008  
c82834a5a11f74 Alexei Starovoitov      2026-04-12  13009  		bpf_mark_reg_not_init(env, &regs[regno]);
64e1360524b9ef Ihor Solodrai           2026-01-20  13010  		regs[regno].subreg_def = DEF_NOT_SUBREG;
64e1360524b9ef Ihor Solodrai           2026-01-20  13011  	}
0f6bd5e7a804af Yonghong Song           2026-05-12  13012  	invalidate_outgoing_stack_args(env, cur_func(env));
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13013  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13014  	/* Check return type */
07236eab7a3139 Andrii Nakryiko         2023-03-08  13015  	t = btf_type_skip_modifiers(desc_btf, meta.func_proto->type, NULL);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13016  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13017  	if (is_kfunc_acquire(&meta) && !btf_type_is_struct_ptr(meta.btf, t)) {
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  13018  		if (meta.btf != btf_vmlinux ||
d457072576a6a6 Ihor Solodrai           2026-03-27  13019  		    (!is_bpf_obj_new_kfunc(meta.func_id) &&
d457072576a6a6 Ihor Solodrai           2026-03-27  13020  		     !is_bpf_percpu_obj_new_kfunc(meta.func_id) &&
d457072576a6a6 Ihor Solodrai           2026-03-27  13021  		     !is_bpf_refcount_acquire_kfunc(meta.func_id))) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13022  			verbose(env, "acquire kernel function does not return PTR_TO_BTF_ID\n");
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13023  			return -EINVAL;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13024  		}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  13025  	}
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13026  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13027  	if (btf_type_is_scalar(t)) {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13028  		mark_reg_unknown(env, regs, BPF_REG_0);
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13029  		if (meta.btf == btf_vmlinux && (meta.func_id == special_kfunc_list[KF_bpf_res_spin_lock] ||
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13030  		    meta.func_id == special_kfunc_list[KF_bpf_res_spin_lock_irqsave]))
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13031  			__mark_reg_const_zero(env, &regs[BPF_REG_0]);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13032  		mark_btf_func_reg_size(env, BPF_REG_0, t->size);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13033  	} else if (btf_type_is_ptr(t)) {
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  13034  		ptr_type = btf_type_skip_modifiers(desc_btf, t->type, &ptr_type_id);
d848bba6803484 Yonghong Song           2025-05-23  13035  		err = check_special_kfunc(env, &meta, regs, insn_aux, ptr_type, desc_btf);
d848bba6803484 Yonghong Song           2025-05-23  13036  		if (err) {
d848bba6803484 Yonghong Song           2025-05-23  13037  			if (err < 0)
c39aa3b289e9c1 Yonghong Song           2023-12-21  13038  				return err;
88d1d4a7eebea2 Alexei Starovoitov      2024-03-06  13039  		} else if (btf_type_is_void(ptr_type)) {
88d1d4a7eebea2 Alexei Starovoitov      2024-03-06  13040  			/* kfunc returning 'void *' is equivalent to returning scalar */
88d1d4a7eebea2 Alexei Starovoitov      2024-03-06  13041  			mark_reg_unknown(env, regs, BPF_REG_0);
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  13042  		} else if (!__btf_type_is_struct(ptr_type)) {
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  13043  			if (!meta.r0_size) {
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  13044  				__u32 sz;
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  13045  
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  13046  				if (!IS_ERR(btf_resolve_size(desc_btf, ptr_type, &sz))) {
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  13047  					meta.r0_size = sz;
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  13048  					meta.r0_rdonly = true;
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  13049  				}
f4b4eee6169bb3 Andrii Nakryiko         2023-03-02  13050  			}
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13051  			if (!meta.r0_size) {
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  13052  				ptr_type_name = btf_name_by_offset(desc_btf,
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13053  								   ptr_type->name_off);
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13054  				verbose(env,
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13055  					"kernel function %s returns pointer type %s %s is not supported\n",
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13056  					func_name,
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13057  					btf_type_str(ptr_type),
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13058  					ptr_type_name);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13059  				return -EINVAL;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13060  			}
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13061  
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13062  			mark_reg_known_zero(env, regs, BPF_REG_0);
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13063  			regs[BPF_REG_0].type = PTR_TO_MEM;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13064  			regs[BPF_REG_0].mem_size = meta.r0_size;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13065  
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13066  			if (meta.r0_rdonly)
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13067  				regs[BPF_REG_0].type |= MEM_RDONLY;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13068  
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13069  			/* Ensures we don't access the memory after a release_reference() */
308c7a0ae8859b Amery Hung              2026-05-28  13070  			if (meta.id)
308c7a0ae8859b Amery Hung              2026-05-28  13071  				regs[BPF_REG_0].parent_id = meta.id;
1512231b6cc860 Kumar Kartikeya Dwivedi 2025-09-17  13072  
1512231b6cc860 Kumar Kartikeya Dwivedi 2025-09-17  13073  			if (is_kfunc_rcu_protected(&meta))
1512231b6cc860 Kumar Kartikeya Dwivedi 2025-09-17  13074  				regs[BPF_REG_0].type |= MEM_RCU;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13075  		} else {
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13076  			enum bpf_reg_type type = PTR_TO_BTF_ID;
4cc8c50c9abcb2 Juntong Deng            2024-08-29  13077  
a992d7a3979120 Namhyung Kim            2024-10-10  13078  			if (meta.func_id == special_kfunc_list[KF_bpf_get_kmem_cache])
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13079  				type |= PTR_UNTRUSTED;
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13080  			else if (is_kfunc_rcu_protected(&meta) ||
f8a8faceab9953 Alexei Starovoitov      2026-04-12  13081  				 (bpf_is_iter_next_kfunc(&meta) &&
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13082  				  (get_iter_from_state(env->cur_state, &meta)
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13083  					   ->type & MEM_RCU))) {
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13084  				/*
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13085  				 * If the iterator's constructor (the _new
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13086  				 * function e.g., bpf_iter_task_new) has been
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13087  				 * annotated with BPF kfunc flag
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13088  				 * KF_RCU_PROTECTED and was called within a RCU
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13089  				 * read-side critical section, also propagate
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13090  				 * the MEM_RCU flag to the pointer returned from
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13091  				 * the iterator's next function (e.g.,
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13092  				 * bpf_iter_task_next).
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13093  				 */
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13094  				type |= MEM_RCU;
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13095  			} else {
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13096  				/*
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13097  				 * Any PTR_TO_BTF_ID that is returned from a BPF
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13098  				 * kfunc should by default be treated as
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13099  				 * implicitly trusted.
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13100  				 */
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13101  				type |= PTR_TRUSTED;
4cc8c50c9abcb2 Juntong Deng            2024-08-29  13102  			}
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13103  
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13104  			mark_reg_known_zero(env, regs, BPF_REG_0);
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13105  			regs[BPF_REG_0].btf = desc_btf;
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13106  			regs[BPF_REG_0].type = type;
f8ade2342e22e7 Matt Bobrowski          2026-01-13  13107  			regs[BPF_REG_0].btf_id = ptr_type_id;
eb1f7f71c126c8 Benjamin Tissoires      2022-09-06  13108  		}
958cf2e273f092 Kumar Kartikeya Dwivedi 2022-11-18  13109  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13110  		if (is_kfunc_ret_null(&meta)) {
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13111  			regs[BPF_REG_0].type |= PTR_MAYBE_NULL;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13112  			/* For mark_ptr_or_null_reg, see 93c230e3f5bd6 */
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13113  			regs[BPF_REG_0].id = ++env->id_gen;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13114  		}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13115  		mark_btf_func_reg_size(env, BPF_REG_0, sizeof(void *));
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13116  		if (is_kfunc_acquire(&meta)) {
308c7a0ae8859b Amery Hung              2026-05-28  13117  			id = acquire_reference(env, insn_idx, 0);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14 @13118  			if (id < 0)
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13119  				return id;
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13120  			regs[BPF_REG_0].id = id;
fb5b480205bad3 Martin KaFai Lau        2025-05-05  13121  		} else if (is_rbtree_node_type(ptr_type) || is_list_node_type(ptr_type)) {
a40d3632436b16 Dave Marchevsky         2023-02-13  13122  			ref_set_non_owning(env, &regs[BPF_REG_0]);
5c073f26f9dc78 Kumar Kartikeya Dwivedi 2022-01-14  13123  		}
a40d3632436b16 Dave Marchevsky         2023-02-13  13124  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13125  		if (reg_may_point_to_spin_lock(&regs[BPF_REG_0]) && !regs[BPF_REG_0].id)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13126  			regs[BPF_REG_0].id = ++env->id_gen;
f6a6a5a976288e Dave Marchevsky         2023-04-03  13127  	} else if (btf_type_is_void(t)) {
d848bba6803484 Yonghong Song           2025-05-23  13128  		if (meta.btf == btf_vmlinux) {
d457072576a6a6 Ihor Solodrai           2026-03-27  13129  			if (is_bpf_obj_drop_kfunc(meta.func_id) ||
d457072576a6a6 Ihor Solodrai           2026-03-27  13130  			    is_bpf_percpu_obj_drop_kfunc(meta.func_id)) {
f6a6a5a976288e Dave Marchevsky         2023-04-03  13131  				insn_aux->kptr_struct_meta =
4d585f48ee6b38 Dave Marchevsky         2023-05-10  13132  					btf_find_struct_meta(meta.arg_btf,
4d585f48ee6b38 Dave Marchevsky         2023-05-10  13133  							     meta.arg_btf_id);
f6a6a5a976288e Dave Marchevsky         2023-04-03  13134  			}
f6a6a5a976288e Dave Marchevsky         2023-04-03  13135  		}
f6a6a5a976288e Dave Marchevsky         2023-04-03  13136  	}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13137  
f8a8faceab9953 Alexei Starovoitov      2026-04-12  13138  	if (bpf_is_kfunc_pkt_changing(&meta))
0e7a733ab3d7be Amery Hung              2025-09-22  13139  		clear_all_pkt_pointers(env);
0e7a733ab3d7be Amery Hung              2025-09-22  13140  
07236eab7a3139 Andrii Nakryiko         2023-03-08  13141  	nargs = btf_type_vlen(meta.func_proto);
e0b7b91c72db6d Yonghong Song           2026-05-12  13142  	if (nargs > MAX_BPF_FUNC_REG_ARGS) {
e0b7b91c72db6d Yonghong Song           2026-05-12  13143  		struct bpf_func_state *caller = cur_func(env);
e0b7b91c72db6d Yonghong Song           2026-05-12  13144  		struct bpf_subprog_info *caller_info = &env->subprog_info[caller->subprogno];
e0b7b91c72db6d Yonghong Song           2026-05-12  13145  		u16 out_stack_arg_cnt = nargs - MAX_BPF_FUNC_REG_ARGS;
e0b7b91c72db6d Yonghong Song           2026-05-12  13146  		u16 stack_arg_cnt = bpf_in_stack_arg_cnt(caller_info) + out_stack_arg_cnt;
e0b7b91c72db6d Yonghong Song           2026-05-12  13147  
e0b7b91c72db6d Yonghong Song           2026-05-12  13148  		if (stack_arg_cnt > caller_info->stack_arg_cnt)
e0b7b91c72db6d Yonghong Song           2026-05-12  13149  			caller_info->stack_arg_cnt = stack_arg_cnt;
e0b7b91c72db6d Yonghong Song           2026-05-12  13150  	}
e0b7b91c72db6d Yonghong Song           2026-05-12  13151  
07236eab7a3139 Andrii Nakryiko         2023-03-08  13152  	args = (const struct btf_param *)(meta.func_proto + 1);
e0b7b91c72db6d Yonghong Song           2026-05-12  13153  	for (i = 0; i < min_t(int, nargs, MAX_BPF_FUNC_REG_ARGS); i++) {
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13154  		u32 regno = i + 1;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13155  
2357672c54c3f7 Kumar Kartikeya Dwivedi 2021-10-02  13156  		t = btf_type_skip_modifiers(desc_btf, args[i].type, NULL);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13157  		if (btf_type_is_ptr(t))
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13158  			mark_btf_func_reg_size(env, regno, sizeof(void *));
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13159  		else
70b5f3f7822a87 Kexin Sun               2026-03-21  13160  			/* scalar. ensured by check_kfunc_args() */
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13161  			mark_btf_func_reg_size(env, regno, t->size);
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13162  	}
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13163  
f8a8faceab9953 Alexei Starovoitov      2026-04-12  13164  	if (bpf_is_iter_next_kfunc(&meta)) {
06accc8779c1d5 Andrii Nakryiko         2023-03-08  13165  		err = process_iter_next_call(env, insn_idx, &meta);
06accc8779c1d5 Andrii Nakryiko         2023-03-08  13166  		if (err)
06accc8779c1d5 Andrii Nakryiko         2023-03-08  13167  			return err;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  13168  	}
06accc8779c1d5 Andrii Nakryiko         2023-03-08  13169  
eeee4239dbb155 Menglong Dong           2026-01-24  13170  	if (meta.func_id == special_kfunc_list[KF_bpf_session_cookie])
eeee4239dbb155 Menglong Dong           2026-01-24  13171  		env->prog->call_session_cookie = true;
eeee4239dbb155 Menglong Dong           2026-01-24  13172  
3d562d35a044ae Kumar Kartikeya Dwivedi 2026-05-17  13173  	if (bpf_is_throw_kfunc(insn))
2ec74a053611ed Alexei Starovoitov      2026-04-11  13174  		return process_bpf_exit_full(env, NULL, true);
2ec74a053611ed Alexei Starovoitov      2026-04-11  13175  
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13176  	return 0;
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13177  }
e6ac2450d6dee3 Martin KaFai Lau        2021-03-24  13178  

:::::: The code at line 13118 was first introduced by commit
:::::: 5c073f26f9dc78a6c8194b23eac7537c9692c7d7 bpf: Add reference tracking support to kfunc

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
