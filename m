Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794072990;
	b=OhwxMwKMrjEYOuVX+DIoCreMNSHRCOryaomWlSryhOzD662LisJbNyYy9r87wVLrqhSC
	 LChsFwtl8SJZPvzoCIiJNGQLUEmkuNmN30Lvmkuu1riighIaFa/nthRYLuLcy8mrpUM5a
	 cE2vkdov18ME0X2L8PUzZWS6+05/Ccc3iUqE+z30xW8oWWr/VhUX37/PJm8Fb/8ari/TH
	 txncg9ef7ISXY6zKbnWfHfc9ZiC6zehiDOm7aUgZeQHHVmggfZtg3422uJscpsmuOuZc7
	 VXzrXUyDs1X+vRbv3s00+sGL4zLsClq/SgB6MTz4CNyQMfN/1UK6yabe4WOb+gBv4ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794072990;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sUELczGupRwPqOAVNe64xCqGppMO7L8cEEKJrvtKvsU=;
	b=Ob+yEZI3i27Mg+RDIM7RARen1LK3KSMNClDEM6j1XArZzlBM4I1F6+6g+4CRJcblYLbu
	 UKylbZzUyeANS5Re5Kwmdfkk6ksvLZpDCquMWpxcB0LE6LphjBM/7jLg5vOcgIsn6JKG/
	 29z09Dg74z+a/qbG1iVFPfC6Il47wWXqWY5dMKKa96uWpqVH+PRgjkVnZwD0CGCf7GGkn
	 E8uDv/1RX1QyTJMcA/MVbW2oxHmxOyCy7ZTNOqRdrTDt31gd05zcBNfrOqTGANXACVznH
	 CHCRHEFFf01u6LoHq8qRoclgFWCGOYExJ3sxUDusaSElLPk1D1pTAZHFRbw4BWlFVkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R9PVT3fZ;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2430B606A332
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2430B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R9PVT3fZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794072988; x=1825608988;
  h=date:from:to:cc:subject:message-id;
  bh=Q38TptZI+6GIG5u0fRPofZGpVjTTdeSBMe8fx0Shuh0=;
  b=R9PVT3fZZptlgtDDoeyxIGqXqmaix4YSjFCTH6gsxomPgTx292jBgt4w
   7gJsk301zUwN7/lAj6a0XcxL/d9BfdoPDR9IN1g9Hr6pQc5JE00DwQ+7x
   2/JTU0MQyzvJ5dbduDS/Kbb7lHUVAYtA0Gr94rKtr0rbzgDqdtmnQG2sb
   JIRuTIs0aAnLPPRetoCUB5J6waFDOMU2x9oowtUItynnulrk+aGlnDEuo
   x3ZxTM20zV1S7aaweCaEuBbmtSTolWvCdBnb7YpOsnEWuYh4STilucWym
   /IJ+F5d1KBzDE0Ax95OWDaz64syig7t3uECkA6w6uUfE+n4qFjOdbwiHi
   Q==;
X-CSE-ConnectionGUID: q4R0/AHPQxSQpYsT/3Rd4Q==
X-CSE-MsgGUID: 1FE2xQ3gQkKSa9UlHPPYrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2953529"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2953529"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 09:36:28 -0800
X-CSE-ConnectionGUID: kSgZNb/PRwasTh3OWukqtg==
X-CSE-MsgGUID: gwDolnOcQfmYJpcVxPVUyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="8101881"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 07 Nov 2026 09:36:26 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPkL2-00000000Ajr-1SUK;
	Sat, 07 Nov 2026 17:36:24 +0000
Date: Sat, 07 Nov 2026 18:35:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bpf-next:master 17/47] kernel/bpf/flow.c:2301 flow_merge()
 warn: missing unwind goto?
Message-ID: <202611071829.06q8aOQ9-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>

Hi Alexei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   2d0b457611c06304138754a05e0873cc18acfb7e
commit: a784eb58f12b1a20afa3412d04faa290b79c82c3 [17/47] bpf: Enter and leave loops in the main pass, build flow.c
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071829.06q8aOQ9-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611071829.06q8aOQ9-lkp@intel.com/

smatch warnings:
kernel/bpf/flow.c:2301 flow_merge() warn: missing unwind goto?

vim +2301 kernel/bpf/flow.c

