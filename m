Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B7CA41
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 02:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738982330; cv=none; b=ua86xoprLaFKwxAWYbj/9ez2RHtuu7PbH/OdLehcHsD8N43s9av4xfDzMn7x3EPGLKojh2rqDLGYdzIkGLXPcAfMnNao3msBryef0TR0mzQfYdlmLkJvNmFa9dg2nG9/UahRmEAHXrclauxby6AmBCaFbQ1gxAm+pIjFei1leKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738982330; c=relaxed/simple;
	bh=RejsS9NdsFWSUCoqR0ANFcZCQiSM+ADBRFxA0UgCCW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GAF4nBxZvyornjmXpcts1PL2Ikl420VQhbMNRY2Aki9cwohcRRY4nsfcPBSqlwGAdPz3//dkHu8EaBH1qybqxU0RXN/CfHAigUX6auLFFuUUtLHuzEujDEBMpeF0lHXxUqCQeGDvSho94/8UTtLPyNEjUCZc+muzQ5YfQryigfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUO0jKj8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUO0jKj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738982329; x=1770518329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RejsS9NdsFWSUCoqR0ANFcZCQiSM+ADBRFxA0UgCCW0=;
  b=aUO0jKj8wz+1X6VkHO1u0us3nUi1yYok/i/38faBSGw6DRzx2l5nTcXT
   u3gHDI3Qa9QivrSBgksBLyWKGvoSGX8NU0ba7A1fYqUFVgvlO0S7OAkWV
   cnOaj0OvgKz5RCdUysZu2BBThF/MBBpmlyVXbjpT9tmOjcMu9XSBen+TL
   eK+QZTVMFT0HzO0/fFbkASEU0CzsAHXwY29k2MVzfR0w6IA27mWij3rDs
   msKBXuQPN+s2JWOUb/7bA8zG98tGYgCOi1JUBbNF+axAXxqYGC+qhzSE/
   8m+9IZHDVKBK24PqdJd0V1AwOZ1kViU16fMh+JYt2RIcKqXerrQemPAmW
   g==;
X-CSE-ConnectionGUID: SW3kduvpRI6xRvdFtSYACA==
X-CSE-MsgGUID: f2MNIsPkReC5CbbwGojKdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38833330"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="38833330"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 18:38:48 -0800
X-CSE-ConnectionGUID: xWijqqnMRLqGe2ba9x4WQA==
X-CSE-MsgGUID: Pr1UMEgVQZ6Z8fYjuggnFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148890081"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Feb 2025 18:38:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgak0-000zPz-29;
	Sat, 08 Feb 2025 02:38:44 +0000
Date: Sat, 8 Feb 2025 10:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rgushchin:sframe_unwinder.rfc 6/8]
 arch/arm64/kernel/stacktrace.c:317 kunwind_next() error: uninitialized
 symbol 'err'.
Message-ID: <202502081057.X3H859Hx-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git sframe_unwinder.rfc
head:   0cc3157743fd72033cfa5de243943249f9d67cea
commit: 15aeab1a240cbf8183562d48028d84121e945308 [6/8] unwind: arm64: add reliable stacktrace support for arm64
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-r072-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081057.X3H859Hx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502081057.X3H859Hx-lkp@intel.com/

smatch warnings:
arch/arm64/kernel/stacktrace.c:317 kunwind_next() error: uninitialized symbol 'err'.

vim +/err +317 arch/arm64/kernel/stacktrace.c

