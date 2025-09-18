Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BEA2DF124
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Sep 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758180928; cv=none; b=PEkSqipypG+0rzUXDD7o57Da7GScy0GnVK7pT05j73C37y9iON11ZD1mwTp6y6mVNg/9C9+OXWXxy0gQMxY4GF9pEW1MEC40kc8coPoTmeJqyHpp0J2AdnUvoARvKN9sB18mPyhHnhrbIl6fI4seGr6xmdXHVKC6ZoIzHwSQCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758180928; c=relaxed/simple;
	bh=Krd6hE5rHqiUEhYEn7LBkPRd3w8JYHS6ECn46TWXjoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CtVF34BUSB0qLVbkph4VqefEjg7AuFUcgN3Lat9L+AtweTwSGZuovaaFohAf73SQrYjWZk5V87rJhndj67vbzyV2Pi0l98HLFv/CurffwDOMGdDO9uHR4+K4rTLyTkVTWpW9xFP+p/xcXS8PYXmWCZCs/sUQPsVtoPPZ9FNBfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsZ6ubSa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsZ6ubSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758180926; x=1789716926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Krd6hE5rHqiUEhYEn7LBkPRd3w8JYHS6ECn46TWXjoc=;
  b=IsZ6ubSatwv2/p+UTVwcV9XS4HHT4wS7wP8R7FiTD86O6+Y1UjXEbsfx
   tDGmveYTAVsx+NEc4Oh2lrL4c7BUjYtbOXSCC+GLOjtddsZ7VnOsUW2dN
   +Qxv1it8aODyyp8gFQe4sxU4V8imgbuhdlfYSVULjc76i+A17sjojO0HH
   Nd9S77UgI2U7iiYTDvpSwE4im6k6D3DdPjT7kARiTx9lDzBE6KnKTTxka
   0vp0S+t8kDdSWIXIKK+KymB1fY53PGVkweEwD4HtF4Ys/k0WGTwTxedSq
   mnBUBruCO/ZV5XDrKXhuRHD2Plr2LMPC6wuDZ1Mw/YPh2VwgcQRDVb2hs
   Q==;
X-CSE-ConnectionGUID: 4IauHuzlRf6XqORUttjQjw==
X-CSE-MsgGUID: UYMaxQV+SfKGh1WwhCVRQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="64320167"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="64320167"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 00:35:25 -0700
X-CSE-ConnectionGUID: Y56tH+x7TIGE1bKzdsxgzg==
X-CSE-MsgGUID: V/+fh+ScTKeAiFF/zMFVEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="175043839"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Sep 2025 00:35:24 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz9An-0002ud-0R;
	Thu, 18 Sep 2025 07:35:21 +0000
Date: Thu, 18 Sep 2025 15:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9015/10189]
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c:303 mes_userq_mqd_create() warn:
 missing error code 'r'
Message-ID: <202509181546.yGKyQMBi-lkp@intel.com>
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
TO: Prike Liang <Prike.Liang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
commit: 9e46b8bb0539d7bc9a9e7b3072fa4f6082490392 [9015/10189] drm/amdgpu: validate userq buffer virtual address and size
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181546.yGKyQMBi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509181546.yGKyQMBi-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_userqueue.c:303 mes_userq_mqd_create() warn: missing error code 'r'

vim +/r +303 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c

