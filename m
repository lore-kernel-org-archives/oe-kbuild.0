Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6F33BBA1A
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899654; cv=none; b=leOnuiCz1G5Lmy8szu2oeHM7j0/omFGN7BUrDbd2QNLteujL5KkmOysLVVzzbQq2jRli1cbPnxNKx3QpFnEUlJjIgYaXRpGu+D79+zitYjmmijFcFzaoyCDBg5u/mRFmt6y4ktQ4cG3SN5DsPjw27bhMr6iuFJqT3nuv5EmULfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899654; c=relaxed/simple;
	bh=koojfYAwHnx71v256AnFVxUXKbl2f0hwpdkFWVQ4wwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RKn+yE0NFt7zEKEnp0DO4ddw2dxYgZlZmfodakIHbq2dfU/tkTi6AF2TNibfIRhLbXhRdhDpMH0871MqDM+mvBCw6Tyc5j2ary9jQQPKHz7UCKdbLgZrDLdgWZema3gP82n85ukfabZTRot2duPkC4vJFOG7qNhxdVCyVAyE2XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzaUgoCD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzaUgoCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768899651; x=1800435651;
  h=date:from:to:cc:subject:message-id;
  bh=koojfYAwHnx71v256AnFVxUXKbl2f0hwpdkFWVQ4wwk=;
  b=FzaUgoCDK0UlNobiMLZgnJivXQN2HGFIeyTGqmjgGMBxSCIr4KYo2nTu
   30+F/IzACua57ixTT966FD+8tl9FKhB1PNILOlWSY0kFKi8qzJGUIfK6y
   vhnYDzO3zCbG5LfWeezehm85odB3Hy2WQhWIByr7gDdLaZq9ZvZYQrzrN
   3CVRBMl0R4ISMCUWIaSoBuQsCEQaUQ8+OjBzTm1JjWS4Ey7jdfMwACicd
   Cyc1R6UmDBzwVx/ohJt2wjN5bHquX9J8uKslx2GHk3c5bJMHtj9z0mfqi
   9AfGhRGcNM7Z0XAWo0GU3Kof6MtPKJ7iqql90djtjPrtPISIyob5wWHtd
   w==;
X-CSE-ConnectionGUID: s+pXk15wTsizczbDfsisCA==
X-CSE-MsgGUID: gGhpu960TOm6TgcX7IP7nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73970172"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="73970172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:00:50 -0800
X-CSE-ConnectionGUID: AY9onzxjT9Oz9nL6UoGUzg==
X-CSE-MsgGUID: jtYugXEbQUiy7BKSV72u+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="211080519"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2026 01:00:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi7bS-00000000Okj-2Kw4;
	Tue, 20 Jan 2026 09:00:46 +0000
Date: Tue, 20 Jan 2026 17:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [axboe:io_uring-6.19 20/20] ERROR: modpost: __ex_table+0xe58
 references non-executable section '.data.rel.ro.local'
