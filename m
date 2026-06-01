Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98371311958
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341663; cv=none; b=erZsiQUXa4MRJ8iEj+0du1emK7qigVlgKrTy5M7C1JcE1C74PxfrkdPdvaI2Ca7fnnWVZScWgIglhLdCLxwlegY8/tYTTLVvTazitSd92n+NAO0AMHah9EkBKfMThnObxMmEBalKSIKUXU7auMv0oCMv7Wb9IgueM0kojDLTj7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341663; c=relaxed/simple;
	bh=coGWTknDt3ph9ipz90D3M85NeFQY50/ZsfJltKzgM4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hHIBytSXmZ5LVCUh+4Vs85d/uLsw7gJ4IXatpImdAarQkLMQmfu2VrhfrXlEgHm6op0T6PmO3EJnCXPbdmM0mUZnzEqiSrtJmaSOTGelqgxe2SlzSCpH7nNnp4BGEm+gHImrwVYUmeDTDWUf8ILjOUWlNwtBjJt6dZdlRWTi1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZBtxinF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZBtxinF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780341661; x=1811877661;
  h=date:from:to:cc:subject:message-id;
  bh=coGWTknDt3ph9ipz90D3M85NeFQY50/ZsfJltKzgM4k=;
  b=mZBtxinFjOq9ebehhdhNhUrpTs9f3vAV4GWdKg9tYsuoDWSxp59I+J9N
   PhygHH9v780kRIXO4DorcKQ0erqASMARzu4AQOBtuuF1/KFH4LQuYk7gQ
   ON7bXMmMGnudIvf7TEA1luLeJ7GonX8ppAlgi3/pOiRpOKI9aR2iDUuoM
   qD4awKlmnWausQaunLdfyeaZ8/Ww2/KMt76pWMUq5lZGVMo00kNu/4kW4
   RbE2ifQrH3xuUtxdE2hDK70J9BNqmZtmPK41LpXZXN7E77ci6N+joGpvM
   kohe9+V50ztycT6JiSbWclcTszgXjh6gJFijxsg1+DzEGojCUAJIx0Bho
   A==;
X-CSE-ConnectionGUID: gmDaUx40RqOHwQCd1/gP8g==
X-CSE-MsgGUID: Nfyra9e0RSOYM41RXP2/TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81083306"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81083306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:21:01 -0700
X-CSE-ConnectionGUID: LwuR+apeSxeAgONInbvXGw==
X-CSE-MsgGUID: +B0ZOOjpTe+zUg1dQYJtoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="273943770"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2026 12:21:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU8C1-00000000Azk-3TMM;
	Mon, 01 Jun 2026 19:20:57 +0000
Date: Tue, 02 Jun 2026 03:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence:
 '\%'
Message-ID: <202606020359.iQvnKYeP-lkp@intel.com>
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
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   8 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-122-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020359.iQvnKYeP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020359.iQvnKYeP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 23ef9d439769 ("kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606020359.iQvnKYeP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '\%'
>> kernel/cfi.c:40:1: sparse: sparse: unknown escape sequence: '\%'
   kernel/cfi.c:43:1: sparse: sparse: unknown escape sequence: '\%'
   kernel/cfi.c:43:1: sparse: sparse: unknown escape sequence: '\%'

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
