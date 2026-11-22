Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327629;
	b=H7lZ0gqilJn4N8bAPncBI3GteCM5C+OikeHhcZuDuyOnBPhuk7Ww/dm64pJb16Lygx5A
	 poK/ZK4T7z5iKYkZbXd0tNtYbZXzP0P4uWpZtuS/ut6E1aXEnSQXZFAYlbSLEmSrJT5mG
	 5u8LBRU2ogFsvXBlGxaJszHdU1pM/IoMSpMhx2+3q7V7GcaDshXErffRm7hN7Po9ZLXyc
	 W1Kgtq60zuTgGIIuyjrkM57G2FLX0rViL3qYmV5yH4jChM6yo9UI6yvSOLyvH2l77cz1W
	 px4sbBvIcqM55CDYElAx9lEYyYyAg+u/Pt4FfSglyGvVCmG4//ovLLsnVdxyH1AWltA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327629;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wjeH0tSZ6I/WwK2L1oOs7hiI3l4QwXYrB/ePfMDmc2Q=;
	b=iEcr0iB6LQG1TPoFfeA6NIYauHXsZqxrbnGv1LjQ2knfHFPuokJdD+hM/1Y1Pz5p4Ro/
	 x1GBdeq9dPYbNmO3B2cBP3FfsKWZdi7rzR3zMG2bHTOvEQ0LNPkeZSlKfJ3aVkMcAarX9
	 mXVu/Vq3tKQrD9dKE7pzKcJs1OzEFwwwRCCX4mbZ3mtnOUI8mqaHc3hZrHlLzepaS9ZLV
	 iUWSgGj4EmpYQur07KCSj1jFTs3MwlnOLgE1emPlixGaAs4AvDiAs7ok2nYSAp8F48mcJ
	 M6sxZ9Il8ERonyYNAUlb5nh2+fskeysN6CG/ysQNYwmPh8sUhWVhhAJHANatvOcQGWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dCryQzgQ;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1494E606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 06:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1494E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dCryQzgQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795327628; x=1826863628;
  h=date:from:to:cc:subject:message-id;
  bh=txqTseu6slHVaLXl07Em9Aq4gR3eWtwv85mFdGun180=;
  b=dCryQzgQ77JaCNiL7hr/HHtaI3Y6+sqvuljzGXVUH3X2UoyPSQXRqhcA
   flS+d67bSdPVHdZt7dhLKUNAY7Yrc8HRVQ6980Iuzztn5mr/+590ZAD+I
   fHkfcFfYiSVzl8Kk4nEpdKqpecBX45rXcyCAfWTtbzlMUGuhUcjVnVPLM
   6wSMjsRCVawscXcgsF7XvmDAuDYOD9ns2LdZ84Hzyg0hUHmoXuShoEGmN
   NI51TRZXlKpLJHQEgKjSUuz6x48f8v+KXFORwBGJn0wkJOzEMDn3iem/P
   1Mmg7ipOQVdOLQI9bnbmTkDeQ3lekc1bKMUpR/nSutwKuXwS8xWxi5vAu
   w==;
X-CSE-ConnectionGUID: P0QSQSIFT1eb1gMSxHjKWw==
X-CSE-MsgGUID: ug/UX9NeTjWO3DrslTL7Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4043199"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4043199"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 22:07:07 -0800
X-CSE-ConnectionGUID: sgGLp1QwQvuHXOyL3B0bGg==
X-CSE-MsgGUID: MbVZ0VmESkCmZFGyQHHfBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="10907926"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2026 22:07:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV0j9-000000004Vh-3N8s;
	Sun, 22 Nov 2026 06:07:03 +0000
Date: Sun, 22 Nov 2026 07:06:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxtv-media-pending:master 27/30] ERROR: modpost:
 __ex_table+0x198c references non-executable section
 '.sbss.reuseport_array_map_btf_ids'
Message-ID: <20261122070334.CzWPpZJI-lkp@intel.com>
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
TO: John Cronin <john@stromback.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Kate Hsuan <hpa@redhat.com>

