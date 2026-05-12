Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05983655C2
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 18:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612402; cv=none; b=nZoqpLqqRTy7TSpaw4JJvcLJUktBm+dafKYHmAoawuIXlkm0OJDcFIYwCOAq+ezhiHoPFkhC//d6PZfGZh6zhGHof83YGgzVwaMUaY83kzYsjkl/q0aAYBnSfu+uHYqbUrwteEQzZ1JImLIaGtjnor7SfCSDwz9sSexhDzJuC/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612402; c=relaxed/simple;
	bh=bVOAr+64WjExhtItKIiMp1/VH+pHqUe5OoiYHo9HpK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ICWVwSy7HovGDPCyyfv7zq80Tj6VPmzdo67EfZdgJfxmz+aVTaw6Ib1VEbxsY+h6DRqTvjRcs1Sp4FBhqQYShleu5r6ZLA90cYsN6S5dYWddAtdSccLr+LwypoU9LF5l3rK8gYJaQpXaJF1b5b91BTMyoXAMoRM/LKUDql6AlHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTQnLNog; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTQnLNog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778612400; x=1810148400;
  h=date:from:to:cc:subject:message-id;
  bh=bVOAr+64WjExhtItKIiMp1/VH+pHqUe5OoiYHo9HpK4=;
  b=nTQnLNogW8UYAoEknAwVGgoDzrQrIMePj4hzpNhUJ9TIPUBiC5LCIWCl
   zumnC/ssQn87shsjdOlgjXU+l3IgWOKredWX0x9kQwYp7IG96TF8YfRyQ
   caLNWAwdIbG0zFkDwd7fZ+aaGanoIUIb0Sfu/KRYjrj7L5lh+VYeV8ACW
   HgKuGpdKFxh2JKklR9aMWCwzGY5QxASwLGoimaLW4EtbxGJM+ZOheY0tn
   iBNs358/UirKRpFElpkcIiAUVjPx11JmDTRwn9k0qKakoNSY7BHPvUN+y
   X8FZa06/+HIioTwCmNMFD4qkW3c9hOI842h7Zbelj+sqASAiVe8qTNAMH
   g==;
X-CSE-ConnectionGUID: aO0E3xy/TvKcdIgc7F5SSw==
X-CSE-MsgGUID: 6tg4lB8FQ8SLwGXiTMmckQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79641573"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79641573"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:59:59 -0700
X-CSE-ConnectionGUID: WZ5aSn+eSKivNFGAfuPUdA==
X-CSE-MsgGUID: LcLKPsMzTGSK2WAAPJFSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="261334274"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2026 11:59:57 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMsKh-000000002ed-2OIT;
	Tue, 12 May 2026 18:59:55 +0000
Date: Wed, 13 May 2026 02:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3981/4394] drivers/slimbus/messaging.c:72
 slim_alloc_txn_tid() error: calling 'spin_unlock_irqrestore()' with bogus
 flags
Message-ID: <202605130205.fnYUdJrZ-lkp@intel.com>
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
:::::: commit date: 5 days ago
config: i386-randconfig-141-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130205.fnYUdJrZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605130205.fnYUdJrZ-lkp@intel.com/

