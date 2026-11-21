Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280618;
	b=XPI0wMNJmVsj65klitkVGhDq4ssRCGeGT9JHG+btrm0ayLWDFrepaxbQ6MJtp458M/S/
	 HaJxW0cU/4n9+rNV2nuBj7Dupxa0qWvHms2N0JVVo42+JB8bIrJto4CSelxUjZNgd/bZk
	 69qyhOmx6hU8abeJWjZ02WMF20xggOGLUF1LcEpFpHbPpw89IkUxabUY7EjXEg1XxsQCJ
	 KAqAn1GQSc60r7LrzuAHtmUtHK+ObqSC9OWOCAYWNvwj7tgrH4vegXwqzW+/T7/ciKEQS
	 U1ErIYAsvT2Xx8gcDn2UQrGwnFD5MywDRfLgbROVFIiXDsQYvoLzhCXcz4W5H2IBjiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280618;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QuxKU9b08Cd0KfU777aIgKXvafZRPqAVkY3cZvpqymI=;
	b=4ICIwPXdoeR8nD73Q4eMqcPI9XvwBt89ATVMd4TgwbBa6AnHwR6TyaRvCslaiKWSw1P2
	 4bSZlAScBVnVt+TGJOOD1Fgajgfbe8vaY1wP1fmtD9iLCSm2Y1g5xdaxbsj3gfG4Exghu
	 /9/is28OeVuF3BAIZblXfjiYbQOstXlLkhONiSpMMqMRj4JfhGWk6HFY6OReSpgWwLgm4
	 G393iouWT1qiHLP2ogUxbvKjVdygbnxsnmeWn1bM+S+UotT3+QirHvEsV1FUzbKYJ6Ibu
	 1hVhNaDWfkA/GAlLfgEmbaSqElbZA5hLU7HLDK6TGymo6BkTWeIE64phNUrBSVAM2/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XGC4SvNk;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C10606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 17:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C10606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XGC4SvNk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795280617; x=1826816617;
  h=date:from:to:cc:subject:message-id;
  bh=zrrl6iF2NDpFQUmJysCYoPsjwwGwqeP0hay4ihPpEGI=;
  b=XGC4SvNkdCYcU6s5VCVJ1LTevu0KfkBaLNIxXQAmJgEO1LxGlgmrxXT+
   rWgf7mqSvIjbiKLmoLp4KLEZ/agtQ54C8cdkYwCqa4SWkl5ppE5+tVgOG
   07egabsQVZ308yw0FD8etU1gBwDJvXpVkuuaO7Fr3F4v6abJnH1srknDI
   +F2IfyddWyvUH9RSTpQJgXfgQKjr7u+KvO1a5zfFQSrsxkfv+ubX9Obne
   rJKmBlPZg1f4gNY1IzRWxJSop4r05k2RZEtep2AIDLWZpIGzB0oLabWpl
   yNXVjhpGlG+MdaJwmDfqJ40nYwCwr9I+0VgEqJcxy0hVPzYPX66zefVor
   Q==;
X-CSE-ConnectionGUID: EADT6igFQ7KNd9aPzR/fmA==
X-CSE-MsgGUID: RfukDQaQSnWCWkZ0n8a8FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4024617"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4024617"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 09:03:36 -0800
X-CSE-ConnectionGUID: 4psQG7LoSfaa7K5wIV4GZQ==
X-CSE-MsgGUID: FUYbR2d6Tc2qMsBRSU2Rgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11149295"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2026 09:03:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUoUt-000000004M1-2vQe;
	Sat, 21 Nov 2026 17:03:31 +0000
Date: Sat, 21 Nov 2026 18:02:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxtv-media:next 18/30] ERROR: modpost: __ex_table+0x1bdc
 references non-executable section '.rodata.cs_dsp_mock_halo_xm_hdr'
