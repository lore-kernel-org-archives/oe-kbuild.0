Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D49730674C
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 01:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787277390; cv=none; b=aBHS6yH4gma2VJyz3yHT17bkBAsG0W+7kSXbphv4sb/+pkK4Dl3fZFjmyMEoJGBkfTviyFgVfM/2QWtNqAuKU8v90fV3L4ZlmZIzYJFPCsnRyKlEfgubuDE3zok4BXGHc772Z7hiSSzdLNxoY1cTmJzRmqxH7ywbno+OIQCeFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787277390; c=relaxed/simple;
	bh=YI9A0TE6mnqLsv6FHX+HDApZv0QWvPeeWF8jiJG+jp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XMRTFSaG5v+yRrrFz+wdo1TRz8Xk9zvXzDcD7G1LpZDdI5hsd/hnTsZgT+Sv9vww9ABKz5EqeWENM3qsXHPLWlI89cII7dr0aF2mCPiH38U/H3CIRba8LJet3qymKp1iOyCxxgZCHV+BMX/jErPIF/ggxbyD9h/gAcZd/7i2eJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLUtaMxE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLUtaMxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787277389; x=1818813389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YI9A0TE6mnqLsv6FHX+HDApZv0QWvPeeWF8jiJG+jp0=;
  b=TLUtaMxEKczoL+bIHa92Q2jToOC9ZvDT9lVnD9ivnFp84qTljJlBUDmu
   BVqqxTagxWxtUAhNrlurRuyGpbUpvcxTGORkpmmq6rtShQiwkc1S2Qk0Z
   QqXes5gag6njGzkP4pHf931kWsu772gg3IVTnXjh3kbuZ+jTXHAHohlQz
   XLnlKLD0/QFQJsycNHVMZeVuEUH32qzmK5SS1ZG4Ybu8IYmDft19e47U3
   kH6wXZhXaRBi7uAyFwdcTT8r9CeEO/P8SvXitnBI96tmwl1XvxNzobF7m
   xSTYXT/rB0S51fEhP0PWm5xel1XllPbyxaxppItBtE+K0p4DwNez8AuKh
   w==;
X-CSE-ConnectionGUID: PcZKr8OQQcWLpaDFDhwPWA==
X-CSE-MsgGUID: 08liXGsdRLiPimwgdvTMlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91502643"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="91502643"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 18:56:28 -0700
X-CSE-ConnectionGUID: uyje8E7nRfSM2y92dSIubQ==
X-CSE-MsgGUID: YxlaDUTLRCapWBakpPLUeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="263548784"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2026 18:56:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxEUa-00000000oyD-0OFh;
	Fri, 21 Aug 2026 01:56:24 +0000
Date: Fri, 21 Aug 2026 09:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] accel/ivpu: fix usage_count leak when autosuspend_delay
 is negative
