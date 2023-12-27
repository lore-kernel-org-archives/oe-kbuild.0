Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A344596F
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Dec 2023 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kN6T4NTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703692563; x=1735228563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZCk0Nlceek1NIyHUPivSV+H5r25SrCc1ZoiVDbVG1r4=;
  b=kN6T4NTg9YU47EIDNgE/VkusF9khwSGvugJR8iNov7lOyXK+c0GWdNy8
   ERx8YKl8MQU4HiDH9aG4Ep4V/i/4lPQxjBSG0qlgFbzvxu1iDReO0M6on
   7gO3iByOI4TLJMM1QkVuI4Qdaezy4o2gboqlUwDuWsg9q4sNyhD3yDqzf
   rVpQhB9whrAqFAj/QfDRwu0j9adRpuC5bo03wKaoHyEWCVjMp9PGXV3zU
   LAExbg2GxvwfFlY5IT1c4SpDUfsJLWvpywOayW9s051gol3AB32eB8Gwk
   ODpOdSfxDmrpj0/dAo+mRBuISa58LF0ZzhsxxLMXvaBNat9oc4VWdQ0DG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="393609394"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="393609394"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 07:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="901710915"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="901710915"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Dec 2023 07:56:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIWGF-000FVt-09;
	Wed, 27 Dec 2023 15:55:59 +0000
Date: Wed, 27 Dec 2023 23:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: (.entry.text+0x58): relocation truncated to fit: R_ARM_PC24 against
 symbol `bad_mode' defined in .text.unlikely section in
 arch/arm/kernel/traps.o
Message-ID: <202312272343.xEqwI4e3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: (.entry.text+0x58): relocation truncated to fit: R_ARM_PC24 against symbol `bad_mode' defined in .text.unlikely section in arch/arm/kernel/traps.o"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Russell King <rmk+kernel@armlinux.org.uk>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Abbott Liu <liuwenliang@huawei.com>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbafc3e621c3f4ded43720fdb1d6ce1728ec664e
commit: 421015713b306e47af95d4d61cdfbd96d462e4cb ARM: 9017/2: Enable KASan for ARM
date:   3 years, 2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 years, 2 months ago
config: arm-randconfig-r122-20231225 (https://download.01.org/0day-ci/archive/20231227/202312272343.xEqwI4e3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231227/202312272343.xEqwI4e3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312272343.xEqwI4e3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arch/arm/kernel/entry-armv.o: in function `common_invalid':
>> (.entry.text+0x58): relocation truncated to fit: R_ARM_PC24 against symbol `bad_mode' defined in .text.unlikely section in arch/arm/kernel/traps.o
   kernel/softirq.o: in function `_local_bh_enable':
   softirq.c:(.text+0x214): relocation truncated to fit: R_ARM_PC24 against symbol `warn_slowpath_fmt' defined in .text.unlikely section in kernel/panic.o
   kernel/softirq.o: in function `run_ksoftirqd':
   softirq.c:(.text+0x278): relocation truncated to fit: R_ARM_PC24 against symbol `_cond_resched' defined in .sched.text section in kernel/sched/core.o
   kernel/softirq.o: in function `__local_bh_enable_ip':
   softirq.c:(.text+0x3a0): relocation truncated to fit: R_ARM_PC24 against symbol `warn_slowpath_fmt' defined in .text.unlikely section in kernel/panic.o
   kernel/softirq.o: in function `tasklet_kill':
   softirq.c:(.text+0xb44): relocation truncated to fit: R_ARM_PC24 against symbol `printk' defined in .text.unlikely section in kernel/printk/printk.o
   softirq.c:(.text+0xb78): relocation truncated to fit: R_ARM_PC24 against symbol `yield' defined in .sched.text section in kernel/sched/core.o
   kernel/softirq.o: in function `spawn_ksoftirqd':
   softirq.c:(.init.text+0x28): relocation truncated to fit: R_ARM_PC24 against symbol `__cpuhp_setup_state' defined in .text section in kernel/cpu.o
   softirq.c:(.init.text+0x30): relocation truncated to fit: R_ARM_PC24 against symbol `smpboot_register_percpu_thread' defined in .text section in kernel/smpboot.o
   kernel/softirq.o: in function `__do_softirq':
   softirq.c:(.softirqentry.text+0x1f8): relocation truncated to fit: R_ARM_PC24 against symbol `printk' defined in .text.unlikely section in kernel/printk/printk.o
   softirq.c:(.softirqentry.text+0x3a4): relocation truncated to fit: R_ARM_PC24 against symbol `warn_slowpath_fmt' defined in .text.unlikely section in kernel/panic.o
   kernel/softirq.o: in function `_sub_D_65535_0':
   softirq.c:(.text.exit+0x14): additional relocation overflows omitted from the output

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/endpoint/functions/pci-epf-test.c:288:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dest @@     got void [noderef] __iomem *[assigned] dst_addr @@
   drivers/pci/endpoint/functions/pci-epf-test.c:288:17: sparse:     expected void *dest
   drivers/pci/endpoint/functions/pci-epf-test.c:288:17: sparse:     got void [noderef] __iomem *[assigned] dst_addr
>> drivers/pci/endpoint/functions/pci-epf-test.c:288:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *src @@     got void [noderef] __iomem *[assigned] src_addr @@
   drivers/pci/endpoint/functions/pci-epf-test.c:288:17: sparse:     expected void const *src
   drivers/pci/endpoint/functions/pci-epf-test.c:288:17: sparse:     got void [noderef] __iomem *[assigned] src_addr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
