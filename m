Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7E33994AF
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769110610; cv=none; b=ri2ESaFvUGN+LkbLyf5hM1IVXULcgb+D9qEsadYDNBliV2VyxpDllTb8MqSCIQIWRDuxZWZEwGmJGBfyT4LmHlDJ92ICebD2yR16fB1NBmAM9lx4HU2UR78z3Q7nrLgo/edrf74vgVrR/YUTXSkNGSPLejTGRxSnfljeTYgMklk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769110610; c=relaxed/simple;
	bh=tAW6/ir2a9p2JrgpdeTQVih69iR37+OBXmUd4WTJzfg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YafmaPJKuYHNSYXOwJJmI79tXPH1VEl0W5kw2IJH6uqGokrbhk8eKl02sneKupEM1UxTWAE9QdQn1qiY5Y17+VgdS6h//Jh+U+fgqBXVzY+ehT284qPXsZdKXFZZ0Vh3cB2YkoUy24UoUfaNMXFPza40vjDSCS5KVWG88XVEKac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dx1GkVpS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dx1GkVpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769110588; x=1800646588;
  h=date:from:to:cc:subject:message-id;
  bh=tAW6/ir2a9p2JrgpdeTQVih69iR37+OBXmUd4WTJzfg=;
  b=dx1GkVpS72jrePGUqo/YAr2m+leZkdTL5DkOtMYzdQhsLkS4au+accFx
   lNd5FW8Gf9UVJfzWD3dHZCEf6zRU9+SckN0hPiEF1OgWUIzekPFs5Ll8J
   LYf/ulPFaJ0vTQXRku3YtHWxtgT0INC3vOFRGpUnuCNXHV1Qgpky/Si9c
   +Pll4lnSykf3qAuBeZi4oZbw3Ec7HQUztCOcfUvd/Xm4D5JY2x1+zOHAv
   WtMmOfBXcwLbx9baOWxVfLoM+CikWwZxT0iBc1AYCnez/ipX0KF1j92u3
   FpNnpxHKa+QKZ6yOtljZFv8yxyRBCxTH/Mw9ay+X9RRR9BltGZDPlDS/g
   w==;
X-CSE-ConnectionGUID: Tha3TuXiQY2jRvga1vlkGw==
X-CSE-MsgGUID: PfcKfMjtSxGYyFouOEOY5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="95835262"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="95835262"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 11:36:22 -0800
X-CSE-ConnectionGUID: R4TzlFU9TbmCmqAENd1M9Q==
X-CSE-MsgGUID: o3ADuUecSbqxOa9ApvB5oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="207160343"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jan 2026 11:36:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj0TY-00000000TDG-3ogV;
	Thu, 22 Jan 2026 19:36:16 +0000
Date: Fri, 23 Jan 2026 03:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hsi/clients/hsi_char.c:123 hsc_add_tail() error:
 calling 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202601230326.vuyjhrzr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Maarten Lankhorst <dev@lankhorst.se>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260122-080713/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20260121-223353
