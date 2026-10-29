Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275944;
	b=mC+hyCbdEg3mw9i4A62HjfU2oNcKM0fj2aBLyDJ75AyQNw38CyE5f8BU1fbV2syhHQgz
	 caRal+8igiho9l/C0dc3byghtoDhVAPyFK0/BP/eVUOSEDOMP+4qb6wXHg0+2pZjBW/is
	 wU6DMFRYGmwfHjKUvMdANcxUhPPYspkjA+xOdLBwls+oP5/W82QYhLR/kiQ4Mx5kxaZFz
	 rjvpRfMlhntUjRyIqZXGCumSOGR8cXz9GAlKyk/lxnmdzFWn9hOc7GZCY6FpPEUHuIbyH
	 5PtS1wIT5NglxvDb/t8eka9DVCPhnVfmfKm2cZHnpbhM6l6cZLeHavdiCIFABS7jNvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275944;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iTr9E8ithYNW/2HpTat8bmEiNOTxmBTuMmXnFyUs8B0=;
	b=v5uwUBlzI3QQvNiJeBZAOsymhhP7O8otOOmS8tdip+sRUmteNTEP9tx7OLib1L8Ezd3T
	 go/cnm0HmPmZC48APNpagDYvRj+nqy97NbYFY1avuHg6zfz1qB9m2VNkomeVgyiJtrF9C
	 Lq5J5Wpmkt8wOC5WkYs5NrJU06A9XyxhOJxF6LHBNgpcMI468pKW0L1jQrVROOAmLxUdv
	 ZtgVQrBWGyIZ8yCwirpEIwHt/6u/8J+DzM7eqi48y9E8E7UPrzLYP90DrbCeO+RCceVrn
	 ZcLqWTBXIAK2pXp8jGu5kHteLrcaEMS9g4q9az3zED6Ezsh4L2nnMikkYKChO2s1LqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=krNS0pS+;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A517606A31A
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Oct 2026 12:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A517606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=krNS0pS+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793275944; x=1824811944;
  h=date:from:to:cc:subject:message-id;
  bh=vgffMoG+3mQ2pjpjXaHAGrrSgwDjxkdBEQPxhD4eojw=;
  b=krNS0pS+S63j2cZ5VBNnn1xMOOTBK18UxzOa8q+Yk9+Dz92QaEgwswMv
   aDPV6bUgdFPxwtBqHRPn9/HQ0gRAPAAPGRpUGKjedGv0C1SkuRokA1IYi
   01Lx9io8Lp/ngf95Ua2hoBCPu+oDGx6H19UeDrZDGKRamyq+SxJ9FpZqN
   uVId8PNTQ4ylyeJ1IELi79mZ89VQl5NVbVQQPwUhkF1991XDH0d/Dd0xf
   9yx5E2tXgmh3FAgcZ8s5XiixTYa2DeC2mhKPc00gDfQc7hVGC71vvMJkE
   7ipc4OC1d2pj3l84TPlw5SX/Llhm3EQi+i212rsNacC6g3ub3X9LOQKyO
   w==;
X-CSE-ConnectionGUID: 6Y3bSeRSRLG5f+SRM6Rh0Q==
X-CSE-MsgGUID: rdMb0r0RQtOvIDyhdLFN3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1900545"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1900545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:12:23 -0700
X-CSE-ConnectionGUID: eeAZdI9LSZiCPdrbsCBMCA==
X-CSE-MsgGUID: otW7foNoRv+vcIa+flSkcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5085151"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2026 05:12:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMOzT-000000005Ev-1T92;
	Thu, 29 Oct 2026 12:12:19 +0000
Date: Thu, 29 Oct 2026 13:11:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sashal-next:clock-next 2/6] ERROR: modpost:
 __ex_table+0x24b8 references non-executable section '.debug_line'
