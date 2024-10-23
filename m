Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85393F9C5
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 03:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729654108; cv=none; b=IBegEXjUkUkMbVX/yfFrnLK5mo5HdbShrOSE8aIErCy0S5SmX5HPxK4RM4twlAlb3/NNdHUvw7ZO5bm8ywL0LYncIcrosyL+h07uuuAtrzPMjURHksiHY+KzDiZXbAsc3Qkk+m431gmS+WLZhrlrpmt+WmzzjFs3vMBeRaoDM/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729654108; c=relaxed/simple;
	bh=wBYbMNKcP69dKa7RMYlcoA6SPYQGAFjNdh5UimWAxEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLAlInWyfPQwYiR/hyJxwQEiHGfGjtLdvJZTXC9maC0LUR2ZwEOQNWglEv0jNcjTkMmrSzOgtQ0qi4IdF0cgAjy4nyq1mLlOyMypDEQQc4fg36rSc0rm0btLEr9ZtmK7P70ETOQ3DpWWGmX9XyOh/ax6FPpcWWUqIRlj5SxsDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYcKXnoQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYcKXnoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729654104; x=1761190104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wBYbMNKcP69dKa7RMYlcoA6SPYQGAFjNdh5UimWAxEQ=;
  b=fYcKXnoQf/8+MGA0iT4K6LfhTbeWzwavpW8It/rpMFERFm+Z+ofRvs9b
   3kkm3jCPg+J/z3+BFHC1TL9HurQoOAcfiB35Sqz1NXgYu2J/HkZB6jysJ
   D/fzzTECd+6qTjaJieHKFRRD4piqA8cQvj13+xegFPRO60wGq7HTlS0r2
   xxdDJkNhuiKMKpITOJp6zpNPRK6TA2KrYxklfRw/9VcA79iMInVteZGiY
   5OlMjlnhWoGJQUa41+vHd9N53Y6cSw/+00OGiin0q/PSzqbYvXqGSfBgE
   Qd3fPHpwWnBuFmUK5PfF+6SvtBhXvxw/ETRBtHdOi+qKZIjONvB5V2VHN
   A==;
X-CSE-ConnectionGUID: 9DKjsCpmSUmfK20C+aZGpg==
X-CSE-MsgGUID: emqF4AYUQnOprse3xEWzxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="28685557"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="28685557"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 20:28:23 -0700
X-CSE-ConnectionGUID: G/nYBqj/Rki7ot1d0O3FgQ==
X-CSE-MsgGUID: dKeNjZH3RbqwAS+/CCOGDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="103353373"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2024 20:28:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3S2l-000UOx-1c;
	Wed, 23 Oct 2024 03:28:19 +0000
Date: Wed, 23 Oct 2024 11:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/i2c/other/ak4114.c:580 snd_ak4114_check_rate_and_errors()
 error: calling 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202410231145.BkDbkX5K-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f9e4825524aaf28af6b2097776616f27c31d6847
