Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795326368;
	b=2uZbfZfXyzsA3vqeJX4isETj6wT/9bUXRbG7KWWQ3whaZfqz7+OZAFox/yatq6cq4rQD
	 4VE45rnVLcYyoMOLtZcMtqAWBM1+WJLYCkqreR29RRYYSI5PwnfBFx7uXq6Cqkk3jW2lR
	 jYApEKglo3E3O6mzfip1HAFihOQLuB5GDlYwAoPu4tibvV5s2x/0BBRt0d+dAi2YHaAd4
	 MOv5WiNxjaR9KEOGc12hEM4rHr4GlofXvrlyWrT7R1+HMvbixI8UhC4K+i37Xcgh8AFTO
	 0UweHDjTrhhdojfNG9N4q89zrsjub+c5McljrZOO4fe5i8g820moiLHb1Eyi0d319LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795326368;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o7eSxCJDV/AqeO0t2FwC5u7OyFf795RPX5uH+uHDBbs=;
	b=rd84XLoKHasVtIxa47H2WaKtQklZ1XbUt+7fZEfXZrmN+a/wFJ5X+JOPyY+cnUjBIKkg
	 HRi/p1KnKdTK0MXCA6g8T+uZ4aAORGdWT/0HWMCxbzQhmAnUDOfojxOgEWsGufvuch1FK
	 aS3t3TxbsQ7ZS6MRL8ZFOdwjynfTj46BmFY6YMqBpVKbLsvuMllmH5mLYRM41gYIYM4X8
	 HzC0mgYBGau7sRKgJ56xQLUe7Sqi3QdCt9NC+MYuXTIGVda67x08lsYtc/PFYRFabXZ8H
	 KKA2rxm3j3ps0OA7d+i3rRxLpBy9umYCbDO/DgkOD9+2K5Pzn6jh3xQ+ptK3QcgFU/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOXkrnD0;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BCC606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 05:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26BCC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOXkrnD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795326368; x=1826862368;
  h=date:from:to:cc:subject:message-id;
  bh=MXWDLZtISy13QLJqWtHlkHodnQ9a6bOrg2MPqCW8YR0=;
  b=DOXkrnD05XVA/wShqFXSi+orOXyFhUGN88s63QtxM3OwMZ/97WkO3ZKv
   Woc7zBgvHzzC37ymgW+xZTHzV/WL/vAB2I+4cbIyuluUOdQcGmjIy3sPI
   UHJyewo+wPEPYjQzG4ktlvkKGxEqEXSb+awCmjZEjO7UoJoM8jHIHabT1
   NH5/ti4doh84GtY0D+1eOftM/2kR3j7Awe+xYvlY87CELASmbfElTQNAp
   ao93UXt4HJnbKrIw1NAV6bD0SO8ifkWvcp5OYUfScP5JnwXq5Mz340nWS
   yOot2L3ps1XSQaGToo0aAxeUSIn0wXrGrHyXen7uj8A1a29NZC/CRNC06
   w==;
X-CSE-ConnectionGUID: TH2kZU7IQXSxHwE4WasCpw==
X-CSE-MsgGUID: 8GGBYtZySiu4U5kwKkeAIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4071901"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4071901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 21:46:07 -0800
X-CSE-ConnectionGUID: S9RvUSq9ROuOwoMgEKnDfQ==
X-CSE-MsgGUID: VL4jKrbgRiynL5QE6zwLKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="10923529"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 21 Nov 2026 21:46:05 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV0Op-000000004VZ-1mMz;
	Sun, 22 Nov 2026 05:46:03 +0000
Date: Sun, 22 Nov 2026 06:45:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:cancellations-new 37/72] kernel/bpf/flow.c:1183
 flow_prune_or_join() warn: missing error code 'err'
Message-ID: <20261122064023.oRrKanAo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux cancellations-new
head:   f4608ac56932654a33b3aace6a52bff14bbbd237
commit: 9fd8f177e03075555aeafac32e223cb450a35353 [37/72] bpf: Remove the way out of a loop for may_goto that the verifier adds
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: m68k-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122064023.oRrKanAo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261122064023.oRrKanAo-lkp@intel.com/

smatch warnings:
kernel/bpf/flow.c:1183 flow_prune_or_join() warn: missing error code 'err'

vim +/err +1183 kernel/bpf/flow.c

