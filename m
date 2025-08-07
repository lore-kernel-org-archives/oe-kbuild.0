Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E225B2FA
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 17:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754588663; cv=none; b=Tmfa7CCYKrF9k3PMrmpuQ0yby60D+KluCQNY6SxweyTEXnEAFZZYMKFw/EOBK67tfwuieQkeRslDN/lPwH8i+qMCyWdOz21HoDzIvTuisxre8oAa2/TCzjdavSJ1OquRUARs4QAaE67bmDAmQOU5Y6stzCUoRFLY8mUcjCuFHhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754588663; c=relaxed/simple;
	bh=PPhQUksGZbgKZFsri2cNuDL7jxiWPCZ3OF4VWqDxAdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H8OirZW5QkUePalUE9YMUMDd12QDfcu2dit6GbjSd4vdaPvzhO1Bno6K1Mwelpqvs8wEjgmQAuCnFmM8LYYkdumlYFuMWvVpMQevKyDZWu8InsYlw0u1ksfYTwwAqVrQBDKE+9bGhXpLvSn8UtzU3Q0ohKaLPx3SMNi/aJa04gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRL5U4Vh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRL5U4Vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754588661; x=1786124661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PPhQUksGZbgKZFsri2cNuDL7jxiWPCZ3OF4VWqDxAdQ=;
  b=MRL5U4Vh+1P3aOHFu0RnTy9eAeHSCqBQ212EVAwFtMywAiIOVL1Okiyc
   nfEyFe/rTghl2V8Y2u4ibkbJ94JVEfLikwW3yMRTCdWq0Fr2bAQkS8xL7
   GZ2UUnFLemztKslVYHoR3n1dYqMJlFGU5hMlvaXsjTWUSTDnwiIEA0vok
   41QSnUynVcaAt7V7Ssf/C34g8R0YsCKWWvgM77O7NTlQCnVXfh6n50NHh
   nPjoU4n5N3paMYVPFyWvB56tFwp4o+LRhfEDseHJDxPrLAKOjK7EgsC60
   z1LckK13nEtF0BBYUWjB0tn+LBk9FQsW3QrZ4rWMCs9jIhDrHqrf0h4Xd
   Q==;
X-CSE-ConnectionGUID: IsWCxhSBSoCt/tFJ4+p8kA==
X-CSE-MsgGUID: Hdw5aYijRky6YQol9/uUdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56807941"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56807941"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:44:18 -0700
X-CSE-ConnectionGUID: Z2b8g6+2Qj6AeBky0ox4yQ==
X-CSE-MsgGUID: CwZlLSASRg2PT1JzV122ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164637795"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2025 10:44:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk4ey-00033g-1k;
	Thu, 07 Aug 2025 17:44:14 +0000
Date: Fri, 8 Aug 2025 01:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:tip/urgent 2/4] ERROR: modpost: __ex_table+0x1584 references
 non-executable section '.rodata.macb_close.str1.4'
