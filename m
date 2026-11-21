Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293432;
	b=a/i7w9CCwnu96BBiA1/ZNP7xFOpQopS2vOq4stb0DnjpjYigA4PQjBwprcPTiHW+bNfR
	 v3YRxQEiQ4a6LAtQiPJU0bPHfjFSP9ZJHOfA28xDvUxkjDpn5ZlnleN6MqpzpJpirVeVU
	 EVcvOnqRa4M+JyykO0RuUBLMm2o41fv8EKNt24jnTDcIeGVx3jrfsW/fc/pq1wzh1Ex9W
	 bSq3kiUXUcCM9zhZvXw+ucsmT5S4Cwa/DecMgm+mnS/ODuhrbyfoKFTMn18jQRmZJO3FD
	 PizJ+mfDVrosm+ro5tyV25kZdc7L2qS45SiT8lHMszddrO3180TTz7weNGd8EivQxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293432;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PwoCwbqp8g+kaVvW3Vh2xOj+yTFwq+qiJL6OsMrGcoA=;
	b=40JxdnJgaQk0va0jq24MgyMwvqlmuCIpPn+ocluewGSe2OjXZZ+HxH0P7fxMkEC5X8B6
	 oV/A39/W4phXQJRsnXCI5kL6t2JGH6PQLYbwwQmUxAEKgsg6Vi0ptfeqgQxALTuSiXRsY
	 Xx+bRCLHqB1LwqTyXsXkyN9OhruowoHV5/C7Ci9vyLO6C5hbOl7Q1eLpoODn4YoXTlOE9
	 /CLYcekrZFGFV0yETHnPrcMDECBcpmRRSSljspZN8EQ6hBY8qv9bpbCtklD7esJbsowSk
	 lvhtGsTnlUlPUiFG4I5Bn7R3mr2XrzrDIOVbTkV76pUeCCqjqxTbQ+ylJYLGaSyuRdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X1agR8HI;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF4606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 20:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CAF4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X1agR8HI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795293431; x=1826829431;
  h=date:from:to:cc:subject:message-id;
  bh=02hgDItzu7mM9bv7kwLNxbfWSytahh6OU/VFdTsbveQ=;
  b=X1agR8HIvbrq6ZOpIAxJpqKZ+ZrCFRNNNF1QVqFDLmjDdLl2FJaEAWBR
   SBzMRuNpgvqQgR+0aF7wQIG4g/ZXdX6E/cAfmrlGpIRthBgt+KgyJo3lY
   WRSrw46/5FO46bjd/DLrJeHK2ty5c6Bd9N7IfQmfkjXQBLbMTy1+JyWbl
   Ldzif77zoR4BgtpdB/N0ZU+fIDKID/bB9Q8rXcPaQWRVSzk2PJViXJZFz
   fq5gFBlVRUg3uuEE8ICrxZu4FsiRdUtYuhmkz9fDXMMEW0y3EC1ZNHL0+
   DxS052NIoXGlqksJH6Qp9kmx4Q30sqt1YM6CXn4TJb8xY73tYVubPI5na
   w==;
X-CSE-ConnectionGUID: 1nXcNROwTzCsoJzh1bG8ew==
X-CSE-MsgGUID: NeHrbLfxQS2/aieefCDTug==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4028863"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4028863"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 12:37:10 -0800
X-CSE-ConnectionGUID: 9sPf7oB5S7y2MlSXtNo1yw==
X-CSE-MsgGUID: jg8rU5mzST24lO8t/0Aaow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10895002"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Nov 2026 12:37:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUrpZ-000000004NJ-43Tr;
	Sat, 21 Nov 2026 20:37:05 +0000
Date: Sat, 21 Nov 2026 21:36:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxtv-media:next 19/30] ERROR: modpost: __ex_table+0x1b04
 references non-executable section
 '.rodata.cs_dsp_mock_adsp2_32bit_dsp1_region_sizes'
