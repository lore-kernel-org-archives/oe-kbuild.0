Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679886;
	b=jDquBucHKqkSPqJwQPJisZt2KvvmNGwYfQ3kmmG/JAIhrulTz1sKtgV0Sm2ac4TdMcuF
	 A1tjDm42wFP4PS7KDNDwc2+AKhyX31vK5xJwvasLz18EYYrf2Ol+WjMv5yfZQqSWoXyhs
	 aIU6VoX1aHGszJb6wBgywggfj22FxI39touxC3BX/7bbUhfjiIycUwIHLMKYChTN6L+eH
	 BBG+uYH02nNj5tbnqldTIfabjaEHGRRpzDn8L6pn3VLgUcBz/PbTL4E3zc2lV/XE2FFFI
	 9Vo492kxVP00UhOUO23Towq/5YfpT7Kl5GFLpiRTlqNQ7NqIa0KFDeiZJXngfzCpFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679886;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rnIRN9C6kWS5sjd6V2Wa2Q0XZs2TQWEAmgDyxAH5OUk=;
	b=NE3eBpvdxxydKeXKlXDq0fs77MaXkbZnouz7rb9iOCy2clCCxlwHw/rlY0YnmYp7pasG
	 QJ9LdiY3Gzes3dat5okHputCrU2lk5mJ1kMdxCJJkNrO4XNjtbsu+YkCwjR7mSOsho6Rx
	 poqyyykU+2n9RPpLlcCemj++ADDbhcQSU+w/WLlB21UY5KuSILJBPhGXz51nADdiqq/48
	 tgGNLNrs94zqSIY7LfL39WQG591TqBaMgz6tMNEyoIKan8LT2bV4MRr2gp2vIeH8G4hXI
	 eym3w/DeIvGBolfTH0gxzPtUdkYLXeLiwM4cXKxFr25ZWuAh3f85wuq8n2jgNkCXDFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dIJ01nv3;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5551606A681
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 07:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5551606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dIJ01nv3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795679886; x=1827215886;
  h=date:from:to:cc:subject:message-id;
  bh=uDtIQF5+NupN9gM9IkU1TQPeFxWm425ZVKuydXLP1Eo=;
  b=dIJ01nv3AljmdHB1d7cyD3yiSznZYxzc/gmIMIpytuT1tDAp7N6VFKpE
   d/hZZx3ppr9QKo2b+jHMfiziRQ403FidvvgHwDLyff89JOjBDl3w83IH1
   CEB43oXuXEBmOmknSh4x3X/y6uhdiGo0L5Kjkv95Yh/K70wC1aZZDpiwu
   NtKudaNBS+4/TLw/a9vpjIrPah1ceUQkPjMS1tdx2UfAWWN9KJEImZDeE
   8fTJYD6bf0AHM8JUHP0TDmVn8OoNTBcOQx+U8SLzSEYp7X2gCZq5S/WLh
   s3XwbhuKCQOa4N0/qD0qbaAaHPrS4DCpHynkrK8OZ7q05Uhiacz+50O7y
   Q==;
X-CSE-ConnectionGUID: fgrwhoqxSkWfVOQiP/nhqA==
X-CSE-MsgGUID: OLwIz9mpTdOE4vs+KJCf6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4424322"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4424322"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 23:58:05 -0800
X-CSE-ConnectionGUID: hZ9YCq1oSViLSw5OaRY/8A==
X-CSE-MsgGUID: sjtMgFshT9yDW6w6K4Fkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12006950"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2026 23:58:03 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWUMj-000000000HD-2Afc;
	Thu, 26 Nov 2026 07:58:01 +0000
Date: Thu, 26 Nov 2026 08:57:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/fixups.c:1021:44: sparse: sparse: cast truncates
 bits from constant value (ffffc00000000000 becomes 0)
Message-ID: <20261126085327.Ltoi80Qt-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>

