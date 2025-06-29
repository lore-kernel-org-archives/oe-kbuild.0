Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3BA189912
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751182383; cv=none; b=XeVHl7QXzxAiRgNHXzwFoRM8BOvA4VUzfAAnEkbsztdr3WiuVbbA7K2DXJZVO0cr/BB5hZjI3FMsMSEMzAuqpwBcOIc2BCEc3uNTDPfenJWZc2/WuaJ7nREJtXL/graI/jk/q1iTxXgbgUeaXX4/ojaFPmyGSR5yzSV0xBqWyUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751182383; c=relaxed/simple;
	bh=TKeTq0qf+H9/7J49CZQKJBScgi6eQvtBUtYe9R/R1K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pGsSqIz16wEyy19Dj+yr95l6cAAuby1vvaTQNxwMKEq5monvgwrN+2mdeqllWI/CSFbKYfq4m1Akr5IeAoh4rb28GlSkPWYpjCRE+UhDY9DUevZ8orWtokNWDOC5TU9Dnxh7ChiAe52bR4lWww+3qZ8/c6BhtYGmEPPBXhSUN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIV8Li5N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIV8Li5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751182381; x=1782718381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TKeTq0qf+H9/7J49CZQKJBScgi6eQvtBUtYe9R/R1K0=;
  b=EIV8Li5N6cZ4n41nA2s403yDwkZFK3owogf3GGyM4I53aQf8D+xcc+0M
   1RN2hkMP1cftZQlTo7fprxYVvvYT8XRhoJiKuewfGGSS5wvHoJWlq3PkN
   knT0h4P3Nenae9Hnhk8ICN39NJMH4Y2K/zbxHVrvdS3daoWi1ctJdrHmf
   xW6qEszDJtl/KKVsoUJjTd2MP9cQZ3FlJEDH79B85RfacYP0bToQVSZHg
   LY1WFvyk5hZFttKNdVcx5LgrP5GrJ1S6+Ef7+taLa1IHUTdQgTS2J+3g4
   lWDQKiYWZ4ZaRo4efZeULYQ2aWc6YrL3WXZ6WDpxLUmFY8YFNyQXJrtvV
   A==;
X-CSE-ConnectionGUID: vVhXl+2bRk+LeLLjm4C+WQ==
X-CSE-MsgGUID: IFNMLFpnSoKxaG9QnmWQZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53156811"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="53156811"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 00:33:00 -0700
X-CSE-ConnectionGUID: sRf+dOAiRyGMg9PeYiem+Q==
X-CSE-MsgGUID: pbjXdoUIRyuPGGL9Fmsg8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="153268518"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2025 00:32:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVmX1-000Xkq-2a;
	Sun, 29 Jun 2025 07:32:55 +0000
Date: Sun, 29 Jun 2025 15:32:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 1742/5998] kernel/bpf/verifier.c:19577:20-21:
 WARNING kmalloc is used to allocate this memory at line 19568