Message-ID: <20261121212643.ztsvnGgj-lkp@intel.com>
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
TO: Max Bretschneider <max.bretschneider@leica-geosystems.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.linuxtv.org/media.git next
head:   aa0f4c41d4870a18e65772a1817af16427200371
commit: 75b01f0e6e09fd7ba121c3a2da59705c1af2ce3c [19/30] media: i2c: ov08d10: add get_selection support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r2101-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121212643.ztsvnGgj-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121212643.ztsvnGgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121212643.ztsvnGgj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x14 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x11c (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x188 (section: .text.rcu_read_unlock) -> register_kernel_offset_dumper (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x19c (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1a0 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1bc (section: .text.rcu_read_unlock) -> register_kernel_offset_dumper (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1c0 (section: .text.rcu_read_unlock) -> reserve_memblock_reserved_regions (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x224 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x188 (section: .text.rcu_read_unlock) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x19c (section: .text.rcu_read_unlock) -> .LFE5873 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1c0 (section: .text.rcu_read_unlock) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x224 (section: .text.rcu_read_unlock) -> alloc_pte_late (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_perf_trace_initcall_level+0x5c (section: .text.do_perf_trace_initcall_level) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_event_raw_event_initcall_level+0xa4 (section: .text.do_trace_event_raw_event_initcall_level) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_get_hart_index+0x98 (section: .text.riscv_get_hart_index) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_exit.isra.0+0xb0 (section: .text.ptrace_report_syscall_exit.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_exit.isra.0+0xb0 (section: .text.ptrace_report_syscall_exit.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> 0x0 (section: .rodata.cgroup_bpf_struct_ops_attach.str1.4)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.rodata.cgroup_bpf_struct_ops_attach.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> 0x0 (section: .rodata.__cgroup_bpf_run_filter_skb.str1.4)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.rodata.__cgroup_bpf_run_filter_skb.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19bc (section: __ex_table) -> CSWTCH (section: .rodata.CSWTCH.365)
ERROR: modpost: __ex_table+0x19bc references non-executable section '.rodata.CSWTCH.365'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> 0x0 (section: .rodata.__cgroup_bpf_run_filter_skb.str1.4)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.rodata.__cgroup_bpf_run_filter_skb.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> cg_sockopt_verifier_ops (section: .rodata.cg_sockopt_verifier_ops)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.rodata.cg_sockopt_verifier_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> 0x0 (section: .rodata.__cgroup_bpf_run_filter_skb.str1.4)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.rodata.__cgroup_bpf_run_filter_skb.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e0 (section: __ex_table) -> 0x0 (section: .rodata.bm_entry_show.str1.4)
ERROR: modpost: __ex_table+0x19e0 references non-executable section '.rodata.bm_entry_show.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_wseq_write.str1.4)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.rodata.cs_dsp_wseq_write.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_load_coeff.str1.4)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.rodata.cs_dsp_load_coeff.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_wseq_write.str1.4)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.rodata.cs_dsp_wseq_write.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a58 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_populate_wseq.str1.4)
ERROR: modpost: __ex_table+0x1a58 references non-executable section '.rodata.cs_dsp_populate_wseq.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp2_bus_error.str1.4)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.rodata.cs_dsp_adsp2_bus_error.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a7c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_parse_coeff.str1.4)
ERROR: modpost: __ex_table+0x1a7c references non-executable section '.rodata.cs_dsp_parse_coeff.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a80 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp2_bus_error.str1.4)
ERROR: modpost: __ex_table+0x1a80 references non-executable section '.rodata.cs_dsp_adsp2_bus_error.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a8c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp1_power_up.str1.4)
ERROR: modpost: __ex_table+0x1a8c references non-executable section '.rodata.cs_dsp_adsp1_power_up.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a94 (section: __ex_table) -> CSWTCH (section: .rodata.CSWTCH.489)
ERROR: modpost: __ex_table+0x1a94 references non-executable section '.rodata.CSWTCH.489'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a98 (section: __ex_table) -> cs_dsp_default_client_ops (section: .rodata.cs_dsp_default_client_ops)
ERROR: modpost: __ex_table+0x1a98 references non-executable section '.rodata.cs_dsp_default_client_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa0 (section: __ex_table) -> cs_dsp_debugfs_fops (section: .rodata.cs_dsp_debugfs_fops)
ERROR: modpost: __ex_table+0x1aa0 references non-executable section '.rodata.cs_dsp_debugfs_fops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> cs_dsp_halo_ops (section: .rodata.cs_dsp_halo_ops)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.rodata.cs_dsp_halo_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aac (section: __ex_table) -> cs_dsp_adsp1_ops (section: .rodata.cs_dsp_adsp1_ops)
ERROR: modpost: __ex_table+0x1aac references non-executable section '.rodata.cs_dsp_adsp1_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_base_addr_for_mem.str1.4)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.rodata.cs_dsp_mock_base_addr_for_mem.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_reg_addr_inc_per_unpacked_word.str1.4)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.rodata.cs_dsp_mock_reg_addr_inc_per_unpacked_word.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_base_addr_for_mem.str1.4)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.rodata.cs_dsp_mock_base_addr_for_mem.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af4 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_create_mock_xm_header.str1.4)
ERROR: modpost: __ex_table+0x1af4 references non-executable section '.rodata.cs_dsp_create_mock_xm_header.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af8 (section: __ex_table) -> cs_dsp_mock_adsp2_xm_hdr (section: .rodata.cs_dsp_mock_adsp2_xm_hdr)
ERROR: modpost: __ex_table+0x1af8 references non-executable section '.rodata.cs_dsp_mock_adsp2_xm_hdr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b00 (section: __ex_table) -> cs_dsp_mock_adsp2_16bit_dsp1_region_sizes (section: .rodata.cs_dsp_mock_adsp2_16bit_dsp1_region_sizes)
ERROR: modpost: __ex_table+0x1b00 references non-executable section '.rodata.cs_dsp_mock_adsp2_16bit_dsp1_region_sizes'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> cs_dsp_mock_adsp2_32bit_dsp1_region_sizes (section: .rodata.cs_dsp_mock_adsp2_32bit_dsp1_region_sizes)
>> ERROR: modpost: __ex_table+0x1b04 references non-executable section '.rodata.cs_dsp_mock_adsp2_32bit_dsp1_region_sizes'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> cs_dsp_mock_halo_dsp1_region_sizes (section: .rodata.cs_dsp_mock_halo_dsp1_region_sizes)
>> ERROR: modpost: __ex_table+0x1b0c references non-executable section '.rodata.cs_dsp_mock_halo_dsp1_region_sizes'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_bin_get_firmware.str1.4)
>> ERROR: modpost: __ex_table+0x1b10 references non-executable section '.rodata.cs_dsp_mock_bin_get_firmware.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b40 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_regmap_read.str1.4)
ERROR: modpost: __ex_table+0x1b40 references non-executable section '.rodata.cs_dsp_mock_regmap_read.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b48 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_regmap_gather_write.str1.4)
ERROR: modpost: __ex_table+0x1b48 references non-executable section '.rodata.cs_dsp_mock_regmap_gather_write.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b4c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_regmap_write.str1.4)
ERROR: modpost: __ex_table+0x1b4c references non-executable section '.rodata.cs_dsp_mock_regmap_write.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b54 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_regmap_init.str1.4)
ERROR: modpost: __ex_table+0x1b54 references non-executable section '.rodata.cs_dsp_mock_regmap_init.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b60 (section: __ex_table) -> cs_dsp_mock_regmap_halo (section: .rodata.cs_dsp_mock_regmap_halo)
>> ERROR: modpost: __ex_table+0x1b60 references non-executable section '.rodata.cs_dsp_mock_regmap_halo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b64 (section: __ex_table) -> halo_readable (section: .rodata.halo_readable)
>> ERROR: modpost: __ex_table+0x1b64 references non-executable section '.rodata.halo_readable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b6c (section: __ex_table) -> cs_dsp_mock_halo_core_base (section: .srodata.cs_dsp_mock_halo_core_base)
>> ERROR: modpost: __ex_table+0x1b6c references non-executable section '.srodata.cs_dsp_mock_halo_core_base'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b70 (section: __ex_table) -> halo_readable (section: .rodata.halo_readable)
ERROR: modpost: __ex_table+0x1b70 references non-executable section '.rodata.halo_readable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> halo_register_defaults (section: .rodata.halo_register_defaults)
>> ERROR: modpost: __ex_table+0x1b78 references non-executable section '.rodata.halo_register_defaults'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> adsp2_16bit_rw (section: .rodata.adsp2_16bit_rw)
>> ERROR: modpost: __ex_table+0x1b7c references non-executable section '.rodata.adsp2_16bit_rw'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b84 (section: __ex_table) -> adsp2_16bit_registers (section: .rodata.adsp2_16bit_registers)
>> ERROR: modpost: __ex_table+0x1b84 references non-executable section '.rodata.adsp2_16bit_registers'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> adsp2_16bit_rw (section: .rodata.adsp2_16bit_rw)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.rodata.adsp2_16bit_rw'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b90 (section: __ex_table) -> adsp2_32bit_rw (section: .rodata.adsp2_32bit_rw)
ERROR: modpost: __ex_table+0x1b90 references non-executable section '.rodata.adsp2_32bit_rw'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b94 (section: __ex_table) -> halo_readable (section: .rodata.halo_readable)
ERROR: modpost: __ex_table+0x1b94 references non-executable section '.rodata.halo_readable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b9c (section: __ex_table) -> adsp2_32bit_register_defaults (section: .rodata.adsp2_32bit_register_defaults)
>> ERROR: modpost: __ex_table+0x1b9c references non-executable section '.rodata.adsp2_32bit_register_defaults'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_wmfw_get_firmware.str1.4)
ERROR: modpost: __ex_table+0x1ba8 references non-executable section '.rodata.cs_dsp_mock_wmfw_get_firmware.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bb8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_wmfw_add_info.str1.4)
ERROR: modpost: __ex_table+0x1bb8 references non-executable section '.rodata.cs_dsp_mock_wmfw_add_info.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc0 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_wmfw_start_alg_info_block.str1.4)
ERROR: modpost: __ex_table+0x1bc0 references non-executable section '.rodata.cs_dsp_mock_wmfw_start_alg_info_block.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_init_adsp2_halo_wmfw.constprop.0.str1.4)
>> ERROR: modpost: __ex_table+0x1bcc references non-executable section '.rodata.cs_dsp_init_adsp2_halo_wmfw.constprop.0.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> 0x0 (section: .rodata.bin_patch_name_and_info.str1.4)
ERROR: modpost: __ex_table+0x1bdc references non-executable section '.rodata.bin_patch_name_and_info.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be4 (section: __ex_table) -> 0x0 (section: .rodata.alg_param_desc.str1.4)
ERROR: modpost: __ex_table+0x1be4 references non-executable section '.rodata.alg_param_desc.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: dump_instr+0xec (section: .text.dump_instr) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_permit_entry.isra.0+0x6c (section: .text.ptrace_report_syscall_permit_entry.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x90 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0xd4 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x118 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x1f8 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x234 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: populate_cache_leaves+0x274 (section: .text.populate_cache_leaves) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: patch_unmap+0x2c (section: .text.patch_unmap) -> .LBE119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_set+0x1cc (section: .text.__patch_insn_set) -> .LBE119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_set+0x304 (section: .text.__patch_insn_set) -> .LBE119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_set+0x340 (section: .text.__patch_insn_set) -> .LBE119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_set+0x360 (section: .text.__patch_insn_set) -> .LBE119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_write+0x1e0 (section: .text.__patch_insn_write) -> .LBE119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_write+0x318 (section: .text.__patch_insn_write) -> .LBE119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_write+0x358 (section: .text.__patch_insn_write) -> .LBE119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __patch_insn_write+0x378 (section: .text.__patch_insn_write) -> .LBE119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handle_page_fault+0xd4 (section: .text.handle_page_fault) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_int_jit_compile+0x158 (section: .text.bpf_int_jit_compile) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_int_jit_compile+0x460 (section: .text.bpf_int_jit_compile) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_jit_emit_insn+0x10f4 (section: .text.bpf_jit_emit_insn) -> .L21 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_event_pid+0x348 (section: .text.ptrace_event_pid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x468 (section: .text.copy_process) -> dma_debug_driver_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x5ac (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xeec (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_clone+0x620 (section: .text.kernel_clone) -> .LBE6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ksys_unshare+0x358 (section: .text.ksys_unshare) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x274 (section: .text.vpanic) -> rmem_cma_fixup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x2a4 (section: .text.vpanic) -> rmem_cma_fixup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x50c (section: .text.vpanic) -> __setup_str_early_coherent_pool (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: release_task+0x4d0 (section: .text.release_task) -> .LBE6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: release_task+0x5f4 (section: .text.release_task) -> .LBE6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_exit+0x434 (section: .text.do_exit) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_waitid+0xf0 (section: .text.kernel_waitid) -> .LBE6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_wait4+0x160 (section: .text.kernel_wait4) -> .LBE6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_wait+0xbc (section: .text.kernel_wait) -> .LBE6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_perf_trace_irq_handler_entry+0x50 (section: .text.do_perf_trace_irq_handler_entry) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handle_softirqs+0x578 (section: .text.handle_softirqs) -> dma_atomic_pool_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_event_raw_event_irq_handler_entry+0x84 (section: .text.do_trace_event_raw_event_irq_handler_entry) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irq_enter_rcu+0x68 (section: .text.irq_enter_rcu) -> dma_contiguous_reserve_area (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __ptrace_detach+0x138 (section: .text.__ptrace_detach) -> .LBB99 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_notify_parent+0x9b4 (section: .text.do_notify_parent) -> .LBB99 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_notify_parent_cldstop+0x80c (section: .text.do_notify_parent_cldstop) -> .LBB99 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_signals+0xa4 (section: .text.exit_signals) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_signals+0x40c (section: .text.exit_signals) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_pidfd_send_signal+0x22c (section: .text.___se_sys_pidfd_send_signal) -> .LBE6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_rt_sigaction+0xc4 (section: .text.___se_sys_rt_sigaction) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_rt_sigaction+0x11c (section: .text.___se_sys_rt_sigaction) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_newuname+0x38 (section: .text.__do_sys_newuname) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_newuname+0x60 (section: .text.__do_sys_newuname) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_sethostname+0x7c (section: .text.___se_sys_sethostname) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_sethostname+0xc4 (section: .text.___se_sys_sethostname) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_setdomainname+0x7c (section: .text.___se_sys_setdomainname) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_setdomainname+0xc4 (section: .text.___se_sys_setdomainname) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_prctl+0x3bc (section: .text.__do_sys_prctl) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: call_usermodehelper_exec+0xc8 (section: .text.call_usermodehelper_exec) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_work_pool+0x38 (section: .text.get_work_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: reap_dying_workers+0x8c (section: .text.reap_dying_workers) -> timers_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: create_worker+0x44 (section: .text.create_worker) -> rmem_dma_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: show_cpu_pools_busy_workers+0x174 (section: .text.show_cpu_pools_busy_workers) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: enable_delayed_work+0x24 (section: .text.enable_delayed_work) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __cancel_work_sync+0x110 (section: .text.__cancel_work_sync) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: alloc_pwq+0x11c (section: .text.alloc_pwq) -> dma_debug_driver_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: show_all_workqueues+0x1c8 (section: .text.show_all_workqueues) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wq_watchdog_timer_fn+0xb0 (section: .text.wq_watchdog_timer_fn) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: workqueue_sysfs_register+0xa4 (section: .text.workqueue_sysfs_register) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pidfd_get_task+0xdc (section: .text.pidfd_get_task) -> .LBE6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_pidfd_open+0xbc (section: .text.___se_sys_pidfd_open) -> .LBE6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: parameq+0x3c (section: .text.parameq) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_setns+0x2f0 (section: .text.__do_sys_setns) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_restart+0x78 (section: .text.kernel_restart) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_halt+0x5c (section: .text.kernel_halt) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_power_off+0x70 (section: .text.kernel_power_off) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smpboot_register_percpu_thread+0x74 (section: .text.smpboot_register_percpu_thread) -> timers_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smpboot_unregister_percpu_thread+0xa4 (section: .text.smpboot_unregister_percpu_thread) -> timers_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_get_offsets_sched_prepare_exec+0x3c (section: .text.trace_event_get_offsets_sched_prepare_exec) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_get_offsets_sched_prepare_exec+0x80 (section: .text.trace_event_get_offsets_sched_prepare_exec) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mutex_lock_io_nested+0x170 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpu_idle_write_s64+0x14 (section: .text.cpu_idle_write_s64) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_perf_trace_sched_process_exec+0x58 (section: .text.do_perf_trace_sched_process_exec) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_event_raw_event_sched_process_exec+0x8c (section: .text.do_trace_event_raw_event_sched_process_exec) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_nohz_timer_target+0x108 (section: .text.get_nohz_timer_target) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_capacity+0x5c (section: .text.select_idle_capacity) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_capacity+0x274 (section: .text.select_idle_capacity) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_cpu+0x2d4 (section: .text.select_idle_cpu) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_se+0x12c (section: .text.update_se) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: migrate_se_pelt_lag+0x140 (section: .text.migrate_se_pelt_lag) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __active_load_balance_cpu_stop+0x208 (section: .text.__active_load_balance_cpu_stop) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_sd_pick_busiest+0x13c (section: .text.update_sd_pick_busiest) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_sd_pick_busiest+0x14c (section: .text.update_sd_pick_busiest) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_sg_lb_stats+0x248 (section: .text.update_sg_lb_stats) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_sg_lb_stats+0x258 (section: .text.update_sg_lb_stats) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sched_balance_find_src_rq+0xd0 (section: .text.sched_balance_find_src_rq) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sched_balance_find_src_rq+0xe0 (section: .text.sched_balance_find_src_rq) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_sibling+0x4fc (section: .text.select_idle_sibling) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_sibling+0x5ac (section: .text.select_idle_sibling) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
