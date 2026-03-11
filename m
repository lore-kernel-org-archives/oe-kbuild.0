Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C10E347BDC
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 22:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773269955; cv=none; b=Nn8galxYcd0Dwz13XAiaaDIf/pAAJJG0w9faODRU9p7vQT3+MI3LSS4gRYb5ahRE6L/pNAEWc9VLD1lFwO07LDxYXhp05tv803ipTpn6JKOuYrCp3akEtChdQfguR9C1YhtkpBnbTv2ABrxIBp1sLUC/hhqIStSysdwfO7RYUhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773269955; c=relaxed/simple;
	bh=piQB6W5RI+7/oeHB7w7bMP/pOaZFk84po/IUkaVWAS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hkLB+lkWNKuWaxfaDhoq+azTPjIYD5Tbwuvd7GgL/rYYAve1ZCDuX4pZj7SuzxHai3qu5KVwpW7vNIxHaBd+4gqkEANav2IN2gTsRJkV2UvqVX3g+JOuwvbMFSPyIZvvchDByfKImv9D9EgTyGXURomss4bkCdGzo7PGFJim85E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdAlwJDY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdAlwJDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773269951; x=1804805951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=piQB6W5RI+7/oeHB7w7bMP/pOaZFk84po/IUkaVWAS0=;
  b=HdAlwJDY9Ucs12VdXROLtcm8iFQa1OANW/XO59N3EkSnw48iTdXAtS6D
   6dNtrlg8f6WNwYSQ+ZVUmxa5MEISp8JqiRjH3THQECe9455vhmB7DnqZu
   xLBii9fcscErSHHEgYoU7PyMd02nOnZL1nsCZ9hJRKbYoxf6dXkhW8uxS
   wM6dK6Z/wuHN8TCtEzmMGEjx7nZHUm+nt9gCInKVEpA1/JkIN1Hx6EXUR
   139oCPhZB/WQl7jcViDytWhOFYM4aOb+TjKDIMNv5c3yiZE5VcHHUe5o3
   kJgT/qOx0BphnCjtcSSyGY/O6CQPbDr6typHGCuZ334tnGSrXn0OVo9Yp
   g==;
X-CSE-ConnectionGUID: S+pSsThQSY2fqAxBj2PbnA==
X-CSE-MsgGUID: n6f2/EbLSbShESMHLFRz1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85709069"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="85709069"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 15:59:10 -0700
X-CSE-ConnectionGUID: nmFyuLGbSQOy/COA+B8riA==
X-CSE-MsgGUID: XWbY86ePTAOWWD5EFMTAYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="224760055"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 15:59:09 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0SWA-000000001nJ-0xLO;
	Wed, 11 Mar 2026 22:59:06 +0000
