Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD562566E2
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754583711; cv=none; b=nlK4THH1VUPU+QxPuGpZRULwpvp9vA3heiqL26KZWDr+zJ4W1RoqcW/+sSZTUYXxX3m4pzTB6tzXrjT+PIgShbYJX47lLEQm85sTrjswHqr0/+IObVMN6bBXs4vefnN9f3nL+G9rY9gqL9a6xoJK5oyqBWmv02tbXzT7i7u9KpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754583711; c=relaxed/simple;
	bh=pNlDjSVKlttuRbGLZfKdV0Xab0w2EQdJzcjJjGqkZFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsKF3HHjDqOo4WV+EFwxq61zMAjU34wEY5tTIvInESDJA2VaWKl/2aU8YLFD5kjOcPS96N68/zlKXI+aSt1dy2frn2aHbqFWbt3oOFG/H/L2bLpIzTGD51KTnCbVy9R69x4Y9EMRcp6TIdGFiIl0BEa9v8Vn0ArS2HJAmOmMJl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlDUfVOH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlDUfVOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754583709; x=1786119709;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pNlDjSVKlttuRbGLZfKdV0Xab0w2EQdJzcjJjGqkZFA=;
  b=ZlDUfVOHRokhB0YzrRRHGyWdhaNeMRS/g3kjvbsvBff1zEEiZeGRkrj7
   w7jHsc7uhISObcwd20j6i3Kc2GEhbuVfaL9pv2OCppUmXVf7n5eWsG3F8
   n23UXrVuuuqGlqbwoBEVOKRG89TFl+hUjJ7Z7A9YCB6hb9BKhzAkdmaJp
   wAgMbEN9Tgq7fDgK6DMZblTtI6SHrR0VjjAdTrdPwwjEMuLbsgJPsFxzz
   xFOLD++yGE837+iZla8/IAXE+brAwuKQIpvC6enm+1aSFcd0M/fQedjA8
   RGhOIVoB+c8sF4BtshZhL1y/Lu4rxMPEgYsDkQIrwt1V3hsygePOflfQR
   w==;
X-CSE-ConnectionGUID: KkKW4GxqReGq2oaSeD+KGQ==
X-CSE-MsgGUID: 1UufU4zgT/i0pwYP+J6Mzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57000576"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="57000576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 09:21:48 -0700
X-CSE-ConnectionGUID: PB4E7nUjSduHUVpNq5e5cA==
X-CSE-MsgGUID: AAIp7T3SRVO/kchxO6F7kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165513208"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2025 09:21:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk3N2-0002yQ-29;
	Thu, 07 Aug 2025 16:21:44 +0000
Date: Fri, 8 Aug 2025 00:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:amd-staging-drm-next 2397/2539] ERROR: modpost:
 __ex_table+0x15f4 references non-executable section
 '.rodata.trace_irq_enable.str1.4'