b00adefb7a6570 Alexei Starovoitov 2026-11-20  1137  
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1138  /*
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1139   * All states arrive here. @s is
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1140   * - pruned, if a state subsumes it,
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1141   * - joined with a state, unless the join rule keeps them apart,
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1142   * - pending otherwise.
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1143   * @loop: @s came around it, or @enters its leftover.
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1144   */
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1145  static int flow_prune_or_join(struct bpf_verifier_env *env, struct flow_state *s,
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1146  			      struct bpf_loop *loop, bool enters)
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1147  {
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1148  	bool log = (env->log.level & BPF_LOG_LEVEL2) && s->kind == FLOW_AT, widen, subsumed;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1149  	int insn_idx = s->st.insn_idx, prev = s->prev_insn_idx, err = 0;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1150  	struct loop_stack_entry *e;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1151  	struct flow_state *t, *tn;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1152  	bool joined = false, widened = false;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1153  	struct bpf_loop *leftover_loop;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1154  
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1155  again:
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1156  	err = err ?: bpf_check_limits(env);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1157  	if (err)
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1158  		goto free;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1159  	/* the calls get no equations, see bpf_flow_return() */
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1160  	if (s->kind == FLOW_FUNC_EXIT)
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1161  		bpf_equations_free(&s->st.equations);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1162  
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1163  	flow_for_each_near(env, s, t, tn) {
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1164  		if (!flow_same_join_key(env, t, s))
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1165  			continue;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1166  		/* what the calls have can get into the function again */
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1167  		leftover_loop = s->kind == FLOW_FUNC_EXIT && t->pending && !t->returned ?
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1168  				NULL : loop;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1169  		e = leftover_loop ? flow_loop_entry(&s->st, leftover_loop) : NULL;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1170  		if (bpf_must_keep_apart(env, &t->st, &s->st,
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1171  					e && flow_same_entry(leftover_loop, t, s) ?
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1172  					BPF_JOIN_POINT_HEADER : BPF_JOIN_POINT, e))
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1173  			continue;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1174  		if (e && e->peeled)
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1175  			leftover_loop = NULL;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1176  		subsumed = bpf_state_subsumes(env, &t->st, &s->st);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1177  		if (!subsumed && t->st.speculative != s->st.speculative)
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1178  			continue;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1179  		if (subsumed) {
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1180  			if (env->log.level & BPF_LOG_LEVEL2)
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1181  				verbose(env, "from %d to %d: pruned\n", prev, insn_idx);
9fd8f177e03075 Alexei Starovoitov 2026-11-13  1182  			flow_check_trip_counts(env, t, s);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20 @1183  			goto free;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1184  		}
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1185  		/* what grows in a loop is widened, it is not replaced */
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1186  		if (!leftover_loop && bpf_state_subsumes(env, &s->st, &t->st)) {
9fd8f177e03075 Alexei Starovoitov 2026-11-13  1187  			flow_check_trip_counts(env, s, t);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1188  			/* it goes on with the leftover that @t started */
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1189  			if (s->kind == FLOW_LEFTOVER)
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1190  				bpf_top_loop(s->st.frame[s->st.curframe])->entry_id =
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1191  				bpf_top_loop(t->st.frame[t->st.curframe])->entry_id;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1192  			flow_free_state(env, t);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1193  			joined = true;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1194  			continue;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1195  		}
b00adefb7a6570 Alexei Starovoitov 2026-11-20  1196  		if (!leftover_loop && s->kind == FLOW_AT && flow_is_stale(t, s)) {
b00adefb7a6570 Alexei Starovoitov 2026-11-20  1197  			flow_free_state(env, t);
b00adefb7a6570 Alexei Starovoitov 2026-11-20  1198  			continue;
b00adefb7a6570 Alexei Starovoitov 2026-11-20  1199  		}
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1200  		joined = true;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1201  		widened = leftover_loop;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1202  		s->returned |= widened;
b00adefb7a6570 Alexei Starovoitov 2026-11-20  1203  		/* what enters did not grow in this loop */
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1204  		widen = !t->pending && !enters;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1205  		flow_unlink(env, t);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1206  		err = bpf_states_join(env, &t->st, &s->st, leftover_loop, widen);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1207  		swap(s->st, t->st);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1208  		s->st.last_insn_idx = prev;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1209  		flow_free_state(env, t);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1210  		/* another state can subsume the join, or have a join with it */
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1211  		goto again;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1212  	}
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1213  
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1214  	/*
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1215  	 * The state is printed when its turn comes. That says enough about a state that
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1216  	 * is new, and about a state that goes on to the next insn.
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1217  	 */
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1218  	if (prev >= 0 && insn_idx == prev + 1 + bpf_is_ldimm64(&env->prog->insnsi[prev]) &&
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1219  	    !widened)
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1220  		joined = false;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1221  	if (log && joined)
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1222  		verbose(env, "from %d to %d: %s\n", prev, insn_idx, widened ? "widened" : "joined");
97f92b0c1df6fe Alexei Starovoitov 2026-11-20  1223  	err = enters && !widened ? bpf_guess_first_trips(env, &s->st, loop) : 0;
97f92b0c1df6fe Alexei Starovoitov 2026-11-20  1224  	if (err < 0)
97f92b0c1df6fe Alexei Starovoitov 2026-11-20  1225  		goto free;
97f92b0c1df6fe Alexei Starovoitov 2026-11-20  1226  	if (err)
97f92b0c1df6fe Alexei Starovoitov 2026-11-20  1227  		flow_find(env, s);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1228  	flow_link(env, s);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1229  	return 0;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1230  free:
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1231  	flow_free_state(env, s);
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1232  	return err;
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1233  }
0e5e78acdf2a62 Alexei Starovoitov 2026-11-20  1234  

:::::: The code at line 1183 was first introduced by commit
:::::: 0e5e78acdf2a625f7266e74235eff622a1268134 bpf: Prune or join each state that arrives

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
