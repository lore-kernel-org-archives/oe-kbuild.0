Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795311245;
	b=yTiPw1wITsHXmS6ej5a7mW5dd6BXqw2EoXEuZK9DMCXsUCBv7QMQ3E/y90+rgdD5CDmP
	 dKK8R/bvtIx5BhjJIvfY5h3f46JJDjsL4a05W11RXBSXNHzMcOdPIKp2aaLNVvK/r8add
	 P2zV1g29FfTouBenIjfCCzzfCMK2E6u2H+w79Bvj9A25eMdAAsmLN+4l2N71JRWMyO1sX
	 a7EJaDeADk0m6NFMX0ANF2ft0/e9sYNTiQPi9ygotqXhrEYYXWPdJ8dyGgNJOW2ttrOUW
	 frA4999m0YxQaOXmHC7HB5xJh6f9J0zIBLiNcHHqLkXu+p8SVTa1TPY3qAZszj8Bl1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795311245;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=H292NJARrLA/F3FTIA2hXHr0hho/D4wvJDXa8YFBs+k=;
	b=H/KcXYi+t62tyYZjftBG0KaSPlJScVwShIlPTRz8q2+Bl9E3KcpIePKhl0kL6JTewxKl
	 hDqQG9Wq4zyM8qC7+MBu8giQYnTax9oAtSbOoH/P7SbDP9dRDSMercXDsHYKeakFDpFdN
	 oKRvrqQVzuMF7spDLW73t8DSTw4PYNQMCFm3bwgwBPsk0N0JrrngQLENJ0CPMqESbKJPm
	 T1ZnecEEi/IQbLXJPTxDRkgifVnpT+7R/5ibvhvH04/Ix+Q+EqKIvslgW4kgv3d2LHLIW
	 aLyVuPQueM+N6DCFsl1rn1JsGTcreJm+gd0dTJCm5TBnAp/25hx6fp9XpaHjHBuutRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JqJGFTYn;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1EE606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 01:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC1EE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JqJGFTYn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795311245; x=1826847245;
  h=date:from:to:cc:subject:message-id;
  bh=h4W7c9xlMCfPuFzpBEaq479Gbr3VqrxhuKJfGANXF40=;
  b=JqJGFTYnDMyRehPRddJ1ObgA4+QA7vD2OP2PHrCkIb/SH/ZX95gb1gb4
   AGFYV1KxTW4iRRGPEGDyvIc2giiiygzm5URGS9X14c9mzW3ax/xNIvKHn
   xQTSvZV7xKfyAzE8LoDusmj5K5ZlJNz/uSovkLw8LtZtwSk0Px0AIj4A7
   3c/jYgMbrZWRn6FGgriLp1t8jv/NmU5sC8g4gLGavk+fQhCfmvjqTxfiN
   qf9TB4nygY7km8UAA84JcukX55MyKlVRYtlyUgl+3l42BECHYIaO1w/TG
   llh1SSieeVMWEQHNMs4fvPwmdlBA1QivAM9WtrpkGe5Wd2hQEbwy/8GdZ
   w==;
X-CSE-ConnectionGUID: Of35z/ufSjm+hROluzFgOg==
X-CSE-MsgGUID: ZfL1CQS1SPuipe399r18/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4237112"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4237112"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 17:34:04 -0800
X-CSE-ConnectionGUID: /9Yx1ibHSCe3aUfV3CQDAQ==
X-CSE-MsgGUID: P+jNDVfPSCCHe4nNOFNwGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11081996"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2026 17:34:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUwSu-000000004S5-0hFm;
	Sun, 22 Nov 2026 01:34:00 +0000
Date: Sun, 22 Nov 2026 02:33:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxtv-media:next 21/30] ERROR: modpost: __ex_table+0x19b0
 references non-executable section
 '.rodata.__cgroup_bpf_run_filter_getsockopt.str1.4'
Message-ID: <20261122022039.iSmgAFgj-lkp@intel.com>
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
CC: linux-media@vger.kernel.org
TO: Matthias Fend <matthias.fend@emfend.at>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>

