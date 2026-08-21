Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7B2DF3F2
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 03:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787281296; cv=none; b=IdYGsEbPAf3LwfxPxanocf3VkYw/KKyrATZK7DT7PSubJw7rqTwOgVmtAhiAkWxtCUYD24lvFkU5y4adGCDOWGT/0idLvjdvN4p7h41UxWFJw9SIZfKrJELNH2od+nKmd7uvsF3M4xFUbMcHWlot4ILSqPeh6ZgOkR4bkKNEGlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787281296; c=relaxed/simple;
	bh=Vcg4k8+GjHywkCJvKjBQQo4MVW31G6QUBnY+MNZqe0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uBpHf8pImtE7tyyujNe0dnchwhdlSgN72vnK/Uo1GBG/Z2U5pQ/uqFizQQeEzf5T+bkobEqI67wu0dK7/T92pTEmMWZzQ9e6qlRE7S07Iw4en+BFAURP+FtnxpzSWAYNU6wnTOTbpVLv3cEN2xscsKWFNcg7F+CdmY8LWSxRpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvzEUhUo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvzEUhUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787281295; x=1818817295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vcg4k8+GjHywkCJvKjBQQo4MVW31G6QUBnY+MNZqe0E=;
  b=cvzEUhUoqyOaiv78Uiqeq+wUurd8xHpxVPYM7n5WMUSDwCFhoTwgRYFA
   Io2nvB7+iZ/J4wxUT7NyKR+otHosfY+bqzSbEOpHyGiFw8EcnvZGMRc3r
   giaaXIgv5Vvn4l+tirK77Y/S/QeuhwXz5gLNAGhXXbFyDzCAJWYF+IbcB
   7d94fNCM640VtJb2CcoFUQ+5wkJGNJ/CoQ6V3Ms57F6w5JwiOult3QmJD
   hwCWLjQ6LhW8x+58eah7+9q3B7RMrs5AL0Ly5qt3XEH3TWb7p4w43Yj8P
   Qy2SuhOb2SJgI4sU1ACc8a64bLS154LYcBuLku87KapPbFBUKIULGnxNC
   A==;
X-CSE-ConnectionGUID: 1OowXGPISYWji9IJtQO2rA==
X-CSE-MsgGUID: HJW9JBRIReSBVbXbTv5Uug==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91700147"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="91700147"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 20:01:35 -0700
X-CSE-ConnectionGUID: +7FYPXzLSq+ZSCGZp8kpEw==
X-CSE-MsgGUID: wSNJsrzyQ0a31UH9hcDNVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="263557920"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2026 20:01:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxFVa-00000000p9B-2fS5;
	Fri, 21 Aug 2026 03:01:30 +0000
Date: Fri, 21 Aug 2026 11:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] accel/ivpu: fix usage_count leak when autosuspend_delay
 is negative
