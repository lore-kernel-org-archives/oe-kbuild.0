Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218845;
	b=qxPLIAVTLl9DoTuBnqM7lRZDrsZ/RYUsLwJxHCbq8f2F4AzpWFLmn9j3s64xKw09oKXY
	 WmDW+CSxa3YhK35HjVXn7sL6+a+GE8WPBXjDsseOmCgw6BbZEpDfPLByoZVTuJR8DO6hn
	 Jabr03kTizdWEV3L2Tv+oTO5ELVcXMfhXmRCyAlWQdiekjY6UmNbBaK44AhPR6LF1BTOD
	 yqL6yQ83DYEzQqmMon5xtOYW7uryAAj9RKLJabI84Pk37XM2bmXukfw79X3LdGdH9KzR3
	 zBojPyc+ksDvmVIaaiWESv7ggabe7unbDr55FBhFCbdvRXnpP0Sw4W0tZgW78wLajAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218845;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OUVTk8GZtqk4lFEIdx/NYHbCUXtmujnsg2zHzLbhksY=;
	b=Vo5ZTnjFgeuXDgNTKL28c0YeHjHQ30UQ2asls7tGeLFTrP2YZ2T2nmB2MKc62O6YFSLg
	 HdX707REsHR8LxPYqU/4GlTFO4iUdSr1a7gKqlPGw3MpxlFGSaY8Aknl8WhxV/x/Zvhph
	 wGypmVKWHF1FjHhUH6ZH9NlszDvAK/UYGrWykiNfCrnHUnR/4A/vxtiyaGScU8r1gxMc7
	 KEDBs22RVjuBtD3D/rKN9H4Ev/6yjV8UKTDyFczrkAkYBoZ9czmmgRlvVScovsM80XYDe
	 jPl4B/aLdRA5rWxkV6TewtvUyXgIR33+Kw5209HT7zbPyBadcr3FEDYDft3kG4uY6dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KaBaFffG;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753A9606A6B9
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 23:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753A9606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KaBaFffG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795218839; x=1826754839;
  h=date:from:to:cc:subject:message-id;
  bh=8GJ1Hs2gCd5SJ5zUpKcXt7O/p5I8RE+Xd3krsHDmTMI=;
  b=KaBaFffGjdCZdGgGweDz/icO8QixsVOGwQw+JX3xT3hWoDNG6a3kDI4S
   sfiXYzOqZf7r776NBBNJ6kviR8R0S+jkFn0+CgyWOsqoWCLvxRpRhWOnW
   YxAGwv/ftKsbs8hoM6jZW9P3FSHXxy5uqqDnV0j7SpNFj5lPzHWBaF1oV
   EXXVnTMFKrNPT3kuvlD8Fjm8BVJbs+d27kuS9LhtSrQN7GlG1Nx06tLUm
   HzR1MQy5qo15PpK8ej2n1RDWrEaNK7HGhnfGhEbJn65w6khneRKWePRUF
   sS8UD0RX7NsLNIvJw+h/ds1bpa7VFeHdL29Fc/J+9fcdTo74TTJY0wr5O
   Q==;
X-CSE-ConnectionGUID: OlZt5j+ORwGEqs8nxldwXQ==
X-CSE-MsgGUID: kp3YHqufTWut0u9BIN3dZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3952406"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3952406"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:53:59 -0800
X-CSE-ConnectionGUID: 8A2peOr/QN+jVyK47LfR7g==
X-CSE-MsgGUID: pu+mjrkkTbid7IZawLBH/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10709647"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2026 15:53:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUYQV-000000004An-2ZgD;
	Fri, 20 Nov 2026 23:53:55 +0000
Date: Sat, 21 Nov 2026 00:53:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8956/10560] main.c:undefined reference to
 `__st_r13_to_r15'
Message-ID: <20261121004452.TskH9STt-lkp@intel.com>
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
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: arc-randconfig-2000-20261120 (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121004452.TskH9STt-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: init/main.o: in function `__traceiter_initcall_finish':
>> main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>> arc-linux-ld: main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/main.o: in function `perf_trace_initcall_start':
>> main.c:(.text+0xe0): undefined reference to `__st_r13_to_r16'
>> arc-linux-ld: main.c:(.text+0xe0): undefined reference to `__st_r13_to_r16'
>> arc-linux-ld: main.c:(.text+0x16e): undefined reference to `__ld_r13_to_r16_ret'
>> arc-linux-ld: main.c:(.text+0x16e): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: init/main.o: in function `perf_trace_initcall_finish':
>> main.c:(.text+0x178): undefined reference to `__st_r13_to_r17'
>> arc-linux-ld: main.c:(.text+0x178): undefined reference to `__st_r13_to_r17'
>> arc-linux-ld: main.c:(.text+0x20c): undefined reference to `__ld_r13_to_r17_ret'
>> arc-linux-ld: main.c:(.text+0x20c): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `trace_event_raw_event_initcall_level':
   main.c:(.text+0x214): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x214): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x2f2): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.text+0x2f2): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `trace_event_raw_event_initcall_start':
   main.c:(.text+0x2fc): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x2fc): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x36e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.text+0x36e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `trace_event_raw_event_initcall_finish':
>> main.c:(.text+0x3a8): undefined reference to `__st_r13_to_r18'
>> arc-linux-ld: main.c:(.text+0x3a8): undefined reference to `__st_r13_to_r18'
>> arc-linux-ld: main.c:(.text+0x41c): undefined reference to `__ld_r13_to_r18_ret'
>> arc-linux-ld: main.c:(.text+0x41c): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: init/main.o: in function `__srcu_read_lock_fast.constprop.0':
   main.c:(.text+0x624): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.text+0x624): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.text+0x678): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: main.c:(.text+0x678): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/main.o: in function `trace_initcall_finish_cb':
