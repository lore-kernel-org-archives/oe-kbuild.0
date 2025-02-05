Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E38E21517A
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Feb 2025 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738738323; cv=none; b=SS3fVabwm+IdCFlSlCB7luDxBkqL19hulzUcemfZGnZqUjCeBzEi/LfLv3+twtgHVpL6IFPCcLLNZO/jJCUskZdOSLq7frzziQBNXHyQvPBl9/ySkR8fGVfHfC/ce3xEfSuheAjPtY0kPMIpnkbLT2Qya8Ue1bLbdeothQvrgo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738738323; c=relaxed/simple;
	bh=+vRxPSdwwVTeLGW5d83QGGwyvX4jNJ4mhBxxTvKq9E4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDQ6DkLhUL4fzRPZ8pNNYZj1dg5du2TxJgWgceS8fi0+vscAFcbF9dx0VBoDfhMhkHXPrYa4KclbPlszeumFVAEB34cW4dLVZXKw3zCsuKh21ZjXZuBRgwgDtILXbJ+5QWLvMNuPd/v/pgWv1XELTKfIZ8dixRnHKZgbs1lK09A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yd2R5fAu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yd2R5fAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738738321; x=1770274321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vRxPSdwwVTeLGW5d83QGGwyvX4jNJ4mhBxxTvKq9E4=;
  b=Yd2R5fAuMn/FmhCKRIUSU69Ia4bqXbWY/xOBqbD8BM4m89BfWkwCeeWA
   srRbpx14vagVek2+IlVKRT0s9f9l/ABUg/SZhX6AczpC9ERTtLmfm4qfh
   +V33oEUYb4S77LhdxAc3ioLto0zxDsgc9zTnI2VxbPg1N1dkxnS341vUI
   E7nFjXliMIJz194hf1P/SZKIm9NpoCfvZ/WAnhGv7YD7nuVjEHuVaLDxQ
   4X6slReAKnUWxUZayi0fOfooooZkSaZm5t4Q9fqXSyqiK2t9cjFo4ClDY
   2j9DGRFeZvfYbPP4wxHbxadYEQmRzcdcVKsln/EDnyQRe6Of6yB5vqtBQ
   A==;
X-CSE-ConnectionGUID: ADCWPSu8TL6ox7iijq6XAQ==
X-CSE-MsgGUID: lw0/Bz7lS3Ct+YqZzJ3AuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56717259"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="56717259"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 22:52:00 -0800
X-CSE-ConnectionGUID: wyCQncjzSXa31bC1ytCfBw==
X-CSE-MsgGUID: bcTjbqyYTrGJRUvE84DdRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="111352469"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 22:51:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfZGP-000tZH-0O;
	Wed, 05 Feb 2025 06:51:57 +0000
Date: Wed, 5 Feb 2025 14:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.6 175/175]
 drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:591:23: warning: cast from
 pointer to integer of different size
Message-ID: <202502051405.5cXoYCYT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Bingbu,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   89cb8bc425a44875dc0420914465cbc1936bef3f
commit: 89cb8bc425a44875dc0420914465cbc1936bef3f [175/175] CHROMIUM: ipu6: enable the psys downstream driver
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250205/202502051405.5cXoYCYT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051405.5cXoYCYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502051405.5cXoYCYT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/psys/ipu6-psys.c: In function 'ipu_psys_kcmd_send_to_ppg_start':
>> drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:591:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     591 |         kppg->token = (u64)kcmd->kpg;
         |                       ^
   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:31,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/uaccess.h:8,
                    from drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:4:
   drivers/media/pci/intel/ipu6/psys/ipu6-psys.c: In function 'ipu_psys_kcmd_new':
>> drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:699:30: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     699 |                 dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:699:17: note: in expansion of macro 'dev_dbg'
     699 |                 dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
         |                 ^~~~~~~
   drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:699:50: note: format string is defined here
     699 |                 dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
         |                                                ~~^
         |                                                  |
         |                                                  long unsigned int
         |                                                %u
   drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:699:30: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     699 |                 dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:699:17: note: in expansion of macro 'dev_dbg'
     699 |                 dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
         |                 ^~~~~~~
   drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:699:54: note: format string is defined here
     699 |                 dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
         |                                                    ~~^
         |                                                      |
         |                                                      long unsigned int
         |                                                    %u


