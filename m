Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3D37F00F
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973527; cv=none; b=fGOar3jq3/ecKqBY7YbcZZz26bUswYlwUg0Dw5Y+ScrHZCKf2P6aygBvCJVclvFnoyChXCFQGHrhmbQsbLw/IbhhGrG5uBtVvSjNQ2QITYUWdNGhnSe88+pt6p/1NLtvLgQOxJYosEMBoaOPZ0fQOtTDLMxt3z0nNA2I8OxLtEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973527; c=relaxed/simple;
	bh=iJD79qyT/oLpvke8X476TH38H6qa+QR6UbKuf7KHk/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=inc1O9KH4t0i2a35fOLb6XVFnsUGI8/89j74ySVre+f/y/vkyiKaw4rsPGYYykWbnw6hzSn5YORDqxSL3ykNP3tvGm/0kwnJW56jS7Okj376+CwpT+IidwSc+NQAJR6kC4AJjqUFstVuHgOvnE/Uk0Yee3xUz0JY4cLVnrkSOh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLG3LlGj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLG3LlGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774973526; x=1806509526;
  h=date:from:to:cc:subject:message-id;
  bh=iJD79qyT/oLpvke8X476TH38H6qa+QR6UbKuf7KHk/c=;
  b=fLG3LlGjytCrzcJ3tU0HEzWNcJaDFjVePELio21mt94kyKmY5QiW5eHm
   okpZ1Vx6+CSUPquoVwBBrZsmQm4IWcAop12sggJL4zdnt9PTmyqr2QxkJ
   nG/H0h5gCsnC6pPlW5rr9aipLo8Op34rLWwITjz3+lCVdjuMO/OArxQQR
   3KeuW8QP8Jo1DTLAjbuLlW+ziUXOTq5qHsCKGniXtd9/g4RgQ5Xj7YJ+s
   o1nfewmo4lTBG9wIX9LyLAA0QwH0mMHX/CqurFlOud+eSgPS5PrP/DJNP
   HnUabGroxp0xViVkJw1H4tppKMQsqjSCBPkSqO37L5VLkenVR5fTICXxz
   w==;
X-CSE-ConnectionGUID: 6fYuIV5rTUu7pHfyv6L8tg==
X-CSE-MsgGUID: FOnngpauT0CG3/U3fDD7nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76185897"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76185897"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 09:11:49 -0700
X-CSE-ConnectionGUID: bAD4VWOoTpyCdhAmrGWCOA==
X-CSE-MsgGUID: 4hgSQC9ARES4XqZ2Igx6hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="256905353"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Mar 2026 09:11:48 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7bgv-000000002sD-1l3z;
	Tue, 31 Mar 2026 16:11:45 +0000
Date: Wed, 01 Apr 2026 00:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/boot/compressed/sev-handle-vc.c:104
 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null
 (see line 101)
Message-ID: <202604010025.l8HRHp4R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

Hi Ard,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: ed4d95d033e359f9445e85bf5a768a5859a5830b x86/sev: Disentangle #VC handling code from startup code
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010025.l8HRHp4R-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604010025.l8HRHp4R-lkp@intel.com/

smatch warnings:
arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null (see line 101)

vim +/boot_ghcb +104 arch/x86/boot/compressed/sev-handle-vc.c

ed4d95d033e359 Ard Biesheuvel 2025-05-04   95  
ed4d95d033e359 Ard Biesheuvel 2025-05-04   96  void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
ed4d95d033e359 Ard Biesheuvel 2025-05-04   97  {
ed4d95d033e359 Ard Biesheuvel 2025-05-04   98  	struct es_em_ctxt ctxt;
ed4d95d033e359 Ard Biesheuvel 2025-05-04   99  	enum es_result result;
ed4d95d033e359 Ard Biesheuvel 2025-05-04  100  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @101  	if (!boot_ghcb && !early_setup_ghcb())
ed4d95d033e359 Ard Biesheuvel 2025-05-04  102  		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
ed4d95d033e359 Ard Biesheuvel 2025-05-04  103  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @104  	vc_ghcb_invalidate(boot_ghcb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
