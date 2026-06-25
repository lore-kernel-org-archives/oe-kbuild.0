Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909F92309AA
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jun 2026 05:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782363886; cv=none; b=rhOeXd2vzP8I1CplfPjawGOA053Pdsgo8GCezMMA8VPnzw3gQljErynuX2dNYSihHbE+YmTAu6ij5P/IN8Iw0lXkUGZAEQp4UzG78hI61bcYJAe3IwayxcLPE6g2o3jH5zud9e/KrqYuvUOrb6c18a/WGCdYaZSGZRs9epO/BU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782363886; c=relaxed/simple;
	bh=EPzklM4zsfLAohE+W+6RafouhYYrPTtau44wmaIRuM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KKaSDST+d7vh6jNtj2kWTINZdDTDuM2vGDWtSTUQkuRD+f6xWPDKB95fWPp6F56X4MGo1beuVYQ0+0eh0LdyT8rXV9LqbIsNyhGJZRtsAhjdIdrAHDOdzLxgTZf83OgB9mRXI9iwC69vn01c6sKgbexMajTsLrue1+Lv26FOaSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xa/RjJ5t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xa/RjJ5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782363885; x=1813899885;
  h=date:from:to:cc:subject:message-id;
  bh=EPzklM4zsfLAohE+W+6RafouhYYrPTtau44wmaIRuM8=;
  b=Xa/RjJ5tNrtdRqZCwo3r9u+mKsxN9eq0qP+PheMHBBgGqEe2ZduLz2eD
   rFt0y+/zrFqMnBo09Nzf3DF0UuxGFangViv0X6vhs5EGJJr6FtXkZp1KH
   wiiXdkFiRF0rff4eH5OuU8XEZEy8lE9qNmz4iT1Z1a+X/obejUUTValRt
   VfDxPm490kXIvGpCnU3SIsDg10/TFG9FuCTTbP1pvGdIEp1QcJLn/PMJ/
   lsw00rho1RjIi3RRKcGqoe0RGO72tBJYeP8SYNPpAhccoYyxZU5wYA52v
   aoAhgPWgnKGhF6vPARUfSaD3bEEmHZxvTdGhN1wykrTv15jB351ovpBMS
   g==;
X-CSE-ConnectionGUID: qZuZOe3KT1in/PwKly3zVg==
X-CSE-MsgGUID: TFhEQsSuREGG3RhHvNcUNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="100561642"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="100561642"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 22:04:45 -0700
X-CSE-ConnectionGUID: qmBivYaOSOCQRoNxebg0Jw==
X-CSE-MsgGUID: VxiVXloKRuO5Iqv+WDksfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="248986558"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Jun 2026 22:04:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wccGW-000000003tl-0qpF;
	Thu, 25 Jun 2026 05:04:40 +0000
