Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1F171B1
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Nov 2023 23:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNxA0gOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701041542; x=1732577542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PxWdLXQJPnfKsFl8JWRPOz0ZTfKsV8QO82/Q2ApDvi8=;
  b=dNxA0gOLHJKvfhy0iLCND38ACUdNphSNb7Di+PWL+xO05m3URQe6/39K
   kTtY32PKIZhs4AuMXAvs+jAKvLINfYs5IiHKpjmx0l3PWKGFxj4PjDhbE
   cI1qk2GgUh9dUW2zIROLuvZR3qvNFNSfSWx5X8PkchuGMBaFyIzW8ULz3
   SPH25WDua9IzSgmhEI1G86m2iyW6E1nG3SGr3wHjW1UZyJ7qoSif74HGs
   HAKQi/Vglmh5HadGF9Q+ao1zexd2VRxHL/xU6yzC1nkCf7X2WBEsOr+ra
   e2kAvVorpKeCRr5Ogl+CPL+cIDOgI+mNIJq5ZdSd+HlSyJbMlzVs36BSN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372768307"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="372768307"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 15:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="858862279"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="858862279"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2023 15:32:17 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Obn-0005d8-1B;
	Sun, 26 Nov 2023 23:32:15 +0000
Date: Mon, 27 Nov 2023 07:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kernel/traps.c:407 die() warn: variable dereferenced
 before check 'regs' (see line 401)
Message-ID: <202311270400.2cHw6Jsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qi Hu <huqi@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

Hi Qi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2da77f431ac49b5763b88751a75f70daa46296c
commit: 346dc929623cef70ff7832a4fa0ffd1b696e312a LoongArch: Fix the write_fcsr() macro
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270400.2cHw6Jsv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270400.2cHw6Jsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311270400.2cHw6Jsv-lkp@intel.com/

New smatch warnings:
arch/loongarch/kernel/traps.c:407 die() warn: variable dereferenced before check 'regs' (see line 401)

Old smatch warnings:
arch/loongarch/kernel/traps.c:112 show_stacktrace() error: uninitialized symbol 'stackdata'.
arch/loongarch/kernel/traps.c:154 show_code() error: uninitialized symbol 'insn'.
arch/loongarch/kernel/traps.c:696 do_bp() error: uninitialized symbol 'opcode'.

vim +/regs +407 arch/loongarch/kernel/traps.c

0603839b18f4fb Huacai Chen  2022-05-31  384  
0603839b18f4fb Huacai Chen  2022-05-31  385  void __noreturn die(const char *str, struct pt_regs *regs)
0603839b18f4fb Huacai Chen  2022-05-31  386  {
0603839b18f4fb Huacai Chen  2022-05-31  387  	static int die_counter;
0603839b18f4fb Huacai Chen  2022-05-31  388  	int sig = SIGSEGV;
0603839b18f4fb Huacai Chen  2022-05-31  389  
0603839b18f4fb Huacai Chen  2022-05-31  390  	oops_enter();
0603839b18f4fb Huacai Chen  2022-05-31  391  
0603839b18f4fb Huacai Chen  2022-05-31  392  	if (notify_die(DIE_OOPS, str, regs, 0, current->thread.trap_nr,
0603839b18f4fb Huacai Chen  2022-05-31  393  		       SIGSEGV) == NOTIFY_STOP)
0603839b18f4fb Huacai Chen  2022-05-31  394  		sig = 0;
0603839b18f4fb Huacai Chen  2022-05-31  395  
0603839b18f4fb Huacai Chen  2022-05-31  396  	console_verbose();
0603839b18f4fb Huacai Chen  2022-05-31  397  	raw_spin_lock_irq(&die_lock);
0603839b18f4fb Huacai Chen  2022-05-31  398  	bust_spinlocks(1);
0603839b18f4fb Huacai Chen  2022-05-31  399  
0603839b18f4fb Huacai Chen  2022-05-31  400  	printk("%s[#%d]:\n", str, ++die_counter);
0603839b18f4fb Huacai Chen  2022-05-31 @401  	show_registers(regs);
0603839b18f4fb Huacai Chen  2022-05-31  402  	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
0603839b18f4fb Huacai Chen  2022-05-31  403  	raw_spin_unlock_irq(&die_lock);
0603839b18f4fb Huacai Chen  2022-05-31  404  
0603839b18f4fb Huacai Chen  2022-05-31  405  	oops_exit();
0603839b18f4fb Huacai Chen  2022-05-31  406  
4e62d1d86585e1 Youling Tang 2022-10-12 @407  	if (regs && kexec_should_crash(current))
4e62d1d86585e1 Youling Tang 2022-10-12  408  		crash_kexec(regs);
4e62d1d86585e1 Youling Tang 2022-10-12  409  
0603839b18f4fb Huacai Chen  2022-05-31  410  	if (in_interrupt())
0603839b18f4fb Huacai Chen  2022-05-31  411  		panic("Fatal exception in interrupt");
0603839b18f4fb Huacai Chen  2022-05-31  412  
0603839b18f4fb Huacai Chen  2022-05-31  413  	if (panic_on_oops)
0603839b18f4fb Huacai Chen  2022-05-31  414  		panic("Fatal exception");
0603839b18f4fb Huacai Chen  2022-05-31  415  
0603839b18f4fb Huacai Chen  2022-05-31  416  	make_task_dead(sig);
0603839b18f4fb Huacai Chen  2022-05-31  417  }
0603839b18f4fb Huacai Chen  2022-05-31  418  

:::::: The code at line 407 was first introduced by commit
:::::: 4e62d1d86585e1b62b4f96ee586881dd45a443dc LoongArch: Add kdump support

:::::: TO: Youling Tang <tangyouling@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
