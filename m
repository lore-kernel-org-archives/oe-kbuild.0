Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A32F691F
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774423147; cv=none; b=V5ROWZ38pALdLCRQ0goR92RlnEGT0pwDDM9W27vPMz1nw+pHs2pmAjn+HUQXhAUGSAewSD2MlqpB63JbPPymVzEbiaIF2no47XJ2Vd6Ndts5H0KH5/tMnK6Z79FG4PzwGzHWuQbRh9e/+YS14jSUR8YWCaXQMWlNS9KMKPHbuRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774423147; c=relaxed/simple;
	bh=jSVRts+tDZdRjvfY4tgRbiDEmM7UAaKMWCxuEpHrsA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pj4jfwUvJmVO5tRF1iactwNEsZPfiwBn+sQO0VrHlCp56gyX+O+2MjyX37HN0nqfrAEQles8BvM5B3lj0zuP2LFO6v/1vpPjn8TIQi4tKcylIvakV1NPwqQr1dgvzf1CgxE5EOBptBq3d4eXU2wWufD0geQGBsB4Tw8jRvBW2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+UbDr0/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+UbDr0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774423145; x=1805959145;
  h=date:from:to:cc:subject:message-id;
  bh=jSVRts+tDZdRjvfY4tgRbiDEmM7UAaKMWCxuEpHrsA4=;
  b=i+UbDr0/nVquC2rZaZXM3FVLBqvUvD59k2oQdrKkIo/OZEvmMYzNF8O9
   VK0YXLwAHO5Dsm0nX7C/W6HSDZgL+YeypGlkyHUOK5Guk4ilYTvw5MJQz
   x8jW3ax//fvI+zRsDmWoA6tgaNbLOnTj8XtJeLEfh4ua7WcDKcDJiylxv
   RoQ0bwrIIlqABgr6T6s6nEAETB4JbbWI5yATvXYauHrFu905eWsepxuXk
   4cVqusqBx0winm5YQUxZXbG/Ic7CyogHC6GXlc5A9Rh2iRHcWzKMt9qPR
   ARfe9D+f/da/KgBMRX9iN383abHbMQ7y6nn34vx28ibqs9oKU9ogdOmzQ
   g==;
X-CSE-ConnectionGUID: ILBNB440RZq+KovpaZmLQQ==
X-CSE-MsgGUID: TNCCm5MdTS+BXqPCh1sICg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86931446"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86931446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 00:19:05 -0700
X-CSE-ConnectionGUID: Stpdh0F1TB+N9tTyC5HOPA==
X-CSE-MsgGUID: WzV6zerHQ6u+q8hpTVVSiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="223658718"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Mar 2026 00:19:03 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5IW4-000000006PB-2yyU;
	Wed, 25 Mar 2026 07:19:00 +0000
Date: Wed, 25 Mar 2026 15:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: __ex_table+0x2568 references non-executable
 section '.kcfi_traps'
Message-ID: <202603251547.jqYeWHMn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vivian Wang <wangruikang@iscas.ac.cn>
CC: Paul Walmsley <pjw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 8261a9d167e8b3007c0e830a1f7ab8c8b8c24b79 riscv: hweight: Use riscv_has_extension_likely
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-r054-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251547.jqYeWHMn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251547.jqYeWHMn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603251547.jqYeWHMn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x237c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2380 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2380 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2388 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2388 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x238c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x238c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2394 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2394 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2398 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2398 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23dc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x23f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2400 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2400 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2404 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2404 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x240c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x240c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2410 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2410 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2418 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2418 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x241c (section: __ex_table) -> .L0  (section: .debug_str)
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
WARNING: modpost: vmlinux: section mismatch in reference: 0x2568 (section: __ex_table) -> $d (section: .kcfi_traps)
>> ERROR: modpost: __ex_table+0x2568 references non-executable section '.kcfi_traps'
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
WARNING: modpost: vmlinux: section mismatch in reference: 0x25a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x25a8 references non-executable section '.debug_str'
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
WARNING: modpost: vmlinux: section mismatch in reference: 0x2628 (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x2628 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x262c (section: __ex_table) -> .L0  (section: .debug_loc)
ERROR: modpost: __ex_table+0x262c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2634 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2634 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2638 (section: __ex_table) -> __exitcall_st_nci_spi_driver_exit (section: .exitcall.exit)
ERROR: modpost: __ex_table+0x2638 references non-executable section '.exitcall.exit'
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
