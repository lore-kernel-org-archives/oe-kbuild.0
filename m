Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B6F25DD07
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754573941; cv=none; b=KU2Zjo7PS7Ks91piSG4qXJfuM7qUTHuGUtu/5DJUSd854fz/u1za0QX3S7qQMB0iEDC3o4aUwNoEi52qCvkk/TOhvVV0qwc+b95tibQJW2y1UJp1I/IbZnjyw+Ws6ytXHoZB9HEZD4E+Ok90E2KpQYM7zm/RKaM4aN8/s62pAlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754573941; c=relaxed/simple;
	bh=SX/MkGEfWf8NmPI8awy/2Dx8FZVwaWH+8yMl0pmX7R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aa0XxYu0H+p2SeZwCqVQBvv3YPtgO0otEdddQ4Dk4bYSxhe5IRuT/N7MZm5JkiFO77Sb1eW0tRJhUAIAndBxj6LIE+xX3ZybjcHPwW6Y+Lx/DtZ+aEETWbON5s/pND07SA+ysoEfIk3kVb0FRoPi0Wxh/l1/alwB3IIJE2azRuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RW8fCBIZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RW8fCBIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754573939; x=1786109939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SX/MkGEfWf8NmPI8awy/2Dx8FZVwaWH+8yMl0pmX7R8=;
  b=RW8fCBIZeyEowqy9fiMd6kYX+zUOcKmGpaMixMafti2F8EqUSM7XTmYH
   /d1xKWLeoCDZVHiLRCQf7tO+pMukucOZ1uxAkWlvzz8zMIb12ZjuUkKvA
   ld4mDu/cja1rj/lOeL1Cp5FzEH45KDjCZlvY48f/LnZNAaZcRciOWu1EX
   fZamjQiAg8ckKxq4a9ZbF6IPJBshGGCXfiJ0EOEV9grU8w3UFeZT+U8g0
   9Ql7GAuwQByuHaPcO43B9+K2hBHEQ7lX7bMMnrYBRjjCycH2wcyESYRQk
   k26dyzKn2IZEat50iECu9GME4uWVNyfCd5dNYL9BjuvCjOZSj4ZHv6qex
   A==;
X-CSE-ConnectionGUID: 3ykIeEaGTL2L8SCoek77aA==
X-CSE-MsgGUID: w88+GKEDReCtkn3hjStXLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56986813"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56986813"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 06:38:56 -0700
X-CSE-ConnectionGUID: g5nTzOWWSQaNwAP0AsyvUg==
X-CSE-MsgGUID: HxIA1SfTSWuljhox5N/8Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165479522"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2025 06:38:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk0pY-0002qM-1w;
	Thu, 07 Aug 2025 13:38:52 +0000
Date: Thu, 7 Aug 2025 21:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:master 6/6] ERROR: modpost: __ex_table+0x1584 references
 non-executable section '.rodata.ks8851_get_drvinfo.str1.4'
