Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE43D16F0
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778494873; cv=none; b=emDFahH/udzIfvzbO3OQDFn22OUIrllZKbz/6C7U9nvI17tmuqQD+2Cj3A6Rq8I9eLJDJmzlKPgg8uYqL6tErMsX+ixO64k8BYiryEYSnWXZkl4RTE5OVNCeYihldwwF6mC8QhYFLlKwJKHgFmXCaqyHW/lsMRr3wyKVVEpg57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778494873; c=relaxed/simple;
	bh=9eS+HfZ8SzEg5N7YX4dOz/IeTe3U3sd0XCf141nI1QU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sLmiGTHAPp24ys2DXtUzN6q7lGzgIutOpsc6fnRTSfrJLPc22XvEYW5nxaijCGe6ISCh0wOB8r/fz87ChSuayPbgBGxVpEjfheYi4Y4pnk7vGRJMLooDoBYg4aalpOI1782XYxxbxxEFr1TVwe+N5dFCHsSP4dilIY/bkRNnbEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qp4NoIfE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp4NoIfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778494870; x=1810030870;
  h=date:from:to:cc:subject:message-id;
  bh=9eS+HfZ8SzEg5N7YX4dOz/IeTe3U3sd0XCf141nI1QU=;
  b=Qp4NoIfETf5JdT4b1jNbv6tKQaVsb4yjAwW7Usfa1d1Gng5p3uzMSKJK
   eCdRwXKh6un9UeowROeYs2VWUYeSGBKUI6rCVjg9n8KTlnkWyUBtfy/67
   RvhweObCImVKt7Q3LjIKoutaqRHxOobv2K/yfMd/52fIQJbosifGL/z1G
   3XsL1HpqOXE5z9KQBQ1gTmLr0lSNNmUfEhfIuNMVT2eO4yA3gqcUvzlvh
   E/AldWoBLqE+WFHRHCFYvrjsvtwTbx2ev7+p/JV+aNap/jEuTiqdogIJb
   RGJsXX8eXoN67S63FZKPYzRljRFdBrq3KVRMso3f8iSzmv+QwpG4W1adr
   A==;
X-CSE-ConnectionGUID: wK2P5AhoT6GPMwQGFm8ytA==
X-CSE-MsgGUID: QLqFrYd5STeN/cDhAeccUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79478610"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79478610"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:21:09 -0700
X-CSE-ConnectionGUID: SBgy8gWTTeSFCLn2Bnd0Wg==
X-CSE-MsgGUID: LDobffSqRSqYqYq7fNNI4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="242399325"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2026 03:21:08 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMNl3-000000007wD-48Zf;
	Mon, 11 May 2026 10:21:05 +0000
Date: Mon, 11 May 2026 12:20:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/verifier.c:4093:32: warning: variable 'cur' set
 but not used
Message-ID: <202605111202.qmh6zPoP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yonghong Song <yonghong.song@linux.dev>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/bpf-Convert-bpf_get_spilled_reg-macro-to-static-inline-function/20260511-112428
head:   089e6bd1b56ba97a33e4029819cb8294af6f5ea5
commit: f378c36d9e685e6223e02b81b0462e69734ed4d7 bpf: Support stack arguments for bpf functions
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260511/202605111202.qmh6zPoP-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111202.qmh6zPoP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605111202.qmh6zPoP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'check_stack_arg_write':
>> kernel/bpf/verifier.c:4093:32: warning: variable 'cur' set but not used [-Wunused-but-set-variable]
    4093 |         struct bpf_func_state *cur;
         |                                ^~~


vim +/cur +4093 kernel/bpf/verifier.c