54d18bc6003fad3 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Jesse.Zhang              2025-09-04  248  
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  249  static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  250  				struct drm_amdgpu_userq_in *args_in,
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  251  				struct amdgpu_usermode_queue *queue)
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  252  {
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  253  	struct amdgpu_device *adev = uq_mgr->adev;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  254  	struct amdgpu_mqd *mqd_hw_default = &adev->mqds[queue->queue_type];
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  255  	struct drm_amdgpu_userq_in *mqd_user = args_in;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  256  	struct amdgpu_mqd_prop *userq_props;
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  257  	struct amdgpu_gfx_shadow_info shadow_info;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  258  	int r;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  259  
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  260  	/* Structure to initialize MQD for userqueue using generic MQD init function */
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  261  	userq_props = kzalloc(sizeof(struct amdgpu_mqd_prop), GFP_KERNEL);
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  262  	if (!userq_props) {
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  263  		DRM_ERROR("Failed to allocate memory for userq_props\n");
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  264  		return -ENOMEM;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  265  	}
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  266  
42a66677805d03d drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2025-04-16  267  	r = amdgpu_userq_create_object(uq_mgr, &queue->mqd, mqd_hw_default->mqd_size);
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  268  	if (r) {
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  269  		DRM_ERROR("Failed to create MQD object for userqueue\n");
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  270  		goto free_props;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  271  	}
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  272  
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  273  	/* Initialize the MQD BO with user given values */
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  274  	userq_props->wptr_gpu_addr = mqd_user->wptr_va;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  275  	userq_props->rptr_gpu_addr = mqd_user->rptr_va;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  276  	userq_props->queue_size = mqd_user->queue_size;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  277  	userq_props->hqd_base_gpu_addr = mqd_user->queue_va;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  278  	userq_props->mqd_gpu_addr = queue->mqd.gpu_addr;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  279  	userq_props->use_doorbell = true;
f09c1e6077abd1b drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  280  	userq_props->doorbell_index = queue->doorbell_index;
dd5a376cd234c3f drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Arunpravin Paneer Selvam 2024-11-26  281  	userq_props->fence_address = queue->fence_drv->gpu_addr;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  282  
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  283  	if (adev->gfx.funcs->get_gfx_shadow_info)
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  284  		adev->gfx.funcs->get_gfx_shadow_info(adev, &shadow_info, true);
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  285  	if (queue->queue_type == AMDGPU_HW_IP_COMPUTE) {
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  286  		struct drm_amdgpu_userq_mqd_compute_gfx11 *compute_mqd;
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  287  
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  288  		if (mqd_user->mqd_size != sizeof(*compute_mqd)) {
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  289  			DRM_ERROR("Invalid compute IP MQD size\n");
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  290  			r = -EINVAL;
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  291  			goto free_mqd;
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  292  		}
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  293  
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  294  		compute_mqd = memdup_user(u64_to_user_ptr(mqd_user->mqd), mqd_user->mqd_size);
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  295  		if (IS_ERR(compute_mqd)) {
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  296  			DRM_ERROR("Failed to read user MQD\n");
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  297  			r = -ENOMEM;
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  298  			goto free_mqd;
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  299  		}
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  300  
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  301  		if (amdgpu_userq_input_va_validate(queue->vm, compute_mqd->eop_va,
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  302  		    max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE)))
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23 @303  			goto free_mqd;
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  304  
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  305  		userq_props->eop_gpu_addr = compute_mqd->eop_va;
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  306  		userq_props->hqd_pipe_priority = AMDGPU_GFX_PIPE_PRIO_NORMAL;
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  307  		userq_props->hqd_queue_priority = AMDGPU_GFX_QUEUE_PRIORITY_MINIMUM;
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  308  		userq_props->hqd_active = false;
87ceff6136dbbfc drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2025-02-26  309  		userq_props->tmz_queue =
87ceff6136dbbfc drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2025-02-26  310  			mqd_user->flags & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  311  		kfree(compute_mqd);
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  312  	} else if (queue->queue_type == AMDGPU_HW_IP_GFX) {
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  313  		struct drm_amdgpu_userq_mqd_gfx11 *mqd_gfx_v11;
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  314  
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  315  		if (mqd_user->mqd_size != sizeof(*mqd_gfx_v11) || !mqd_user->mqd) {
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  316  			DRM_ERROR("Invalid GFX MQD\n");
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  317  			r = -EINVAL;
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  318  			goto free_mqd;
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  319  		}
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  320  
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  321  		mqd_gfx_v11 = memdup_user(u64_to_user_ptr(mqd_user->mqd), mqd_user->mqd_size);
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  322  		if (IS_ERR(mqd_gfx_v11)) {
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  323  			DRM_ERROR("Failed to read user MQD\n");
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  324  			r = -ENOMEM;
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  325  			goto free_mqd;
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  326  		}
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  327  
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  328  		userq_props->shadow_addr = mqd_gfx_v11->shadow_va;
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  329  		userq_props->csa_addr = mqd_gfx_v11->csa_va;
87ceff6136dbbfc drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2025-02-26  330  		userq_props->tmz_queue =
87ceff6136dbbfc drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2025-02-26  331  			mqd_user->flags & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  332  
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  333  		if (amdgpu_userq_input_va_validate(queue->vm, mqd_gfx_v11->shadow_va,
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  334  		    shadow_info.shadow_size))
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  335  			goto free_mqd;
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  336  
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  337  		kfree(mqd_gfx_v11);
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  338  	} else if (queue->queue_type == AMDGPU_HW_IP_DMA) {
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  339  		struct drm_amdgpu_userq_mqd_sdma_gfx11 *mqd_sdma_v11;
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  340  
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  341  		if (mqd_user->mqd_size != sizeof(*mqd_sdma_v11) || !mqd_user->mqd) {
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  342  			DRM_ERROR("Invalid SDMA MQD\n");
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  343  			r = -EINVAL;
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  344  			goto free_mqd;
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  345  		}
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  346  
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  347  		mqd_sdma_v11 = memdup_user(u64_to_user_ptr(mqd_user->mqd), mqd_user->mqd_size);
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  348  		if (IS_ERR(mqd_sdma_v11)) {
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  349  			DRM_ERROR("Failed to read sdma user MQD\n");
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  350  			r = -ENOMEM;
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  351  			goto free_mqd;
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  352  		}
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  353  
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  354  		if (amdgpu_userq_input_va_validate(queue->vm, mqd_sdma_v11->csa_va,
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  355  		    shadow_info.csa_size))
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  356  			goto free_mqd;
9e46b8bb0539d7b drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Prike Liang              2025-06-23  357  
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  358  		userq_props->csa_addr = mqd_sdma_v11->csa_va;
b965c5d87108add drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Alex Deucher             2024-10-21  359  		kfree(mqd_sdma_v11);
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  360  	}
2c695d7c072067c drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-09  361  
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  362  	queue->userq_prop = userq_props;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  363  
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  364  	r = mqd_hw_default->init_mqd(adev, (void *)queue->mqd.cpu_ptr, userq_props);
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  365  	if (r) {
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  366  		DRM_ERROR("Failed to initialize MQD for userqueue\n");
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  367  		goto free_mqd;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  368  	}
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  369  
defb41e8ef3a7d0 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-02  370  	/* Create BO for FW operations */
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  371  	r = mes_userq_create_ctx_space(uq_mgr, queue, mqd_user);
defb41e8ef3a7d0 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-02  372  	if (r) {
defb41e8ef3a7d0 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-02  373  		DRM_ERROR("Failed to allocate BO for userqueue (%d)", r);
defb41e8ef3a7d0 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-02  374  		goto free_mqd;
defb41e8ef3a7d0 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-02  375  	}
defb41e8ef3a7d0 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-02  376  
5fb2f7fc21a3668 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-04-22  377  	/* FW expects WPTR BOs to be mapped into GART */
79819d9a0ac38bf drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2024-11-26  378  	r = mes_userq_create_wptr_mapping(uq_mgr, queue, userq_props->wptr_gpu_addr);
5fb2f7fc21a3668 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-04-22  379  	if (r) {
5fb2f7fc21a3668 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-04-22  380  		DRM_ERROR("Failed to create WPTR mapping\n");
5fb2f7fc21a3668 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-04-22  381  		goto free_ctx;
5fb2f7fc21a3668 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-04-22  382  	}
5fb2f7fc21a3668 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-04-22  383  
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  384  	return 0;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  385  
6c42559f70c5759 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-02  386  free_ctx:
42a66677805d03d drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2025-04-16  387  	amdgpu_userq_destroy_object(uq_mgr, &queue->fw_obj);
6c42559f70c5759 drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-05-02  388  
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  389  free_mqd:
42a66677805d03d drivers/gpu/drm/amd/amdgpu/mes_userqueue.c       Alex Deucher             2025-04-16  390  	amdgpu_userq_destroy_object(uq_mgr, &queue->mqd);
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  391  
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  392  free_props:
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  393  	kfree(userq_props);
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  394  
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  395  	return r;
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  396  }
fbf136b932358da drivers/gpu/drm/amd/amdgpu/mes_v11_0_userqueue.c Shashank Sharma          2024-08-26  397  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
