Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186993;
	b=y9yISzuhAHH4jIut6R22a7zHWFcm8HgoufPSvLyKTO+gxl9TgcLa1QpLwHZNukKNxfVJ
	 ssv0TtTpJ1pa7V/Vnxi2XZXXDmxKrhPjfF6szT86K3QOMw18+G8YadNnWrpEyg4JIxZaY
	 /fXRiK488fXuyqZPG+k5Smnga9VID/WHaUTFDtlL7mkbIxNdLEek8If+OAklF0QSZaUGN
	 2xoApFPZ5W54Os2+rhcPB7f0q3X+y/nGgqja0HeARtAWzo+oeX2yGrszusL1pkCcEiT3N
	 TMHvHY7orf8N+ewelVFQjRn/cNhHVVUpVbcs6TACj6ORtAOjgobwRel2syPf7eOR8/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186993;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lJBnLk0I1rzLzhs138pUyeZWkGxD3gT+4k0adhSoI4Q=;
	b=MYZUBAdbwM9syEPCAHBx5FchfxASM6n9UH/+E9RzDWEJ7jnZ9185E8u4vQ68azUG7tvx
	 AngwmERsSMZSPzgrEKUDer04/XpTKiRPgpAd1iTNzEb+9f6SDleShpe/dZiOPY9NQcSBF
	 UC9ED12dtTlmdiyJShG1ULJYlR29dvC9nGL5vSflSrsKjAeLi0FA0DaNXmOaq/2V+XgGI
	 t+bi6YfHcdvpP1lqwf981Q38oWxPFBhs95TgQbOjrrzDpJRbd8ddy0lf3jSgfL9wj7SiI
	 YmfSQpdGWPVeFMAabJgJkORwm45r7mma5cu9580k4c+swFaP3lPuF8lPxX5JTtF7g7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K+3ZKIbf;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1AD606A31A
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Oct 2026 11:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K+3ZKIbf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793186990; x=1824722990;
  h=date:from:to:cc:subject:message-id;
  bh=wj37SSmD4WATG7RrSP6MLHJAogHoRZNsosKTnSiVMcA=;
  b=K+3ZKIbfAqyljpg5LaZXfWG64pOhm8HKWUjb67uZ3iumvczQaelGmlJ/
   oPChIIHI2DJWorRnEGpLDkQ9zZhQworMukA+eOeCN9vyU44rxQZGanXJ3
   kUn08l493T74dD1K98Ay8ncxAGyvZ3iaS0RE7WYddqshWl7qlRA2ZcSWH
   WPxElm9TgvGdBf7Urx+41BEb0Yp4ciMpYNBMf3W4FPD4IDzy/VgAGnUwe
   QZ3p5hwjNcO/H40cMU712Ac9KxNnoxH/KGH0K4QATUBcNryeC6CpF1ap+
   avufnb/5QP3Pm4iYVmVw9Ih0j3wo1W9rUqbjXmXHeERKge+qH61R6izsM
   Q==;
X-CSE-ConnectionGUID: 75mBDkkZSeqiNuSmi/f+sw==
X-CSE-MsgGUID: QPHyXjZ2RCG7uG6XM+Y6aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1813172"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1813172"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 04:29:50 -0700
X-CSE-ConnectionGUID: ZGe6OkogQg+AVmgqzbz6cA==
X-CSE-MsgGUID: FDJ/4TAGQZC5j9pQNnthIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6633160"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 28 Oct 2026 04:29:49 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM1qk-000000004ql-31IM;
	Wed, 28 Oct 2026 11:29:46 +0000
Date: Wed, 28 Oct 2026 12:28:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 44/48] ERROR: modpost:
 __ex_table+0x2860 references non-executable section '.rodata.str1.4'
