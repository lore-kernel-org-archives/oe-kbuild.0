Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262643;
	b=onUhJk7tyf4RazXStBdZ350W2uAvxsIQGcU/xqZ15ilJRfgvNZN4POmXrkX3eFaOtLcK
	 TVn+c0sFDWt64e2sTkcBJXKivMhvzGIPLgtSR7zRTJY7Ob7YRs8LEGAwh+K1HmnxUgGLJ
	 e6qomBQZ0kxZ54hiUOY70S6+bWmArx+BJ6iBRGP8Me6desXNT0QeIhR6UdIad1xgXIU4v
	 VeRMdjvLzWv1Gg0EXzBWi8oPU2a7ECNEqcolbHyH1AdjFR+6wYzO1QiLRImPV6cyOrg3O
	 o2CiwX1c2s9WtTNgNdW4SWzJ5DUX0sk5ddhiv6TdmOxP6YhU9+uxdplp45Z7NKmjMiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262643;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=M5Oz74kvcVmMvDFjfNtRsMKgUorJfO9qRtagIQ/HJgI=;
	b=jYsh869heWPIVmWvgXKnaFE8yzUSzUgNnAMO+duJhHpgjmCjfmXKhPsSUW2SkA+yEeLT
	 3AIdvDB55C9xpIYWsDoanWDopApzOMZshoRlrnmpn/Zjq/LDUwbIkrbg3gAeMtB3g+eiK
	 VnYUZPsnOrjT9jArpBSHyfDnuG2IOCWxn3Mje1UZwViLfOCrj2cOAYPIsIGezZ0P6PoeB
	 pWucWcxXFxWj2737CRq3BitWp43excqpAoRqQCRubpoCcaNjaKo2FanCFrpHJicpm+BT4
	 0kvaV9Roh2HKMLKVPw+STovOK0C/ehNA4X0tPTwEbIf/IKcXFXE1L1oT99xCbEg+TOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YTWH8hj6;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD94606A32A
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 12:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD94606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YTWH8hj6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795262643; x=1826798643;
  h=date:from:to:cc:subject:message-id;
  bh=9MalFMeY3bcxS6G1SdRSua1lVuCIjtJXJRGsJacxfEA=;
  b=YTWH8hj6URznewBvmcThVxSnIYBh1LpjdgF8yJbwrhQijBfdAto/EvjU
   4jIqu0ChfJ9TnhNgVFs8vyCI9z67yNbnZaMAqEGCpM5OrH2oHnNIGcUsr
   XKlTD5cOiVVGa3QUlUxEdmAKL7kxPwoLNhSMjmgkosroFbBboBBj3UCfX
   ICLYWTyrDsTmDctLAcj69GL5Ct6PiHbtAwArkrK2hD2nrv/OWhxhy/gQJ
   RLj1x0H+jGJ1tClr8ryLWXKwWlo1FPqpzM7K9sxCkgfax2jdfaD0t7JpJ
   AmscNzZzl5tq/XFjoMzVT9g0VgjDo0yBWMxrjC470kLADw64vjGwNWp5v
   g==;
X-CSE-ConnectionGUID: mVWooEc9Qs6W+M67pzf8rQ==
X-CSE-MsgGUID: FTKHFcX7RCOQp9fVQuZktQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4172788"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4172788"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 04:04:02 -0800
X-CSE-ConnectionGUID: gVdVGyheR6eT/OZxGtzx5A==
X-CSE-MsgGUID: gFU4Zi5XRMCv6g58I1E6eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11480912"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Nov 2026 04:04:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUjp0-000000004Jh-1db5;
	Sat, 21 Nov 2026 12:03:58 +0000
Date: Sat, 21 Nov 2026 13:03:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8956/10560] main.c:undefined reference to
 `__ld_r13_to_r14_ret'
Message-ID: <20261121125243.34yaORF7-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vineet Gupta <vgupta@kernel.org>
CC: linux-snps-arc@lists.infradead.org
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   909ef7a9a30fa139e69e555e3606680f5cca7726
commit: 86a4eab2bd8313fec6e54742e3ea187b65b86b07 [8956/10560] ARC: stop linking libgcc
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
config: arc-randconfig-2005-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121125243.34yaORF7-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121125243.34yaORF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121125243.34yaORF7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: init/main.o: in function `initcall_blacklisted':
>> main.c:(.text+0x2c): undefined reference to `__ld_r13_to_r14_ret'
>> arc-linux-ld: main.c:(.text+0x2c): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: init/main.o: in function `do_one_initcall':
   main.c:(.text+0x8e): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x8e): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x22e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.text+0x22e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `do_early_param':
   main.c:(.init.text+0x86): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x86): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0xac): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: main.c:(.init.text+0xac): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: init/main.o: in function `repair_env_string':
