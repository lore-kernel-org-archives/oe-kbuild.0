Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F1156C6A
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 03:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781407879; cv=none; b=qyVG5Q52O6AZN2l4hYz/jopYEBTFvVzegGB6jSulEWs2wiSBObLujqQXiR/LB5o8tc0dx6e/7oePEuu0V2WCLLU7MQx5dxWEemnhicj2bpM7W3sfN+FPeEub+tv3CtHqL74fosc2O/wd5MBpf+GRXKLWtdL22du8egHDBjOEsSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781407879; c=relaxed/simple;
	bh=uQp1xHO4+JJcnQzexBvSz9/6ySrbYWrgfjnKs+gtbSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o1ODoDQoNgHNOp3BFUI+aZe1SbKhh3zCv+N5uvhsD/VABcrwk5VtpLD5WIlPg2ZrIUfG1myVetM7viubW+EBluO2RJh+QfLl+XtHwA7N/3lf9EqDSXjen8bhqoB1sbFAxfXCfEozWHpW2IN/O9QX4+/jYh79HB5/oP6B+wqcuJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrMCgstP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrMCgstP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781407877; x=1812943877;
  h=date:from:to:cc:subject:message-id;
  bh=uQp1xHO4+JJcnQzexBvSz9/6ySrbYWrgfjnKs+gtbSk=;
  b=DrMCgstPfP15lIBmN4OsqdAleO/L1lGCi8hml9IBdnHG/1DjfoIiAyus
   xr8OQHROK1p9uaI3OISModP+iXbxalYoZcGU66RgocObUv4gZStWOhTvD
   LiT8cpRyTn++DSKakgYUrI0nJS8/2X7f/omxGlIyxOeMfRC2FBiiu1f5z
   e1lysHYdoQalw+9l5YcfDtNMDYKKCEqnNSzd4/4jhIwcTZBK+bryjzAt2
   /QcFkQT9Dw8ayfvdWYRKxp2F0ptB/mfuRBCIfA687JwJCqwiYCO6Qau4k
   ZS9shqzMTtQeEIGqKlSNJcbUxtNqPjmgIaMmAtMO6JVn2SZZJklH3b25i
   Q==;
X-CSE-ConnectionGUID: qxWXJdBPSIyiQRzw74u35w==
X-CSE-MsgGUID: bno2iNQ3S/Sd/RZ9U0Fp9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="99608638"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="99608638"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 20:31:17 -0700
X-CSE-ConnectionGUID: mDJa3SlfQM6UiItfUqtSvw==
X-CSE-MsgGUID: EH6vUTk0QHehC3w5l6uRog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="252257117"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2026 20:31:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYbZ3-00000000QVW-1kD5;
	Sun, 14 Jun 2026 03:31:13 +0000
Date: Sun, 14 Jun 2026 11:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11556/13763] net/wireless/core.c:1237
 cfg80211_process_wiphy_works() error: calling 'spin_unlock_irqrestore()' with
 bogus flags
