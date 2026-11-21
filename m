Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286750;
	b=u77krVQoceL2jps5wyrWLqeUpxIuJcaDP9hsiqwswkyE62/IrP+L+y6wDVQ5ewI4sQ7R
	 GBtoxlga/yKBPB+eesTaOyLrlnRzdeduZwNlUtwYmyifTknU76NP0PVE7gJ/e8V1gxGFf
	 NgB5IbhEr0phbPDi21qo87A1ue37SsPgUVvEarDj/yTtSRcfJ+95p6eqrZ4CY4eM6ljjy
	 6aVKmt17rX52n0PKNZpkkn7Zt9GPAY/7O53Vsq6577sjrEeZZc8hLzFr0OqxMSl+RDyLR
	 qUlBN0Mc92YBk1/qAzaxpgSsFOL+4djODPp+13fMh750cTmYZwclk5y/V9xFqQ00Nrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286750;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mTCJ7Db3/W5/ULpxOXEjUL/ziSOuxQwOx4RM4pg0ke4=;
	b=1IKcSJ9zn986scjQeyjzy9gWHrWL2Qc1holLYrp4wlWF9SbtJ+1pq3h7wgVkaY7KS04X
	 M7toid2bcKRWUb4F+dCAOb63GQreU8bg6r7Anvn7p1v1XUJrFGRZcmL/gk8fYtNQYCX0j
	 yh9MOMGnhoaLVYwtnfvkf6+4JH/M1x8HYhdTPGgRee8ABGKcZKTGQusJYHJhXKGTqeojJ
	 vTZaZHWoof4SA2NxHsMSrg5wB4ov9lzZJDtrvt2HRMv7S33wBoBxyden/n03ytNGTIX6Q
	 ZQE6aWudhguiTYAAlAQJhml9L129zVYPoStYySQrZ5yPfqqrRCDB/ddCQyOZQCTrhKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=De5PLDiX;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5DE606A331
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 18:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5DE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=De5PLDiX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795286750; x=1826822750;
  h=date:from:to:cc:subject:message-id;
  bh=CBtPnsuW4C/Ioj7659N3Ni/rLumiI9Jk/kCxofhDlGA=;
  b=De5PLDiXdiYA+iiJNhAKG3QE1K3rQgic+PiKeuakoEmcw9C871c0w/bn
   YBlrZroRcsKPmdcfnYYhFva4J1CxJk0KZFGJjc2ARR9k3jg7U5es5COhJ
   4IBzy4cahDniYBdqCIKayqhZvfLvSCT/h8/ycB/95LOVp/5nURl7uQwJY
   9FIbBLgRKixXcJyWktzXQzuRKH5/gD8ce9ggsUmV2To99xW01ltOnTN7q
   ga/kCFyzadReTs0yPqLe+UkjRQpb+tF0pQCRHjRqV16WKbMu7SCvIduH+
   sfsTp4JVBLhA5lt/rBMS/QlCnHgUVVDEb6lTjozHALtXGgxPVB0BHDVJC
   A==;
X-CSE-ConnectionGUID: jAnfDm6KSTakPya7eRNJ4w==
X-CSE-MsgGUID: oEsbxSk4Qva2rCYiJ1BfHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4149745"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4149745"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 10:45:49 -0800
X-CSE-ConnectionGUID: C5g7nuRmTjq23AYUcFA//A==
X-CSE-MsgGUID: VZkZKPZYTaaODjTorA/cfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10884118"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Nov 2026 10:45:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUq5p-000000004N3-1bOE;
	Sat, 21 Nov 2026 18:45:45 +0000
Date: Sat, 21 Nov 2026 19:44:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nbd168-wireless:pr/17 15/16] ERROR: modpost:
 __ex_table+0x2460 references non-executable section '__param'
Message-ID: <20261121193455.MLYuFAOP-lkp@intel.com>
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
TO: Sean Wang <sean.wang@mediatek.com>

