Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E241DEDC
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jul 2026 18:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361119; cv=none; b=TgVxStmQXj0FdGHVD/zk6Phn4bPGVTTVFyul7v/SZ25evoz4VXEjHSYOtn5ULRAqeWl3+s/0sPrYZbbhWhapgwfb348tPlau7R4Z4WqLZZMPZ4fZmRpPEC9o2+Ukn4ZTXncWKzO8ZF1xHlCjDuXxm53/92YOp4Q3CTv2OVHFsi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361119; c=relaxed/simple;
	bh=yRrLrCemV++HbbM8nzuIoi2Z5qE0ZbpVVm4mvYBmdTk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jW+jIkSLPL2DS3mFzj7a4aEbrsughWJkzj1BxLchDUsxhZb8oUQvE4VphWWe+CGDLStLhbHV9PwBF2aPn/QSRBlyquY+PiN1U9d3Z5S7rEdDammdLy10oOVym8IPpQ2DDz7TDTsGqYON5mExUvXhWYjRVfXBibuuiC1J+b1JJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYQJrw8L; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYQJrw8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783361118; x=1814897118;
  h=date:from:to:cc:subject:message-id;
  bh=yRrLrCemV++HbbM8nzuIoi2Z5qE0ZbpVVm4mvYBmdTk=;
  b=jYQJrw8LsHG5KWb066NBznXoDpWjWR1lq4CHMNtdbAgDUwHjb59wlaG3
   Pvu6oHefhn1Rpnjz92xLQ/oz2oeBI+AKE9LUbihqsYrVPKRJroCmYZDX2
   cmSLfyp/nqqPgYx+yacOZys+XNcVtGQ+Q/5JWipRm2NhMASHKdoQkOXVm
   j8cdl+EvE5ih1BkGWgMczGjXYHJczIkoTLKDm9geAr3+peG+Ws2Gai39o
   GPa7bOHKz430JcADFpI6soiYr/mWLoyXcn+LpSPWztIbxXaP3LqzYBxoS
   4L36eMsDV3/7MRpglGiifj2Hy1mrgV2eajGnkEv+b4quxq3uXDzNy4HUX
   w==;
X-CSE-ConnectionGUID: K8e8v6/WStOapxAj1ttoZA==
X-CSE-MsgGUID: FMPNU4AuQdyG17vLRvzP8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95515192"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="95515192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 11:05:18 -0700
X-CSE-ConnectionGUID: M1nelX4xSMiOngk/A6pyoQ==
X-CSE-MsgGUID: sHaXhQUYTeGiPYzArf9roA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="255712783"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2026 11:05:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgngv-00000000Efr-48rd;
	Mon, 06 Jul 2026 18:05:13 +0000
Date: Tue, 07 Jul 2026 02:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rdma:for-next 2/5] ERROR: modpost: __ex_table+0x2a0c
 references non-executable section '.data..once'
Message-ID: <202607070100.NkX15CVb-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Doug Ledford <dledford@redhat.com>
CC: Jason Gunthorpe <jgg+lists@ziepe.ca>
CC: linux-rdma@vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
head:   c3fd3966f7dd871e47f9bcd8fe90d6e23e4cdb1a
commit: 011199f46f44a9fd93a9e5ab5d7fd1328d80e9bf [2/5] RDMA/uverbs: Add UVERBS_ATTR_UHW to UVERBS_METHOD_REG_MR
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-002-20260706 (https://download.01.org/0day-ci/archive/20260707/202607070100.NkX15CVb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607070100.NkX15CVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607070100.NkX15CVb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x286c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2874 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2874 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2878 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2880 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2880 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2884 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x288c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x288c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2890 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2890 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2898 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2898 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x289c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x289c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28a4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28b4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28bc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28cc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28d4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28e4 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28ec (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x28fc (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x28fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2904 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2904 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2908 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2908 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2910 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2910 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2914 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2914 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x291c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x291c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2920 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2920 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2928 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2928 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x292c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x292c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2934 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2934 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2938 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2938 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2940 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2940 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2944 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2944 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x294c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x294c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2950 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2950 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2958 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2958 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x295c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x295c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2964 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2964 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2968 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2968 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2970 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2970 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2974 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2974 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x297c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x297c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2980 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2980 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2988 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x2988 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x298c (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x298c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x29f4 (section: __ex_table) -> .LJTI4_0 (section: .rodata)
ERROR: modpost: __ex_table+0x29f4 references non-executable section '.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a0c (section: __ex_table) -> phy_interface_num_ports.__already_done (section: .data..once)
>> ERROR: modpost: __ex_table+0x2a0c references non-executable section '.data..once'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a30 (section: __ex_table) -> .L.str.26 (section: .rodata.str1.1)
ERROR: modpost: __ex_table+0x2a30 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2a3c (section: __ex_table) -> $d (section: __bug_table)
ERROR: modpost: __ex_table+0x2a3c references non-executable section '__bug_table'
WARNING: modpost: vmlinux: section mismatch in reference: exit_misc_binfmt+0x1a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_script_binfmt+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_elf_binfmt+0x16 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fscache_exit+0xe (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fscache_exit+0x20 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fscache_exit+0x28 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fscache_exit+0x38 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_coda+0x64 (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ppdev_cleanup+0x40 (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: firmware_class_exit+0x1e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_ch_module+0x36 (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_mtdchar+0x20 (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ppp_cleanup+0x48 (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wwan_exit+0x32 (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fw_core_cleanup+0x26 (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uio_exit+0x44 (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mon_exit+0xf8 (section: .exit.text) -> proc_page_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mon_exit+0x106 (section: .exit.text) -> proc_page_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mon_exit+0x128 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mon_exit+0x12e (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: chaoskey_driver_exit+0xe (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: chaoskey_driver_exit+0x12 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rx8111_driver_exit+0x12 (section: .exit.text) -> init_nls_macceltic (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_rc_map_beelink_mxiii+0xe (section: .exit.text) -> init_v9fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: exit_rc_map_beelink_mxiii+0x12 (section: .exit.text) -> init_v9fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pps_exit+0x34 (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: synth_soft_exit+0xe (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: synth_soft_exit+0x12 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: comedi_cleanup+0x2e (section: .exit.text) -> phy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: raw_exit+0x3e (section: .exit.text) -> aplic_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_passive_exit+0xe (section: .exit.text) -> mscc_lan966x_serdes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cubictcp_unregister+0x12 (section: .exit.text) -> _samsung_clk_register_pll (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hstcp_unregister+0xe (section: .exit.text) -> .Lpcrel_hi3 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tcp_lp_unregister+0xe (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tcp_lp_unregister+0x12 (section: .exit.text) -> .L0  (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