vim +591 drivers/media/pci/intel/ipu6/psys/ipu6-psys.c

284a3b163de88a Bingbu Cao 2024-12-03  539  
284a3b163de88a Bingbu Cao 2024-12-03  540  static int ipu_psys_kcmd_send_to_ppg_start(struct ipu_psys_kcmd *kcmd)
284a3b163de88a Bingbu Cao 2024-12-03  541  {
284a3b163de88a Bingbu Cao 2024-12-03  542  	struct ipu_psys_fh *fh = kcmd->fh;
284a3b163de88a Bingbu Cao 2024-12-03  543  	struct ipu_psys_scheduler *sched = &fh->sched;
284a3b163de88a Bingbu Cao 2024-12-03  544  	struct ipu_psys *psys = fh->psys;
0dfcffdba7520c Bingbu Cao 2024-12-03  545  	struct device *dev = &psys->adev->auxdev.dev;
284a3b163de88a Bingbu Cao 2024-12-03  546  	struct ipu_psys_ppg *kppg;
284a3b163de88a Bingbu Cao 2024-12-03  547  	struct ipu_psys_resource_pool *rpr;
284a3b163de88a Bingbu Cao 2024-12-03  548  	int queue_id;
284a3b163de88a Bingbu Cao 2024-12-03  549  	int ret;
284a3b163de88a Bingbu Cao 2024-12-03  550  
0dfcffdba7520c Bingbu Cao 2024-12-03  551  	rpr = &psys->res_pool_running;
284a3b163de88a Bingbu Cao 2024-12-03  552  
284a3b163de88a Bingbu Cao 2024-12-03  553  	kppg = kzalloc(sizeof(*kppg), GFP_KERNEL);
284a3b163de88a Bingbu Cao 2024-12-03  554  	if (!kppg)
284a3b163de88a Bingbu Cao 2024-12-03  555  		return -ENOMEM;
284a3b163de88a Bingbu Cao 2024-12-03  556  
284a3b163de88a Bingbu Cao 2024-12-03  557  	kppg->fh = fh;
284a3b163de88a Bingbu Cao 2024-12-03  558  	kppg->kpg = kcmd->kpg;
284a3b163de88a Bingbu Cao 2024-12-03  559  	kppg->state = PPG_STATE_START;
284a3b163de88a Bingbu Cao 2024-12-03  560  	kppg->pri_base = kcmd->priority;
284a3b163de88a Bingbu Cao 2024-12-03  561  	kppg->pri_dynamic = 0;
284a3b163de88a Bingbu Cao 2024-12-03  562  	INIT_LIST_HEAD(&kppg->list);
284a3b163de88a Bingbu Cao 2024-12-03  563  
284a3b163de88a Bingbu Cao 2024-12-03  564  	mutex_init(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  565  	INIT_LIST_HEAD(&kppg->kcmds_new_list);
284a3b163de88a Bingbu Cao 2024-12-03  566  	INIT_LIST_HEAD(&kppg->kcmds_processing_list);
284a3b163de88a Bingbu Cao 2024-12-03  567  	INIT_LIST_HEAD(&kppg->kcmds_finished_list);
284a3b163de88a Bingbu Cao 2024-12-03  568  	INIT_LIST_HEAD(&kppg->sched_list);
284a3b163de88a Bingbu Cao 2024-12-03  569  
284a3b163de88a Bingbu Cao 2024-12-03  570  	kppg->manifest = kzalloc(kcmd->pg_manifest_size, GFP_KERNEL);
284a3b163de88a Bingbu Cao 2024-12-03  571  	if (!kppg->manifest) {
284a3b163de88a Bingbu Cao 2024-12-03  572  		kfree(kppg);
284a3b163de88a Bingbu Cao 2024-12-03  573  		return -ENOMEM;
284a3b163de88a Bingbu Cao 2024-12-03  574  	}
284a3b163de88a Bingbu Cao 2024-12-03  575  	memcpy(kppg->manifest, kcmd->pg_manifest,
284a3b163de88a Bingbu Cao 2024-12-03  576  	       kcmd->pg_manifest_size);
284a3b163de88a Bingbu Cao 2024-12-03  577  
0dfcffdba7520c Bingbu Cao 2024-12-03  578  	queue_id = ipu_psys_allocate_cmd_queue_res(rpr);
284a3b163de88a Bingbu Cao 2024-12-03  579  	if (queue_id == -ENOSPC) {
0dfcffdba7520c Bingbu Cao 2024-12-03  580  		dev_err(dev, "no available queue\n");
284a3b163de88a Bingbu Cao 2024-12-03  581  		kfree(kppg->manifest);
284a3b163de88a Bingbu Cao 2024-12-03  582  		kfree(kppg);
284a3b163de88a Bingbu Cao 2024-12-03  583  		mutex_unlock(&psys->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  584  		return -ENOMEM;
284a3b163de88a Bingbu Cao 2024-12-03  585  	}
284a3b163de88a Bingbu Cao 2024-12-03  586  
284a3b163de88a Bingbu Cao 2024-12-03  587  	/*
284a3b163de88a Bingbu Cao 2024-12-03  588  	 * set token as start cmd will immediately be followed by a
284a3b163de88a Bingbu Cao 2024-12-03  589  	 * enqueue cmd so that kppg could be retrieved.
284a3b163de88a Bingbu Cao 2024-12-03  590  	 */
284a3b163de88a Bingbu Cao 2024-12-03 @591  	kppg->token = (u64)kcmd->kpg;
284a3b163de88a Bingbu Cao 2024-12-03  592  	ipu_fw_psys_pg_set_token(kcmd, kppg->token);
284a3b163de88a Bingbu Cao 2024-12-03  593  	ipu_fw_psys_ppg_set_base_queue_id(kcmd, queue_id);
284a3b163de88a Bingbu Cao 2024-12-03  594  	ret = ipu_fw_psys_pg_set_ipu_vaddress(kcmd,
284a3b163de88a Bingbu Cao 2024-12-03  595  					      kcmd->kpg->pg_dma_addr);
284a3b163de88a Bingbu Cao 2024-12-03  596  	if (ret) {
0dfcffdba7520c Bingbu Cao 2024-12-03  597  		ipu_psys_free_cmd_queue_res(rpr, queue_id);
284a3b163de88a Bingbu Cao 2024-12-03  598  		kfree(kppg->manifest);
284a3b163de88a Bingbu Cao 2024-12-03  599  		kfree(kppg);
284a3b163de88a Bingbu Cao 2024-12-03  600  		return -EIO;
284a3b163de88a Bingbu Cao 2024-12-03  601  	}
284a3b163de88a Bingbu Cao 2024-12-03  602  	memcpy(kcmd->pg_user, kcmd->kpg->pg, kcmd->kpg->pg_size);
284a3b163de88a Bingbu Cao 2024-12-03  603  
284a3b163de88a Bingbu Cao 2024-12-03  604  	mutex_lock(&fh->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  605  	list_add_tail(&kppg->list, &sched->ppgs);
284a3b163de88a Bingbu Cao 2024-12-03  606  	mutex_unlock(&fh->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  607  
284a3b163de88a Bingbu Cao 2024-12-03  608  	mutex_lock(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  609  	list_add(&kcmd->list, &kppg->kcmds_new_list);
284a3b163de88a Bingbu Cao 2024-12-03  610  	mutex_unlock(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  611  
0dfcffdba7520c Bingbu Cao 2024-12-03  612  	dev_dbg(dev, "START ppg(%d, 0x%p) kcmd 0x%p, queue %d\n",
284a3b163de88a Bingbu Cao 2024-12-03  613  		ipu_fw_psys_pg_get_id(kcmd), kppg, kcmd, queue_id);
284a3b163de88a Bingbu Cao 2024-12-03  614  
284a3b163de88a Bingbu Cao 2024-12-03  615  	/* Kick l-scheduler thread */
284a3b163de88a Bingbu Cao 2024-12-03  616  	atomic_set(&psys->wakeup_count, 1);
284a3b163de88a Bingbu Cao 2024-12-03  617  	wake_up_interruptible(&psys->sched_cmd_wq);
284a3b163de88a Bingbu Cao 2024-12-03  618  
284a3b163de88a Bingbu Cao 2024-12-03  619  	return 0;
284a3b163de88a Bingbu Cao 2024-12-03  620  }
284a3b163de88a Bingbu Cao 2024-12-03  621  
284a3b163de88a Bingbu Cao 2024-12-03  622  static int ipu_psys_kcmd_send_to_ppg(struct ipu_psys_kcmd *kcmd)
284a3b163de88a Bingbu Cao 2024-12-03  623  {
284a3b163de88a Bingbu Cao 2024-12-03  624  	struct ipu_psys_fh *fh = kcmd->fh;
284a3b163de88a Bingbu Cao 2024-12-03  625  	struct ipu_psys *psys = fh->psys;
0dfcffdba7520c Bingbu Cao 2024-12-03  626  	struct device *dev = &psys->adev->auxdev.dev;
284a3b163de88a Bingbu Cao 2024-12-03  627  	struct ipu_psys_ppg *kppg;
284a3b163de88a Bingbu Cao 2024-12-03  628  	struct ipu_psys_resource_pool *rpr;
284a3b163de88a Bingbu Cao 2024-12-03  629  	unsigned long flags;
284a3b163de88a Bingbu Cao 2024-12-03  630  	u8 id;
284a3b163de88a Bingbu Cao 2024-12-03  631  	bool resche = true;
284a3b163de88a Bingbu Cao 2024-12-03  632  
0dfcffdba7520c Bingbu Cao 2024-12-03  633  	rpr = &psys->res_pool_running;
284a3b163de88a Bingbu Cao 2024-12-03  634  	if (kcmd->state == KCMD_STATE_PPG_START)
284a3b163de88a Bingbu Cao 2024-12-03  635  		return ipu_psys_kcmd_send_to_ppg_start(kcmd);
284a3b163de88a Bingbu Cao 2024-12-03  636  
284a3b163de88a Bingbu Cao 2024-12-03  637  	kppg = ipu_psys_identify_kppg(kcmd);
284a3b163de88a Bingbu Cao 2024-12-03  638  	spin_lock_irqsave(&psys->pgs_lock, flags);
284a3b163de88a Bingbu Cao 2024-12-03  639  	kcmd->kpg->pg_size = 0;
284a3b163de88a Bingbu Cao 2024-12-03  640  	spin_unlock_irqrestore(&psys->pgs_lock, flags);
284a3b163de88a Bingbu Cao 2024-12-03  641  	if (!kppg) {
0dfcffdba7520c Bingbu Cao 2024-12-03  642  		dev_err(dev, "token not match\n");
284a3b163de88a Bingbu Cao 2024-12-03  643  		return -EINVAL;
284a3b163de88a Bingbu Cao 2024-12-03  644  	}
284a3b163de88a Bingbu Cao 2024-12-03  645  
284a3b163de88a Bingbu Cao 2024-12-03  646  	kcmd->kpg = kppg->kpg;
284a3b163de88a Bingbu Cao 2024-12-03  647  
0dfcffdba7520c Bingbu Cao 2024-12-03  648  	dev_dbg(dev, "%s ppg(%d, 0x%p) kcmd %p\n",
0dfcffdba7520c Bingbu Cao 2024-12-03  649  		(kcmd->state == KCMD_STATE_PPG_STOP) ? "STOP" : "ENQUEUE",
284a3b163de88a Bingbu Cao 2024-12-03  650  		ipu_fw_psys_pg_get_id(kcmd), kppg, kcmd);
284a3b163de88a Bingbu Cao 2024-12-03  651  
284a3b163de88a Bingbu Cao 2024-12-03  652  	if (kcmd->state == KCMD_STATE_PPG_STOP) {
284a3b163de88a Bingbu Cao 2024-12-03  653  		mutex_lock(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  654  		if (kppg->state == PPG_STATE_STOPPED) {
0dfcffdba7520c Bingbu Cao 2024-12-03  655  			dev_dbg(dev, "kppg 0x%p  stopped!\n", kppg);
284a3b163de88a Bingbu Cao 2024-12-03  656  			id = ipu_fw_psys_ppg_get_base_queue_id(kcmd);
0dfcffdba7520c Bingbu Cao 2024-12-03  657  			ipu_psys_free_cmd_queue_res(rpr, id);
284a3b163de88a Bingbu Cao 2024-12-03  658  			ipu_psys_kcmd_complete(kppg, kcmd, 0);
0dfcffdba7520c Bingbu Cao 2024-12-03  659  			pm_runtime_put(dev);
284a3b163de88a Bingbu Cao 2024-12-03  660  			resche = false;
284a3b163de88a Bingbu Cao 2024-12-03  661  		} else {
284a3b163de88a Bingbu Cao 2024-12-03  662  			list_add(&kcmd->list, &kppg->kcmds_new_list);
284a3b163de88a Bingbu Cao 2024-12-03  663  		}
284a3b163de88a Bingbu Cao 2024-12-03  664  		mutex_unlock(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  665  	} else {
284a3b163de88a Bingbu Cao 2024-12-03  666  		int ret;
284a3b163de88a Bingbu Cao 2024-12-03  667  
284a3b163de88a Bingbu Cao 2024-12-03  668  		ret = ipu_psys_ppg_get_bufset(kcmd, kppg);
284a3b163de88a Bingbu Cao 2024-12-03  669  		if (ret)
284a3b163de88a Bingbu Cao 2024-12-03  670  			return ret;
284a3b163de88a Bingbu Cao 2024-12-03  671  
284a3b163de88a Bingbu Cao 2024-12-03  672  		mutex_lock(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  673  		list_add_tail(&kcmd->list, &kppg->kcmds_new_list);
284a3b163de88a Bingbu Cao 2024-12-03  674  		mutex_unlock(&kppg->mutex);
284a3b163de88a Bingbu Cao 2024-12-03  675  	}
284a3b163de88a Bingbu Cao 2024-12-03  676  
284a3b163de88a Bingbu Cao 2024-12-03  677  	if (resche) {
284a3b163de88a Bingbu Cao 2024-12-03  678  		/* Kick l-scheduler thread */
284a3b163de88a Bingbu Cao 2024-12-03  679  		atomic_set(&psys->wakeup_count, 1);
284a3b163de88a Bingbu Cao 2024-12-03  680  		wake_up_interruptible(&psys->sched_cmd_wq);
284a3b163de88a Bingbu Cao 2024-12-03  681  	}
284a3b163de88a Bingbu Cao 2024-12-03  682  	return 0;
284a3b163de88a Bingbu Cao 2024-12-03  683  }
284a3b163de88a Bingbu Cao 2024-12-03  684  
284a3b163de88a Bingbu Cao 2024-12-03  685  int ipu_psys_kcmd_new(struct ipu_psys_command *cmd, struct ipu_psys_fh *fh)
284a3b163de88a Bingbu Cao 2024-12-03  686  {
284a3b163de88a Bingbu Cao 2024-12-03  687  	struct ipu_psys *psys = fh->psys;
0dfcffdba7520c Bingbu Cao 2024-12-03  688  	struct device *dev = &psys->adev->auxdev.dev;
284a3b163de88a Bingbu Cao 2024-12-03  689  	struct ipu_psys_kcmd *kcmd;
284a3b163de88a Bingbu Cao 2024-12-03  690  	size_t pg_size;
284a3b163de88a Bingbu Cao 2024-12-03  691  	int ret;
284a3b163de88a Bingbu Cao 2024-12-03  692  
284a3b163de88a Bingbu Cao 2024-12-03  693  	kcmd = ipu_psys_copy_cmd(cmd, fh);
284a3b163de88a Bingbu Cao 2024-12-03  694  	if (!kcmd)
284a3b163de88a Bingbu Cao 2024-12-03  695  		return -EINVAL;
284a3b163de88a Bingbu Cao 2024-12-03  696  
284a3b163de88a Bingbu Cao 2024-12-03  697  	pg_size = ipu_fw_psys_pg_get_size(kcmd);
284a3b163de88a Bingbu Cao 2024-12-03  698  	if (pg_size > kcmd->kpg->pg_size) {
0dfcffdba7520c Bingbu Cao 2024-12-03 @699  		dev_dbg(dev, "pg size mismatch %lu %lu\n", pg_size,
0dfcffdba7520c Bingbu Cao 2024-12-03  700  			kcmd->kpg->pg_size);
284a3b163de88a Bingbu Cao 2024-12-03  701  		ret = -EINVAL;
284a3b163de88a Bingbu Cao 2024-12-03  702  		goto error;
284a3b163de88a Bingbu Cao 2024-12-03  703  	}
284a3b163de88a Bingbu Cao 2024-12-03  704  
284a3b163de88a Bingbu Cao 2024-12-03  705  	if (ipu_fw_psys_pg_get_protocol(kcmd) !=
284a3b163de88a Bingbu Cao 2024-12-03  706  			IPU_FW_PSYS_PROCESS_GROUP_PROTOCOL_PPG) {
0dfcffdba7520c Bingbu Cao 2024-12-03  707  		dev_err(dev, "No support legacy pg now\n");
284a3b163de88a Bingbu Cao 2024-12-03  708  		ret = -EINVAL;
284a3b163de88a Bingbu Cao 2024-12-03  709  		goto error;
284a3b163de88a Bingbu Cao 2024-12-03  710  	}
284a3b163de88a Bingbu Cao 2024-12-03  711  
284a3b163de88a Bingbu Cao 2024-12-03  712  	if (cmd->min_psys_freq) {
284a3b163de88a Bingbu Cao 2024-12-03  713  		kcmd->constraint.min_freq = cmd->min_psys_freq;
284a3b163de88a Bingbu Cao 2024-12-03  714  		ipu_buttress_add_psys_constraint(psys->adev->isp,
284a3b163de88a Bingbu Cao 2024-12-03  715  						 &kcmd->constraint);
284a3b163de88a Bingbu Cao 2024-12-03  716  	}
284a3b163de88a Bingbu Cao 2024-12-03  717  
284a3b163de88a Bingbu Cao 2024-12-03  718  	ret = ipu_psys_kcmd_send_to_ppg(kcmd);
284a3b163de88a Bingbu Cao 2024-12-03  719  	if (ret)
284a3b163de88a Bingbu Cao 2024-12-03  720  		goto error;
284a3b163de88a Bingbu Cao 2024-12-03  721  
0dfcffdba7520c Bingbu Cao 2024-12-03  722  	dev_dbg(dev, "IOC_QCMD: user_token:%llx issue_id:0x%llx pri:%d\n",
284a3b163de88a Bingbu Cao 2024-12-03  723  		cmd->user_token, cmd->issue_id, cmd->priority);
284a3b163de88a Bingbu Cao 2024-12-03  724  
284a3b163de88a Bingbu Cao 2024-12-03  725  	return 0;
284a3b163de88a Bingbu Cao 2024-12-03  726  
284a3b163de88a Bingbu Cao 2024-12-03  727  error:
284a3b163de88a Bingbu Cao 2024-12-03  728  	ipu_psys_kcmd_free(kcmd);
284a3b163de88a Bingbu Cao 2024-12-03  729  
284a3b163de88a Bingbu Cao 2024-12-03  730  	return ret;
284a3b163de88a Bingbu Cao 2024-12-03  731  }
284a3b163de88a Bingbu Cao 2024-12-03  732  

:::::: The code at line 591 was first introduced by commit
:::::: 284a3b163de88a1c1c1da092d99a9e9ab9dda477 CHROMIUM: ipu6: move the downstream psys driver into a separate path

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
