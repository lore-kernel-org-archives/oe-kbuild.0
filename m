Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712146;
	b=IXdXP5QCNhxJnac3tq1QkCYQjSU33sr+YJj85PZBC1nHF2bnAWWxa4NkcYjEhcsftNiF
	 PpPLU0ILDSmKb5qpZ2g2tIJ2A0jcBsF0Nb+tCoYTuwj/0Xw1ENftYqqZ/m4V9lE2MU8UJ
	 WnP9uN3PZTT7kC1b4TrssA9wMs+EvSuBwHxgGJRx+FzQWm2nPIoGoIL099kEseAGGHbJT
	 DT6pIEcTutusufhKYYfv16l89KdNX2lR6xKQu65Idjp9P8y5aYYIstAhIQB2IpB6k4+RT
	 M2hL5aBICf0oHtJ4/F7TFjgcbCo313BgX3S+sFq7wNPeMXGSu7k6DmfAzPyHpmLIfGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712146;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sfieNiS5g8p/bYUCSMIXdBBtvN8WlsoaOCsC0lIulfs=;
	b=HMuiQLGLFp/SQUdaZIrnNDCFNxUMcPnhTfs26Ka8yBEFcV+O9B1+qJrZK+rw56G9q+AS
	 E0uf3UfqnZI6+6G+ZeDcQS5KRV+/GZMFaoQdaQAPIkVQvSaPrdZMXx8IgWepsdRbX+3ev
	 z11nLMtw2HGDlWSCsfsCo+F/40YCx7tn4frOqyz+HK8d7na+e6m9JWx6swU0x2D2o/w1n
	 Lv4MCqMNE/FjleYtdn/jFnNx6Od8rAj+JLWE32pApJ42F3t311QG9q/UOg6z3eH0TueV6
	 U1Cbp12dIpnCSFNNO+FIgQIffSjH/6gMmNopVtxaAFuL6jqrTmO5G5P7bg0+IAO907Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ab9vV8ro;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7268A606A323
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 03:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7268A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ab9vV8ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794712145; x=1826248145;
  h=date:from:to:cc:subject:message-id;
  bh=Z3+GNPINT1bQZzwDiGKcPgzia5FXtBxxavWjI5HA3UU=;
  b=Ab9vV8rouioo+lpIIDWSVzXIO0JgcWFYysFiEWANjvSUTJFfp7lXdFol
   QiszE/50+gI/LQ+VzwNtoZNDvo1+IoGpj8MPFTuuPmJJfEYLRUWhIP28t
   SneKP5kn91ZlByIXTJLIGXAeJe+er4Km1xAOOqim/HvoRmLVAAjET/rR7
   1n7n0+9UexsVnBrmF4GeSWtyhjh0g6OsE26MpjzynUfUc7AF2M5aHBVvS
   VV4AS+/0MFQL90dT2cyPfz7cGQKuPrQF0raUyvzz0GSpbr1dvvIVp7T6y
   5AIzhtwuo/qGKEkJc7q+WM9kRNG6h1Vutu5OUpDhiFKgcTxfDTsCacjDS
   A==;
X-CSE-ConnectionGUID: 0BJYIwcgR5OOS1R6j1+jUA==
X-CSE-MsgGUID: hW/jWiBvRnq3wFdCXup6iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3557990"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3557990"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 19:09:04 -0800
X-CSE-ConnectionGUID: OFeFTwdZQ0Os8uGUdeMhNg==
X-CSE-MsgGUID: gFntKNoSSjuMtyvXYLPnpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="11155732"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 14 Nov 2026 19:09:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSQc0-000000001zi-2VeH;
	Sun, 15 Nov 2026 03:09:00 +0000
Date: Sun, 15 Nov 2026 04:08:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 273/285] ERROR: modpost:
 __ex_table+0x1f60 references non-executable section '.data.rel.ro.local'