Hi Alexei,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   25faec9ce61c01fb45abf812a222c5b43c3cd5c5
commit: 449f08fa59dda5da40317b6976604b877c4ecd63 bpf: Move fixup/post-processing logic from verifier.c into fixups.c
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r2308-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126085327.Ltoi80Qt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.4.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126085327.Ltoi80Qt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 449f08fa59dd ("bpf: Move fixup/post-processing logic from verifier.c into fixups.c")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126085327.Ltoi80Qt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/fixups.c:2202:38: sparse: sparse: subtraction of functions? Share your drugs
>> kernel/bpf/fixups.c:1021:44: sparse: sparse: cast truncates bits from constant value (ffffc00000000000 becomes 0)

vim +1021 kernel/bpf/fixups.c

449f08fa59dda5 Alexei Starovoitov 2026-04-12   975  
449f08fa59dda5 Alexei Starovoitov 2026-04-12   976  int bpf_jit_subprogs(struct bpf_verifier_env *env)
449f08fa59dda5 Alexei Starovoitov 2026-04-12   977  {
449f08fa59dda5 Alexei Starovoitov 2026-04-12   978  	struct bpf_prog *prog = env->prog, **func, *tmp;
449f08fa59dda5 Alexei Starovoitov 2026-04-12   979  	int i, j, subprog_start, subprog_end = 0, len, subprog;
449f08fa59dda5 Alexei Starovoitov 2026-04-12   980  	struct bpf_map *map_ptr;
449f08fa59dda5 Alexei Starovoitov 2026-04-12   981  	struct bpf_insn *insn;
449f08fa59dda5 Alexei Starovoitov 2026-04-12   982  	void *old_bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12   983  	int err, num_exentries;
449f08fa59dda5 Alexei Starovoitov 2026-04-12   984  	int old_len, subprog_start_adjustment = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12   985  
449f08fa59dda5 Alexei Starovoitov 2026-04-12   986  	if (env->subprog_cnt <= 1)
449f08fa59dda5 Alexei Starovoitov 2026-04-12   987  		return 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12   988  
449f08fa59dda5 Alexei Starovoitov 2026-04-12   989  	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12   990  		if (!bpf_pseudo_func(insn) && !bpf_pseudo_call(insn))
449f08fa59dda5 Alexei Starovoitov 2026-04-12   991  			continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12   992  
449f08fa59dda5 Alexei Starovoitov 2026-04-12   993  		/* Upon error here we cannot fall back to interpreter but
449f08fa59dda5 Alexei Starovoitov 2026-04-12   994  		 * need a hard reject of the program. Thus -EFAULT is
449f08fa59dda5 Alexei Starovoitov 2026-04-12   995  		 * propagated in any case.
449f08fa59dda5 Alexei Starovoitov 2026-04-12   996  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12   997  		subprog = bpf_find_subprog(env, i + insn->imm + 1);
449f08fa59dda5 Alexei Starovoitov 2026-04-12   998  		if (verifier_bug_if(subprog < 0, env, "No program to jit at insn %d",
449f08fa59dda5 Alexei Starovoitov 2026-04-12   999  				    i + insn->imm + 1))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1000  			return -EFAULT;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1001  		/* temporarily remember subprog id inside insn instead of
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1002  		 * aux_data, since next loop will split up all insns into funcs
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1003  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1004  		insn->off = subprog;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1005  		/* remember original imm in case JIT fails and fallback
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1006  		 * to interpreter will be needed
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1007  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1008  		env->insn_aux_data[i].call_imm = insn->imm;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1009  		/* point imm to __bpf_call_base+1 from JITs point of view */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1010  		insn->imm = 1;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1011  		if (bpf_pseudo_func(insn)) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1012  #if defined(MODULES_VADDR)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1013  			u64 addr = MODULES_VADDR;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1014  #else
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1015  			u64 addr = VMALLOC_START;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1016  #endif
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1017  			/* jit (e.g. x86_64) may emit fewer instructions
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1018  			 * if it learns a u32 imm is the same as a u64 imm.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1019  			 * Set close enough to possible prog address.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1020  			 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12 @1021  			insn[0].imm = (u32)addr;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1022  			insn[1].imm = addr >> 32;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1023  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1024  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1025  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1026  	err = bpf_prog_alloc_jited_linfo(prog);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1027  	if (err)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1028  		goto out_undo_insn;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1029  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1030  	err = -ENOMEM;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1031  	func = kzalloc_objs(prog, env->subprog_cnt);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1032  	if (!func)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1033  		goto out_undo_insn;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1034  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1035  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1036  		subprog_start = subprog_end;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1037  		subprog_end = env->subprog_info[i + 1].start;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1038  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1039  		len = subprog_end - subprog_start;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1040  		/* bpf_prog_run() doesn't call subprogs directly,
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1041  		 * hence main prog stats include the runtime of subprogs.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1042  		 * subprogs don't have IDs and not reachable via prog_get_next_id
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1043  		 * func[i]->stats will never be accessed and stays NULL
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1044  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1045  		func[i] = bpf_prog_alloc_no_stats(bpf_prog_size(len), GFP_USER);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1046  		if (!func[i])
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1047  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1048  		memcpy(func[i]->insnsi, &prog->insnsi[subprog_start],
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1049  		       len * sizeof(struct bpf_insn));
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1050  		func[i]->type = prog->type;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1051  		func[i]->len = len;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1052  		if (bpf_prog_calc_tag(func[i]))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1053  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1054  		func[i]->is_func = 1;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1055  		func[i]->sleepable = prog->sleepable;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1056  		func[i]->aux->func_idx = i;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1057  		/* Below members will be freed only at prog->aux */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1058  		func[i]->aux->btf = prog->aux->btf;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1059  		func[i]->aux->subprog_start = subprog_start + subprog_start_adjustment;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1060  		func[i]->aux->func_info = prog->aux->func_info;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1061  		func[i]->aux->func_info_cnt = prog->aux->func_info_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1062  		func[i]->aux->poke_tab = prog->aux->poke_tab;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1063  		func[i]->aux->size_poke_tab = prog->aux->size_poke_tab;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1064  		func[i]->aux->main_prog_aux = prog->aux;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1065  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1066  		for (j = 0; j < prog->aux->size_poke_tab; j++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1067  			struct bpf_jit_poke_descriptor *poke;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1068  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1069  			poke = &prog->aux->poke_tab[j];
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1070  			if (poke->insn_idx < subprog_end &&
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1071  			    poke->insn_idx >= subprog_start)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1072  				poke->aux = func[i]->aux;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1073  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1074  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1075  		func[i]->aux->name[0] = 'F';
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1076  		func[i]->aux->stack_depth = env->subprog_info[i].stack_depth;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1077  		if (env->subprog_info[i].priv_stack_mode == PRIV_STACK_ADAPTIVE)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1078  			func[i]->aux->jits_use_priv_stack = true;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1079  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1080  		func[i]->jit_requested = 1;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1081  		func[i]->blinding_requested = prog->blinding_requested;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1082  		func[i]->aux->kfunc_tab = prog->aux->kfunc_tab;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1083  		func[i]->aux->kfunc_btf_tab = prog->aux->kfunc_btf_tab;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1084  		func[i]->aux->linfo = prog->aux->linfo;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1085  		func[i]->aux->nr_linfo = prog->aux->nr_linfo;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1086  		func[i]->aux->jited_linfo = prog->aux->jited_linfo;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1087  		func[i]->aux->linfo_idx = env->subprog_info[i].linfo_idx;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1088  		func[i]->aux->arena = prog->aux->arena;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1089  		func[i]->aux->used_maps = env->used_maps;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1090  		func[i]->aux->used_map_cnt = env->used_map_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1091  		num_exentries = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1092  		insn = func[i]->insnsi;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1093  		for (j = 0; j < func[i]->len; j++, insn++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1094  			if (BPF_CLASS(insn->code) == BPF_LDX &&
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1095  			    (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1096  			     BPF_MODE(insn->code) == BPF_PROBE_MEM32 ||
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1097  			     BPF_MODE(insn->code) == BPF_PROBE_MEM32SX ||
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1098  			     BPF_MODE(insn->code) == BPF_PROBE_MEMSX))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1099  				num_exentries++;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1100  			if ((BPF_CLASS(insn->code) == BPF_STX ||
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1101  			     BPF_CLASS(insn->code) == BPF_ST) &&
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1102  			     BPF_MODE(insn->code) == BPF_PROBE_MEM32)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1103  				num_exentries++;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1104  			if (BPF_CLASS(insn->code) == BPF_STX &&
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1105  			     BPF_MODE(insn->code) == BPF_PROBE_ATOMIC)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1106  				num_exentries++;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1107  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1108  		func[i]->aux->num_exentries = num_exentries;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1109  		func[i]->aux->tail_call_reachable = env->subprog_info[i].tail_call_reachable;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1110  		func[i]->aux->exception_cb = env->subprog_info[i].is_exception_cb;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1111  		func[i]->aux->changes_pkt_data = env->subprog_info[i].changes_pkt_data;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1112  		func[i]->aux->might_sleep = env->subprog_info[i].might_sleep;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1113  		if (!i)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1114  			func[i]->aux->exception_boundary = env->seen_exception;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1115  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1116  		/*
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1117  		 * To properly pass the absolute subprog start to jit
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1118  		 * all instruction adjustments should be accumulated
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1119  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1120  		old_len = func[i]->len;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1121  		func[i] = bpf_int_jit_compile(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1122  		subprog_start_adjustment += func[i]->len - old_len;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1123  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1124  		if (!func[i]->jited) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1125  			err = -ENOTSUPP;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1126  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1127  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1128  		cond_resched();
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1129  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1130  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1131  	/* at this point all bpf functions were successfully JITed
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1132  	 * now populate all bpf_calls with correct addresses and
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1133  	 * run last pass of JIT
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1134  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1135  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1136  		insn = func[i]->insnsi;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1137  		for (j = 0; j < func[i]->len; j++, insn++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1138  			if (bpf_pseudo_func(insn)) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1139  				subprog = insn->off;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1140  				insn[0].imm = (u32)(long)func[subprog]->bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1141  				insn[1].imm = ((u64)(long)func[subprog]->bpf_func) >> 32;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1142  				continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1143  			}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1144  			if (!bpf_pseudo_call(insn))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1145  				continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1146  			subprog = insn->off;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1147  			insn->imm = BPF_CALL_IMM(func[subprog]->bpf_func);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1148  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1149  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1150  		/* we use the aux data to keep a list of the start addresses
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1151  		 * of the JITed images for each function in the program
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1152  		 *
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1153  		 * for some architectures, such as powerpc64, the imm field
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1154  		 * might not be large enough to hold the offset of the start
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1155  		 * address of the callee's JITed image from __bpf_call_base
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1156  		 *
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1157  		 * in such cases, we can lookup the start address of a callee
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1158  		 * by using its subprog id, available from the off field of
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1159  		 * the call instruction, as an index for this list
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1160  		 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1161  		func[i]->aux->func = func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1162  		func[i]->aux->func_cnt = env->subprog_cnt - env->hidden_subprog_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1163  		func[i]->aux->real_func_cnt = env->subprog_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1164  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1165  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1166  		old_bpf_func = func[i]->bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1167  		tmp = bpf_int_jit_compile(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1168  		if (tmp != func[i] || func[i]->bpf_func != old_bpf_func) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1169  			verbose(env, "JIT doesn't support bpf-to-bpf calls\n");
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1170  			err = -ENOTSUPP;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1171  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1172  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1173  		cond_resched();
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1174  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1175  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1176  	/*
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1177  	 * Cleanup func[i]->aux fields which aren't required
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1178  	 * or can become invalid in future
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1179  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1180  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1181  		func[i]->aux->used_maps = NULL;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1182  		func[i]->aux->used_map_cnt = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1183  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1184  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1185  	/* finally lock prog and jit images for all functions and
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1186  	 * populate kallsysm. Begin at the first subprogram, since
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1187  	 * bpf_prog_load will add the kallsyms for the main program.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1188  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1189  	for (i = 1; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1190  		err = bpf_prog_lock_ro(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1191  		if (err)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1192  			goto out_free;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1193  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1194  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1195  	for (i = 1; i < env->subprog_cnt; i++)
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1196  		bpf_prog_kallsyms_add(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1197  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1198  	/* Last step: make now unused interpreter insns from main
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1199  	 * prog consistent for later dump requests, so they can
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1200  	 * later look the same as if they were interpreted only.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1201  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1202  	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1203  		if (bpf_pseudo_func(insn)) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1204  			insn[0].imm = env->insn_aux_data[i].call_imm;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1205  			insn[1].imm = insn->off;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1206  			insn->off = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1207  			continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1208  		}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1209  		if (!bpf_pseudo_call(insn))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1210  			continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1211  		insn->off = env->insn_aux_data[i].call_imm;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1212  		subprog = bpf_find_subprog(env, i + insn->off + 1);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1213  		insn->imm = subprog;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1214  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1215  
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1216  	prog->jited = 1;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1217  	prog->bpf_func = func[0]->bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1218  	prog->jited_len = func[0]->jited_len;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1219  	prog->aux->extable = func[0]->aux->extable;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1220  	prog->aux->num_exentries = func[0]->aux->num_exentries;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1221  	prog->aux->func = func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1222  	prog->aux->func_cnt = env->subprog_cnt - env->hidden_subprog_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1223  	prog->aux->real_func_cnt = env->subprog_cnt;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1224  	prog->aux->bpf_exception_cb = (void *)func[env->exception_callback_subprog]->bpf_func;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1225  	prog->aux->exception_boundary = func[0]->aux->exception_boundary;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1226  	bpf_prog_jit_attempt_done(prog);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1227  	return 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1228  out_free:
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1229  	/* We failed JIT'ing, so at this point we need to unregister poke
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1230  	 * descriptors from subprogs, so that kernel is not attempting to
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1231  	 * patch it anymore as we're freeing the subprog JIT memory.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1232  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1233  	for (i = 0; i < prog->aux->size_poke_tab; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1234  		map_ptr = prog->aux->poke_tab[i].tail_call.map;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1235  		map_ptr->ops->map_poke_untrack(map_ptr, prog->aux);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1236  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1237  	/* At this point we're guaranteed that poke descriptors are not
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1238  	 * live anymore. We can just unlink its descriptor table as it's
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1239  	 * released with the main prog.
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1240  	 */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1241  	for (i = 0; i < env->subprog_cnt; i++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1242  		if (!func[i])
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1243  			continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1244  		func[i]->aux->poke_tab = NULL;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1245  		bpf_jit_free(func[i]);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1246  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1247  	kfree(func);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1248  out_undo_insn:
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1249  	/* cleanup main prog to be interpreted */
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1250  	prog->jit_requested = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1251  	prog->blinding_requested = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1252  	for (i = 0, insn = prog->insnsi; i < prog->len; i++, insn++) {
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1253  		if (!bpf_pseudo_call(insn))
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1254  			continue;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1255  		insn->off = 0;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1256  		insn->imm = env->insn_aux_data[i].call_imm;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1257  	}
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1258  	bpf_prog_jit_attempt_done(prog);
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1259  	return err;
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1260  }
449f08fa59dda5 Alexei Starovoitov 2026-04-12  1261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