2abe944a4cb43d Weinan Liu   2025-01-25  292  
4e00532f373659 Marc Zyngier 2022-07-27  293  /*
4e00532f373659 Marc Zyngier 2022-07-27  294   * Unwind from one frame record (A) to the next frame record (B).
4e00532f373659 Marc Zyngier 2022-07-27  295   *
4e00532f373659 Marc Zyngier 2022-07-27  296   * We terminate early if the location of B indicates a malformed chain of frame
4e00532f373659 Marc Zyngier 2022-07-27  297   * records (e.g. a cycle), determined based on the location and fp value of A
4e00532f373659 Marc Zyngier 2022-07-27  298   * and the location (but not the fp value) of B.
4e00532f373659 Marc Zyngier 2022-07-27  299   */
b5ecc19e684eee Mark Rutland 2023-04-11  300  static __always_inline int
1beef60e7d6b90 Mark Rutland 2023-11-24  301  kunwind_next(struct kunwind_state *state)
4e00532f373659 Marc Zyngier 2022-07-27  302  {
4e00532f373659 Marc Zyngier 2022-07-27  303  	int err;
4e00532f373659 Marc Zyngier 2022-07-27  304  
8094df1cf09248 Mark Rutland 2024-10-17  305  	state->flags.all = 0;
8094df1cf09248 Mark Rutland 2024-10-17  306  
bdf8eafbf7f56f Mark Rutland 2024-10-17  307  	switch (state->source) {
bdf8eafbf7f56f Mark Rutland 2024-10-17  308  	case KUNWIND_SOURCE_FRAME:
bdf8eafbf7f56f Mark Rutland 2024-10-17  309  	case KUNWIND_SOURCE_CALLER:
bdf8eafbf7f56f Mark Rutland 2024-10-17  310  	case KUNWIND_SOURCE_TASK:
bdf8eafbf7f56f Mark Rutland 2024-10-17  311  	case KUNWIND_SOURCE_REGS_PC:
2abe944a4cb43d Weinan Liu   2025-01-25  312  #ifdef CONFIG_SFRAME_UNWINDER
15aeab1a240cbf Weinan Liu   2025-01-25  313  	if (!state->common.unreliable)
2abe944a4cb43d Weinan Liu   2025-01-25  314  		err = unwind_next_frame_sframe(&state->common);
2abe944a4cb43d Weinan Liu   2025-01-25  315  
2abe944a4cb43d Weinan Liu   2025-01-25  316  	/* Fallback to FP based unwinder */
15aeab1a240cbf Weinan Liu   2025-01-25 @317  	if (err || state->common.unreliable) {
32ed1205682ec4 Mark Rutland 2024-12-11  318  		err = kunwind_next_frame_record(state);
15aeab1a240cbf Weinan Liu   2025-01-25  319  		/* Mark its stacktrace result as unreliable if it is unwindable via FP */
15aeab1a240cbf Weinan Liu   2025-01-25  320  		if (!err)
15aeab1a240cbf Weinan Liu   2025-01-25  321  			state->common.unreliable = true;
15aeab1a240cbf Weinan Liu   2025-01-25  322  	}
2abe944a4cb43d Weinan Liu   2025-01-25  323  #else
2abe944a4cb43d Weinan Liu   2025-01-25  324  	err = kunwind_next_frame_record(state);
2abe944a4cb43d Weinan Liu   2025-01-25  325  #endif
bdf8eafbf7f56f Mark Rutland 2024-10-17  326  		break;
bdf8eafbf7f56f Mark Rutland 2024-10-17  327  	default:
c2c6b27b5aa14f Mark Rutland 2024-10-17  328  		err = -EINVAL;
bdf8eafbf7f56f Mark Rutland 2024-10-17  329  	}
4e00532f373659 Marc Zyngier 2022-07-27  330  
c2c6b27b5aa14f Mark Rutland 2024-10-17  331  	if (err)
c2c6b27b5aa14f Mark Rutland 2024-10-17  332  		return err;
c2c6b27b5aa14f Mark Rutland 2024-10-17  333  
1beef60e7d6b90 Mark Rutland 2023-11-24  334  	state->common.pc = ptrauth_strip_kernel_insn_pac(state->common.pc);
4e00532f373659 Marc Zyngier 2022-07-27  335  
1beef60e7d6b90 Mark Rutland 2023-11-24  336  	return kunwind_recover_return_address(state);
4e00532f373659 Marc Zyngier 2022-07-27  337  }
4e00532f373659 Marc Zyngier 2022-07-27  338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