commit: d8fccd9ca5f905533dc6c26cfd1f91beb8691c95 arm64: Allow to enable PREEMPT_RT.
date:   5 weeks ago
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-r072-20241011 (https://download.01.org/0day-ci/archive/20241023/202410231145.BkDbkX5K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410231145.BkDbkX5K-lkp@intel.com/

New smatch warnings:

Old smatch warnings:
drivers/bus/hisi_lpc.c:139 hisi_lpc_target_in() error: calling 'spin_unlock_irqrestore()' with bogus flags
security/keys/key.c:334 key_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
security/keys/key.c:347 key_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
security/keys/key.c:355 key_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/core/sock.c:3667 __lock_sock_fast() warn: inconsistent returns '&sk->sk_lock.slock'.
net/core/sock.c:3667 __lock_sock_fast() warn: inconsistent returns 'bh'.
drivers/bus/mhi/host/pm.c:1072 mhi_assert_dev_wake() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/drivers/opl3/opl3_lib.c:451 snd_opl3_create() warn: 'l_port' from __request_region() not released on lines: 417,438.
sound/drivers/opl3/opl3_lib.c:451 snd_opl3_create() warn: 'r_port' from __request_region() not released on lines: 438.
sound/drivers/opl3/opl3_midi.c:248 snd_opl3_timer_func() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/drivers/opl3/opl3_midi.c:342 snd_opl3_note_on() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/drivers/opl3/opl3_midi.c:358 snd_opl3_note_on() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/drivers/opl3/opl3_midi.c:375 snd_opl3_note_on() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/drivers/opl3/opl3_midi.c:601 snd_opl3_note_on() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/drivers/mpu401/mpu401_uart.c:608 snd_mpu401_uart_new() warn: 'port' from __request_region() not released on lines: 608.
net/core/skbuff.c:4811 skb_segment() error: we previously assumed 'list_skb' could be null (see line 4746)
security/keys/keyctl.c:1028 keyctl_chown_key() error: calling 'spin_unlock_irqrestore()' with bogus flags
security/keys/keyctl.c:1060 keyctl_chown_key() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpio/gpiolib-cdev.c:2308 lineevent_create() warn: 'irq' from request_threaded_irq() not released on lines: 2297.
sound/drivers/aloop.c:717 loopback_jiffies_timer_function() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/drivers/aloop.c:779 loopback_snd_timer_period_elapsed() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/drivers/aloop.c:800 loopback_snd_timer_period_elapsed() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/drivers/aloop.c:823 loopback_snd_timer_period_elapsed() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/idr.c:465 ida_alloc_range() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/idr.c:473 ida_alloc_range() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/idr.c:524 ida_free() error: calling 'spin_unlock_irqrestore()' with bogus flags
include/linux/mm.h:2230 arch_make_folio_accessible() error: uninitialized symbol 'ret'.
sound/pci/ctxfi/ctamixer.c:274 get_amixer_rsc() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ctxfi/ctamixer.c:429 get_sum_rsc() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ctxfi/ctsrc.c:463 get_src_rsc() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ctxfi/ctsrc.c:756 get_srcimp_rsc() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/cs46xx/cs46xx_lib.c:857 snd_cs46xx_set_capture_sample_rate() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/cs46xx/cs46xx_lib.c:976 snd_cs46xx_playback_trigger() warn: inconsistent indenting
sound/pci/cs46xx/cs46xx_lib.c:995 snd_cs46xx_playback_trigger() warn: inconsistent indenting
sound/pci/ctxfi/ctdaio.c:578 get_daio_rsc() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ctxfi/cttimer.c:286 ct_xfitimer_update() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ca0106/ca_midi.c:123 ca_midi_input_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ca0106/ca_midi.c:143 ca_midi_output_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ca0106/ca_midi.c:163 ca_midi_input_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ca0106/ca_midi.c:186 ca_midi_output_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ca0106/ca_midi.c:235 ca_midi_output_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpio/gpio-mvebu.c:1301 mvebu_gpio_probe() warn: 'mvchip->clk' from clk_prepare_enable() not released on lines: 1189,1248.
drivers/pci/pcie/pme.c:285 pcie_pme_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/rawmidi.c:1253 snd_rawmidi_kernel_read1() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/rawmidi.c:1554 snd_rawmidi_kernel_write1() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/rawmidi.c:1569 snd_rawmidi_kernel_write1() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/core/neighbour.c:3685 neigh_proc_base_reachable_time() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
net/core/neighbour.c:3687 neigh_proc_base_reachable_time() warn: (struct ctl_table)->procname cannot be NULL. Expression : ctl->procname
net/core/neighbour.c:3825 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[4]->proc_handler
net/core/neighbour.c:3827 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[5]->proc_handler
net/core/neighbour.c:3829 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[15]->proc_handler
net/core/neighbour.c:3831 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[16]->proc_handler
net/core/neighbour.c:3840 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[5]->proc_handler
net/core/neighbour.c:3843 neigh_sysctl_register() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : t->neigh_vars[16]->proc_handler
sound/pci/ice1712/ice1724.c:646 snd_vt1724_set_pro_rate() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ice1712/ice1724.c:657 snd_vt1724_set_pro_rate() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/ice1712/ice1724.c:663 snd_vt1724_set_pro_rate() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/korg1212/korg1212.c:1518 snd_korg1212_hw_params() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/korg1212/korg1212.c:1524 snd_korg1212_hw_params() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/korg1212/korg1212.c:1531 snd_korg1212_hw_params() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/ipmi/ssif_bmc.c:155 ssif_bmc_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/ipmi/ssif_bmc.c:163 ssif_bmc_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/ipmi/ssif_bmc.c:226 ssif_bmc_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_clientmgr.c:127 snd_seq_client_use_ptr() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_clientmgr.c:160 snd_seq_client_use_ptr() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_clientmgr.c:167 snd_seq_client_use_ptr() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_memory.c:329 snd_seq_cell_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_fifo.c:181 snd_seq_fifo_cell_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_fifo.c:186 snd_seq_fifo_cell_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_fifo.c:190 snd_seq_fifo_cell_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/riptide/riptide.c:910 sendcmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/riptide/riptide.c:1224 try_to_load_firmware() error: we previously assumed 'chip->fw_entry' could be null (see line 1215)
sound/pci/riptide/riptide.c:1233 try_to_load_firmware() warn: 'chip->fw_entry' from request_firmware() not released on lines: 1228.
sound/pci/rme9652/hdsp.c:3405 snd_hdsp_proc_read() warn: argument 5 to %lx specifier is cast from pointer
sound/pci/rme9652/hdsp.c:5215 hdsp_request_fw_loader() warn: 'fw' from request_firmware() not released on lines: 5193,5198,5204,5212.
fs/aio.c:1202 aio_complete() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_midi_event.c:325 snd_midi_event_decode() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/can/j1939/transport.c:349 j1939_session_skb_drop_old() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/soc/apple/mailbox.c:139 apple_mbox_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/soc/apple/mailbox.c:157 apple_mbox_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/soc/apple/mailbox.c:293 apple_mbox_get() warn: passing zero to 'ERR_PTR'
drivers/soc/mediatek/mtk-svs.c:1412 svs_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/soc/amlogic/meson-canvas.c:125 meson_canvas_config() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/soc/amlogic/meson-canvas.c:145 meson_canvas_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/soc/amlogic/meson-canvas.c:164 meson_canvas_free() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/kunit/test.c:924 kunit_cleanup() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/mctp/af_mctp.c:509 mctp_ioctl_droptag() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/mctp/af_mctp.c:609 mctp_sk_expire_keys() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/n_tty.c:2335 n_tty_read() warn: inconsistent returns '&ldata->atomic_read_lock'.
drivers/tty/n_tty.c:2335 n_tty_read() warn: inconsistent returns '&tty->termios_rwsem'.
net/mctp/test/route-test.c:1032 mctp_test_route_output_key_create() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/virtio/virtio_pcm_ops.c:354 virtsnd_pcm_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/virtio/virtio_pcm_ops.c:369 virtsnd_pcm_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/tty_port.c:589 tty_port_block_til_ready() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/tty_port.c:649 tty_port_close_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/tty_port.c:697 tty_port_close_end() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/pmdomain/governor.c:76 default_suspend_ok() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/tty_jobctrl.c:313 disassociate_ctty() warn: mixing irq and irqsave
drivers/tty/tty_jobctrl.c:564 tiocgsid() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/n_hdlc.c:280 n_hdlc_send_frames() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/n_hdlc.c:329 n_hdlc_send_frames() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/n_hdlc.c:618 n_hdlc_tty_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_dcc.c:213 hvc_dcc0_put_chars() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_dcc.c:254 hvc_dcc0_get_chars() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/random.c:1628 proc_do_uuid() warn: (struct ctl_table)->procname cannot be NULL. Expression : fake_table.procname
drivers/char/random.c:1628 proc_do_uuid() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : fake_table.proc_handler
drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3065 arm_smmu_domain_alloc_user() warn: 'smmu_domain' is an error pointer or valid
drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3068 arm_smmu_domain_alloc_user() error: 'smmu_domain' dereferencing possible ERR_PTR()
drivers/tty/hvc/hvc_console.c:105 hvc_get_by_index() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:360 hvc_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:428 hvc_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:463 hvc_hangup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:689 __hvc_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:727 __hvc_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:748 __hvc_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/serial_core.c:3039 iomem_base_show() warn: argument 3 to %lX specifier is cast from pointer
drivers/clk/mediatek/clk-mux.c:100 mtk_clk_mux_get_parent() warn: signedness bug returning '(-127)'
drivers/tty/moxa.c:1404 moxa_init() warn: 'brd->basemem' from ioremap() not released on lines: 1404.
drivers/tty/moxa.c:1661 moxa_new_dcdstate() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/virtio_console.c:1571 handle_control_message() error: we previously assumed 'port' could be null (see line 1539)
drivers/char/virtio_console.c:1788 config_work_handler() error: uninitialized symbol 'virtio_cread_v'.
drivers/char/virtio_console.c:1789 config_work_handler() error: uninitialized symbol 'virtio_cread_v'.
drivers/char/virtio_console.c:1996 virtcons_probe() error: we previously assumed 'vdev->config->get' could be null (see line 1963)
drivers/char/virtio_console.c:1996 virtcons_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/char/applicom.c:349 applicom_init() warn: 'RamIO' from ioremap() not released on lines: 254,339,349.
drivers/char/applicom.c:349 applicom_init() warn: 'RamIO' from ioremap() not released on lines: 339,349.
drivers/char/applicom.c:444 ac_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/applicom.c:480 ac_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/applicom.c:590 ac_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/applicom.c:602 ac_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/mvebu-uart.c:1163 mvebu_uart_clock_prepare() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/dma-iommu.c:1512 iommu_dma_unmap_sg() error: uninitialized symbol 'start'.
drivers/tty/n_gsm.c:874 gsm_dlci_clear_queues() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/n_gsm.c:2002 gsm_control_keep_alive() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/n_gsm.c:2049 gsm_control_retransmit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/n_gsm.c:2092 gsm_control_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/iova.c:220 __alloc_and_insert_iova_range() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/iova.c:360 free_iova() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/clk/visconti/clkc.c:52 visconti_gate_clk_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/serial/8250/8250_pci.c:1236 pci_oxsemi_tornado_get_divisor() error: uninitialized symbol 'tcr'.
drivers/tty/serial/8250/8250_pci.c:1237 pci_oxsemi_tornado_get_divisor() error: uninitialized symbol 'quot'.
drivers/tty/serial/8250/8250_pci.c:1241 pci_oxsemi_tornado_get_divisor() error: uninitialized symbol 'quot'.
drivers/tty/serial/8250/8250_pci.c:1245 pci_oxsemi_tornado_get_divisor() error: uninitialized symbol 'cpr'.
drivers/tty/serial/8250/8250_pci.c:1255 pci_oxsemi_tornado_get_divisor() error: uninitialized symbol 'cpr'.
drivers/base/devres.c:692 devres_release_group() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/base/devres.c:925 devm_krealloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/virtio-iommu.c:1146 viommu_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/iommu/virtio-iommu.c:1158 viommu_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/iommu/virtio-iommu.c:1162 viommu_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/iommu/virtio-iommu.c:1166 viommu_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/iommu/virtio-iommu.c:1170 viommu_probe() error: uninitialized symbol 'virtio_cread_v'.
drivers/iommu/virtio-iommu.c:1174 viommu_probe() error: uninitialized symbol 'virtio_cread_v'.
sound/soc/fsl/fsl_esai.c:779 fsl_esai_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/fsl/fsl_easrc.c:2032 fsl_easrc_runtime_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/fsl/fsl_audmix.c:302 fsl_audmix_dai_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/base/power/qos.c:552 dev_pm_qos_add_notifier() error: we previously assumed 'dev->power.qos' could be null (see line 544)
drivers/nfc/nfcmrvl/usb.c:423 nfcmrvl_resume() warn: missing error code 'err'
drivers/base/power/runtime.c:1362 __pm_runtime_set_status() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/base/power/wakeirq.c:36 dev_pm_attach_wake_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:100 st_send_frame() error: we previously assumed 'st_gdata' could be null (see line 95)
drivers/misc/ti-st/st_core.c:328 st_int_recv() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:382 st_int_recv() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:497 st_tx_wakeup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:569 st_register() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:583 st_register() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:612 st_register() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:619 st_register() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:629 st_register() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:665 st_unregister() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/ti-st/st_core.c:789 st_tty_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma-buf/dma-fence.c:805 dma_fence_default_wait() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/base/power/clock_ops.c:110 pm_clk_op_lock() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/base/power/clock_ops.c:121 pm_clk_op_lock() warn: inconsistent returns '&psd->lock'.
fs/autofs/waitq.c:483 autofs_wait() warn: inconsistent returns '&sbi->wq_mutex'.
drivers/base/regmap/regmap.c:1727 _regmap_raw_write_impl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/base/regmap/regmap.c:1748 _regmap_raw_write_impl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/base/regmap/regmap.c:2023 _regmap_raw_write() error: uninitialized symbol 'ret'.
drivers/base/regmap/regmap.c:2963 regmap_raw_read() error: uninitialized symbol 'ret'.
drivers/base/regmap/regmap.c:3146 _regmap_bulk_read() error: uninitialized symbol 'ret'.
drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c:486 dw_hdmi_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/tifm_7xx1.c:167 tifm_7xx1_switch_media() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/tifm_7xx1.c:174 tifm_7xx1_switch_media() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/tifm_7xx1.c:190 tifm_7xx1_switch_media() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/tifm_7xx1.c:207 tifm_7xx1_switch_media() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/tifm_7xx1.c:285 tifm_7xx1_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/phantom.c:128 phantom_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/phantom.c:146 phantom_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/phantom.c:176 phantom_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/phantom.c:186 phantom_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/phantom.c:190 phantom_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/hpilo.c:605 ilo_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/messaging.c:76 slim_alloc_txn_tid() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/sched.c:87 slim_ctrl_clk_pause() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/qcom-ctrl.c:144 slim_alloc_rxbuf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/qcom-ctrl.c:319 slim_alloc_txbuf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/slimbus/qcom-ctrl.c:434 slim_get_current_rxbuf() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/ref_tracker.c:270 ref_tracker_free() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/genwqe/card_dev.c:116 genwqe_search_pin() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/genwqe/card_dev.c:180 __genwqe_search_mapping() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/genwqe/card_ddcb.c:702 __genwqe_purge_ddcb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/genwqe/card_ddcb.c:810 __genwqe_enqueue_ddcb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/genwqe/card_ddcb.c:899 __genwqe_enqueue_ddcb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/genwqe/card_ddcb.c:992 genwqe_next_ddcb_ready() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/genwqe/card_ddcb.c:996 genwqe_next_ddcb_ready() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/mediatek/common/mtk-btcvsd.c:469 mtk_btcvsd_write_to_bt() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/mediatek/common/mtk-btcvsd.c:754 mtk_btcvsd_snd_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/mediatek/common/mtk-btcvsd.c:843 mtk_btcvsd_snd_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/mctp/mctp-serial.c:228 mctp_serial_tx_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/kaweth.c:537 kaweth_usb_receive() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/amazon/ena/ena_com.c:305 ena_com_submit_admin_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/amazon/ena/ena_com.c:546 ena_com_wait_and_process_admin_cq_polling() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/amazon/ena/ena_com.c:560 ena_com_wait_and_process_admin_cq_polling() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/amazon/ena/ena_com.c:1436 ena_com_wait_for_abort_completion() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:58 close_transaction() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:67 close_transaction() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:128 split_transaction_timeout_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:133 split_transaction_timeout_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:151 start_split_transaction_timeout() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:159 start_split_transaction_timeout() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:392 __fw_send_request() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:1070 fw_core_handle_response() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:1079 fw_core_handle_response() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:1234 handle_registers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/core-transaction.c:1248 handle_registers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/r8152.c:1890 read_bulk_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/r8152.c:2691 rx_bottom() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/r8152.c:2707 rx_bottom() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/r8152.c:3082 rtl_start_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/r8152.c:3086 rtl_start_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/r8152.c:3095 rtl_start_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/r8152.c:3132 rtl_stop_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/r8152.c:9975 rtl8152_probe_once() warn: missing error code 'ret'
drivers/firewire/ohci.c:1188 context_tasklet() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/ohci.c:1500 at_context_queue_packet() error: uninitialized symbol 'payload_bus'.
drivers/firewire/ohci.c:1744 at_context_transmit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/ohci.c:2747 ohci_enable_phys_dma() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/ohci.c:2786 ohci_read_csr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/ohci.c:2845 ohci_write_csr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/ohci.c:3290 ohci_free_iso_context() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/ohci.c:3313 ohci_set_iso_channels() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/ohci.c:3605 ohci_queue_iso() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firewire/ohci.c:3858 pci_probe() warn: why call request_threaded_irq() with a NULL thread
drivers/net/usb/lan78xx.c:2506 unlink_urbs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/lan78xx.c:3935 lan78xx_tx_bh() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/lan78xx.c:3965 lan78xx_tx_bh() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/usb/lan78xx.c:4029 lan78xx_bh() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/broadcom/b44.c:328 b44_phy_reset() error: uninitialized symbol 'val'.
drivers/net/ethernet/broadcom/b44.c:427 b44_setup_phy() error: uninitialized symbol 'val'.
drivers/net/ethernet/broadcom/b44.c:534 b44_check_phy() error: uninitialized symbol 'bmsr'.
drivers/net/ethernet/broadcom/b44.c:535 b44_check_phy() error: uninitialized symbol 'aux'.
drivers/net/ethernet/broadcom/b44.c:558 b44_check_phy() error: uninitialized symbol 'local_adv'.
drivers/net/ethernet/broadcom/b44.c:558 b44_check_phy() error: uninitialized symbol 'remote_adv'.
drivers/net/ethernet/broadcom/b44.c:874 b44_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/broadcom/b44.c:1796 b44_nway_reset() error: uninitialized symbol 'bmcr'.
drivers/net/ethernet/broadcom/b44.c:2032 b44_get_strings() error: __builtin_memcpy() '*b44_gstrings' too small (32 vs 1504)
drivers/net/ethernet/cadence/macb_main.c:3631 gem_add_flow_filter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cadence/macb_main.c:3668 gem_del_flow_filter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cadence/macb_main.c:5323 macb_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cadence/macb_main.c:5329 macb_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cadence/macb_main.c:5347 macb_suspend() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cadence/macb_main.c:5407 macb_resume() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/sprd/sprd-mcdt.c:587 sprd_mcdt_chan_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/sprd/sprd-mcdt.c:595 sprd_mcdt_chan_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/sprd/sprd-mcdt.c:602 sprd_mcdt_chan_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/sprd/sprd-mcdt.c:637 sprd_mcdt_chan_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/sprd/sprd-mcdt.c:648 sprd_mcdt_chan_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/sprd/sprd-mcdt.c:715 sprd_mcdt_chan_int_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/sprd/sprd-mcdt.c:757 sprd_mcdt_chan_int_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/sprd/sprd-mcdt.c:817 sprd_mcdt_chan_dma_enable() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/sprd/sprd-mcdt.c:855 sprd_mcdt_chan_dma_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/broadcom/tg3.c:2600 tg3_phy_reset_5703_4_5() error: uninitialized symbol 'phy9_orig'.
drivers/net/ethernet/broadcom/tg3.c:5974 tg3_setup_fiber_mii_phy() error: uninitialized symbol 'local_adv'.
drivers/net/ethernet/broadcom/tg3.c:5974 tg3_setup_fiber_mii_phy() error: uninitialized symbol 'remote_adv'.
drivers/net/ethernet/broadcom/tg3.c:10790 tg3_reset_hw() warn: inconsistent indenting
drivers/usb/core/hub.c:694 hub_resubmit_irq_urb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/hub.c:868 hub_tt_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:786 bnad_msix_mbox_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:811 bnad_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:818 bnad_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:1931 bnad_destroy_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:1988 bnad_setup_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2007 bnad_setup_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2014 bnad_setup_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2133 bnad_reinit_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2168 bnad_destroy_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2181 bnad_destroy_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2245 bnad_setup_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2249 bnad_setup_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2281 bnad_setup_rx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2634 bnad_enable_msix() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2661 bnad_enable_msix() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2686 bnad_enable_msix() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:2749 bnad_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:3227 bnad_set_rx_mode() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:3647 bnad_pci_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:3683 bnad_pci_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:3689 bnad_pci_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:3699 bnad_pci_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:3705 bnad_pci_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad.c:3733 bnad_pci_probe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_text.c:318 mon_text_fetch() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_bin.c:618 mon_bin_event() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_bin.c:671 mon_bin_error() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_bin.c:1057 mon_bin_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_bin.c:1117 mon_bin_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_bin.c:1265 mon_bin_vma_fault() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/mon/mon_bin.c:1330 mon_bin_wait_event() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/message.c:471 sg_complete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/message.c:734 usb_sg_cancel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/message.c:752 usb_sg_cancel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad_ethtool.c:400 bnad_set_coalesce() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad_ethtool.c:919 bnad_get_flash_partition_by_offset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad_ethtool.c:978 bnad_get_eeprom() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad_ethtool.c:1020 bnad_set_eeprom() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad_debugfs.c:157 bnad_get_debug_drvinfo() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad_debugfs.c:160 bnad_get_debug_drvinfo() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad_debugfs.c:171 bnad_get_debug_drvinfo() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/brocade/bna/bnad_debugfs.c:174 bnad_get_debug_drvinfo() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c:149 octeon_mbox_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c:159 octeon_mbox_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c:204 octeon_mbox_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c:317 octeon_mbox_process_message() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c:326 octeon_mbox_process_message() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c:344 octeon_mbox_process_message() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c:349 octeon_mbox_process_message() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/cavium/liquidio/octeon_mailbox.c:372 octeon_mbox_cancel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:838 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:898 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:1067 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:1080 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:1088 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:1146 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:1161 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hub.c:1182 ehci_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-sched.c:240 reserve_release_intr_bandwidth() error: buffer overflow 'ehci->bandwidth' 64 <= 65
drivers/usb/host/ehci-sched.c:1281 itd_urb_transaction() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-sched.c:1291 itd_urb_transaction() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-sched.c:1339 reserve_release_iso_bandwidth() error: buffer overflow 'ehci->bandwidth' 64 <= 70
drivers/usb/host/ehci-sched.c:1341 reserve_release_iso_bandwidth() error: buffer overflow 'ehci->bandwidth' 64 <= 70
drivers/usb/host/ehci-sched.c:2079 sitd_urb_transaction() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-sched.c:2094 sitd_urb_transaction() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ehci-hcd.c:1044 ehci_endpoint_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/devio.c:204 dec_usb_memory_use_count() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/devio.c:679 destroy_async() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/core/devio.c:2020 proc_unlinkurb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/cdc-acm.c:827 acm_tty_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/cdc-acm.c:839 acm_tty_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/cdc-acm.c:845 acm_tty_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/cdc-acm.c:850 acm_tty_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/oxu210hp-hcd.c:3386 oxu_urb_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/oxu210hp-hcd.c:3451 oxu_endpoint_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/oxu210hp-hcd.c:3741 oxu_hub_control() warn: inconsistent indenting
drivers/i2c/busses/i2c-mv64xxx.c:591 mv64xxx_i2c_wait_for_completion() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/c67x00/c67x00-sched.c:330 c67x00_endpoint_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/c67x00/c67x00-sched.c:434 c67x00_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/c67x00/c67x00-sched.c:464 c67x00_urb_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/i2c/busses/i2c-npcm7xx.c:636 npcm_i2c_slave_enable() error: buffer overflow 'npcm_i2caddr' 2 <= 9
drivers/i2c/busses/i2c-npcm7xx.c:1306 npcm_i2c_unreg_slave() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/usblp.c:951 usblp_wtest() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/usblp.c:1003 usblp_rtest() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/usblp.c:1039 usblp_submit_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/i2c/busses/i2c-rk3x.c:443 rk3x_i2c_handle_read() error: uninitialized symbol 'val'.
drivers/i2c/busses/i2c-rk3x.c:1131 rk3x_i2c_xfer_common() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/cdc-wdm.c:700 wdm_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/cdc-wdm.c:987 wdm_rxwork() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/class/cdc-wdm.c:995 wdm_rxwork() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/mc/mc-request.c:172 media_request_ioctl_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/mc/mc-request.c:206 media_request_ioctl_reinit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/mc/mc-request.c:210 media_request_ioctl_reinit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/mc/mc-request.c:216 media_request_ioctl_reinit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/ohci-hcd.c:398 ohci_endpoint_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
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
drivers/net/phy/micrel.c:1806 ksz9x31_cable_test_get_status() error: uninitialized symbol 'ret'.
drivers/i2c/busses/i2c-imx.c:939 i2c_imx_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/i2c/busses/i2c-imx.c:942 i2c_imx_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/i2c/saa6588.c:205 read_from_buf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/i2c/saa6588.c:217 read_from_buf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/generic.c:173 usb_serial_generic_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/generic.c:183 usb_serial_generic_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/generic.c:193 usb_serial_generic_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/host/r8a66597-hcd.c:2010 r8a66597_endpoint_disable() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/e100.c:946 mdio_ctrl_hw() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/e100.c:1278 e100_request_firmware() error: we previously assumed 'fw' could be null (see line 1259)
drivers/power/supply/power_supply_core.c:115 power_supply_changed_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/belkin_sa.c:399 belkin_sa_set_termios() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/e1000/e1000_main.c:4773 e1000_mii_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/e1000/e1000_main.c:4782 e1000_mii_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/e1000/e1000_main.c:4785 e1000_mii_ioctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:606 digi_transmit_idle() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:924 digi_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:948 digi_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:1014 digi_write_bulk_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/digi_acceleport.c:1521 digi_read_oob_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/igc/igc_main.c:2533 igc_xdp_run_prog() warn: passing zero to 'ERR_PTR'
drivers/net/ethernet/intel/igc/igc_main.c:2681 igc_clean_rx_irq() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/intel/igc/igc_main.c:2949 igc_xsk_request_timestamp() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/io_edgeport.c:647 edge_interrupt_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/io_edgeport.c:2357 change_port_settings() warn: inconsistent indenting
drivers/media/v4l2-core/v4l2-event.c:54 __v4l2_event_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/v4l2-core/v4l2-event.c:266 v4l2_event_subscribe() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/oti6858.c:242 setup_line() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/oti6858.c:251 setup_line() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/oti6858.c:278 send_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/oti6858.c:282 send_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/oti6858.c:314 send_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/oti6858.c:497 oti6858_set_termios() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/oti6858.c:741 oti6858_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/oti6858.c:748 oti6858_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/pl2303.c:900 pl2303_set_termios() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/common/siano/smscoreapi.c:1172 smscore_load_firmware_from_file() error: we previously assumed 'loadfirmware_handler' could be null (see line 1150)
drivers/gpu/drm/drm_vblank.c:1928 drm_handle_vblank() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:409 sierra_outdat_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:446 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:452 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:482 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:491 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:497 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:515 sierra_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/sierra.c:628 sierra_write_room() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/s2255/s2255drv.c:561 s2255_got_frame() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/e1000/e1000_hw.c:2941 e1000_write_phy_reg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/chipidea/usbmisc_imx.c:512 usbmisc_imx6_hsic_set_connect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/chipidea/usbmisc_imx.c:539 usbmisc_imx6_hsic_set_clk() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/chipidea/usbmisc_imx.c:720 imx7d_charger_secondary_detection() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/chipidea/usbmisc_imx.c:799 imx7d_charger_data_contact_detect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/usb_wwan.c:186 usb_wwan_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/usb_wwan.c:195 usb_wwan_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/ti_usb_3410_5052.c:1238 ti_bulk_in_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/ti_usb_3410_5052.c:1331 ti_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/ti_usb_3410_5052.c:1339 ti_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/ti_usb_3410_5052.c:1464 ti_restart_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:406 cypress_serial_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:411 cypress_serial_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:429 cypress_set_dead() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:703 cypress_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:730 cypress_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:733 cypress_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:735 cypress_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:756 cypress_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:786 cypress_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:949 cypress_set_termios() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:1052 cypress_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:1077 cypress_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:1107 cypress_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:1123 cypress_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:1127 cypress_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/cypress_m8.c:1139 cypress_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/core.c:815 __mmc_claim_host() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/core/core.c:846 mmc_release_host() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/io_ti.c:2041 edge_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/io_ti.c:2047 edge_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/garmin_gps.c:564 gsp_receive() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/garmin_gps.c:1014 garmin_write_bulk() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/garmin_gps.c:1202 garmin_read_bulk_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/garmin_gps.c:1260 garmin_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/garmin_gps.c:1269 garmin_read_int_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/tifm_sd.c:723 tifm_sd_request() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/tifm_sd.c:774 tifm_sd_end_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/tifm_sd.c:1015 tifm_sd_remove() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/ttusb-dec/ttusb_dec.c:788 ttusb_dec_process_urb_frame_list() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/ir-usb.c:305 ir_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/drm_debugfs_crc.c:416 drm_crtc_add_crc_entry() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/drm_debugfs_crc.c:432 drm_crtc_add_crc_entry() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/mediatek/mtk_eth_soc.c:2530 mtk_tx_alloc() error: uninitialized symbol 'txd'.
drivers/net/ethernet/intel/igc/igc_ptp.c:396 igc_ptp_feature_enable_i225() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/igc/igc_ptp.c:408 igc_ptp_feature_enable_i225() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/keyspan_pda.c:501 keyspan_pda_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/keyspan_pda.c:513 keyspan_pda_write_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/memstick/host/tifm_ms.c:469 tifm_ms_req_tasklet() error: we previously assumed 'host->req' could be null (see line 464)
drivers/memstick/host/tifm_ms.c:479 tifm_ms_req_tasklet() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/kl5kusb105.c:282 klsi_105_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/kl5kusb105.c:446 klsi_105_set_termios() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/kl5kusb105.c:480 klsi_105_set_termios() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_virthub.c:433 musb_hub_control() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_host.c:2161 musb_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_host.c:2290 musb_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/musb/musb_host.c:2296 musb_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/cqhci-core.c:267 __cqhci_enable() warn: bitwise AND condition is false here
drivers/usb/serial/mxuport.c:1114 mxuport_probe() warn: 'fw_p' from request_firmware() not released on lines: 1114.
drivers/firmware/arm_scmi/driver.c:693 scmi_xfer_get() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firmware/arm_scmi/driver.c:995 scmi_xfer_command_acquire() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firmware/arm_scmi/driver.c:1010 scmi_xfer_command_acquire() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/igb/igb_main.c:8983 igb_clean_rx_irq() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/microchip/lan743x_main.c:109 lan743x_pci_init() warn: missing error code 'ret'
drivers/usb/serial/opticon.c:209 opticon_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/opticon.c:263 opticon_write() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/serial/opticon.c:285 opticon_write_room() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/via-sdmmc.c:832 via_reset_pcictrl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/via-sdmmc.c:1019 via_sdc_card_detect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/neterion/s2io.c:857 init_shared_mem() error: uninitialized symbol 'tmp_p_addr'.
drivers/net/ethernet/neterion/s2io.c:3073 tx_intr_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/neterion/s2io.c:4088 s2io_xmit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/neterion/s2io.c:4104 s2io_xmit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/neterion/s2io.c:4179 s2io_xmit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/neterion/s2io.c:4191 s2io_xmit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/neterion/s2io.c:6800 set_rxd_buffer_pointer() warn: missing unwind goto?
drivers/usb/serial/spcp8x5.c:306 spcp8x5_set_termios() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/mmc_hsq.c:60 mmc_hsq_pump_requests() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/mmc_hsq.c:70 mmc_hsq_pump_requests() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/mmc_hsq.c:135 mmc_hsq_post_request() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/mmc_hsq.c:170 mmc_hsq_finalize_request() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000_pcie.c:486 nfp_alloc_bar() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000_pcie.c:503 nfp_alloc_bar() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_sysfs.c:207 vhci_port_disconnect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_sysfs.c:343 attach_store() warn: potential spectre issue 'vhcis' [r]
drivers/usb/usbip/vhci_sysfs.c:353 attach_store() warn: potential spectre issue 'vhci->vhci_hcd_ss->vdev' [r]
drivers/usb/usbip/vhci_sysfs.c:355 attach_store() warn: potential spectre issue 'vhci->vhci_hcd_hs->vdev' [r]
drivers/usb/usbip/vhci_sysfs.c:430 attach_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_tx.c:47 dequeue_from_priv_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_tx.c:182 dequeue_from_unlink_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_rx.c:105 vhci_recv_ret_submit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_rx.c:132 dequeue_pending_unlink() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_rx.c:176 vhci_recv_ret_unlink() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/qlogic/qla3xxx.c:548 ql_get_nvram_params() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/qlogic/qla3xxx.c:552 ql_get_nvram_params() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/qlogic/qla3xxx.c:1573 ql_link_state_machine_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/qlogic/qla3xxx.c:1670 ql_get_auto_cfg_status() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/qlogic/qla3xxx.c:1687 ql_get_speed() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/qlogic/qla3xxx.c:1704 ql_get_full_dup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/qlogic/qla3xxx.c:3512 ql_adapter_up() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/qlogic/qla3xxx.c:3684 ql_reset_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:729 vhci_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:804 vhci_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:811 vhci_urb_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:779 vhci_urb_enqueue() warn: missing error code 'ret'
drivers/usb/usbip/vhci_hcd.c:892 vhci_urb_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:917 vhci_urb_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:931 vhci_urb_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:950 vhci_urb_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/usbip/vhci_hcd.c:996 vhci_cleanup_unlink_list() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/realtek/8139cp.c:874 cp_start_xmit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/platform/goldfish/goldfish_pipe.c:644 goldfish_pipe_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/platform/goldfish/goldfish_pipe.c:753 goldfish_pipe_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/usb/usbtv/usbtv-video.c:454 usbtv_image_chunk() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/smsc/smc91x.c:686 smc_hard_start_xmit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/smsc/smc91x.c:2052 smc_probe() warn: 'dev->irq' from request_irq() not released on lines: 2052.
drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: replace divide condition 'shift / 16' with 'shift >= 16'
drivers/leds/leds-bcm6328.c:294 bcm6328_hwled() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/leds/leds-bcm6328.c:321 bcm6328_hwled() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/leds/leds-bcm6328.c:360 bcm6328_led() warn: replace divide condition 'shift / 16' with 'shift >= 16'
drivers/net/ethernet/intel/igb/igb_ptp.c:631 igb_ptp_feature_enable_82580() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/igb/igb_ptp.c:768 igb_ptp_feature_enable_i210() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/intel/igb/igb_ptp.c:780 igb_ptp_feature_enable_i210() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/smsc/smsc911x.c:890 smsc911x_phy_loopbacktest() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/smsc/smsc911x.c:898 smsc911x_phy_loopbacktest() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/ti/tlan.c:261 tlan_set_timer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/ti/tlan.c:1859 tlan_timer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/smsc/smsc9420.c:1342 smsc9420_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/smsc/smsc9420.c:1356 smsc9420_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/smsc/smsc9420.c:1417 smsc9420_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/xilinx/xilinx_emaclite.c:1020 xemaclite_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firmware/arm_scpi.c:409 scpi_process_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mailbox/mailbox.c:49 add_to_rbuf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mailbox/mailbox.c:90 msg_submit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/xilinx/ll_temac_main.c:688 temac_device_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/fealnx.c:873 netdev_open() warn: inconsistent indenting
drivers/hwspinlock/hwspinlock_core.c:142 __hwspin_trylock() warn: mixing irqsave and irq
drivers/hwspinlock/hwspinlock_core.c:295 __hwspin_unlock() warn: mixing irqsave and irq
drivers/mailbox/mtk-cmdq-mailbox.c:544 cmdq_mbox_flush() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/drm_fb_helper.c:399 drm_fb_helper_fb_dirty() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/extcon/extcon.c:469 extcon_sync() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/extcon/extcon.c:495 extcon_sync() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/extcon/extcon.c:660 extcon_get_property() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/extcon/extcon.c:685 extcon_get_property() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/extcon/extcon.c:752 extcon_set_property() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/scheduler/sched_fence.c:169 drm_sched_fence_set_deadline_finished() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1496 amdgpu_device_wb_get() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4448 amdgpu_device_init() warn: 'adev->rmmio' from ioremap() not released on lines: 4135,4145,4153,4158,4175,4448.
drivers/gpu/drm/radeon/radeon_ttm.c:546 radeon_ttm_tt_populate() error: we previously assumed 'gtt' could be null (see line 536)
drivers/extcon/extcon-rtk-type-c.c:557 detect_type_c_state() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/extcon/extcon-rtk-type-c.c:593 detect_type_c_state() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/extcon/extcon-rtk-type-c.c:628 host_device_switch() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/radeon/radeon_display.c:341 radeon_crtc_handle_vblank() error: uninitialized symbol 'vpos'.
drivers/gpu/drm/radeon/radeon_display.c:341 radeon_crtc_handle_vblank() error: uninitialized symbol 'hpos'.
drivers/gpu/drm/radeon/radeon_display.c:341 radeon_crtc_handle_vblank() error: uninitialized symbol 'hpos'.
drivers/gpu/drm/radeon/radeon_display.c:350 radeon_crtc_handle_vblank() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/radeon/radeon_display.c:392 radeon_crtc_handle_flip() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/radeon/radeon_display.c:600 radeon_crtc_page_flip_target() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/qxl/qxl_cmd.c:147 qxl_ring_push() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/qxl/qxl_cmd.c:173 qxl_ring_pop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/nouveau/nvkm/core/object.c:50 nvkm_object_search() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/nouveau/nvkm/core/object.c:97 nvkm_object_insert() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:283 amdgpu_display_crtc_page_flip_target() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/tidss/tidss_crtc.c:47 tidss_crtc_finish_page_flip() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/tidss/tidss_crtc.c:53 tidss_crtc_finish_page_flip() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/xe/xe_gt_pagefault.c:176 handle_vma_pagefault() error: uninitialized symbol 'fence'.
drivers/gpu/drm/xe/xe_gt_pagefault.c:182 handle_vma_pagefault() error: uninitialized symbol 'err'.
drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:468 xe_guc_tlb_invalidation_done_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:697 amdgpu_vm_flush() error: we previously assumed 'ring->funcs->emit_vm_flush' could be null (see line 679)
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1250 amdgpu_vm_bo_update() error: we previously assumed 'bo' could be null (see line 1190)
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2807 amdgpu_vm_handle_fault() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/vfio/pci/vfio_pci_intrs.c:557 vfio_msi_disable() warn: iterator 'i' not incremented
drivers/gpu/drm/radeon/ni.c:822 ni_init_microcode() warn: 'rdev->smc_fw' from request_firmware() not released on lines: 822.
drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:802 amdgpu_gmc_fw_reg_write_reg_wait() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/xe/xe_oa.c:372 xe_oa_append_reports() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/xe/xe_oa.c:1262 xe_oa_mmap() error: uninitialized symbol 'ret'.
drivers/comedi/comedi_fops.c:886 do_bufconfig_ioctl() warn: potential spectre issue 'dev->subdevices' [r] (local cap)
drivers/comedi/comedi_fops.c:1125 do_bufinfo_ioctl() warn: potential spectre issue 'dev->subdevices' [r] (local cap)
drivers/comedi/comedi_fops.c:2148 comedi_unlocked_ioctl() warn: missing error code? 'rc'
drivers/comedi/comedi_fops.c:3232 comedi_event() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/rpmsg_char.c:236 rpmsg_eptdev_read_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/edac/synopsys_edac.c:627 intr_handler() error: uninitialized symbol 'regval'.
drivers/greybus/operation.c:73 gb_operation_get_active() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/greybus/operation.c:175 gb_operation_result_set() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/greybus/operation.c:852 gb_operation_response_send() error: we previously assumed 'operation->response' could be null (see line 829)
drivers/rpmsg/qcom_glink_native.c:382 qcom_glink_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:482 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for 'req.name' (1010102 vs 32)
drivers/rpmsg/qcom_glink_native.c:494 qcom_glink_send_open_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:558 qcom_glink_rx_done_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:725 qcom_glink_alloc_intent() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:760 qcom_glink_handle_rx_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:771 qcom_glink_handle_rx_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:909 qcom_glink_rx_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1008 qcom_glink_handle_intent() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1551 qcom_glink_rx_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1555 qcom_glink_rx_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1590 qcom_glink_rx_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1628 qcom_glink_rx_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1651 qcom_glink_rx_close_ack() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1686 qcom_glink_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1862 qcom_glink_native_remove() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/greybus/es2.c:439 message_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/greybus/es2.c:1013 arpc_sync() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/greybus/es2.c:1064 arpc_in_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/dce_v6_0.c:3096 dce_v6_0_pageflip_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hwtracing/coresight/coresight-syscfg.c:1098 cscfg_csdev_enable_active_config() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hwtracing/coresight/coresight-trace-id.c:150 coresight_trace_id_release_all_pending() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hwtracing/coresight/coresight-trace-id.c:191 coresight_trace_id_map_get_cpu_id() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hwtracing/coresight/coresight-trace-id.c:220 coresight_trace_id_map_put_cpu_id() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/adl_pci7x3x.c:248 adl_pci7x3x_asy_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/adl_pci7x3x.c:272 adl_pci7x3x_asy_cancel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/xe/xe_sched_job.c:284 xe_sched_job_arm() error: uninitialized symbol 'fence'.
drivers/mtd/nand/raw/denali.c:179 denali_wait_for_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/gsc_hpdi.c:223 gsc_hpdi_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/cb_pcidas.c:1073 cb_pcidas_ao_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/cb_pcidas.c:1077 cb_pcidas_ao_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_660x.c:357 ni_660x_request_mite_channel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_pcidio.c:312 ni_pcidio_request_di_mite_channel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_mio_common.c:607 ni_request_ai_mite_channel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_mio_common.c:633 ni_request_ao_mite_channel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_mio_common.c:664 ni_request_gpct_mite_channel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_mio_common.c:697 ni_request_cdo_mite_channel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_mio_common.c:1482 ni_ai_setup_MITE_dma() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_mio_common.c:5965 ni_E_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_mio_common.c:5965 ni_E_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hwmon/npcm750-pwm-fan.c:503 npcm7xx_fan_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/dce_v11_0.c:3323 dce_v11_0_pageflip_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/dce_v10_0.c:3192 dce_v10_0_pageflip_irq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:136 amdgpu_gfx_parse_disable_cu() warn: potential spectre issue 'mask' [w]
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1069 amdgpu_kiq_rreg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:1132 amdgpu_kiq_wreg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4146 gfx_v9_0_kiq_read_clock() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:5652 gfx_v9_0_ring_preempt_ib() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4199 gfx_v10_0_init_microcode() warn: 'adev->gfx.rlc_fw' from request_firmware() not released on lines: 4199.
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:8723 gfx_v10_0_ring_preempt_ib() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c:4469 gfx_v12_0_ring_preempt_ib() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/mes_v11_0.c:266 mes_v11_0_submit_pkt_and_poll_completion() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:5865 gfx_v11_0_ring_preempt_ib() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:672 amdgpu_mes_add_hw_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:738 amdgpu_mes_add_hw_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:773 amdgpu_mes_remove_hw_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/mes_v12_0.c:254 mes_v12_0_submit_pkt_and_poll_completion() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c:76 nvkm_fan_update() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c:83 nvkm_fan_update() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:132 nvkm_chan_cctx_get() warn: inconsistent returns '&cgrp->mutex'.
drivers/gpu/drm/nouveau/dispnv04/crtc.c:1071 nv04_finish_page_flip() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/nouveau/dispnv04/crtc.c:1133 nv04_page_flip_emit() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +580 sound/i2c/other/ak4114.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  553  
97f02e05f246a2 Takashi Iwai   2005-11-17  554  int snd_ak4114_check_rate_and_errors(struct ak4114 *ak4114, unsigned int flags)
^1da177e4c3f41 Linus Torvalds 2005-04-16  555  {
97f02e05f246a2 Takashi Iwai   2005-11-17  556  	struct snd_pcm_runtime *runtime = ak4114->capture_substream ? ak4114->capture_substream->runtime : NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  557  	unsigned long _flags;
^1da177e4c3f41 Linus Torvalds 2005-04-16  558  	int res = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  559  	unsigned char rcs0, rcs1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  560  	unsigned char c0, c1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  561  
^1da177e4c3f41 Linus Torvalds 2005-04-16  562  	rcs1 = reg_read(ak4114, AK4114_REG_RCS1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  563  	if (flags & AK4114_CHECK_NO_STAT)
^1da177e4c3f41 Linus Torvalds 2005-04-16  564  		goto __rate;
^1da177e4c3f41 Linus Torvalds 2005-04-16  565  	rcs0 = reg_read(ak4114, AK4114_REG_RCS0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  566  	spin_lock_irqsave(&ak4114->lock, _flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  567  	if (rcs0 & AK4114_PAR)
239480ab92a525 Takashi Iwai   2017-05-12  568  		ak4114->errors[AK4114_PARITY_ERRORS]++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  569  	if (rcs1 & AK4114_V)
239480ab92a525 Takashi Iwai   2017-05-12  570  		ak4114->errors[AK4114_V_BIT_ERRORS]++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  571  	if (rcs1 & AK4114_CCRC)
239480ab92a525 Takashi Iwai   2017-05-12  572  		ak4114->errors[AK4114_CCRC_ERRORS]++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  573  	if (rcs1 & AK4114_QCRC)
239480ab92a525 Takashi Iwai   2017-05-12  574  		ak4114->errors[AK4114_QCRC_ERRORS]++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  575  	c0 = (ak4114->rcs0 & (AK4114_QINT | AK4114_CINT | AK4114_PEM | AK4114_AUDION | AK4114_AUTO | AK4114_UNLCK)) ^
^1da177e4c3f41 Linus Torvalds 2005-04-16  576                       (rcs0 & (AK4114_QINT | AK4114_CINT | AK4114_PEM | AK4114_AUDION | AK4114_AUTO | AK4114_UNLCK));
^1da177e4c3f41 Linus Torvalds 2005-04-16  577  	c1 = (ak4114->rcs1 & 0xf0) ^ (rcs1 & 0xf0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  578  	ak4114->rcs0 = rcs0 & ~(AK4114_QINT | AK4114_CINT);
^1da177e4c3f41 Linus Torvalds 2005-04-16  579  	ak4114->rcs1 = rcs1;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @580  	spin_unlock_irqrestore(&ak4114->lock, _flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  581  
51354ae3b8fdbe Takashi Iwai   2007-03-30  582  	ak4114_notify(ak4114, rcs0, rcs1, c0, c1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  583  	if (ak4114->change_callback && (c0 | c1) != 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  584  		ak4114->change_callback(ak4114, c0, c1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  585  
^1da177e4c3f41 Linus Torvalds 2005-04-16  586        __rate:
^1da177e4c3f41 Linus Torvalds 2005-04-16  587  	/* compare rate */
^1da177e4c3f41 Linus Torvalds 2005-04-16  588  	res = external_rate(rcs1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  589  	if (!(flags & AK4114_CHECK_NO_RATE) && runtime && runtime->rate != res) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  590  		snd_pcm_stream_lock_irqsave(ak4114->capture_substream, _flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  591  		if (snd_pcm_running(ak4114->capture_substream)) {
99b359ba10a582 Takashi Iwai   2005-10-20  592  			// printk(KERN_DEBUG "rate changed (%i <- %i)\n", runtime->rate, res);
^1da177e4c3f41 Linus Torvalds 2005-04-16  593  			snd_pcm_stop(ak4114->capture_substream, SNDRV_PCM_STATE_DRAINING);
^1da177e4c3f41 Linus Torvalds 2005-04-16  594  			res = 1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  595  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  596  		snd_pcm_stream_unlock_irqrestore(ak4114->capture_substream, _flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  597  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  598  	return res;
^1da177e4c3f41 Linus Torvalds 2005-04-16  599  }
a850ef8afd3cd1 Takashi Iwai   2015-01-13  600  EXPORT_SYMBOL(snd_ak4114_check_rate_and_errors);
^1da177e4c3f41 Linus Torvalds 2005-04-16  601  

:::::: The code at line 580 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