>> main.c:(.init.text+0x118): undefined reference to `__ld_r13_to_r14_ret'
>> arc-linux-ld: main.c:(.init.text+0x118): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: init/main.o: in function `set_init_arg':
   main.c:(.init.text+0x1ac): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: main.c:(.init.text+0x1ac): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: init/main.o: in function `unknown_bootoption':
   main.c:(.init.text+0x1ba): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x1ba): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x248): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: main.c:(.init.text+0x248): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: init/main.o: in function `initcall_blacklist':
>> main.c:(.init.text+0x33e): undefined reference to `__st_r13_to_r20'
>> arc-linux-ld: main.c:(.init.text+0x33e): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.init.text+0x3fa): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: main.c:(.init.text+0x3fa): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: init/main.o: in function `start_kernel':
   main.c:(.init.text+0x498): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.init.text+0x498): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: init/main.o: in function `kernel_init_freeable':
   main.c:(.init.text+0x880): undefined reference to `__st_r13_to_r23'
   arc-linux-ld: main.c:(.init.text+0x880): undefined reference to `__st_r13_to_r23'
   arc-linux-ld: main.c:(.init.text+0xa28): undefined reference to `__ld_r13_to_r23'
   arc-linux-ld: main.c:(.init.text+0xa28): undefined reference to `__ld_r13_to_r23'
   arc-linux-ld: init/main.o: in function `kernel_init':
>> main.c:(.ref.text+0x140): undefined reference to `__ld_r13_to_r14_ret'
>> arc-linux-ld: main.c:(.ref.text+0x140): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: init/main.o: in function `run_init_process':
   main.c:(.text.unlikely+0xa): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0xa): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x9c): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x9c): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: init/main.o: in function `try_to_run_init_process':
>> main.c:(.text.unlikely+0x11e): undefined reference to `__ld_r13_to_r14_ret'
>> arc-linux-ld: main.c:(.text.unlikely+0x11e): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: init/do_mounts.o: in function `do_mount_root':
>> do_mounts.c:(.init.text+0xee): undefined reference to `__st_r13_to_r17'
>> arc-linux-ld: do_mounts.c:(.init.text+0xee): undefined reference to `__st_r13_to_r17'
>> arc-linux-ld: do_mounts.c:(.init.text+0x1b8): undefined reference to `__ld_r13_to_r17_ret'
>> arc-linux-ld: do_mounts.c:(.init.text+0x1b8): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/do_mounts.o: in function `mount_root_generic':
   do_mounts.c:(.init.text+0x23a): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: do_mounts.c:(.init.text+0x23a): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: do_mounts.c:(.init.text+0x308): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x308): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: init/do_mounts.o: in function `mount_root':
