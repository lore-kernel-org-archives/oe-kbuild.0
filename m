Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD1394478
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 22:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773268692; cv=none; b=Ch0lBdBkZxO5hVFA6u0PZYbNrl98djAinRXgQ2PWgRxVxo5qiI4+q/zyivSKhckUgvPyacL93mcV6b8TCN/yUxw89mFhryy1cRFhSiTcrh7YAsIEOuVfP23XguVIKxPgcl0lpF+UEvk6oRuGUn/2jA8V82wJf/yrW9aWfgsOg4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773268692; c=relaxed/simple;
	bh=o63zznPpKIH9ZBjzhYodavVYT5+tNiu1oVQ7PBS6PjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZEcUO98ceHdLoZlL6HmMTDm9ZN8NAi5Ga6W7HLxREsyv8EYw9GUpbUs6C38koDfPK3HpkJNPqtySPvAndduMM3QrIF9rKb/YzPQQlQtGqdf+GZSIkVYuxCcFaBw9RfHbe2xnPpPlrkg6u7Q7gCtOuuRdtq7v7XtrXezi3L8OE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6V0mMM0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6V0mMM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773268690; x=1804804690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o63zznPpKIH9ZBjzhYodavVYT5+tNiu1oVQ7PBS6PjA=;
  b=U6V0mMM0kS+4Vo2dOl7IvulYfEXzk8+iZ9j40mguGcavXNSAEcm7Shwl
   f1iSaUkG4ZLvVoefiuDJDcGuhuAhk7CuCPOE/juQKfkcgmp9sFgQlh/9/
   2dgffn9YG7ZSgJZmBintQ4B4O915smQ5MDiX18EJQDCBabojEJkmQihmT
   ps0P0JUnQt7qIx/9CSsLWt+os4wmQPbSRcEPo3xSkRPBg6/20VycAoYPq
   SK5waDnf48v5Gi0HISDG4kuPXUY4jQIDzq+8My7RNcU3p0fcWOTAAPPj4
   YOZUzNvVhMsKJWRZlAU5VQAxOAjQAKeCVC8Czv47EttSrNtizHrgC+lZ9
   w==;
X-CSE-ConnectionGUID: 7eaKCZofSYeaDgTuHEuLlw==
X-CSE-MsgGUID: gmJ84imzSDmvCidp5JoA5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74468633"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="74468633"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 15:38:09 -0700
X-CSE-ConnectionGUID: QKGXOTusQ1iWC4oqI6mkdQ==
X-CSE-MsgGUID: 96FfhutRQjWoKmlsvEZNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="218081163"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Mar 2026 15:38:07 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0SBp-000000001mZ-1WjI;
	Wed, 11 Mar 2026 22:38:05 +0000