e4298d25830a86 Daniel Borkmann 2019-01-03  4082  
f378c36d9e685e Yonghong Song   2026-05-07  4083  /*
f378c36d9e685e Yonghong Song   2026-05-07  4084   * Write a value to the outgoing stack arg area.
f378c36d9e685e Yonghong Song   2026-05-07  4085   * off is a negative offset from r11 (e.g. -8 for arg6, -16 for arg7).
f378c36d9e685e Yonghong Song   2026-05-07  4086   */
f378c36d9e685e Yonghong Song   2026-05-07  4087  static int check_stack_arg_write(struct bpf_verifier_env *env, struct bpf_func_state *state,
f378c36d9e685e Yonghong Song   2026-05-07  4088  				 int off, struct bpf_reg_state *value_reg)
f378c36d9e685e Yonghong Song   2026-05-07  4089  {
f378c36d9e685e Yonghong Song   2026-05-07  4090  	int max_stack_arg_regs = MAX_BPF_FUNC_ARGS - MAX_BPF_FUNC_REG_ARGS;
f378c36d9e685e Yonghong Song   2026-05-07  4091  	struct bpf_subprog_info *subprog = &env->subprog_info[state->subprogno];
f378c36d9e685e Yonghong Song   2026-05-07  4092  	int spi = -off / BPF_REG_SIZE - 1;
f378c36d9e685e Yonghong Song   2026-05-07 @4093  	struct bpf_func_state *cur;
f378c36d9e685e Yonghong Song   2026-05-07  4094  	struct bpf_reg_state *arg;
f378c36d9e685e Yonghong Song   2026-05-07  4095  	int err;
f378c36d9e685e Yonghong Song   2026-05-07  4096  
f378c36d9e685e Yonghong Song   2026-05-07  4097  	if (spi >= max_stack_arg_regs) {
f378c36d9e685e Yonghong Song   2026-05-07  4098  		verbose(env, "stack arg write offset %d exceeds max %d stack args\n",
f378c36d9e685e Yonghong Song   2026-05-07  4099  			off, max_stack_arg_regs);
f378c36d9e685e Yonghong Song   2026-05-07  4100  		return -EINVAL;
f378c36d9e685e Yonghong Song   2026-05-07  4101  	}
f378c36d9e685e Yonghong Song   2026-05-07  4102  
f378c36d9e685e Yonghong Song   2026-05-07  4103  	err = grow_stack_arg_slots(env, state, spi + 1);
f378c36d9e685e Yonghong Song   2026-05-07  4104  	if (err)
f378c36d9e685e Yonghong Song   2026-05-07  4105  		return err;
f378c36d9e685e Yonghong Song   2026-05-07  4106  
f378c36d9e685e Yonghong Song   2026-05-07  4107  	/* Track the max outgoing stack arg slot count. */
f378c36d9e685e Yonghong Song   2026-05-07  4108  	if (spi + 1 > subprog->max_out_stack_arg_cnt)
f378c36d9e685e Yonghong Song   2026-05-07  4109  		subprog->max_out_stack_arg_cnt = spi + 1;
f378c36d9e685e Yonghong Song   2026-05-07  4110  
f378c36d9e685e Yonghong Song   2026-05-07  4111  	cur = env->cur_state->frame[env->cur_state->curframe];
f378c36d9e685e Yonghong Song   2026-05-07  4112  	if (value_reg) {
f378c36d9e685e Yonghong Song   2026-05-07  4113  		state->stack_arg_regs[spi] = *value_reg;
f378c36d9e685e Yonghong Song   2026-05-07  4114  	} else {
f378c36d9e685e Yonghong Song   2026-05-07  4115  		/* BPF_ST: store immediate, treat as scalar */
f378c36d9e685e Yonghong Song   2026-05-07  4116  		arg = &state->stack_arg_regs[spi];
f378c36d9e685e Yonghong Song   2026-05-07  4117  		arg->type = SCALAR_VALUE;
f378c36d9e685e Yonghong Song   2026-05-07  4118  		__mark_reg_known(arg, env->prog->insnsi[env->insn_idx].imm);
f378c36d9e685e Yonghong Song   2026-05-07  4119  	}
f378c36d9e685e Yonghong Song   2026-05-07  4120  	state->no_stack_arg_load = true;
f378c36d9e685e Yonghong Song   2026-05-07  4121  	return 0;
f378c36d9e685e Yonghong Song   2026-05-07  4122  }
f378c36d9e685e Yonghong Song   2026-05-07  4123  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