Message-ID: <202610281255.07FDQJWR-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "David Hildenbrand (Arm)" <david@kernel.org>
CC: Suren Baghdasaryan <surenb@google.com>
CC: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   4685a28187f466adb03455ac903363f000ef6a89
commit: 3ab8f62586922b942b0d72469bd06281a4b74c97 [44/48] fs/proc/task_mmu: fix missed VMAs when reading /proc/PID/maps and friends
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-r2311-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281255.07FDQJWR-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.4.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281255.07FDQJWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610281255.07FDQJWR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_unregister+0x10 (section: .text.unlikely) -> .LBB76071 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_unregister+0x14 (section: .text.unlikely) -> .LBB82393 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_unregister+0x22 (section: .text.unlikely) -> .LBB91278 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_unregister+0x26 (section: .text.unlikely) -> .LBB76073 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __list_del_entry+0x6 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __list_del_entry+0xc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: schedule_work.isra.0+0xc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x20dc (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x20dc references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20e8 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x20e8 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x20f4 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x20f4 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2100 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2100 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2104 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2104 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x210c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x210c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2118 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2118 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x211c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x211c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2124 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2124 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2128 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2128 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2130 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2130 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2134 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2134 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x213c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x213c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2140 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2140 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2148 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2148 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x214c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x214c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2154 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2154 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2158 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2158 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2160 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2160 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2164 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2164 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x216c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x216c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2170 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2170 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2178 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x217c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x217c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2184 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2188 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2188 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2190 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2190 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2194 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2194 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x219c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x219c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a0 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x21a0 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21a8 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x21a8 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x21b4 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x21b4 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26f4 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x26f4 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2700 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2700 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x270c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x270c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2718 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2718 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x271c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x271c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2724 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2724 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2728 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2728 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2730 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2730 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2734 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2734 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x273c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x273c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2740 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2740 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2748 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2748 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x274c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x274c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2814 (section: __ex_table) -> .L0  (section: .debug_frame)
ERROR: modpost: __ex_table+0x2814 references non-executable section '.debug_frame'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2860 (section: __ex_table) -> .LC20 (section: .rodata.str1.4)
>> ERROR: modpost: __ex_table+0x2860 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x286c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x286c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2878 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2878 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: spacemit_sdhci_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: spacemit_sdhci_driver_exit+0xc (section: .exit.text) -> .L156 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdhci_xenon_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdhci_xenon_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rtsx_usb_ms_driver_exit+0xc (section: .exit.text) -> init_signal_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: agilent_82357a_exit_module+0x6 (section: .exit.text) -> .LVL1 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: agilent_82357a_exit_module+0x18 (section: .exit.text) -> em_netlink_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_vibrator_exit+0x6 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_vibrator_exit+0xa (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_vibrator_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_vibrator_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_vibrator_exit+0x28 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_vibrator_exit+0x2c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: axis_fifo_exit+0xa (section: .exit.text) -> kernel_rcu_stall_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: axis_fifo_exit+0x1c (section: .exit.text) -> check_cpu_stall_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pmc_adc_i2c_driver_exit+0x8 (section: .exit.text) -> .LVL27 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltc2496_driver_exit+0xc (section: .exit.text) -> utsname_sysctl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ads112c04_driver_exit+0x8 (section: .exit.text) -> rseq_setup_debug (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ads7924_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ads7924_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mpu3050_i2c_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mpu3050_i2c_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssp_gyro_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssp_gyro_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adf4377_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adf4377_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bmi323_spi_driver_exit+0x8 (section: .exit.text) -> init_mm_sysctl (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bmi323_spi_driver_exit+0xc (section: .exit.text) -> disable_randmaps (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: apds9160_driver_exit+0x8 (section: .exit.text) -> vmalloc_init_workqueue (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bh1780_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bh1780_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsl2583_driver_exit+0x8 (section: .exit.text) -> .LVL57 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsl2583_driver_exit+0xc (section: .exit.text) -> .LVL765 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsl2591_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tsl2591_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: x9250_spi_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: x9250_spi_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srf04_driver_exit+0x8 (section: .exit.text) -> ksm_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srf04_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sx9310_driver_exit+0x8 (section: .exit.text) -> .LVL29 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_client+0x4 (section: .exit.text) -> init_flat_binfmt (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_client+0xa (section: .exit.text) -> init_flat_binfmt (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adau1373_i2c_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8737_exit+0x6 (section: .exit.text) -> .L351 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wm8737_exit+0x18 (section: .exit.text) -> .L351 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bcm63xx_i2s_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfc_exit+0x2c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_exit+0x8 (section: .exit.text) -> .LBB77730 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_exit+0xc (section: .exit.text) -> .LBB98377 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: psample_module_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: psample_module_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x6 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0xa (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x24 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x28 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x34 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x38 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_diag_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_diag_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x6 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0xa (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x28 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x2c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_cleanup_module+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_cleanup_module+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netlink_exit+0x6 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netlink_exit+0xa (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netlink_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netlink_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
