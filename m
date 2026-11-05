Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843338;
	b=dYRd3Z//ElUuXlTjsF2mxhNy68LUhMZV7/+t99DPFgEDJnmpK++6yG9MX73djRxjbIiL
	 ZsLTU93NiM39G6CS07s0qgKRLfqqSvdpbRt1KReA4QcWUXCdjk85Z7rIRP+pCwuyDVZUQ
	 lu7LGgTVhEMFajzh4czFmSBXem3aPrnLujxj7dqPJ79TEGN4Dyse8HiN73jT51EWglZG/
	 BWRbPpgaWyLOWKIcqaiCLlT9EY3h0hE3caziZVzRDpmJMAqLhbI9o366WC/6SlWOXAesF
	 2d2u9RkmVi8UMnEzAnat8HHOVdwZe0iCEGap5CfqxJ6GTYl8mEIcGy58jFgtj38YJgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843338;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bpi2c+0GLVO9jMt+EqQkAXxqt9XRsANyNu3X9Fw1TIo=;
	b=Sub4Cuow3SbtD+ul5ifaoF7rHR9bHXUVlI1bCBLGl1BXqGUW4GAclVMs7x9IIFdd0vOh
	 zPiy4icAQY1aZTmG6wUQSgu32N/3rXkYab6VOUpoPvKBI6tZefduT80a3CUZ7b1jSzOLA
	 Jnm/3zP1hBkjUADGnPCdGKjFK6rNY6bN+80H4+ISV1bQ289J2cPwKXZpG0rpkuwudPxzL
	 oOgUOE8qPkvCLC2evH5DyqEUTMv2/zjajEnBgsEb122n4ynjcaxFJ3DJQupmwFmYCIxbu
	 nzmd+tSvcdE6jMx9RGHiYJmHgQ+sTj0vi0K25pfEtxIexBsiaKn5Z7nwkQIDrf5OODA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qzbjbeqd;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFC7606A326
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 01:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFC7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qzbjbeqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793843337; x=1825379337;
  h=date:from:to:cc:subject:message-id;
  bh=nBuJd6rhFOyS2m1a0DEhXuc9+d8ua9eEwyy70y9gjb4=;
  b=QzbjbeqdRX1VbVmy25k3dzxTyBL/VT4KNW1Xk8VrHv760V5U0dmEwo7U
   zZkUqMxmRNiLqjODQatKsq0vl/o31cmoiYOq8yZoomgpS5a8b0I6ocvKv
   oo8owD0aAGcZIRlha3lb42jR/a67LrdSzy0gKBgi6syVcZABEzZapXQm9
   2k9/eAZPtJrXk4FaAh4uBe9cVMVI/rF1IRFuxST4HJScK4IwkAT/yLiVv
   aPTL7fdOjKMSUTc2m16mqjGxM2Sd6Y/T1Kg3dt8FvCxvOk7Te9R/FoNqK
   a+HvcRwbT4A9zOQMxeVVPyGX7HCEPXLCw21XfpInk4ZQxMnCbCR0iH2q/
   g==;
X-CSE-ConnectionGUID: 2JcWmB75ST2XLTw+p6xpSQ==
X-CSE-MsgGUID: Qb+/r9MKTRWCsd9ElwTyEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2613256"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2613256"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:48:56 -0800
X-CSE-ConnectionGUID: 5GwHsX4VSLWO3o/qyaHM1w==
X-CSE-MsgGUID: 4BPhhFKbQ4mhIUfBo2pzbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7182231"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2026 17:48:55 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOmay-000000009R1-2fHp;
	Thu, 05 Nov 2026 01:48:52 +0000
Date: Thu, 05 Nov 2026 02:48:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bpf-next:master 55/94] kernel/bpf/scev.c:3332
 bpf_widen_scev_regs() error: we previously assumed 'reg' could be null (see
 line 3320)
Message-ID: <202611050216.7Cy544Mf-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   b3b9fd4dda0953e84e9146c0962fbd0a67014a92
commit: 09c5008302ed2928873970013fac5cb677510461 [55/94] bpf: Describe more registers of a counted loop
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
config: arc-randconfig-2200-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050216.7Cy544Mf-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611050216.7Cy544Mf-lkp@intel.com/

