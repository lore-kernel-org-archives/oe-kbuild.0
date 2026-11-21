Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266428;
	b=3jyiDC/vxhnhFdFeIihxZ1m5lXoSGoTF72ECV3GhkZTJAi4WdttPoPSWK7XfwUec1OOG
	 QKZTqqwfdp9uhLPP8aAGaTlEsmqs/tSR/0ejhxmZXreevvOzYi1AQpbcAnq0qatHuNsqv
	 JaRqG++3Cuzt+ej3pJOsT0HJz3EvLI8IsBQfkVh7NaA5Dy2tx2g+tP+2jCZaLaFcqsBIT
	 dKstGxsOFsmGC/D5JNQQN9UrnYHiWH41bm1JwLTtLiTDgW4d4D8yNw2+9r+hz7xzyl6po
	 XsOlcqkX+NZJwQRBy/LXyCuB7SNxEuqGNDTnZ7BdGk27YDznPE2a4I+Uveu4sn1jLQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266428;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1bdhYb23/mx7ObTSp9Fo+qw2wonv8cM4ElStu4yttIU=;
	b=j7UkyjuOYsVDzUk1uB51rFUEnPLMV7oqQWomTyMpgiQ8+mGYqqmzegkbyQRdUyedlS5Q
	 Kj5mDuZYg14x/UCOAyKwS2/c75eLdcJMS6Rg3qaDYpRTUXz0ZLM7861Ehu19EeuiXJ2jO
	 Nc4bV7ZreQDLpoDq1PXIGtlyM3M5ZAvgxxXGd4VJ1A6XGTuU1G4Y2aKoWcQmM9eYAP3Hb
	 ErmxbZ7kFLleQeqlsD1d5jlmd0Eakg68AI19f7StXqMD1UoyHEmDPolbaKSbLRuiwessa
	 NCqXjRllXTSZwnB1G0teqbCCglYMEOAX9u1yTB4Ns0cDLMHtXFY8OHpyV7ChC4hlV5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBsAlMcG;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446E3606A32A
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 13:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBsAlMcG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795266427; x=1826802427;
  h=date:from:to:cc:subject:message-id;
  bh=HWmOZOL5yaMZFqFYHKiDQ8aAnbZjE5VJ/Tyif/1Yn3Y=;
  b=cBsAlMcGgWm1wwaqz6+GA3j9YZ6cyqFv9Ncg6u/OJxkTBbqGF2aITDgK
   WIXgOULLr1A0s59FLLRc4nlPGGDiu/VyON23rDSX8jlJuMHKdc9PFlqMh
   Ljbac0qkCjBqQ51qD4ez1YVpxY7vp/eO4NDjgq6arRdW0cD6ZYbJJ7rs4
   ZCQdYxpCFfqDiFdxcl+DDMsyfegTGjHEfE0SazFN5tcG9nttgZ56b5582
   r3bmIZOKxVLTm2+hzj4j1lkEsmj8c5YVyprlwM/CagBXRjXZ9AqTAPlP0
   KeSXMM/SZ56JSrQfYWsNxe6pBGlQ33CL4Tcqv8N8ctypcilkB5ocusQNw
   w==;
X-CSE-ConnectionGUID: 3CdouTNSRe2gxqJbWLEQ9A==
X-CSE-MsgGUID: OigODn/vTeyeoLGMvSaXtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="3976623"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="3976623"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 05:07:07 -0800
X-CSE-ConnectionGUID: 7mTS2IFUQM290QogYsXP5w==
X-CSE-MsgGUID: XL8dsAYYTF2mwhU6hdX0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11206441"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2026 05:07:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUko3-000000004KB-1tLK;
	Sat, 21 Nov 2026 13:07:03 +0000
Date: Sat, 21 Nov 2026 14:06:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxtv-media:next 17/30] ERROR: modpost: __ex_table+0x1bc0
 references non-executable section '.rodata.cs_dsp_adsp1_power_up.str1.4'
