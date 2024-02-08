Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7012520B00
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Feb 2024 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707419278; cv=none; b=rBYvWdUkNSE5GCCixHeUAY2+R8odz2O5FXoGirJKVkaSSAt3VSHHYy7g93diJyEEPGCCgRW1KNLPeKd5IP8cahZfVG29miIMUhymiZKVSsFo+cuU+dEAJjSAT1P9v+ixDY6albIvmeaPITpZlx58c2bQ3GBIoiD5xI/xUdFqg8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707419278; c=relaxed/simple;
	bh=9MWyfJIvQctd3w5Y51XPG6tS1e+vI6k8crS9h8cr0Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hiV8d4wP4dV7udMHsiFdpR3TZAuMq4eHhB6hkrdP7Cq5HSSTrOafgsAWq0TlbXBWvQbNgopPngoJdgaemD+tqiSAEVoSUNWMWe0ZNhzvlzNzVGntfNnw+hcEf4o+v3EsxGkIYJtkgXVdoGEcLzKeLFeNrr7L7CNWJvcF3VzyoBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/DL15g2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/DL15g2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707419277; x=1738955277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MWyfJIvQctd3w5Y51XPG6tS1e+vI6k8crS9h8cr0Ic=;
  b=i/DL15g2NlRjO/3vM5IfECSO33fyug5lPZEPTx307ZW7NU2zXsRFoq2H
   tliaGV2T5f/9rUQGWRtWLFoPYC76j1GjFdmqxEMA6O14DDP9mzCUuBi17
   RV5I8grfu76pBrbuKg210V74cBD54nMhkDsAnjbupStmvR7ORiD88zOEp
   Ecv1HKnsZhqxzh0M3x+LtdAR6tlS+Zm3xatED1eiMr9t8/A+xxuN/is8y
   07Ig/1XwfWpAxpoOrDULvadmHXqvo3eiGNKrAxDzVqvw97e52Jc2XJFKv
   0X5xdV95M/COYjvQXelTrjq46bF5zGFNzSn37AOOtJt44IwWHmq/kdqL+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="23772945"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="23772945"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 11:07:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6390198"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2024 11:07:54 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY9kW-00042x-1L;
	Thu, 08 Feb 2024 19:07:52 +0000
Date: Fri, 9 Feb 2024 03:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/verifier.c:3284:46: sparse: sparse: subtraction of
 functions? Share your drugs
Message-ID: <202402090246.MFchhW1d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/bpf/verifier.c:3284:46: sparse: sparse: subtraction of functions? Share your drugs"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexei Starovoitov <ast@fb.com>

Hi Alexei,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   047371968ffc470769f541d6933e262dc7085456
commit: e245c5c6a5656e4d61aa7bb08e9694fd6e5b2b9d bpf: move fixup_bpf_calls() function
date:   7 years ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 years ago
config: openrisc-randconfig-s041-20230115 (https://download.01.org/0day-ci/archive/20240209/202402090246.MFchhW1d-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402090246.MFchhW1d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402090246.MFchhW1d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/verifier.c:3284:46: sparse: sparse: subtraction of functions? Share your drugs
   kernel/bpf/verifier.c:3396:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got char [noderef] <asn:1> *[assigned] log_ubuf @@
   kernel/bpf/verifier.c:3396:39: sparse:     expected void *to
   kernel/bpf/verifier.c:3396:39: sparse:     got char [noderef] <asn:1> *[assigned] log_ubuf

vim +3284 kernel/bpf/verifier.c

9bac3d6d548e5c Alexei Starovoitov 2015-03-13  3235  
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3236  /* fixup insn->imm field of bpf_call instructions:
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3237   * if (insn->imm == BPF_FUNC_map_lookup_elem)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3238   *      insn->imm = bpf_map_lookup_elem - __bpf_call_base;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3239   * else if (insn->imm == BPF_FUNC_map_update_elem)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3240   *      insn->imm = bpf_map_update_elem - __bpf_call_base;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3241   * else ...
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3242   *
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3243   * this function is called after eBPF program passed verification
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3244   */
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3245  static void fixup_bpf_calls(struct bpf_prog *prog)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3246  {
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3247  	const struct bpf_func_proto *fn;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3248  	int i;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3249  
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3250  	for (i = 0; i < prog->len; i++) {
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3251  		struct bpf_insn *insn = &prog->insnsi[i];
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3252  
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3253  		if (insn->code == (BPF_JMP | BPF_CALL)) {
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3254  			/* we reach here when program has bpf_call instructions
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3255  			 * and it passed bpf_check(), means that
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3256  			 * ops->get_func_proto must have been supplied, check it
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3257  			 */
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3258  			BUG_ON(!prog->aux->ops->get_func_proto);
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3259  
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3260  			if (insn->imm == BPF_FUNC_get_route_realm)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3261  				prog->dst_needed = 1;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3262  			if (insn->imm == BPF_FUNC_get_prandom_u32)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3263  				bpf_user_rnd_init_once();
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3264  			if (insn->imm == BPF_FUNC_xdp_adjust_head)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3265  				prog->xdp_adjust_head = 1;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3266  			if (insn->imm == BPF_FUNC_tail_call) {
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3267  				/* mark bpf_tail_call as different opcode
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3268  				 * to avoid conditional branch in
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3269  				 * interpeter for every normal call
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3270  				 * and to prevent accidental JITing by
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3271  				 * JIT compiler that doesn't support
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3272  				 * bpf_tail_call yet
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3273  				 */
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3274  				insn->imm = 0;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3275  				insn->code |= BPF_X;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3276  				continue;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3277  			}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3278  
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3279  			fn = prog->aux->ops->get_func_proto(insn->imm);
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3280  			/* all functions that have prototype and verifier allowed
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3281  			 * programs to call them, must be real in-kernel functions
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3282  			 */
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3283  			BUG_ON(!fn->func);
e245c5c6a5656e Alexei Starovoitov 2017-03-15 @3284  			insn->imm = fn->func - __bpf_call_base;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3285  		}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3286  	}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3287  }
e245c5c6a5656e Alexei Starovoitov 2017-03-15  3288  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