Message-ID: <202611150424.JlKB4rtR-lkp@intel.com>
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
CC: "Liam R. Howlett (Google)" <liam@infradead.org>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   24231596edf2c9d5269d8efbc7007512026672f5
commit: 43065dea9fd2349acecfccd40cb62f038f931bd2 [273/285] mm: only assert mmap locks if CONFIG_DEBUG_VM or lockdep is set
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: riscv-randconfig-r2300-20261114 (https://download.01.org/0day-ci/archive/20261115/202611150424.JlKB4rtR-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150424.JlKB4rtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611150424.JlKB4rtR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_s+0x34a (section: .noinstr.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_m+0x34a (section: .noinstr.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_break+0x280 (section: .noinstr.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_u+0x18 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_u+0x402 (section: .noinstr.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_u+0x4ce (section: .noinstr.text) -> at_dma_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_u+0x62a (section: .noinstr.text) -> .LBB5431 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_u+0x636 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_page_fault+0x46 (section: .noinstr.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_exit+0x6c0 (section: .noinstr.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_exit+0x92e (section: .noinstr.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_exit+0xb26 (section: .noinstr.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __schedule+0x294 (section: .sched.text) -> .LBE5404 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __schedule+0x638 (section: .sched.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __schedule+0x6e0 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __schedule+0x6ec (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: schedule+0x9a (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: preempt_schedule_irq+0x5c (section: .sched.text) -> at_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: _mutex_trylock_nest_lock+0x96 (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mutex_lock_io_nested+0xa2 (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mutex_lock+0x80 (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_write_killable+0x3a (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_write_killable_nested+0x3c (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_write+0x38 (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read_killable+0x3c (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read_interruptible+0x3c (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read+0x3c (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: percpu_down_write+0x38 (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_trylock+0x4e (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _rt_mutex_lock_nest_lock+0x3c (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_lock_nested+0x3c (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_lock_killable+0x3a (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_lock_interruptible+0x3a (section: .sched.text) -> .LBB5436 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32_lptimer_driver_exit+0x8 (section: .exit.text) -> nfs_fs_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: iscsi_target_cleanup_module+0x78 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbp_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lynx_pci_driver_exit+0xc (section: .exit.text) -> init_nls_cp869 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pd6729_pci_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pd6729_pci_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rmi_bus_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: at91_rtc_remove+0x28 (section: .exit.text) -> jz4780_dma_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fsi_i2c_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_rc_map_hisi_poplar+0x8 (section: .exit.text) -> xfs_btree_init_cur_caches (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_rc_map_hisi_poplar+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pwrseq_thead_gpu_driver_exit+0xc (section: .exit.text) -> xfs_rmap_intent_init_cache (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_blk_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scmi_transport_virtio_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scmi_transport_virtio_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ch_driver_exit+0xc (section: .exit.text) -> streebog_mod_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cougar_driver_exit+0xc (section: .exit.text) -> crypto_blake2b_mod_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bcma_modexit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hub_master_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: scom_drv_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2cr_scom_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: npcm_peci_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: npcm_peci_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: udp_tunnel_nic_cleanup_module+0x34 (section: .exit.text) -> disable_stack_depot (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cubictcp_unregister+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cubictcp_unregister+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: br_deinit+0x18 (section: .exit.text) -> .LBE5518 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_cleanup_module+0xa (section: .exit.text) -> at_dma_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: p9_trans_fd_exit+0x8 (section: .exit.text) -> .L94 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: p9_trans_fd_exit+0x18 (section: .exit.text) -> .L94 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: p9_trans_fd_exit+0x28 (section: .exit.text) -> .L94 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: p9_trans_fd_exit+0x38 (section: .exit.text) -> .L94 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: p9_trans_fd_exit+0x48 (section: .exit.text) -> .L94 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: psample_module_exit+0x8 (section: .exit.text) -> .LBE605 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: qcom_smd_qrtr_driver_exit+0x8 (section: .exit.text) -> clk_mt8183_apmixed_drv_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> proc_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> mm_cache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .LBB7599 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .LBE7599 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .LBE28066 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .LBB28067 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> __setup_str_setup_psi (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> __setup_str_setup_relax_domain_level (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .LBB4160 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .LBE4160 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0x8 (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_00100_0+0xc (section: .text.startup) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> .LC3 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f60 (section: __ex_table) -> cifs_secflavor_tokens (section: .data.rel.ro.local)
>> ERROR: modpost: __ex_table+0x1f60 references non-executable section '.data.rel.ro.local'
WARNING: modpost: vmlinux: section mismatch in reference: 0x225c (section: __ex_table) -> .LASF542 (section: .debug_str)
ERROR: modpost: __ex_table+0x225c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2260 (section: __ex_table) -> .LASF544 (section: .debug_str)
ERROR: modpost: __ex_table+0x2260 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2268 (section: __ex_table) -> .LASF546 (section: .debug_str)
ERROR: modpost: __ex_table+0x2268 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2274 (section: __ex_table) -> .LASF549 (section: .debug_str)
ERROR: modpost: __ex_table+0x2274 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2278 (section: __ex_table) -> .LASF551 (section: .debug_str)
ERROR: modpost: __ex_table+0x2278 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2280 (section: __ex_table) -> .LASF553 (section: .debug_str)
ERROR: modpost: __ex_table+0x2280 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2284 (section: __ex_table) -> .LASF551 (section: .debug_str)
ERROR: modpost: __ex_table+0x2284 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x228c (section: __ex_table) -> .LASF556 (section: .debug_str)
ERROR: modpost: __ex_table+0x228c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2290 (section: __ex_table) -> .LASF558 (section: .debug_str)
ERROR: modpost: __ex_table+0x2290 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2298 (section: __ex_table) -> .LASF560 (section: .debug_str)
ERROR: modpost: __ex_table+0x2298 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x229c (section: __ex_table) -> .LASF563 (section: .debug_str)
ERROR: modpost: __ex_table+0x229c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22a4 (section: __ex_table) -> .LASF565 (section: .debug_str)
ERROR: modpost: __ex_table+0x22a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d4 (section: __ex_table) -> .LC81 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x22d4 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22d8 (section: __ex_table) -> .LC64 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x22d8 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22e0 (section: __ex_table) -> .LC66 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x22e0 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x22e4 (section: __ex_table) -> .LC68 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x22e4 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2430 (section: __ex_table) -> .LASF75 (section: .debug_str)
ERROR: modpost: __ex_table+0x2430 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2434 (section: __ex_table) -> .LASF77 (section: .debug_str)
ERROR: modpost: __ex_table+0x2434 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x243c (section: __ex_table) -> .LASF80 (section: .debug_str)
ERROR: modpost: __ex_table+0x243c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2440 (section: __ex_table) -> .LASF77 (section: .debug_str)
ERROR: modpost: __ex_table+0x2440 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2448 (section: __ex_table) -> .LC475 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x2448 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x244c (section: __ex_table) -> .LC477 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x244c references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2460 (section: __ex_table) -> .LASF121 (section: .debug_str)
ERROR: modpost: __ex_table+0x2460 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2464 (section: __ex_table) -> .LASF123 (section: .debug_str)
ERROR: modpost: __ex_table+0x2464 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d8 (section: __ex_table) -> .LASF170 (section: .debug_str)
ERROR: modpost: __ex_table+0x24d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24dc (section: __ex_table) -> .LASF172 (section: .debug_str)
ERROR: modpost: __ex_table+0x24dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27cc (section: __ex_table) -> .LASF128 (section: .debug_str)
ERROR: modpost: __ex_table+0x27cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27d0 (section: __ex_table) -> .LASF130 (section: .debug_str)
ERROR: modpost: __ex_table+0x27d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27d8 (section: __ex_table) -> .LASF132 (section: .debug_str)
ERROR: modpost: __ex_table+0x27d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x27dc (section: __ex_table) -> .LASF130 (section: .debug_str)
ERROR: modpost: __ex_table+0x27dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2820 (section: __ex_table) -> .LASF65 (section: .debug_str)
ERROR: modpost: __ex_table+0x2820 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2824 (section: __ex_table) -> .LASF67 (section: .debug_str)
ERROR: modpost: __ex_table+0x2824 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x282c (section: __ex_table) -> .LASF69 (section: .debug_str)
ERROR: modpost: __ex_table+0x282c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2830 (section: __ex_table) -> .LASF71 (section: .debug_str)
ERROR: modpost: __ex_table+0x2830 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2838 (section: __ex_table) -> .LASF73 (section: .debug_str)
ERROR: modpost: __ex_table+0x2838 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x283c (section: __ex_table) -> .LASF75 (section: .debug_str)
ERROR: modpost: __ex_table+0x283c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2844 (section: __ex_table) -> .LASF77 (section: .debug_str)
ERROR: modpost: __ex_table+0x2844 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2848 (section: __ex_table) -> .LASF79 (section: .debug_str)
ERROR: modpost: __ex_table+0x2848 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2850 (section: __ex_table) -> .LASF81 (section: .debug_str)
ERROR: modpost: __ex_table+0x2850 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2854 (section: __ex_table) -> .LASF84 (section: .debug_str)
ERROR: modpost: __ex_table+0x2854 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x285c (section: __ex_table) -> .LASF86 (section: .debug_str)
ERROR: modpost: __ex_table+0x285c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2860 (section: __ex_table) -> .LASF88 (section: .debug_str)
ERROR: modpost: __ex_table+0x2860 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2868 (section: __ex_table) -> .LASF90 (section: .debug_str)
ERROR: modpost: __ex_table+0x2868 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x286c (section: __ex_table) -> .LASF92 (section: .debug_str)
ERROR: modpost: __ex_table+0x286c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2874 (section: __ex_table) -> .LASF94 (section: .debug_str)
ERROR: modpost: __ex_table+0x2874 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2878 (section: __ex_table) -> .LASF96 (section: .debug_str)
ERROR: modpost: __ex_table+0x2878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2880 (section: __ex_table) -> .LASF98 (section: .debug_str)
ERROR: modpost: __ex_table+0x2880 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2884 (section: __ex_table) -> .LASF100 (section: .debug_str)
ERROR: modpost: __ex_table+0x2884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: initcall_levels+0x0 (section: .init.data) -> dw_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_cred+0x64 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smb311_operations+0xc4 (section: .data.rel) -> sa11x0_dma_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: smb30_operations+0xc4 (section: .data.rel) -> sa11x0_dma_exit (section: .exit.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