Message-ID: <202508072132.fF6YSh7l-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   f31b0ec5758022cf4ad4a81232be289df9bbbbff
commit: f31b0ec5758022cf4ad4a81232be289df9bbbbff [6/6] Merge branch into tip/master: 'timers/clocksource'
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072132.fF6YSh7l-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072132.fF6YSh7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072132.fF6YSh7l-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: xp_disable_drv_zc+0xac (section: .text.xp_disable_drv_zc) -> pcpu_cpu_distance (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_disable_drv_zc+0xb4 (section: .text.xp_disable_drv_zc) -> .L17 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_disable_drv_zc+0xb8 (section: .text.xp_disable_drv_zc) -> .L36 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_disable_drv_zc+0xbc (section: .text.xp_disable_drv_zc) -> .L18 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_disable_drv_zc+0xc0 (section: .text.xp_disable_drv_zc) -> .L20 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_disable_drv_zc+0xc4 (section: .text.xp_disable_drv_zc) -> .L14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_disable_drv_zc+0xc8 (section: .text.xp_disable_drv_zc) -> .L22 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_disable_drv_zc+0xd6 (section: .text.xp_disable_drv_zc) -> pcpu_cpu_distance (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_xskb+0x18 (section: .text.xp_get_xskb) -> numa_emu_update_cpu_to_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_xskb+0x1e (section: .text.xp_get_xskb) -> .L61 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_xskb+0x22 (section: .text.xp_get_xskb) -> .L62 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_xskb+0x3a (section: .text.xp_get_xskb) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_xskb+0x54 (section: .text.xp_get_xskb) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_xskb+0xa0 (section: .text.xp_get_xskb) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_get_xskb+0xee (section: .text.xp_get_xskb) -> .L70 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x18 (section: .text.xp_alloc) -> .L86 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x1e (section: .text.xp_alloc) -> .L87 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x28 (section: .text.xp_alloc) -> .L73 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x2c (section: .text.xp_alloc) -> .L84 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x38 (section: .text.xp_alloc) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x5a (section: .text.xp_alloc) -> .L89 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x6e (section: .text.xp_alloc) -> .L90 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x94 (section: .text.xp_alloc) -> .L91 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x98 (section: .text.xp_alloc) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x9e (section: .text.xp_alloc) -> .L93 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0xc8 (section: .text.xp_alloc) -> .L95 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0xe4 (section: .text.xp_alloc) -> .L95 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x194 (section: .text.xp_alloc) -> .L91 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x1b2 (section: .text.xp_alloc) -> .L91 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x1b8 (section: .text.xp_alloc) -> .L91 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_unmap+0x7a (section: .text.xp_dma_unmap) -> __setup_numa_parse_early_param (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x11c (section: .text.xp_dma_map) -> __setup_numa_parse_early_param (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x1b0 (section: .text.xp_dma_map) -> __setup_numa_parse_early_param (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: xp_destroy+0xa (section: .text.xp_destroy) -> __setup_str_numa_parse_early_param (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: xp_create_and_assign_umem+0x2a6 (section: .text.xp_create_and_assign_umem) -> __setup_str_numa_parse_early_param (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x136 (section: .text.xp_assign_dev) -> .L14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x16c (section: .text.xp_assign_dev) -> .L18 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x174 (section: .text.xp_assign_dev) -> .L14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x236 (section: .text.xp_assign_dev) -> .L14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x264 (section: .text.xp_assign_dev) -> .L17 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x26c (section: .text.xp_assign_dev) -> .L18 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x274 (section: .text.xp_assign_dev) -> .L14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_release_deferred+0x64 (section: .text.xp_release_deferred) -> __setup_str_numa_parse_early_param (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_register_range+0xcc (section: .text.logic_pio_register_range) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_register_range+0x128 (section: .text.logic_pio_register_range) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_to_hwaddr+0x42 (section: .text.logic_pio_to_hwaddr) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0x9e (section: .text.mt_free_walk) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xa6 (section: .text.mt_free_walk) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xae (section: .text.mt_free_walk) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xc2 (section: .text.mt_free_walk) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xc8 (section: .text.mt_free_walk) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xca (section: .text.mt_free_walk) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0x11c (section: .text.mt_free_walk) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0x1cc (section: .text.mt_free_walk) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x2be (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x3c2 (section: .text.mas_empty_area) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x466 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x484 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4b2 (section: .text.mas_empty_area) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x6e (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x82 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xf2 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xfe (section: .text.mt_validate) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x240 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x248 (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x25e (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x2c8 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x4a6 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x542 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x63c (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x65a (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x668 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x6e8 (section: .text.mt_validate) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x740 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uuid_string+0x4c (section: .text.uuid_string) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uuid_string+0x10c (section: .text.uuid_string) -> wcd934x_slim_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x62 (section: .text.vbin_printf) -> tps6594_esm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x90 (section: .text.vbin_printf) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0xe2 (section: .text.vbin_printf) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x100 (section: .text.vbin_printf) -> tps6594_esm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x12e (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x138 (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x156 (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x17c (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x188 (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x1a8 (section: .text.vbin_printf) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x1b8 (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x1d2 (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x204 (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x20e (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x22a (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x25e (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x272 (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.exit_boot_func) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.exit_boot_func) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.exit_boot_func) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.get_fdt) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.efi_boot_kernel) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.efi_boot_kernel) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> 0x0 (section: .rodata.ks8851_get_drvinfo.str1.4)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.ks8851_get_drvinfo.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> 0x0 (section: .rodata.ks8851_net_open.str1.4)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.rodata.ks8851_net_open.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> 0x0 (section: .rodata.ks8851_probe_common.str1.4)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.ks8851_probe_common.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> __func__ (section: .rodata.__func__.83069)
ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.__func__.83069'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> ks8851_match_table (section: .rodata.ks8851_match_table)
>> ERROR: modpost: __ex_table+0x159c references non-executable section '.rodata.ks8851_match_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> __func__ (section: .rodata.__func__.83069)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.rodata.__func__.83069'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> .L0  (section: __jump_table)
ERROR: modpost: __ex_table+0x15ac references non-executable section '__jump_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF151 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF153 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF155 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF157 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> .LASF159 (section: .debug_str)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .LASF161 (section: .debug_str)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> .LASF163 (section: .debug_str)
ERROR: modpost: __ex_table+0x168c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1690 (section: __ex_table) -> .LASF157 (section: .debug_str)
ERROR: modpost: __ex_table+0x1690 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1698 (section: __ex_table) -> .LASF166 (section: .debug_str)
ERROR: modpost: __ex_table+0x1698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x169c (section: __ex_table) -> .LASF157 (section: .debug_str)
ERROR: modpost: __ex_table+0x169c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> .LASF169 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> .LASF171 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> .LASF203 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> .LASF205 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> .LASF207 (section: .debug_str)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> .LASF209 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .LASF2843 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .LASF2845 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LASF3268 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .LASF3270 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LASF3272 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .LASF3270 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .LASF3275 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .LASF3270 (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .LASF3278 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .LASF3280 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LASF3282 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .LASF3270 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f4 (section: __ex_table) -> .LASF1331 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .LASF1333 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .LASF1335 (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .LASF1337 (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f4 (section: __ex_table) -> .LLST221 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .LASF344 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .LASF346 (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LASF348 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LASF346 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .LASF351 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF353 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> .LASF355 (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> .LASF346 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> .LASF2633 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> .LASF2635 (section: .debug_str)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> .LASF2637 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> .LASF2639 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> .LASF3080 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF3082 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> .LASF3084 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
