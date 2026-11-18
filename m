Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016142;
	b=BbeRbOOlqwjOYjUJtlKlt8CDBzexPeiWOUuZEEqAz6e94xinnx6QbJbvzwI13GOMAA4Z
	 P3caJLOUY6OS4ul5Rjv0qfbdiBfkiW4MTzKhcgKrcsb9a6sjbva2hkHkroNTeZyzWiLxD
	 U4HNTUCrDS7/K0pHgELHQXBCuw0BKxhQMY5IBenfR+eEMsSpUkP5tuYdE+246ljoDqnde
	 E0N239OOFaA0yNtOCSELuAulmYzC2wptTHUy66uxGF+4LUf3tuHS+UEH9KwkgEGf9Ob1V
	 UWXzdyhBY3wyYYKpQcAQwyeAJHuecFxf5hN8U1sEj/RahH9vl5KOVZo9BZ1EIQBUouw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016142;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rDqjRkhMUaiVUYm4Tx2cQeqoA+H2HUIZxEQnk2aaYJo=;
	b=f7SHN8fwMFp6AMzThF9/KDGI17VK2I05tNiA0IzFyCPxXLa5hxke4A25cyUytWe7Drck
	 PqXzB8B9hXQLaYhwK4Qu37M1JS3wGVvyfbUvi5rCozLKZ0WIy/u/ArxTYeVBGfsKT7CuQ
	 ahtiEo+CfZ+riU1OMvuJzvpPj0wOnrYMw3zFDg82M4bvd/T7/F1Zt0WBsJXYZYJLCq3Mi
	 XZ79xqBjgX9CQfuB90u8LijBi7mndxcW6zELMuf8hN4grgH0CvBtgiYXm+iMpni4GtgfF
	 XJqn1W+Lf+sLzYayw7CXANSJtAaaNOzIcuoEo93vLx0JkIDLG/9dCC13Kz20rGJg0CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DrwObOfz;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E60606A325
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 15:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E60606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DrwObOfz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795016142; x=1826552142;
  h=date:from:to:cc:subject:message-id;
  bh=4HtWLNkquQkIIW2twvq4S1vmL435CXYCt8+vajr08HA=;
  b=DrwObOfzrgf4e+RjSlHRQEshxzIllh3rmpLOdEwIUfAbIk04cCGeowTg
   ThG5IDvXVVmZOoFZvpe5dHiei96X4xxOXPdaBpi95xeaD+W/cUWCY/J/U
   rqDOWAbNuzIbpYIc2wqeNQQEwrwi6uNk0lU/6J2KPeScaSCIwSdVKj5Kz
   1PYaCunEowQKhzVOXH1dK2lEJBMGes3p9S2UDO1mYnp8t4yole3aMHPi2
   jl7wHf1hOD7bKoFR7vMKVx9j2bi2CMmKNcV6OTADcZ/9LZB8hojhJGsY4
   lLvGqrvcAI8nW+pNd22+FVSM3BHr4m+jdegFzCMpQ/BCyQMK0uItoinWi
   Q==;
X-CSE-ConnectionGUID: fB1OV69SSK6fAra5A+aKLQ==
X-CSE-MsgGUID: cfG6hu6uQHuW6QtwWZkDAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3690862"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3690862"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 07:34:02 -0800
X-CSE-ConnectionGUID: fTFtXGSTQcC0Oqs/2Vcuww==
X-CSE-MsgGUID: djio88yMSPuv9eOjYo3lzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10176371"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 07:34:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xThfZ-000000003QC-2s53;
	Wed, 18 Nov 2026 15:33:57 +0000
Date: Wed, 18 Nov 2026 16:33:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mkp-scsi:fixes 23/32] ERROR: modpost: __ex_table+0x1638
 references non-executable section 'alloc_tags'
Message-ID: <20261118162508.OFT0do5G-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Stanley Jhu <stanleyjhu@google.com>
CC: "Martin K. Petersen (Oracle)" <mkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git fixes
head:   9f9e0b1e5399045982788a954d3461de894e40c7
commit: e0696bf65006d888c713ff54269c7fd32bbe62a7 [23/32] scsi: rpmb: core: Guard frame requests and teardown with mutex
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118162508.OFT0do5G-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118162508.OFT0do5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118162508.OFT0do5G-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1408 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1410 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1410 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1414 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1414 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x141c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x141c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1420 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1420 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1428 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1428 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x142c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x142c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1434 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1434 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1438 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1438 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1440 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1440 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1444 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1444 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x144c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x144c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1450 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1450 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1458 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1458 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x145c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x145c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1464 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1464 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1468 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1468 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1470 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1470 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1474 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1474 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x147c (section: __ex_table) -> vega20_init_smc_table._rs.77 (section: .data)
ERROR: modpost: __ex_table+0x147c references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1480 (section: __ex_table) -> vega20_override_pcie_parameters._rs.84 (section: .data)
ERROR: modpost: __ex_table+0x1480 references non-executable section '.data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1488 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1488 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x148c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x148c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1494 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1494 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1498 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1498 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ac (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x14f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1548 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x154c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1554 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1558 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1560 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1564 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x156c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1570 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1578 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1578 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x157c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x157c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1584 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1588 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15f0 (section: __ex_table) -> __llvm_internal_gcov_emit_arcs_args (section: .rodata)
ERROR: modpost: __ex_table+0x15f0 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> dc_create_plane_state._alloc_tag (section: alloc_tags)
>> ERROR: modpost: __ex_table+0x1638 references non-executable section 'alloc_tags'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1644 (section: __ex_table) -> $d (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1644 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1650 (section: __ex_table) -> .L.str.6 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x1650 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x165c (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x165c references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x168c references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1698 (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x1698 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.bss'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> __llvm_gcov_ctr (section: .bss)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.bss'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