Date: Thu, 12 Mar 2026 06:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 24/26] PREEMPT_RT injection
Message-ID: <202603120612.2C8AakgY-lkp@intel.com>
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
config: arm64-randconfig-r073-20260311 (https://download.01.org/0day-ci/archive/20260312/202603120612.2C8AakgY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603120612.2C8AakgY-lkp@intel.com/

New smatch warnings:
drivers/staging/most/dim2/dim2.c:535 configure_channel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:378 qcom_glink_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:519 qcom_glink_send_open_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:592 qcom_glink_rx_done_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1508 __qcom_glink_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1702 qcom_glink_rx_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/block/zloop.c:462 zloop_rw() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/block/zloop.c:773 zloop_report_zones() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/caif/caif_virtio.c:586 cfv_netdev_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/pinctrl/stm32/pinctrl-stm32.c:652 stm32_gpio_domain_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/pinctrl/stm32/pinctrl-stm32.c:972 stm32_pmx_set_mode() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/pinctrl/stm32/pinctrl-stm32.c:1110 stm32_pconf_set_driving() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/pinctrl/stm32/pinctrl-stm32.c:1156 stm32_pconf_set_speed() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/pinctrl/stm32/pinctrl-stm32.c:1202 stm32_pconf_set_bias() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/pinctrl/stm32/pinctrl-stm32.c:1258 stm32_pconf_set_advcfgr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/pinctrl/stm32/pinctrl-stm32.c:1344 stm32_pconf_set_skew_delay() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/crypto/atmel-aes.c:911 atmel_aes_handle_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/vfio/platform/vfio_platform_irq.c:165 vfio_automasked_irq_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tee/optee/notif.c:83 optee_notif_wait() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/rpmsg_char.c:236 rpmsg_eptdev_read_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/clk/stm32/clk-stm32mp1.c:1006 timer_ker_set_rate() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/staging/nvec/nvec.c:407 nvec_request_master() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/staging/nvec/nvec.c:467 nvec_dispatch() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firmware/arm_scmi/transports/virtio.c:292 scmi_vio_complete_cb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3011 arm_smmu_attach_prepare() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ieee802154/cc2520.c:531 cc2520_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firmware/arm_scmi/raw_mode.c:729 scmi_raw_message_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firmware/arm_scmi/raw_mode.c:875 scmi_test_dbg_raw_common_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c:811 wave5_vpu_dec_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c:879 wave5_vpu_dec_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/clk/tegra/clk-pll.c:1533 clk_pllc_set_rate() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/sun50i-iommu.c:489 sun50i_iommu_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/i2c/busses/i2c-rk3x.c:1131 rk3x_i2c_xfer_common() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/i2c/busses/i2c-uniphier-f.c:357 uniphier_fi2c_xfer_one() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpio/gpio-mvebu.c:639 mvebu_pwm_request() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpio/gpio-mvebu.c:1295 mvebu_gpio_probe() warn: 'mvchip->clk' from clk_prepare_enable() not released on lines: 1183,1242.
drivers/nvdimm/nd_virtio.c:92 virtio_pmem_flush() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_iscsi.c:1718 iscsi_is_session_online() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_iscsi.c:1862 iscsi_block_scsi_eh() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_iscsi.c:1987 __iscsi_unbind_session() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aha152x.c:1468 busfree_run() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/hisi_sas/hisi_sas_v2_hw.c:2473 slot_complete_v2_hw() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi-tegra114.c:991 tegra_spi_setup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi-tegra210-quad.c:1278 tegra_qspi_combined_seq_xfer() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/test_context-analysis.c:110 test_spinlock() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/test_context-analysis.c:127 test_spinlock_trylock_extra() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/staging/most/dim2/dim2.c:550 configure_channel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:393 qcom_glink_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:504 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)
drivers/block/zloop.c:487 zloop_rw() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/caif/caif_virtio.c:594 cfv_netdev_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/caif/caif_virtio.c:747 cfv_probe() error: we previously assumed 'vdev->vringh_config' could be null (see line 668)
drivers/crypto/atmel-aes.c:918 atmel_aes_handle_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firmware/arm_scmi/transports/virtio.c:298 scmi_vio_complete_cb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c:854 wave5_vpu_dec_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/sun50i-iommu.c:496 sun50i_iommu_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvdimm/nd_virtio.c:106 virtio_pmem_flush() warn: '&req_data->list' not removed from list
drivers/scsi/scsi_transport_iscsi.c:1866 iscsi_block_scsi_eh() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_iscsi.c:1997 __iscsi_unbind_session() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_iscsi.c:2011 __iscsi_unbind_session() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aha152x.c:1488 busfree_run() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aha152x.c:1503 busfree_run() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/spi/spi-tegra210-quad.c:696 tegra_qspi_start_dma_based_transfer() error: we previously assumed 'tqspi->tx_dma_chan' could be null (see line 652)
lib/test_context-analysis.c:103 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:540 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_context-analysis.c:127 test_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:592 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/mutex.h:254 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/rwsem.h:260 class_rwsem_read_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/rwsem.h:271 class_rwsem_write_try_constructor() warn: passing zero to 'ERR_PTR'