smatch warnings:
kernel/bpf/scev.c:3332 bpf_widen_scev_regs() error: we previously assumed 'reg' could be null (see line 3320)

vim +/reg +3332 kernel/bpf/scev.c

6ccf49f7932781 Eduard Zingerman   2026-10-09  3287  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3288  int bpf_widen_scev_regs(struct bpf_verifier_env *env, struct bpf_verifier_state *st,
6ccf49f7932781 Eduard Zingerman   2026-10-09  3289  			struct bpf_verifier_state *loop_entry, struct bpf_loop_iters *iters)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3290  {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3291  	struct bpf_func_state *cur_func = st->frame[st->curframe];
6ccf49f7932781 Eduard Zingerman   2026-10-09  3292  	struct bpf_func_state *entry_func = loop_entry->frame[loop_entry->curframe];
6ccf49f7932781 Eduard Zingerman   2026-10-09  3293  	struct bpf_verifier_log *log = &env->log;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3294  	struct scev *scev = env->scev;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3295  	struct bpf_reg_state *reg;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3296  	struct env *header_env;
32e962577d2d8a Eduard Zingerman   2026-10-20  3297  	struct linear_coefs coefs;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3298  	struct bounds bounds;
32e962577d2d8a Eduard Zingerman   2026-10-20  3299  	u32 r, r_expr, a, b;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3300  	int insn_idx = st->insn_idx;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3301  	int err;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3302  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3303  	for_each_set_bit(r, iters->precise_regs, REGS_NUM) {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3304  		if (r < MAX_BPF_REG)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3305  			bpf_bt_set_frame_reg(&env->bt, st->curframe, r);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3306  		else
6ccf49f7932781 Eduard Zingerman   2026-10-09  3307  			bpf_bt_set_frame_slot(&env->bt, st->curframe, r - MAX_BPF_REG);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3308  	}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3309  	err = bpf_mark_chain_precision(env, st, -1, NULL);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3310  	if (err)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3311  		return err;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3312  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3313  	header_env = find_header_env(scev, insn_idx);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3314  	for (r = 0; r < REGS_NUM; r++) {
09c5008302ed29 Alexei Starovoitov 2026-11-03  3315  		if (!scev_reg_alive(env, st, r) || is_unbound_scev_reg(env, cur_func, r) ||
09c5008302ed29 Alexei Starovoitov 2026-11-03  3316  		    is_const_scev_reg(env, insn_idx, r))
09c5008302ed29 Alexei Starovoitov 2026-11-03  3317  			continue;
09c5008302ed29 Alexei Starovoitov 2026-11-03  3318  
09c5008302ed29 Alexei Starovoitov 2026-11-03  3319  		reg = scev_reg_for_linear(cur_func, r);
09c5008302ed29 Alexei Starovoitov 2026-11-03 @3320  		if (reg && reg->type == PTR_TO_ARENA)
09c5008302ed29 Alexei Starovoitov 2026-11-03  3321  			continue;
09c5008302ed29 Alexei Starovoitov 2026-11-03  3322  
09c5008302ed29 Alexei Starovoitov 2026-11-03  3323  		if (test_bit(r, iters->mask_regs)) {
09c5008302ed29 Alexei Starovoitov 2026-11-03  3324  			/* The range stays. It's no longer equal to the registers with its id. */
09c5008302ed29 Alexei Starovoitov 2026-11-03  3325  			err = scev_reg_for_write(env, cur_func, r, &reg);
09c5008302ed29 Alexei Starovoitov 2026-11-03  3326  			if (err)
09c5008302ed29 Alexei Starovoitov 2026-11-03  3327  				return err;
09c5008302ed29 Alexei Starovoitov 2026-11-03  3328  			if (log->level & BPF_LOG_LEVEL2) {
09c5008302ed29 Alexei Starovoitov 2026-11-03  3329  				bpf_log(log, "loop header at %d, ", insn_idx);
09c5008302ed29 Alexei Starovoitov 2026-11-03  3330  				log_reg(env, r);
09c5008302ed29 Alexei Starovoitov 2026-11-03  3331  				bpf_log(log, " stays in 0..%llu, it loses bits only\n",
09c5008302ed29 Alexei Starovoitov 2026-11-03 @3332  					reg_umax(reg));
09c5008302ed29 Alexei Starovoitov 2026-11-03  3333  			}
09c5008302ed29 Alexei Starovoitov 2026-11-03  3334  			scratch_widened_reg_id(env, reg);
09c5008302ed29 Alexei Starovoitov 2026-11-03  3335  			mark_scev_reg_scratched(env, r);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3336  			continue;
09c5008302ed29 Alexei Starovoitov 2026-11-03  3337  		}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3338  
6ccf49f7932781 Eduard Zingerman   2026-10-09  3339  		r_expr = header_env->reg2scev[r];
6ccf49f7932781 Eduard Zingerman   2026-10-09  3340  		/* If SCEV for r is (linear <reg> <slope>)*/
32e962577d2d8a Eduard Zingerman   2026-10-20  3341  		if (is_simple_linear(scev, r_expr, &coefs) && coefs.base_reg == r) {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3342  			err = scev_reg_for_write(env, cur_func, r, &reg);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3343  			if (err)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3344  				return err;
32e962577d2d8a Eduard Zingerman   2026-10-20  3345  			linear_bounds(reg, iters->max_header_count, &coefs, &bounds);
1e589fdc85a8f6 Alexei Starovoitov 2026-11-03  3346  			if (r == iters->iv_reg)
1e589fdc85a8f6 Alexei Starovoitov 2026-11-03  3347  				iv_bounds(&bounds, iters->iv_range);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3348  			if (log->level & BPF_LOG_LEVEL2) {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3349  				bpf_log(log, "loop header at %d, widening ", insn_idx);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3350  				log_reg(env, r);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3351  				bpf_log(log, " to ");
32e962577d2d8a Eduard Zingerman   2026-10-20  3352  				log_bounds(env, &bounds);
32e962577d2d8a Eduard Zingerman   2026-10-20  3353  				bpf_log(log, "\n");
6ccf49f7932781 Eduard Zingerman   2026-10-09  3354  			}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3355  			scratch_widened_reg_id(env, reg);
88e2c896d8598a Alexei Starovoitov 2026-10-30  3356  			/* "at pkt_end" and "beyond pkt_end" are not valid in all iterations */
88e2c896d8598a Alexei Starovoitov 2026-10-30  3357  			if (type_is_pkt_pointer(reg->type))
88e2c896d8598a Alexei Starovoitov 2026-10-30  3358  				reg->range = max(reg->range, 0);
32e962577d2d8a Eduard Zingerman   2026-10-20  3359  			err = bpf_set_reg_range(env, reg, bounds.r64, bounds.r32,
32e962577d2d8a Eduard Zingerman   2026-10-20  3360  						bounds.base, bounds.step);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3361  			if (err)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3362  				return err;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3363  			mark_scev_reg_scratched(env, r);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3364  		} else if (is_any(scev, r_expr, &a, &b)) {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3365  			err = scev_reg_for_write(env, cur_func, r, &reg);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3366  			if (err)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3367  				return err;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3368  			err = union_any_reg(env, entry_func, reg, r_expr);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3369  			if (err)
6ccf49f7932781 Eduard Zingerman   2026-10-09  3370  				return err;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3371  			if (log->level & BPF_LOG_LEVEL2) {
6ccf49f7932781 Eduard Zingerman   2026-10-09  3372  				bpf_log(log, "loop header at %d, widening ", insn_idx);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3373  				log_reg(env, r);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3374  				bpf_log(log, " to ");
6ccf49f7932781 Eduard Zingerman   2026-10-09  3375  				bpf_verbose_snum(env, reg_smin(reg));
6ccf49f7932781 Eduard Zingerman   2026-10-09  3376  				bpf_log(log, "..");
6ccf49f7932781 Eduard Zingerman   2026-10-09  3377  				bpf_verbose_snum(env, reg_smax(reg));
6ccf49f7932781 Eduard Zingerman   2026-10-09  3378  				bpf_log(log, " step %u\n", reg->step);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3379  			}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3380  			scratch_widened_reg_id(env, reg);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3381  			mark_scev_reg_scratched(env, r);
6ccf49f7932781 Eduard Zingerman   2026-10-09  3382  		}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3383  	}
6ccf49f7932781 Eduard Zingerman   2026-10-09  3384  	return 1;
6ccf49f7932781 Eduard Zingerman   2026-10-09  3385  }
6ccf49f7932781 Eduard Zingerman   2026-10-09  3386  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
