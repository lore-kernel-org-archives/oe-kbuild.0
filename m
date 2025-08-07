Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AEE26CE13
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754580473; cv=none; b=eAvY2+dBDEhwR4ccYjZGsDpy5oPqepWpaCv9SzMC5hk3kg55Z2V5NJ5bgZF1q99NZBw795E9KLawS5Mj0tWrUXBHm+ZRB3Mn+xPEW859N8qyDx13V9bd6P41dphKsx9kufIXL+p7MJSdTRmtw6iVq3MCDL6JiMneESkm9sXhWzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754580473; c=relaxed/simple;
	bh=Kik5D4QWI2L+s4td03AYqQLU9OHp0ClHREmV97axFSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqHRnBbbfbKepw4Y6T+eEbgT+wDap+6MN6gVZU62ERMXGAvlKebkZDnI8HdJ9VTy/IFEUjcXXJIv7Y31swq6pKPnqCPazdENZUo2sl83kqDwAh/1p8D6AkJyb9EIA4gqx05VSUDLMxh2+gyug1jjWcqBIOTVM25kp+B49Pvu7x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJFxZmaQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJFxZmaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754580471; x=1786116471;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Kik5D4QWI2L+s4td03AYqQLU9OHp0ClHREmV97axFSA=;
  b=SJFxZmaQPUz4KXLdSpq5iiZihDu9m4/fmN0Diqck9cjHhU/TEVyG4C2L
   xul8qPcDu6NLWh2AtcuHf9Y14b8VdGcHzwLGhWggygxXUoYn5D2NKLqZh
   filRpNbhODPegGvZ8udRr12YmZ2drBwCYxi+vc3GfdIu1grNn0FmVEtwI
   nKEc1pbyfrl+u+Sgr/Vl0cOdziFIy2ER43G6H8fU87IX0dU9qTnBPRb0T
   ENP5akSNaAxvGgVT+iD6WVtEhaUMuad+ADprPcHnqczFSCAL3YLMfXRJ0
   5j9t8xybI39wwf8+3czeYjaryH4i/ktjkCVWOEkficGMZ2HCl2ebURx18
   w==;
X-CSE-ConnectionGUID: BmLJBmq8Q6GtOMA6zYtEQA==
X-CSE-MsgGUID: aowSRzIMT4ileWq8YJ77ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56839420"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56839420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 08:27:47 -0700
X-CSE-ConnectionGUID: YgHmPgdbR3+hDDlAx2bRGg==
X-CSE-MsgGUID: 1vT18c6PQc2aPvl8JBkGDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165465848"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2025 08:27:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk2Wu-0002vI-0J;
	Thu, 07 Aug 2025 15:27:44 +0000
Date: Thu, 7 Aug 2025 23:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gdamjan:v6.17/thinkpad-x9-14 12/72] ERROR: modpost:
 __ex_table+0x1584 references non-executable section
 '.rodata.liteeth_probe.str1.4'
Message-ID: <202508072327.NERSSnRO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "riscv arch toolchain issue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "Дамјан Георгиевски" <gdamjan@gmail.com>
CC: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