Message-ID: <202601201627.ZgL4q1M2-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-6.19
head:   b994ace83a2bc7699420f6a4c6b860c8da133159
commit: b994ace83a2bc7699420f6a4c6b860c8da133159 [20/20] io_uring/waitid: fix KCSAN warning on io_waitid->head
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: riscv-randconfig-002-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201627.ZgL4q1M2-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201627.ZgL4q1M2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601201627.ZgL4q1M2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x320 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x324 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x328 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x32a (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x32e (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x332 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x334 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x338 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x348 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x34c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x350 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x354 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x362 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_stor_probe1+0x36a (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x2d8 (section: .text.unlikely) -> pagecache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x316 (section: .text.unlikely) -> pagecache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x338 (section: .text.unlikely) -> pagecache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x342 (section: .text.unlikely) -> pagecache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x366 (section: .text.unlikely) -> pagecache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x38c (section: .text.unlikely) -> pagecache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x390 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x3ac (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x3c2 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x3cc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x3f6 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x3fc (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_ctrl_queue+0x422 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0x22 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0x66 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0x6c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0x7e (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0xa2 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0xaa (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0xae (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0xc6 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0xd6 (section: .text.unlikely) -> mempool_faul_inject_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0xe6 (section: .text.unlikely) -> mempool_faul_inject_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0x128 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0x130 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0x19c (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0x1b2 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: unlink1+0x1ba (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_op+0x11a (section: .text.unlikely) -> inode_init_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_op+0x194 (section: .text.unlikely) -> inode_init_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0x2a (section: .text.unlikely) -> initramfs_options_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0x2e (section: .text.unlikely) -> set_mhash_entries (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0x36 (section: .text.unlikely) -> set_mphash_entries (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0x50 (section: .text.unlikely) -> init_fs_namespace_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0x5a (section: .text.unlikely) -> init_fs_namespace_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0x8c (section: .text.unlikely) -> set_mhash_entries (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0x94 (section: .text.unlikely) -> set_mhash_entries (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0x9a (section: .text.unlikely) -> set_mhash_entries (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0xac (section: .text.unlikely) -> set_mphash_entries (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0xb8 (section: .text.unlikely) -> set_mphash_entries (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tegra_i2c_dma_submit+0xc2 (section: .text.unlikely) -> .LVL1495 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irq_find_matching_fwnode+0x12 (section: .text.unlikely) -> hmac_module_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irq_find_matching_fwnode+0x4e (section: .text.unlikely) -> hmac_module_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: irq_find_host+0xc (section: .text.unlikely) -> crypto_cmac_module_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: jedec_probe_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: map_absent_exit+0x8 (section: .exit.text) -> .LVL151 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: map_absent_exit+0xc (section: .exit.text) -> .LVL187 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: physmap_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: physmap_exit+0xc (section: .exit.text) -> .L73 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: physmap_exit+0x18 (section: .exit.text) -> match_isa_ext (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: physmap_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0x1e (section: .exit.text) -> match_isa_ext (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0x22 (section: .exit.text) -> riscv_fill_cpu_vendor_ext.constprop.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0x48 (section: .exit.text) -> match_isa_ext (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0x68 (section: .exit.text) -> .LBB905 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0x70 (section: .exit.text) -> .LBE905 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0x80 (section: .exit.text) -> .LBB906 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0x86 (section: .exit.text) -> .LBE906 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0xb8 (section: .exit.text) -> .LVL79 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0xcc (section: .exit.text) -> .LVL77 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0xd0 (section: .exit.text) -> .LVL80 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cleanup_sc520cdp+0xea (section: .exit.text) -> .LVL81 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_conn_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_storage_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: usb_storage_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ci_hdrc_imx_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ci_hdrc_imx_driver_exit+0xc (section: .exit.text) -> mminit_verify_pageflags_layout (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvidia_altmode_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvidia_altmode_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: keyscan_device_driver_exit+0xc (section: .exit.text) -> early_memblock (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sun4i_lradc_driver_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sun4i_lradc_driver_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: powermate_driver_exit+0x8 (section: .exit.text) -> .LBE258 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: powermate_driver_exit+0xc (section: .exit.text) -> .LBE262 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max6639_driver_exit+0xc (section: .exit.text) -> .LVL6178 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ir35221_driver_exit+0x8 (section: .exit.text) -> .LVL1394 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ir35221_driver_exit+0xc (section: .exit.text) -> journal_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sprd_mbox_driver_exit+0x8 (section: .exit.text) -> .LBE485 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_userspace_exit+0x8 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_userspace_exit+0xc (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_userspace_exit+0x18 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_userspace_exit+0x1c (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_userspace_exit+0x20 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_userspace_exit+0x24 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devfreq_userspace_exit+0x28 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0xe58 (section: __ex_table) -> _entry (section: .data.rel.ro.local)
>> ERROR: modpost: __ex_table+0xe58 references non-executable section '.data.rel.ro.local'
WARNING: modpost: vmlinux: section mismatch in reference: 0xe5c (section: __ex_table) -> _entry (section: .data.rel.ro.local)
ERROR: modpost: __ex_table+0xe5c references non-executable section '.data.rel.ro.local'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf30 (section: __ex_table) -> .LASF4884 (section: .debug_str)
ERROR: modpost: __ex_table+0xf30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf34 (section: __ex_table) -> .LASF4886 (section: .debug_str)
ERROR: modpost: __ex_table+0xf34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf3c (section: __ex_table) -> .LASF4888 (section: .debug_str)
ERROR: modpost: __ex_table+0xf3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf40 (section: __ex_table) -> .LASF4890 (section: .debug_str)
ERROR: modpost: __ex_table+0xf40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf48 (section: __ex_table) -> .LASF4892 (section: .debug_str)
ERROR: modpost: __ex_table+0xf48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf4c (section: __ex_table) -> .LASF4894 (section: .debug_str)
ERROR: modpost: __ex_table+0xf4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf54 (section: __ex_table) -> .LASF4896 (section: .debug_str)
ERROR: modpost: __ex_table+0xf54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf58 (section: __ex_table) -> .LASF4898 (section: .debug_str)
ERROR: modpost: __ex_table+0xf58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf60 (section: __ex_table) -> .LASF4900 (section: .debug_str)
ERROR: modpost: __ex_table+0xf60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf64 (section: __ex_table) -> .LASF4902 (section: .debug_str)
ERROR: modpost: __ex_table+0xf64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf6c (section: __ex_table) -> .LASF4904 (section: .debug_str)
ERROR: modpost: __ex_table+0xf6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf70 (section: __ex_table) -> .LASF4906 (section: .debug_str)
ERROR: modpost: __ex_table+0xf70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf78 (section: __ex_table) -> .LASF4908 (section: .debug_str)
ERROR: modpost: __ex_table+0xf78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf7c (section: __ex_table) -> .LASF4902 (section: .debug_str)
ERROR: modpost: __ex_table+0xf7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf84 (section: __ex_table) -> .LASF4911 (section: .debug_str)
ERROR: modpost: __ex_table+0xf84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf88 (section: __ex_table) -> .LASF4902 (section: .debug_str)
ERROR: modpost: __ex_table+0xf88 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf90 (section: __ex_table) -> .LASF4914 (section: .debug_str)
ERROR: modpost: __ex_table+0xf90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf94 (section: __ex_table) -> .LASF4916 (section: .debug_str)
ERROR: modpost: __ex_table+0xf94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xf9c (section: __ex_table) -> .LASF4918 (section: .debug_str)
ERROR: modpost: __ex_table+0xf9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfa0 (section: __ex_table) -> .LASF4902 (section: .debug_str)
ERROR: modpost: __ex_table+0xfa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfa8 (section: __ex_table) -> .LASF4921 (section: .debug_str)
ERROR: modpost: __ex_table+0xfa8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfac (section: __ex_table) -> .LASF4902 (section: .debug_str)
ERROR: modpost: __ex_table+0xfac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfb4 (section: __ex_table) -> .LASF1330 (section: .debug_str)
ERROR: modpost: __ex_table+0xfb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfb8 (section: __ex_table) -> .LASF1332 (section: .debug_str)
ERROR: modpost: __ex_table+0xfb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfc0 (section: __ex_table) -> .LASF3469 (section: .debug_str)
ERROR: modpost: __ex_table+0xfc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfc4 (section: __ex_table) -> .LASF3471 (section: .debug_str)
ERROR: modpost: __ex_table+0xfc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfcc (section: __ex_table) -> .LASF3473 (section: .debug_str)
ERROR: modpost: __ex_table+0xfcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfd0 (section: __ex_table) -> .LASF3475 (section: .debug_str)
ERROR: modpost: __ex_table+0xfd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfd8 (section: __ex_table) -> .LASF3477 (section: .debug_str)
ERROR: modpost: __ex_table+0xfd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfdc (section: __ex_table) -> .LASF3471 (section: .debug_str)
ERROR: modpost: __ex_table+0xfdc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfe4 (section: __ex_table) -> .LASF3480 (section: .debug_str)
ERROR: modpost: __ex_table+0xfe4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xfe8 (section: __ex_table) -> .LASF3482 (section: .debug_str)
ERROR: modpost: __ex_table+0xfe8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xff0 (section: __ex_table) -> .LASF3484 (section: .debug_str)
ERROR: modpost: __ex_table+0xff0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xff4 (section: __ex_table) -> .LASF3486 (section: .debug_str)
ERROR: modpost: __ex_table+0xff4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0xffc (section: __ex_table) -> .LASF1508 (section: .debug_str)
ERROR: modpost: __ex_table+0xffc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1000 (section: __ex_table) -> .LASF1510 (section: .debug_str)
ERROR: modpost: __ex_table+0x1000 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1008 (section: __ex_table) -> .LASF1512 (section: .debug_str)
ERROR: modpost: __ex_table+0x1008 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x100c (section: __ex_table) -> .LASF1514 (section: .debug_str)
ERROR: modpost: __ex_table+0x100c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1014 (section: __ex_table) -> .LASF1516 (section: .debug_str)
ERROR: modpost: __ex_table+0x1014 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1018 (section: __ex_table) -> .LASF1518 (section: .debug_str)
ERROR: modpost: __ex_table+0x1018 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1020 (section: __ex_table) -> .LASF1520 (section: .debug_str)
ERROR: modpost: __ex_table+0x1020 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1024 (section: __ex_table) -> .LASF1522 (section: .debug_str)
ERROR: modpost: __ex_table+0x1024 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x102c (section: __ex_table) -> .LASF1524 (section: .debug_str)
ERROR: modpost: __ex_table+0x102c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1030 (section: __ex_table) -> .LASF1526 (section: .debug_str)
ERROR: modpost: __ex_table+0x1030 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1038 (section: __ex_table) -> .LASF1528 (section: .debug_str)
ERROR: modpost: __ex_table+0x1038 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x103c (section: __ex_table) -> .LASF1530 (section: .debug_str)
ERROR: modpost: __ex_table+0x103c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1044 (section: __ex_table) -> .LASF1532 (section: .debug_str)
ERROR: modpost: __ex_table+0x1044 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1048 (section: __ex_table) -> .LASF1534 (section: .debug_str)
ERROR: modpost: __ex_table+0x1048 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1050 (section: __ex_table) -> .LASF1536 (section: .debug_str)
ERROR: modpost: __ex_table+0x1050 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