Message-ID: <202606141136.wkdxcJWG-lkp@intel.com>
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
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: e07d10ed0f238d3f4a8276932a36fe1f74775621 [11556/13763] lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.
:::::: branch date: 33 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20260613 (https://download.01.org/0day-ci/archive/20260614/202606141136.wkdxcJWG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606141136.wkdxcJWG-lkp@intel.com/

New smatch warnings:
net/wireless/core.c:1237 cfg80211_process_wiphy_works() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/rapidio/devices/tsi721.c:303 tsi721_pw_dpc() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/wireless/util.c:1169 cfg80211_process_wdev_events() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/mctp/af_mctp.c:584 mctp_ioctl_droptag() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/oss/seq_oss_rw.c:47 snd_seq_oss_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/mctp/route.c:301 mctp_key_add() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/mctp/route.c:895 mctp_dev_saddr() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/mac80211/iface.c:691 ieee80211_do_stop() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/mac80211/tx.c:4931 ieee80211_tx_pending() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/acpi/acpi_ipmi.c:353 ipmi_flush_tx_msg() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/riptide/riptide.c:895 sendcmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/i3c/master/svc-i3c-master.c:1240 svc_i3c_master_do_daa() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/mmc/host/mtk-sd.c:1379 msdc_cmd_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/bluetooth/hci_h5.c:820 h5_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/bluetooth/hci_qca.c:547 hci_ibs_wake_retrans_timeout() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/pci/intel/ipu6/ipu6-isys.c:973 alloc_fw_msg_bufs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/pci/intel/ipu6/ipu6-isys.c:1004 ipu6_get_fw_msg_buf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/pci/intel/ipu6/ipu6-fw-isys.c:169 ipu6_fw_isys_close() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:508 return_buffers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/platform/goldfish/goldfish_pipe.c:752 goldfish_pipe_open() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/hid-wiimote-core.c:67 wiimote_queue_worker() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/hid-wiimote-core.c:114 wiimote_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/hid-wiimote-core.c:398 wiimote_cmd_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/hid-wiimote-debug.c:57 wiidebug_eeprom_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/hid/hid-wiimote-modules.c:306 wiimod_led_get() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/gma500/gma_display.c:547 gma_crtc_page_flip() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1457 samsung_dsim_transfer_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1497 samsung_dsim_transfer_finish() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
net/wireless/core.c:642 wiphy_new_nm() warn: 'rdev->wiphy.rfkill' is an error pointer or valid
sound/core/seq/oss/seq_oss_rw.c:56 snd_seq_oss_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/oss/seq_oss_rw.c:61 snd_seq_oss_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/core/seq/oss/seq_oss_rw.c:65 snd_seq_oss_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/mac80211/iface.c:1973 ieee80211_setup_sdata() error: we previously assumed 'sdata->dev' could be null (see line 1929)
net/mac80211/tx.c:3028 ieee80211_build_hdr() error: testing array offset 'link_id' after use.
net/mac80211/tx.c:3637 ieee80211_xmit_fast_finish() error: we previously assumed 'key' could be null (see line 3605)
sound/pci/riptide/riptide.c:912 sendcmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
sound/pci/riptide/riptide.c:1226 try_to_load_firmware() error: we previously assumed 'chip->fw_entry' could be null (see line 1217)
sound/pci/riptide/riptide.c:1235 try_to_load_firmware() warn: 'chip->fw_entry' from request_firmware() not released on lines: 1230.
drivers/mmc/host/mtk-sd.c:971 msdc_ungate_clock() warn: 'host->bus_clk' from clk_prepare_enable() not released on lines: 968,971.
drivers/mmc/host/mtk-sd.c:971 msdc_ungate_clock() warn: 'host->crypto_clk' from clk_prepare_enable() not released on lines: 968,971.
drivers/mmc/host/mtk-sd.c:971 msdc_ungate_clock() warn: 'host->h_clk' from clk_prepare_enable() not released on lines: 968,971.
drivers/mmc/host/mtk-sd.c:971 msdc_ungate_clock() warn: 'host->src_clk' from clk_prepare_enable() not released on lines: 968,971.
drivers/mmc/host/mtk-sd.c:971 msdc_ungate_clock() warn: 'host->src_clk_cg' from clk_prepare_enable() not released on lines: 968,971.
drivers/bluetooth/hci_h5.c:829 h5_dequeue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:516 return_buffers() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/gpu/drm/bridge/samsung-dsim.c:1873 samsung_dsim_register_te_irq() warn: why call request_threaded_irq() with a NULL thread

vim +1237 net/wireless/core.c

1f87f7d3a3b42b Johannes Berg 2009-06-02  1208  
56cfb8ce1f7f6c Johannes Berg 2023-08-28  1209  void cfg80211_process_wiphy_works(struct cfg80211_registered_device *rdev,
56cfb8ce1f7f6c Johannes Berg 2023-08-28  1210  				  struct wiphy_work *end)
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1211  {
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1212  	unsigned int runaway_limit = 100;
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1213  	unsigned long flags;
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1214  
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1215  	lockdep_assert_held(&rdev->wiphy.mtx);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1216  
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1217  	spin_lock_irqsave(&rdev->wiphy_work_lock, flags);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1218  	while (!list_empty(&rdev->wiphy_work_list)) {
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1219  		struct wiphy_work *wk;
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1220  
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1221  		wk = list_first_entry(&rdev->wiphy_work_list,
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1222  				      struct wiphy_work, entry);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1223  		list_del_init(&wk->entry);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1224  		spin_unlock_irqrestore(&rdev->wiphy_work_lock, flags);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1225  
eb745c7c854e20 Johannes Berg 2024-05-06  1226  		trace_wiphy_work_run(&rdev->wiphy, wk);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1227  		wk->func(&rdev->wiphy, wk);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1228  
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1229  		spin_lock_irqsave(&rdev->wiphy_work_lock, flags);
56cfb8ce1f7f6c Johannes Berg 2023-08-28  1230  
56cfb8ce1f7f6c Johannes Berg 2023-08-28  1231  		if (wk == end)
56cfb8ce1f7f6c Johannes Berg 2023-08-28  1232  			break;
56cfb8ce1f7f6c Johannes Berg 2023-08-28  1233  
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1234  		if (WARN_ON(--runaway_limit == 0))
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1235  			INIT_LIST_HEAD(&rdev->wiphy_work_list);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1236  	}
a3ee4dc84c4e9d Johannes Berg 2023-06-06 @1237  	spin_unlock_irqrestore(&rdev->wiphy_work_lock, flags);
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1238  }
a3ee4dc84c4e9d Johannes Berg 2023-06-06  1239  

:::::: The code at line 1237 was first introduced by commit
:::::: a3ee4dc84c4e9d14cb34dad095fd678127aca5b6 wifi: cfg80211: add a work abstraction with special semantics

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
