Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF9D145A0B
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Feb 2025 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739694343; cv=none; b=o35CEacm+JRVZefp6pL27UZ40o/8p6RwalCUJh4CpgShzF50RsqV6j8mq8TswCCG4peDzibjxE84a4djH8O4Mtha7/fqsp+PAzN793Nx40zTgeiH29lqy6pXPgLhNG5zNcfOBPn5mV8ZqhLkOH+e43M0n6pXm/0GWKjws9alkso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739694343; c=relaxed/simple;
	bh=XXiWtRxplvjc60GsVtheXFcv9b2rkv2BtRGf/joYDhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yq5F73G7RcuGhRhQ/bXBOKepzp5PGYCFGNeKZwhebEj7li80xNwmQTPH61kIhxxy83Z55tI1hJLTbTiKnai+wKGKdGS4QDwLAHf8YNIZTqtIOGgcykyUTawoOXKJ/zylqDEsE8Kt66NqyzfWw+HsfD+ncxmxU7qCrZOU0CgGDSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnTEztdm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnTEztdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739694341; x=1771230341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXiWtRxplvjc60GsVtheXFcv9b2rkv2BtRGf/joYDhc=;
  b=WnTEztdmLWhVqebXuQs6MdDTrWSikJ12OMrcWw/imJBvQHfxQUU4AoGP
   tUCx2lJgEeji85OsHJbGSny7nOUcHq64zJLY5SsLbNdsB9GKbQEK7fP6C
   gyfbk4VVYzcgp2TdQ3RauL4v9jzVFRGIPGUDlY3uU9Nrfl+4AOtBQwjIj
   hWZ1d9Hb9H5QXLfJSdNH5+G63qOtkYq42e/LPb1auMfZIv2fgozdrTFqA
   kmoHx+hdFxTWzx4J+Yi/rXbV4mliEuzvgp7+4ic53V/82V5tQM0meUUVn
   vb4+TEJv9tuEtunc0Cl/CH19k1Yh/0tLUdGzRRnXivR7j6iYkBvnnZ5lD
   A==;
X-CSE-ConnectionGUID: wAidAa8kRBKeXOi6ZpEtXA==
X-CSE-MsgGUID: N+IIx33STJ6eiIOldqO8Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="44326432"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="44326432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 00:25:40 -0800
X-CSE-ConnectionGUID: xIZKSfocSimwaz41nV+WxQ==
X-CSE-MsgGUID: ExyEl51aRSKsa64HrwKC9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144766962"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Feb 2025 00:25:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjZy5-001Bi3-16;
	Sun, 16 Feb 2025 08:25:37 +0000
Date: Sun, 16 Feb 2025 16:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.6 5/5]
 drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:591:28: sparse: sparse: non
 size-preserving pointer to integer cast
Message-ID: <202502161619.sPN1QgLV-lkp@intel.com>
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

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0d96e807079196f870dcef51ecf4bd53fb5472c1
commit: 89cb8bc425a44875dc0420914465cbc1936bef3f [5/5] CHROMIUM: ipu6: enable the psys downstream driver
:::::: branch date: 18 hours ago
:::::: commit date: 12 days ago
config: i386-randconfig-062-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161619.sPN1QgLV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502161619.sPN1QgLV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502161619.sPN1QgLV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/pci/intel/ipu6/psys/ipu6-psys.c:591:28: sparse: sparse: non size-preserving pointer to integer cast
--
>> drivers/media/pci/intel/ipu6/psys/ipu-psys.c:952:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] ret @@     got int @@
   drivers/media/pci/intel/ipu6/psys/ipu-psys.c:952:21: sparse:     expected restricted __poll_t [usertype] ret
   drivers/media/pci/intel/ipu6/psys/ipu-psys.c:952:21: sparse:     got int

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

:::::: The code at line 591 was first introduced by commit
:::::: 284a3b163de88a1c1c1da092d99a9e9ab9dda477 CHROMIUM: ipu6: move the downstream psys driver into a separate path

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