Date: Thu, 12 Mar 2026 06:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 24/26] PREEMPT_RT injection
Message-ID: <202603120645.BoJHrUED-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260310115709.2276203-25-dev@lankhorst.se>
References: <20260310115709.2276203-25-dev@lankhorst.se>
TO: Maarten Lankhorst <dev@lankhorst.se>
TO: intel-xe@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: Maarten Lankhorst <dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on next-20260311]
[cannot apply to drm-i915/for-linux-next-fixes drm-misc/drm-misc-next drm-xe/drm-xe-next linus/master v7.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-vblank_work-Add-methods-to-schedule-vblank_work-in-2-stages/20260310-205630
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260310115709.2276203-25-dev%40lankhorst.se
patch subject: [PATCH v7 24/26] PREEMPT_RT injection
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-141-20260311 (https://download.01.org/0day-ci/archive/20260312/202603120645.BoJHrUED-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603120645.BoJHrUED-lkp@intel.com/

New smatch warnings:
drivers/hte/hte.c:221 hte_ts_put() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hte/hte.c:301 hte_ts_dis_en_common() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/input/touchscreen/ad7877.c:402 ad7877_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_acntpc.c:237 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/message/fusion/mptscsih.c:1125 mptscsih_search_running_cmds() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/message/fusion/mptbase.c:2096 mpt_detach() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/message/fusion/mptbase.c:7016 mpt_SoftResetHandler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/message/fusion/mptbase.c:7216 mpt_HardResetHandler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/applicom.c:479 ac_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/pci/tw5864/tw5864-video.c:1328 tw5864_handle_frame_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-pmp.c:864 sata_pmp_eh_handle_disabled_links() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:5345 ata_port_request_pm() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/message/fusion/mptsas.c:385 mptsas_cleanup_fw_event_q() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/sonypi.c:766 input_keyrelease() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/sonypi.c:915 sonypi_misc_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dtlk.c:239 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_keypc.c:243 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/jsm/jsm_neo.c:778 neo_parse_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi.c:1921 __spi_pump_messages() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi.c:4589 spi_async() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi.c:4689 __spi_sync() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/rc/serial_ir.c:667 serial_ir_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/libsas/sas_ata.c:481 sas_ata_internal_abort() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/qxl/qxl_cmd.c:148 qxl_ring_push() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rtc/rtc-m48t59.c:133 m48t59_rtc_set_time() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rtc/rtc-m48t59.c:335 m48t59_nvram_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/i2c/busses/i2c-elektor.c:116 pcf_isa_waitforpin() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/video/fbdev/via/via-gpio.c:242 viafb_gpio_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/hpilo.c:605 ilo_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virtio/virtio_input.c:56 virtinput_recv_events() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virtio/virtio_input.c:333 virtinput_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virtio/virtio_rtc_driver.c:253 viortc_do_cb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/intel_uncore.c:502 intel_uncore_forcewake_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/radeon/radeon_display.c:601 radeon_crtc_page_flip_target() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/i915_sw_fence.c:391 __i915_sw_fence_await_sw_fence() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:285 amdgpu_display_crtc_page_flip_target() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/i915_pmu.c:256 get_rc6() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi-topcliff-pch.c:1424 pch_spi_pd_remove() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2988 amdgpu_vm_handle_fault() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/slub.c:3812 get_from_partial_node() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/slub.c:4323 alloc_from_new_slab() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/amplc_pci224.c:466 pci224_ao_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/amplc_pci224.c:984 pci224_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/amplc_pci230.c:1045 pci230_ao_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/amplc_pci230.c:1280 pci230_ao_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/amplc_pci230.c:1843 pci230_ai_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/amplc_pci230.c:2329 pci230_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c:310 pci1xxxx_gpio_irq_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:897 assert_pending_valid() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/cb_pcidas64.c:2657 ai_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_pcidio.c:352 setup_mite_dma() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/amplc_pc236_common.c:53 pc236_intr_check() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:108 amdgpu_userq_fence_driver_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:245 i915_gem_shrink() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/i915_active.c:992 i915_request_add_active_barriers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/i915_active.c:1094 __i915_active_fence_set() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2411 pin_guc_id() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:7321 gfx_v9_0_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9562 gfx_v10_0_reset_kgq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9632 gfx_v10_0_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:3603 gfx_v9_4_3_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:6466 gfx_v11_0_eop_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:4832 gfx_v12_0_eop_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c:3622 gfx_v12_1_eop_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1669 sdma_v6_0_process_fence_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1601 sdma_v7_0_process_fence_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_irq.c:515 amdgpu_dm_irq_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11132 amdgpu_dm_atomic_commit_tail() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/message/fusion/mptscsih.c:766 mptscsih_io_done() warn: inconsistent indenting
drivers/message/fusion/mptscsih.c:841 mptscsih_io_done() warn: inconsistent indenting
drivers/message/fusion/mptbase.c:2621 mpt_do_ioc_recovery() warn: 'ioc->pcidev->irq' from request_irq() not released on lines: 2621.
drivers/message/fusion/mptbase.c:7019 mpt_SoftResetHandler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/message/fusion/mptbase.c:7080 mpt_SoftResetHandler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/applicom.c:348 applicom_init() warn: 'RamIO' from ioremap() not released on lines: 253,338,348.
drivers/char/applicom.c:348 applicom_init() warn: 'RamIO' from ioremap() not released on lines: 338,348.
drivers/media/pci/tw5864/tw5864-video.c:1343 tw5864_handle_frame_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-pmp.c:964 sata_pmp_eh_recover() warn: missing error code 'rc'
drivers/ata/libata-pmp.c:964 sata_pmp_eh_recover() warn: missing error code 'rc'
drivers/ata/libata-core.c:6280 ata_port_detach() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virtio/virtio_rtc_driver.c:259 viortc_do_cb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/intel_uncore.c:515 intel_uncore_forcewake_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi-topcliff-pch.c:580 pch_spi_set_tx() error: we previously assumed 'data->pkt_tx_buff' could be null (see line 553)
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:830 amdgpu_vm_flush() error: we previously assumed 'ring->funcs->emit_vm_flush' could be null (see line 803)
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1381 amdgpu_vm_bo_update() error: we previously assumed 'bo' could be null (see line 1320)
drivers/comedi/drivers/amplc_pci230.c:2539 pci230_auto_attach() warn: 'pci_dev->irq' from request_irq() not released on lines: 2481,2485,2524,2534.
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:1613 execlists_dequeue() warn: inconsistent returns '&sched_engine->lock'.
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3941 execlists_create_virtual() warn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3942 execlists_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'
drivers/comedi/drivers/cb_pcidas64.c:4039 auto_attach() warn: 'pcidev->irq' from request_irq() not released on lines: 4037.
drivers/gpu/drm/i915/gem/i915_gem_object.h:183 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 172)
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5377 intel_guc_engine_failure_process_msg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5920 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5921 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:7327 gfx_v9_0_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4292 gfx_v10_0_init_microcode() warn: 'adev->gfx.rlc_fw' from request_firmware() not released on lines: 4292.
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:3609 gfx_v9_4_3_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:13132 parse_edid_displayid_vrr() warn: variable dereferenced before check 'edid_ext' (see line 13128)

vim +221 drivers/hte/hte.c

31ab09b4218879b Dipen Patel 2022-04-22  140  
31ab09b4218879b Dipen Patel 2022-04-22  141  /**
31ab09b4218879b Dipen Patel 2022-04-22  142   * hte_ts_put() - Release and disable timestamp for the given desc.
31ab09b4218879b Dipen Patel 2022-04-22  143   *
31ab09b4218879b Dipen Patel 2022-04-22  144   * @desc: timestamp descriptor.
31ab09b4218879b Dipen Patel 2022-04-22  145   *
31ab09b4218879b Dipen Patel 2022-04-22  146   * Context: debugfs_remove_recursive() function call may use sleeping locks,
31ab09b4218879b Dipen Patel 2022-04-22  147   *	    not suitable from atomic context.
31ab09b4218879b Dipen Patel 2022-04-22  148   * Returns: 0 on success or a negative error code on failure.
31ab09b4218879b Dipen Patel 2022-04-22  149   */
31ab09b4218879b Dipen Patel 2022-04-22  150  int hte_ts_put(struct hte_ts_desc *desc)
31ab09b4218879b Dipen Patel 2022-04-22  151  {
31ab09b4218879b Dipen Patel 2022-04-22  152  	int ret = 0;
31ab09b4218879b Dipen Patel 2022-04-22  153  	unsigned long flag;
31ab09b4218879b Dipen Patel 2022-04-22  154  	struct hte_device *gdev;
31ab09b4218879b Dipen Patel 2022-04-22  155  	struct hte_ts_info *ei;
31ab09b4218879b Dipen Patel 2022-04-22  156  
31ab09b4218879b Dipen Patel 2022-04-22  157  	if (!desc)
31ab09b4218879b Dipen Patel 2022-04-22  158  		return -EINVAL;
31ab09b4218879b Dipen Patel 2022-04-22  159  
31ab09b4218879b Dipen Patel 2022-04-22  160  	ei = desc->hte_data;
31ab09b4218879b Dipen Patel 2022-04-22  161  
31ab09b4218879b Dipen Patel 2022-04-22  162  	if (!ei || !ei->gdev)
31ab09b4218879b Dipen Patel 2022-04-22  163  		return -EINVAL;
31ab09b4218879b Dipen Patel 2022-04-22  164  
31ab09b4218879b Dipen Patel 2022-04-22  165  	gdev = ei->gdev;
31ab09b4218879b Dipen Patel 2022-04-22  166  
31ab09b4218879b Dipen Patel 2022-04-22  167  	mutex_lock(&ei->req_mlock);
31ab09b4218879b Dipen Patel 2022-04-22  168  
31ab09b4218879b Dipen Patel 2022-04-22  169  	if (unlikely(!test_bit(HTE_TS_REQ, &ei->flags) &&
31ab09b4218879b Dipen Patel 2022-04-22  170  	    !test_bit(HTE_TS_REGISTERED, &ei->flags))) {
31ab09b4218879b Dipen Patel 2022-04-22  171  		dev_info(gdev->sdev, "id:%d is not requested\n",
31ab09b4218879b Dipen Patel 2022-04-22  172  			 desc->attr.line_id);
31ab09b4218879b Dipen Patel 2022-04-22  173  		ret = -EINVAL;
31ab09b4218879b Dipen Patel 2022-04-22  174  		goto unlock;
31ab09b4218879b Dipen Patel 2022-04-22  175  	}
31ab09b4218879b Dipen Patel 2022-04-22  176  
31ab09b4218879b Dipen Patel 2022-04-22  177  	if (unlikely(!test_bit(HTE_TS_REQ, &ei->flags) &&
31ab09b4218879b Dipen Patel 2022-04-22  178  	    test_bit(HTE_TS_REGISTERED, &ei->flags))) {
31ab09b4218879b Dipen Patel 2022-04-22  179  		dev_info(gdev->sdev, "id:%d is registered but not requested\n",
31ab09b4218879b Dipen Patel 2022-04-22  180  			 desc->attr.line_id);
31ab09b4218879b Dipen Patel 2022-04-22  181  		ret = -EINVAL;
31ab09b4218879b Dipen Patel 2022-04-22  182  		goto unlock;
31ab09b4218879b Dipen Patel 2022-04-22  183  	}
31ab09b4218879b Dipen Patel 2022-04-22  184  
31ab09b4218879b Dipen Patel 2022-04-22  185  	if (test_bit(HTE_TS_REQ, &ei->flags) &&
31ab09b4218879b Dipen Patel 2022-04-22  186  	    !test_bit(HTE_TS_REGISTERED, &ei->flags)) {
31ab09b4218879b Dipen Patel 2022-04-22  187  		clear_bit(HTE_TS_REQ, &ei->flags);
31ab09b4218879b Dipen Patel 2022-04-22  188  		desc->hte_data = NULL;
31ab09b4218879b Dipen Patel 2022-04-22  189  		ret = 0;
31ab09b4218879b Dipen Patel 2022-04-22  190  		goto mod_put;
31ab09b4218879b Dipen Patel 2022-04-22  191  	}
31ab09b4218879b Dipen Patel 2022-04-22  192  
31ab09b4218879b Dipen Patel 2022-04-22  193  	ret = gdev->chip->ops->release(gdev->chip, desc, ei->xlated_id);
31ab09b4218879b Dipen Patel 2022-04-22  194  	if (ret) {
31ab09b4218879b Dipen Patel 2022-04-22  195  		dev_err(gdev->sdev, "id: %d free failed\n",
31ab09b4218879b Dipen Patel 2022-04-22  196  			desc->attr.line_id);
31ab09b4218879b Dipen Patel 2022-04-22  197  		goto unlock;
31ab09b4218879b Dipen Patel 2022-04-22  198  	}
31ab09b4218879b Dipen Patel 2022-04-22  199  
31ab09b4218879b Dipen Patel 2022-04-22  200  	kfree(ei->line_name);
31ab09b4218879b Dipen Patel 2022-04-22  201  	if (ei->free_attr_name)
31ab09b4218879b Dipen Patel 2022-04-22  202  		kfree_const(desc->attr.name);
31ab09b4218879b Dipen Patel 2022-04-22  203  
31ab09b4218879b Dipen Patel 2022-04-22  204  	debugfs_remove_recursive(ei->ts_dbg_root);
31ab09b4218879b Dipen Patel 2022-04-22  205  
31ab09b4218879b Dipen Patel 2022-04-22  206  	spin_lock_irqsave(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  207  
31ab09b4218879b Dipen Patel 2022-04-22  208  	if (test_bit(HTE_TS_QUEUE_WK, &ei->flags)) {
31ab09b4218879b Dipen Patel 2022-04-22  209  		spin_unlock_irqrestore(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  210  		flush_work(&ei->cb_work);
31ab09b4218879b Dipen Patel 2022-04-22  211  		spin_lock_irqsave(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  212  	}
31ab09b4218879b Dipen Patel 2022-04-22  213  
31ab09b4218879b Dipen Patel 2022-04-22  214  	atomic_dec(&gdev->ts_req);
31ab09b4218879b Dipen Patel 2022-04-22  215  	atomic_set(&ei->dropped_ts, 0);
31ab09b4218879b Dipen Patel 2022-04-22  216  
31ab09b4218879b Dipen Patel 2022-04-22  217  	ei->seq = 1;
31ab09b4218879b Dipen Patel 2022-04-22  218  	ei->flags = 0;
31ab09b4218879b Dipen Patel 2022-04-22  219  	desc->hte_data = NULL;
31ab09b4218879b Dipen Patel 2022-04-22  220  
31ab09b4218879b Dipen Patel 2022-04-22 @221  	spin_unlock_irqrestore(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  222  
31ab09b4218879b Dipen Patel 2022-04-22  223  	ei->cb = NULL;
31ab09b4218879b Dipen Patel 2022-04-22  224  	ei->tcb = NULL;
31ab09b4218879b Dipen Patel 2022-04-22  225  	ei->cl_data = NULL;
31ab09b4218879b Dipen Patel 2022-04-22  226  
31ab09b4218879b Dipen Patel 2022-04-22  227  mod_put:
31ab09b4218879b Dipen Patel 2022-04-22  228  	module_put(gdev->owner);
31ab09b4218879b Dipen Patel 2022-04-22  229  unlock:
31ab09b4218879b Dipen Patel 2022-04-22  230  	mutex_unlock(&ei->req_mlock);
31ab09b4218879b Dipen Patel 2022-04-22  231  	dev_dbg(gdev->sdev, "release id: %d\n", desc->attr.line_id);
31ab09b4218879b Dipen Patel 2022-04-22  232  
31ab09b4218879b Dipen Patel 2022-04-22  233  	return ret;
31ab09b4218879b Dipen Patel 2022-04-22  234  }
31ab09b4218879b Dipen Patel 2022-04-22  235  EXPORT_SYMBOL_GPL(hte_ts_put);
31ab09b4218879b Dipen Patel 2022-04-22  236  
31ab09b4218879b Dipen Patel 2022-04-22  237  static int hte_ts_dis_en_common(struct hte_ts_desc *desc, bool en)
31ab09b4218879b Dipen Patel 2022-04-22  238  {
31ab09b4218879b Dipen Patel 2022-04-22  239  	u32 ts_id;
31ab09b4218879b Dipen Patel 2022-04-22  240  	struct hte_device *gdev;
31ab09b4218879b Dipen Patel 2022-04-22  241  	struct hte_ts_info *ei;
31ab09b4218879b Dipen Patel 2022-04-22  242  	int ret;
31ab09b4218879b Dipen Patel 2022-04-22  243  	unsigned long flag;
31ab09b4218879b Dipen Patel 2022-04-22  244  
31ab09b4218879b Dipen Patel 2022-04-22  245  	if (!desc)
31ab09b4218879b Dipen Patel 2022-04-22  246  		return -EINVAL;
31ab09b4218879b Dipen Patel 2022-04-22  247  
31ab09b4218879b Dipen Patel 2022-04-22  248  	ei = desc->hte_data;
31ab09b4218879b Dipen Patel 2022-04-22  249  
31ab09b4218879b Dipen Patel 2022-04-22  250  	if (!ei || !ei->gdev)
31ab09b4218879b Dipen Patel 2022-04-22  251  		return -EINVAL;
31ab09b4218879b Dipen Patel 2022-04-22  252  
31ab09b4218879b Dipen Patel 2022-04-22  253  	gdev = ei->gdev;
31ab09b4218879b Dipen Patel 2022-04-22  254  	ts_id = desc->attr.line_id;
31ab09b4218879b Dipen Patel 2022-04-22  255  
31ab09b4218879b Dipen Patel 2022-04-22  256  	mutex_lock(&ei->req_mlock);
31ab09b4218879b Dipen Patel 2022-04-22  257  
31ab09b4218879b Dipen Patel 2022-04-22  258  	if (!test_bit(HTE_TS_REGISTERED, &ei->flags)) {
31ab09b4218879b Dipen Patel 2022-04-22  259  		dev_dbg(gdev->sdev, "id:%d is not registered", ts_id);
31ab09b4218879b Dipen Patel 2022-04-22  260  		ret = -EUSERS;
31ab09b4218879b Dipen Patel 2022-04-22  261  		goto out;
31ab09b4218879b Dipen Patel 2022-04-22  262  	}
31ab09b4218879b Dipen Patel 2022-04-22  263  
31ab09b4218879b Dipen Patel 2022-04-22  264  	spin_lock_irqsave(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  265  
31ab09b4218879b Dipen Patel 2022-04-22  266  	if (en) {
31ab09b4218879b Dipen Patel 2022-04-22  267  		if (!test_bit(HTE_TS_DISABLE, &ei->flags)) {
31ab09b4218879b Dipen Patel 2022-04-22  268  			ret = 0;
31ab09b4218879b Dipen Patel 2022-04-22  269  			goto out_unlock;
31ab09b4218879b Dipen Patel 2022-04-22  270  		}
31ab09b4218879b Dipen Patel 2022-04-22  271  
31ab09b4218879b Dipen Patel 2022-04-22  272  		spin_unlock_irqrestore(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  273  		ret = gdev->chip->ops->enable(gdev->chip, ei->xlated_id);
31ab09b4218879b Dipen Patel 2022-04-22  274  		if (ret) {
31ab09b4218879b Dipen Patel 2022-04-22  275  			dev_warn(gdev->sdev, "id: %d enable failed\n",
31ab09b4218879b Dipen Patel 2022-04-22  276  				 ts_id);
31ab09b4218879b Dipen Patel 2022-04-22  277  			goto out;
31ab09b4218879b Dipen Patel 2022-04-22  278  		}
31ab09b4218879b Dipen Patel 2022-04-22  279  
31ab09b4218879b Dipen Patel 2022-04-22  280  		spin_lock_irqsave(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  281  		clear_bit(HTE_TS_DISABLE, &ei->flags);
31ab09b4218879b Dipen Patel 2022-04-22  282  	} else {
31ab09b4218879b Dipen Patel 2022-04-22  283  		if (test_bit(HTE_TS_DISABLE, &ei->flags)) {
31ab09b4218879b Dipen Patel 2022-04-22  284  			ret = 0;
31ab09b4218879b Dipen Patel 2022-04-22  285  			goto out_unlock;
31ab09b4218879b Dipen Patel 2022-04-22  286  		}
31ab09b4218879b Dipen Patel 2022-04-22  287  
31ab09b4218879b Dipen Patel 2022-04-22  288  		spin_unlock_irqrestore(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  289  		ret = gdev->chip->ops->disable(gdev->chip, ei->xlated_id);
31ab09b4218879b Dipen Patel 2022-04-22  290  		if (ret) {
31ab09b4218879b Dipen Patel 2022-04-22  291  			dev_warn(gdev->sdev, "id: %d disable failed\n",
31ab09b4218879b Dipen Patel 2022-04-22  292  				 ts_id);
31ab09b4218879b Dipen Patel 2022-04-22  293  			goto out;
31ab09b4218879b Dipen Patel 2022-04-22  294  		}
31ab09b4218879b Dipen Patel 2022-04-22  295  
31ab09b4218879b Dipen Patel 2022-04-22  296  		spin_lock_irqsave(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  297  		set_bit(HTE_TS_DISABLE, &ei->flags);
31ab09b4218879b Dipen Patel 2022-04-22  298  	}
31ab09b4218879b Dipen Patel 2022-04-22  299  
31ab09b4218879b Dipen Patel 2022-04-22  300  out_unlock:
31ab09b4218879b Dipen Patel 2022-04-22 @301  	spin_unlock_irqrestore(&ei->slock, flag);
31ab09b4218879b Dipen Patel 2022-04-22  302  out:
31ab09b4218879b Dipen Patel 2022-04-22  303  	mutex_unlock(&ei->req_mlock);
31ab09b4218879b Dipen Patel 2022-04-22  304  	return ret;
31ab09b4218879b Dipen Patel 2022-04-22  305  }
31ab09b4218879b Dipen Patel 2022-04-22  306  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