Message-ID: <202608211038.oCWZXWtK-lkp@intel.com>
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
CC: llvm@lists.linux.dev
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
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-075-20260821 (https://download.01.org/0day-ci/archive/20260821/202608211038.oCWZXWtK-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211038.oCWZXWtK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608211038.oCWZXWtK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/ivpu/ivpu_drv.c:788:1: warning: unused label 'err_ipc_fini' [-Wunused-label]
     788 | err_ipc_fini:
         | ^~~~~~~~~~~~~
   1 warning generated.


vim +/err_ipc_fini +788 drivers/accel/ivpu/ivpu_drv.c

35b137630f08d9 Jacek Lawrynowicz 2023-01-17  678  
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  679  static int ivpu_dev_init(struct ivpu_device *vdev)
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  680  {
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  681  	int ret;
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  682  
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  683  	vdev->hw = drmm_kzalloc(&vdev->drm, sizeof(*vdev->hw), GFP_KERNEL);
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  684  	if (!vdev->hw)
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  685  		return -ENOMEM;
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  686  
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  687  	vdev->mmu = drmm_kzalloc(&vdev->drm, sizeof(*vdev->mmu), GFP_KERNEL);
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  688  	if (!vdev->mmu)
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  689  		return -ENOMEM;
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  690  
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  691  	vdev->fw = drmm_kzalloc(&vdev->drm, sizeof(*vdev->fw), GFP_KERNEL);
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  692  	if (!vdev->fw)
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  693  		return -ENOMEM;
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  694  
5d7422cfb498bf Jacek Lawrynowicz 2023-01-17  695  	vdev->ipc = drmm_kzalloc(&vdev->drm, sizeof(*vdev->ipc), GFP_KERNEL);
5d7422cfb498bf Jacek Lawrynowicz 2023-01-17  696  	if (!vdev->ipc)
5d7422cfb498bf Jacek Lawrynowicz 2023-01-17  697  		return -ENOMEM;
5d7422cfb498bf Jacek Lawrynowicz 2023-01-17  698  
852be13f3bd32c Jacek Lawrynowicz 2023-01-17  699  	vdev->pm = drmm_kzalloc(&vdev->drm, sizeof(*vdev->pm), GFP_KERNEL);
852be13f3bd32c Jacek Lawrynowicz 2023-01-17  700  	if (!vdev->pm)
852be13f3bd32c Jacek Lawrynowicz 2023-01-17  701  		return -ENOMEM;
852be13f3bd32c Jacek Lawrynowicz 2023-01-17  702  
8a27ad81f7d3a4 Wachowski, Karol  2024-05-15  703  	if (ivpu_hw_ip_gen(vdev) >= IVPU_HW_IP_40XX)
79cdc56c4a5425 Stanislaw Gruszka 2023-07-31  704  		vdev->hw->dma_bits = 48;
8a27ad81f7d3a4 Wachowski, Karol  2024-05-15  705  	else
a4172d6cf0a2b9 Karol Wachowski   2023-05-18  706  		vdev->hw->dma_bits = 38;
a4172d6cf0a2b9 Karol Wachowski   2023-05-18  707  
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  708  	vdev->platform = IVPU_PLATFORM_INVALID;
3ff6edbc17dbab Stanislaw Gruszka 2023-03-23  709  	vdev->context_xa_limit.min = IVPU_USER_CONTEXT_MIN_SSID;
3ff6edbc17dbab Stanislaw Gruszka 2023-03-23  710  	vdev->context_xa_limit.max = IVPU_USER_CONTEXT_MAX_SSID;
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  711  	atomic64_set(&vdev->unique_id_counter, 0);
0e7db503c5355f Karol Wachowski   2025-04-16  712  	atomic_set(&vdev->job_timeout_counter, 0);
ade00a6c903f85 Karol Wachowski   2026-03-18  713  	atomic_set(&vdev->faults_detected, 0);
fd7726e75968b2 Jacek Lawrynowicz 2024-04-02  714  	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
cd7272215c4467 Jacek Lawrynowicz 2023-01-17  715  	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
f32d59677ab142 Wachowski, Karol  2024-02-14  716  	xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
48aea7f2a2efae Jacek Lawrynowicz 2023-10-31  717  	INIT_LIST_HEAD(&vdev->bo_list);
86a14330bf0598 Karol Wachowski   2026-03-02  718  	hash_init(vdev->user_limits);
48aea7f2a2efae Jacek Lawrynowicz 2023-10-31  719  
ae7af7d8dc2a13 Karol Wachowski   2024-10-17  720  	vdev->db_limit.min = IVPU_MIN_DB;
ae7af7d8dc2a13 Karol Wachowski   2024-10-17  721  	vdev->db_limit.max = IVPU_MAX_DB;
c3b0ec0fe0c7eb Tomasz Rusinowicz 2024-09-30  722  
f1cc6aceecd049 Jacek Lawrynowicz 2024-01-22  723  	ret = drmm_mutex_init(&vdev->drm, &vdev->context_list_lock);
f1cc6aceecd049 Jacek Lawrynowicz 2024-01-22  724  	if (ret)
f1cc6aceecd049 Jacek Lawrynowicz 2024-01-22  725  		goto err_xa_destroy;
5bbccadaf33eea Karol Wachowski   2025-01-07  726  
86a14330bf0598 Karol Wachowski   2026-03-02  727  	ret = drmm_mutex_init(&vdev->drm, &vdev->user_limits_lock);
86a14330bf0598 Karol Wachowski   2026-03-02  728  	if (ret)
86a14330bf0598 Karol Wachowski   2026-03-02  729  		goto err_xa_destroy;
86a14330bf0598 Karol Wachowski   2026-03-02  730  
5bbccadaf33eea Karol Wachowski   2025-01-07  731  	ret = drmm_mutex_init(&vdev->drm, &vdev->submitted_jobs_lock);
5bbccadaf33eea Karol Wachowski   2025-01-07  732  	if (ret)
5bbccadaf33eea Karol Wachowski   2025-01-07  733  		goto err_xa_destroy;
f1cc6aceecd049 Jacek Lawrynowicz 2024-01-22  734  
48aea7f2a2efae Jacek Lawrynowicz 2023-10-31  735  	ret = drmm_mutex_init(&vdev->drm, &vdev->bo_list_lock);
48aea7f2a2efae Jacek Lawrynowicz 2023-10-31  736  	if (ret)
48aea7f2a2efae Jacek Lawrynowicz 2023-10-31  737  		goto err_xa_destroy;
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  738  
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  739  	ret = ivpu_pci_init(vdev);
0a9cd7924e56de Jacek Lawrynowicz 2023-09-01  740  	if (ret)
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  741  		goto err_xa_destroy;
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  742  
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  743  	ret = ivpu_irq_init(vdev);
0a9cd7924e56de Jacek Lawrynowicz 2023-09-01  744  	if (ret)
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  745  		goto err_xa_destroy;
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  746  
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  747  	/* Init basic HW info based on buttress registers which are accessible before power up */
8a27ad81f7d3a4 Wachowski, Karol  2024-05-15  748  	ret = ivpu_hw_init(vdev);
0a9cd7924e56de Jacek Lawrynowicz 2023-09-01  749  	if (ret)
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  750  		goto err_xa_destroy;
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  751  
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  752  	/* Power up early so the rest of init code can access VPU registers */
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  753  	ret = ivpu_hw_power_up(vdev);
0a9cd7924e56de Jacek Lawrynowicz 2023-09-01  754  	if (ret)
e3caadf1f9dfc9 Jacek Lawrynowicz 2024-04-02  755  		goto err_shutdown;
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  756  
a74f4d991352c9 Karol Wachowski   2024-10-17  757  	ivpu_mmu_global_context_init(vdev);
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  758  
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  759  	ret = ivpu_mmu_init(vdev);
0a9cd7924e56de Jacek Lawrynowicz 2023-09-01  760  	if (ret)
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  761  		goto err_mmu_gctx_fini;
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  762  
34d03f2a174dce Karol Wachowski   2023-09-01  763  	ret = ivpu_mmu_reserved_context_init(vdev);
0a9cd7924e56de Jacek Lawrynowicz 2023-09-01  764  	if (ret)
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  765  		goto err_mmu_gctx_fini;
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  766  
34d03f2a174dce Karol Wachowski   2023-09-01  767  	ret = ivpu_fw_init(vdev);
34d03f2a174dce Karol Wachowski   2023-09-01  768  	if (ret)
34d03f2a174dce Karol Wachowski   2023-09-01  769  		goto err_mmu_rctx_fini;
34d03f2a174dce Karol Wachowski   2023-09-01  770  
5d7422cfb498bf Jacek Lawrynowicz 2023-01-17  771  	ret = ivpu_ipc_init(vdev);
0a9cd7924e56de Jacek Lawrynowicz 2023-09-01  772  	if (ret)
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  773  		goto err_fw_fini;
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  774  
3f68b03ae6dcd1 Stanislaw Gruszka 2023-09-01  775  	ivpu_pm_init(vdev);
852be13f3bd32c Jacek Lawrynowicz 2023-01-17  776  
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  777  	ret = ivpu_boot(vdev);
0a9cd7924e56de Jacek Lawrynowicz 2023-09-01  778  	if (ret)
dc6256eb3d23e3 Guangshuo Li      2026-08-07  779  		goto err_pm_fini;
5d7422cfb498bf Jacek Lawrynowicz 2023-01-17  780  
3b434a3445fff3 Jacek Lawrynowicz 2023-11-13  781  	ivpu_job_done_consumer_init(vdev);
852be13f3bd32c Jacek Lawrynowicz 2023-01-17  782  	ivpu_pm_enable(vdev);
852be13f3bd32c Jacek Lawrynowicz 2023-01-17  783  
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  784  	return 0;
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  785  
dc6256eb3d23e3 Guangshuo Li      2026-08-07  786  err_pm_fini:
dc6256eb3d23e3 Guangshuo Li      2026-08-07  787  	pm_runtime_dont_use_autosuspend(vdev->drm.dev);
cd7272215c4467 Jacek Lawrynowicz 2023-01-17 @788  err_ipc_fini:
cd7272215c4467 Jacek Lawrynowicz 2023-01-17  789  	ivpu_ipc_fini(vdev);
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  790  err_fw_fini:
02d5b0aacd0590 Jacek Lawrynowicz 2023-01-17  791  	ivpu_fw_fini(vdev);
34d03f2a174dce Karol Wachowski   2023-09-01  792  err_mmu_rctx_fini:
34d03f2a174dce Karol Wachowski   2023-09-01  793  	ivpu_mmu_reserved_context_fini(vdev);
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  794  err_mmu_gctx_fini:
263b2ba5fc93c8 Jacek Lawrynowicz 2023-01-17  795  	ivpu_mmu_global_context_fini(vdev);
e3caadf1f9dfc9 Jacek Lawrynowicz 2024-04-02  796  err_shutdown:
e3caadf1f9dfc9 Jacek Lawrynowicz 2024-04-02  797  	ivpu_shutdown(vdev);
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  798  err_xa_destroy:
f32d59677ab142 Wachowski, Karol  2024-02-14  799  	xa_destroy(&vdev->db_xa);
cd7272215c4467 Jacek Lawrynowicz 2023-01-17  800  	xa_destroy(&vdev->submitted_jobs_xa);
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  801  	xa_destroy(&vdev->context_xa);
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  802  	return ret;
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  803  }
35b137630f08d9 Jacek Lawrynowicz 2023-01-17  804  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