Message-ID: <202610291357.yaLZ4QI7-lkp@intel.com>
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
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git clock-next
head:   0c0034dbb977310df6f4b197f1851654784ba814
commit: 78d09684065d6a71af3f7d97f5b6cfb5f4403174 [2/6] Merge 'rtc' from https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git (rtc-next)
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r2311-20261028 (https://download.01.org/0day-ci/archive/20261029/202610291357.yaLZ4QI7-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.4.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291357.yaLZ4QI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610291357.yaLZ4QI7-lkp@intel.com/

Note: the sashal-next/clock-next HEAD 0c0034dbb977310df6f4b197f1851654784ba814 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: x25_table+0x90 (section: .data) -> aes_mod_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atm_dev_mutex+0x20 (section: .data) -> alloc_buffers (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atm_dev_mutex+0x44 (section: .data) -> aa_setup_dfa_engine (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: psample_groups_lock+0x1c (section: .data) -> .LBB52140 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _rs+0x1c (section: .data) -> .LBB52141 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_table_lock+0x1c (section: .data) -> .LVL4660 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_register_mutex+0x20 (section: .data) -> .LVL3097 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_register_mutex+0x34 (section: .data) -> .LVL4039 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_register_mutex+0x44 (section: .data) -> .LVL3098 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_proto+0x0 (section: .data) -> .LVL4357 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_device+0x4 (section: .data) -> .LBB75840 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_device+0x8 (section: .data) -> .LBB77570 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_tap_lock+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport+0x10 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport+0x4c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport+0x8c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport+0x90 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport+0x98 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport+0x9c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport+0xa0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_driver+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_driver+0x50 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_driver+0x54 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_driver+0x68 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_driver+0x70 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: the_virtio_vsock_mutex+0x20 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: the_virtio_vsock_mutex+0x34 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: the_virtio_vsock_mutex+0x44 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_packet_offload+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_nb+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_suite+0x110 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x0 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x4 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x1c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x24 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x28 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x40 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x48 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x4c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x64 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x6c (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x70 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x88 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x90 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0x94 (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_test_cases+0xac (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_system_certificate_list+0x18 (section: .init.text) -> aes_mod_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dmic_driver_init+0x8 (section: .init.text) -> exit_exfat_fs (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: dmic_driver_init+0xc (section: .init.text) -> exit_exfat_fs (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt715_sdw_driver_init+0xe (section: .init.text) -> exit_nls_cp1251 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x3a (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x48 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x76 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x84 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0xb2 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0xc0 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0xee (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0xfc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x12c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x13c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x16c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x17c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x1ac (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x1bc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x1ec (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x1fc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x22c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x23c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x26c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x27c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x2ac (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cqhci_dumpregs+0x2bc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ufshcd_err_handler+0x76a (section: .text.unlikely) -> init_rt_signal_env (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ufshcd_err_handler+0x7c6 (section: .text.unlikely) -> init_rt_signal_env (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ufshcd_err_handler+0x806 (section: .text.unlikely) -> init_rt_signal_env (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ufshcd_err_handler+0x81a (section: .text.unlikely) -> init_rt_signal_env (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ufshcd_err_handler+0x81e (section: .text.unlikely) -> init_rt_signal_env (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ufshcd_err_handler+0x822 (section: .text.unlikely) -> init_rt_signal_env (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: memstick_check+0xe4 (section: .text.unlikely) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ms_print_debug_regs+0x23e (section: .text.unlikely) -> init_signal_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ms_print_debug_regs+0x266 (section: .text.unlikely) -> .LVL5 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gb_bootrom_timedout+0x1c (section: .text.unlikely) -> irq_debugfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: seed_constraint_attributes+0x5c (section: .text.unlikely) -> secretmem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: seed_constraint_attributes+0x60 (section: .text.unlikely) -> secretmem_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sglist_add_mapping.part.0.isra.0+0x10 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_unregister+0x10 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_unregister+0x14 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_unregister+0x22 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_unregister+0x26 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __list_del_entry+0x6 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __list_del_entry+0xc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: schedule_work.isra.0+0xc (section: .text.unlikely) -> .L853 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_unaligned_be32+0x1c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_unaligned_be32+0x24 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dump_stack_lvl+0x1a (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dump_stack_lvl+0x38 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dump_stack_lvl+0x42 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dump_stack+0x8 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dump_stack+0xc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b8 (section: __ex_table) -> .Ldebug_line0 (section: .debug_line)
>> ERROR: modpost: __ex_table+0x24b8 references non-executable section '.debug_line'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c4 (section: __ex_table) -> .Lskeleton_debug_abbrev0 (section: .debug_abbrev)
ERROR: modpost: __ex_table+0x24c4 references non-executable section '.debug_abbrev'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d0 (section: __ex_table) -> .Ldebug_line0 (section: .debug_line)
ERROR: modpost: __ex_table+0x24d0 references non-executable section '.debug_line'
WARNING: modpost: vmlinux: section mismatch in reference: 0x256c (section: __ex_table) -> __export_symbol_eventfd_ctx_fileget (section: .export_symbol)
ERROR: modpost: __ex_table+0x256c references non-executable section '.export_symbol'
WARNING: modpost: vmlinux: section mismatch in reference: 0x25bc (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x25bc references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x262c (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x262c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2638 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2638 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2644 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2644 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2650 (section: __ex_table) -> .L0  (section: .debug_line_str)
ERROR: modpost: __ex_table+0x2650 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: spacemit_sdhci_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: spacemit_sdhci_driver_exit+0xc (section: .exit.text) -> random_kstack_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gpib_common_exit_module+0x1e (section: .exit.text) -> add_to_rb.constprop.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gpib_common_exit_module+0x2c (section: .exit.text) -> add_to_rb.constprop.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gpib_common_exit_module+0x34 (section: .exit.text) -> add_to_rb.constprop.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gpib_common_exit_module+0x40 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gpib_common_exit_module+0x44 (section: .exit.text) -> add_to_rb.constprop.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adis16209_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adis16209_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ad7191_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ad7191_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ad799x_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ad799x_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: men_z188_driver_exit+0x8 (section: .exit.text) -> seccomp_sysctl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: men_z188_driver_exit+0xc (section: .exit.text) -> seccomp_sysctl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: slf3s_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: slf3s_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: admv4420_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: admv4420_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adrf6780_driver_exit+0x8 (section: .exit.text) -> .LVL659 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adrf6780_driver_exit+0xc (section: .exit.text) -> init_unavailable_range (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: afe4403_spi_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: afe4403_spi_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: afe4404_i2c_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: afe4404_i2c_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hts221_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hts221_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hts221_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hts221_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adis16400_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adis16400_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cm36651_driver_exit+0xc (section: .exit.text) -> .L1273 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltr390_driver_exit+0x8 (section: .exit.text) -> vm_area_register_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ltr390_driver_exit+0xc (section: .exit.text) -> vm_area_register_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vcnl4035_driver_exit+0x8 (section: .exit.text) -> .LVL39 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vcnl4035_driver_exit+0xc (section: .exit.text) -> .LVL745 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veml3328_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veml3328_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veml6070_driver_exit+0x8 (section: .exit.text) -> memblock_allow_resize (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veml6070_driver_exit+0xc (section: .exit.text) -> memblock_allow_resize (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: zopt2201_driver_exit+0x8 (section: .exit.text) -> memblock_is_reserved (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: zopt2201_driver_exit+0xc (section: .exit.text) -> memblock_is_memory (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mag3110_driver_exit+0xc (section: .exit.text) -> .LVL6476 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mpl3115_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mpl3115_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pp_exit+0x6 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pp_exit+0xa (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pp_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pp_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: echo_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adau7118_driver_hw_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adau7118_driver_hw_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ak4613_i2c_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: chv3_codec_platform_driver_exit+0x8 (section: .exit.text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cs35l56_modexit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dmic_driver_exit+0x8 (section: .exit.text) -> init_msdos_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt715_sdw_driver_exit+0x8 (section: .exit.text) -> init_nls_cp1251 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nci_uart_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: psample_module_exit+0x8 (section: .exit.text) -> .LBB83864 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: psample_module_exit+0xc (section: .exit.text) -> .LVL1915 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x6 (section: .exit.text) -> .LBB77588 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0xa (section: .exit.text) -> .LBB106701 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x24 (section: .exit.text) -> .LBB77588 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x28 (section: .exit.text) -> .LBB84780 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x34 (section: .exit.text) -> .LBB77588 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_exit+0x38 (section: .exit.text) -> .LBB78460 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_diag_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsock_diag_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x6 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0xa (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x28 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_vsock_exit+0x2c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_cleanup_module+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nsh_cleanup_module+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netlink_exit+0x6 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netlink_exit+0xa (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netlink_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netlink_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
