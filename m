Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1552745E
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 03:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555081; cv=none; b=KONUMt33IF7hfGz94EQaDs2q0ExuwapnWCqormt4U1hh+adLrjZKonqGv3ywAOjjKN6VRo26JS9EC4jRtQ9XU+pizKFrHoCkpG6vKGN0F4oWPm3tranowS0o4HIel82oOH2NcUCzpEblpAji/nkphzg6ouPPOadqoBV1JvLbxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555081; c=relaxed/simple;
	bh=UqiwwUaefjBrxYb8G98G9WhBYReXqWvsuV9aMq0FXxw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VAeXb5EUV8rkyrGI1HuwVjR3w//WR8Cw66tbWsgnN9miTraNPRgps3dSXPyg41XuYZVHWJA1V4sutr5IWdWlLuRJ/3wa2Ag6BmhdtZO80erg69IizOs/4oPHu2676iyHObQq3JiiQVtsY4gOnoaXLgYpo6ZclT29dXf3d9u2CXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyuO12tv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyuO12tv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778555078; x=1810091078;
  h=date:from:to:cc:subject:message-id;
  bh=UqiwwUaefjBrxYb8G98G9WhBYReXqWvsuV9aMq0FXxw=;
  b=kyuO12tviEWOul4QSH2rX2XoJYcf/py1YOSMyGHXFw8VYVqqCo9tipCW
   h9J/IcaXiiwM4vW7WQdjaFXL4RHY5yOJg0JPKpR+pZ/jIS0L9AWJdxwWl
   NvzOBfWM2C9/4OaKgQ3NPI4TN5ImDFZ8lPjAHDmGsWLqu1koSToRnjgbg
   p+2LnDRipXnA+WvY+hSuSEiQbkqgXxxhxD00BpFE//k4nJL+6jhsFHP8t
   SsWy/IzddVYrPkKlcI46JWjdG7By6dQ1iQcjx+p0ezrruREbGAuQc+g6l
   IjSoC2ZRUKplp40Q448iPTLuGi/xMnRUvuNXBCeUmIeSLCClAqVA8NjHL
   g==;
X-CSE-ConnectionGUID: SCOSgHxCTTOzntN4wXX7Wg==
X-CSE-MsgGUID: MrEf6MpHRoSTXzvYG3Z68Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="82019418"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="82019418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 20:04:37 -0700
X-CSE-ConnectionGUID: +7XnRPjyT46CH2sp33kbrw==
X-CSE-MsgGUID: V+BVIL/HSKGpUoMXuvtmpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="237864386"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 May 2026 20:04:36 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMdQ9-000000001Vd-0VUc;
	Tue, 12 May 2026 03:04:33 +0000
