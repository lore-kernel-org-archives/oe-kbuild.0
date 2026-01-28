Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968F33382C4
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588109; cv=none; b=AG5zJ7K76NhBJRqM/ZORRkTut8HCD00mBx3TBnLehbGR1aOAm9W+wjzLrxx4ir+V6Ub0kznPGVFUDkQbsdDpJj1PN4XDGK/kEzQRNa98cvernXceadS7SP2BjkPAlrcgU+zGAtf5uvS3mC0ujebYOmdOPNb01OahJ5QnbVp0+tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588109; c=relaxed/simple;
	bh=nn2gIPnu6N+WxJoXs8ZSww9OI5+RHzYDJVkn6JWb/9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NX2xO6gi/RMJJrdGfqgR0zDfKkOGKQdrbgbTXTYFXfT9JpZoU1wGP7Gm1jjeGMCTTtveM6/Xy+FYOJ4zc9fwhA/oOVwrHMn42bkhlknibmkjkfGa0iBHy0Jz+MEy9A+DavYf6XvfzM1U/1/wFUvh7EvT6mod3Oyi9hdMZe9aWhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cuzt1EPs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cuzt1EPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769588105; x=1801124105;
  h=date:from:to:cc:subject:message-id;
  bh=nn2gIPnu6N+WxJoXs8ZSww9OI5+RHzYDJVkn6JWb/9E=;
  b=Cuzt1EPsWmheEfCO31AN5JlvjxH1mMu0kEWw+s29q/YwFQGsrdtn4Uh+
   PsgqekzPwFty+4zmP9wwtgaYqcFFQtJdiXzugppT5syw3oWOXxpywfnWP
   zYy47a+JR2h12av90hH3nuRGOvExu0/yCW2McF63raDSnRuw0prVTrlfE
   99TUNJtqwpSl8Jgq5xdahRzommztnNvnKABgBk+z3cHmcHqw40dkg2Z+f
   VuQ68+xc2FDvlxNh/W3FLXvzm/Tq6ViAF68KSCWE/DGlt6WnIJdCJYatj
   UF2uyv4PC6OQITvXKVK7qWcXZYlmBIzI2l+2aAjVaD/crwSspSu2FOmCP
   Q==;
X-CSE-ConnectionGUID: 7MFW3HKTQyS9iiQnSb+e9w==
X-CSE-MsgGUID: Fkno/iUbRc2q+HJ+El2G8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74643515"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74643515"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:14:25 -0800
X-CSE-ConnectionGUID: qtf+HvDXTBS1KKEK7eXK6Q==
X-CSE-MsgGUID: OXYg2ObHRxO65oLMbPmkMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231156835"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 00:14:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl0gv-00000000ZRy-30we;
	Wed, 28 Jan 2026 08:14:21 +0000
Date: Wed, 28 Jan 2026 16:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thesofproject:topic/sof-dev-rebase 1/70] ERROR: modpost:
 __ex_table+0x25b0 references non-executable section '.debug_info'