vim +535 drivers/staging/most/dim2/dim2.c

ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  437  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  438  /**
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  439   * configure_channel - initialize a channel
6f4d367f335666 drivers/staging/most/dim2/dim2.c         Lee Jones       2021-04-14  440   * @most_iface: interface the channel belongs to
6f4d367f335666 drivers/staging/most/dim2/dim2.c         Lee Jones       2021-04-14  441   * @ch_idx: channel index to be configured
6f4d367f335666 drivers/staging/most/dim2/dim2.c         Lee Jones       2021-04-14  442   * @ccfg: structure that holds the configuration information
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  443   *
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  444   * Receives configuration information from mostcore and initialize
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  445   * the corresponding channel. Return 0 on success, negative on failure.
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  446   */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  447  static int configure_channel(struct most_interface *most_iface, int ch_idx,
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  448  			     struct most_channel_config *ccfg)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  449  {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  450  	struct dim2_hdm *dev = iface_to_hdm(most_iface);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  451  	bool const is_tx = ccfg->direction == MOST_CH_TX;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  452  	u16 const sub_size = ccfg->subbuffer_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  453  	u16 const buf_size = ccfg->buffer_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  454  	u16 new_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  455  	unsigned long flags;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  456  	u8 hal_ret;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  457  	int const ch_addr = ch_idx * 2 + 2;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  458  	struct hdm_channel *const hdm_ch = dev->hch + ch_idx;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  459  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  460  	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  461  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  462  	if (hdm_ch->is_initialized)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  463  		return -EPERM;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  464  
dbd36d5772f7e4 drivers/staging/most/dim2/dim2.c         Christian Gromm 2018-05-08  465  	/* do not reset if the property was set by user, see poison_channel */
dbd36d5772f7e4 drivers/staging/most/dim2/dim2.c         Christian Gromm 2018-05-08  466  	hdm_ch->reset_dbr_size = ccfg->dbr_size ? NULL : &ccfg->dbr_size;
dbd36d5772f7e4 drivers/staging/most/dim2/dim2.c         Christian Gromm 2018-05-08  467  
dbd36d5772f7e4 drivers/staging/most/dim2/dim2.c         Christian Gromm 2018-05-08  468  	/* zero value is default dbr_size, see dim2 hal */
dbd36d5772f7e4 drivers/staging/most/dim2/dim2.c         Christian Gromm 2018-05-08  469  	hdm_ch->ch.dbr_size = ccfg->dbr_size;
dbd36d5772f7e4 drivers/staging/most/dim2/dim2.c         Christian Gromm 2018-05-08  470  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  471  	switch (ccfg->data_type) {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  472  	case MOST_CH_CONTROL:
c64c6073e8fe1c drivers/staging/most/hdm-dim2/dim2_hdm.c Chaehyun Lim    2015-11-02  473  		new_size = dim_norm_ctrl_async_buffer_size(buf_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  474  		if (new_size == 0) {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  475  			pr_err("%s: too small buffer size\n", hdm_ch->name);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  476  			return -EINVAL;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  477  		}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  478  		ccfg->buffer_size = new_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  479  		if (new_size != buf_size)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  480  			pr_warn("%s: fixed buffer size (%d -> %d)\n",
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  481  				hdm_ch->name, buf_size, new_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  482  		spin_lock_irqsave(&dim_lock, flags);
a3f3e921194710 drivers/staging/most/hdm-dim2/dim2_hdm.c Chaehyun Lim    2015-11-02  483  		hal_ret = dim_init_control(&hdm_ch->ch, is_tx, ch_addr,
6631c5c9b0c369 drivers/staging/most/hdm-dim2/dim2_hdm.c Andrey Shvetsov 2016-09-15  484  					   is_tx ? new_size * 2 : new_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  485  		break;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  486  	case MOST_CH_ASYNC:
c64c6073e8fe1c drivers/staging/most/hdm-dim2/dim2_hdm.c Chaehyun Lim    2015-11-02  487  		new_size = dim_norm_ctrl_async_buffer_size(buf_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  488  		if (new_size == 0) {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  489  			pr_err("%s: too small buffer size\n", hdm_ch->name);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  490  			return -EINVAL;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  491  		}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  492  		ccfg->buffer_size = new_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  493  		if (new_size != buf_size)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  494  			pr_warn("%s: fixed buffer size (%d -> %d)\n",
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  495  				hdm_ch->name, buf_size, new_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  496  		spin_lock_irqsave(&dim_lock, flags);
6631c5c9b0c369 drivers/staging/most/hdm-dim2/dim2_hdm.c Andrey Shvetsov 2016-09-15  497  		hal_ret = dim_init_async(&hdm_ch->ch, is_tx, ch_addr,
6631c5c9b0c369 drivers/staging/most/hdm-dim2/dim2_hdm.c Andrey Shvetsov 2016-09-15  498  					 is_tx ? new_size * 2 : new_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  499  		break;
0540609fe217c3 drivers/staging/most/hdm-dim2/dim2_hdm.c Andrey Shvetsov 2016-09-21  500  	case MOST_CH_ISOC:
e302ca47b59f02 drivers/staging/most/hdm-dim2/dim2_hdm.c Chaehyun Lim    2015-11-02  501  		new_size = dim_norm_isoc_buffer_size(buf_size, sub_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  502  		if (new_size == 0) {
9158d33a5d38d1 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-10-15  503  			pr_err("%s: invalid sub-buffer size or too small buffer size\n",
9158d33a5d38d1 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-10-15  504  			       hdm_ch->name);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  505  			return -EINVAL;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  506  		}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  507  		ccfg->buffer_size = new_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  508  		if (new_size != buf_size)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  509  			pr_warn("%s: fixed buffer size (%d -> %d)\n",
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  510  				hdm_ch->name, buf_size, new_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  511  		spin_lock_irqsave(&dim_lock, flags);
f1383176c92801 drivers/staging/most/hdm-dim2/dim2_hdm.c Chaehyun Lim    2015-11-02  512  		hal_ret = dim_init_isoc(&hdm_ch->ch, is_tx, ch_addr, sub_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  513  		break;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  514  	case MOST_CH_SYNC:
aff1924508e880 drivers/staging/most/hdm-dim2/dim2_hdm.c Chaehyun Lim    2015-11-02  515  		new_size = dim_norm_sync_buffer_size(buf_size, sub_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  516  		if (new_size == 0) {
9158d33a5d38d1 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-10-15  517  			pr_err("%s: invalid sub-buffer size or too small buffer size\n",
9158d33a5d38d1 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-10-15  518  			       hdm_ch->name);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  519  			return -EINVAL;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  520  		}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  521  		ccfg->buffer_size = new_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  522  		if (new_size != buf_size)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  523  			pr_warn("%s: fixed buffer size (%d -> %d)\n",
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  524  				hdm_ch->name, buf_size, new_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  525  		spin_lock_irqsave(&dim_lock, flags);
10e5efb7b51f30 drivers/staging/most/hdm-dim2/dim2_hdm.c Chaehyun Lim    2015-11-02  526  		hal_ret = dim_init_sync(&hdm_ch->ch, is_tx, ch_addr, sub_size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  527  		break;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  528  	default:
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  529  		pr_err("%s: configure failed, bad channel type: %d\n",
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  530  		       hdm_ch->name, ccfg->data_type);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  531  		return -EINVAL;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  532  	}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  533  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  534  	if (hal_ret != DIM_NO_ERROR) {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24 @535  		spin_unlock_irqrestore(&dim_lock, flags);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  536  		pr_err("%s: configure failed (%d), type: %d, is_tx: %d\n",
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  537  		       hdm_ch->name, hal_ret, ccfg->data_type, (int)is_tx);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  538  		return -ENODEV;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  539  	}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  540  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  541  	hdm_ch->data_type = ccfg->data_type;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  542  	hdm_ch->direction = ccfg->direction;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  543  	hdm_ch->is_initialized = true;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  544  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  545  	if (hdm_ch->data_type == MOST_CH_ASYNC &&
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  546  	    hdm_ch->direction == MOST_CH_TX &&
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  547  	    dev->atx_idx < 0)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  548  		dev->atx_idx = ch_idx;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  549  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  550  	spin_unlock_irqrestore(&dim_lock, flags);
dbd36d5772f7e4 drivers/staging/most/dim2/dim2.c         Christian Gromm 2018-05-08  551  	ccfg->dbr_size = hdm_ch->ch.dbr_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  552  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  553  	return 0;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  554  }
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hdm.c Christian Gromm 2015-07-24  555  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
