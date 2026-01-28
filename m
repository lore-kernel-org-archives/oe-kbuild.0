Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FE2BEC2E
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769602121; cv=none; b=C14qJOjqaPw5JlOD+NZNskmt9Zvqd+1dNPB0zp4naOF9npOpYf5dBgA5UcDN4emL+rAcwvco3BSi3orfxkgjfddhU5W4c8BeCUNFVITV/k1qm5hnP5mLNhz7GOcLkrHx/p4K41xqtutEs5poWPnc4mMzU/XfBQ/HOxzZfAPLcsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769602121; c=relaxed/simple;
	bh=/ubPyyxnasw93KhVsMRYv8Z1FXQ2hwu82Z20tEdcShc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YIFMbPfpp+Hc02fg4GZD5/AM6hE8zGRCH3dBbevOkSJ3cpWZiSH4/7nDWGQE4diDJ4M5a/2DbXjQxs9tN8zYqV5hpuVVJkmZbcsxPJ6Cy3W2P2hIde9f9wLb/TmFDSwM1hjvRWwcA7RZI7NQsRt9sAZo/8FJgnging4g/lp7fjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AH/1JTqz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AH/1JTqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769602117; x=1801138117;
  h=date:from:to:cc:subject:message-id;
  bh=/ubPyyxnasw93KhVsMRYv8Z1FXQ2hwu82Z20tEdcShc=;
  b=AH/1JTqz+vUrQdXl8FRgB/YTUA4DKBDJsLD85Me2lZT8JgCLCdNHuUq+
   OO3F0U1KIWY8++DALg9tWgKAjnqZvRxM3H4qqrWBhLSd0NSgBM8mm0uSg
   GO2D7wLXQqMeHYX1V4h/4Jm80g+3I+0kH8NPZ0vie0YcltxT4GXZO5EVx
   UadOaefu4rTRDhy0iR8jBcurJP5O9Sx0Xlv5B1VlkD4HKcPC0ipUY9J+d
   t0f15dE8x92TK98nnm1OUUbv/YspLr/ZIxiei3q+WwWB9Ao2Ajc7kGzki
   e83lSlLi017BuxKvhARmFyHcK2ZFG200GEx4GF/xT0aDIdm0HSr1QdEmF
   Q==;
X-CSE-ConnectionGUID: EfCwOdcHSkq/hcu6R6HGZQ==
X-CSE-MsgGUID: nuofXHprTTO6bzmlBnXJhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70009999"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70009999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:08:36 -0800
X-CSE-ConnectionGUID: jpvSlSw1Tza+cWRHWI/mJw==
X-CSE-MsgGUID: qrVAkZuVRYeYPL5RNRHyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208692297"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jan 2026 04:08:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl4LY-00000000Zds-1o6Y;
	Wed, 28 Jan 2026 12:08:32 +0000
Date: Wed, 28 Jan 2026 20:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-pinctrl:devel 25/47] ERROR: modpost:
 __ex_table+0x25fc references non-executable section '.data..ro_after_init'