Message-ID: <202506291548.ToazrNDJ-lkp@intel.com>
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
TO: Eduard Zingerman <eddyz87@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: c9e31900b54cadf5398dfb838c0a63effa1defec [1742/5998] bpf: propagate read/precision marks over state graph backedges
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-104-20250629 (https://download.01.org/0day-ci/archive/20250629/202506291548.ToazrNDJ-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506291548.ToazrNDJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/verifier.c:19577:20-21: WARNING kmalloc is used to allocate this memory at line 19568
   kernel/bpf/verifier.c:19659:15-16: WARNING kmalloc is used to allocate this memory at line 19632

vim +19577 kernel/bpf/verifier.c

2589726d12a1b1 Alexei Starovoitov      2019-06-15  19306  
58e2af8b3a6b58 Jakub Kicinski          2016-09-21  19307  static int is_state_visited(struct bpf_verifier_env *env, int insn_idx)
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19308  {
58e2af8b3a6b58 Jakub Kicinski          2016-09-21  19309  	struct bpf_verifier_state_list *new_sl;
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19310  	struct bpf_verifier_state_list *sl;
c9e31900b54cad Eduard Zingerman        2025-06-11  19311  	struct bpf_verifier_state *cur = env->cur_state, *new;
c9e31900b54cad Eduard Zingerman        2025-06-11  19312  	bool force_new_state, add_new_state, loop;
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19313  	int i, j, n, err, states_cnt = 0;
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19314  	struct list_head *pos, *tmp, *head;
aa30eb3260b2de Eduard Zingerman        2024-10-29  19315  
aa30eb3260b2de Eduard Zingerman        2024-10-29  19316  	force_new_state = env->test_state_freq || is_force_checkpoint(env, insn_idx) ||
aa30eb3260b2de Eduard Zingerman        2024-10-29  19317  			  /* Avoid accumulating infinitely long jmp history */
baaebe0928bf32 Eduard Zingerman        2025-06-11  19318  			  cur->jmp_history_cnt > 40;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19319  
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19320  	/* bpf progs typically have pruning point every 4 instructions
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19321  	 * http://vger.kernel.org/bpfconf2019.html#session-1
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19322  	 * Do not add new state for future pruning if the verifier hasn't seen
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19323  	 * at least 2 jumps and at least 8 instructions.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19324  	 * This heuristics helps decrease 'total_states' and 'peak_states' metric.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19325  	 * In tests that amounts to up to 50% reduction into total verifier
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19326  	 * memory consumption and 20% verifier time speedup.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19327  	 */
aa30eb3260b2de Eduard Zingerman        2024-10-29  19328  	add_new_state = force_new_state;
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19329  	if (env->jmps_processed - env->prev_jmps_processed >= 2 &&
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19330  	    env->insn_processed - env->prev_insn_processed >= 8)
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19331  		add_new_state = true;
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19332  
9242b5f5615c82 Alexei Starovoitov      2018-12-13  19333  	clean_live_states(env, insn_idx, cur);
9242b5f5615c82 Alexei Starovoitov      2018-12-13  19334  
c9e31900b54cad Eduard Zingerman        2025-06-11  19335  	loop = false;
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19336  	head = explored_state(env, insn_idx);
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19337  	list_for_each_safe(pos, tmp, head) {
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19338  		sl = container_of(pos, struct bpf_verifier_state_list, node);
dc2a4ebc0b44a2 Alexei Starovoitov      2019-05-21  19339  		states_cnt++;
dc2a4ebc0b44a2 Alexei Starovoitov      2019-05-21  19340  		if (sl->state.insn_idx != insn_idx)
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19341  			continue;
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19342  
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19343  		if (sl->state.branches) {
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19344  			struct bpf_func_state *frame = sl->state.frame[sl->state.curframe];
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19345  
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19346  			if (frame->in_async_callback_fn &&
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19347  			    frame->async_entry_cnt != cur->frame[cur->curframe]->async_entry_cnt) {
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19348  				/* Different async_entry_cnt means that the verifier is
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19349  				 * processing another entry into async callback.
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19350  				 * Seeing the same state is not an indication of infinite
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19351  				 * loop or infinite recursion.
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19352  				 * But finding the same state doesn't mean that it's safe
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19353  				 * to stop processing the current state. The previous state
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19354  				 * hasn't yet reached bpf_exit, since state.branches > 0.
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19355  				 * Checking in_async_callback_fn alone is not enough either.
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19356  				 * Since the verifier still needs to catch infinite loops
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19357  				 * inside async callbacks.
bfc6bb74e4f16a Alexei Starovoitov      2021-07-14  19358  				 */
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19359  				goto skip_inf_loop_check;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19360  			}
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19361  			/* BPF open-coded iterators loop detection is special.
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19362  			 * states_maybe_looping() logic is too simplistic in detecting
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19363  			 * states that *might* be equivalent, because it doesn't know
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19364  			 * about ID remapping, so don't even perform it.
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19365  			 * See process_iter_next_call() and iter_active_depths_differ()
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19366  			 * for overview of the logic. When current and one of parent
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19367  			 * states are detected as equivalent, it's a good thing: we prove
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19368  			 * convergence and can stop simulating further iterations.
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19369  			 * It's safe to assume that iterator loop will finish, taking into
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19370  			 * account iter_next() contract of eventually returning
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19371  			 * sticky NULL result.
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19372  			 *
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19373  			 * Note, that states have to be compared exactly in this case because
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19374  			 * read and precision marks might not be finalized inside the loop.
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19375  			 * E.g. as in the program below:
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19376  			 *
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19377  			 *     1. r7 = -16
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19378  			 *     2. r6 = bpf_get_prandom_u32()
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19379  			 *     3. while (bpf_iter_num_next(&fp[-8])) {
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19380  			 *     4.   if (r6 != 42) {
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19381  			 *     5.     r7 = -32
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19382  			 *     6.     r6 = bpf_get_prandom_u32()
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19383  			 *     7.     continue
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19384  			 *     8.   }
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19385  			 *     9.   r0 = r10
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19386  			 *    10.   r0 += r7
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19387  			 *    11.   r8 = *(u64 *)(r0 + 0)
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19388  			 *    12.   r6 = bpf_get_prandom_u32()
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19389  			 *    13. }
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19390  			 *
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19391  			 * Here verifier would first visit path 1-3, create a checkpoint at 3
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19392  			 * with r7=-16, continue to 4-7,3. Existing checkpoint at 3 does
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19393  			 * not have read or precision mark for r7 yet, thus inexact states
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19394  			 * comparison would discard current state with r7=-32
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19395  			 * => unsafe memory access at 11 would not be caught.
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19396  			 */
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19397  			if (is_iter_next_insn(env, insn_idx)) {
4f81c16f50baf6 Alexei Starovoitov      2024-03-05  19398  				if (states_equal(env, &sl->state, cur, RANGE_WITHIN)) {
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19399  					struct bpf_func_state *cur_frame;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19400  					struct bpf_reg_state *iter_state, *iter_reg;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19401  					int spi;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19402  
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19403  					cur_frame = cur->frame[cur->curframe];
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19404  					/* btf_check_iter_kfuncs() enforces that
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19405  					 * iter state pointer is always the first arg
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19406  					 */
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19407  					iter_reg = &cur_frame->regs[BPF_REG_1];
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19408  					/* current state is valid due to states_equal(),
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19409  					 * so we can assume valid iter and reg state,
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19410  					 * no need for extra (re-)validations
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19411  					 */
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19412  					spi = __get_spi(iter_reg->off + iter_reg->var_off.value);
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19413  					iter_state = &func(env, iter_reg)->stack[spi].spilled_ptr;
2a0992829ea386 Eduard Zingerman        2023-10-24  19414  					if (iter_state->iter.state == BPF_ITER_STATE_ACTIVE) {
c9e31900b54cad Eduard Zingerman        2025-06-11  19415  						loop = true;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19416  						goto hit;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19417  					}
2a0992829ea386 Eduard Zingerman        2023-10-24  19418  				}
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19419  				goto skip_inf_loop_check;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19420  			}
011832b97b311b Alexei Starovoitov      2024-03-05  19421  			if (is_may_goto_insn_at(env, insn_idx)) {
2b2efe1937ca9f Alexei Starovoitov      2024-06-19  19422  				if (sl->state.may_goto_depth != cur->may_goto_depth &&
2b2efe1937ca9f Alexei Starovoitov      2024-06-19  19423  				    states_equal(env, &sl->state, cur, RANGE_WITHIN)) {
c9e31900b54cad Eduard Zingerman        2025-06-11  19424  					loop = true;
011832b97b311b Alexei Starovoitov      2024-03-05  19425  					goto hit;
011832b97b311b Alexei Starovoitov      2024-03-05  19426  				}
011832b97b311b Alexei Starovoitov      2024-03-05  19427  			}
ab5cfac139ab85 Eduard Zingerman        2023-11-21  19428  			if (calls_callback(env, insn_idx)) {
4f81c16f50baf6 Alexei Starovoitov      2024-03-05  19429  				if (states_equal(env, &sl->state, cur, RANGE_WITHIN))
ab5cfac139ab85 Eduard Zingerman        2023-11-21  19430  					goto hit;
ab5cfac139ab85 Eduard Zingerman        2023-11-21  19431  				goto skip_inf_loop_check;
ab5cfac139ab85 Eduard Zingerman        2023-11-21  19432  			}
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19433  			/* attempt to detect infinite loop to avoid unnecessary doomed work */
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19434  			if (states_maybe_looping(&sl->state, cur) &&
4f81c16f50baf6 Alexei Starovoitov      2024-03-05  19435  			    states_equal(env, &sl->state, cur, EXACT) &&
ab5cfac139ab85 Eduard Zingerman        2023-11-21  19436  			    !iter_active_depths_differ(&sl->state, cur) &&
011832b97b311b Alexei Starovoitov      2024-03-05  19437  			    sl->state.may_goto_depth == cur->may_goto_depth &&
ab5cfac139ab85 Eduard Zingerman        2023-11-21  19438  			    sl->state.callback_unroll_depth == cur->callback_unroll_depth) {
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19439  				verbose_linfo(env, insn_idx, "; ");
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19440  				verbose(env, "infinite loop detected at insn %d\n", insn_idx);
b4d8239534fddc Eduard Zingerman        2023-10-24  19441  				verbose(env, "cur state:");
1995edc5f9089e Kumar Kartikeya Dwivedi 2024-12-03  19442  				print_verifier_state(env, cur, cur->curframe, true);
b4d8239534fddc Eduard Zingerman        2023-10-24  19443  				verbose(env, "old state:");
1995edc5f9089e Kumar Kartikeya Dwivedi 2024-12-03  19444  				print_verifier_state(env, &sl->state, cur->curframe, true);
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19445  				return -EINVAL;
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19446  			}
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19447  			/* if the verifier is processing a loop, avoid adding new state
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19448  			 * too often, since different loop iterations have distinct
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19449  			 * states and may not help future pruning.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19450  			 * This threshold shouldn't be too low to make sure that
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19451  			 * a loop with large bound will be rejected quickly.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19452  			 * The most abusive loop will be:
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19453  			 * r1 += 1
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19454  			 * if r1 < 1000000 goto pc-2
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19455  			 * 1M insn_procssed limit / 100 == 10k peak states.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19456  			 * This threshold shouldn't be too high either, since states
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19457  			 * at the end of the loop are likely to be useful in pruning.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19458  			 */
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19459  skip_inf_loop_check:
4b5ce570dbef57 Andrii Nakryiko         2023-03-09  19460  			if (!force_new_state &&
98ddcf389d1bb7 Andrii Nakryiko         2023-03-02  19461  			    env->jmps_processed - env->prev_jmps_processed < 20 &&
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19462  			    env->insn_processed - env->prev_insn_processed < 100)
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19463  				add_new_state = false;
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19464  			goto miss;
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19465  		}
c9e31900b54cad Eduard Zingerman        2025-06-11  19466  		/* See comments for mark_all_regs_read_and_precise() */
c9e31900b54cad Eduard Zingerman        2025-06-11  19467  		loop = incomplete_read_marks(env, &sl->state);
c9e31900b54cad Eduard Zingerman        2025-06-11  19468  		if (states_equal(env, &sl->state, cur, loop ? RANGE_WITHIN : NOT_EXACT)) {
06accc8779c1d5 Andrii Nakryiko         2023-03-08  19469  hit:
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19470  			sl->hit_cnt++;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19471  			/* reached equivalent register/stack state,
dc503a8ad98474 Edward Cree             2017-08-15  19472  			 * prune the search.
dc503a8ad98474 Edward Cree             2017-08-15  19473  			 * Registers read by the continuation are read by us.
8e9cd9ce90d483 Edward Cree             2017-08-23  19474  			 * If we have any write marks in env->cur_state, they
8e9cd9ce90d483 Edward Cree             2017-08-23  19475  			 * will prevent corresponding reads in the continuation
8e9cd9ce90d483 Edward Cree             2017-08-23  19476  			 * from reaching our parent (an explored_state).  Our
8e9cd9ce90d483 Edward Cree             2017-08-23  19477  			 * own state will get the read marks recorded, but
8e9cd9ce90d483 Edward Cree             2017-08-23  19478  			 * they'll be immediately forgotten as we're pruning
8e9cd9ce90d483 Edward Cree             2017-08-23  19479  			 * this state and will pop a new one.
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19480  			 */
dfb2d4c64b82ac Eduard Zingerman        2025-06-11  19481  			err = propagate_liveness(env, &sl->state, cur, NULL);
a3ce685dd01a78 Alexei Starovoitov      2019-06-28  19482  
a3ce685dd01a78 Alexei Starovoitov      2019-06-28  19483  			/* if previous state reached the exit with precision and
a7de265cb2d849 Rafael Passos           2024-04-17  19484  			 * current state is equivalent to it (except precision marks)
a3ce685dd01a78 Alexei Starovoitov      2019-06-28  19485  			 * the precision needs to be propagated back in
a3ce685dd01a78 Alexei Starovoitov      2019-06-28  19486  			 * the current state.
a3ce685dd01a78 Alexei Starovoitov      2019-06-28  19487  			 */
41f6f64e6999a8 Andrii Nakryiko         2023-12-05  19488  			if (is_jmp_point(env, env->insn_idx))
baaebe0928bf32 Eduard Zingerman        2025-06-11  19489  				err = err ? : push_jmp_history(env, cur, 0, 0);
23b37d616565c8 Eduard Zingerman        2025-06-11  19490  			err = err ? : propagate_precision(env, &sl->state, cur, NULL);
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19491  			if (err)
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19492  				return err;
c9e31900b54cad Eduard Zingerman        2025-06-11  19493  			/* When processing iterator based loops above propagate_liveness and
c9e31900b54cad Eduard Zingerman        2025-06-11  19494  			 * propagate_precision calls are not sufficient to transfer all relevant
c9e31900b54cad Eduard Zingerman        2025-06-11  19495  			 * read and precision marks. E.g. consider the following case:
c9e31900b54cad Eduard Zingerman        2025-06-11  19496  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19497  			 *  .-> A --.  Assume the states are visited in the order A, B, C.
c9e31900b54cad Eduard Zingerman        2025-06-11  19498  			 *  |   |   |  Assume that state B reaches a state equivalent to state A.
c9e31900b54cad Eduard Zingerman        2025-06-11  19499  			 *  |   v   v  At this point, state C is not processed yet, so state A
c9e31900b54cad Eduard Zingerman        2025-06-11  19500  			 *  '-- B   C  has not received any read or precision marks from C.
c9e31900b54cad Eduard Zingerman        2025-06-11  19501  			 *             Thus, marks propagated from A to B are incomplete.
c9e31900b54cad Eduard Zingerman        2025-06-11  19502  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19503  			 * The verifier mitigates this by performing the following steps:
c9e31900b54cad Eduard Zingerman        2025-06-11  19504  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19505  			 * - Prior to the main verification pass, strongly connected components
c9e31900b54cad Eduard Zingerman        2025-06-11  19506  			 *   (SCCs) are computed over the program's control flow graph,
c9e31900b54cad Eduard Zingerman        2025-06-11  19507  			 *   intraprocedurally.
c9e31900b54cad Eduard Zingerman        2025-06-11  19508  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19509  			 * - During the main verification pass, `maybe_enter_scc()` checks
c9e31900b54cad Eduard Zingerman        2025-06-11  19510  			 *   whether the current verifier state is entering an SCC. If so, an
c9e31900b54cad Eduard Zingerman        2025-06-11  19511  			 *   instance of a `bpf_scc_visit` object is created, and the state
c9e31900b54cad Eduard Zingerman        2025-06-11  19512  			 *   entering the SCC is recorded as the entry state.
c9e31900b54cad Eduard Zingerman        2025-06-11  19513  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19514  			 * - This instance is associated not with the SCC itself, but with a
c9e31900b54cad Eduard Zingerman        2025-06-11  19515  			 *   `bpf_scc_callchain`: a tuple consisting of the call sites leading to
c9e31900b54cad Eduard Zingerman        2025-06-11  19516  			 *   the SCC and the SCC id. See `compute_scc_callchain()`.
c9e31900b54cad Eduard Zingerman        2025-06-11  19517  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19518  			 * - When a verification path encounters a `states_equal(...,
c9e31900b54cad Eduard Zingerman        2025-06-11  19519  			 *   RANGE_WITHIN)` condition, there exists a call chain describing the
c9e31900b54cad Eduard Zingerman        2025-06-11  19520  			 *   current state and a corresponding `bpf_scc_visit` instance. A copy
c9e31900b54cad Eduard Zingerman        2025-06-11  19521  			 *   of the current state is created and added to
c9e31900b54cad Eduard Zingerman        2025-06-11  19522  			 *   `bpf_scc_visit->backedges`.
c9e31900b54cad Eduard Zingerman        2025-06-11  19523  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19524  			 * - When a verification path terminates, `maybe_exit_scc()` is called
c9e31900b54cad Eduard Zingerman        2025-06-11  19525  			 *   from `update_branch_counts()`. For states with `branches == 0`, it
c9e31900b54cad Eduard Zingerman        2025-06-11  19526  			 *   checks whether the state is the entry state of any `bpf_scc_visit`
c9e31900b54cad Eduard Zingerman        2025-06-11  19527  			 *   instance. If it is, this indicates that all paths originating from
c9e31900b54cad Eduard Zingerman        2025-06-11  19528  			 *   this SCC visit have been explored. `propagate_backedges()` is then
c9e31900b54cad Eduard Zingerman        2025-06-11  19529  			 *   called, which propagates read and precision marks through the
c9e31900b54cad Eduard Zingerman        2025-06-11  19530  			 *   backedges until a fixed point is reached.
c9e31900b54cad Eduard Zingerman        2025-06-11  19531  			 *   (In the earlier example, this would propagate marks from A to B,
c9e31900b54cad Eduard Zingerman        2025-06-11  19532  			 *    from C to A, and then again from A to B.)
c9e31900b54cad Eduard Zingerman        2025-06-11  19533  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19534  			 * A note on callchains
c9e31900b54cad Eduard Zingerman        2025-06-11  19535  			 * --------------------
c9e31900b54cad Eduard Zingerman        2025-06-11  19536  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19537  			 * Consider the following example:
c9e31900b54cad Eduard Zingerman        2025-06-11  19538  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19539  			 *     void foo() { loop { ... SCC#1 ... } }
c9e31900b54cad Eduard Zingerman        2025-06-11  19540  			 *     void main() {
c9e31900b54cad Eduard Zingerman        2025-06-11  19541  			 *       A: foo();
c9e31900b54cad Eduard Zingerman        2025-06-11  19542  			 *       B: ...
c9e31900b54cad Eduard Zingerman        2025-06-11  19543  			 *       C: foo();
c9e31900b54cad Eduard Zingerman        2025-06-11  19544  			 *     }
c9e31900b54cad Eduard Zingerman        2025-06-11  19545  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19546  			 * Here, there are two distinct callchains leading to SCC#1:
c9e31900b54cad Eduard Zingerman        2025-06-11  19547  			 * - (A, SCC#1)
c9e31900b54cad Eduard Zingerman        2025-06-11  19548  			 * - (C, SCC#1)
c9e31900b54cad Eduard Zingerman        2025-06-11  19549  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19550  			 * Each callchain identifies a separate `bpf_scc_visit` instance that
c9e31900b54cad Eduard Zingerman        2025-06-11  19551  			 * accumulates backedge states. The `propagate_{liveness,precision}()`
c9e31900b54cad Eduard Zingerman        2025-06-11  19552  			 * functions traverse the parent state of each backedge state, which
c9e31900b54cad Eduard Zingerman        2025-06-11  19553  			 * means these parent states must remain valid (i.e., not freed) while
c9e31900b54cad Eduard Zingerman        2025-06-11  19554  			 * the corresponding `bpf_scc_visit` instance exists.
c9e31900b54cad Eduard Zingerman        2025-06-11  19555  			 *
c9e31900b54cad Eduard Zingerman        2025-06-11  19556  			 * Associating `bpf_scc_visit` instances directly with SCCs instead of
c9e31900b54cad Eduard Zingerman        2025-06-11  19557  			 * callchains would break this invariant:
c9e31900b54cad Eduard Zingerman        2025-06-11  19558  			 * - States explored during `C: foo()` would contribute backedges to
c9e31900b54cad Eduard Zingerman        2025-06-11  19559  			 *   SCC#1, but SCC#1 would only be exited once the exploration of
c9e31900b54cad Eduard Zingerman        2025-06-11  19560  			 *   `A: foo()` completes.
c9e31900b54cad Eduard Zingerman        2025-06-11  19561  			 * - By that time, the states explored between `A: foo()` and `C: foo()`
c9e31900b54cad Eduard Zingerman        2025-06-11  19562  			 *   (i.e., `B: ...`) may have already been freed, causing the parent
c9e31900b54cad Eduard Zingerman        2025-06-11  19563  			 *   links for states from `C: foo()` to become invalid.
c9e31900b54cad Eduard Zingerman        2025-06-11  19564  			 */
c9e31900b54cad Eduard Zingerman        2025-06-11  19565  			if (loop) {
c9e31900b54cad Eduard Zingerman        2025-06-11  19566  				struct bpf_scc_backedge *backedge;
c9e31900b54cad Eduard Zingerman        2025-06-11  19567  
c9e31900b54cad Eduard Zingerman        2025-06-11 @19568  				backedge = kzalloc(sizeof(*backedge), GFP_KERNEL);
c9e31900b54cad Eduard Zingerman        2025-06-11  19569  				if (!backedge)
c9e31900b54cad Eduard Zingerman        2025-06-11  19570  					return -ENOMEM;
c9e31900b54cad Eduard Zingerman        2025-06-11  19571  				err = copy_verifier_state(&backedge->state, cur);
c9e31900b54cad Eduard Zingerman        2025-06-11  19572  				backedge->state.equal_state = &sl->state;
c9e31900b54cad Eduard Zingerman        2025-06-11  19573  				backedge->state.insn_idx = insn_idx;
c9e31900b54cad Eduard Zingerman        2025-06-11  19574  				err = err ?: add_scc_backedge(env, &sl->state, backedge);
c9e31900b54cad Eduard Zingerman        2025-06-11  19575  				if (err) {
c9e31900b54cad Eduard Zingerman        2025-06-11  19576  					free_verifier_state(&backedge->state, false);
c9e31900b54cad Eduard Zingerman        2025-06-11 @19577  					kvfree(backedge);
c9e31900b54cad Eduard Zingerman        2025-06-11  19578  					return err;
c9e31900b54cad Eduard Zingerman        2025-06-11  19579  				}
c9e31900b54cad Eduard Zingerman        2025-06-11  19580  			}
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19581  			return 1;
dc503a8ad98474 Edward Cree             2017-08-15  19582  		}
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19583  miss:
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19584  		/* when new state is not going to be added do not increase miss count.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19585  		 * Otherwise several loop iterations will remove the state
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19586  		 * recorded earlier. The goal of these heuristics is to have
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19587  		 * states from some iterations of the loop (some in the beginning
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19588  		 * and some at the end) to help pruning.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19589  		 */
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19590  		if (add_new_state)
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19591  			sl->miss_cnt++;
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19592  		/* heuristic to determine whether this state is beneficial
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19593  		 * to keep checking from state equivalence point of view.
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19594  		 * Higher numbers increase max_states_per_insn and verification time,
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19595  		 * but do not meaningfully decrease insn_processed.
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19596  		 * 'n' controls how many times state could miss before eviction.
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19597  		 * Use bigger 'n' for checkpoints because evicting checkpoint states
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19598  		 * too early would hinder iterator convergence.
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19599  		 */
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19600  		n = is_force_checkpoint(env, insn_idx) && sl->state.branches > 0 ? 64 : 3;
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19601  		if (sl->miss_cnt > sl->hit_cnt * n + n) {
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19602  			/* the state is unlikely to be useful. Remove it to
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19603  			 * speed up verification
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19604  			 */
408fcf946b2bad Eduard Zingerman        2025-02-15  19605  			sl->in_free_list = true;
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19606  			list_del(&sl->node);
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19607  			list_add(&sl->node, &env->free_list);
574078b001cdf6 Eduard Zingerman        2025-02-15  19608  			env->free_list_size++;
574078b001cdf6 Eduard Zingerman        2025-02-15  19609  			env->explored_states_size--;
408fcf946b2bad Eduard Zingerman        2025-02-15  19610  			maybe_free_verifier_state(env, sl);
9f4686c41bdff0 Alexei Starovoitov      2019-04-01  19611  		}
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19612  	}
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19613  
06ee7115b0d174 Alexei Starovoitov      2019-04-01  19614  	if (env->max_states_per_insn < states_cnt)
06ee7115b0d174 Alexei Starovoitov      2019-04-01  19615  		env->max_states_per_insn = states_cnt;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19616  
2c78ee898d8f10 Alexei Starovoitov      2020-05-13  19617  	if (!env->bpf_capable && states_cnt > BPF_COMPLEXITY_LIMIT_STATES)
a095f421057e22 Andrii Nakryiko         2022-12-06  19618  		return 0;
ceefbc96fa5c5b Alexei Starovoitov      2018-12-03  19619  
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19620  	if (!add_new_state)
a095f421057e22 Andrii Nakryiko         2022-12-06  19621  		return 0;
ceefbc96fa5c5b Alexei Starovoitov      2018-12-03  19622  
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19623  	/* There were no equivalent states, remember the current one.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19624  	 * Technically the current state is not proven to be safe yet,
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19625  	 * but it will either reach outer most bpf_exit (which means it's safe)
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19626  	 * or it will be rejected. When there are no loops the verifier won't be
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19627  	 * seeing this tuple (frame[0].callsite, frame[1].callsite, .. insn_idx)
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19628  	 * again on the way to bpf_exit.
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19629  	 * When looping the sl->state.branches will be > 0 and this state
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19630  	 * will not be considered for equivalence until branches == 0.
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19631  	 */
638f5b90d46016 Alexei Starovoitov      2017-10-31  19632  	new_sl = kzalloc(sizeof(struct bpf_verifier_state_list), GFP_KERNEL);
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19633  	if (!new_sl)
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19634  		return -ENOMEM;
06ee7115b0d174 Alexei Starovoitov      2019-04-01  19635  	env->total_states++;
574078b001cdf6 Eduard Zingerman        2025-02-15  19636  	env->explored_states_size++;
574078b001cdf6 Eduard Zingerman        2025-02-15  19637  	update_peak_states(env);
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19638  	env->prev_jmps_processed = env->jmps_processed;
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19639  	env->prev_insn_processed = env->insn_processed;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19640  
7a830b53c17bba Andrii Nakryiko         2022-11-04  19641  	/* forget precise markings we inherited, see __mark_chain_precision */
7a830b53c17bba Andrii Nakryiko         2022-11-04  19642  	if (env->bpf_capable)
7a830b53c17bba Andrii Nakryiko         2022-11-04  19643  		mark_all_scalars_imprecise(env, cur);
7a830b53c17bba Andrii Nakryiko         2022-11-04  19644  
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19645  	/* add new state to the head of linked list */
679c782de14bd4 Edward Cree             2018-08-22  19646  	new = &new_sl->state;
679c782de14bd4 Edward Cree             2018-08-22  19647  	err = copy_verifier_state(new, cur);
1969db47f8d0e8 Alexei Starovoitov      2017-11-01  19648  	if (err) {
679c782de14bd4 Edward Cree             2018-08-22  19649  		free_verifier_state(new, false);
1969db47f8d0e8 Alexei Starovoitov      2017-11-01  19650  		kfree(new_sl);
1969db47f8d0e8 Alexei Starovoitov      2017-11-01  19651  		return err;
1969db47f8d0e8 Alexei Starovoitov      2017-11-01  19652  	}
dc2a4ebc0b44a2 Alexei Starovoitov      2019-05-21  19653  	new->insn_idx = insn_idx;
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19654  	WARN_ONCE(new->branches != 1,
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19655  		  "BUG is_state_visited:branches_to_explore=%d insn %d\n", new->branches, insn_idx);
c9e31900b54cad Eduard Zingerman        2025-06-11  19656  	err = maybe_enter_scc(env, new);
c9e31900b54cad Eduard Zingerman        2025-06-11  19657  	if (err) {
c9e31900b54cad Eduard Zingerman        2025-06-11  19658  		free_verifier_state(new, false);
c9e31900b54cad Eduard Zingerman        2025-06-11  19659  		kvfree(new_sl);
c9e31900b54cad Eduard Zingerman        2025-06-11  19660  		return err;
c9e31900b54cad Eduard Zingerman        2025-06-11  19661  	}
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  19662  
2589726d12a1b1 Alexei Starovoitov      2019-06-15  19663  	cur->parent = new;
b5dc0163d8fd78 Alexei Starovoitov      2019-06-15  19664  	cur->first_insn_idx = insn_idx;
2793a8b015f7f1 Eduard Zingerman        2023-10-24  19665  	cur->dfs_depth = new->dfs_depth + 1;
baaebe0928bf32 Eduard Zingerman        2025-06-11  19666  	clear_jmp_history(cur);
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19667  	list_add(&new_sl->node, head);
5564ee3abb2ebe Eduard Zingerman        2025-02-15  19668  
7640ead939247e Jakub Kicinski          2018-12-12  19669  	/* connect new state to parentage chain. Current frame needs all
7640ead939247e Jakub Kicinski          2018-12-12  19670  	 * registers connected. Only r6 - r9 of the callers are alive (pushed
7640ead939247e Jakub Kicinski          2018-12-12  19671  	 * to the stack implicitly by JITs) so in callers' frames connect just
7640ead939247e Jakub Kicinski          2018-12-12  19672  	 * r6 - r9 as an optimization. Callers will have r1 - r5 connected to
7640ead939247e Jakub Kicinski          2018-12-12  19673  	 * the state of the call instruction (with WRITTEN set), and r0 comes
7640ead939247e Jakub Kicinski          2018-12-12  19674  	 * from callee with its full parentage chain, anyway.
7640ead939247e Jakub Kicinski          2018-12-12  19675  	 */
8e9cd9ce90d483 Edward Cree             2017-08-23  19676  	/* clear write marks in current state: the writes we did are not writes
8e9cd9ce90d483 Edward Cree             2017-08-23  19677  	 * our child did, so they don't screen off its reads from us.
8e9cd9ce90d483 Edward Cree             2017-08-23  19678  	 * (There are no read marks in current state, because reads always mark
8e9cd9ce90d483 Edward Cree             2017-08-23  19679  	 * their parent and current state never has children yet.  Only
8e9cd9ce90d483 Edward Cree             2017-08-23  19680  	 * explored_states can get read marks.)
8e9cd9ce90d483 Edward Cree             2017-08-23  19681  	 */
eea1c227b9e9ba Alexei Starovoitov      2019-06-15  19682  	for (j = 0; j <= cur->curframe; j++) {
eea1c227b9e9ba Alexei Starovoitov      2019-06-15  19683  		for (i = j < cur->curframe ? BPF_REG_6 : 0; i < BPF_REG_FP; i++)
eea1c227b9e9ba Alexei Starovoitov      2019-06-15  19684  			cur->frame[j]->regs[i].parent = &new->frame[j]->regs[i];
dc503a8ad98474 Edward Cree             2017-08-15  19685  		for (i = 0; i < BPF_REG_FP; i++)
eea1c227b9e9ba Alexei Starovoitov      2019-06-15  19686  			cur->frame[j]->regs[i].live = REG_LIVE_NONE;
eea1c227b9e9ba Alexei Starovoitov      2019-06-15  19687  	}
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19688  
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19689  	/* all stack frames are accessible from callee, clear them all */
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19690  	for (j = 0; j <= cur->curframe; j++) {
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19691  		struct bpf_func_state *frame = cur->frame[j];
679c782de14bd4 Edward Cree             2018-08-22  19692  		struct bpf_func_state *newframe = new->frame[j];
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19693  
679c782de14bd4 Edward Cree             2018-08-22  19694  		for (i = 0; i < frame->allocated_stack / BPF_REG_SIZE; i++) {
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19695  			frame->stack[i].spilled_ptr.live = REG_LIVE_NONE;
679c782de14bd4 Edward Cree             2018-08-22  19696  			frame->stack[i].spilled_ptr.parent =
679c782de14bd4 Edward Cree             2018-08-22  19697  						&newframe->stack[i].spilled_ptr;
679c782de14bd4 Edward Cree             2018-08-22  19698  		}
f4d7e40a5b7157 Alexei Starovoitov      2017-12-14  19699  	}
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19700  	return 0;
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19701  }
f1bca824dabba4 Alexei Starovoitov      2014-09-29  19702  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