Message-ID: <202508080118.up6CJ4nG-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
head:   2a8be06e6de51a37442cd427c5e73c0943edb58b
commit: 33f5f5d5412f11a73fa938e9bdc5299edfff85b7 [2/4] Merge branch into tip/master: 'locking/urgent'
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080118.up6CJ4nG-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080118.up6CJ4nG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080118.up6CJ4nG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x28 (section: .text.xp_alloc) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x2c (section: .text.xp_alloc) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x38 (section: .text.xp_alloc) -> .L84 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x5a (section: .text.xp_alloc) -> .L86 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x6e (section: .text.xp_alloc) -> .L87 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x94 (section: .text.xp_alloc) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x98 (section: .text.xp_alloc) -> .L89 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x9e (section: .text.xp_alloc) -> .L90 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0xc8 (section: .text.xp_alloc) -> .L91 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0xe4 (section: .text.xp_alloc) -> .L91 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x100 (section: .text.xp_alloc) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x11a (section: .text.xp_alloc) -> .L93 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x146 (section: .text.xp_alloc) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x150 (section: .text.xp_alloc) -> .L95 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x186 (section: .text.xp_alloc) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x18c (section: .text.xp_alloc) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x194 (section: .text.xp_alloc) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x1a8 (section: .text.xp_alloc) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x1ac (section: .text.xp_alloc) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x1b2 (section: .text.xp_alloc) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x1b8 (section: .text.xp_alloc) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc_batch+0x15a (section: .text.xp_alloc_batch) -> numa_parse_early_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x14c (section: .text.xp_dma_map) -> pcpu_cpu_distance (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x1a0 (section: .text.xp_dma_map) -> pcpu_cpu_distance (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x136 (section: .text.xp_assign_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x16c (section: .text.xp_assign_dev) -> .L16 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x174 (section: .text.xp_assign_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x236 (section: .text.xp_assign_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x264 (section: .text.xp_assign_dev) -> .L13 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x26c (section: .text.xp_assign_dev) -> .L16 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x274 (section: .text.xp_assign_dev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x2a4 (section: .text.xp_assign_dev) -> dummy_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x52 (section: .text.xp_clear_dev) -> dummy_numa_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_register_range+0x10 (section: .text.logic_pio_register_range) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_register_range+0x16 (section: .text.logic_pio_register_range) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_register_range+0x1e (section: .text.logic_pio_register_range) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_register_range+0x28 (section: .text.logic_pio_register_range) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_unregister_range+0x10 (section: .text.logic_pio_unregister_range) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_to_hwaddr+0x62 (section: .text.logic_pio_to_hwaddr) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xba (section: .text.mt_free_walk) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xc2 (section: .text.mt_free_walk) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xc8 (section: .text.mt_free_walk) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xd4 (section: .text.mt_free_walk) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0xdc (section: .text.mt_free_walk) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0x12a (section: .text.mt_free_walk) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0x158 (section: .text.mt_free_walk) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0x1d2 (section: .text.mt_free_walk) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_free_walk+0x1da (section: .text.mt_free_walk) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x33a (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x350 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x360 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x402 (section: .text.mas_empty_area) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4ba (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4c4 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4d2 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4f2 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x51c (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x532 (section: .text.mas_empty_area) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x5f0 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xc2 (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xf2 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x14e (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x156 (section: .text.mt_validate) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x25e (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x266 (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x2bc (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x2ec (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x30c (section: .text.mt_validate) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x314 (section: .text.mt_validate) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x4de (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x58c (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x5a2 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x5b2 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x688 (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x694 (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x69c (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xa68 (section: .text.mt_validate) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xa76 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xc10 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xc36 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xc60 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0xf6 (section: .text.vbin_printf) -> tps6594_esm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x100 (section: .text.vbin_printf) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x12e (section: .text.vbin_printf) -> tps6594_pfsm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x142 (section: .text.vbin_printf) -> tps6594_esm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x16c (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vbin_printf+0x194 (section: .text.vbin_printf) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.efi_pe_entry) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.exit_boot_func) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.exit_boot_func) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.exit_boot_func) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.exit_boot_func) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.exit_boot_func) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.exit_boot_func) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.exit_boot_func) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.get_fdt) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.get_fdt) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.efi_boot_kernel) -> pm886_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.efi_boot_kernel) -> pm805_i2c_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> 0x0 (section: .rodata.macb_close.str1.4)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.macb_close.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> 0x0 (section: .rodata.macb_features_check.str1.4)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.rodata.macb_features_check.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> 0x0 (section: .rodata.macb_interrupt.str1.4)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.macb_interrupt.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> 0x0 (section: .rodata.macb_mii_probe.str1.4)
ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.macb_mii_probe.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> 0x0 (section: .rodata.macb_phylink_connect.str1.4)
ERROR: modpost: __ex_table+0x159c references non-executable section '.rodata.macb_phylink_connect.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> 0x0 (section: .rodata.macb_mii_probe.str1.4)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.rodata.macb_mii_probe.str1.4'
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
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .LASF341 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .LASF343 (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LASF345 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LASF343 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> .LASF348 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> .LASF350 (section: .debug_str)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> .LASF352 (section: .debug_str)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> .LASF343 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> .LASF2630 (section: .debug_str)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> .LASF2632 (section: .debug_str)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> .LASF2634 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> .LASF2636 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> .LASF3077 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> .LASF3079 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