Message-ID: <20261121175317.weF3ZQ1N-lkp@intel.com>
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
commit: 9cf94e19758a592c94780dccbfa494e240cfc4ef [18/30] media: i2c: ov08d10: drop the cached current mode
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r2101-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121175317.weF3ZQ1N-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121175317.weF3ZQ1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121175317.weF3ZQ1N-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

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
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> bpf_get_stack_proto_pe (section: .rodata.bpf_get_stack_proto_pe)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.rodata.bpf_get_stack_proto_pe'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19b4 (section: __ex_table) -> 0x0 (section: .rodata.bpf_cgrp_storage_free.str1.4)
ERROR: modpost: __ex_table+0x19b4 references non-executable section '.rodata.bpf_cgrp_storage_free.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c0 (section: __ex_table) -> 0x0 (section: .rodata.bpf_cgrp_storage_free.str1.4)
ERROR: modpost: __ex_table+0x19c0 references non-executable section '.rodata.bpf_cgrp_storage_free.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> 0x0 (section: .rodata.bpf_cgrp_storage_free.str1.4)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.rodata.bpf_cgrp_storage_free.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> __SCK__tp_func_fsverity_verify_data_block (section: .sdata.__SCK__tp_func_fsverity_verify_data_block)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.sdata.__SCK__tp_func_fsverity_verify_data_block'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> rs (section: .data.rs.1)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.data.rs.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19e4 (section: __ex_table) -> event_fsverity_enable (section: .data.event_fsverity_enable)
ERROR: modpost: __ex_table+0x19e4 references non-executable section '.data.event_fsverity_enable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f0 (section: __ex_table) -> bpf_fsverity_set (section: .rodata.bpf_fsverity_set)
ERROR: modpost: __ex_table+0x19f0 references non-executable section '.rodata.bpf_fsverity_set'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19f8 (section: __ex_table) -> c2u_85 (section: .rodata.c2u_85)
ERROR: modpost: __ex_table+0x19f8 references non-executable section '.rodata.c2u_85'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19fc (section: __ex_table) -> c2u_C9 (section: .rodata.c2u_C9)
ERROR: modpost: __ex_table+0x19fc references non-executable section '.rodata.c2u_C9'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a04 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_init_debugfs.str1.4)
ERROR: modpost: __ex_table+0x1a04 references non-executable section '.rodata.cs_dsp_init_debugfs.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a08 (section: __ex_table) -> fw_cfg_rev (section: .sbss.fw_cfg_rev)
ERROR: modpost: __ex_table+0x1a08 references non-executable section '.sbss.fw_cfg_rev'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a10 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_coeff_base_reg.str1.4)
ERROR: modpost: __ex_table+0x1a10 references non-executable section '.rodata.cs_dsp_coeff_base_reg.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a14 (section: __ex_table) -> fw_cfg_rev (section: .sbss.fw_cfg_rev)
ERROR: modpost: __ex_table+0x1a14 references non-executable section '.sbss.fw_cfg_rev'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a20 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_debugfs_read_controls_show.str1.4)
ERROR: modpost: __ex_table+0x1a20 references non-executable section '.rodata.cs_dsp_debugfs_read_controls_show.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_debugfs_string_read.str1.4)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.rodata.cs_dsp_debugfs_string_read.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_validate_version.str1.4)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.rodata.cs_dsp_validate_version.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_halo_wdt_expire.str1.4)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.rodata.cs_dsp_halo_wdt_expire.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_find_alg_region.str1.4)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.rodata.cs_dsp_find_alg_region.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a58 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_coeff_write_ctrl_raw.str1.4)
ERROR: modpost: __ex_table+0x1a58 references non-executable section '.rodata.cs_dsp_coeff_write_ctrl_raw.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab0 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_halo_bus_error.str1.4)
ERROR: modpost: __ex_table+0x1ab0 references non-executable section '.rodata.cs_dsp_halo_bus_error.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_hibernate.str1.4)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.rodata.cs_dsp_hibernate.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_run.str1.4)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.rodata.cs_dsp_run.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_coeff_write_acked_control.str1.4)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.rodata.cs_dsp_coeff_write_acked_control.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_run.str1.4)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.rodata.cs_dsp_run.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1adc (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_coeff_read_ctrl_raw.str1.4)
ERROR: modpost: __ex_table+0x1adc references non-executable section '.rodata.cs_dsp_coeff_read_ctrl_raw.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aec (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_load_coeff.str1.4)
ERROR: modpost: __ex_table+0x1aec references non-executable section '.rodata.cs_dsp_load_coeff.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1af4 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_stop.str1.4)
ERROR: modpost: __ex_table+0x1af4 references non-executable section '.rodata.cs_dsp_stop.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b04 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_halo_setup_algs.str1.4)
ERROR: modpost: __ex_table+0x1b04 references non-executable section '.rodata.cs_dsp_halo_setup_algs.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b0c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_create_control.str1.4)
ERROR: modpost: __ex_table+0x1b0c references non-executable section '.rodata.cs_dsp_create_control.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b10 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp1_setup_algs.str1.4)
ERROR: modpost: __ex_table+0x1b10 references non-executable section '.rodata.cs_dsp_adsp1_setup_algs.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b18 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp2_setup_algs.str1.4)
ERROR: modpost: __ex_table+0x1b18 references non-executable section '.rodata.cs_dsp_adsp2_setup_algs.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b4c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_adsp2_bus_error.str1.4)
ERROR: modpost: __ex_table+0x1b4c references non-executable section '.rodata.cs_dsp_adsp2_bus_error.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b54 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_parse_coeff.str1.4)
ERROR: modpost: __ex_table+0x1b54 references non-executable section '.rodata.cs_dsp_parse_coeff.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b58 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_load.str1.4)
ERROR: modpost: __ex_table+0x1b58 references non-executable section '.rodata.cs_dsp_load.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b6c (section: __ex_table) -> types (section: .rodata.types.0)
ERROR: modpost: __ex_table+0x1b6c references non-executable section '.rodata.types.0'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b78 (section: __ex_table) -> cs_dsp_debugfs_fops (section: .rodata.cs_dsp_debugfs_fops)
ERROR: modpost: __ex_table+0x1b78 references non-executable section '.rodata.cs_dsp_debugfs_fops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b7c (section: __ex_table) -> cs_dsp_halo_ops (section: .rodata.cs_dsp_halo_ops)
ERROR: modpost: __ex_table+0x1b7c references non-executable section '.rodata.cs_dsp_halo_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b84 (section: __ex_table) -> cs_dsp_adsp1_ops (section: .rodata.cs_dsp_adsp1_ops)
ERROR: modpost: __ex_table+0x1b84 references non-executable section '.rodata.cs_dsp_adsp1_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b88 (section: __ex_table) -> cs_dsp_halo_ops (section: .rodata.cs_dsp_halo_ops)
ERROR: modpost: __ex_table+0x1b88 references non-executable section '.rodata.cs_dsp_halo_ops'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1b9c (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_mock_base_addr_for_mem.str1.4)
ERROR: modpost: __ex_table+0x1b9c references non-executable section '.rodata.cs_dsp_mock_base_addr_for_mem.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ba0 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_load.str1.4)
ERROR: modpost: __ex_table+0x1ba0 references non-executable section '.rodata.cs_dsp_load.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bc4 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_load.str1.4)
ERROR: modpost: __ex_table+0x1bc4 references non-executable section '.rodata.cs_dsp_load.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd0 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_load.str1.4)
ERROR: modpost: __ex_table+0x1bd0 references non-executable section '.rodata.cs_dsp_load.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> cs_dsp_mock_halo_xm_hdr (section: .rodata.cs_dsp_mock_halo_xm_hdr)
>> ERROR: modpost: __ex_table+0x1bdc references non-executable section '.rodata.cs_dsp_mock_halo_xm_hdr'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be4 (section: __ex_table) -> cs_dsp_mock_adsp2_16bit_dsp1_regions (section: .rodata.cs_dsp_mock_adsp2_16bit_dsp1_regions)
ERROR: modpost: __ex_table+0x1be4 references non-executable section '.rodata.cs_dsp_mock_adsp2_16bit_dsp1_regions'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be8 (section: __ex_table) -> 0x0 (section: .rodata.cs_dsp_load.str1.4)
ERROR: modpost: __ex_table+0x1be8 references non-executable section '.rodata.cs_dsp_load.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_report_syscall_permit_entry.isra.0+0x6c (section: .text.ptrace_report_syscall_permit_entry.isra.0) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_misaligned+0x1f4 (section: .text.do_trap_misaligned) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trap_misaligned+0x418 (section: .text.do_trap_misaligned) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kgdb_riscv_notify+0x94 (section: .text.kgdb_riscv_notify) -> .LBB91 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handle_page_fault+0xd4 (section: .text.handle_page_fault) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bpf_jit_free+0x188 (section: .text.bpf_jit_free) -> .LBE129 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sighand_ctor+0x38 (section: .text.sighand_ctor) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_signal+0xe8 (section: .text.copy_signal) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_signal+0x154 (section: .text.copy_signal) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mm_init+0x138 (section: .text.mm_init) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mm_init+0x158 (section: .text.mm_init) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_sighand+0xbc (section: .text.copy_sighand) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_event_pid+0x348 (section: .text.ptrace_event_pid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __cleanup_sighand+0x50 (section: .text.__cleanup_sighand) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x5ac (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x8fc (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x92c (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x954 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xa48 (section: .text.copy_process) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xe44 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0xea8 (section: .text.copy_process) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_process+0x130c (section: .text.copy_process) -> early_coherent_pool (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_clone+0x22c (section: .text.kernel_clone) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _print_tainted+0xc4 (section: .text._print_tainted) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x274 (section: .text.vpanic) -> dma_contiguous_reserve (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x2a4 (section: .text.vpanic) -> dma_contiguous_reserve (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vpanic+0x31c (section: .text.vpanic) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_taint+0xe4 (section: .text.add_taint) -> .LBE460 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_taint+0x104 (section: .text.add_taint) -> .LBE460 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: oops_enter+0x28 (section: .text.oops_enter) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_irq_handler_entry+0x14 (section: .text.__traceiter_irq_handler_entry) -> .LBB6033 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __local_bh_enable+0x3c (section: .text.__local_bh_enable) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __local_bh_enable_ip+0x54 (section: .text.__local_bh_enable_ip) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irq_enter_rcu+0x68 (section: .text.irq_enter_rcu) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __raise_softirq_irqoff+0x34 (section: .text.__raise_softirq_irqoff) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_request_resource+0xb8 (section: .text.devm_request_resource) -> .LBB119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __devm_request_region+0xc4 (section: .text.__devm_request_region) -> .LBB119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ptrace_attach+0xc0 (section: .text.ptrace_attach) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: alloc_uid+0xf0 (section: .text.alloc_uid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_signals+0x1b0 (section: .text.exit_signals) -> trace_init_flags_sys_enter (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_newuname+0x38 (section: .text.__do_sys_newuname) -> map_benchmark_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_sys_newuname+0x60 (section: .text.__do_sys_newuname) -> map_benchmark_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_sethostname+0x7c (section: .text.___se_sys_sethostname) -> map_benchmark_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_sethostname+0xc4 (section: .text.___se_sys_sethostname) -> map_benchmark_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_setdomainname+0x7c (section: .text.___se_sys_setdomainname) -> map_benchmark_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___se_sys_setdomainname+0xc4 (section: .text.___se_sys_setdomainname) -> map_benchmark_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_worker_pool+0x48 (section: .text.init_worker_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_worker_pool+0x174 (section: .text.init_worker_pool) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __queue_work+0xe0 (section: .text.__queue_work) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: workqueue_sysfs_register+0xa4 (section: .text.workqueue_sysfs_register) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __alloc_workqueue+0x580 (section: .text.__alloc_workqueue) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __alloc_workqueue+0x6dc (section: .text.__alloc_workqueue) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: alloc_pid+0xd8 (section: .text.alloc_pid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: alloc_pid+0x42c (section: .text.alloc_pid) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: alloc_pid+0x674 (section: .text.alloc_pid) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: alloc_pid+0x730 (section: .text.alloc_pid) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: alloc_pid+0x828 (section: .text.alloc_pid) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __kthread_init_worker+0x5c (section: .text.__kthread_init_worker) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kthread_create_worker_on_cpu+0x40 (section: .text.kthread_create_worker_on_cpu) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: switch_cred_namespaces+0x3c (section: .text.switch_cred_namespaces) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_cred_namespaces+0x38 (section: .text.get_cred_namespaces) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_blocking_notifier_chain_register+0x118 (section: .text.devm_blocking_notifier_chain_register) -> .LBB119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_atomic_notifier_chain_register+0xe8 (section: .text.devm_atomic_notifier_chain_register) -> .LBB119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devm_register_reboot_notifier+0x98 (section: .text.devm_register_reboot_notifier) -> .LBB119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __hw_protection_trigger+0xf4 (section: .text.__hw_protection_trigger) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_restart+0x78 (section: .text.kernel_restart) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_halt+0x5c (section: .text.kernel_halt) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kernel_power_off+0x70 (section: .text.kernel_power_off) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kallsyms_show_value+0x24 (section: .text.kallsyms_show_value) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kallsyms_show_value+0x48 (section: .text.kallsyms_show_value) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_sched_wakeup+0x14 (section: .text.__traceiter_sched_wakeup) -> .LBB463 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: schedule+0x10c (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _mutex_trylock_nest_lock+0x40 (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mutex_unlock_slowpath+0x64 (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mutex_unlock_slowpath+0xa4 (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ww_mutex_unlock+0x3c (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mutex_lock_io_nested+0xac (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mutex_lock+0x90 (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read+0x1bc (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read_interruptible+0x1d4 (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: down_read_killable+0x1d4 (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rt_mutex_init+0x4c (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_unlock+0x6c (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rt_mutex_futex_unlock+0x5c (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_init_proxy_locked+0x34 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_proxy_unlock+0x30 (section: .sched.text) -> $xrv32i2p1_m2p0_a2p1_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_sched_wakeup+0x14 (section: .text.trace_sched_wakeup) -> .LBB463 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: migration_cpu_stop+0x2b4 (section: .text.migration_cpu_stop) -> .LBB471 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt_mutex_post_schedule+0x34 (section: .text.rt_mutex_post_schedule) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: double_rq_lock+0x3c (section: .text.double_rq_lock) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: find_new_ilb+0x2c (section: .text.find_new_ilb) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_se+0x12c (section: .text.update_se) -> dma_contiguous_reserve_area (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: select_idle_sibling+0xa8 (section: .text.select_idle_sibling) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_cfs_bandwidth+0x34 (section: .text.init_cfs_bandwidth) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_curr+0x128 (section: .text.update_curr) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sched_balance_newidle+0x420 (section: .text.sched_balance_newidle) -> timers_init (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