tree:   https://github.com/gdamjan/linux v6.17/thinkpad-x9-14
head:   57e5a00b5341ad59c7f733c00a95958c39a0523f
commit: b664444682ddf441ec365d42b365860d7a371727 [12/72] media: usb: uvcvideo: Store v4l2_fh pointer in file->private_data
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072327.NERSSnRO-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072327.NERSSnRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072327.NERSSnRO-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport_recv_pkt+0x4bc (section: .text.virtio_transport_recv_pkt) -> wakeup_sources_debugfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: qrtr_tun_read_iter+0x8e (section: .text.qrtr_tun_read_iter) -> wm8350_i2c_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_set_rxq_info+0xa (section: .text.xp_set_rxq_info) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_set_rxq_info+0x22 (section: .text.xp_set_rxq_info) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x18 (section: .text.xp_check_unaligned) -> numa_emu_dma_end (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x2a (section: .text.xp_check_unaligned) -> .L70 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x2e (section: .text.xp_check_unaligned) -> .L73 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x3e (section: .text.xp_check_unaligned) -> .L84 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x42 (section: .text.xp_check_unaligned) -> .L84 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x4e (section: .text.xp_check_unaligned) -> .L70 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x52 (section: .text.xp_check_unaligned) -> .L86 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x5e (section: .text.xp_check_unaligned) -> .L87 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x62 (section: .text.xp_check_unaligned) -> .L70 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x6a (section: .text.xp_check_unaligned) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_check_unaligned+0x80 (section: .text.xp_check_unaligned) -> ics932s401_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_free+0x18 (section: .text.xp_free) -> .L89 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_free+0x56 (section: .text.xp_free) -> .L90 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_free+0x68 (section: .text.xp_free) -> .L90 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_fill_cb+0x4 (section: .text.xp_fill_cb) -> .L91 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_fill_cb+0x46 (section: .text.xp_fill_cb) -> .L92 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_data+0x1e (section: .text.xp_raw_get_data) -> .L93 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_data+0x22 (section: .text.xp_raw_get_data) -> .L95 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_dma+0x1e (section: .text.xp_raw_get_dma) -> .L93 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_raw_get_ctx+0x1e (section: .text.xp_raw_get_ctx) -> .L93 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x170 (section: .text.xp_alloc) -> .L16 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc+0x18c (section: .text.xp_alloc) -> .L14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc_batch+0xee (section: .text.xp_alloc_batch) -> .L16 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_alloc_batch+0x15a (section: .text.xp_alloc_batch) -> .L14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_unmap+0x7a (section: .text.xp_dma_unmap) -> .L36 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x11c (section: .text.xp_dma_map) -> .L36 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x14c (section: .text.xp_dma_map) -> .L13 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x1a0 (section: .text.xp_dma_map) -> .L13 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_dma_map+0x1b0 (section: .text.xp_dma_map) -> .L36 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_destroy+0xa (section: .text.xp_destroy) -> .L17 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_create_and_assign_umem+0x2a6 (section: .text.xp_create_and_assign_umem) -> .L17 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_assign_dev+0x2a4 (section: .text.xp_assign_dev) -> .L15 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_clear_dev+0x52 (section: .text.xp_clear_dev) -> .L15 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_release_deferred+0x64 (section: .text.xp_release_deferred) -> .L17 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xp_put_pool+0x80 (section: .text.xp_put_pool) -> .L18 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0x32 (section: .text.ida_free) -> .LVL26 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0x5a (section: .text.ida_free) -> .LVL41 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0x5c (section: .text.ida_free) -> lkdtm_bugs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0x70 (section: .text.ida_free) -> lkdtm_bugs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0xa0 (section: .text.ida_free) -> .LVL25 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0xba (section: .text.ida_free) -> .LVL25 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0xbe (section: .text.ida_free) -> lkdtm_bugs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0xcc (section: .text.ida_free) -> lkdtm_bugs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0xdc (section: .text.ida_free) -> .LVL42 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0x122 (section: .text.ida_free) -> lkdtm_module_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x4c (section: .text.ida_alloc_range) -> .LVL33 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x56 (section: .text.ida_alloc_range) -> .LVL35 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x9c (section: .text.ida_alloc_range) -> .LVL37 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0xa0 (section: .text.ida_alloc_range) -> .LVL39 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x31a (section: .text.ida_alloc_range) -> .LVL38 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: logic_pio_register_range+0x68 (section: .text.logic_pio_register_range) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_mab_cp+0xce (section: .text.mas_mab_cp) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_mab_cp+0xf4 (section: .text.mas_mab_cp) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_mab_cp+0x100 (section: .text.mas_mab_cp) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_mab_cp+0x106 (section: .text.mas_mab_cp) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_mab_cp+0x156 (section: .text.mas_mab_cp) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_mab_cp+0x15e (section: .text.mas_mab_cp) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_mab_cp+0x166 (section: .text.mas_mab_cp) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_mab_cp+0x180 (section: .text.mas_mab_cp) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mab_mas_cp+0x4c (section: .text.mab_mas_cp) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mast_spanning_rebalance+0x12e (section: .text.mast_spanning_rebalance) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x24 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x38 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x42 (section: .text.mas_empty_area) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4a (section: .text.mas_empty_area) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4fc (section: .text.mas_empty_area) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x20 (section: .text.mt_dump) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x32 (section: .text.mt_dump) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x42 (section: .text.mt_dump) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x4c (section: .text.mt_dump) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x56 (section: .text.mt_dump) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x5c (section: .text.mt_dump) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x68 (section: .text.mt_dump) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x6c (section: .text.mt_dump) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x7c (section: .text.mt_dump) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0xd4 (section: .text.mt_dump) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mas_set_range+0x14 (section: .text.__mas_set_range) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mas_set_range+0x18 (section: .text.__mas_set_range) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mas_set_range+0x1e (section: .text.__mas_set_range) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_set_parent.isra.56+0x30 (section: .text.mas_set_parent.isra.56) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_set_parent.isra.56+0xb4 (section: .text.mas_set_parent.isra.56) -> fpc202_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x82 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x2a8 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x2b0 (section: .text.mt_validate) -> fpc202_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x32e (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x562 (section: .text.mt_validate) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0xc40 (section: .text.mt_validate) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.check_platform_features) -> gsc_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.check_platform_features) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.check_platform_features) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.check_platform_features) -> gsc_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x4 (section: .init.text.check_platform_features) -> cs42l43_i2c_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.get_options) -> stmpe_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.get_options) -> stmpe_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __efistub_.L0 +0x0 (section: .init.text.get_options) -> stmpe_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> 0x0 (section: .rodata.liteeth_probe.str1.4)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.liteeth_probe.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> 0x0 (section: .rodata.liteeth_stop.str1.4)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.rodata.liteeth_stop.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> 0x0 (section: .rodata.mlxfw_firmware_flash)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.mlxfw_firmware_flash'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> __msg (section: .rodata.__msg.71720)
ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.__msg.71720'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> __msg (section: .rodata.__msg.71726)
ERROR: modpost: __ex_table+0x159c references non-executable section '.rodata.__msg.71726'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> __msg (section: .rodata.__msg.71720)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.rodata.__msg.71720'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a8 (section: __ex_table) -> __UNIQUE_ID___addressable___request_region465 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x15a8 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> __UNIQUE_ID___addressable_remove_resource460 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x15ac references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b4 (section: __ex_table) -> __UNIQUE_ID___addressable_insert_resource458 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x15b4 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b8 (section: __ex_table) -> __UNIQUE_ID___addressable_find_resource_space456 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x15b8 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c0 (section: __ex_table) -> __UNIQUE_ID___addressable_page_is_ram451 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x15c0 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c4 (section: __ex_table) -> __UNIQUE_ID___addressable_release_resource443 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x15c4 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15cc (section: __ex_table) -> __UNIQUE_ID___addressable_iomem_resource441 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x15cc references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d0 (section: __ex_table) -> __UNIQUE_ID___addressable_release_resource443 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x15d0 references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d8 (section: __ex_table) -> __setup_str_reserve_setup (section: .init.rodata)
ERROR: modpost: __ex_table+0x15d8 references non-executable section '.init.rodata'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15dc (section: __ex_table) -> __UNIQUE_ID___addressable_release_resource443 (section: .discard.addressable)
ERROR: modpost: __ex_table+0x15dc references non-executable section '.discard.addressable'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF184 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF186 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF188 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF190 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> .LASF192 (section: .debug_str)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .LASF194 (section: .debug_str)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> .LASF196 (section: .debug_str)
ERROR: modpost: __ex_table+0x168c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1690 (section: __ex_table) -> .LASF190 (section: .debug_str)
ERROR: modpost: __ex_table+0x1690 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1698 (section: __ex_table) -> .LASF199 (section: .debug_str)
ERROR: modpost: __ex_table+0x1698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x169c (section: __ex_table) -> .LASF190 (section: .debug_str)
ERROR: modpost: __ex_table+0x169c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> .LASF202 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> .LASF204 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> .LASF236 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> .LASF238 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> .LASF240 (section: .debug_str)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> .LASF242 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .LASF2876 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .LASF2878 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LASF3301 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .LASF3303 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LASF3305 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .LASF3303 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .LASF3308 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .LASF3303 (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .LASF3311 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .LASF3313 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LASF3315 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .LASF3303 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f4 (section: __ex_table) -> .LASF1364 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .LASF1366 (section: .debug_str)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .LASF1368 (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1804 (section: __ex_table) -> .LASF1370 (section: .debug_str)
ERROR: modpost: __ex_table+0x1804 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18f0 (section: __ex_table) -> .LLST226 (section: .debug_loc)
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19c8 (section: __ex_table) -> .LASF405 (section: .debug_str)
ERROR: modpost: __ex_table+0x19c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19cc (section: __ex_table) -> .LASF407 (section: .debug_str)
ERROR: modpost: __ex_table+0x19cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d4 (section: __ex_table) -> .LASF409 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19d8 (section: __ex_table) -> .LASF407 (section: .debug_str)
ERROR: modpost: __ex_table+0x19d8 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