>> main.c:(.text+0x680): undefined reference to `__st_r13_to_r19'
>> arc-linux-ld: main.c:(.text+0x680): undefined reference to `__st_r13_to_r19'
>> arc-linux-ld: main.c:(.text+0x764): undefined reference to `__ld_r13_to_r19'
>> arc-linux-ld: main.c:(.text+0x764): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: init/main.o: in function `perf_trace_initcall_level':
   main.c:(.text+0x778): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.text+0x778): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.text+0x856): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: main.c:(.text+0x856): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: init/main.o: in function `do_one_initcall':
   main.c:(.text+0x860): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: main.c:(.text+0x860): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: main.c:(.text+0xd4a): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: main.c:(.text+0xd4a): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: init/main.o: in function `do_early_param':
   main.c:(.init.text+0x78): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0x78): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0x96): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: main.c:(.init.text+0x96): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/main.o: in function `unknown_bootoption':
   main.c:(.init.text+0x17c): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x17c): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x264): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: main.c:(.init.text+0x264): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: init/main.o: in function `xbc_kernel_param_filter':
   main.c:(.init.text+0x2cc): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x2cc): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x322): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: main.c:(.init.text+0x322): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: init/main.o: in function `xbc_make_cmdline':
   main.c:(.init.text+0x37c): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.init.text+0x37c): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.init.text+0x3e2): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.init.text+0x3e2): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `initcall_blacklist':
   main.c:(.init.text+0x444): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x444): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x4f8): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: main.c:(.init.text+0x4f8): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: init/main.o: in function `start_kernel':
   main.c:(.init.text+0x588): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x588): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: init/main.o: in function `kernel_init_freeable':
   main.c:(.init.text+0xcb8): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: main.c:(.init.text+0xcb8): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: main.c:(.init.text+0xff8): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: main.c:(.init.text+0xff8): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: main.c:(.init.text+0x1016): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: main.c:(.init.text+0x1016): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: init/main.o: in function `run_init_process':
   main.c:(.text.unlikely+0x3c): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.text.unlikely+0x3c): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.text.unlikely+0xde): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: main.c:(.text.unlikely+0xde): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: init/main.o: in function `trace_initcall_level':
   main.c:(.text.unlikely+0x210): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x210): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x42e): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x42e): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x43e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.text.unlikely+0x43e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/do_mounts.o: in function `do_mount_root':
   do_mounts.c:(.init.text+0x130): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x130): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x28c): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x28c): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: init/do_mounts.o: in function `mount_root_generic':
   do_mounts.c:(.init.text+0x318): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: do_mounts.c:(.init.text+0x318): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: do_mounts.c:(.init.text+0x4c4): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x4c4): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: init/do_mounts.o: in function `mount_root':
   do_mounts.c:(.init.text+0x598): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x598): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x5ce): undefined reference to `__ld_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x5ce): undefined reference to `__ld_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x7a6): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x7a6): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: init/do_mounts.o: in function `prepare_namespace':
   do_mounts.c:(.init.text+0x7b0): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: do_mounts.c:(.init.text+0x7b0): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: do_mounts.c:(.init.text+0x8b2): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x8b2): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/initramfs.o: in function `do_utime':
   initramfs.c:(.init.text+0x14): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: initramfs.c:(.init.text+0x14): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: initramfs.c:(.init.text+0x3e): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: initramfs.c:(.init.text+0x3e): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/initramfs.o: in function `do_skip':
   initramfs.c:(.init.text+0xc4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: initramfs.c:(.init.text+0xc4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: initramfs.c:(.init.text+0xf8): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: initramfs.c:(.init.text+0xf8): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/initramfs.o: in function `flush_buffer':
   initramfs.c:(.init.text+0x1cc): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: initramfs.c:(.init.text+0x1cc): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: initramfs.c:(.init.text+0x22e): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: initramfs.c:(.init.text+0x22e): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: init/initramfs.o: in function `maybe_link':
   initramfs.c:(.init.text+0x310): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: initramfs.c:(.init.text+0x310): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: initramfs.c:(.init.text+0x4a6): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: initramfs.c:(.init.text+0x4a6): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: init/initramfs.o: in function `do_header':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
