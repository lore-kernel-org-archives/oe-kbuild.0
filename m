Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EFA34389B
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780164317; cv=none; b=ID30ib6GEpRYU9LvQ55bIYzwHlIak3RvHTV9hRTetnOJT9DY2CqelsfgHtZYoEf9YMiKt3KPEPpBPELKj2nGiuybg/WLe+L6Q11VSCgxq6RMMfl3xumU/iT5L5VD0YxpE0bcD6kWtVJXPvB0HK6MK/Z8WOptAue1zMF/uUbmVow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780164317; c=relaxed/simple;
	bh=dsO+/aHJFbcTy+fIOAC2IyJuI+eqKmz6PHEcvXGlwdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Dwfr+0QOZTtZBDC+6U2RnGBNkNM89/Kk2vrf+JbKKCCllPK53hTVIfrpfvhrzMVdpVMWz1k5JgWfAEdj50waugJxKWA5BotHgSWqvv8zZlp+C9bGzGyTxb8sgwSiHF1U51PdEh96BhQgK1UXUxhwL7B8g65MZ1CI1TV5DnDT8nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpyh8GxC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpyh8GxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780164316; x=1811700316;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dsO+/aHJFbcTy+fIOAC2IyJuI+eqKmz6PHEcvXGlwdk=;
  b=hpyh8GxCqemceNVB5ii3U++CFNeQjBNKi+tOLSXpkeEOC/yeUC8LID3I
   e1vbA9+eZtJqkSW5oLHKU1ZTeEc2AJRH2yel5jWYYP1xw4bO/7kDmTk0M
   f1HY3PezvZZBPVNcVR1hlBrw5Lv3R8xyum+FkKKgrIpJ/M8asPJQ9sTss
   M+z7k2KKCfnnW+EQAoVExHaQvfx/3sOvgsPFwSznV9jKhZTyYpl4JeZoc
   gk3lq5QaPrR5Ynp8eFtFQ3ZfS0DdGtGewvtBISM4C2caJDroU+EVNFf0j
   CyT6Jwkq/kU5ZHAwG8vuqq4PgoaSmWlNgebY/3aICyNtXkz76IIn6SU+e
   w==;
X-CSE-ConnectionGUID: NZJIbxKyRfKkGYWregEriA==
X-CSE-MsgGUID: WaxastGRQsaU+6nxk2nIwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="81095340"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="81095340"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 11:05:15 -0700
X-CSE-ConnectionGUID: 3Be579+NQESwQ3QSEomtrw==
X-CSE-MsgGUID: LqzAZPH3Ry2ysP5+r26RaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="266779658"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2026 11:05:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTO3b-000000008m6-1jme;
	Sat, 30 May 2026 18:05:11 +0000
Date: Sun, 31 May 2026 02:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7226/9870] net/rfkill/core.c:377
 rfkill_set_block() error: calling 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202605310141.cegdaMTw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 888c290a0240da1ce1a4d69beafe44f9abec93c0 [7226/9870] lib/Kconfig.de=