New smatch warnings:
drivers/slimbus/messaging.c:72 slim_alloc_txn_tid() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/das800.c:451 das800_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/hvc/hvc_console.c:689 __hvc_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/intel/atom/sst/sst.c:140 intel_sst_irq_thread_mrfld() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/crypto/virtio/virtio_crypto_core.c:46 virtcrypto_ctrlq_callback() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/crypto/virtio/virtio_crypto_core.c:91 virtcrypto_done_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma-buf/sw_sync.c:440 sw_sync_ioctl_get_deadline() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_error.c:2569 scsi_ioctl_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/common/siano/smscoreapi.c:1633 get_entry() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_scan.c:561 scsi_alloc_target() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/random.c:162 execute_with_initialized_rng() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/target/target_core_transport.c:3693 transport_generic_handle_tmr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-scsi.c:5045 ata_scsi_dev_rescan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_lib.c:544 scsi_starved_list_run() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/i2c/saa6588.c:193 read_from_buf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:833 ata_scsi_port_error_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:862 ata_port_wait_eh() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3174 ata_eh_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3174 ata_eh_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/host/fc.c:1053 __nvme_fc_send_ls_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/host/fc.c:1498 nvme_fc_match_disconn_ls() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/host/fc.c:3795 nvme_fc_nvme_discovery_store() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid1.c:417 raid1_end_read_request() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-core.c:6286 ata_port_detach() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/advansys.c:7157 advansys_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/ni_tio.c:279 ni_tio_get_soft_copy() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/direct-io.c:492 dio_await_one() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/dm-dust.c:445 dust_message() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_memory.c:293 snd_seq_cell_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/rawmidi.c:1258 snd_rawmidi_kernel_read1() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/rawmidi.c:1574 snd_rawmidi_kernel_write1() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/seq_fifo.c:187 snd_seq_fifo_cell_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/shuffle.c:141 __shuffle_zone() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/fsl/fsl_xcvr.c:558 fsl_xcvr_en_aud_pll() warn: 'xcvr->phy_clk' from clk_prepare_enable() not released on lines: 538.
sound/soc/fsl/fsl_xcvr.c:916 fsl_xcvr_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/soc/fsl/fsl_easrc.c:1058 fsl_easrc_config_context() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_sysfs.c:365 store_shost_eh_deadline() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid5.c:353 release_inactive_stripe_list() error: calling 'spin_unlock_irqrestore()' with bogus flags
crypto/crypto_engine.c:169 crypto_pump_requests() error: calling 'spin_unlock_irqrestore()' with bogus flags
crypto/crypto_engine.c:402 crypto_engine_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/ext4/page-io.c:141 ext4_finish_bio() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_logmgr.c:2301 lbmIODone() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_txnmgr.c:2755 jfs_lazycommit() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/slimbus/messaging.c:76 slim_alloc_txn_tid() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/das800.c:483 das800_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/das800.c:496 das800_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/das800.c:499 das800_interrupt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/das800.c:727 das800_attach() warn: 'irq' from request_irq() not released on lines: 679,683.
drivers/tty/hvc/hvc_console.c:748 __hvc_poll() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/dma-buf/sw_sync.c:453 sw_sync_ioctl_get_deadline() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/libata-eh.c:3112 ata_eh_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/host/fc.c:1067 __nvme_fc_send_ls_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/host/fc.c:3210 nvme_fc_delete_association() warn: mixing irqsave and irq
drivers/ata/libata-core.c:5355 ata_port_request_pm() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/advansys.c:2670 advansys_info() warn: argument 5 to %lX specifier is cast from pointer
drivers/comedi/drivers/ni_tio.c:1732 ni_tio_init_counter() error: buffer overflow 'counter_dev->regs[chip]' 70 <= u32max
sound/core/seq/seq_memory.c:329 snd_seq_cell_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/md/raid5.c:8587 raid5_start_reshape() warn: mixing irq and irqsave
crypto/crypto_engine.c:412 crypto_engine_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
fs/jfs/jfs_txnmgr.c:2762 jfs_lazycommit() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +72 drivers/slimbus/messaging.c

afbdcc7c384b0d4 Sagar Dharia        2017-12-11  54  
d3062a21093093b Srinivas Kandagatla 2018-06-19  55  /**
d3062a21093093b Srinivas Kandagatla 2018-06-19  56   * slim_alloc_txn_tid() - Allocate a tid to txn
d3062a21093093b Srinivas Kandagatla 2018-06-19  57   *
d3062a21093093b Srinivas Kandagatla 2018-06-19  58   * @ctrl: Controller handle
d3062a21093093b Srinivas Kandagatla 2018-06-19  59   * @txn: transaction to be allocated with tid.
d3062a21093093b Srinivas Kandagatla 2018-06-19  60   *
d3062a21093093b Srinivas Kandagatla 2018-06-19  61   * Return: zero on success with valid txn->tid and error code on failures.
d3062a21093093b Srinivas Kandagatla 2018-06-19  62   */
d3062a21093093b Srinivas Kandagatla 2018-06-19  63  int slim_alloc_txn_tid(struct slim_controller *ctrl, struct slim_msg_txn *txn)
d3062a21093093b Srinivas Kandagatla 2018-06-19  64  {
d3062a21093093b Srinivas Kandagatla 2018-06-19  65  	unsigned long flags;
d3062a21093093b Srinivas Kandagatla 2018-06-19  66  	int ret = 0;
d3062a21093093b Srinivas Kandagatla 2018-06-19  67  
d3062a21093093b Srinivas Kandagatla 2018-06-19  68  	spin_lock_irqsave(&ctrl->txn_lock, flags);
9659281ce78de0f Srinivas Kandagatla 2021-08-09  69  	ret = idr_alloc_cyclic(&ctrl->tid_idr, txn, 1,
d3062a21093093b Srinivas Kandagatla 2018-06-19  70  				SLIM_MAX_TIDS, GFP_ATOMIC);
d3062a21093093b Srinivas Kandagatla 2018-06-19  71  	if (ret < 0) {
d3062a21093093b Srinivas Kandagatla 2018-06-19 @72  		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
d3062a21093093b Srinivas Kandagatla 2018-06-19  73  		return ret;
d3062a21093093b Srinivas Kandagatla 2018-06-19  74  	}
d3062a21093093b Srinivas Kandagatla 2018-06-19  75  	txn->tid = ret;
d3062a21093093b Srinivas Kandagatla 2018-06-19  76  	spin_unlock_irqrestore(&ctrl->txn_lock, flags);
d3062a21093093b Srinivas Kandagatla 2018-06-19  77  	return 0;
d3062a21093093b Srinivas Kandagatla 2018-06-19  78  }
d3062a21093093b Srinivas Kandagatla 2018-06-19  79  EXPORT_SYMBOL_GPL(slim_alloc_txn_tid);
d3062a21093093b Srinivas Kandagatla 2018-06-19  80  

:::::: The code at line 72 was first introduced by commit
:::::: d3062a21093093bc77a8ebf1b555e380993993e7 slimbus: messaging: add slim_alloc/free_txn_tid()

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