Message-ID: <202601281548.xPq0eCxH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Takashi Iwai <tiwai@suse.de>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   adfec1964f6d77756f58f4204d2afb215e287085
commit: 2edf3800ac259bccb7b6ef57bf541269739564bc [1/70] Merge remote-tracking branch 'takashi/for-next' into sound/upstream-20260123
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-001-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281548.xPq0eCxH-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281548.xPq0eCxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601281548.xPq0eCxH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: mas_dump+0x164 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_u+0x14a (section: .noinstr.text) -> trace_init_flags_sys_enter (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: generic_handle_arch_irq+0xe (section: .noinstr.text) -> .LBE501 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_nmi_enter+0xe0 (section: .noinstr.text) -> early_coherent_pool (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_nmi_exit+0x2a (section: .noinstr.text) -> early_coherent_pool (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_probe_decode_insn+0x162 (section: .kprobes.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_exfat_fs+0x30 (section: .exit.text) -> .L43 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubifs_exit+0xe (section: .exit.text) -> rmem_dma_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_xfs_fs+0x78 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_gfs2_fs+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_f2fs_fs+0x94 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ecdsa_exit+0x18 (section: .exit.text) -> .L59 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: crypto_aegis128_module_exit+0x10 (section: .exit.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: primes_exit+0xf0 (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi+0xfc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi+0x92 (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_ipmi_ssif+0x112 (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hwrng_modexit+0x78 (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpm_exit+0x46 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: null_exit+0x7c (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ublk_exit+0x74 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uacce_exit+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dax_core_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_sr+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_ch_module+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ses_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvme_core_exit+0x50 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvme_core_exit+0x5e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvme_loop_cleanup_module+0x7c (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ata_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_mtd+0x6a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_mtdram+0x32 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_exit+0x74 (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_nvmem_exit+0x86 (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: phy_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: phy_exit+0x20 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_exit+0x30 (section: .exit.text) -> dma_atomic_pool_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_exit+0x40 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mon_exit+0x186 (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: onboard_dev_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gadgetfs_cleanup+0x3a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usbip_host_exit+0x3c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ucsi_module_exit+0x8 (section: .exit.text) -> .LBE601 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: input_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rmi_unregister_physical_driver+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_dev_exit+0x4a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pps_ktimer_exit+0x4c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pps_gen_exit+0x20 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptp_exit+0x24 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_fini+0x40 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_fini+0x50 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_therm_fini+0x38 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_family_ds2405_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_family_29_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_family_12_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_family_1d_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_ds2433_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_ds2433_exit+0x20 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_ds2781_family_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_family_19_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: w1_ds2760_family_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dm_cache_exit+0x28 (section: .exit.text) -> .L46 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_uart_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: speakup_exit+0x94 (section: .exit.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_blk_exit+0x38 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fwctl_exit+0x22 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: comedi_cleanup+0x38 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: iio_exit+0x2c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gnss_module_exit+0x20 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: counter_exit+0x14 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: most_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: x25_exit+0x20 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __wait_for_common+0xb2 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __wait_for_common+0x100 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ww_mutex_unlock+0x16 (section: .sched.text) -> .LBB406 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___down_common+0x21e (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_read_slowpath+0xfe (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_read_slowpath+0x17e (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_read_slowpath+0x1d0 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_read_slowpath+0x3de (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_write_slowpath+0x172 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_write_slowpath+0x27e (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_write_slowpath+0x44e (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_handle_deadlock.isra.0+0x54 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_adjust_prio_chain.isra.0+0x29a (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_adjust_prio_chain.isra.0+0x3a2 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_adjust_prio_chain.isra.0+0x722 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_adjust_prio_chain.isra.0+0xea4 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_adjust_prio_chain.isra.0+0xeee (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_waiter+0x4e0 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_start_proxy_lock+0x96 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_wait_proxy_lock+0x102 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_cleanup_proxy_lock+0xa2 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_write_failed+0x156 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_write_failed+0x1e8 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_write_failed+0x2e0 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read_failed+0x1c2 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read_failed+0x354 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read_failed+0x378 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x25b0 (section: __ex_table) -> .Ldebug_info0 (section: .debug_info)
>> ERROR: modpost: __ex_table+0x25b0 references non-executable section '.debug_info'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25f0 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x25f0 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25f8 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x25f8 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25fc (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x25fc references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2604 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2604 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2608 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2608 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2614 (section: __ex_table) -> .LLRL7 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x2614 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x261c (section: __ex_table) -> .LLRL0 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x261c references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2620 (section: __ex_table) -> .LASF119 (section: .debug_str)
ERROR: modpost: __ex_table+0x2620 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2640 (section: __ex_table) -> .LLRL945 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x2640 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2644 (section: __ex_table) -> .LLRL947 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x2644 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x264c (section: __ex_table) -> .LLRL949 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x264c references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2650 (section: __ex_table) -> .LLRL952 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x2650 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2658 (section: __ex_table) -> .LLRL954 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x2658 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2664 (section: __ex_table) -> .LLRL951 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x2664 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2668 (section: __ex_table) -> .LLRL957 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x2668 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: init_task+0x304 (section: .data.rel) -> .LBB498 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_ptd_info+0x0 (section: .data.rel) -> .LBB498 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hw_failure_emergency_action_work+0x38 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: console_srcu_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: early_srcu_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu9_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu8_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu7_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu6_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu5_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu4_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu3_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu2_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu1_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu0_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_ctlfud_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_ctlf_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_ctl_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_fast_updown_refctl_scale_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_fast_refctl_scale_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_refctl_scale_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: shepherd+0x38 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_mm+0x40 (section: .data.rel) -> dma_contiguous_reserve_area (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_mm+0xf8 (section: .data.rel) -> dma_contiguous_reserve_area (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_mm+0xfc (section: .data.rel) -> dma_contiguous_reserve_area (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_mm+0x100 (section: .data.rel) -> .LBB498 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_mm+0x120 (section: .data.rel) -> .LBB498 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_mm+0x124 (section: .data.rel) -> .LBB498 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: delayed_fput_work+0x38 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: delayed_mntput_work+0x38 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dirtytime_work+0x38 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: reaper_work+0x38 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: quota_release_work+0x38 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dquot_srcu_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: eventfs_srcu_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: key_type_big_key+0x34 (section: .data.rel) -> .LBB334 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gpio_devices_srcu_srcu_usage+0x1f8 (section: .data.rel) -> .LBB348 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_master_fader_leds+0x18 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_master_fader_leds+0x18 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .LBE554 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __compound_literal+0x4 (section: .data.rel) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