tree:   https://git.linuxtv.org/media.git next
head:   aa0f4c41d4870a18e65772a1817af16427200371
commit: b0cfb21499a6dd0c1e9934dbcab005c892ae9a94 [21/30] media: i2c: ov08d10: unconditionally use the startup delay
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r2101-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122022039.iSmgAFgj-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122022039.iSmgAFgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122022039.iSmgAFgj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x14 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x11c (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1bc (section: .text.rcu_read_unlock) -> register_kernel_offset_dumper (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1c0 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x224 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1bc (section: .text.rcu_read_unlock) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1c0 (section: .text.rcu_read_unlock) -> .LFE5873 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_perf_trace_initcall_level+0x5c (section: .text.do_perf_trace_initcall_level) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_event_raw_event_initcall_level+0xa4 (section: .text.do_trace_event_raw_event_initcall_level) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ip6addrlbl_init_table+0x6c (section: .init.rodata) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_get_hart_index+0x98 (section: .text.riscv_get_hart_index) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_exit.isra.0+0xb0 (section: .text.ptrace_report_syscall_exit.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_exit.isra.0+0xb0 (section: .text.ptrace_report_syscall_exit.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_break+0x58 (section: .noinstr.text) -> .LBB453 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_break+0x2b0 (section: .noinstr.text) -> .LBB453 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: return_address+0x40 (section: .text.return_address) -> .LBE453 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x198c (section: __ex_table) -> 0x0 (section: .rodata.__cgroup_bpf_run_lsm_current.str1.4)
ERROR: modpost: __ex_table+0x198c references non-executable section '.rodata.__cgroup_bpf_run_lsm_current.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> 0x0 (section: .rodata.activate_effective_progs.str1.4)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.rodata.activate_effective_progs.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a8 (section: __ex_table) -> 0x0 (section: .rodata.__cgroup_bpf_run_filter_setsockopt.str1.4)
ERROR: modpost: __ex_table+0x19a8 references non-executable section '.rodata.__cgroup_bpf_run_filter_setsockopt.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> 0x0 (section: .rodata.__cgroup_bpf_run_filter_getsockopt.str1.4)
>> ERROR: modpost: __ex_table+0x19b0 references non-executable section '.rodata.__cgroup_bpf_run_filter_getsockopt.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19bc (section: __ex_table) -> 0x0 (section: .rodata.cgroup_bpf_struct_ops_attach.str1.4)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.rodata.cgroup_bpf_struct_ops_attach.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> CSWTCH (section: .rodata.CSWTCH.365)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.rodata.CSWTCH.365'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> 0x0 (section: .rodata.bm_status_read.str1.4)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.rodata.bm_status_read.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> 0x0 (section: .rodata.bm_entry_show.str1.4)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.rodata.bm_entry_show.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_load_coeff.str1.4)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.rodata.cs_dsp_load_coeff.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_stop.str1.4)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.rodata.cs_dsp_stop.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_halo_setup_algs.str1.4)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.rodata.cs_dsp_halo_setup_algs.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_create_control.str1.4)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.rodata.cs_dsp_create_control.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp1_setup_algs.str1.4)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.rodata.cs_dsp_adsp1_setup_algs.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp2_setup_algs.str1.4)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.rodata.cs_dsp_adsp2_setup_algs.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a88 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_parse_coeff.str1.4)
ERROR: modpost: __ex_table+0x1a88 references non-executable section '.rodata.cs_dsp_parse_coeff.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a8c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_load.str1.4)
ERROR: modpost: __ex_table+0x1a8c references non-executable section '.rodata.cs_dsp_load.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa0 (section: __ex_table) -> types (section: .rodata.types.0)
ERROR: modpost: __ex_table+0x1aa0 references non-executable section '.rodata.types.0'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> cs_dsp_debugfs_read_controls_fops (section: .rodata.cs_dsp_debugfs_read_controls_fops)
>> ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.rodata.cs_dsp_debugfs_read_controls_fops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aac (section: __ex_table) -> cs_dsp_halo_ao_ops (section: .rodata.cs_dsp_halo_ao_ops)
ERROR: modpost: __ex_table+0x1aac references non-executable section '.rodata.cs_dsp_halo_ao_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab0 (section: __ex_table) -> cs_dsp_adsp2_ops (section: .rodata.cs_dsp_adsp2_ops)
ERROR: modpost: __ex_table+0x1ab0 references non-executable section '.rodata.cs_dsp_adsp2_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_reg_addr_inc_per_unpacked_word.str1.4)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.rodata.cs_dsp_mock_reg_addr_inc_per_unpacked_word.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_reg_block_length_bytes.str1.4)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.rodata.cs_dsp_mock_reg_block_length_bytes.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_reg_block_length_bytes.str1.4)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.rodata.cs_dsp_mock_reg_block_length_bytes.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> cs_dsp_mock_halo_xm_hdr (section: .rodata.cs_dsp_mock_halo_xm_hdr)
ERROR: modpost: __ex_table+0x1b04 references non-executable section '.rodata.cs_dsp_mock_halo_xm_hdr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> cs_dsp_mock_adsp2_16bit_dsp1_regions (section: .rodata.cs_dsp_mock_adsp2_16bit_dsp1_regions)
ERROR: modpost: __ex_table+0x1b0c references non-executable section '.rodata.cs_dsp_mock_adsp2_16bit_dsp1_regions'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> cs_dsp_mock_adsp2_32bit_dsp1_regions (section: .rodata.cs_dsp_mock_adsp2_32bit_dsp1_regions)
ERROR: modpost: __ex_table+0x1b10 references non-executable section '.rodata.cs_dsp_mock_adsp2_32bit_dsp1_regions'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b18 (section: __ex_table) -> cs_dsp_mock_halo_dsp1_regions (section: .rodata.cs_dsp_mock_halo_dsp1_regions)
ERROR: modpost: __ex_table+0x1b18 references non-executable section '.rodata.cs_dsp_mock_halo_dsp1_regions'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b24 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_bin_add_raw_block.str1.4)
>> ERROR: modpost: __ex_table+0x1b24 references non-executable section '.rodata.cs_dsp_mock_bin_add_raw_block.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b30 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_bin_init.str1.4)
>> ERROR: modpost: __ex_table+0x1b30 references non-executable section '.rodata.cs_dsp_mock_bin_init.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b34 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_bin_add_name_or_info.isra.0.str1.4)
>> ERROR: modpost: __ex_table+0x1b34 references non-executable section '.rodata.cs_dsp_mock_bin_add_name_or_info.isra.0.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b6c (section: __ex_table) -> halo_writeable (section: .rodata.halo_writeable)
ERROR: modpost: __ex_table+0x1b6c references non-executable section '.rodata.halo_writeable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> cs_dsp_mock_halo_core_base (section: .srodata.cs_dsp_mock_halo_core_base)
ERROR: modpost: __ex_table+0x1b78 references non-executable section '.srodata.cs_dsp_mock_halo_core_base'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> halo_readable_registers (section: .rodata.halo_readable_registers)
ERROR: modpost: __ex_table+0x1b7c references non-executable section '.rodata.halo_readable_registers'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b84 (section: __ex_table) -> cs_dsp_mock_regmap_adsp2_16bit (section: .rodata.cs_dsp_mock_regmap_adsp2_16bit)
ERROR: modpost: __ex_table+0x1b84 references non-executable section '.rodata.cs_dsp_mock_regmap_adsp2_16bit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> halo_readable_registers (section: .rodata.halo_readable_registers)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.rodata.halo_readable_registers'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b90 (section: __ex_table) -> adsp2_16bit_registers (section: .rodata.adsp2_16bit_registers)
ERROR: modpost: __ex_table+0x1b90 references non-executable section '.rodata.adsp2_16bit_registers'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b9c (section: __ex_table) -> adsp2_32bit_rw (section: .rodata.adsp2_32bit_rw)
ERROR: modpost: __ex_table+0x1b9c references non-executable section '.rodata.adsp2_32bit_rw'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba8 (section: __ex_table) -> adsp2_32bit_register_defaults (section: .rodata.adsp2_32bit_register_defaults)
ERROR: modpost: __ex_table+0x1ba8 references non-executable section '.rodata.adsp2_32bit_register_defaults'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_wmfw_add_raw_block.str1.4)
>> ERROR: modpost: __ex_table+0x1bb8 references non-executable section '.rodata.cs_dsp_mock_wmfw_add_raw_block.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_wmfw_start_alg_info_block.str1.4)
ERROR: modpost: __ex_table+0x1bcc references non-executable section '.rodata.cs_dsp_mock_wmfw_start_alg_info_block.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_init_adsp2_halo_wmfw.constprop.0.str1.4)
ERROR: modpost: __ex_table+0x1bd8 references non-executable section '.rodata.cs_dsp_init_adsp2_halo_wmfw.constprop.0.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_wmfw_init.str1.4)
>> ERROR: modpost: __ex_table+0x1bdc references non-executable section '.rodata.cs_dsp_mock_wmfw_init.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: dump_instr+0xec (section: .text.dump_instr) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_permit_entry.isra.0+0x6c (section: .text.ptrace_report_syscall_permit_entry.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x90 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0xd4 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x118 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x1f8 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x234 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x274 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: patch_unmap+0x2c (section: .text.patch_unmap) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_set+0x1cc (section: .text.__patch_insn_set) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_set+0x304 (section: .text.__patch_insn_set) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_set+0x340 (section: .text.__patch_insn_set) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_set+0x360 (section: .text.__patch_insn_set) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_write+0x1e0 (section: .text.__patch_insn_write) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_write+0x318 (section: .text.__patch_insn_write) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_write+0x358 (section: .text.__patch_insn_write) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_write+0x378 (section: .text.__patch_insn_write) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handle_page_fault+0xd4 (section: .text.handle_page_fault) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_int_jit_compile+0x460 (section: .text.bpf_int_jit_compile) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_jit_emit_insn+0x10f4 (section: .text.bpf_jit_emit_insn) -> .L20 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_event_pid+0x348 (section: .text.ptrace_event_pid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pidfd_prepare+0xf0 (section: .text.pidfd_prepare) -> rmem_cma_fixup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x5ac (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xeec (section: .text.copy_process) -> dma_debug_driver_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_clone+0x620 (section: .text.kernel_clone) -> .LBB6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ksys_unshare+0x358 (section: .text.ksys_unshare) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x274 (section: .text.vpanic) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x2a4 (section: .text.vpanic) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: release_task+0x4d0 (section: .text.release_task) -> .LBB6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: release_task+0x5f4 (section: .text.release_task) -> .LBB6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_exit+0x434 (section: .text.do_exit) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_waitid+0xf0 (section: .text.kernel_waitid) -> .LBB6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_wait4+0x160 (section: .text.kernel_wait4) -> .LBB6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_wait+0xbc (section: .text.kernel_wait) -> .LBB6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ktimerd_setup+0x14 (section: .text.ktimerd_setup) -> .LFE6275 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_perf_trace_irq_handler_entry+0x50 (section: .text.do_perf_trace_irq_handler_entry) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_event_raw_event_irq_handler_entry+0x84 (section: .text.do_trace_event_raw_event_irq_handler_entry) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irq_enter_rcu+0x68 (section: .text.irq_enter_rcu) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_signals+0xa4 (section: .text.exit_signals) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_signals+0x40c (section: .text.exit_signals) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_pidfd_send_signal+0x22c (section: .text.___se_sys_pidfd_send_signal) -> .LBB6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_rt_sigaction+0xc4 (section: .text.___se_sys_rt_sigaction) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_rt_sigaction+0x11c (section: .text.___se_sys_rt_sigaction) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_prctl+0x3bc (section: .text.__do_sys_prctl) -> timers_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: call_usermodehelper_exec+0xc8 (section: .text.call_usermodehelper_exec) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_work_pool+0x38 (section: .text.get_work_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: reap_dying_workers+0x8c (section: .text.reap_dying_workers) -> timers_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: show_cpu_pools_busy_workers+0x174 (section: .text.show_cpu_pools_busy_workers) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: show_all_workqueues+0x1c8 (section: .text.show_all_workqueues) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wq_watchdog_timer_fn+0xb0 (section: .text.wq_watchdog_timer_fn) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: workqueue_sysfs_register+0xa4 (section: .text.workqueue_sysfs_register) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pidfd_get_task+0xdc (section: .text.pidfd_get_task) -> .LBB6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_pidfd_open+0xbc (section: .text.___se_sys_pidfd_open) -> .LBB6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: parameq+0x3c (section: .text.parameq) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_setns+0x2f0 (section: .text.__do_sys_setns) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_restart+0x78 (section: .text.kernel_restart) -> rmem_cma_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_halt+0x5c (section: .text.kernel_halt) -> rmem_cma_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_power_off+0x70 (section: .text.kernel_power_off) -> rmem_cma_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smpboot_register_percpu_thread+0x74 (section: .text.smpboot_register_percpu_thread) -> timers_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smpboot_unregister_percpu_thread+0xa4 (section: .text.smpboot_unregister_percpu_thread) -> timers_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_get_offsets_sched_prepare_exec+0x3c (section: .text.trace_event_get_offsets_sched_prepare_exec) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_get_offsets_sched_prepare_exec+0x80 (section: .text.trace_event_get_offsets_sched_prepare_exec) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mutex_lock_io_nested+0x170 (section: .sched.text) -> dma_contiguous_reserve (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_idle_write_s64+0x14 (section: .text.cpu_idle_write_s64) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_perf_trace_sched_process_exec+0x58 (section: .text.do_perf_trace_sched_process_exec) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_event_raw_event_sched_process_exec+0x8c (section: .text.do_trace_event_raw_event_sched_process_exec) -> early_cma (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_nohz_timer_target+0x108 (section: .text.get_nohz_timer_target) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_capacity+0x5c (section: .text.select_idle_capacity) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_capacity+0x274 (section: .text.select_idle_capacity) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_cpu+0x2d4 (section: .text.select_idle_cpu) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_se+0x12c (section: .text.update_se) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: migrate_se_pelt_lag+0x140 (section: .text.migrate_se_pelt_lag) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: detach_entity_load_avg+0x36c (section: .text.detach_entity_load_avg) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: attach_entity_load_avg+0x310 (section: .text.attach_entity_load_avg) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_load_avg+0x6a8 (section: .text.update_load_avg) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __active_load_balance_cpu_stop+0x208 (section: .text.__active_load_balance_cpu_stop) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_sd_pick_busiest+0x13c (section: .text.update_sd_pick_busiest) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_sd_pick_busiest+0x14c (section: .text.update_sd_pick_busiest) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_sg_lb_stats+0x248 (section: .text.update_sg_lb_stats) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_sg_lb_stats+0x258 (section: .text.update_sg_lb_stats) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sched_balance_find_src_rq+0xd0 (section: .text.sched_balance_find_src_rq) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sched_balance_find_src_rq+0xe0 (section: .text.sched_balance_find_src_rq) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_sibling+0x4fc (section: .text.select_idle_sibling) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_sibling+0x5ac (section: .text.select_idle_sibling) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_sibling+0x644 (section: .text.select_idle_sibling) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_sibling+0x7e0 (section: .text.select_idle_sibling) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_sibling+0x88c (section: .text.select_idle_sibling) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_sibling+0x89c (section: .text.select_idle_sibling) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_task_rq_fair+0x178 (section: .text.select_task_rq_fair) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_task_rq_fair+0x308 (section: .text.select_task_rq_fair) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_task_rq_fair+0x3ac (section: .text.select_task_rq_fair) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_task_rq_fair+0x3bc (section: .text.select_task_rq_fair) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_curr+0x128 (section: .text.update_curr) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __update_idle_core+0xe8 (section: .text.__update_idle_core) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __update_idle_core+0x21c (section: .text.__update_idle_core) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sched_balance_rq+0x67c (section: .text.sched_balance_rq) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sched_balance_rq+0x68c (section: .text.sched_balance_rq) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sched_balance_newidle+0x140 (section: .text.sched_balance_newidle) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sched_balance_newidle+0x2e0 (section: .text.sched_balance_newidle) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nohz_balance_exit_idle+0xb4 (section: .text.nohz_balance_exit_idle) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
