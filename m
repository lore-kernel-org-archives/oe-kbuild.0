Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5724B38737D
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295872; cv=none; b=T8pvUtH/domQWqVjXYYtlU5zjQGjV4h30j1HQffPVOHvd26X9MbC5nXgXtlvoAOkVR5V1vrEwT85MXiMiSAF82hn6s0o5xlK7R/od9WjHCH6BYb6/DXuguVBNqkd9GvGZmYyXGVvv5/W4u8owt1oz2mcN/LimeRUlEN7FdM1dpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295872; c=relaxed/simple;
	bh=fJBbY8fqu9nz6YXXCvaa3kioU9j1v4PNDtEcsTcQkqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=feFguXJWK8vE5yVRTh3ag465ZvHkTHzZDWxvASkzXD+UDhagXySnNx+rAjo/si4qRmMsen13RlKDUQcUpY7pVjQYeW+4rBS9CBZhR/Dp2DyzjHUYFKcRKlKm48ZpvaJzHv8bSwuzb6Rj9i36JzAIcZsysEx4ZIuk12I3euMgel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWC3Ekqc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWC3Ekqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768295869; x=1799831869;
  h=date:from:to:cc:subject:message-id;
  bh=fJBbY8fqu9nz6YXXCvaa3kioU9j1v4PNDtEcsTcQkqM=;
  b=cWC3EkqcgjuGFaZpPXudHQcK418+QQl+fTTQhUUZbJ/mjqyzJXdjtOzx
   9O6pkez0tTTvVxR83FANNF0XbLgYmo2PKxz0zdC+9Y5a2OeFr4vSisIyO
   31kJKEng/xgj/o3TNTOSIzl1JfBjv5iM/NNhhMN+/bfPWSHf05/JH4yjn
   D3G0K5DALtX80EV/cG2E5m+9zDe4svlmEG317CO1TMlNuciMF3ULngvP7
   Y45RtPA0DINM8ORVq4/I+PJDGrmZnT996sn3go57Ld21htOHnQWsjauEq
   2IkOTE18W88ws1ryME4+TXt7T3OTqMia6z0m04OAnZcwxux/tNn8SMhwd
   A==;
X-CSE-ConnectionGUID: HV8vn0rIT0qDvZaTOJf8pw==
X-CSE-MsgGUID: LCkXZxyUSmyp8JCd0ePRWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69498672"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69498672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:17:46 -0800
X-CSE-ConnectionGUID: YGVhHNqAS+GtwHkJTvxd6Q==
X-CSE-MsgGUID: XRwe7MupSA2V7obb+fiZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204230236"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 01:17:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfaX0-00000000EWk-3SWJ;
	Tue, 13 Jan 2026 09:17:42 +0000
Date: Tue, 13 Jan 2026 17:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence:
 '\%'
Message-ID: <202601131752.Rv9kdsQ5-lkp@intel.com>
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
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-121-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131752.Rv9kdsQ5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131752.Rv9kdsQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601131752.Rv9kdsQ5-lkp@intel.com/

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