Message-ID: <20261121140219.19SrSoJM-lkp@intel.com>
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
commit: caf83732ed1f7c034ad6571f9f079e55015017f5 [17/30] media: i2c: ov08d10: use the subdev active state
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r2101-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121140219.19SrSoJM-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121140219.19SrSoJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121140219.19SrSoJM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: do_trap_load_fault+0xb8 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_load_fault+0x210 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_store_fault+0xb8 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_store_fault+0x210 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_s+0xb8 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_s+0x210 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_m+0xb8 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_m+0x210 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_break+0xa4 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_break+0x1fc (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_u+0x208 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_ecall_u+0x2c0 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_software_check+0x84 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_software_check+0x1dc (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lockdep_hardirqs_on+0x48 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lockdep_hardirqs_on+0x124 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lockdep_hardirqs_on+0x188 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lockdep_hardirqs_off+0x18 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lockdep_hardirqs_off+0x50 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: look_up_lock_class+0x20 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: look_up_lock_class+0xb8 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: match_held_lock+0xd8 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: check_flags+0x84 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: check_flags+0x114 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: check_flags+0x18c (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: check_flags+0x1d8 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lock_is_held_type+0x58 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lock_is_held_type+0x140 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_exit+0x54 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_exit+0x24c (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irqentry_exit+0x300 (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ct_irq_enter+0x2c (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ct_irq_exit+0x2c (section: .noinstr.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ret_from_fork_kernel+0x194 (section: .text.ret_from_fork_kernel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ret_from_fork_kernel+0x2e0 (section: .text.ret_from_fork_kernel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ret_from_fork_user+0x184 (section: .text.ret_from_fork_user) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ret_from_fork_user+0x2d0 (section: .text.ret_from_fork_user) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: __ex_table) -> 0x0 (section: .rodata.bpf_iter_cgroup_show_fdinfo.str1.4)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.rodata.bpf_iter_cgroup_show_fdinfo.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b0 (section: __ex_table) -> cgroup_iter_seq_info (section: .rodata.cgroup_iter_seq_info)
ERROR: modpost: __ex_table+0x19b0 references non-executable section '.rodata.cgroup_iter_seq_info'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> bpf_get_stackid_proto (section: .rodata.bpf_get_stackid_proto)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.rodata.bpf_get_stackid_proto'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> bpf_get_stackid_proto (section: .rodata.bpf_get_stackid_proto)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.rodata.bpf_get_stackid_proto'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> bpf_get_stackid_proto (section: .rodata.bpf_get_stackid_proto)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.rodata.bpf_get_stackid_proto'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19ec (section: __ex_table) -> print_fmt_fsverity_merkle_hit (section: .data.print_fmt_fsverity_merkle_hit)
ERROR: modpost: __ex_table+0x19ec references non-executable section '.data.print_fmt_fsverity_merkle_hit'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> print_fmt_fsverity_tree_done (section: .data.print_fmt_fsverity_tree_done)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.data.print_fmt_fsverity_tree_done'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> c2u_BA (section: .rodata.c2u_BA)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.rodata.c2u_BA'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> c2u_B8 (section: .rodata.c2u_B8)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.rodata.c2u_B8'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> fw_cfg_fname_kset (section: .sbss.fw_cfg_fname_kset)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.sbss.fw_cfg_fname_kset'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> __param_str_ioport (section: .rodata.__param_str_ioport)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.rodata.__param_str_ioport'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> fw_cfg_sysfs_attr_raw (section: .rodata.fw_cfg_sysfs_attr_raw)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.rodata.fw_cfg_sysfs_attr_raw'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> __param_str_ioport (section: .rodata.__param_str_ioport)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.rodata.__param_str_ioport'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a1c (section: __ex_table) -> fw_cfg_sysfs_entry_groups (section: .sdata.fw_cfg_sysfs_entry_groups)
ERROR: modpost: __ex_table+0x1a1c references non-executable section '.sdata.fw_cfg_sysfs_entry_groups'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> fw_cfg_sysfs_entry_attrs (section: .data.fw_cfg_sysfs_entry_attrs)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.data.fw_cfg_sysfs_entry_attrs'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> fw_cfg_sysfs_attr_key (section: .data.fw_cfg_sysfs_attr_key)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.data.fw_cfg_sysfs_attr_key'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: __ex_table) -> fw_cfg_cache_lock (section: .data.fw_cfg_cache_lock)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.data.fw_cfg_cache_lock'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> fw_cfg_rev_attr (section: .rodata.fw_cfg_rev_attr)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.rodata.fw_cfg_rev_attr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> fw_cfg_reg_data (section: .sbss.fw_cfg_reg_data)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.sbss.fw_cfg_reg_data'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> fw_cfg_dev_base (section: .sbss.fw_cfg_dev_base)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.sbss.fw_cfg_dev_base'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: __ex_table) -> fw_cfg_p_base (section: .sbss.fw_cfg_p_base)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.sbss.fw_cfg_p_base'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: __ex_table) -> fw_cfg_rev (section: .sbss.fw_cfg_rev)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.sbss.fw_cfg_rev'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a64 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_coeff_base_reg.str1.4)
ERROR: modpost: __ex_table+0x1a64 references non-executable section '.rodata.cs_dsp_coeff_base_reg.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_debugfs_read_controls_show.str1.4)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.rodata.cs_dsp_debugfs_read_controls_show.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a7c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_debugfs_string_read.str1.4)
ERROR: modpost: __ex_table+0x1a7c references non-executable section '.rodata.cs_dsp_debugfs_string_read.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a80 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_debugfs_read_controls_show.str1.4)
ERROR: modpost: __ex_table+0x1a80 references non-executable section '.rodata.cs_dsp_debugfs_read_controls_show.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_region_to_reg.str1.4)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.rodata.cs_dsp_region_to_reg.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_read_algs.str1.4)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.rodata.cs_dsp_read_algs.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ae8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_set_dspclk.str1.4)
ERROR: modpost: __ex_table+0x1ae8 references non-executable section '.rodata.cs_dsp_set_dspclk.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp2_init.str1.4)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.rodata.cs_dsp_adsp2_init.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b30 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_coeff_read_ctrl_raw.str1.4)
ERROR: modpost: __ex_table+0x1b30 references non-executable section '.rodata.cs_dsp_coeff_read_ctrl_raw.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc0 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp1_power_up.str1.4)
>> ERROR: modpost: __ex_table+0x1bc0 references non-executable section '.rodata.cs_dsp_adsp1_power_up.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> types (section: .rodata.types.0)
ERROR: modpost: __ex_table+0x1bcc references non-executable section '.rodata.types.0'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd8 (section: __ex_table) -> cs_dsp_debugfs_fops (section: .rodata.cs_dsp_debugfs_fops)
ERROR: modpost: __ex_table+0x1bd8 references non-executable section '.rodata.cs_dsp_debugfs_fops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> cs_dsp_halo_ops (section: .rodata.cs_dsp_halo_ops)
>> ERROR: modpost: __ex_table+0x1bdc references non-executable section '.rodata.cs_dsp_halo_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be4 (section: __ex_table) -> cs_dsp_adsp1_ops (section: .rodata.cs_dsp_adsp1_ops)
ERROR: modpost: __ex_table+0x1be4 references non-executable section '.rodata.cs_dsp_adsp1_ops'
WARNING: modpost: vmlinux: section mismatch in reference: __riscv_sys_rt_sigreturn+0xf8 (section: .text.__riscv_sys_rt_sigreturn) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dump_instr+0xec (section: .text.dump_instr) -> .LBE118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_permit_entry.isra.0+0x6c (section: .text.ptrace_report_syscall_permit_entry.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap+0x38 (section: .text.do_trap) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_misaligned+0x1f4 (section: .text.do_trap_misaligned) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_misaligned+0x418 (section: .text.do_trap_misaligned) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: arch_setup_additional_pages+0x1fc (section: .text.arch_setup_additional_pages) -> .L89 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_system_suspend+0x7c (section: .text.sbi_system_suspend) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_suspend_finisher+0x7c (section: .text.sbi_suspend_finisher) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: riscv_sbi_hart_suspend+0xa0 (section: .text.riscv_sbi_hart_suspend) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_console_putchar+0x5c (section: .text.sbi_console_putchar) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_console_getchar+0x54 (section: .text.sbi_console_getchar) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_shutdown+0x50 (section: .text.sbi_shutdown) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_probe_extension+0x60 (section: .text.sbi_probe_extension) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_set_timer_v01+0x68 (section: .text.__sbi_set_timer_v01) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_set_timer_v02+0x70 (section: .text.__sbi_set_timer_v02) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_send_ipi_v02+0x74 (section: .text.__sbi_send_ipi_v02) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_rfence_v01+0x13c (section: .text.__sbi_rfence_v01) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_rfence_v01+0x1c4 (section: .text.__sbi_rfence_v01) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_rfence_v01+0x254 (section: .text.__sbi_rfence_v01) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_rfence_v02_call.isra.0+0xbc (section: .text.__sbi_rfence_v02_call.isra.0) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_rfence_v02_call.isra.0+0x248 (section: .text.__sbi_rfence_v02_call.isra.0) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_rfence_v02_call.isra.0+0x2b8 (section: .text.__sbi_rfence_v02_call.isra.0) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_send_ipi_v01+0x108 (section: .text.__sbi_send_ipi_v01) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_srst_power_off+0x60 (section: .text.sbi_srst_power_off) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_fwft_set+0xc4 (section: .text.sbi_fwft_set) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_debug_console_write+0x190 (section: .text.sbi_debug_console_write) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sbi_debug_console_read+0x190 (section: .text.sbi_debug_console_read) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_sbi_return+0x34 (section: .text.__traceiter_sbi_return) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_sbi_return+0x2c (section: .text.trace_sbi_return) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_sbi_return+0x2c (section: .text.do_trace_sbi_return) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __sbi_base_ecall+0x5c (section: .text.__sbi_base_ecall) -> .L82 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: show_pte+0x1bc (section: .text.show_pte) -> __setup_dma_debug_entries_cmdline (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: __set_memory+0x18c (section: .text.__set_memory) -> .L89 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_jit_free+0x188 (section: .text.bpf_jit_free) -> .LBE89 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sighand_ctor+0x38 (section: .text.sighand_ctor) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_signal+0xe8 (section: .text.copy_signal) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_signal+0x154 (section: .text.copy_signal) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mm_init+0x138 (section: .text.mm_init) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mm_init+0x158 (section: .text.mm_init) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_sighand+0xbc (section: .text.copy_sighand) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_event_pid+0x34 (section: .text.ptrace_event_pid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_event_pid+0x348 (section: .text.ptrace_event_pid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_mm_exe_file+0x20 (section: .text.get_mm_exe_file) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: replace_mm_exe_file+0x3a4 (section: .text.replace_mm_exe_file) -> .L89 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __cleanup_sighand+0x50 (section: .text.__cleanup_sighand) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pidfd_prepare+0xd0 (section: .text.pidfd_prepare) -> .L84 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x5ac (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x8fc (section: .text.copy_process) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x92c (section: .text.copy_process) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x954 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xa48 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xac4 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xe44 (section: .text.copy_process) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xea8 (section: .text.copy_process) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x1120 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x1d64 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x1d78 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x1dc8 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_clone+0x3f8 (section: .text.kernel_clone) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: task_exec_state_get_dumpable+0x20 (section: .text.task_exec_state_get_dumpable) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _print_tainted+0xc4 (section: .text._print_tainted) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x274 (section: .text.vpanic) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x2a4 (section: .text.vpanic) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x31c (section: .text.vpanic) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x4a0 (section: .text.vpanic) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: oops_enter+0x28 (section: .text.oops_enter) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wait_task_continued+0xc8 (section: .text.wait_task_continued) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcuwait_wake_up+0x24 (section: .text.rcuwait_wake_up) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wait_task_stopped+0x184 (section: .text.wait_task_stopped) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: release_task+0x50 (section: .text.release_task) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wait_task_zombie+0x54 (section: .text.wait_task_zombie) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_exit+0x744 (section: .text.do_exit) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: make_task_dead+0x1a4 (section: .text.make_task_dead) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _local_interrupt_save_state+0x10 (section: .text._local_interrupt_save_state) -> .LBB6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _local_interrupt_enable+0x14 (section: .text._local_interrupt_enable) -> .LBB6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __local_bh_enable+0x3c (section: .text.__local_bh_enable) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __local_bh_enable_ip+0x54 (section: .text.__local_bh_enable_ip) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irq_enter_rcu+0x68 (section: .text.irq_enter_rcu) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __raise_softirq_irqoff+0x34 (section: .text.__raise_softirq_irqoff) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resource_list_create_entry+0x34 (section: .text.resource_list_create_entry) -> .LBE6036 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptracer_capable+0x2c (section: .text.ptracer_capable) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __ptrace_may_access+0x88 (section: .text.__ptrace_may_access) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __ptrace_may_access+0x318 (section: .text.__ptrace_may_access) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptracer_access_allowed+0x28 (section: .text.ptracer_access_allowed) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_attach+0xc0 (section: .text.ptrace_attach) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: alloc_uid+0xf0 (section: .text.alloc_uid) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sig_get_ucounts+0x38 (section: .text.sig_get_ucounts) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sig_get_ucounts+0x118 (section: .text.sig_get_ucounts) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dequeue_signal+0xa0 (section: .text.dequeue_signal) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dequeue_signal+0xd4 (section: .text.dequeue_signal) -> trace_init_flags_sys_exit (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __send_signal_locked+0x3ac (section: .text.__send_signal_locked) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __send_signal_locked+0x48c (section: .text.__send_signal_locked) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lock_task_sighand+0x30 (section: .text.lock_task_sighand) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kill_pid_usb_asyncio+0x98 (section: .text.kill_pid_usb_asyncio) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lockdep_assert_task_sighand_held+0x20 (section: .text.lockdep_assert_task_sighand_held) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_notify_parent+0x180 (section: .text.do_notify_parent) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_notify_parent+0x284 (section: .text.do_notify_parent) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