tree:   https://git.linuxtv.org/media-ci/media-pending.git master
head:   aa0f4c41d4870a18e65772a1817af16427200371
commit: 73f9f99e2745b2922d99d06e264927bfbce34815 [27/30] media: i2c: imx471: return 0 from get_selection after filling crop
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r2101-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122070334.CzWPpZJI-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122070334.CzWPpZJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122070334.CzWPpZJI-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: init_pivot_root+0x98 (section: .init.text) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x14 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x11c (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x18 (section: .text.rcu_read_unlock) -> .LBB640 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x64 (section: .text.rcu_read_unlock) -> .LBE640 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0xb0 (section: .text.rcu_read_unlock) -> .LBE640 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0xfc (section: .text.rcu_read_unlock) -> .LBE640 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x120 (section: .text.rcu_read_unlock) -> .LBB641 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x140 (section: .text.rcu_read_unlock) -> .LBE641 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x168 (section: .text.rcu_read_unlock) -> get_pte_virt_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x188 (section: .text.rcu_read_unlock) -> .LFE5868 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1fc (section: .text.rcu_read_unlock) -> .LBE640 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x18 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x64 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0xb0 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0xfc (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x120 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x140 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x164 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x168 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x188 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x19c (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1a0 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1bc (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1c0 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x1fc (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_read_unlock+0x224 (section: .text.rcu_read_unlock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_perf_trace_initcall_level+0x5c (section: .text.do_perf_trace_initcall_level) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_event_raw_event_initcall_level+0xa4 (section: .text.do_trace_event_raw_event_initcall_level) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_exit.isra.0+0xb0 (section: .text.ptrace_report_syscall_exit.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_exit.isra.0+0xb0 (section: .text.ptrace_report_syscall_exit.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: arch_ptrace+0x48 (section: .text.arch_ptrace) -> .L85 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x198c (section: __ex_table) -> reuseport_array_map_btf_ids (section: .sbss.reuseport_array_map_btf_ids)
>> ERROR: modpost: __ex_table+0x198c references non-executable section '.sbss.reuseport_array_map_btf_ids'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> 0x0 (section: .rodata.__cgroup_bpf_run_filter_getsockopt.str1.4)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.rodata.__cgroup_bpf_run_filter_getsockopt.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x199c (section: __ex_table) -> bpf_get_netns_cookie_sockopt_proto (section: .rodata.bpf_get_netns_cookie_sockopt_proto)
>> ERROR: modpost: __ex_table+0x199c references non-executable section '.rodata.bpf_get_netns_cookie_sockopt_proto'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> 0x0 (section: .rodata.bpf_struct_ops_map_delete_elem.str1.4)
>> ERROR: modpost: __ex_table+0x19b0 references non-executable section '.rodata.bpf_struct_ops_map_delete_elem.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> 0x0 (section: .rodata.reuseport_array_free.str1.4)
>> ERROR: modpost: __ex_table+0x19b4 references non-executable section '.rodata.reuseport_array_free.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> 0x0 (section: .rodata.reuseport_array_free.str1.4)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.rodata.reuseport_array_free.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> 0x0 (section: .rodata.reuseport_array_free.str1.4)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.rodata.reuseport_array_free.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> 0x0 (section: .rodata.backing_file_splice_write.str1.4)
>> ERROR: modpost: __ex_table+0x19d4 references non-executable section '.rodata.backing_file_splice_write.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> bm_dir_inode_operations (section: .rodata.bm_dir_inode_operations)
>> ERROR: modpost: __ex_table+0x19d8 references non-executable section '.rodata.bm_dir_inode_operations'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> 0x0 (section: .rodata.posix_acl_valid)
>> ERROR: modpost: __ex_table+0x19f0 references non-executable section '.rodata.posix_acl_valid'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> cs_dsp_debugfs_read_controls_fops (section: .rodata.cs_dsp_debugfs_read_controls_fops)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.rodata.cs_dsp_debugfs_read_controls_fops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp1_power_up.str1.4)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.rodata.cs_dsp_adsp1_power_up.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> cs_dsp_halo_ops (section: .rodata.cs_dsp_halo_ops)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.rodata.cs_dsp_halo_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp1_power_up.str1.4)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.rodata.cs_dsp_adsp1_power_up.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a64 (section: __ex_table) -> cs_dsp_mock_halo_xm_hdr (section: .rodata.cs_dsp_mock_halo_xm_hdr)
ERROR: modpost: __ex_table+0x1a64 references non-executable section '.rodata.cs_dsp_mock_halo_xm_hdr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a70 (section: __ex_table) -> cs_dsp_mock_adsp2_32bit_dsp1_region_sizes (section: .rodata.cs_dsp_mock_adsp2_32bit_dsp1_region_sizes)
ERROR: modpost: __ex_table+0x1a70 references non-executable section '.rodata.cs_dsp_mock_adsp2_32bit_dsp1_region_sizes'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: __ex_table) -> cs_dsp_mock_halo_dsp1_region_sizes (section: .rodata.cs_dsp_mock_halo_dsp1_region_sizes)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.rodata.cs_dsp_mock_halo_dsp1_region_sizes'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a7c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_bin_get_firmware.str1.4)
ERROR: modpost: __ex_table+0x1a7c references non-executable section '.rodata.cs_dsp_mock_bin_get_firmware.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a80 (section: __ex_table) -> cs_dsp_mock_halo_dsp1_region_sizes (section: .rodata.cs_dsp_mock_halo_dsp1_region_sizes)
ERROR: modpost: __ex_table+0x1a80 references non-executable section '.rodata.cs_dsp_mock_halo_dsp1_region_sizes'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a88 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_bin_add_raw_block.str1.4)
ERROR: modpost: __ex_table+0x1a88 references non-executable section '.rodata.cs_dsp_mock_bin_add_raw_block.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a94 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_bin_init.str1.4)
ERROR: modpost: __ex_table+0x1a94 references non-executable section '.rodata.cs_dsp_mock_bin_init.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a98 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_bin_add_name_or_info.isra.0.str1.4)
ERROR: modpost: __ex_table+0x1a98 references non-executable section '.rodata.cs_dsp_mock_bin_add_name_or_info.isra.0.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> cs_dsp_mock_regmap_halo (section: .rodata.cs_dsp_mock_regmap_halo)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.rodata.cs_dsp_mock_regmap_halo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad4 (section: __ex_table) -> halo_readable (section: .rodata.halo_readable)
ERROR: modpost: __ex_table+0x1ad4 references non-executable section '.rodata.halo_readable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> cs_dsp_mock_halo_core_base (section: .srodata.cs_dsp_mock_halo_core_base)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.srodata.cs_dsp_mock_halo_core_base'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae0 (section: __ex_table) -> halo_readable (section: .rodata.halo_readable)
ERROR: modpost: __ex_table+0x1ae0 references non-executable section '.rodata.halo_readable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> halo_register_defaults (section: .rodata.halo_register_defaults)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.rodata.halo_register_defaults'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> adsp2_16bit_rw (section: .rodata.adsp2_16bit_rw)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.rodata.adsp2_16bit_rw'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af4 (section: __ex_table) -> adsp2_16bit_registers (section: .rodata.adsp2_16bit_registers)
ERROR: modpost: __ex_table+0x1af4 references non-executable section '.rodata.adsp2_16bit_registers'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af8 (section: __ex_table) -> cs_dsp_mock_regmap_adsp2_32bit (section: .rodata.cs_dsp_mock_regmap_adsp2_32bit)
>> ERROR: modpost: __ex_table+0x1af8 references non-executable section '.rodata.cs_dsp_mock_regmap_adsp2_32bit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b00 (section: __ex_table) -> cs_dsp_mock_adsp2_32bit_sysbase (section: .srodata.cs_dsp_mock_adsp2_32bit_sysbase)
>> ERROR: modpost: __ex_table+0x1b00 references non-executable section '.srodata.cs_dsp_mock_adsp2_32bit_sysbase'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> adsp2_32bit_register_defaults (section: .rodata.adsp2_32bit_register_defaults)
ERROR: modpost: __ex_table+0x1b04 references non-executable section '.rodata.adsp2_32bit_register_defaults'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b18 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_wmfw_add_raw_block.str1.4)
ERROR: modpost: __ex_table+0x1b18 references non-executable section '.rodata.cs_dsp_mock_wmfw_add_raw_block.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b30 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_init_adsp2_halo_wmfw.constprop.0.str1.4)
ERROR: modpost: __ex_table+0x1b30 references non-executable section '.rodata.cs_dsp_init_adsp2_halo_wmfw.constprop.0.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b34 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_wmfw_init.str1.4)
ERROR: modpost: __ex_table+0x1b34 references non-executable section '.rodata.cs_dsp_mock_wmfw_init.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b60 (section: __ex_table) -> 0x0 (section: .rodata.x_or_y_or_z_and_alg_param_desc.str1.4)
>> ERROR: modpost: __ex_table+0x1b60 references non-executable section '.rodata.x_or_y_or_z_and_alg_param_desc.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> 0x0 (section: .rodata.packed_x_or_y_and_offset_gen_params.str1.4)
>> ERROR: modpost: __ex_table+0x1b78 references non-executable section '.rodata.packed_x_or_y_and_offset_gen_params.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> 0x0 (section: .rodata.packed_x_or_y_gen_params.str1.4)
>> ERROR: modpost: __ex_table+0x1b7c references non-executable section '.rodata.packed_x_or_y_gen_params.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> 0x0 (section: .rodata.packed_x_or_y_gen_params.str1.4)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.rodata.packed_x_or_y_gen_params.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: arch_do_signal_or_restart+0x19c (section: .text.arch_do_signal_or_restart) -> dma_debug_fs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hwprobe_one_pair+0xd8 (section: .text.hwprobe_one_pair) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: syscall_handler+0x2c (section: .text.syscall_handler) -> .LBE6043 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dump_instr+0xec (section: .text.dump_instr) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_permit_entry.isra.0+0x6c (section: .text.ptrace_report_syscall_permit_entry.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handle_break+0xb4 (section: .text.handle_break) -> .LBE6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap+0x114 (section: .text.do_trap) -> .LBE6044 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_send_ipi_v01+0x50 (section: .text.__sbi_send_ipi_v01) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kgdb_riscv_notify+0x94 (section: .text.kgdb_riscv_notify) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dump_prot+0x104 (section: .text.dump_prot) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: arch_setup_dma_ops+0x5c (section: .text.arch_setup_dma_ops) -> __TRACE_SYSTEM_TICK_DEP_BIT_RCU_EXP (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: arch_setup_dma_ops+0xd8 (section: .text.arch_setup_dma_ops) -> __TRACE_SYSTEM_TICK_DEP_BIT_RCU_EXP (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_jit_free+0x188 (section: .text.bpf_jit_free) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_jit_emit_insn+0x10f4 (section: .text.bpf_jit_emit_insn) -> .L80 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmput_async_fn+0x68 (section: .text.mmput_async_fn) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmput+0x90 (section: .text.mmput) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_event_pid+0x348 (section: .text.ptrace_event_pid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: put_task_stack+0xa8 (section: .text.put_task_stack) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_set_tid_address+0x30 (section: .text.___se_sys_set_tid_address) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xeec (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x20b0 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_clone+0x544 (section: .text.kernel_clone) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_clone+0x56c (section: .text.kernel_clone) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: put_task_exec_state+0x60 (section: .text.put_task_exec_state) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: delayed_put_task_struct+0x1e8 (section: .text.delayed_put_task_struct) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wait_task_continued+0x348 (section: .text.wait_task_continued) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wait_task_continued+0x43c (section: .text.wait_task_continued) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wait_task_stopped+0x488 (section: .text.wait_task_stopped) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wait_task_stopped+0x528 (section: .text.wait_task_stopped) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: put_task_struct_rcu_user+0x6c (section: .text.put_task_struct_rcu_user) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wait_task_zombie+0x48 (section: .text.wait_task_zombie) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wait_task_zombie+0x400 (section: .text.wait_task_zombie) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_exit+0x590 (section: .text.do_exit) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_perf_trace_irq_handler_entry+0x50 (section: .text.do_perf_trace_irq_handler_entry) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_event_raw_event_irq_handler_entry+0x84 (section: .text.do_trace_event_raw_event_irq_handler_entry) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irq_enter_rcu+0x68 (section: .text.irq_enter_rcu) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_request_resource+0xb8 (section: .text.devm_request_resource) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devm_request_region+0xa4 (section: .text.__devm_request_region) -> dma_debug_driver_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devm_request_region+0xc4 (section: .text.__devm_request_region) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_ptrace+0x24c (section: .text.___se_sys_ptrace) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_ptrace+0x420 (section: .text.___se_sys_ptrace) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __send_signal_locked+0x3a0 (section: .text.__send_signal_locked) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_notify_parent+0x278 (section: .text.do_notify_parent) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: send_signal_locked+0x64 (section: .text.send_signal_locked) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_notify_parent_cldstop+0x180 (section: .text.do_notify_parent_cldstop) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_notify+0xbc (section: .text.ptrace_notify) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_signal+0x184 (section: .text.ptrace_signal) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_signal+0x374 (section: .text.get_signal) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_pidfd_send_signal+0x294 (section: .text.do_pidfd_send_signal) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_send_specific+0x198 (section: .text.do_send_specific) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_kill+0x138 (section: .text.___se_sys_kill) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_tgkill+0x80 (section: .text.___se_sys_tgkill) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_tkill+0x64 (section: .text.___se_sys_tkill) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_rt_sigqueueinfo+0xbc (section: .text.___se_sys_rt_sigqueueinfo) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_rt_tgsigqueueinfo+0xe4 (section: .text.___se_sys_rt_tgsigqueueinfo) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_rt_sigaction+0xc4 (section: .text.___se_sys_rt_sigaction) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_rt_sigaction+0x11c (section: .text.___se_sys_rt_sigaction) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_setpgid+0x5c (section: .text.__do_sys_setpgid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_getpriority+0x580 (section: .text.__do_sys_getpriority) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_setpriority+0x5a8 (section: .text.__do_sys_setpriority) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_prlimit64+0x694 (section: .text.__do_sys_prlimit64) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __riscv_sys_getpid+0x24 (section: .text.__riscv_sys_getpid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __riscv_sys_gettid+0x24 (section: .text.__riscv_sys_gettid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __riscv_sys_getppid+0x1e8 (section: .text.__riscv_sys_getppid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: call_usermodehelper_exec+0xc8 (section: .text.call_usermodehelper_exec) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpumask_show+0x64 (section: .text.cpumask_show) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cpumask_show+0x64 (section: .text.cpumask_show) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: create_worker+0x390 (section: .text.create_worker) -> .LBE120 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_rescuer+0x238 (section: .text.init_rescuer) -> .LBE120 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_rescuer+0x258 (section: .text.init_rescuer) -> .LBE120 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: queue_rcu_work+0x80 (section: .text.queue_rcu_work) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: put_unbound_pool+0x340 (section: .text.put_unbound_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pwq_release_workfn+0x4d0 (section: .text.pwq_release_workfn) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: free_pid+0x184 (section: .text.free_pid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_pidfd_getfd+0x144 (section: .text.___se_sys_pidfd_getfd) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_pidfd_getfd+0x1c8 (section: .text.___se_sys_pidfd_getfd) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_pidfd_getfd+0x274 (section: .text.___se_sys_pidfd_getfd) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_pidfd_getfd+0x2d4 (section: .text.___se_sys_pidfd_getfd) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: parameq+0x3c (section: .text.parameq) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kthread_bind+0x84 (section: .text.kthread_bind) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kthread_unpark+0xac (section: .text.kthread_unpark) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kthread_stop+0x284 (section: .text.kthread_stop) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kthread_stop_put+0x78 (section: .text.kthread_stop_put) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_blocking_notifier_chain_register+0x118 (section: .text.devm_blocking_notifier_chain_register) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_atomic_notifier_chain_register+0xe8 (section: .text.devm_atomic_notifier_chain_register) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __put_cred+0xe0 (section: .text.__put_cred) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_register_reboot_notifier+0x98 (section: .text.devm_register_reboot_notifier) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __hw_protection_trigger+0xd8 (section: .text.__hw_protection_trigger) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: migrate_to_reboot_cpu+0x60 (section: .text.migrate_to_reboot_cpu) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_restart+0x78 (section: .text.kernel_restart) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_halt+0x5c (section: .text.kernel_halt) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_power_off+0x70 (section: .text.kernel_power_off) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_get_offsets_sched_prepare_exec+0x3c (section: .text.trace_event_get_offsets_sched_prepare_exec) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_get_offsets_sched_prepare_exec+0x80 (section: .text.trace_event_get_offsets_sched_prepare_exec) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __schedule+0x1f4 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mutex_unlock_slowpath+0x3e4 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_adjust_prio_chain.isra.0+0x140 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_adjust_prio_chain.isra.0+0x2b0 (section: .sched.text) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