Date: Tue, 12 May 2026 11:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3981/4394]
 drivers/char/ipmi/ipmi_devintf.c:70 ipmi_poll() error: calling
 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202605121005.kZSSeMm3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 52d651087189532bd5b2fa93ac27cedc7209bc6f [3981/4394] lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20260509 (https://download.01.org/0day-ci/archive/20260512/202605121005.kZSSeMm3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605121005.kZSSeMm3-lkp@intel.com/

New smatch warnings:
drivers/char/ipmi/ipmi_devintf.c:70 ipmi_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/ipmi/ipmi_devintf.c:226 handle_recv() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:602 msgdma_chan_desc_cleanup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/dw/core.c:408 dwc_scan_descriptors() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/tifm_7xx1.c:174 tifm_7xx1_switch_media() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/tifm_7xx1.c:267 tifm_7xx1_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/ipmi/ipmi_ipmb.c:302 ipmi_ipmb_thread() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:757 try_queue_bulk_in() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:864 try_queue_bulk_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/hub.c:871 hub_tt_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/hub.c:2223 usb_set_device_state() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/hcd.c:1614 usb_hcd_unlink_urb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/amd/ptdma/ptdma-dmaengine.c:370 pt_cmd_callback_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/message.c:529 sg_complete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/message.c:810 usb_sg_cancel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/mc/mc-request.c:117 media_request_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/mc/mc-request.c:174 media_request_ioctl_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/mc/mc-request.c:222 media_request_ioctl_reinit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-hcd.c:2062 isp1760_urb_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-hcd.c:2134 isp1760_hub_status_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/iova.c:802 __iova_rcache_insert() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/iova.c:852 __iova_rcache_get() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_bin.c:1058 mon_bin_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_bin.c:1218 mon_bin_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_bin.c:1330 mon_bin_wait_event() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/qcom/hidma.c:183 hidma_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/cdc-wdm.c:688 wdm_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/aio.c:1878 aio_poll_wake() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:1617 dwc2_qh_list_free() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:2007 dwc2_hcd_endpoint_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:3325 dwc2_port_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:3370 dwc2_port_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:4287 _dwc2_hcd_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:4388 _dwc2_hcd_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:4495 _dwc2_hcd_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:4767 _dwc2_hcd_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/ulp/ipoib/ipoib_multicast.c:811 ipoib_mcast_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/usbhid/hid-core.c:102 hid_start_in() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/ulp/ipoib/ipoib_main.c:780 ipoib_flush_paths() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ohci-hcd.c:303 ohci_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/via-sdmmc.c:1012 via_sdc_card_detect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/staging/media/ipu3/ipu3-mmu.c:195 imgu_mmu_get_l2pt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/comedi_fops.c:2080 do_lock_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/device.c:2177 add_ndev_hash() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/hw/mthca/mthca_qp.c:1468 mthca_free_qp() warn: sleeping in atomic context
drivers/usb/dwc2/hcd_queue.c:1249 dwc2_unreserve_timer_fn() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/devio.c:682 destroy_async() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/sw/rdmavt/cq.c:68 rvt_cq_enter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/comedi_buf.c:197 comedi_buf_map_from_subdev_get() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/gadget.c:4230 dwc2_hsotg_ep_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/xilinx_sdfec.c:1017 xsdfec_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/mr_pool.c:80 ib_mr_pool_destroy() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/ldusb.c:270 ld_usb_interrupt_in_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_gadget_ep0.c:1046 musb_g_ep0_halt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/vmxnet3/vmxnet3_ethtool.c:370 vmxnet3_enable_encap_offloads() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/vmxnet3/vmxnet3_ethtool.c:410 vmxnet3_disable_encap_offloads() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/vmxnet3/vmxnet3_ethtool.c:1059 vmxnet3_set_rss_hash_opt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/chipidea/otg_fsm.c:282 ci_otg_del_timer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/drm_vblank.c:1233 drm_vblank_get() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/sw/rdmavt/qp.c:2176 rvt_post_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/sw/rdmavt/qp.c:3212 rvt_ruc_loopback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/multicast.c:595 acquire_group() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/sa_query.c:1046 ib_nl_request_timeout() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/sa_query.c:1487 ib_sa_opa_pathrecord_support() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_gadget.c:1078 musb_gadget_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_gadget.c:1260 musb_gadget_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_gadget.c:1405 musb_gadget_set_halt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_gadget.c:1442 musb_gadget_fifo_status() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_gadget.c:1585 musb_gadget_wakeup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/vmxnet3/vmxnet3_drv.c:3755 vmxnet3_declare_features() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/vmxnet3/vmxnet3_drv.c:4104 vmxnet3_probe_device() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/mad.c:2021 process_backlog_mads() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/mad.c:2833 local_completions() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/lan78xx.c:2967 unlink_urbs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/lan78xx.c:4073 rx_submit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:686 pio_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/composite.c:413 usb_function_deactivate() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/composite.c:447 usb_function_activate() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tms9914/tms9914.c:586 pio_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:362 tnt4882_accel_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:1084 ni_isa_attach_common() warn: 'iobase' from __request_region() not released on lines: 1072,1078.
drivers/usb/gadget/configfs.c:1873 configfs_composite_setup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/configfs.c:1896 configfs_composite_disconnect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/configfs.c:1918 configfs_composite_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/configfs.c:1940 configfs_composite_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/configfs.c:1962 configfs_composite_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/wwan/t7xx/t7xx_state_monitor.c:95 fsm_state_notify() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/u_ether.c:248 rx_complete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/u_ether.c:393 rx_fill() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/usbnet.c:562 rx_submit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/usbnet.c:773 unlink_urbs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/usbnet.c:802 wait_skb_queue_empty() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/wwan/t7xx/t7xx_hif_cldma.c:227 t7xx_cldma_gpd_rx_collect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/wwan/t7xx/t7xx_hif_cldma.c:939 t7xx_cldma_send_skb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/iwpm_util.c:137 iwpm_create_mapinfo() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/iwpm_util.c:732 iwpm_send_mapinfo() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/iwpm_util.c:757 iwpm_mapinfo_available() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/dummy_hcd.c:749 dummy_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/iwcm.c:430 destroy_cm_id() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/iwcm.c:591 iw_cm_listen() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/iwcm.c:678 iw_cm_accept() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/iwcm.c:726 iw_cm_connect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/net2280.c:1371 net2280_set_halt_and_wedge() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c:122 t7xx_dpmaif_release_tx_buffer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/pxa27x_udc.c:1899 handle_ep0_ctrl_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/goku_udc.c:922 goku_set_halt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/uvc_video.c:666 uvcg_video_pump() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/cm.c:662 cm_insert_listen() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/cm.c:3951 cm_establish() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/r8a66597-udc.c:1630 r8a66597_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/r8a66597-udc.c:1669 r8a66597_set_halt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_hid.c:349 f_hidg_intout_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_hid.c:410 f_hidg_ssreport_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_hid.c:485 f_hidg_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_hid.c:603 get_report_workqueue_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:521 printer_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:653 printer_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:771 printer_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:808 printer_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/bdc/bdc_ep.c:1788 bdc_gadget_ep_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:946 amdgpu_dm_crtc_handle_crc_window_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/misc/tifm_7xx1.c:190 tifm_7xx1_switch_media() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/tifm_7xx1.c:207 tifm_7xx1_switch_media() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/tifm_7xx1.c:285 tifm_7xx1_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/ipmi/ipmi_ipmb.c:353 ipmi_ipmb_thread() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/ipmi/ipmi_ipmb.c:367 ipmi_ipmb_thread() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/cdc-wdm.c:697 wdm_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:2015 dwc2_hcd_endpoint_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:3329 dwc2_port_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:3376 dwc2_port_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:4402 _dwc2_hcd_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:4501 _dwc2_hcd_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:4520 _dwc2_hcd_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/dwc2/hcd.c:4778 _dwc2_hcd_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/ulp/ipoib/ipoib_main.c:1051 neigh_add_path() warn: missing unwind goto?
drivers/mmc/host/via-sdmmc.c:1019 via_sdc_card_detect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/staging/media/ipu3/ipu3-mmu.c:206 imgu_mmu_get_l2pt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/comedi_fops.c:961 do_bufconfig_ioctl() warn: potential spectre issue 'dev->subdevices' [r] (local cap)
drivers/comedi/comedi_fops.c:1217 do_bufinfo_ioctl() warn: potential spectre issue 'dev->subdevices' [r] (local cap)
drivers/comedi/comedi_fops.c:2314 comedi_unlocked_ioctl() warn: missing error code? 'rc'
drivers/infiniband/core/device.c:723 add_client_context() warn: missing error code 'ret'
drivers/infiniband/sw/rdmavt/cq.c:115 rvt_cq_enter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/chipidea/otg_fsm.c:276 ci_otg_del_timer() error: testing array offset 'next_timer' after use.
drivers/usb/chipidea/otg_fsm.c:410 ci_otg_hrtimer_func() error: testing array offset 'next_timer' after use.
drivers/infiniband/sw/rdmavt/qp.c:1182 rvt_create_qp() warn: missing unwind goto?
drivers/infiniband/core/mad.c:990 ib_get_rmpp_segment() warn: iterator used outside loop: 'mad_send_wr->cur_seg'
drivers/infiniband/core/mad.c:3288 ib_mad_port_open() warn: '&port_priv->port_list' not removed from list
drivers/net/usb/lan78xx.c:2601 lan78xx_set_fixed_link() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2601 lan78xx_set_fixed_link() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2601 lan78xx_set_fixed_link() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:2632 lan78xx_get_phy() warn: format string contains non-ascii character '\xe2'
drivers/net/usb/lan78xx.c:2632 lan78xx_get_phy() warn: format string contains non-ascii character '\x80'
drivers/net/usb/lan78xx.c:2632 lan78xx_get_phy() warn: format string contains non-ascii character '\x93'
drivers/net/usb/lan78xx.c:3149 lan78xx_init_ltm() warn: missing unwind goto?
drivers/usb/gadget/configfs.c:1878 configfs_composite_setup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/configfs.c:1901 configfs_composite_disconnect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/configfs.c:1923 configfs_composite_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/configfs.c:1945 configfs_composite_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/configfs.c:1967 configfs_composite_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/u_ether.c:556 eth_start_xmit() error: we previously assumed 'skb' could be null (see line 494)
drivers/net/wwan/t7xx/t7xx_hif_cldma.c:232 t7xx_cldma_gpd_rx_collect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/wwan/t7xx/t7xx_hif_cldma.c:942 t7xx_cldma_send_skb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/iwcm.c:739 iw_cm_connect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/net2280.c:1376 net2280_set_halt_and_wedge() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/net2280.c:2216 usb_reinit_338x() warn: inconsistent indenting
drivers/usb/gadget/udc/net2280.c:3797 net2280_probe() warn: 'base' from ioremap() not released on lines: 3797.
drivers/usb/gadget/udc/net2280.c:3797 net2280_probe() warn: 'pdev->irq' from request_irq() not released on lines: 3797.
drivers/usb/gadget/udc/net2280.c:3797 net2280_probe() warn: 'resource' from __request_region() not released on lines: 3797.
drivers/usb/gadget/udc/goku_udc.c:1618 goku_irq() error: we previously assumed 'dev->driver' could be null (see line 1607)
drivers/usb/gadget/udc/goku_udc.c:1832 goku_probe() warn: 'base' from ioremap() not released on lines: 1832.
drivers/usb/gadget/udc/goku_udc.c:1832 goku_probe() warn: 'pdev->irq' from request_irq() not released on lines: 1832.
drivers/usb/gadget/udc/goku_udc.c:1832 goku_probe() warn: 'resource' from __request_region() not released on lines: 1832.
drivers/infiniband/core/cm.c:667 cm_insert_listen() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/cm.c:674 cm_insert_listen() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/infiniband/core/cm.c:4465 cm_remove_one() warn: mixing irqsave and irq
drivers/usb/gadget/udc/r8a66597-udc.c:1680 r8a66597_set_wedge() warn: can 'ep' even be NULL?
drivers/usb/gadget/function/f_hid.c:537 f_hidg_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_hid.c:627 get_report_workqueue_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:566 printer_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:577 printer_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:694 printer_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:705 printer_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/bdc/bdc_ep.c:618 bdc_ep_enable() warn: missing error code? 'ret'
drivers/usb/gadget/udc/bdc/bdc_ep.c:1801 bdc_gadget_ep_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +70 drivers/char/ipmi/ipmi_devintf.c

^1da177e4c3f41 Linus Torvalds   2005-04-16   56  
afc9a42b7464f7 Al Viro          2017-07-03   57  static __poll_t ipmi_poll(struct file *file, poll_table *wait)
^1da177e4c3f41 Linus Torvalds   2005-04-16   58  {
^1da177e4c3f41 Linus Torvalds   2005-04-16   59  	struct ipmi_file_private *priv = file->private_data;
afc9a42b7464f7 Al Viro          2017-07-03   60  	__poll_t             mask = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16   61  	unsigned long            flags;
^1da177e4c3f41 Linus Torvalds   2005-04-16   62  
^1da177e4c3f41 Linus Torvalds   2005-04-16   63  	poll_wait(file, &priv->wait, wait);
^1da177e4c3f41 Linus Torvalds   2005-04-16   64  
^1da177e4c3f41 Linus Torvalds   2005-04-16   65  	spin_lock_irqsave(&priv->recv_msg_lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16   66  
c81c5fc2128e3a Corey Minyard    2018-04-03   67  	if (!list_empty(&priv->recv_msgs))
a9a08845e9acbd Linus Torvalds   2018-02-11   68  		mask |= (EPOLLIN | EPOLLRDNORM);
^1da177e4c3f41 Linus Torvalds   2005-04-16   69  
^1da177e4c3f41 Linus Torvalds   2005-04-16  @70  	spin_unlock_irqrestore(&priv->recv_msg_lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16   71  
^1da177e4c3f41 Linus Torvalds   2005-04-16   72  	return mask;
^1da177e4c3f41 Linus Torvalds   2005-04-16   73  }
^1da177e4c3f41 Linus Torvalds   2005-04-16   74  
^1da177e4c3f41 Linus Torvalds   2005-04-16   75  static int ipmi_fasync(int fd, struct file *file, int on)
^1da177e4c3f41 Linus Torvalds   2005-04-16   76  {
^1da177e4c3f41 Linus Torvalds   2005-04-16   77  	struct ipmi_file_private *priv = file->private_data;
^1da177e4c3f41 Linus Torvalds   2005-04-16   78  
6aa2dd0092d276 Corey Minyard    2018-04-05   79  	return fasync_helper(fd, file, on, &priv->fasync_queue);
^1da177e4c3f41 Linus Torvalds   2005-04-16   80  }
^1da177e4c3f41 Linus Torvalds   2005-04-16   81  
210af2a5f12403 Corey Minyard    2017-01-05   82  static const struct ipmi_user_hndl ipmi_hndlrs =
^1da177e4c3f41 Linus Torvalds   2005-04-16   83  {
^1da177e4c3f41 Linus Torvalds   2005-04-16   84  	.ipmi_recv_hndl	= file_receive_handler,
^1da177e4c3f41 Linus Torvalds   2005-04-16   85  };
^1da177e4c3f41 Linus Torvalds   2005-04-16   86  
^1da177e4c3f41 Linus Torvalds   2005-04-16   87  static int ipmi_open(struct inode *inode, struct file *file)
^1da177e4c3f41 Linus Torvalds   2005-04-16   88  {
^1da177e4c3f41 Linus Torvalds   2005-04-16   89  	int                      if_num = iminor(inode);
^1da177e4c3f41 Linus Torvalds   2005-04-16   90  	int                      rv;
^1da177e4c3f41 Linus Torvalds   2005-04-16   91  	struct ipmi_file_private *priv;
^1da177e4c3f41 Linus Torvalds   2005-04-16   92  
bf4afc53b77aea Linus Torvalds   2026-02-21   93  	priv = kmalloc_obj(*priv);
^1da177e4c3f41 Linus Torvalds   2005-04-16   94  	if (!priv)
^1da177e4c3f41 Linus Torvalds   2005-04-16   95  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds   2005-04-16   96  
^1da177e4c3f41 Linus Torvalds   2005-04-16   97  	rv = ipmi_create_user(if_num,
^1da177e4c3f41 Linus Torvalds   2005-04-16   98  			      &ipmi_hndlrs,
^1da177e4c3f41 Linus Torvalds   2005-04-16   99  			      priv,
c81c5fc2128e3a Corey Minyard    2018-04-03  100  			      &priv->user);
^1da177e4c3f41 Linus Torvalds   2005-04-16  101  	if (rv) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  102  		kfree(priv);
ecc38983f6c83f Jonathan Corbet  2008-05-15  103  		goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  104  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  105  
^1da177e4c3f41 Linus Torvalds   2005-04-16  106  	file->private_data = priv;
^1da177e4c3f41 Linus Torvalds   2005-04-16  107  
c81c5fc2128e3a Corey Minyard    2018-04-03  108  	spin_lock_init(&priv->recv_msg_lock);
c81c5fc2128e3a Corey Minyard    2018-04-03  109  	INIT_LIST_HEAD(&priv->recv_msgs);
^1da177e4c3f41 Linus Torvalds   2005-04-16  110  	init_waitqueue_head(&priv->wait);
^1da177e4c3f41 Linus Torvalds   2005-04-16  111  	priv->fasync_queue = NULL;
d6dfd1310d3562 Corey Minyard    2006-03-31  112  	mutex_init(&priv->recv_mutex);
^1da177e4c3f41 Linus Torvalds   2005-04-16  113  
^1da177e4c3f41 Linus Torvalds   2005-04-16  114  	/* Use the low-level defaults. */
^1da177e4c3f41 Linus Torvalds   2005-04-16  115  	priv->default_retries = -1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  116  	priv->default_retry_time_ms = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  117  
ecc38983f6c83f Jonathan Corbet  2008-05-15  118  out:
ecc38983f6c83f Jonathan Corbet  2008-05-15  119  	return rv;
^1da177e4c3f41 Linus Torvalds   2005-04-16  120  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  121  
^1da177e4c3f41 Linus Torvalds   2005-04-16  122  static int ipmi_release(struct inode *inode, struct file *file)
^1da177e4c3f41 Linus Torvalds   2005-04-16  123  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  124  	struct ipmi_file_private *priv = file->private_data;
bdf2829cb673af Nicholas Krause  2015-01-31  125  	struct ipmi_recv_msg *msg, *next;
^1da177e4c3f41 Linus Torvalds   2005-04-16  126  
9b6442a3bdd7e0 Vitaliy Shevtsov 2024-12-25  127  	ipmi_destroy_user(priv->user);
^1da177e4c3f41 Linus Torvalds   2005-04-16  128  
bdf2829cb673af Nicholas Krause  2015-01-31  129  	list_for_each_entry_safe(msg, next, &priv->recv_msgs, link)
bdf2829cb673af Nicholas Krause  2015-01-31  130  		ipmi_free_recv_msg(msg);
bdf2829cb673af Nicholas Krause  2015-01-31  131  
^1da177e4c3f41 Linus Torvalds   2005-04-16  132  	kfree(priv);
^1da177e4c3f41 Linus Torvalds   2005-04-16  133  
^1da177e4c3f41 Linus Torvalds   2005-04-16  134  	return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  135  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  136  
2911c9886c8d54 Corey Minyard    2018-04-05  137  static int handle_send_req(struct ipmi_user *user,
^1da177e4c3f41 Linus Torvalds   2005-04-16  138  			   struct ipmi_req *req,
^1da177e4c3f41 Linus Torvalds   2005-04-16  139  			   int             retries,
^1da177e4c3f41 Linus Torvalds   2005-04-16  140  			   unsigned int    retry_time_ms)
^1da177e4c3f41 Linus Torvalds   2005-04-16  141  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  142  	int              rv;
^1da177e4c3f41 Linus Torvalds   2005-04-16  143  	struct ipmi_addr addr;
^1da177e4c3f41 Linus Torvalds   2005-04-16  144  	struct kernel_ipmi_msg msg;
^1da177e4c3f41 Linus Torvalds   2005-04-16  145  
^1da177e4c3f41 Linus Torvalds   2005-04-16  146  	if (req->addr_len > sizeof(struct ipmi_addr))
^1da177e4c3f41 Linus Torvalds   2005-04-16  147  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  148  
^1da177e4c3f41 Linus Torvalds   2005-04-16  149  	if (copy_from_user(&addr, req->addr, req->addr_len))
^1da177e4c3f41 Linus Torvalds   2005-04-16  150  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  151  
^1da177e4c3f41 Linus Torvalds   2005-04-16  152  	msg.netfn = req->msg.netfn;
^1da177e4c3f41 Linus Torvalds   2005-04-16  153  	msg.cmd = req->msg.cmd;
^1da177e4c3f41 Linus Torvalds   2005-04-16  154  	msg.data_len = req->msg.data_len;
^1da177e4c3f41 Linus Torvalds   2005-04-16  155  	msg.data = kmalloc(IPMI_MAX_MSG_LENGTH, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds   2005-04-16  156  	if (!msg.data)
^1da177e4c3f41 Linus Torvalds   2005-04-16  157  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds   2005-04-16  158  
^1da177e4c3f41 Linus Torvalds   2005-04-16  159  	/* From here out we cannot return, we must jump to "out" for
^1da177e4c3f41 Linus Torvalds   2005-04-16  160  	   error exits to free msgdata. */
^1da177e4c3f41 Linus Torvalds   2005-04-16  161  
^1da177e4c3f41 Linus Torvalds   2005-04-16  162  	rv = ipmi_validate_addr(&addr, req->addr_len);
^1da177e4c3f41 Linus Torvalds   2005-04-16  163  	if (rv)
^1da177e4c3f41 Linus Torvalds   2005-04-16  164  		goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  165  
^1da177e4c3f41 Linus Torvalds   2005-04-16  166  	if (req->msg.data != NULL) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  167  		if (req->msg.data_len > IPMI_MAX_MSG_LENGTH) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  168  			rv = -EMSGSIZE;
^1da177e4c3f41 Linus Torvalds   2005-04-16  169  			goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  170  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  171  
^1da177e4c3f41 Linus Torvalds   2005-04-16  172  		if (copy_from_user(msg.data,
^1da177e4c3f41 Linus Torvalds   2005-04-16  173  				   req->msg.data,
c81c5fc2128e3a Corey Minyard    2018-04-03  174  				   req->msg.data_len)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  175  			rv = -EFAULT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  176  			goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  177  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  178  	} else {
^1da177e4c3f41 Linus Torvalds   2005-04-16  179  		msg.data_len = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  180  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  181  
^1da177e4c3f41 Linus Torvalds   2005-04-16  182  	rv = ipmi_request_settime(user,
^1da177e4c3f41 Linus Torvalds   2005-04-16  183  				  &addr,
^1da177e4c3f41 Linus Torvalds   2005-04-16  184  				  req->msgid,
^1da177e4c3f41 Linus Torvalds   2005-04-16  185  				  &msg,
^1da177e4c3f41 Linus Torvalds   2005-04-16  186  				  NULL,
^1da177e4c3f41 Linus Torvalds   2005-04-16  187  				  0,
^1da177e4c3f41 Linus Torvalds   2005-04-16  188  				  retries,
^1da177e4c3f41 Linus Torvalds   2005-04-16  189  				  retry_time_ms);
^1da177e4c3f41 Linus Torvalds   2005-04-16  190   out:
^1da177e4c3f41 Linus Torvalds   2005-04-16  191  	kfree(msg.data);
^1da177e4c3f41 Linus Torvalds   2005-04-16  192  	return rv;
^1da177e4c3f41 Linus Torvalds   2005-04-16  193  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  194  
8b9e04f282c767 Al Viro          2017-06-26  195  static int handle_recv(struct ipmi_file_private *priv,
8b9e04f282c767 Al Viro          2017-06-26  196  			bool trunc, struct ipmi_recv *rsp,
8b9e04f282c767 Al Viro          2017-06-26  197  			int (*copyout)(struct ipmi_recv *, void __user *),
8b9e04f282c767 Al Viro          2017-06-26  198  			void __user *to)
^1da177e4c3f41 Linus Torvalds   2005-04-16  199  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  200  	int              addr_len;
^1da177e4c3f41 Linus Torvalds   2005-04-16  201  	struct list_head *entry;
^1da177e4c3f41 Linus Torvalds   2005-04-16  202  	struct ipmi_recv_msg  *msg;
^1da177e4c3f41 Linus Torvalds   2005-04-16  203  	unsigned long    flags;
95ac0daa0ca98a Corey Minyard    2018-11-16  204  	int rv = 0, rv2 = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  205  
d6dfd1310d3562 Corey Minyard    2006-03-31  206  	/* We claim a mutex because we don't want two
^1da177e4c3f41 Linus Torvalds   2005-04-16  207  	   users getting something from the queue at a time.
^1da177e4c3f41 Linus Torvalds   2005-04-16  208  	   Since we have to release the spinlock before we can
^1da177e4c3f41 Linus Torvalds   2005-04-16  209  	   copy the data to the user, it's possible another
^1da177e4c3f41 Linus Torvalds   2005-04-16  210  	   user will grab something from the queue, too.  Then
^1da177e4c3f41 Linus Torvalds   2005-04-16  211  	   the messages might get out of order if something
^1da177e4c3f41 Linus Torvalds   2005-04-16  212  	   fails and the message gets put back onto the
d6dfd1310d3562 Corey Minyard    2006-03-31  213  	   queue.  This mutex prevents that problem. */
d6dfd1310d3562 Corey Minyard    2006-03-31  214  	mutex_lock(&priv->recv_mutex);
^1da177e4c3f41 Linus Torvalds   2005-04-16  215  
^1da177e4c3f41 Linus Torvalds   2005-04-16  216  	/* Grab the message off the list. */
c81c5fc2128e3a Corey Minyard    2018-04-03  217  	spin_lock_irqsave(&priv->recv_msg_lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16  218  	if (list_empty(&(priv->recv_msgs))) {
c81c5fc2128e3a Corey Minyard    2018-04-03  219  		spin_unlock_irqrestore(&priv->recv_msg_lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16  220  		rv = -EAGAIN;
^1da177e4c3f41 Linus Torvalds   2005-04-16  221  		goto recv_err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  222  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  223  	entry = priv->recv_msgs.next;
^1da177e4c3f41 Linus Torvalds   2005-04-16  224  	msg = list_entry(entry, struct ipmi_recv_msg, link);
^1da177e4c3f41 Linus Torvalds   2005-04-16  225  	list_del(entry);
c81c5fc2128e3a Corey Minyard    2018-04-03 @226  	spin_unlock_irqrestore(&priv->recv_msg_lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16  227  
^1da177e4c3f41 Linus Torvalds   2005-04-16  228  	addr_len = ipmi_addr_length(msg->addr.addr_type);
c81c5fc2128e3a Corey Minyard    2018-04-03  229  	if (rsp->addr_len < addr_len) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  230  		rv = -EINVAL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  231  		goto recv_putback_on_err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  232  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  233  
c81c5fc2128e3a Corey Minyard    2018-04-03  234  	if (copy_to_user(rsp->addr, &msg->addr, addr_len)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  235  		rv = -EFAULT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  236  		goto recv_putback_on_err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  237  	}
8b9e04f282c767 Al Viro          2017-06-26  238  	rsp->addr_len = addr_len;
^1da177e4c3f41 Linus Torvalds   2005-04-16  239  
8b9e04f282c767 Al Viro          2017-06-26  240  	rsp->recv_type = msg->recv_type;
8b9e04f282c767 Al Viro          2017-06-26  241  	rsp->msgid = msg->msgid;
8b9e04f282c767 Al Viro          2017-06-26  242  	rsp->msg.netfn = msg->msg.netfn;
8b9e04f282c767 Al Viro          2017-06-26  243  	rsp->msg.cmd = msg->msg.cmd;
^1da177e4c3f41 Linus Torvalds   2005-04-16  244  
^1da177e4c3f41 Linus Torvalds   2005-04-16  245  	if (msg->msg.data_len > 0) {
8b9e04f282c767 Al Viro          2017-06-26  246  		if (rsp->msg.data_len < msg->msg.data_len) {
17a4262799fa74 Corey Minyard    2021-09-30  247  			if (trunc) {
95ac0daa0ca98a Corey Minyard    2018-11-16  248  				rv2 = -EMSGSIZE;
8b9e04f282c767 Al Viro          2017-06-26  249  				msg->msg.data_len = rsp->msg.data_len;
17a4262799fa74 Corey Minyard    2021-09-30  250  			} else {
17a4262799fa74 Corey Minyard    2021-09-30  251  				rv = -EMSGSIZE;
^1da177e4c3f41 Linus Torvalds   2005-04-16  252  				goto recv_putback_on_err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  253  			}
17a4262799fa74 Corey Minyard    2021-09-30  254  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  255  
8b9e04f282c767 Al Viro          2017-06-26  256  		if (copy_to_user(rsp->msg.data,
^1da177e4c3f41 Linus Torvalds   2005-04-16  257  				 msg->msg.data,
c81c5fc2128e3a Corey Minyard    2018-04-03  258  				 msg->msg.data_len)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  259  			rv = -EFAULT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  260  			goto recv_putback_on_err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  261  		}
8b9e04f282c767 Al Viro          2017-06-26  262  		rsp->msg.data_len = msg->msg.data_len;
^1da177e4c3f41 Linus Torvalds   2005-04-16  263  	} else {
8b9e04f282c767 Al Viro          2017-06-26  264  		rsp->msg.data_len = 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  265  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  266  
8b9e04f282c767 Al Viro          2017-06-26  267  	rv = copyout(rsp, to);
8b9e04f282c767 Al Viro          2017-06-26  268  	if (rv)
^1da177e4c3f41 Linus Torvalds   2005-04-16  269  		goto recv_putback_on_err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  270  
d6dfd1310d3562 Corey Minyard    2006-03-31  271  	mutex_unlock(&priv->recv_mutex);
^1da177e4c3f41 Linus Torvalds   2005-04-16  272  	ipmi_free_recv_msg(msg);
95ac0daa0ca98a Corey Minyard    2018-11-16  273  	return rv2;
^1da177e4c3f41 Linus Torvalds   2005-04-16  274  
^1da177e4c3f41 Linus Torvalds   2005-04-16  275  recv_putback_on_err:
^1da177e4c3f41 Linus Torvalds   2005-04-16  276  	/* If we got an error, put the message back onto
^1da177e4c3f41 Linus Torvalds   2005-04-16  277  	   the head of the queue. */
c81c5fc2128e3a Corey Minyard    2018-04-03  278  	spin_lock_irqsave(&priv->recv_msg_lock, flags);
c81c5fc2128e3a Corey Minyard    2018-04-03  279  	list_add(entry, &priv->recv_msgs);
c81c5fc2128e3a Corey Minyard    2018-04-03  280  	spin_unlock_irqrestore(&priv->recv_msg_lock, flags);
8b9e04f282c767 Al Viro          2017-06-26  281  recv_err:
d6dfd1310d3562 Corey Minyard    2006-03-31  282  	mutex_unlock(&priv->recv_mutex);
8b9e04f282c767 Al Viro          2017-06-26  283  	return rv;
8b9e04f282c767 Al Viro          2017-06-26  284  }
8b9e04f282c767 Al Viro          2017-06-26  285  

:::::: The code at line 70 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
