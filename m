Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95A234AB1F
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 17:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757611675; cv=none; b=QgIDwQPge9X5AFZZkIk/tA7mfzdVXgRz2jTd2Ou/LjqxfpN5md3ZTDAXN9UUog+fJCKT6b439OWZ2pkAE3SN2IeEm1lTtYhPpmnNSnl6tp/SMdaaDfr3ZSgQZqilFddcCZ9RP/D2jdWNbMFAKoK9EdChUEQwVi9wWmiutGDpMio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757611675; c=relaxed/simple;
	bh=8i2htdyxksuOQE2GwSUOA7H5HBIRaV7LFyeHfgxKHuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRIZ+OUkk7RVxNfIFE4rRfm3QKzjN+G+6qqawUF/VO3wYfFeJ/rlyWuvBrIewYgEPqaBCyiEkmKjpsujriyIifGPBWqEpLcEQrJWntH8/YYxyIRPDNGZ8O0DTJpJ8J+iklef5PymBTB+7cwsVUc1yvnQ1e1e8QRj34NOsfVJCOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kU7ORA1C; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kU7ORA1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757611673; x=1789147673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8i2htdyxksuOQE2GwSUOA7H5HBIRaV7LFyeHfgxKHuo=;
  b=kU7ORA1CgF8vbsJAE8KFVqWugMnnxmGir9bCfjA0ybhtBm3fwwnAynYt
   KdHq8cqp/IAn94pMEBKA/BNMcdjTZMi10VJ7YMb62MkFFVzm6+hEqyaAe
   Lc1Alq3VLjjTneKQtI8XUmsky0XA2Z5w2ASXlBRuk085N+xdKIhvCdpFO
   z1VF6m7/1HFEzwnaNtIJPAjw/16pMtb2hSLorv/+dSteFroSYoIapOkK/
   3eZfgKRXnPRLUHIUaOJFb67fJrJLLoqDRDT0Ph2ZuADHGeveZQGIhVRC6
   X0zvfxKh60S4wAe1OkHW4FhbARUeN83XdMyV220Qps0P23uqvDAylFOSh
   Q==;
X-CSE-ConnectionGUID: Ls7wNZGyS7qqp0LR/T8izg==
X-CSE-MsgGUID: tDcHR1asS86FYbZwi/0f3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59811011"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="59811011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 10:27:53 -0700
X-CSE-ConnectionGUID: 76gz9VaGQMmmO2Eue9Phzg==
X-CSE-MsgGUID: nLbqRc7eRLOSo8b44/aH7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="178957179"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 11 Sep 2025 10:27:51 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwl5B-0000Wo-0L;
	Thu, 11 Sep 2025 17:27:42 +0000
Date: Fri, 12 Sep 2025 01:26:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nf-next:main 17/43] ERROR: modpost: __ex_table+0x2560 references
 non-executable section '.rodata.cst8'
Message-ID: <202509120148.5QYypZoa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: netfilter-devel@vger.kernel.org
CC: coreteam@netfilter.org
TO: Vlad Dumitrescu <vdumitrescu@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jiri Pirko <jiri@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git main
head:   1f24a240974589ce42f70502ccb3ff3f5189d69a
commit: ce0b015e2619ae64b7d33fb24a6b6cadcd70c317 [17/43] devlink: Add 'total_vfs' generic device param
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-002-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120148.5QYypZoa-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120148.5QYypZoa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509120148.5QYypZoa-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x241c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2424 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2424 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2428 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2428 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2430 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2430 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2434 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2434 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x243c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x243c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2440 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2440 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2448 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2448 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x244c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x244c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2454 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2454 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2458 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2458 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2460 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x2460 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2464 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x2464 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x246c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x246c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2470 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2470 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2478 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2478 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x247c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x247c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2484 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2484 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2488 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2488 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2490 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2490 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2494 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2494 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x249c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x249c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x24fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2500 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2500 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2508 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2508 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x250c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x250c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2514 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2514 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2518 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2518 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2520 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2520 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2524 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2524 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x252c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x252c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2530 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2530 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2538 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2538 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x253c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x253c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2544 (section: __ex_table) -> .L0  (section: .debug_frame)
ERROR: modpost: __ex_table+0x2544 references non-executable section '.debug_frame'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2560 (section: __ex_table) -> nv50_gpio_reset.regs (section: .rodata.cst8)
>> ERROR: modpost: __ex_table+0x2560 references non-executable section '.rodata.cst8'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2568 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2568 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x256c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x256c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2574 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2574 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2578 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2578 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2580 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2580 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2584 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2584 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x258c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x258c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2590 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2590 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2598 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2598 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x259c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x259c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2604 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2604 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2608 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2608 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2610 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2610 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2614 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x261c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x261c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2620 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2620 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2628 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2628 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x262c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x262c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2634 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2634 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2638 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2640 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2640 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2644 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x264c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x264c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2650 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2650 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2658 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2658 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x265c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x265c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2664 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2664 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2668 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2670 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2670 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2674 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x267c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x267c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2680 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2688 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2688 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x268c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x268c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2694 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2694 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2698 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2698 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