Message-ID: <202508080039.Q3CpnhUn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
CC: George Zhang <george.zhang@amd.com>
CC: Matthew Auld <matthew.auld@intel.com>
CC: "Christian König" <christian.koenig@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   3fbea86d37880520197c88d1259aad05579b0dc4
commit: 1456cf1ec26306a042f8b5bccfdf9a9244556691 [2397/2539] drm/amdgpu: Reset the clear flag in buddy during resume
:::::: branch date: 23 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080039.Q3CpnhUn-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080039.Q3CpnhUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080039.Q3CpnhUn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x1ec (section: .text.__min_heapify_all) -> pcpu_cpu_distance (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x1ee (section: .text.__min_heapify_all) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x1f2 (section: .text.__min_heapify_all) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x216 (section: .text.__min_heapify_all) -> dummy_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x218 (section: .text.__min_heapify_all) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x21c (section: .text.__min_heapify_all) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x240 (section: .text.__min_heapify_all) -> pcpu_cpu_distance (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x244 (section: .text.__min_heapify_all) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x248 (section: .text.__min_heapify_all) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heapify_all+0x24c (section: .text.__min_heapify_all) -> pcpu_cpu_distance (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x40 (section: .text.__min_heap_pop_push) -> dummy_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x44 (section: .text.__min_heap_pop_push) -> arch_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x5c (section: .text.__min_heap_pop_push) -> arch_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x6a (section: .text.__min_heap_pop_push) -> dummy_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x124 (section: .text.__min_heap_pop_push) -> arch_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x12a (section: .text.__min_heap_pop_push) -> early_map_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x12e (section: .text.__min_heap_pop_push) -> arch_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x13a (section: .text.__min_heap_pop_push) -> arch_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x160 (section: .text.__min_heap_pop_push) -> early_map_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x164 (section: .text.__min_heap_pop_push) -> arch_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x184 (section: .text.__min_heap_pop_push) -> early_map_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x188 (section: .text.__min_heap_pop_push) -> arch_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x1ac (section: .text.__min_heap_pop_push) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x1b2 (section: .text.__min_heap_pop_push) -> arch_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x1ba (section: .text.__min_heap_pop_push) -> arch_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_pop_push+0x1be (section: .text.__min_heap_pop_push) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0xe (section: .text.__min_heap_del) -> early_map_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x34 (section: .text.__min_heap_del) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x3a (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x50 (section: .text.__min_heap_del) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x56 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x6e (section: .text.__min_heap_del) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x72 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0xba (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0xbc (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0xc2 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x12a (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x130 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x158 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x192 (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x196 (section: .text.__min_heap_del) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x1a0 (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x1ee (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x1f4 (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x21c (section: .text.__min_heap_del) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x21e (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x222 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x246 (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x24c (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x272 (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x276 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x2a4 (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x2cc (section: .text.__min_heap_del) -> setup_per_cpu_areas (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x2d0 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x2e2 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x356 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x366 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __min_heap_del+0x3d8 (section: .text.__min_heap_del) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: range_string.isra.0+0xf6 (section: .text.range_string.isra.0) -> lkdtm_perms_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: range_string.isra.0+0x100 (section: .text.range_string.isra.0) -> lkdtm_usercopy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: range_string.isra.0+0x10e (section: .text.range_string.isra.0) -> lkdtm_perms_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: device_node_string+0x376 (section: .text.device_node_string) -> tps6594_esm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xas_create+0xb4 (section: .text.xas_create) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d0 (section: __ex_table) -> .LASF70 (section: .debug_str)
ERROR: modpost: __ex_table+0x14d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14d4 (section: __ex_table) -> .LASF72 (section: .debug_str)
ERROR: modpost: __ex_table+0x14d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14dc (section: __ex_table) -> .LASF74 (section: .debug_str)
ERROR: modpost: __ex_table+0x14dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e0 (section: __ex_table) -> .LASF76 (section: .debug_str)
ERROR: modpost: __ex_table+0x14e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14e8 (section: __ex_table) -> .LASF78 (section: .debug_str)
ERROR: modpost: __ex_table+0x14e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14ec (section: __ex_table) -> .LASF80 (section: .debug_str)
ERROR: modpost: __ex_table+0x14ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f4 (section: __ex_table) -> .LASF82 (section: .debug_str)
ERROR: modpost: __ex_table+0x14f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x14f8 (section: __ex_table) -> .LASF84 (section: .debug_str)
ERROR: modpost: __ex_table+0x14f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1500 (section: __ex_table) -> .LASF86 (section: .debug_str)
ERROR: modpost: __ex_table+0x1500 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1504 (section: __ex_table) -> .LASF88 (section: .debug_str)
ERROR: modpost: __ex_table+0x1504 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x150c (section: __ex_table) -> .LVUS258 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x150c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1510 (section: __ex_table) -> .LLRL259 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1510 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1540 (section: __ex_table) -> .LLRL260 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1540 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> .LVUS261 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1548 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> .LLRL262 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x154c references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> .LVUS263 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1554 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> .LLRL264 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1558 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d8 (section: __ex_table) -> .LLST3034 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x15d8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15f4 (section: __ex_table) -> .LC2 (section: .rodata.trace_irq_enable.str1.4)
>> ERROR: modpost: __ex_table+0x15f4 references non-executable section '.rodata.trace_irq_enable.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1600 (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x1600 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1608 (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x1608 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1618 (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x1618 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1620 (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x1620 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1624 (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x1624 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x1638 references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16ec (section: __ex_table) -> .LASF1552 (section: .debug_str)
ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .LASF1554 (section: .debug_str)
ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f8 (section: __ex_table) -> .LVUS1334 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .LLST4621 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .LLST64 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x180c (section: __ex_table) -> .LLST65 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x180c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1810 (section: __ex_table) -> .LLST66 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1810 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1824 (section: __ex_table) -> .LVUS67 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1824 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1828 (section: __ex_table) -> .LVUS68 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1828 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1830 (section: __ex_table) -> .LVUS69 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1830 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1834 (section: __ex_table) -> .LLRL70 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1834 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x183c (section: __ex_table) -> .LVUS71 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x183c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1840 (section: __ex_table) -> .LVUS72 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1840 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1848 (section: __ex_table) -> .LLST74 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1848 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1854 (section: __ex_table) -> .LVUS75 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1854 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1858 (section: __ex_table) -> .LLRL76 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1858 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1860 (section: __ex_table) -> .LVUS77 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1860 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1864 (section: __ex_table) -> .LVUS78 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1864 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x186c (section: __ex_table) -> .LLRL79 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x186c references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1870 (section: __ex_table) -> .LLRL80 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1870 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1878 (section: __ex_table) -> .LVUS81 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x187c (section: __ex_table) -> .LLST82 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x187c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1888 (section: __ex_table) -> .LLST84 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1888 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1894 (section: __ex_table) -> .LVUS85 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1894 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x189c (section: __ex_table) -> .LVUS86 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x189c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a0 (section: __ex_table) -> .LVUS87 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x18a0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a8 (section: __ex_table) -> .LLRL88 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x18a8 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18ac (section: __ex_table) -> .LVUS89 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x18ac references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b4 (section: __ex_table) -> .LASF1022 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b8 (section: __ex_table) -> .LASF1024 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18cc (section: __ex_table) -> .LASF2022 (section: .debug_str)
ERROR: modpost: __ex_table+0x18cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d0 (section: __ex_table) -> .LASF2024 (section: .debug_str)
ERROR: modpost: __ex_table+0x18d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18d8 (section: __ex_table) -> .LASF2026 (section: .debug_str)
ERROR: modpost: __ex_table+0x18d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18dc (section: __ex_table) -> .LASF2028 (section: .debug_str)
ERROR: modpost: __ex_table+0x18dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e4 (section: __ex_table) -> .LASF2030 (section: .debug_str)
ERROR: modpost: __ex_table+0x18e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18e8 (section: __ex_table) -> .LASF2032 (section: .debug_str)
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f0 (section: __ex_table) -> .LASF2034 (section: .debug_str)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f4 (section: __ex_table) -> .LASF2036 (section: .debug_str)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18fc (section: __ex_table) -> .LASF2575 (section: .debug_str)
ERROR: modpost: __ex_table+0x18fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1900 (section: __ex_table) -> .LASF2577 (section: .debug_str)
ERROR: modpost: __ex_table+0x1900 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1908 (section: __ex_table) -> .LASF2579 (section: .debug_str)
ERROR: modpost: __ex_table+0x1908 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x190c (section: __ex_table) -> .LASF2581 (section: .debug_str)
ERROR: modpost: __ex_table+0x190c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1914 (section: __ex_table) -> lp3952_id (section: .rodata.lp3952_id)
>> ERROR: modpost: __ex_table+0x1914 references non-executable section '.rodata.lp3952_id'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1918 (section: __ex_table) -> .LC0 (section: .rodata.lp3952_probe.str1.4)
>> ERROR: modpost: __ex_table+0x1918 references non-executable section '.rodata.lp3952_probe.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1920 (section: __ex_table) -> .LC1 (section: .rodata.lp3952_probe.str1.4)
ERROR: modpost: __ex_table+0x1920 references non-executable section '.rodata.lp3952_probe.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1924 (section: __ex_table) -> .LC2 (section: .rodata.lp3952_probe.str1.4)
ERROR: modpost: __ex_table+0x1924 references non-executable section '.rodata.lp3952_probe.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1950 (section: __ex_table) -> .LC4 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1950 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1954 (section: __ex_table) -> .LC6 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1954 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1974 (section: __ex_table) -> .LLST21 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1974 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: __ex_table) -> .LLST22 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1980 (section: __ex_table) -> .LLST23 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1980 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a4 (section: __ex_table) -> .LASF3095 (section: .debug_str)
ERROR: modpost: __ex_table+0x19a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> .LLST8 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> .LASF3097 (section: .debug_str)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19bc (section: __ex_table) -> .LVUS9 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> .LVUS10 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .LLST11 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .LLST12 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LLRL13 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LLST14 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> .LLST5 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> .LLST6 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> .LLST7 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF3101 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> .LASF3102 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> .LASF3104 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> .LASF3106 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: __ex_table) -> .LASF3109 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> .LASF3111 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> .LASF3113 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> .LASF719 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> .LASF721 (section: .debug_str)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> .LASF723 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> .LASF725 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> .LASF727 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> .LASF729 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> .LASF731 (section: .debug_str)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> .LASF733 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> .LASF735 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> .LASF737 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> .Lubsan_type3 (section: .sdata..Lubsan_type3)
>> ERROR: modpost: __ex_table+0x1b0c references non-executable section '.sdata..Lubsan_type3'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> .Ldebug_abbrev0 (section: .debug_abbrev)
ERROR: modpost: __ex_table+0x1b10 references non-executable section '.debug_abbrev'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b18 (section: __ex_table) -> .LASF0 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1b18 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b1c (section: __ex_table) -> .LLRL155 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1b1c references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b24 (section: __ex_table) -> .LASF2 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b28 (section: __ex_table) -> .LASF4 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b30 (section: __ex_table) -> .LASF6 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b34 (section: __ex_table) -> .LASF7 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b3c (section: __ex_table) -> .LASF10 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b40 (section: __ex_table) -> .LASF12 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b48 (section: __ex_table) -> .LASF14 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b4c (section: __ex_table) -> .LASF16 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b54 (section: __ex_table) -> .LASF18 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b58 (section: __ex_table) -> .LASF20 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b60 (section: __ex_table) -> .LASF22 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b64 (section: __ex_table) -> .LASF24 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b6c (section: __ex_table) -> .LASF26 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b70 (section: __ex_table) -> .LASF28 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> .LASF1689 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> .LASF1691 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b84 (section: __ex_table) -> .LASF1693 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> .LASF1695 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b90 (section: __ex_table) -> .LASF1697 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b94 (section: __ex_table) -> .LASF1699 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b9c (section: __ex_table) -> .LASF1701 (section: .debug_str)
ERROR: modpost: __ex_table+0x1b9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba0 (section: __ex_table) -> .LASF1703 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba8 (section: __ex_table) -> .LASF1705 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ba8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bac (section: __ex_table) -> .LASF1707 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb4 (section: __ex_table) -> .LASF1709 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb8 (section: __ex_table) -> .LASF1711 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc0 (section: __ex_table) -> .LASF1713 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc4 (section: __ex_table) -> .LASF1715 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> .LASF1717 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd0 (section: __ex_table) -> .LASF1719 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd8 (section: __ex_table) -> .LASF1721 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> .LASF1723 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bdc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be4 (section: __ex_table) -> .LASF1725 (section: .debug_str)
ERROR: modpost: __ex_table+0x1be4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be8 (section: __ex_table) -> .LASF1727 (section: .debug_str)
ERROR: modpost: __ex_table+0x1be8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf0 (section: __ex_table) -> .LASF1729 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bf0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf4 (section: __ex_table) -> .LASF1731 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bf4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bfc (section: __ex_table) -> .LASF2833 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bfc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c00 (section: __ex_table) -> .LASF2835 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c08 (section: __ex_table) -> .LASF2837 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c0c (section: __ex_table) -> .LASF2839 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c14 (section: __ex_table) -> .LASF2841 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c18 (section: __ex_table) -> .LASF2843 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c20 (section: __ex_table) -> .LASF2845 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c24 (section: __ex_table) -> .LASF2847 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c2c (section: __ex_table) -> .LASF2849 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c30 (section: __ex_table) -> .LASF2851 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c38 (section: __ex_table) -> .LASF2853 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c38 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