>> do_mounts.c:(.init.text+0x3e8): undefined reference to `__st_r13_to_r22'
>> arc-linux-ld: do_mounts.c:(.init.text+0x3e8): undefined reference to `__st_r13_to_r22'
>> arc-linux-ld: do_mounts.c:(.init.text+0x45a): undefined reference to `__ld_r13_to_r22_ret'
>> arc-linux-ld: do_mounts.c:(.init.text+0x45a): undefined reference to `__ld_r13_to_r22_ret'
>> arc-linux-ld: do_mounts.c:(.init.text+0x4ca): undefined reference to `__ld_r13_to_r22'
>> arc-linux-ld: do_mounts.c:(.init.text+0x4ca): undefined reference to `__ld_r13_to_r22'
   arc-linux-ld: init/do_mounts.o: in function `prepare_namespace':
   do_mounts.c:(.init.text+0x522): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: do_mounts.c:(.init.text+0x522): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: do_mounts.c:(.init.text+0x62e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x62e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/calibrate.o: in function `calibrate_delay':
   calibrate.c:(.text+0xa): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: calibrate.c:(.text+0xa): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: calibrate.c:(.text+0x6a): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: calibrate.c:(.text+0x6a): undefined reference to `__ld_r13_to_r15'
   arc-linux-ld: arch/arc/kernel/setup.o: in function `arc_cpu_mumbojumbo.constprop.2':
   setup.c:(.text+0x72): undefined reference to `__st_r13_to_r23'
   arc-linux-ld: setup.c:(.text+0x72): undefined reference to `__st_r13_to_r23'
   arc-linux-ld: setup.c:(.text+0x398): undefined reference to `__ld_r13_to_r23_ret'
   arc-linux-ld: setup.c:(.text+0x398): undefined reference to `__ld_r13_to_r23_ret'
   arc-linux-ld: arch/arc/kernel/setup.o: in function `show_cpuinfo':
   setup.c:(.text+0x3ae): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: setup.c:(.text+0x3ae): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: setup.c:(.text+0x3e0): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: setup.c:(.text+0x3e0): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: arch/arc/kernel/setup.o: in function `handle_uboot_args':
   setup.c:(.init.text+0x128): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: setup.c:(.init.text+0x128): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: arch/arc/kernel/irq.o: in function `arch_do_IRQ':
   irq.c:(.text+0x2): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: irq.c:(.text+0x2): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: irq.c:(.text+0x24): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: irq.c:(.text+0x24): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: arch/arc/kernel/devtree.o: in function `setup_machine_fdt':
   devtree.c:(.init.text+0x34): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: devtree.c:(.init.text+0x34): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: devtree.c:(.init.text+0x82): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: devtree.c:(.init.text+0x82): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: arch/arc/mm/init.o: in function `early_init_dt_add_memory_arch':
   init.c:(.init.text+0xb6): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: init.c:(.init.text+0xb6): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: init.c:(.init.text+0xf4): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: init.c:(.init.text+0xf4): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: arch/arc/mm/cache.o: in function `arc_cache_mumbojumbo':
   cache.c:(.text+0x146): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cache.c:(.text+0x146): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: cache.c:(.text+0x260): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: cache.c:(.text+0x260): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: arch/arc/mm/cache.o: in function `flush_icache_range':
   cache.c:(.text+0x2da): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cache.c:(.text+0x2da): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: cache.c:(.text+0x318): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: cache.c:(.text+0x318): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: cache.c:(.text+0x332): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: cache.c:(.text+0x332): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: cache.c:(.text+0x370): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: cache.c:(.text+0x370): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: arch/arc/mm/cache.o: in function `copy_user_highpage':
   cache.c:(.text+0x404): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: cache.c:(.text+0x404): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: kernel/fork.o: in function `ptrace_event_pid':
   fork.c:(.text+0x1a2): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: fork.c:(.text+0x1a2): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: kernel/fork.o: in function `sysctl_max_threads':
   fork.c:(.text+0x1aa): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x1aa): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x204): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: fork.c:(.text+0x204): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/fork.o: in function `copy_clone_args_from_user':
   fork.c:(.text+0x46e): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: fork.c:(.text+0x46e): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: fork.c:(.text+0x48a): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: fork.c:(.text+0x48a): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: kernel/fork.o: in function `mm_init.isra.127':
   fork.c:(.text+0x6e0): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x6e0): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0x7ca): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: fork.c:(.text+0x7ca): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/fork.o: in function `__mmdrop':
   fork.c:(.text+0x87e): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x87e): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x958): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0x958): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: kernel/fork.o: in function `set_mm_exe_file':
   fork.c:(.text+0xb22): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0xb22): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: fork.c:(.text+0xb66): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: fork.c:(.text+0xb66): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: kernel/fork.o: in function `replace_mm_exe_file':
   fork.c:(.text+0xca2): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0xca2): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: fork.c:(.text+0xd3a): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: fork.c:(.text+0xd3a): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: kernel/fork.o: in function `mm_access':
   fork.c:(.text+0xd7a): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text+0xd7a): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text+0xde2): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: fork.c:(.text+0xde2): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: kernel/fork.o: in function `mm_exit_exec_release':
   fork.c:(.text+0xe5c): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: fork.c:(.text+0xe5c): undefined reference to `__ld_r13_to_r14_ret'
   arc-linux-ld: kernel/fork.o: in function `pidfd_prepare':
   fork.c:(.text+0xeb6): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text+0xeb6): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: fork.c:(.text+0xf16): undefined reference to `__ld_r13_to_r16_ret'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