bug: enable CONFIG_PREEMPT_RT for syzbot kernels.
:::::: branch date: 18 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20260529 (https://download.01.org/0day-ci/arc=
hive/20260531/202605310141.cegdaMTw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605310141.cegdaMTw-lkp@intel.com/

New smatch warnings:
net/rfkill/core.c:377 rfkill_set_block() error: calling 'spin_unlock_irqres=
tore()' with bogus flags
drivers/leds/leds-wm831x-status.c:59 wm831x_status_set() error: calling 'sp=
in_unlock_irqrestore()' with bogus flags
drivers/dma/xilinx/xilinx_dma.c:1113 xilinx_dma_chan_desc_cleanup() error: =
calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/sata_qstor.c:433 qs_intr() error: calling 'spin_unlock_irqresto=
re()' with bogus flags
drivers/block/aoe/aoeblk.c:431 aoeblk_gdalloc() error: calling 'spin_unlock=
_irqrestore()' with bogus flags
drivers/block/aoe/aoechr.c:254 aoechr_read() error: calling 'spin_unlock_ir=
qrestore()' with bogus flags
drivers/block/aoe/aoecmd.c:1299 ktcomplete() error: calling 'spin_unlock_ir=
qrestore()' with bogus flags
drivers/i3c/master/i3c-master-cdns.c:1450 cdns_i3c_master_enable_ibi() erro=
r: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/block/aoe/aoedev.c:96 minor_get_static() error: calling 'spin_unloc=
k_irqrestore()' with bogus flags
drivers/block/aoe/aoedev.c:306 freedev() error: calling 'spin_unlock_irqres=
tore()' with bogus flags
drivers/block/aoe/aoedev.c:376 flush() error: calling 'spin_unlock_irqresto=
re()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:918 alua_rtpg_work() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/rtc/rtc-cmos.c:780 rtc_handler() error: calling 'spin_unlock_irqres=
tore()' with bogus flags
drivers/ptp/ptp_ines.c:652 ines_txtstamp() error: calling 'spin_unlock_irqr=
estore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:994 isp1760_ep_dequeue() error: calling '=
spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1586 isp1760_udc_register() warn: 'irq' f=
rom request_irq() not released on lines: 1586.
drivers/usb/host/isp116x-hcd.c:829 isp116x_urb_enqueue() error: calling 'sp=
in_unlock_irqrestore()' with bogus flags
drivers/usb/host/isp116x-hcd.c:1242 isp116x_sw_reset() error: calling 'spin=
_unlock_irqrestore()' with bogus flags
drivers/usb/c67x00/c67x00-sched.c:330 c67x00_endpoint_disable() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/hso.c:605 get_serial_by_index() error: calling 'spin_unlock=
_irqrestore()' with bogus flags
drivers/net/usb/r8152.c:3137 rx_bottom() error: calling 'spin_unlock_irqres=
tore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:404 digi_write_oob_command() error: ca=
lling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:484 digi_write_inb_command() error: ca=
lling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:553 digi_set_modem_signals() error: ca=
lling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:604 digi_transmit_idle() error: callin=
g 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:641 digi_rx_unthrottle() error: callin=
g 'spin_unlock_irqrestore()' with bogus flags
drivers/memstick/core/mspro_block.c:734 mspro_block_stop() error: calling '=
spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/io_edgeport.c:1487 get_lsr_info() error: calling 'spin_u=
nlock_irqrestore()' with bogus flags
drivers/usb/host/max3421-hcd.c:796 max3421_check_unlink() error: calling 's=
pin_unlock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:4437 ufshcd_uic_pwr_ctrl() error: calling 'spin_u=
nlock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:4546 ufshcd_link_recovery() error: calling 'spin_=
unlock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:5514 ufshcd_sdev_destroy() error: calling 'spin_u=
nlock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:6593 ufshcd_quirk_dl_nac_errors() error: calling =
'spin_unlock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:6914 ufshcd_err_handler() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:7472 __ufshcd_issue_tm_cmd() error: calling 'spin=
_unlock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:8160 ufshcd_reset_and_restore() error: calling 's=
pin_unlock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:8230 ufshcd_eh_host_reset_handler() error: callin=
g 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/usbip_event.c:183 usbip_event_happened() error: calling '=
spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/keyspan_pda.c:513 keyspan_pda_write_start() error: calli=
ng 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_rx.c:191 vhci_priv_tx_empty() error: calling 'spin_u=
nlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:830 vhci_urb_enqueue() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:976 vhci_urb_dequeue() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:1022 vhci_cleanup_unlink_list() error: calling=
 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:1311 vhci_bus_resume() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/usb/gadget/function/u_serial.c:779 gs_write() error: calling 'spin_=
unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/u_serial.c:822 gs_flush_chars() error: calling =
'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/u_serial.c:1511 gserial_suspend() error: callin=
g 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vudc_tx.c:216 v_send_ret() error: calling 'spin_unlock_ir=
qrestore()' with bogus flags
drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:321 komeda_crtc_flush_and_=
wait_for_flip_done() error: calling 'spin_unlock_irqrestore()' with bogus f=
lags
drivers/gpib/eastwood/fluke_gpib.c:669 fluke_dma_read() error: calling 'spi=
n_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:1065 fluke_attach_impl() warn: 'e_priv->=
write_transfer_counter' from ioremap() not released on lines: 1044,1050.
drivers/gpib/eastwood/fluke_gpib.c:1065 fluke_attach_impl() warn: 'nec_priv=
->mmiobase' from ioremap() not released on lines: 1011,1017,1024,1031,1039,=
1044,1050.
drivers/gpib/eastwood/fluke_gpib.c:1065 fluke_attach_impl() warn: 'res->sta=
rt' from __request_region() not released on lines: 1005,1011,1017,1024,1031=
,1039,1044,1050.
drivers/usb/gadget/udc/pch_udc.c:1188 pch_udc_pcd_pullup() error: calling '=
spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/pch_udc.c:611 pch_udc_vbus_session() error: calling =
'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/pch_udc.c:1842 pch_udc_pcd_queue() error: calling 's=
pin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:359 gadget_setup() error: calling 's=
pin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:563 raw_ioctl_init() error: calling =
'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:594 raw_ioctl_run() error: calling '=
spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:726 raw_process_ep0_io() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:836 raw_ioctl_ep0_stall() error: cal=
ling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:916 raw_ioctl_ep_enable() error: cal=
ling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:959 raw_ioctl_ep_disable() error: ca=
lling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:1038 raw_ioctl_ep_set_clear_halt_wed=
ge() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:1112 raw_process_ep_io() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:1203 raw_ioctl_configure() error: ca=
lling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:1226 raw_ioctl_vbus_draw() error: ca=
lling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:1264 raw_ioctl_eps_info() error: cal=
ling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/dm-raid1.c:138 queue_bio() error: calling 'spin_unlock_irqrestor=
e()' with bogus flags
drivers/md/dm-raid1.c:650 write_callback() error: calling 'spin_unlock_irqr=
estore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1403 xudc_start() error: calling 'spin_=
unlock_irqrestore()' with bogus flags
drivers/md/dm-region-hash.c:436 dm_rh_mark_nosync() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_fs.c:4091 ffs_func_unbind() error: calling 's=
pin_unlock_irqrestore()' with bogus flags
drivers/md/dm-clone-metadata.c:862 dm_clone_set_region_hydrated() error: ca=
lling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_tiocmd.c:91 ni_tio_input_inttrig() error: calling=
 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_tiocmd.c:228 ni_tio_cmd() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_tiocmd.c:378 should_ack_gate() error: calling 'sp=
in_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_mio_common.c:1508 ni_ao_setup_MITE_dma() error: c=
alling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_mio_common.c:3653 ni_cdo_inttrig() error: calling=
 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/dma/xilinx/xilinx_dma.c:3097 xilinx_dma_chan_probe() warn: 'chan->i=
rq' from request_irq() not released on lines: 3094.
drivers/block/aoe/aoedev.c:399 flush() error: calling 'spin_unlock_irqresto=
re()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:941 alua_rtpg_work() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:949 alua_rtpg_work() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:956 alua_rtpg_work() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:969 alua_rtpg_work() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:982 alua_rtpg_work() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/hso.c:1390 hso_serial_set_termios() error: we previously as=
sumed 'old' could be null (see line 1380)
drivers/net/usb/r8152.c:10026 rtl8152_probe_once() warn: missing error code=
 'ret'
drivers/usb/serial/io_edgeport.c:2360 change_port_settings() warn: inconsis=
tent indenting
drivers/ufs/core/ufshcd.c:6946 ufshcd_err_handler() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:6956 ufshcd_err_handler() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:6970 ufshcd_err_handler() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:6994 ufshcd_err_handler() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:7020 ufshcd_err_handler() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:8187 ufshcd_reset_and_restore() error: calling 's=
pin_unlock_irqrestore()' with bogus flags
drivers/ufs/core/ufshcd.c:9763 ufshcd_setup_clocks() warn: 'clki->clk' from=
 clk_prepare_enable() not released on lines: 9742.
drivers/usb/usbip/vhci_hcd.c:845 vhci_urb_enqueue() error: calling 'spin_un=
lock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:794 vhci_urb_enqueue() warn: missing error cod=
e 'ret'
drivers/usb/gadget/function/u_serial.c:348 gs_start_rx() warn: variable der=
eferenced before check 'port->port_usb' (see line 313)
drivers/usb/gadget/function/u_serial.c:580 gs_start_io() warn: variable der=
eferenced before check 'port->port_usb' (see line 547)
drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:162 komeda_crtc_prepare() =
warn: 'mdev->aclk' from clk_prepare_enable() not released on lines: 162.
drivers/gpib/eastwood/fluke_gpib.c:1065 fluke_attach_impl() warn: 'res->sta=
rt' from __request_region() not released on lines: 1024,1031,1039,1044,1050.
drivers/gpib/eastwood/fluke_gpib.c:1065 fluke_attach_impl() warn: 'res->sta=
rt' from __request_region() not released on lines: 1039,1044,1050.
drivers/usb/gadget/udc/pch_udc.c:1838 pch_udc_pcd_queue() warn: can 'req' e=
ven be NULL?
drivers/usb/gadget/legacy/raw_gadget.c:367 gadget_setup() error: calling 's=
pin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:567 raw_ioctl_init() error: calling =
'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:611 raw_ioctl_run() error: calling '=
spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:754 raw_process_ep0_io() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:970 raw_ioctl_ep_disable() error: ca=
lling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:1140 raw_process_ep_io() error: call=
ing 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:1270 raw_ioctl_eps_info() error: cal=
ling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/legacy/raw_gadget.c:1283 raw_ioctl_eps_info() error: cal=
ling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_fs.c:1063 ffs_epfile_io() warn: 'ep' can also=
 be NULL
drivers/usb/gadget/function/f_fs.c:1086 ffs_epfile_io() warn: 'ep' can also=
 be NULL
drivers/usb/gadget/function/f_fs.c:1106 ffs_epfile_io() warn: 'ep' can also=
 be NULL
drivers/usb/gadget/function/f_fs.c:1155 ffs_epfile_io() warn: 'ep' can also=
 be NULL
drivers/usb/gadget/function/f_fs.c:1671 ffs_dmabuf_transfer() warn: 'ep' ca=
n also be NULL
drivers/comedi/drivers/ni_pcimio.c:1388 pcimio_auto_attach() warn: 'pcidev-=
>irq' from request_irq() not released on lines: 1380.

vim +377 net/rfkill/core.c

19d337dff95cbf Johannes Berg         2009-06-02  317 =20
19d337dff95cbf Johannes Berg         2009-06-02  318  /**
19d337dff95cbf Johannes Berg         2009-06-02  319   * rfkill_set_block -=
 wrapper for set_block method
19d337dff95cbf Johannes Berg         2009-06-02  320   *
19d337dff95cbf Johannes Berg         2009-06-02  321   * @rfkill: the rfkil=
l struct to use
19d337dff95cbf Johannes Berg         2009-06-02  322   * @blocked: the new =
software state
19d337dff95cbf Johannes Berg         2009-06-02  323   *
19d337dff95cbf Johannes Berg         2009-06-02  324   * Calls the set_bloc=
k method (when applicable) and handles notifications
19d337dff95cbf Johannes Berg         2009-06-02  325   * etc. as well.
19d337dff95cbf Johannes Berg         2009-06-02  326   */
19d337dff95cbf Johannes Berg         2009-06-02  327  static void rfkill_se=
t_block(struct rfkill *rfkill, bool blocked)
19d337dff95cbf Johannes Berg         2009-06-02  328  {
19d337dff95cbf Johannes Berg         2009-06-02  329  	unsigned long flags;
eab48345c2b2d7 Vitaly Wool           2012-09-06  330  	bool prev, curr;
19d337dff95cbf Johannes Berg         2009-06-02  331  	int err;
19d337dff95cbf Johannes Berg         2009-06-02  332 =20
7fa20a7f60df0a Alan Jenkins          2009-06-16  333  	if (unlikely(rfkill-=
>dev.power.power_state.event & PM_EVENT_SLEEP))
7fa20a7f60df0a Alan Jenkins          2009-06-16  334  		return;
7fa20a7f60df0a Alan Jenkins          2009-06-16  335 =20
19d337dff95cbf Johannes Berg         2009-06-02  336  	/*
19d337dff95cbf Johannes Berg         2009-06-02  337  	 * Some platforms (.=
..!) generate input events which affect the
19d337dff95cbf Johannes Berg         2009-06-02  338  	 * _hard_ kill state=
 -- whenever something tries to change the
19d337dff95cbf Johannes Berg         2009-06-02  339  	 * current software =
state query the hardware state too.
19d337dff95cbf Johannes Berg         2009-06-02  340  	 */
19d337dff95cbf Johannes Berg         2009-06-02  341  	if (rfkill->ops->que=
ry)
19d337dff95cbf Johannes Berg         2009-06-02  342  		rfkill->ops->query(=
rfkill, rfkill->data);
19d337dff95cbf Johannes Berg         2009-06-02  343 =20
19d337dff95cbf Johannes Berg         2009-06-02  344  	spin_lock_irqsave(&r=
fkill->lock, flags);
eab48345c2b2d7 Vitaly Wool           2012-09-06  345  	prev =3D rfkill->sta=
te & RFKILL_BLOCK_SW;
eab48345c2b2d7 Vitaly Wool           2012-09-06  346 =20
f3e7fae248224b Jo=C3=A3o Paulo Rechi Vita 2016-01-19  347  	if (prev)
19d337dff95cbf Johannes Berg         2009-06-02  348  		rfkill->state |=3D =
RFKILL_BLOCK_SW_PREV;
19d337dff95cbf Johannes Berg         2009-06-02  349  	else
19d337dff95cbf Johannes Berg         2009-06-02  350  		rfkill->state &=3D =
~RFKILL_BLOCK_SW_PREV;
19d337dff95cbf Johannes Berg         2009-06-02  351 =20
19d337dff95cbf Johannes Berg         2009-06-02  352  	if (blocked)
19d337dff95cbf Johannes Berg         2009-06-02  353  		rfkill->state |=3D =
RFKILL_BLOCK_SW;
19d337dff95cbf Johannes Berg         2009-06-02  354  	else
19d337dff95cbf Johannes Berg         2009-06-02  355  		rfkill->state &=3D =
~RFKILL_BLOCK_SW;
19d337dff95cbf Johannes Berg         2009-06-02  356 =20
19d337dff95cbf Johannes Berg         2009-06-02  357  	rfkill->state |=3D R=
FKILL_BLOCK_SW_SETCALL;
19d337dff95cbf Johannes Berg         2009-06-02  358  	spin_unlock_irqresto=
re(&rfkill->lock, flags);
19d337dff95cbf Johannes Berg         2009-06-02  359 =20
19d337dff95cbf Johannes Berg         2009-06-02  360  	err =3D rfkill->ops-=
>set_block(rfkill->data, blocked);
19d337dff95cbf Johannes Berg         2009-06-02  361 =20
19d337dff95cbf Johannes Berg         2009-06-02  362  	spin_lock_irqsave(&r=
fkill->lock, flags);
19d337dff95cbf Johannes Berg         2009-06-02  363  	if (err) {
19d337dff95cbf Johannes Berg         2009-06-02  364  		/*
3ff707d66881d3 Jo=C3=A3o Paulo Rechi Vita 2016-02-22  365  		 * Failed -- r=
eset status to _PREV, which may be different
3ff707d66881d3 Jo=C3=A3o Paulo Rechi Vita 2016-02-22  366  		 * from what w=
e have set _PREV to earlier in this function
19d337dff95cbf Johannes Berg         2009-06-02  367  		 * if rfkill_set_sw=
_state was invoked.
19d337dff95cbf Johannes Berg         2009-06-02  368  		 */
19d337dff95cbf Johannes Berg         2009-06-02  369  		if (rfkill->state &=
 RFKILL_BLOCK_SW_PREV)
19d337dff95cbf Johannes Berg         2009-06-02  370  			rfkill->state |=3D =
RFKILL_BLOCK_SW;
19d337dff95cbf Johannes Berg         2009-06-02  371  		else
19d337dff95cbf Johannes Berg         2009-06-02  372  			rfkill->state &=3D =
~RFKILL_BLOCK_SW;
19d337dff95cbf Johannes Berg         2009-06-02  373  	}
19d337dff95cbf Johannes Berg         2009-06-02  374  	rfkill->state &=3D ~=
RFKILL_BLOCK_SW_SETCALL;
19d337dff95cbf Johannes Berg         2009-06-02  375  	rfkill->state &=3D ~=
RFKILL_BLOCK_SW_PREV;
eab48345c2b2d7 Vitaly Wool           2012-09-06  376  	curr =3D rfkill->sta=
te & RFKILL_BLOCK_SW;
19d337dff95cbf Johannes Berg         2009-06-02 @377  	spin_unlock_irqresto=
re(&rfkill->lock, flags);
19d337dff95cbf Johannes Berg         2009-06-02  378 =20
19d337dff95cbf Johannes Berg         2009-06-02  379  	rfkill_led_trigger_e=
vent(rfkill);
d874cd74306694 Jo=C3=A3o Paulo Rechi Vita 2018-05-22  380  	rfkill_global_l=
ed_trigger_event();
eab48345c2b2d7 Vitaly Wool           2012-09-06  381 =20
eab48345c2b2d7 Vitaly Wool           2012-09-06  382  	if (prev !=3D curr)
c64fb01627e247 Johannes Berg         2009-06-02  383  		rfkill_event(rfkill=
);
19d337dff95cbf Johannes Berg         2009-06-02  384  }
19d337dff95cbf Johannes Berg         2009-06-02  385 =20

:::::: The code at line 377 was first introduced by commit
:::::: 19d337dff95cbf76edd3ad95c0cee2732c3e1ec5 rfkill: rewrite

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