Message-ID: <202608210900.FyVw967W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260807145416.2518999-1-lgs201920130244@gmail.com>
References: <20260807145416.2518999-1-lgs201920130244@gmail.com>
TO: Guangshuo Li <lgs201920130244@gmail.com>
TO: Karol Wachowski <karol.wachowski@linux.intel.com>
TO: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
TO: Oded Gabbay <ogabbay@kernel.org>
TO: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
TO: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
TO: Simona Vetter <simona.vetter@ffwll.ch>
TO: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
TO: dri-devel@lists.freedesktop.org
TO: linux-kernel@vger.kernel.org
CC: Guangshuo Li <lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.2 next-20260819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/accel-ivpu-fix-usage_count-leak-when-autosuspend_delay-is-negative/20260807-225416
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260807145416.2518999-1-lgs201920130244%40gmail.com
patch subject: [PATCH] accel/ivpu: fix usage_count leak when autosuspend_delay is negative
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-074-20260821 (https://download.01.org/0day-ci/archive/20260821/202608210900.FyVw967W-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210900.FyVw967W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608210900.FyVw967W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/ivpu/ivpu_drv.c: In function 'ivpu_dev_init':
>> drivers/accel/ivpu/ivpu_drv.c:788:1: warning: label 'err_ipc_fini' defined but not used [-Wunused-label]
     788 | err_ipc_fini:
         | ^~~~~~~~~~~~


vim +/err_ipc_fini +788 drivers/accel/ivpu/ivpu_drv.c

35b137630f08d91 Jacek Lawrynowicz 2023-01-17  678  
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  679  static int ivpu_dev_init(struct ivpu_device *vdev)
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  680  {
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  681  	int ret;
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  682  
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  683  	vdev->hw = drmm_kzalloc(&vdev->drm, sizeof(*vdev->hw), GFP_KERNEL);
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  684  	if (!vdev->hw)
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  685  		return -ENOMEM;
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  686  
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  687  	vdev->mmu = drmm_kzalloc(&vdev->drm, sizeof(*vdev->mmu), GFP_KERNEL);
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  688  	if (!vdev->mmu)
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  689  		return -ENOMEM;
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  690  
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  691  	vdev->fw = drmm_kzalloc(&vdev->drm, sizeof(*vdev->fw), GFP_KERNEL);
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  692  	if (!vdev->fw)
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  693  		return -ENOMEM;
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  694  
5d7422cfb498bf2 Jacek Lawrynowicz 2023-01-17  695  	vdev->ipc = drmm_kzalloc(&vdev->drm, sizeof(*vdev->ipc), GFP_KERNEL);
5d7422cfb498bf2 Jacek Lawrynowicz 2023-01-17  696  	if (!vdev->ipc)
5d7422cfb498bf2 Jacek Lawrynowicz 2023-01-17  697  		return -ENOMEM;
5d7422cfb498bf2 Jacek Lawrynowicz 2023-01-17  698  
852be13f3bd32c1 Jacek Lawrynowicz 2023-01-17  699  	vdev->pm = drmm_kzalloc(&vdev->drm, sizeof(*vdev->pm), GFP_KERNEL);
852be13f3bd32c1 Jacek Lawrynowicz 2023-01-17  700  	if (!vdev->pm)
852be13f3bd32c1 Jacek Lawrynowicz 2023-01-17  701  		return -ENOMEM;
852be13f3bd32c1 Jacek Lawrynowicz 2023-01-17  702  
8a27ad81f7d3a4b Wachowski, Karol  2024-05-15  703  	if (ivpu_hw_ip_gen(vdev) >= IVPU_HW_IP_40XX)
79cdc56c4a54252 Stanislaw Gruszka 2023-07-31  704  		vdev->hw->dma_bits = 48;
8a27ad81f7d3a4b Wachowski, Karol  2024-05-15  705  	else
a4172d6cf0a2b9f Karol Wachowski   2023-05-18  706  		vdev->hw->dma_bits = 38;
a4172d6cf0a2b9f Karol Wachowski   2023-05-18  707  
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  708  	vdev->platform = IVPU_PLATFORM_INVALID;
3ff6edbc17dbab8 Stanislaw Gruszka 2023-03-23  709  	vdev->context_xa_limit.min = IVPU_USER_CONTEXT_MIN_SSID;
3ff6edbc17dbab8 Stanislaw Gruszka 2023-03-23  710  	vdev->context_xa_limit.max = IVPU_USER_CONTEXT_MAX_SSID;
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  711  	atomic64_set(&vdev->unique_id_counter, 0);
0e7db503c5355ff Karol Wachowski   2025-04-16  712  	atomic_set(&vdev->job_timeout_counter, 0);
ade00a6c903f850 Karol Wachowski   2026-03-18  713  	atomic_set(&vdev->faults_detected, 0);
fd7726e75968b27 Jacek Lawrynowicz 2024-04-02  714  	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
cd7272215c44676 Jacek Lawrynowicz 2023-01-17  715  	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
f32d59677ab1427 Wachowski, Karol  2024-02-14  716  	xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
48aea7f2a2efae6 Jacek Lawrynowicz 2023-10-31  717  	INIT_LIST_HEAD(&vdev->bo_list);
86a14330bf0598c Karol Wachowski   2026-03-02  718  	hash_init(vdev->user_limits);
48aea7f2a2efae6 Jacek Lawrynowicz 2023-10-31  719  
ae7af7d8dc2a13a Karol Wachowski   2024-10-17  720  	vdev->db_limit.min = IVPU_MIN_DB;
ae7af7d8dc2a13a Karol Wachowski   2024-10-17  721  	vdev->db_limit.max = IVPU_MAX_DB;
c3b0ec0fe0c7ebc Tomasz Rusinowicz 2024-09-30  722  
f1cc6aceecd0496 Jacek Lawrynowicz 2024-01-22  723  	ret = drmm_mutex_init(&vdev->drm, &vdev->context_list_lock);
f1cc6aceecd0496 Jacek Lawrynowicz 2024-01-22  724  	if (ret)
f1cc6aceecd0496 Jacek Lawrynowicz 2024-01-22  725  		goto err_xa_destroy;
5bbccadaf33eea2 Karol Wachowski   2025-01-07  726  
86a14330bf0598c Karol Wachowski   2026-03-02  727  	ret = drmm_mutex_init(&vdev->drm, &vdev->user_limits_lock);
86a14330bf0598c Karol Wachowski   2026-03-02  728  	if (ret)
86a14330bf0598c Karol Wachowski   2026-03-02  729  		goto err_xa_destroy;
86a14330bf0598c Karol Wachowski   2026-03-02  730  
5bbccadaf33eea2 Karol Wachowski   2025-01-07  731  	ret = drmm_mutex_init(&vdev->drm, &vdev->submitted_jobs_lock);
5bbccadaf33eea2 Karol Wachowski   2025-01-07  732  	if (ret)
5bbccadaf33eea2 Karol Wachowski   2025-01-07  733  		goto err_xa_destroy;
f1cc6aceecd0496 Jacek Lawrynowicz 2024-01-22  734  
48aea7f2a2efae6 Jacek Lawrynowicz 2023-10-31  735  	ret = drmm_mutex_init(&vdev->drm, &vdev->bo_list_lock);
48aea7f2a2efae6 Jacek Lawrynowicz 2023-10-31  736  	if (ret)
48aea7f2a2efae6 Jacek Lawrynowicz 2023-10-31  737  		goto err_xa_destroy;
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  738  
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  739  	ret = ivpu_pci_init(vdev);
0a9cd7924e56de9 Jacek Lawrynowicz 2023-09-01  740  	if (ret)
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  741  		goto err_xa_destroy;
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  742  
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  743  	ret = ivpu_irq_init(vdev);
0a9cd7924e56de9 Jacek Lawrynowicz 2023-09-01  744  	if (ret)
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  745  		goto err_xa_destroy;
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  746  
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  747  	/* Init basic HW info based on buttress registers which are accessible before power up */
8a27ad81f7d3a4b Wachowski, Karol  2024-05-15  748  	ret = ivpu_hw_init(vdev);
0a9cd7924e56de9 Jacek Lawrynowicz 2023-09-01  749  	if (ret)
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  750  		goto err_xa_destroy;
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  751  
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  752  	/* Power up early so the rest of init code can access VPU registers */
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  753  	ret = ivpu_hw_power_up(vdev);
0a9cd7924e56de9 Jacek Lawrynowicz 2023-09-01  754  	if (ret)
e3caadf1f9dfc9d Jacek Lawrynowicz 2024-04-02  755  		goto err_shutdown;
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  756  
a74f4d991352c95 Karol Wachowski   2024-10-17  757  	ivpu_mmu_global_context_init(vdev);
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  758  
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  759  	ret = ivpu_mmu_init(vdev);
0a9cd7924e56de9 Jacek Lawrynowicz 2023-09-01  760  	if (ret)
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  761  		goto err_mmu_gctx_fini;
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  762  
34d03f2a174dce5 Karol Wachowski   2023-09-01  763  	ret = ivpu_mmu_reserved_context_init(vdev);
0a9cd7924e56de9 Jacek Lawrynowicz 2023-09-01  764  	if (ret)
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  765  		goto err_mmu_gctx_fini;
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  766  
34d03f2a174dce5 Karol Wachowski   2023-09-01  767  	ret = ivpu_fw_init(vdev);
34d03f2a174dce5 Karol Wachowski   2023-09-01  768  	if (ret)
34d03f2a174dce5 Karol Wachowski   2023-09-01  769  		goto err_mmu_rctx_fini;
34d03f2a174dce5 Karol Wachowski   2023-09-01  770  
5d7422cfb498bf2 Jacek Lawrynowicz 2023-01-17  771  	ret = ivpu_ipc_init(vdev);
0a9cd7924e56de9 Jacek Lawrynowicz 2023-09-01  772  	if (ret)
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  773  		goto err_fw_fini;
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  774  
3f68b03ae6dcd18 Stanislaw Gruszka 2023-09-01  775  	ivpu_pm_init(vdev);
852be13f3bd32c1 Jacek Lawrynowicz 2023-01-17  776  
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  777  	ret = ivpu_boot(vdev);
0a9cd7924e56de9 Jacek Lawrynowicz 2023-09-01  778  	if (ret)
dc6256eb3d23e33 Guangshuo Li      2026-08-07  779  		goto err_pm_fini;
5d7422cfb498bf2 Jacek Lawrynowicz 2023-01-17  780  
3b434a3445fff31 Jacek Lawrynowicz 2023-11-13  781  	ivpu_job_done_consumer_init(vdev);
852be13f3bd32c1 Jacek Lawrynowicz 2023-01-17  782  	ivpu_pm_enable(vdev);
852be13f3bd32c1 Jacek Lawrynowicz 2023-01-17  783  
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  784  	return 0;
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  785  
dc6256eb3d23e33 Guangshuo Li      2026-08-07  786  err_pm_fini:
dc6256eb3d23e33 Guangshuo Li      2026-08-07  787  	pm_runtime_dont_use_autosuspend(vdev->drm.dev);
cd7272215c44676 Jacek Lawrynowicz 2023-01-17 @788  err_ipc_fini:
cd7272215c44676 Jacek Lawrynowicz 2023-01-17  789  	ivpu_ipc_fini(vdev);
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  790  err_fw_fini:
02d5b0aacd0590d Jacek Lawrynowicz 2023-01-17  791  	ivpu_fw_fini(vdev);
34d03f2a174dce5 Karol Wachowski   2023-09-01  792  err_mmu_rctx_fini:
34d03f2a174dce5 Karol Wachowski   2023-09-01  793  	ivpu_mmu_reserved_context_fini(vdev);
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  794  err_mmu_gctx_fini:
263b2ba5fc93c87 Jacek Lawrynowicz 2023-01-17  795  	ivpu_mmu_global_context_fini(vdev);
e3caadf1f9dfc9d Jacek Lawrynowicz 2024-04-02  796  err_shutdown:
e3caadf1f9dfc9d Jacek Lawrynowicz 2024-04-02  797  	ivpu_shutdown(vdev);
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  798  err_xa_destroy:
f32d59677ab1427 Wachowski, Karol  2024-02-14  799  	xa_destroy(&vdev->db_xa);
cd7272215c44676 Jacek Lawrynowicz 2023-01-17  800  	xa_destroy(&vdev->submitted_jobs_xa);
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  801  	xa_destroy(&vdev->context_xa);
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  802  	return ret;
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  803  }
35b137630f08d91 Jacek Lawrynowicz 2023-01-17  804  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