tree:   https://github.com/nbd168/wireless pr/17
head:   c8d091c695d80830c1f2062d9aba97b3bce40732
commit: c3cad28ee4f498e2ae457703dc12c12ead7e955b [15/16] Bluetooth: btusb: mediatek: load the firmware before the USB reset on MT7925
:::::: branch date: 14 hours ago
:::::: commit date: 21 hours ago
config: riscv-randconfig-2003-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121193455.MLYuFAOP-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121193455.MLYuFAOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121193455.MLYuFAOP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: macally_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: magicmouse_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mf_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ms_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mr_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nti_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ortek_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pl_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pl_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: picolcd_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ps_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: px_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pxrc_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: razer_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rmi_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: semitek_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: steam_controller_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sp_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ga_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tivo_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ts_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hidled_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xiaomi_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xinmo_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: zp_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: viewsonic_driver_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wiimote_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bcma_modexit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: loopback_exit+0x10 (section: .exit.text) -> kcmp_cookies_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: idt_pci_driver_exit+0x20 (section: .exit.text) -> kcmp_cookies_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pp_exit+0x20 (section: .exit.text) -> kcmp_cookies_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tool_exit+0x20 (section: .exit.text) -> kcmp_cookies_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nhi_unload+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvmem_exit+0x8 (section: .exit.text) -> .LBB2967 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dpll_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fou_fini+0x34 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: udp_tunnel_nic_cleanup_module+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: inet_diag_exit+0x40 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: can_exit+0x52 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bcm_module_exit+0x38 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_exit+0x42 (section: .exit.text) -> kcmp_cookies_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rfcomm_exit+0x14 (section: .exit.text) -> kcmp_cookies_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rfcomm_cleanup_sockets+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rfcomm_cleanup_sockets+0x28 (section: .exit.text) -> kcmp_cookies_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hidp_cleanup_sockets+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: af_rxrpc_exit+0xf6 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rxperf_exit+0x62 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atm_exit+0x10 (section: .exit.text) -> rcu_torture_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vlan_cleanup_module+0x3a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sctp_exit+0xda (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sctp_exit+0xea (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_exit+0x58 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nhc_dest_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nhc_fragment_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nhc_mobility_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ghc_icmpv6_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ghc_ext_route_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_exit+0x4a (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: psample_module_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netlink_exit+0x10 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handshake_exit+0x20 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handshake_exit+0x30 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x23c8 (section: __ex_table) -> .LASF14 (section: .debug_str)
ERROR: modpost: __ex_table+0x23c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d0 (section: __ex_table) -> .LASF370 (section: .debug_str)
ERROR: modpost: __ex_table+0x23d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23d4 (section: __ex_table) -> .LASF27 (section: .debug_str)
ERROR: modpost: __ex_table+0x23d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23dc (section: __ex_table) -> .LASF373 (section: .debug_str)
ERROR: modpost: __ex_table+0x23dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x23e0 (section: __ex_table) -> .LASF39 (section: .debug_str)
ERROR: modpost: __ex_table+0x23e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2410 (section: __ex_table) -> .LASF112 (section: .debug_str)
ERROR: modpost: __ex_table+0x2410 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2418 (section: __ex_table) -> .LASF374 (section: .debug_str)
ERROR: modpost: __ex_table+0x2418 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x241c (section: __ex_table) -> .LASF389 (section: .debug_str)
ERROR: modpost: __ex_table+0x241c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2424 (section: __ex_table) -> .LASF1020 (section: .debug_str)
ERROR: modpost: __ex_table+0x2424 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2428 (section: __ex_table) -> .LASF389 (section: .debug_str)
ERROR: modpost: __ex_table+0x2428 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2430 (section: __ex_table) -> __UNIQUE_ID_modinfo_532 (section: .modinfo)
ERROR: modpost: __ex_table+0x2430 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2434 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2434 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x243c (section: __ex_table) -> __UNIQUE_ID_modinfo_528 (section: .modinfo)
ERROR: modpost: __ex_table+0x243c references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2440 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2440 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2448 (section: __ex_table) -> __UNIQUE_ID_modinfo_525 (section: .modinfo)
ERROR: modpost: __ex_table+0x2448 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x244c (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x244c references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2454 (section: __ex_table) -> __UNIQUE_ID_modinfo_522 (section: .modinfo)
ERROR: modpost: __ex_table+0x2454 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2458 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2458 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2460 (section: __ex_table) -> __param_test_srcu_lockdep (section: __param)
>> ERROR: modpost: __ex_table+0x2460 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2464 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2464 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x246c (section: __ex_table) -> __param_test_boost_interval (section: __param)
ERROR: modpost: __ex_table+0x246c references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2470 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2470 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2478 (section: __ex_table) -> __param_test_boost (section: __param)
ERROR: modpost: __ex_table+0x2478 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x247c (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x247c references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2484 (section: __ex_table) -> __param_stall_only (section: __param)
ERROR: modpost: __ex_table+0x2484 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2488 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2488 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2490 (section: __ex_table) -> __param_stall_cpu_block (section: __param)
ERROR: modpost: __ex_table+0x2490 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2494 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2494 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x249c (section: __ex_table) -> __param_stall_cpu_holdoff (section: __param)
ERROR: modpost: __ex_table+0x249c references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24a0 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x24a0 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24a8 (section: __ex_table) -> __param_shuffle_interval (section: __param)
ERROR: modpost: __ex_table+0x24a8 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24ac (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x24ac references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b4 (section: __ex_table) -> __param_read_exit_delay (section: __param)
ERROR: modpost: __ex_table+0x24b4 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24b8 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x24b8 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c0 (section: __ex_table) -> __param_nocbs_toggle (section: __param)
ERROR: modpost: __ex_table+0x24c0 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24c4 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x24c4 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24cc (section: __ex_table) -> __param_gpwrap_lag_cycle_mins (section: __param)
ERROR: modpost: __ex_table+0x24cc references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d0 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x24d0 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24d8 (section: __ex_table) -> __param_onoff_interval (section: __param)
ERROR: modpost: __ex_table+0x24d8 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24dc (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x24dc references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e4 (section: __ex_table) -> __param_nwriters (section: __param)
ERROR: modpost: __ex_table+0x24e4 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24e8 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x24e8 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24f0 (section: __ex_table) -> __param_nfakewriters (section: __param)
ERROR: modpost: __ex_table+0x24f0 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24f4 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x24f4 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x24fc (section: __ex_table) -> __param_leakpointer (section: __param)
ERROR: modpost: __ex_table+0x24fc references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2500 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2500 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2508 (section: __ex_table) -> __param_gp_poll_wi_exp (section: __param)
ERROR: modpost: __ex_table+0x2508 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x250c (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x250c references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2514 (section: __ex_table) -> __param_gp_poll_full (section: __param)
ERROR: modpost: __ex_table+0x2514 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2518 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2518 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2520 (section: __ex_table) -> __param_gp_normal (section: __param)
ERROR: modpost: __ex_table+0x2520 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2524 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2524 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x252c (section: __ex_table) -> __param_gp_cond_wi (section: __param)
ERROR: modpost: __ex_table+0x252c references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2530 (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x2530 references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2538 (section: __ex_table) -> __param_gp_cond_exp (section: __param)
ERROR: modpost: __ex_table+0x2538 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x253c (section: __ex_table) -> __UNIQUE_ID_modinfo_530 (section: .modinfo)
ERROR: modpost: __ex_table+0x253c references non-executable section '.modinfo'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2544 (section: __ex_table) -> __param_fwd_progress_holdoff (section: __param)
ERROR: modpost: __ex_table+0x2544 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2548 (section: __ex_table) -> __param_fwd_progress (section: __param)
ERROR: modpost: __ex_table+0x2548 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2550 (section: __ex_table) -> __param_fqs_holdoff (section: __param)
ERROR: modpost: __ex_table+0x2550 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2554 (section: __ex_table) -> __param_fwd_progress (section: __param)
ERROR: modpost: __ex_table+0x2554 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x255c (section: __ex_table) -> __param_deboost_timeliness_check (section: __param)
ERROR: modpost: __ex_table+0x255c references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2560 (section: __ex_table) -> __param_fwd_progress (section: __param)
ERROR: modpost: __ex_table+0x2560 references non-executable section '__param'
WARNING: modpost: vmlinux: section mismatch in reference: init_task+0x4fc (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_cred+0x6c (section: .data.rel) -> .L342 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_signals+0x140 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_signals+0x144 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_signals+0x148 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: init_signals+0x14c (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: console_srcu+0x84 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: early_srcu+0x84 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_tasks_trace_srcu_struct+0x84 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_ctlf+0x84 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_ctlfud+0x84 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_ctla+0x84 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_irq+0x84 (section: .data.rel) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: srcu_ctl+0x84 (section: .data.rel) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