9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2260  
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2261  /*
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2262   * Put *@ps into @set, one of the sets of states at its insn. Returns
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2263   * 1 if it is within a state of the set. It is gone then.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2264   * 0 if it is in the set now, as it was or joined with states of the set.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2265   * @cycle: it came around a cycle, what grew is forgotten.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2266   */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2267  static int flow_merge(struct bpf_verifier_env *env, struct flow_set *set,
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2268  		      struct flow_state **ps, enum flow_cycle cycle)
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2269  {
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2270  	struct bpf_flow *flow = env->flow;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2271  	struct flow_state *s = *ps, *t, *tn;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2272  	int insn_idx = s->st.insn_idx, err;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2273  	u32 *nr_states = &flow->nr_states[insn_idx];
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2274  	bool places, widen_all, widen;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2275  	/* the set of the states that enter a loop is a stop on the way, see bpf_flow_deliver() */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2276  	bool log = (env->log.level & BPF_LOG_LEVEL2) && set == &flow->states[insn_idx];
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2277  	const char *what = NULL;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2278  	int prev = s->prev_insn_idx;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2279  
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2280  again:
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2281  	if (signal_pending(current)) {
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2282  		err = -EAGAIN;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2283  		goto err_free;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2284  	}
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2285  	if (need_resched())
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2286  		cond_resched();
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2287  
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2288  	/* again after a join: an offset may not be a constant any more, a pointer may be gone */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2289  	flow_shape_ctx(&s->st, &s->shape);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2290  	places = *nr_states >= BPF_FLOW_MIN_SHAPES;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2291  	for (t = flow_next_related(env, set, s, NULL, places); t;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2292  	     t = flow_next_related(env, set, s, t, places)) {
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2293  		if (flow_cmp_pkt_range(t, s) > 0 || !flow_trips_near(&t->st, &s->st) ||
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2294  		    !flow_within(env, &t->st, &s->st))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2295  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2296  		if (env->log.level & BPF_LOG_LEVEL2)
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2297  			verbose(env, "from %d to %d: within\n", prev, insn_idx);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2298  		err = flow_cycle_closed(env, &t->st, &s->st) ?:
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2299  		      flow_unite(flow, s->st.flow_entry, t->st.flow_entry);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2300  		flow_free_state(env, s);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07 @2301  		return err ?: 1;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2302  	}
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2303  
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2304  	flow_sweep_trips(env, set, s);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2305  
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2306  	widen_all = cycle == FLOW_CYCLE;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2307  	for (t = flow_next_related(env, set, s, NULL, places); t; t = tn) {
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2308  		tn = flow_next_related(env, set, s, t, places);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2309  		/*
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2310  		 * Iterations that are kept apart have no join. Neither does a state take the place
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2311  		 * of a state of another iteration that it covers: that one is done with, or has its
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2312  		 * own way to go, see flow_cycle_closed().
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2313  		 * The shape is a hash, and what follows goes through the frames of both.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2314  		 */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2315  		if (flow_trips_behind(&t->st, &s->st))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2316  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2317  		widen = widen_all || (cycle == FLOW_CALLBACK_CYCLE &&
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2318  				      max(s->joins, t->joins) >= BPF_FLOW_CALLBACK_JOINS);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2319  		/*
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2320  		 *	ret = 0; if (...) { denied++; ret = -EPERM; }
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2321  		 *	bpf_for(i, 0, n) { ... } return ret;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2322  		 * Two states enter the loop. What comes around it with 0 is for the state with 0.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2323  		 * Next to -EPERM it looks like a number that grew, and would be forgotten. The same
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2324  		 * for the header of a packet at pkt + 34 and at pkt + 54. No rule has to tell which
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2325  		 * numbers that holds for: a state knows where it comes from.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2326  		 * If it has no join with that state it is at the head on its own from now on.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2327  		 * The same for bpf_loop() in place of the loop.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2328  		 */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2329  		if (widen && flow_has_room(env, *nr_states) &&
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2330  		    flow_entries_differ(&t->st, &s->st, cycle))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2331  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2332  		if (!widen && flow_has_room(env, *nr_states) &&
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2333  		    flow_null_differs(flow, &t->st, &s->st))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2334  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2335  		if (!widen && flow_needed_consts_differ(flow, FLOW_NEED_ARG, &t->st, &s->st))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2336  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2337  		if (flow_callback_depth_differs(env, &t->st, &s->st))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2338  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2339  		/* what grows in a loop is not replaced with what is larger, it is forgotten */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2340  		if (!widen && flow_cmp_pkt_range(s, t) <= 0 && flow_within(env, &s->st, &t->st)) {
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2341  			err = flow_unite(flow, s->st.flow_entry, t->st.flow_entry);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2342  			if (err)
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2343  				goto err_free;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2344  			/*
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2345  			 * What a callback comes back with and covers what is there grew, like
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2346  			 * what is joined with it. It counts, or nothing ends "*ctx += 1".
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2347  			 */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2348  			s->joins = max(s->joins, t->joins) + (cycle == FLOW_CALLBACK_CYCLE);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2349  			flow_unlink(env, t);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2350  			flow_free_state(env, t);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2351  			what = what ?: "joined";
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2352  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2353  		}
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2354  		if (!widen && flow_cmp_pkt_range(s, t))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2355  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2356  		if (flow_has_room(env, *nr_states) &&
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2357  		    (flow_unset_differs(&t->st, &s->st) ||
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2358  		     (!widen && flow_join_makes_up(flow, &t->st, &s->st))))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2359  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2360  		/*
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2361  		 * Around a loop too:
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2362  		 *	u8 stack[10], depth = 0;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2363  		 *	loop {
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2364  		 *		if (...) { if (depth >= 10) break; stack[depth++] = x; }
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2365  		 *		else { depth--; if (depth >= 10) break; x = stack[depth]; }
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2366  		 *	}
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2367  		 * depth is in a 32-bit register. A compiler tests 'depth & 255' and computes it
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2368  		 * anew for the index. What is found out about a copy says nothing about
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2369  		 * a range, and everything about a constant.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2370  		 */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2371  		if (flow_has_room(env, *nr_states) &&
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2372  		    flow_needed_consts_differ(flow, FLOW_NEED_STACK_OFF, &t->st, &s->st))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2373  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2374  		if (!widen && flow_has_room(env, *nr_states) &&
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2375  		    flow_needed_consts_differ(flow, FLOW_NEED_PTR_OFF, &t->st, &s->st))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2376  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2377  		err = bpf_states_join(env, &flow->tmp, &t->st, &s->st, widen);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2378  		if (err < 0)
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2379  			goto err_free;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2380  		if (err)
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2381  			continue;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2382  		what = widen ? "widened" : "joined";
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2383  		err = flow_unite(flow, s->st.flow_entry, t->st.flow_entry);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2384  		if (err)
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2385  			goto err_free;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2386  		flow->tmp.flow_entry = t->st.flow_entry;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2387  		flow->tmp.last_insn_idx = s->prev_insn_idx;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2388  		s->joins = max(s->joins, t->joins) + 1;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2389  		bpf_free_verifier_state(&s->st, false);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2390  		s->st = flow->tmp;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2391  		memset(&flow->tmp, 0, sizeof(flow->tmp));
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2392  		flow_unlink(env, t);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2393  		flow_free_state(env, t);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2394  		/* the join may be within, or have a join with, what is left in the set */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2395  		goto again;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2396  	}
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2397  
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2398  	if (*nr_states >= BPF_FLOW_MAX_STATES) {
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2399  		verbose(env, "more than %d states that cannot be joined at insn %d\n",
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2400  			BPF_FLOW_MAX_STATES, insn_idx);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2401  		err = -E2BIG;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2402  		goto err_free;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2403  	}
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2404  	if (flow->live_states > BPF_FLOW_LIVE_PER_INSN * env->prog->len + BPF_FLOW_LIVE_BASE ||
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2405  	    env->total_states >
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2406  	    BPF_FLOW_TOTAL_PER_INSN * (u64)env->prog->len + BPF_FLOW_TOTAL_BASE) {
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2407  		verbose(env, "too many states for %d insns: %d, %d at a time\n",
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2408  			env->prog->len, env->total_states, flow->live_states);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2409  		err = -E2BIG;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2410  		goto err_free;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2411  	}
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2412  	/*
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2413  	 * The state is printed when its turn comes. That says enough about a state that
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2414  	 * is new, and about a state that goes on to the next insn.
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2415  	 */
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2416  	if (prev >= 0 && insn_idx == prev + 1 + bpf_is_ldimm64(&env->prog->insnsi[prev]) &&
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2417  	    what && !strcmp(what, "joined"))
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2418  		what = NULL;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2419  	if (log && what)
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2420  		verbose(env, "from %d to %d: %s\n", prev, insn_idx, what);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2421  	flow_link(env, set, s);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2422  	env->max_states_per_insn = max(env->max_states_per_insn, *nr_states);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2423  	return 0;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2424  
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2425  err_free:
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2426  	flow_free_state(env, s);
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2427  	return err;
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2428  }
9b56d2e47f3ad9 Alexei Starovoitov 2026-11-07  2429  

:::::: The code at line 2301 was first introduced by commit
:::::: 9b56d2e47f3ad9314cf263c419d7540fd0e2893f bpf: Merge the state that arrives into the set at an insn

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
