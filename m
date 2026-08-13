Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402AF453A59
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619723; cv=none; b=Q+KKjdBvhEdoZVxcVvyNH6otkKBrWBdRjRShBlLb72ImYF6j8LkZpltA186/FhsuAQ5yeUbAmsBjf/7JCV/1fDLVEmL+Dsdq1oklQWCC7nnv6qSaRl9W2XwTgam3AjM5AK+WM9AKK43/mhm6ImA2sA9yy6Z7M934h+hgEIkLnyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619723; c=relaxed/simple;
	bh=A41R0ippYdQTlRWkTtKX9bCmPPLWzq7oEXEqH8LlHUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CsYnKpFzGgIfOApDowFz3LBXtQISxG6fx42+afyr61tM7XE7EorTK89VhLe1QdZeTLJN+PPGFwvEDvaoIc4i8HJteBs5ct3tnVMcXa4LyE6bLcn8o5EHDSw5xdY9BGePZONYdVdzmnTqilo+VX6cqtnP7aK8JEWiSWL3taNWKxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEFCHUDq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEFCHUDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786619716; x=1818155716;
  h=date:from:to:cc:subject:message-id;
  bh=A41R0ippYdQTlRWkTtKX9bCmPPLWzq7oEXEqH8LlHUc=;
  b=aEFCHUDq5iNroHHMJN2I/Hi2RniuWHjeJB8OPSNFXxd3rO5UQQCRyI3b
   L2OxZyvD7ZflHe0nEkNoq94bpdqzP8cquSVGetW/qKbh89eIGY1vGwKVv
   drdj7YdkzuCmxr8ZUuAUPXgAjUndqWkW/FCCz9M9SFuRT0Wzxte94EtRv
   Vmp7gpz++RFSUw+n41dkadYFZmDXfJ8M3cHVys/ZQeTdM5499MStEpYEP
   MnM2XsArcmD0idYCJ9h1Mly6KlTKF9FZmtL306jsfU+p7PTBrVcJpVXxF
   u8grkHus43ZkEzYaFYkGloVafzNoaEAdMIjPGenHXhlq18HFCWbQqxP0a
   g==;
X-CSE-ConnectionGUID: p3MvUPBRRw2M7D3ZxKStZw==
X-CSE-MsgGUID: LtUSRIzlTW2W3t+I0ZvO+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87051380"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87051380"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:15:10 -0700
X-CSE-ConnectionGUID: 2YCf84LaSyicaV9953p5VQ==
X-CSE-MsgGUID: yN5/7c2IR6+U8oBca6hqfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="259670567"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Aug 2026 04:15:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTOs-00000000Tng-064S;
	Thu, 13 Aug 2026 11:15:06 +0000
Date: Thu, 13 Aug 2026 19:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:master 5/16] kernel/bpf/diagnostics.c:863
 reg_to_target() error: buffer overflow 'state->regs' 11 <= 11
Message-ID: <202608131943.Ew29HxTJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux master
head:   e2bbb4761d332a66c9bc34c07069d862440cf7a7
commit: 20fdb5545829a10d76a8586053a22e7930bf4389 [5/16] bpf: Track verifier register diagnostic events
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sh-randconfig-r071-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131943.Ew29HxTJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608131943.Ew29HxTJ-lkp@intel.com/

smatch warnings:
kernel/bpf/diagnostics.c:863 reg_to_target() error: buffer overflow 'state->regs' 11 <= 11

vim +863 kernel/bpf/diagnostics.c

20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  848  
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  849  static bool reg_to_target(struct bpf_verifier_env *env, const struct bpf_reg_state *reg,
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  850  			  struct bpf_diag_mod_target *target)
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  851  {
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  852  	struct bpf_verifier_state *vstate = env->cur_state;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  853  	unsigned long addr = (unsigned long)reg;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  854  	int frame;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  855  
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  856  	for (frame = 0; frame <= vstate->curframe; frame++) {
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  857  		struct bpf_func_state *state = vstate->frame[frame];
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  858  		unsigned long start, end;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  859  		u32 nslots = state->allocated_stack / BPF_REG_SIZE;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  860  		int spi;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  861  
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  862  		start = (unsigned long)state->regs;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13 @863  		end = (unsigned long)(state->regs + MAX_BPF_REG);
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  864  		if (addr >= start && addr < end) {
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  865  			*target = bpf_diag_reg_target(state->frameno, reg - state->regs);
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  866  			return true;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  867  		}
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  868  
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  869  		start = (unsigned long)state->stack_arg_regs;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  870  		end = (unsigned long)(state->stack_arg_regs + state->out_stack_arg_cnt);
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  871  		if (state->out_stack_arg_cnt && addr >= start && addr < end) {
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  872  			*target = bpf_diag_stack_arg_target(state->frameno,
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  873  							    reg - state->stack_arg_regs);
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  874  			return true;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  875  		}
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  876  
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  877  		start = (unsigned long)state->stack;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  878  		end = (unsigned long)(state->stack + nslots);
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  879  		if (nslots && addr >= start && addr < end) {
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  880  			spi = ((const char *)reg - (const char *)state->stack) /
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  881  			      sizeof(*state->stack);
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  882  			*target = bpf_diag_stack_slot_target(state->frameno, spi);
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  883  			return true;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  884  		}
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  885  	}
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  886  	return false;
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  887  }
20fdb5545829a1 Kumar Kartikeya Dwivedi 2026-07-13  888  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