Date: Thu, 25 Jun 2026 13:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11135/15099] drivers/char/sonypi.c:766
 input_keyrelease() error: calling 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202606251222.MpiSOBwu-lkp@intel.com>
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
head:   4e5dfb7c84012007c3c7061126491bbc92d71bf1
commit: e07d10ed0f238d3f4a8276932a36fe1f74775621 [11135/15099] lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-r073-20260624 (https://download.01.org/0day-ci/archive/20260625/202606251222.MpiSOBwu-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606251222.MpiSOBwu-lkp@intel.com/

New smatch warnings:
drivers/char/sonypi.c:766 input_keyrelease() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/char/sonypi.c:915 sonypi_misc_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/misc/hpilo.c:605 ilo_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virt/vboxguest/vboxguest_core.c:798 vbg_acquire_session_capabilities() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virt/vboxguest/vboxguest_core.c:1246 vbg_ioctl_wait_for_events() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hte/hte.c:221 hte_ts_put() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hte/hte.c:301 hte_ts_dis_en_common() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:378 qcom_glink_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:519 qcom_glink_send_open_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:592 qcom_glink_rx_done_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1508 __qcom_glink_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:1705 qcom_glink_rx_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/rc/serial_ir.c:667 serial_ir_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/rc/ite-cir.c:449 ite_tx_ir() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virtio/virtio_rtc_driver.c:253 viortc_do_cb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/pci/ivtv/ivtv-queue.c:129 ivtv_queue_move() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:749 amdgpu_ring_set_fence_errors_and_reemit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/hid-nintendo.c:844 joycon_enforce_subcmd_rate() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:285 amdgpu_display_crtc_page_flip_target() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/platform/x86/intel_ips.c:666 mch_exceeded() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/i2c/busses/i2c-elektor.c:116 pcf_isa_waitforpin() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/slub.c:3835 get_from_partial_node() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/slub.c:4392 alloc_from_new_slab() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/comedi/drivers/amplc_pc236_common.c:53 pc236_intr_check() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/test_context-analysis.c:110 test_spinlock() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/test_context-analysis.c:127 test_spinlock_trylock_extra() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:3603 gfx_v9_4_3_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9562 gfx_v10_0_reset_kgq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:9632 gfx_v10_0_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:7318 gfx_v9_0_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/rpmsg/qcom_glink_native.c:393 qcom_glink_tx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rpmsg/qcom_glink_native.c:504 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)
drivers/media/rc/ite-cir.c:469 ite_tx_ir() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/virtio/virtio_rtc_driver.c:259 viortc_do_cb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/pci/ivtv/ivtv-queue.c:169 ivtv_queue_move() error: calling 'spin_unlock_irqrestore()' with bogus flags
lib/test_context-analysis.c:103 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:541 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_context-analysis.c:127 test_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:593 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/mutex.h:254 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/rwsem.h:260 class_rwsem_read_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/rwsem.h:271 class_rwsem_write_try_constructor() warn: passing zero to 'ERR_PTR'
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:2201 gfx_v9_4_3_xcc_kcq_fini_register() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:2231 gfx_v9_4_3_xcc_kcq_resume() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:3307 gfx_v9_4_3_eop_irq() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:3343 gfx_v9_4_3_fault() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:3609 gfx_v9_4_3_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:4800 gfx_v9_4_3_set_ring_funcs() error: buffer overflow 'adev->gfx.compute_ring' 64 <= u32max
drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:4292 gfx_v10_0_init_microcode() warn: 'adev->gfx.rlc_fw' from request_firmware() not released on lines: 4292.
drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:7324 gfx_v9_0_reset_kcq() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +766 drivers/char/sonypi.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  761  
c4028958b6ecad0 David Howells     2006-11-22  762  static void input_keyrelease(struct work_struct *work)
^1da177e4c3f415 Linus Torvalds    2005-04-16  763  {
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  764  	struct sonypi_keypress kp;
^1da177e4c3f415 Linus Torvalds    2005-04-16  765  
7acd72eb85f1c7a Stefani Seibold   2009-12-21 @766  	while (kfifo_out_locked(&sonypi_device.input_fifo, (unsigned char *)&kp,
c1e13f25674ed56 Stefani Seibold   2009-12-21  767  			 sizeof(kp), &sonypi_device.input_fifo_lock)
c1e13f25674ed56 Stefani Seibold   2009-12-21  768  			== sizeof(kp)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  769  		msleep(10);
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  770  		input_report_key(kp.dev, kp.key, 0);
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  771  		input_sync(kp.dev);
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  772  	}
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  773  }
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  774  
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  775  static void sonypi_report_input_event(u8 event)
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  776  {
b416f2e452b6c0f Dmitry Torokhov   2005-09-15  777  	struct input_dev *jog_dev = sonypi_device.input_jog_dev;
b416f2e452b6c0f Dmitry Torokhov   2005-09-15  778  	struct input_dev *key_dev = sonypi_device.input_key_dev;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  779  	struct sonypi_keypress kp = { NULL };
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  780  	int i;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  781  
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  782  	switch (event) {
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  783  	case SONYPI_EVENT_JOGDIAL_UP:
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  784  	case SONYPI_EVENT_JOGDIAL_UP_PRESSED:
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  785  		input_report_rel(jog_dev, REL_WHEEL, 1);
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  786  		input_sync(jog_dev);
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  787  		break;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  788  
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  789  	case SONYPI_EVENT_JOGDIAL_DOWN:
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  790  	case SONYPI_EVENT_JOGDIAL_DOWN_PRESSED:
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  791  		input_report_rel(jog_dev, REL_WHEEL, -1);
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  792  		input_sync(jog_dev);
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  793  		break;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  794  
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  795  	case SONYPI_EVENT_JOGDIAL_PRESSED:
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  796  		kp.key = BTN_MIDDLE;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  797  		kp.dev = jog_dev;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  798  		break;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  799  
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  800  	case SONYPI_EVENT_FNKEY_RELEASED:
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  801  		/* Nothing, not all VAIOs generate this event */
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  802  		break;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  803  
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  804  	default:
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  805  		for (i = 0; sonypi_inputkeys[i].sonypiev; i++)
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  806  			if (event == sonypi_inputkeys[i].sonypiev) {
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  807  				kp.dev = key_dev;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  808  				kp.key = sonypi_inputkeys[i].inputev;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  809  				break;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  810  			}
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  811  		break;
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  812  	}
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  813  
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  814  	if (kp.dev) {
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  815  		input_report_key(kp.dev, kp.key, 1);
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  816  		input_sync(kp.dev);
7acd72eb85f1c7a Stefani Seibold   2009-12-21  817  		kfifo_in_locked(&sonypi_device.input_fifo,
c1e13f25674ed56 Stefani Seibold   2009-12-21  818  			(unsigned char *)&kp, sizeof(kp),
c1e13f25674ed56 Stefani Seibold   2009-12-21  819  			&sonypi_device.input_fifo_lock);
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  820  		schedule_work(&sonypi_device.input_work);
^1da177e4c3f415 Linus Torvalds    2005-04-16  821  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  822  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  823  
^1da177e4c3f415 Linus Torvalds    2005-04-16  824  /* Interrupt handler: some event is available */
7d12e780e003f93 David Howells     2006-10-05  825  static irqreturn_t sonypi_irq(int irq, void *dev_id)
^1da177e4c3f415 Linus Torvalds    2005-04-16  826  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  827  	u8 v1, v2, event = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  828  	int i, j;
^1da177e4c3f415 Linus Torvalds    2005-04-16  829  
^1da177e4c3f415 Linus Torvalds    2005-04-16  830  	v1 = inb_p(sonypi_device.ioport1);
^1da177e4c3f415 Linus Torvalds    2005-04-16  831  	v2 = inb_p(sonypi_device.ioport1 + sonypi_device.evtype_offset);
^1da177e4c3f415 Linus Torvalds    2005-04-16  832  
^1da177e4c3f415 Linus Torvalds    2005-04-16  833  	for (i = 0; sonypi_eventtypes[i].model; i++) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  834  		if (sonypi_device.model != sonypi_eventtypes[i].model)
^1da177e4c3f415 Linus Torvalds    2005-04-16  835  			continue;
^1da177e4c3f415 Linus Torvalds    2005-04-16  836  		if ((v2 & sonypi_eventtypes[i].data) !=
^1da177e4c3f415 Linus Torvalds    2005-04-16  837  		    sonypi_eventtypes[i].data)
^1da177e4c3f415 Linus Torvalds    2005-04-16  838  			continue;
^1da177e4c3f415 Linus Torvalds    2005-04-16  839  		if (!(mask & sonypi_eventtypes[i].mask))
^1da177e4c3f415 Linus Torvalds    2005-04-16  840  			continue;
^1da177e4c3f415 Linus Torvalds    2005-04-16  841  		for (j = 0; sonypi_eventtypes[i].events[j].event; j++) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  842  			if (v1 == sonypi_eventtypes[i].events[j].data) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  843  				event = sonypi_eventtypes[i].events[j].event;
^1da177e4c3f415 Linus Torvalds    2005-04-16  844  				goto found;
^1da177e4c3f415 Linus Torvalds    2005-04-16  845  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  846  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  847  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  848  
^1da177e4c3f415 Linus Torvalds    2005-04-16  849  	if (verbose)
^1da177e4c3f415 Linus Torvalds    2005-04-16  850  		printk(KERN_WARNING
^1da177e4c3f415 Linus Torvalds    2005-04-16  851  		       "sonypi: unknown event port1=0x%02x,port2=0x%02x\n",
^1da177e4c3f415 Linus Torvalds    2005-04-16  852  		       v1, v2);
^1da177e4c3f415 Linus Torvalds    2005-04-16  853  	/* We need to return IRQ_HANDLED here because there *are*
^1da177e4c3f415 Linus Torvalds    2005-04-16  854  	 * events belonging to the sonypi device we don't know about,
^1da177e4c3f415 Linus Torvalds    2005-04-16  855  	 * but we still don't want those to pollute the logs... */
^1da177e4c3f415 Linus Torvalds    2005-04-16  856  	return IRQ_HANDLED;
^1da177e4c3f415 Linus Torvalds    2005-04-16  857  
^1da177e4c3f415 Linus Torvalds    2005-04-16  858  found:
^1da177e4c3f415 Linus Torvalds    2005-04-16  859  	if (verbose > 1)
^1da177e4c3f415 Linus Torvalds    2005-04-16  860  		printk(KERN_INFO
^1da177e4c3f415 Linus Torvalds    2005-04-16  861  		       "sonypi: event port1=0x%02x,port2=0x%02x\n", v1, v2);
^1da177e4c3f415 Linus Torvalds    2005-04-16  862  
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  863  	if (useinput)
fb2ce3c005ede30 Dmitry Torokhov   2005-06-30  864  		sonypi_report_input_event(event);
^1da177e4c3f415 Linus Torvalds    2005-04-16  865  
7acd72eb85f1c7a Stefani Seibold   2009-12-21  866  	kfifo_in_locked(&sonypi_device.fifo, (unsigned char *)&event,
c1e13f25674ed56 Stefani Seibold   2009-12-21  867  			sizeof(event), &sonypi_device.fifo_lock);
^1da177e4c3f415 Linus Torvalds    2005-04-16  868  	kill_fasync(&sonypi_device.fifo_async, SIGIO, POLL_IN);
^1da177e4c3f415 Linus Torvalds    2005-04-16  869  	wake_up_interruptible(&sonypi_device.fifo_proc_list);
^1da177e4c3f415 Linus Torvalds    2005-04-16  870  
^1da177e4c3f415 Linus Torvalds    2005-04-16  871  	return IRQ_HANDLED;
^1da177e4c3f415 Linus Torvalds    2005-04-16  872  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  873  
^1da177e4c3f415 Linus Torvalds    2005-04-16  874  static int sonypi_misc_fasync(int fd, struct file *filp, int on)
^1da177e4c3f415 Linus Torvalds    2005-04-16  875  {
60aa49243d09afc Jonathan Corbet   2009-02-01  876  	return fasync_helper(fd, filp, on, &sonypi_device.fifo_async);
^1da177e4c3f415 Linus Torvalds    2005-04-16  877  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  878  
^1da177e4c3f415 Linus Torvalds    2005-04-16  879  static int sonypi_misc_release(struct inode *inode, struct file *file)
^1da177e4c3f415 Linus Torvalds    2005-04-16  880  {
c6c60106b9584f1 Matthias Kaehlcke 2007-04-24  881  	mutex_lock(&sonypi_device.lock);
^1da177e4c3f415 Linus Torvalds    2005-04-16  882  	sonypi_device.open_count--;
c6c60106b9584f1 Matthias Kaehlcke 2007-04-24  883  	mutex_unlock(&sonypi_device.lock);
^1da177e4c3f415 Linus Torvalds    2005-04-16  884  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  885  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  886  
^1da177e4c3f415 Linus Torvalds    2005-04-16  887  static int sonypi_misc_open(struct inode *inode, struct file *file)
^1da177e4c3f415 Linus Torvalds    2005-04-16  888  {
c6c60106b9584f1 Matthias Kaehlcke 2007-04-24  889  	mutex_lock(&sonypi_device.lock);
^1da177e4c3f415 Linus Torvalds    2005-04-16  890  	/* Flush input queue on first open */
^1da177e4c3f415 Linus Torvalds    2005-04-16  891  	if (!sonypi_device.open_count)
45465487897a1c6 Stefani Seibold   2009-12-21  892  		kfifo_reset(&sonypi_device.fifo);
^1da177e4c3f415 Linus Torvalds    2005-04-16  893  	sonypi_device.open_count++;
c6c60106b9584f1 Matthias Kaehlcke 2007-04-24  894  	mutex_unlock(&sonypi_device.lock);
6432e734c99ed68 John Kacur        2009-10-18  895  
^1da177e4c3f415 Linus Torvalds    2005-04-16  896  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  897  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  898  
^1da177e4c3f415 Linus Torvalds    2005-04-16  899  static ssize_t sonypi_misc_read(struct file *file, char __user *buf,
^1da177e4c3f415 Linus Torvalds    2005-04-16  900  				size_t count, loff_t *pos)
^1da177e4c3f415 Linus Torvalds    2005-04-16  901  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  902  	ssize_t ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  903  	unsigned char c;
^1da177e4c3f415 Linus Torvalds    2005-04-16  904  
45465487897a1c6 Stefani Seibold   2009-12-21  905  	if ((kfifo_len(&sonypi_device.fifo) == 0) &&
^1da177e4c3f415 Linus Torvalds    2005-04-16  906  	    (file->f_flags & O_NONBLOCK))
^1da177e4c3f415 Linus Torvalds    2005-04-16  907  		return -EAGAIN;
^1da177e4c3f415 Linus Torvalds    2005-04-16  908  
^1da177e4c3f415 Linus Torvalds    2005-04-16  909  	ret = wait_event_interruptible(sonypi_device.fifo_proc_list,
45465487897a1c6 Stefani Seibold   2009-12-21  910  				       kfifo_len(&sonypi_device.fifo) != 0);
^1da177e4c3f415 Linus Torvalds    2005-04-16  911  	if (ret)
^1da177e4c3f415 Linus Torvalds    2005-04-16  912  		return ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  913  
^1da177e4c3f415 Linus Torvalds    2005-04-16  914  	while (ret < count &&
7acd72eb85f1c7a Stefani Seibold   2009-12-21 @915  	       (kfifo_out_locked(&sonypi_device.fifo, &c, sizeof(c),
c1e13f25674ed56 Stefani Seibold   2009-12-21  916  				 &sonypi_device.fifo_lock) == sizeof(c))) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  917  		if (put_user(c, buf++))
^1da177e4c3f415 Linus Torvalds    2005-04-16  918  			return -EFAULT;
^1da177e4c3f415 Linus Torvalds    2005-04-16  919  		ret++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  920  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  921  
^1da177e4c3f415 Linus Torvalds    2005-04-16  922  	if (ret > 0) {
496ad9aa8ef4480 Al Viro           2013-01-23  923  		struct inode *inode = file_inode(file);
19f926a688f99a4 Jeff Layton       2023-10-04  924  		inode_set_atime_to_ts(inode, current_time(inode));
^1da177e4c3f415 Linus Torvalds    2005-04-16  925  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  926  
^1da177e4c3f415 Linus Torvalds    2005-04-16  927  	return ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  928  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  929  

:::::: The code at line 766 was first introduced by commit
:::::: 7acd72eb85f1c7a15e8b5eb554994949241737f1 kfifo: rename kfifo_put... into kfifo_in... and kfifo_get... into kfifo_out...

:::::: TO: Stefani Seibold <stefani@seibold.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