head:   54e8059723c313d39173b4076a2b18840a9cd49c
commit: c6f291a565e435e5ef053b9e7536d28677378113 PREEMPT_RT injection
date:   19 hours ago
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20260122 (https://download.01.org/0day-ci/archive/20260123/202601230326.vuyjhrzr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601230326.vuyjhrzr-lkp@intel.com/

New smatch warnings:
drivers/hsi/clients/hsi_char.c:123 hsc_add_tail() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hsi/clients/hsi_char.c:140 hsc_get_first_msg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hsi/clients/hsi_char.c:168 hsc_reset_list() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/airspy/airspy.c:227 airspy_get_next_fill_buf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/airspy/airspy.c:456 airspy_cleanup_queued_bufs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/airspy/airspy.c:515 airspy_buf_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/cb7210/cb7210.c:129 fifo_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/cb7210/cb7210.c:76 input_fifo_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/cb7210/cb7210.c:330 fifo_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/cb7210/cb7210.c:264 output_fifo_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/cb7210/cb7210.h:87 cb7210_paged_read_byte() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/cb7210/cb7210.c:527 cb7210_locked_internal_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_apollo.c:155 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dectlk.c:192 read_buff_add() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dectlk.c:231 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mailbox/mailbox-test.c:166 mbox_test_message_data_ready() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mailbox/mailbox-test.c:232 mbox_test_message_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mailbox/mailbox-test.c:301 mbox_test_receive_message() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/logicvc/logicvc_crtc.c:58 logicvc_crtc_atomic_begin() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/logicvc/logicvc_crtc.c:148 logicvc_crtc_atomic_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/logicvc/logicvc_crtc.c:242 logicvc_crtc_vblank_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_decext.c:169 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:1549 ata_exec_internal() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:5450 ata_dev_init() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:5945 ata_port_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:6168 ata_port_detach() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/common/gpib_os.c:1907 push_gpib_event() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/common/gpib_os.c:1960 pop_gpib_event() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/lkdtm/core.c:219 lkdtm_kprobe_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
arch/x86/platform/efi/efi_64.c:588 efi_thunk_get_variable() error: calling 'spin_unlock_irqrestore()' with bogus flags
arch/x86/platform/efi/efi_64.c:617 efi_thunk_set_variable() error: calling 'spin_unlock_irqrestore()' with bogus flags
arch/x86/platform/efi/efi_64.c:648 efi_thunk_set_variable_nonblocking() error: calling 'spin_unlock_irqrestore()' with bogus flags
arch/x86/platform/efi/efi_64.c:678 efi_thunk_get_next_variable() error: calling 'spin_unlock_irqrestore()' with bogus flags
arch/x86/platform/efi/efi_64.c:703 efi_thunk_reset_system() error: calling 'spin_unlock_irqrestore()' with bogus flags
arch/x86/platform/efi/efi_64.c:739 efi_thunk_query_variable_info() error: calling 'spin_unlock_irqrestore()' with bogus flags
arch/x86/platform/efi/efi_64.c:766 efi_thunk_query_variable_info_nonblocking() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_soft.c:197 softsynth_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_soft.c:212 softsynth_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_soft.c:243 softsynthx_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_soft.c:363 softsynth_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-video.c:742 buffer_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-video.c:761 return_all_buffers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/bus/mhi/host/main.c:1574 mhi_mark_stale_events() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/bus/mhi/host/pm.c:776 mhi_queue_state_transition() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/bus/mhi/host/pm.c:1078 mhi_assert_dev_wake() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/bus/mhi/host/pm.c:1118 mhi_deassert_dev_wake() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:187 ata_scsi_park_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:406 ata_scsi_unlock_native_capacity() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:670 ata_sas_scsi_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:1229 ata_scsi_sdev_destroy() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:1814 ata_scsi_rbuf_fill() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:3345 ata_format_dsm_trim_descr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:4406 ata_scsi_queuecmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:4706 ata_scsi_remove_dev() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:4728 ata_scsi_handle_link_detach() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:4853 ata_scsi_user_scan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:4902 ata_scsi_dev_rescan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:544 ata_eh_unload() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:567 ata_scsi_error() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:680 ata_scsi_cmd_error_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:736 ata_scsi_port_error_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:828 ata_port_wait_eh() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:895 ata_eh_fastdrain_timerfn() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:1141 ata_eh_freeze_port() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:1165 ata_eh_thaw_port() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:1185 __ata_eh_qc_complete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:1283 ata_eh_detach_dev() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:1319 ata_eh_about_to_do() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:2847 ata_eh_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3404 ata_eh_revalidate_and_attach() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3800 ata_eh_recover() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3243 ata_eh_pull_park_action() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/devsynth.c:33 speakup_file_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/devsynth.c:90 speakup_file_writeu() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:44 fluke_locking_read_byte() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:55 fluke_locking_write_byte() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.h:100 fluke_paged_read_byte() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:255 lacs_or_read_ready() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:376 fluke_dma_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:424 fluke_dma_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:606 fluke_dma_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:848 fluke_gpib_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.h:114 fluke_paged_write_byte() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:1066 fluke_attach_impl() warn: 'e_priv->write_transfer_counter' from ioremap() not released on lines: 1045,1051.
drivers/gpib/eastwood/fluke_gpib.c:1066 fluke_attach_impl() warn: 'nec_priv->mmiobase' from ioremap() not released on lines: 1012,1018,1025,1032,1040,1045,1051.
drivers/gpib/eastwood/fluke_gpib.c:1066 fluke_attach_impl() warn: 'res->start' from __request_region() not released on lines: 1006,1012,1018,1025,1032,1040,1045,1051.
drivers/dma/altera-msgdma.c:218 msgdma_get_descriptor() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:316 msgdma_tx_submit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:346 msgdma_prep_memcpy() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:409 msgdma_prep_slave_sg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:576 msgdma_issue_pending() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:595 msgdma_chan_desc_cleanup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:646 msgdma_free_chan_resources() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:721 msgdma_tasklet() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:249 find_port_by_vtermno() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:268 find_port_by_devt_in_portdev() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:287 find_port_by_devt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:302 find_port_by_id() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:319 find_port_by_vq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:370 free_buf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:395 reclaim_dma_bufs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:535 port_has_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:640 __send_to_port() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:690 fill_readbuf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/../tty/hvc/hvc_console.h:95 hvc_resize() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:1748 in_intr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/i18n.c:572 spk_msg_set() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/i18n.c:606 spk_reset_msg_group() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/i18n.c:629 spk_free_user_msgs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid10.c:307 reschedule_retry() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid10.c:1283 raid10_write_one_disk() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid10.c:2006 raid10_error() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid10.c:2099 raid10_spare_active() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid10.c:2994 raid10d() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/ines/ines_gpib.c:314 ines_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:103 nec7210_serial_poll_response() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:224 nec7210_update_status() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:252 nec7210_set_handshake_mode() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:268 nec7210_read_data_in() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:375 nec7210_release_rfd_holdoff() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:447 nec7210_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:686 pio_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:1048 nec7210_locking_ioport_read_byte() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:1062 nec7210_locking_ioport_write_byte() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:1093 nec7210_locking_iomem_read_byte() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/nec7210/nec7210.c:1107 nec7210_locking_iomem_write_byte() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:74 chars_chartab_show() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:220 chars_chartab_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:258 keymap_show() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:278 keymap_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:364 silent_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:430 synth_direct_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:489 punc_show() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:536 punc_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:591 spk_var_show() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:693 spk_var_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:848 message_show() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sata.c:935 ata_scsi_lpm_supported_show() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sata.c:973 ata_scsi_lpm_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sata.c:1020 ata_ncq_prio_supported() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sata.c:1072 ata_ncq_prio_enabled() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sata.c:1142 ata_ncq_prio_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sata.c:1291 ata_change_queue_depth() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/em28xx/em28xx-core.c:792 em28xx_irq_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-core.c:804 cx231xx_isoc_irq_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-core.c:852 cx231xx_bulk_irq_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/synth.c:73 _spk_do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/synth.c:525 synth_release() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sff.c:1528 __ata_sff_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sff.c:2076 ata_sff_error_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sff.c:2811 ata_bmdma_error_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sff.c:2836 ata_bmdma_post_internal_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/ni_usb/ni_usb_gpib.c:339 ni_usb_soft_update_status() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/ni_usb/ni_usb_gpib.c:1844 ni_usb_interrupt_complete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/ni_usb/ni_usb_gpib.c:1869 ni_usb_set_interrupt_monitor() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/udl/udl_main.c:172 udl_urb_completion() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/thread.c:37 speakup_thread() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/platform/x86/dell/dcdbas.c:407 host_control_smi() error: calling 'spin_unlock_irqrestore()' with bogus flags
kernel/dma/swiotlb.c:1091 swiotlb_search_pool_area() error: calling 'spin_unlock_irqrestore()' with bogus flags
kernel/dma/swiotlb.c:1490 swiotlb_release_slots() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libahci.c:325 ahci_read_em_buffer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libahci.c:390 ahci_store_em_buffer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libahci.c:1076 ahci_sw_activity_blink() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libahci.c:1139 ahci_transmit_led_message() error: calling 'spin_unlock_irqrestore()' with bogus flags
kernel/cgroup/cpuset.c:4245 cpuset_cpus_allowed() error: calling 'spin_unlock_irqrestore()' with bogus flags
kernel/cgroup/cpuset.c:4318 cpuset_mems_allowed() error: calling 'spin_unlock_irqrestore()' with bogus flags
kernel/cgroup/cpuset.c:4415 cpuset_current_node_allowed() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:112 tnt_readb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:145 tnt_writeb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:319 tnt4882_accel_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:501 generic_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:588 tnt4882_internal_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:708 tnt4882_update_status() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:812 tnt4882_serial_poll_response2() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1437 samsung_dsim_transfer_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1469 samsung_dsim_transfer_finish() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1519 samsung_dsim_remove_transfer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1546 samsung_dsim_transfer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1193 do_handle_shift() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1204 do_handle_latin() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1528 pre_handle_cursor() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1550 do_handle_cursor() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1734 cursor_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1750 speakup_bs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1776 speakup_con_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1805 speakup_con_update() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1837 do_handle_spec() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:2222 speakup_key() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-417.c:1375 buffer_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-417.c:1390 return_all_buffers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-417.c:1452 stop_streaming() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_imap.c:2834 diUpdatePMap() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/pinctrl/pinctrl-microchip-sgpio.c:672 microchip_sgpio_irq_settype() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/gspca/gspca.c:397 gspca_frame_add() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/gspca/gspca.c:1336 gspca_buffer_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/gspca/gspca.c:1350 gspca_return_all_buffers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-vbi.c:198 vbi_buf_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-vbi.c:214 return_all_buffers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/cx231xx/cx231xx-vbi.c:280 cx231xx_irq_vbi_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/vmscan.c:4346 lru_gen_rotate_memcg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:245 fifo_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:299 fifo_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:623 report_io_error() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:661 bulk_in_completer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:691 bulk_out_completer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:716 try_queue_bulk_in() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:803 try_queue_bulk_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:1040 bulk_in_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_dmap.c:581 dbUpdatePMap() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/queue.c:92 mmc_cqe_recovery_notifier() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/queue.c:131 mmc_mq_timed_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/block.c:1566 mmc_blk_cqe_complete_rq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/block.c:2126 mmc_blk_hsq_req_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/block.c:2185 mmc_blk_mq_dec_in_flight() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/block.c:2291 mmc_blk_mq_req_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/block.c:2345 mmc_blk_rw_wait_cond() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/messaging.c:32 slim_msg_response() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/messaging.c:72 slim_alloc_txn_tid() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/messaging.c:93 slim_free_txn_tid() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/amd/qdma/../../virt-dma.h:207 vchan_free_chan_resources() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/amd/qdma/qdma.c:642 qdma_issue_pending() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/amd/qdma/qdma.c:758 qdma_tx_submit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/amd/qdma/../../virt-dma.h:71 vchan_tx_prep() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/amd/qdma/qdma.c:890 qdma_queue_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/s2255/s2255drv.c:552 s2255_got_frame() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/s2255/s2255drv.c:695 buffer_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/s2255/s2255drv.c:1089 stop_streaming() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iio/adc/xilinx-xadc-core.c:448 xadc_zynq_update_alarm() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iio/adc/xilinx-xadc-core.c:555 xadc_axi_update_alarm() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iio/adc/xilinx-xadc-core.c:736 xadc_trigger_set_state() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/sched.c:82 slim_ctrl_clk_pause() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/sata_dwc_460ex.c:319 dma_dwc_xfer_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/sata_dwc_460ex.c:682 sata_dwc_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/stk1160/stk1160-video.c:79 stk1160_next_buffer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/stk1160/stk1160-v4l.c:712 buffer_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/stk1160/stk1160-v4l.c:771 stk1160_clear_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:101 hvc_get_by_index() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:258 hvc_port_destruct() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:356 hvc_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:400 hvc_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:458 hvc_hangup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:533 hvc_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:578 hvc_set_winsz() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:655 __hvc_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:993 hvc_remove() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/leds/leds-wm831x-status.c:59 wm831x_status_set() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/leds/leds-wm831x-status.c:76 wm831x_status_brightness_set() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/leds/leds-wm831x-status.c:145 wm831x_status_blink_set() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_metapage.c:384 remove_from_logsync() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:308 lmLog() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:900 lmPostGC() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:955 lmLogSync() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:1884 lbmAllocate() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:1914 lbmFree() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2054 lbmWrite() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:1952 lbmRedrive() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2151 lbmIOWait() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2199 lbmIODone() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/fsl_linflexuart.c:620 linflex_earlycon_putchar() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/fsl_linflexuart.c:725 linflex_console_setup() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_txnmgr.c:944 txUnlock() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_txnmgr.c:2733 jfs_lazycommit() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_txnmgr.c:2790 txLazyUnlock() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/xilinx_sdfec.c:303 xsdfec_get_status() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/xilinx_sdfec.c:901 xsdfec_clear_stats() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/xilinx_sdfec.c:916 xsdfec_get_stats() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/xilinx_sdfec.c:1017 xsdfec_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/xilinx_sdfec.c:1177 xsdfec_irq_thread() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:205 isp1760_udc_request_complete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:226 isp1760_udc_ctrl_send_stall() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:832 isp1760_ep_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:851 isp1760_ep_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:970 isp1760_ep_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:994 isp1760_ep_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1069 isp1760_ep_set_halt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1085 isp1760_ep_set_wedge() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1107 isp1760_ep_fifo_flush() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1203 isp1760_udc_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1282 isp1760_udc_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1323 isp1760_udc_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1437 isp1760_udc_vbus_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:855 sccnxp_console_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
block/blk-iolatency.c:580 iolatency_check_latencies() error: calling 'spin_unlock_irqrestore()' with bogus flags
block/blk-iolatency.c:706 blkiolatency_timer_fn() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/backing-dev.c:687 cgwb_create() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/dm-snap.c:283 stop_tracking_chunk() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:128 adu_abort_transfers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:196 adu_interrupt_in_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:224 adu_interrupt_out_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:404 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:539 adu_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:373 alua_check_vpd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:689 alua_rtpg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:901 alua_rtpg_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:1044 alua_rtpg_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:1116 alua_set_params() error: calling 'spin_unlock_irqrestore()' with bogus flags
kernel/trace/trace_events_user.c:738 user_event_mm_attach() error: calling 'spin_unlock_irqrestore()' with bogus flags
kernel/trace/trace_events_user.c:804 user_event_mm_remove() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/virtio_scsi.c:191 virtscsi_vq_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/virtio_scsi.c:249 virtscsi_kick_event() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/virtio_scsi.c:480 virtscsi_kick_vq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/virtio_scsi.c:508 virtscsi_add_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/virtio_scsi.c:606 virtscsi_queuecommand() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/virtio_scsi.c:768 virtscsi_mq_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/percpu-internal.h:248 pcpu_stats_chunk_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/percpu-internal.h:261 pcpu_stats_chunk_dealloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/legousbtower.c:695 tower_interrupt_in_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/sata_mv.c:1119 mv_set_irq_coalescing() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/sata_mv.c:1712 mv_port_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/sata_mv.c:1737 mv_port_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:6417 sdebug_q_cmd_complete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:7300 schedule_resp() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:8814 sdebug_add_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:9137 sdebug_blk_mq_poll_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_virthub.c:48 musb_host_finish_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_virthub.c:277 musb_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_core.c:622 musb_otg_timer_func() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_core.c:1863 mode_show() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_core.c:1885 mode_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_core.c:1910 vbus_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_core.c:1937 vbus_show() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_core.c:2274 musb_queue_resume_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_core.c:2295 musb_deassert_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_core.c:2644 musb_remove() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_host.c:2138 musb_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_host.c:2415 musb_urb_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_host.c:2470 musb_h_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:794 xudc_ep_set_halt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:916 xudc_ep_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:956 xudc_ep_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1063 xudc_ep0_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1107 xudc_ep_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1155 xudc_ep_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1264 xudc_wakeup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1293 xudc_pullup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1403 xudc_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1429 xudc_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:2050 xudc_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/list_lru.c:555 memcg_list_lru_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/dm-clone-target.c:405 issue_deferred_bios() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/dm-clone-target.c:444 complete_overwrite_bio() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/dm-clone-target.c:718 hydration_update_metadata() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/dm-clone-metadata.c:862 dm_clone_set_region_hydrated() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/dm-clone-metadata.c:937 dm_clone_changed_this_transaction() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:311 rx_complete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:356 printer_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:386 printer_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:483 printer_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:609 printer_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:722 printer_fsync() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:751 printer_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:790 printer_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:883 printer_reset_interface() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:1743 r8a66597_interval_timer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:1797 r8a66597_td_timer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:1811 r8a66597_timer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:1949 r8a66597_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:1974 r8a66597_urb_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:1998 r8a66597_endpoint_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:2080 update_usb_address_map() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:2120 r8a66597_hub_status_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:2239 r8a66597_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/shuffle.c:141 __shuffle_zone() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/memcontrol-v1.c:164 mem_cgroup_remove_exceeded() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/memcontrol-v1.c:217 memcg1_update_tree() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/memcontrol.c:182 obj_cgroup_release() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/gpib/cb7210/cb7210.c:1068 cb_isa_attach() warn: 'config->ibbase' from __request_region() not released on lines: 1064.
drivers/accessibility/speakup/speakup_apollo.c:165 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_apollo.c:171 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_apollo.c:177 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_apollo.c:189 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_apollo.c:201 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dectlk.c:240 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dectlk.c:246 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dectlk.c:251 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dectlk.c:257 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dectlk.c:264 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dectlk.c:274 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_dectlk.c:290 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_decext.c:176 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_decext.c:182 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_decext.c:188 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_decext.c:198 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_decext.c:214 do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:1595 ata_exec_internal() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:1627 ata_exec_internal() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:1659 ata_exec_internal() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:6180 ata_port_detach() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/common/gpib_os.c:816 ibioctl() warn: inconsistent returns '&board->big_gpib_mutex'.
drivers/gpib/common/gpib_os.c:1291 close_dev_ioctl() warn: potential spectre issue 'file_priv->descriptors' [r] (local cap)
drivers/accessibility/speakup/speakup_soft.c:201 softsynth_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_soft.c:276 softsynthx_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/speakup_soft.c:315 softsynthx_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/bus/mhi/host/pm.c:1094 mhi_assert_dev_wake() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:690 ata_sas_scsi_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:4733 ata_scsi_handle_link_detach() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:4856 ata_scsi_user_scan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:4921 ata_scsi_dev_rescan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:760 ata_scsi_port_error_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:780 ata_scsi_port_error_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:805 ata_scsi_port_error_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:834 ata_port_wait_eh() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3078 ata_eh_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3140 ata_eh_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3078 ata_eh_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3140 ata_eh_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:669 fluke_dma_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/eastwood/fluke_gpib.c:1066 fluke_attach_impl() warn: 'res->start' from __request_region() not released on lines: 1025,1032,1040,1045,1051.
drivers/gpib/eastwood/fluke_gpib.c:1066 fluke_attach_impl() warn: 'res->start' from __request_region() not released on lines: 1040,1045,1051.
drivers/dma/altera-msgdma.c:351 msgdma_prep_memcpy() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:414 msgdma_prep_slave_sg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma/altera-msgdma.c:604 msgdma_chan_desc_cleanup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:1567 handle_control_message() error: we previously assumed 'port' could be null (see line 1535)
drivers/char/virtio_console.c:1993 virtcons_probe() error: we previously assumed 'vdev->config->get' could be null (see line 1960)
drivers/md/raid10.c:2018 raid10_error() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid10.c:3014 raid10d() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid10.c:3020 raid10d() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid10.c:3467 raid10_sync_request() error: we previously assumed 'bio' could be null (see line 3459)
drivers/gpib/ines/ines_gpib.c:917 ines_isa_attach() warn: 'config->ibbase' from __request_region() not released on lines: 913.
drivers/accessibility/speakup/kobjects.c:195 chars_chartab_store() warn: potential spectre issue 'spk_characters' [w] (local cap)
drivers/accessibility/speakup/kobjects.c:206 chars_chartab_store() warn: potential spectre issue 'spk_chartab' [w] (local cap)
drivers/accessibility/speakup/kobjects.c:285 keymap_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:304 keymap_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/kobjects.c:325 keymap_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sata.c:1302 ata_change_queue_depth() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-sata.c:1317 ata_change_queue_depth() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/synth.c:80 _spk_do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/synth.c:87 _spk_do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/synth.c:93 _spk_do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/synth.c:109 _spk_do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/synth.c:121 _spk_do_catch_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/ni_usb/ni_usb_gpib.c:414 ni_usb_parse_termination_block() warn: was && intended here instead of ||?
drivers/platform/x86/dell/dcdbas.c:438 host_control_smi() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libahci.c:331 ahci_read_em_buffer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libahci.c:359 ahci_read_em_buffer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libahci.c:403 ahci_store_em_buffer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libahci.c:1167 ahci_transmit_led_message() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libahci.c:2567 ahci_port_start() warn: bitwise AND condition is false here
drivers/ata/libahci.c:2753 ahci_host_activate() warn: bitwise AND condition is false here
drivers/gpib/tnt4882/tnt4882_gpib.c:352 tnt4882_accel_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:362 tnt4882_accel_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:522 generic_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpib/tnt4882/tnt4882_gpib.c:1083 ni_isa_attach_common() warn: 'iobase' from __request_region() not released on lines: 1071,1077.
drivers/gpu/drm/bridge/samsung-dsim.c:1457 samsung_dsim_transfer_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1476 samsung_dsim_transfer_finish() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1497 samsung_dsim_transfer_finish() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1527 samsung_dsim_remove_transfer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1873 samsung_dsim_register_te_irq() warn: why call request_threaded_irq() with a NULL thread
drivers/accessibility/speakup/main.c:1208 do_handle_latin() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1217 do_handle_latin() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1535 pre_handle_cursor() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1538 pre_handle_cursor() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1570 do_handle_cursor() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1758 speakup_bs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1782 speakup_con_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1788 speakup_con_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/accessibility/speakup/main.c:1843 do_handle_spec() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/gspca/gspca.c:451 gspca_frame_add() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:308 fifo_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:670 bulk_in_completer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:724 try_queue_bulk_in() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:757 try_queue_bulk_in() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:811 try_queue_bulk_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:819 try_queue_bulk_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:864 try_queue_bulk_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/xillybus/xillyusb.c:1055 bulk_in_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/block.c:2313 mmc_blk_mq_req_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/messaging.c:76 slim_alloc_txn_tid() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/s2255/s2255drv.c:561 s2255_got_frame() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/sched.c:87 slim_ctrl_clk_pause() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:105 hvc_get_by_index() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:360 hvc_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:428 hvc_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:463 hvc_hangup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:689 __hvc_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:727 __hvc_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:748 __hvc_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:1886 lbmAllocate() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2058 lbmWrite() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2158 lbmIOWait() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2228 lbmIODone() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2281 lbmIODone() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2291 lbmIODone() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2306 lbmIODone() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/fsl_linflexuart.c:613 linflex_earlycon_putchar() error: we previously assumed 'earlycon_buf.content' could be null (see line 601)
include/linux/serial_core.h:753 uart_port_trylock_irqsave() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/fsl_linflexuart.c:746 linflex_console_setup() error: we previously assumed 'earlycon_port' could be null (see line 720)
drivers/tty/serial/fsl_linflexuart.c:754 linflex_console_setup() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_txnmgr.c:978 txUnlock() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_txnmgr.c:2754 jfs_lazycommit() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_txnmgr.c:2761 jfs_lazycommit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:866 isp1760_ep_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1288 isp1760_udc_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/isp1760/isp1760-udc.c:1586 isp1760_udc_register() warn: 'irq' from request_irq() not released on lines: 1586.
drivers/tty/serial/sccnxp.c:508 sccnxp_timer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:520 sccnxp_ist() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:538 sccnxp_start_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:553 sccnxp_stop_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:564 sccnxp_tx_empty() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:582 sccnxp_set_mctrl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:624 sccnxp_get_mctrl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:637 sccnxp_break_ctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:725 sccnxp_set_termios() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:754 sccnxp_startup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/sccnxp.c:778 sccnxp_shutdown() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:131 adu_abort_transfers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:135 adu_abort_transfers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:140 adu_abort_transfers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:411 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:421 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:449 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:452 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:480 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:493 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:566 adu_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:382 alua_check_vpd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:709 alua_rtpg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:772 alua_rtpg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:910 alua_rtpg_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:918 alua_rtpg_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:941 alua_rtpg_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:949 alua_rtpg_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:956 alua_rtpg_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:969 alua_rtpg_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/device_handler/scsi_dh_alua.c:982 alua_rtpg_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:7312 schedule_resp() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:7329 schedule_resp() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:7334 schedule_resp() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:8822 sdebug_add_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:9142 sdebug_blk_mq_poll_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:9145 sdebug_blk_mq_poll_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_debug.c:9403 scsi_debug_queuecommand() warn: missing error code? 'ret'
drivers/usb/musb/musb_virthub.c:433 musb_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_host.c:1266 musb_host_tx() error: we previously assumed 'dma' could be null (see line 1224)
drivers/usb/musb/musb_host.c:2161 musb_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_host.c:2290 musb_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_host.c:2296 musb_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1127 xudc_ep_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/udc-xilinx.c:1159 xudc_ep_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:368 printer_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:521 printer_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:538 printer_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:566 printer_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:577 printer_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:653 printer_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:670 printer_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:686 printer_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:694 printer_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:705 printer_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:728 printer_fsync() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:757 printer_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:771 printer_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/function/f_printer.c:808 printer_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:2011 r8a66597_endpoint_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +123 drivers/hsi/clients/hsi_char.c

4e69fc22753fcc Andras Domokos 2010-09-30  115  
4e69fc22753fcc Andras Domokos 2010-09-30  116  static void hsc_add_tail(struct hsc_channel *channel, struct hsi_msg *msg,
4e69fc22753fcc Andras Domokos 2010-09-30  117  							struct list_head *queue)
4e69fc22753fcc Andras Domokos 2010-09-30  118  {
4e69fc22753fcc Andras Domokos 2010-09-30  119  	unsigned long flags;
4e69fc22753fcc Andras Domokos 2010-09-30  120  
4e69fc22753fcc Andras Domokos 2010-09-30  121  	spin_lock_irqsave(&channel->lock, flags);
4e69fc22753fcc Andras Domokos 2010-09-30  122  	list_add_tail(&msg->link, queue);
4e69fc22753fcc Andras Domokos 2010-09-30 @123  	spin_unlock_irqrestore(&channel->lock, flags);
4e69fc22753fcc Andras Domokos 2010-09-30  124  }
4e69fc22753fcc Andras Domokos 2010-09-30  125  
4e69fc22753fcc Andras Domokos 2010-09-30  126  static struct hsi_msg *hsc_get_first_msg(struct hsc_channel *channel,
4e69fc22753fcc Andras Domokos 2010-09-30  127  							struct list_head *queue)
4e69fc22753fcc Andras Domokos 2010-09-30  128  {
4e69fc22753fcc Andras Domokos 2010-09-30  129  	struct hsi_msg *msg = NULL;
4e69fc22753fcc Andras Domokos 2010-09-30  130  	unsigned long flags;
4e69fc22753fcc Andras Domokos 2010-09-30  131  
4e69fc22753fcc Andras Domokos 2010-09-30  132  	spin_lock_irqsave(&channel->lock, flags);
4e69fc22753fcc Andras Domokos 2010-09-30  133  
4e69fc22753fcc Andras Domokos 2010-09-30  134  	if (list_empty(queue))
4e69fc22753fcc Andras Domokos 2010-09-30  135  		goto out;
4e69fc22753fcc Andras Domokos 2010-09-30  136  
4e69fc22753fcc Andras Domokos 2010-09-30  137  	msg = list_first_entry(queue, struct hsi_msg, link);
4e69fc22753fcc Andras Domokos 2010-09-30  138  	list_del(&msg->link);
4e69fc22753fcc Andras Domokos 2010-09-30  139  out:
4e69fc22753fcc Andras Domokos 2010-09-30 @140  	spin_unlock_irqrestore(&channel->lock, flags);
4e69fc22753fcc Andras Domokos 2010-09-30  141  
4e69fc22753fcc Andras Domokos 2010-09-30  142  	return msg;
4e69fc22753fcc Andras Domokos 2010-09-30  143  }
4e69fc22753fcc Andras Domokos 2010-09-30  144  
4e69fc22753fcc Andras Domokos 2010-09-30  145  static inline void hsc_msg_free(struct hsi_msg *msg)
4e69fc22753fcc Andras Domokos 2010-09-30  146  {
4e69fc22753fcc Andras Domokos 2010-09-30  147  	kfree(sg_virt(msg->sgt.sgl));
4e69fc22753fcc Andras Domokos 2010-09-30  148  	hsi_free_msg(msg);
4e69fc22753fcc Andras Domokos 2010-09-30  149  }
4e69fc22753fcc Andras Domokos 2010-09-30  150  
4e69fc22753fcc Andras Domokos 2010-09-30  151  static void hsc_free_list(struct list_head *list)
4e69fc22753fcc Andras Domokos 2010-09-30  152  {
4e69fc22753fcc Andras Domokos 2010-09-30  153  	struct hsi_msg *msg, *tmp;
4e69fc22753fcc Andras Domokos 2010-09-30  154  
4e69fc22753fcc Andras Domokos 2010-09-30  155  	list_for_each_entry_safe(msg, tmp, list, link) {
4e69fc22753fcc Andras Domokos 2010-09-30  156  		list_del(&msg->link);
4e69fc22753fcc Andras Domokos 2010-09-30  157  		hsc_msg_free(msg);
4e69fc22753fcc Andras Domokos 2010-09-30  158  	}
4e69fc22753fcc Andras Domokos 2010-09-30  159  }
4e69fc22753fcc Andras Domokos 2010-09-30  160  
4e69fc22753fcc Andras Domokos 2010-09-30  161  static void hsc_reset_list(struct hsc_channel *channel, struct list_head *l)
4e69fc22753fcc Andras Domokos 2010-09-30  162  {
4e69fc22753fcc Andras Domokos 2010-09-30  163  	unsigned long flags;
4e69fc22753fcc Andras Domokos 2010-09-30  164  	LIST_HEAD(list);
4e69fc22753fcc Andras Domokos 2010-09-30  165  
4e69fc22753fcc Andras Domokos 2010-09-30  166  	spin_lock_irqsave(&channel->lock, flags);
4e69fc22753fcc Andras Domokos 2010-09-30  167  	list_splice_init(l, &list);
4e69fc22753fcc Andras Domokos 2010-09-30 @168  	spin_unlock_irqrestore(&channel->lock, flags);
4e69fc22753fcc Andras Domokos 2010-09-30  169  
4e69fc22753fcc Andras Domokos 2010-09-30  170  	hsc_free_list(&list);
4e69fc22753fcc Andras Domokos 2010-09-30  171  }
4e69fc22753fcc Andras Domokos 2010-09-30  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