Message-ID: <202601282023.OyBTj6qL-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   c0b4a4feeb43305a754893d8d9c6b2b5a52d45ac
commit: 6fe3b96b051d0ce4cbc0b76008fef0653f2e21ab [25/47] pinctrl: aw9523: Simplify locking with guard()
:::::: branch date: 4 hours ago
:::::: commit date: 10 days ago
config: riscv-randconfig-001-20260128 (https://download.01.org/0day-ci/archive/20260128/202601282023.OyBTj6qL-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601282023.OyBTj6qL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601282023.OyBTj6qL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: io_uring_cancel_generic+0x2d4 (section: .text.unlikely) -> rmem_dma_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: io_probe.isra.0+0xfa (section: .text.unlikely) -> .LBB581 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0xdc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lwq_test+0xd6 (section: .text.unlikely) -> size_cmdline (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: lwq_test+0x162 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lwq_test+0x1d4 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lwq_test+0x260 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kunit_log_newline_test+0x16e (section: .text.unlikely) -> early_cma_pernuma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kunit_log_newline_test+0x1c4 (section: .text.unlikely) -> early_cma_pernuma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pfuze_parse_regulators_dt+0x11a (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: try_to_generate_entropy+0x456 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpm_tis_probe_irq_single+0x224 (section: .text.unlikely) -> dma_numa_cma_reserve (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __dev_printk+0x2c (section: .text.unlikely) -> .L115 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: delete_path.isra.0+0xc6 (section: .text.unlikely) -> .LBB574 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfcsim_link_new+0x7c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfcsim_link_new+0xe4 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfcsim_device_new+0x7e (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfcsim_device_new+0xe0 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvme_anatt_timeout+0x28 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: register_device+0x94 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: register_device+0xf4 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uio_major_cleanup+0x24 (section: .text.unlikely) -> early_coherent_pool (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hub_configure+0x94 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hub_configure+0x104 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hub_configure+0x1c2 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hub_configure+0x232 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: register_root_hub+0x210 (section: .text.unlikely) -> trace_init_flags_sys_enter (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: associate_dev+0x94 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: associate_dev+0x104 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: emi26_load_firmware.isra.0+0x92 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: emi26_load_firmware.isra.0+0xfc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ffs_epfiles_create+0x1a8 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: elan_setup_input_device+0x78 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_input_params+0x1a6 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_input_params+0x238 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: raid5_set_limits+0x8e (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: autorun_devices+0x472 (section: .text.unlikely) -> .LBB292 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btmrvl_wake_irq_bt+0x32 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_test_save_transfer_result+0xb2 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_test_save_transfer_result+0x122 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __netdev_printk+0x3a (section: .text.unlikely) -> .L115 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_info+0x20 (section: .text.unlikely) -> .LBB981 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_info+0x24 (section: .text.unlikely) -> .LBE981 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_warn+0x20 (section: .text.unlikely) -> .LBB977 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_warn+0x24 (section: .text.unlikely) -> .LBB982 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_err+0x20 (section: .text.unlikely) -> .LBE978 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_err+0x24 (section: .text.unlikely) -> .LBE982 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfc_llcp_symm_timer+0xc (section: .text.unlikely) -> early_nbcon_pcpu_emergency_nesting (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_unknown+0x44c (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_insn_misaligned+0x44c (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_insn_fault+0x44c (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_insn_illegal+0x44c (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_load_fault+0x44c (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_store_fault+0x44c (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_s+0x44c (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_m+0x44c (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_break+0x430 (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_u+0x64c (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_exit+0x5d0 (section: .noinstr.text) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_exit+0x616 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_probe_decode_insn+0x102 (section: .kprobes.text) -> kcmp_cookies_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_probe_decode_insn+0x1b4 (section: .kprobes.text) -> rmem_dma_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_probe_decode_insn+0x1da (section: .kprobes.text) -> .LBE410 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unregister_rtapp+0x10 (section: .exit.text) -> .LBB854 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unregister_pagefault+0x10 (section: .exit.text) -> .LBB854 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unregister_sleep+0x10 (section: .exit.text) -> .LBB854 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_gfs2_fs+0xe6 (section: .exit.text) -> .LBE576 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_gfs2_fs+0x11c (section: .exit.text) -> __setup_early_numa_cma (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: exit_f2fs_fs+0x1a (section: .exit.text) -> early_coherent_pool (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_f2fs_fs+0x22 (section: .exit.text) -> .LBE346 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_f2fs_fs+0x32 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_f2fs_fs+0x84 (section: .exit.text) -> .LBE345 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cryptomgr_exit+0x12 (section: .exit.text) -> .LBE378 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpm_exit+0x4e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vudc_cleanup+0x3c (section: .exit.text) -> .LBB595 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: typec_exit+0x50 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: thermal_testing_exit+0x18 (section: .exit.text) -> .L60 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: speakup_exit+0x42 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: comedi_cleanup+0x28 (section: .exit.text) -> early_coherent_pool (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: comedi_test_exit+0x42 (section: .exit.text) -> .LBB597 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_exit+0x3a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_dns_resolver+0xa (section: .exit.text) -> .LBE158 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: yield_to+0xd8 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: out_of_line_wait_on_bit_lock+0x54 (section: .sched.text) -> .LBE383 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mutex_lock_io_nested+0x840 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mutex_lock+0x874 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mutex_lock+0x99c (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_write+0x150 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_write_killable+0x158 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_write_killable_nested+0x15a (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read+0x2aa (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read_interruptible+0x2b0 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read_killable+0x2b2 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __percpu_down_read+0xbc (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_unlock+0x12c (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_start_proxy_lock+0x100 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_postunlock+0x92 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x25f8 (section: __ex_table) -> __func__ (section: .rodata)
ERROR: modpost: __ex_table+0x25f8 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25fc (section: __ex_table) -> __sbi_send_ipi (section: .data..ro_after_init)
>> ERROR: modpost: __ex_table+0x25fc references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2604 (section: __ex_table) -> __sbi_set_timer (section: .data..ro_after_init)
ERROR: modpost: __ex_table+0x2604 references non-executable section '.data..ro_after_init'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2608 (section: __ex_table) -> __warned (section: .data..unlikely)
>> ERROR: modpost: __ex_table+0x2608 references non-executable section '.data..unlikely'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2610 (section: __ex_table) -> _entry (section: .data.rel.ro.local)
ERROR: modpost: __ex_table+0x2610 references non-executable section '.data.rel.ro.local'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2614 (section: __ex_table) -> _entry (section: .data.rel.ro.local)
ERROR: modpost: __ex_table+0x2614 references non-executable section '.data.rel.ro.local'
WARNING: modpost: vmlinux: section mismatch in reference: 0x261c (section: __ex_table) -> _entry (section: .data.rel.ro.local)
ERROR: modpost: __ex_table+0x261c references non-executable section '.data.rel.ro.local'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2620 (section: __ex_table) -> _entry (section: .data.rel.ro.local)
ERROR: modpost: __ex_table+0x2620 references non-executable section '.data.rel.ro.local'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2628 (section: __ex_table) -> __if_trace (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x2628 references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x262c (section: __ex_table) -> __if_trace (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x262c references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2634 (section: __ex_table) -> __if_trace (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x2634 references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2638 (section: __ex_table) -> __if_trace (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x2638 references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2640 (section: __ex_table) -> __if_trace (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x2640 references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2644 (section: __ex_table) -> __if_trace (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x2644 references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x264c (section: __ex_table) -> __if_trace (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x264c references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2650 (section: __ex_table) -> __if_trace (section: _ftrace_branch)
ERROR: modpost: __ex_table+0x2650 references non-executable section '_ftrace_branch'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2670 (section: __ex_table) -> .LC35 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x2670 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2674 (section: __ex_table) -> .LC28 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x2674 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x267c (section: __ex_table) -> .LC30 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x267c references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2680 (section: __ex_table) -> .LC32 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x2680 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2688 (section: __ex_table) -> .LC34 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x2688 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x268c (section: __ex_table) -> .LC40 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x268c references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2694 (section: __ex_table) -> .LC38 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x2694 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2698 (section: __ex_table) -> .LC39 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x2698 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26a0 (section: __ex_table) -> .LC43 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x26a0 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26a4 (section: __ex_table) -> .LASF620 (section: .debug_str)
ERROR: modpost: __ex_table+0x26a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26ac (section: __ex_table) -> .LASF1 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x26ac references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26b0 (section: __ex_table) -> .Ldebug_line0 (section: .debug_line)
ERROR: modpost: __ex_table+0x26b0 references non-executable section '.debug_line'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26c4 (section: __ex_table) -> .LASF174 (section: .debug_str)
ERROR: modpost: __ex_table+0x26c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26c8 (section: __ex_table) -> .LASF176 (section: .debug_str)
ERROR: modpost: __ex_table+0x26c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26d0 (section: __ex_table) -> .LASF177 (section: .debug_str)
ERROR: modpost: __ex_table+0x26d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26d4 (section: __ex_table) -> .LASF180 (section: .debug_str)
ERROR: modpost: __ex_table+0x26d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26dc (section: __ex_table) -> .LASF182 (section: .debug_str)
ERROR: modpost: __ex_table+0x26dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26e0 (section: __ex_table) -> .LASF184 (section: .debug_str)
ERROR: modpost: __ex_table+0x26e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x26f8 (section: __ex_table) -> .LASF451 (section: .debug_str)
ERROR: modpost: __ex_table+0x26f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: init_task+0x514 (section: .data.rel) -> dma_contiguous_reserve (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__rt_sigreturn+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__riscv_flush_icache+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__mmap2+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__riscv_hwprobe+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_isa_vendor_ext_list+0x0 (section: .data.rel) -> .LBB863 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__unshare+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__clone3+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__clone+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__set_tid_address+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__personality+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__wait4+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__waitid+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__exit_group+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__exit+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__capset+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__capget+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__ptrace+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_user_ns+0x25c (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__rt_sigsuspend+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__rt_sigaction+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__sigaltstack+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__rt_tgsigqueueinfo+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__rt_sigqueueinfo+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__tkill+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__tgkill+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__pidfd_send_signal+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__kill+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__rt_sigtimedwait+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__rt_sigpending+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__rt_sigprocmask+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__restart_syscall+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__sysinfo+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__getcpu+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__prctl+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__umask+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__getrusage+0x8 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_enter__setrlimit+0x8 (section: .data.rel) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
