Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542BB27F4E7
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 01:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771203615; cv=none; b=IuXpC3TRxmNVe65NSUti9ixtK7Lt22B7ydHlfviBGW6zYvdJr7zj7nOHSi1SWyY+tKfYfTR8M4c0h0LiJK8g2CtJI5y9hA7KQR3DP3edmjrhgxyICrBjcUakdgULcuhk9jIBzmPTOwff/iqfKRkMeWWCsMR15ugUeqtJUZjdPQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771203615; c=relaxed/simple;
	bh=5CScINLhJpPHVy6CdPXKLioMNAZMwOPYsCBfQSG4lCw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=duFEUg/GoaspQICh0A90+z5FwBlzI4njXXk+dHIw4oGoMuCgPqSctnBURisVBtyQRhTRM3On0IFaqDEMV31FR5UqXm5KLlGwdT5NAkHkVORWW9W9rIfN8GNeYAh+bCHN8+yE6sBEClx+z7noRuW6wQ2mY5zxTIt65KtnjnfQzGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvCaZVMa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvCaZVMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771203613; x=1802739613;
  h=date:from:to:cc:subject:message-id;
  bh=5CScINLhJpPHVy6CdPXKLioMNAZMwOPYsCBfQSG4lCw=;
  b=HvCaZVMa1IFSt9TFQe0Ju6hKs6p8NOe5jGYAo5nL1tRZvZL46LgFQybh
   Dg70WfqArrm+hBdmTVZzcFSSqnk5FAKRg9od0aayWnj8Di0aJFd07qkSH
   MmLbNxk1kaRxXhcHrydD8tv8J0m1XgshUEirNvKQPtxhhhRT9EzbrxOkI
   zta4qZCHK+wGZLDDyrQLvWHSR2yrD3cv9et1vBXNVueb4jusAdt/7qYqm
   GGGKnnR1HVAkJ2Owkteo8AyBVgSJTq5Z/B3SmtIc8JBzfnxFqbRmAegIJ
   Jg+iYLo+h/EwKrxueg9bDV2p1uiqdJ/nxODvssYN9LXq0qGQtD45zC4VT
   A==;
X-CSE-ConnectionGUID: CWbmGtHJSHes6/ikr820pg==
X-CSE-MsgGUID: 2B9pQJ40RFm2TLHhOoIbvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="89876168"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="89876168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 17:00:13 -0800
X-CSE-ConnectionGUID: kRy/KrGZRmy2KNQl1VJU1A==
X-CSE-MsgGUID: e6CBSQxIRTKn0AL0TNjt1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="242647874"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2026 17:00:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrmy9-00000000zHW-34ja;
	Mon, 16 Feb 2026 01:00:09 +0000
Date: Mon, 16 Feb 2026 08:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence:
 '\%'
Message-ID: <202602160856.W0hSbGht-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '\%'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-123-20260215 (https://download.01.org/0day-ci/archive/20260216/202602160856.W0hSbGht-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160856.W0hSbGht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602160856.W0hSbGht-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '%'
>> kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '%'
   kernel/cfi.c:43:1: sparse: sparse: unknown escape sequence: '%'
   kernel/cfi.c:43:1: sparse: sparse: unknown escape sequence: '%'

vim +40 kernel/cfi.c

cf68fffb66d60d Sami Tolvanen 2021-04-08  31  
f1befc82addda9 Sami Tolvanen 2025-08-01  32  /*
f1befc82addda9 Sami Tolvanen 2025-08-01  33   * Declare two non-existent functions with types that match bpf_func_t and
f1befc82addda9 Sami Tolvanen 2025-08-01  34   * bpf_callback_t pointers, and use DEFINE_CFI_TYPE to define type hash
f1befc82addda9 Sami Tolvanen 2025-08-01  35   * variables for each function type. The cfi_bpf_* variables are used by
f1befc82addda9 Sami Tolvanen 2025-08-01  36   * arch-specific BPF JIT implementations to ensure indirectly callable JIT
f1befc82addda9 Sami Tolvanen 2025-08-01  37   * code has matching CFI type hashes.
f1befc82addda9 Sami Tolvanen 2025-08-01  38   */
f1befc82addda9 Sami Tolvanen 2025-08-01  39  extern typeof(*(bpf_func_t)0) __bpf_prog_runX;
f1befc82addda9 Sami Tolvanen 2025-08-01 @40  DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
f1befc82addda9 Sami Tolvanen 2025-08-01  41  

:::::: The code at line 40 was first introduced by commit
:::::: f1befc82addda926c8301436123d041bf3249505 cfi: Move BPF CFI types and helpers to generic code

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
