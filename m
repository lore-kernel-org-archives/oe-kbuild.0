Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B826F291
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708608; cv=none; b=NzQpYxM4C3kEosuVRVj/sPiLnrBQUL3SUbZc3MS/8FBtMp5DfBopcL+MhX4E4qvjplu1DegHK7wTsPM56buihBfaaq/MmuXiYLnvWTah2BpK6a6Te5+o5ZaxS3WICK2f9A71/QN0EvcUIw0V/8ivizK4j6aIvhjUIa96Qkx90lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708608; c=relaxed/simple;
	bh=9QKc4qeqc3HOk6KS4zm99lY/fV3aCuskufNZlKdOfSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BEU+i5I06kA7bXFRi9GTh7voN53v7b/qQbYmjKspnXIwPnZqysAOwzQZALulI+ZShoUPlRhwWaBetZeNTduT/XMAmyRWAU7DxQyZ5KKYhvT17S/uA78KzXVeUz1lGVCL7c0AWmnxqhcDWCZ7nchWNqzaT+0gpnecEUixr8oSMew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfVZhVHp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfVZhVHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767708606; x=1799244606;
  h=date:from:to:cc:subject:message-id;
  bh=9QKc4qeqc3HOk6KS4zm99lY/fV3aCuskufNZlKdOfSA=;
  b=PfVZhVHp6CxYxL0MT8inQ6xirPpFKKCYkbJrhmLGlbtQP59gMGQKrqwK
   CJuGJTovQr+bpHtlAiHi3n0BwDUTTnTw3LiQE12uWaBqIzYxn4w4ia7aY
   vPU+Hl87zgCv2EzitU5VsYvQRu7Zkbw9gAKgJL9HpE0CbhCaGWrrL9N0V
   bAA7y6HukHh1PcEMvopa08R1Crmmez2c2BjFiawSK7I5CnBf7ftdk4H4g
   w8g3DNnmBAJiN8BcwczgBhjOR0tRAz2Zt9axrWrDUAfldWlUVeVkXFHw3
   eNwFQ78VJ3bMbIVeTvGt/yA+XHTWWK/FpNsGmeFelUzTw6MqRvAU0ID6N
   Q==;
X-CSE-ConnectionGUID: h1o88t61R7KzVqxpjw7nFA==
X-CSE-MsgGUID: UcLwwlwPQvO+9apjcB4VwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79706240"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="79706240"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 06:10:05 -0800
X-CSE-ConnectionGUID: u46ai/mxSOeZe6KLyzOswg==
X-CSE-MsgGUID: 4oY6SzwkRayUa2AJRprWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202681819"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jan 2026 06:10:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd7l3-0000000020B-2amV;
	Tue, 06 Jan 2026 14:10:01 +0000
Date: Tue, 06 Jan 2026 22:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/40] arch/parisc/kernel/firmware.c:1309
 pdc_soft_power_button_panic() error: uninitialized symbol 'flags'.
Message-ID: <202601062240.UYiLj36s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   c10d860e0baae0853773dc90a94b26adc5687380
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/40] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: parisc-randconfig-r073-20260106 (https://download.01.org/0day-ci/archive/20260106/202601062240.UYiLj36s-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601062240.UYiLj36s-lkp@intel.com/

New smatch warnings:
arch/parisc/kernel/firmware.c:1309 pdc_soft_power_button_panic() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/parisc/kernel/firmware.c:817 pdc_stable_read() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:843 pdc_stable_write() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:868 pdc_stable_get_size() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:888 pdc_stable_verify_contents() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:907 pdc_stable_initialize() warn: inconsistent indenting

vim +/flags +1309 arch/parisc/kernel/firmware.c

^1da177e4c3f415 Linus Torvalds       2005-04-16  1297  
829632dae832178 Guilherme G. Piccoli 2023-02-20  1298  int pdc_soft_power_button_panic(int sw_control)
829632dae832178 Guilherme G. Piccoli 2023-02-20  1299  {
829632dae832178 Guilherme G. Piccoli 2023-02-20  1300  	int retval;
829632dae832178 Guilherme G. Piccoli 2023-02-20  1301  	unsigned long flags;
829632dae832178 Guilherme G. Piccoli 2023-02-20  1302  
829632dae832178 Guilherme G. Piccoli 2023-02-20  1303  	if (!spin_trylock_irqsave(&pdc_lock, flags)) {
829632dae832178 Guilherme G. Piccoli 2023-02-20  1304  		pr_emerg("Couldn't enable soft power button\n");
829632dae832178 Guilherme G. Piccoli 2023-02-20  1305  		return -EBUSY; /* ignored by the panic notifier */
829632dae832178 Guilherme G. Piccoli 2023-02-20  1306  	}
829632dae832178 Guilherme G. Piccoli 2023-02-20  1307  
829632dae832178 Guilherme G. Piccoli 2023-02-20  1308  	retval = mem_pdc_call(PDC_SOFT_POWER, PDC_SOFT_POWER_ENABLE, __pa(pdc_result), sw_control);
829632dae832178 Guilherme G. Piccoli 2023-02-20 @1309  	spin_unlock_irqrestore(&pdc_lock, flags);
829632dae832178 Guilherme G. Piccoli 2023-02-20  1310  
829632dae832178 Guilherme G. Piccoli 2023-02-20  1311  	return retval;
829632dae832178 Guilherme G. Piccoli 2023-02-20  1312  }
829632dae832178 Guilherme G. Piccoli 2023-02-20  1313  

:::::: The code at line 1309 was first introduced by commit
:::::: 829632dae8321787525ee37dc4828bbe6edafdae parisc: Replace regular spinlock with spin_trylock on panic path

:::::: TO: Guilherme G. Piccoli <gpiccoli@igalia.com>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
