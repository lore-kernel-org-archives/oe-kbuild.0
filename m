Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306A4084E
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jun 2024 04:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718253770; cv=none; b=JH4g0c70Ms/VLFSRApnNc/ePafIOa3GvJh+4/L8pP/ZKexc5MPDrPCww/xwZsnHynV0E949pqFtFXlq3oZApGVXALh/qVTlFQVuuSh3UzQEGak9UTj/+ja40ejSWHdi/2XUAPdw34tlSpQ59MWtnQ7og7Di5kI6UNW+jZx9n71E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718253770; c=relaxed/simple;
	bh=t+yPhQHFRa7rfJfFstW9D2jc+G/2wO3oNXs6tZFqG78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b6aItI4rQSqwiTIS6+1f0LWG8HPS6pkcwACt6qfbnITS600dLT3McVG6f2d9KtEJF6TJao3hZcGoPHkhp9ltQC+asfWVt3lRW2pbxD+MlWnZpYs/vvbeqcN7hnnRjaCmlD9BeJMNCXOPY87z56n09BDZZY3HY7jB3PYWKIVHuts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXHhi/2O; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXHhi/2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718253767; x=1749789767;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t+yPhQHFRa7rfJfFstW9D2jc+G/2wO3oNXs6tZFqG78=;
  b=VXHhi/2OJ/0IGjzHQudkBWGdHEbm4m78gCretps6zGKEPB9qBnTsuu5m
   IWJ+vc5ErvdQ3QwBEkFRqX7xSa9esKAnPZeyfd4WGt3JrhQAucfKPrcRs
   75HXS7Osg+YSU16AyjVLDfI4CETismtKzolNAnn1M5oziodpBP6Vlizlz
   qvGBLVJTCWdCLZcewZKY7eU4xrTib1nRGc6urSpA4tisNnt60+yLpVRJH
   XumwxCfZ6uPd5WQQtwAdxAAOGD+Y9G7s1+h2wE7DQTI+EqaIJ4Vq1ruiZ
   ggV1eq3nsvcx7WkmVGQ4PDUu8pf2OzShLbXxgqPpdcUjRfQXfEDshdF+P
   w==;
X-CSE-ConnectionGUID: tO4cYSrhRpGqgpSbIYqWYg==
X-CSE-MsgGUID: 7+jkBVsQTiSjspSeyZkldw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32592803"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="32592803"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 21:42:34 -0700
X-CSE-ConnectionGUID: WvVs4F1PQ7ez5Kdu8hOBKA==
X-CSE-MsgGUID: JZUubKxzQdiAmS2t3A6Dbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="39972143"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2024 21:42:33 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHcIB-0002E6-0H;
	Thu, 13 Jun 2024 04:42:31 +0000
Date: Thu, 13 Jun 2024 12:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 8/9] accel/rocket: Add job submission IOCTL
Message-ID: <202406131212.l47PJv5r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
TO: Tomeu Vizoso <tomeu@tomeuvizoso.net>
TO: Joerg Roedel <joro@8bytes.org>
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Oded Gabbay <ogabbay@kernel.org>
TO: Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian König" <christian.koenig@amd.com>
CC: iommu@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-media@vger.kernel.org
CC: linaro-mm-sig@lists.linaro.org

Hi Tomeu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 83a7eefedc9b56fe7bfeff13b6c7356688ffa670]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomeu-Vizoso/iommu-rockchip-Add-compatible-for-rockchip-rk3588-iommu/20240612-215814
base:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
patch link:    https://lore.kernel.org/r/20240612-6-10-rocket-v1-8-060e48eea250%40tomeuvizoso.net
patch subject: [PATCH 8/9] accel/rocket: Add job submission IOCTL
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: hexagon-randconfig-r061-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131212.l47PJv5r-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202406131212.l47PJv5r-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/rocket/rocket_job.c:705:11-12: WARNING kvmalloc is used to allocate this memory at line 687
   drivers/accel/rocket/rocket_job.c:240:10-11: WARNING kvmalloc is used to allocate this memory at line 204
--
>> drivers/accel/rocket/rocket_job.c:585:74-80: ERROR: application of sizeof to pointer

vim +705 drivers/accel/rocket/rocket_job.c

647cf4397da3324 Tomeu Vizoso 2024-06-12  581  
647cf4397da3324 Tomeu Vizoso 2024-06-12  582  int rocket_job_open(struct rocket_file_priv *rocket_priv)
647cf4397da3324 Tomeu Vizoso 2024-06-12  583  {
647cf4397da3324 Tomeu Vizoso 2024-06-12  584  	struct rocket_device *rdev = rocket_priv->rdev;
647cf4397da3324 Tomeu Vizoso 2024-06-12 @585  	struct drm_gpu_scheduler **scheds = kmalloc_array(rdev->comp->num_cores, sizeof(scheds), GFP_KERNEL);
647cf4397da3324 Tomeu Vizoso 2024-06-12  586  	unsigned int core;
647cf4397da3324 Tomeu Vizoso 2024-06-12  587  	int ret;
647cf4397da3324 Tomeu Vizoso 2024-06-12  588  
647cf4397da3324 Tomeu Vizoso 2024-06-12  589  	for (core = 0; core < rdev->comp->num_cores; core++)
647cf4397da3324 Tomeu Vizoso 2024-06-12  590  		scheds[core] = &rdev->cores[core].sched;
647cf4397da3324 Tomeu Vizoso 2024-06-12  591  
647cf4397da3324 Tomeu Vizoso 2024-06-12  592  	ret = drm_sched_entity_init(&rocket_priv->sched_entity,
647cf4397da3324 Tomeu Vizoso 2024-06-12  593  				    DRM_SCHED_PRIORITY_NORMAL,
647cf4397da3324 Tomeu Vizoso 2024-06-12  594  				    scheds,
647cf4397da3324 Tomeu Vizoso 2024-06-12  595  				    3, NULL);
647cf4397da3324 Tomeu Vizoso 2024-06-12  596  	if (WARN_ON(ret))
647cf4397da3324 Tomeu Vizoso 2024-06-12  597  		return ret;
647cf4397da3324 Tomeu Vizoso 2024-06-12  598  
647cf4397da3324 Tomeu Vizoso 2024-06-12  599  	return 0;
647cf4397da3324 Tomeu Vizoso 2024-06-12  600  }
647cf4397da3324 Tomeu Vizoso 2024-06-12  601  
647cf4397da3324 Tomeu Vizoso 2024-06-12  602  void rocket_job_close(struct rocket_file_priv *rocket_priv)
647cf4397da3324 Tomeu Vizoso 2024-06-12  603  {
647cf4397da3324 Tomeu Vizoso 2024-06-12  604  	struct drm_sched_entity *entity = &rocket_priv->sched_entity;
647cf4397da3324 Tomeu Vizoso 2024-06-12  605  
647cf4397da3324 Tomeu Vizoso 2024-06-12  606  	kfree(entity->sched_list);
647cf4397da3324 Tomeu Vizoso 2024-06-12  607  	drm_sched_entity_destroy(entity);
647cf4397da3324 Tomeu Vizoso 2024-06-12  608  }
647cf4397da3324 Tomeu Vizoso 2024-06-12  609  
647cf4397da3324 Tomeu Vizoso 2024-06-12  610  int rocket_job_is_idle(struct rocket_device *rdev)
647cf4397da3324 Tomeu Vizoso 2024-06-12  611  {
647cf4397da3324 Tomeu Vizoso 2024-06-12  612  	unsigned int core;
647cf4397da3324 Tomeu Vizoso 2024-06-12  613  
647cf4397da3324 Tomeu Vizoso 2024-06-12  614  	for (core = 0; core < rdev->comp->num_cores; core++) {
647cf4397da3324 Tomeu Vizoso 2024-06-12  615  		/* If there are any jobs in any HW queue, we're not idle */
647cf4397da3324 Tomeu Vizoso 2024-06-12  616  		if (atomic_read(&rdev->cores[core].sched.credit_count))
647cf4397da3324 Tomeu Vizoso 2024-06-12  617  			return false;
647cf4397da3324 Tomeu Vizoso 2024-06-12  618  	}
647cf4397da3324 Tomeu Vizoso 2024-06-12  619  
647cf4397da3324 Tomeu Vizoso 2024-06-12  620  	return true;
647cf4397da3324 Tomeu Vizoso 2024-06-12  621  }
647cf4397da3324 Tomeu Vizoso 2024-06-12  622  
647cf4397da3324 Tomeu Vizoso 2024-06-12  623  static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file, struct drm_rocket_job *job)
647cf4397da3324 Tomeu Vizoso 2024-06-12  624  {
647cf4397da3324 Tomeu Vizoso 2024-06-12  625  	struct rocket_device *rdev = dev->dev_private;
647cf4397da3324 Tomeu Vizoso 2024-06-12  626  	struct rocket_file_priv *file_priv = file->driver_priv;
647cf4397da3324 Tomeu Vizoso 2024-06-12  627  	struct rocket_job *rjob = NULL;
647cf4397da3324 Tomeu Vizoso 2024-06-12  628  	int ret = 0;
647cf4397da3324 Tomeu Vizoso 2024-06-12  629  
647cf4397da3324 Tomeu Vizoso 2024-06-12  630  	if (job->task_count == 0)
647cf4397da3324 Tomeu Vizoso 2024-06-12  631  		return -EINVAL;
647cf4397da3324 Tomeu Vizoso 2024-06-12  632  
647cf4397da3324 Tomeu Vizoso 2024-06-12  633  	rjob = kzalloc(sizeof(*rjob), GFP_KERNEL);
647cf4397da3324 Tomeu Vizoso 2024-06-12  634  	if (!rjob)
647cf4397da3324 Tomeu Vizoso 2024-06-12  635  		return -ENOMEM;
647cf4397da3324 Tomeu Vizoso 2024-06-12  636  
647cf4397da3324 Tomeu Vizoso 2024-06-12  637  	kref_init(&rjob->refcount);
647cf4397da3324 Tomeu Vizoso 2024-06-12  638  
647cf4397da3324 Tomeu Vizoso 2024-06-12  639  	rjob->rdev = rdev;
647cf4397da3324 Tomeu Vizoso 2024-06-12  640  
647cf4397da3324 Tomeu Vizoso 2024-06-12  641  	ret = drm_sched_job_init(&rjob->base,
647cf4397da3324 Tomeu Vizoso 2024-06-12  642  				 &file_priv->sched_entity,
647cf4397da3324 Tomeu Vizoso 2024-06-12  643  				 1, NULL);
647cf4397da3324 Tomeu Vizoso 2024-06-12  644  	if (ret)
647cf4397da3324 Tomeu Vizoso 2024-06-12  645  		goto out_put_job;
647cf4397da3324 Tomeu Vizoso 2024-06-12  646  
647cf4397da3324 Tomeu Vizoso 2024-06-12  647  	ret = rocket_copy_tasks(dev, file, job, rjob);
647cf4397da3324 Tomeu Vizoso 2024-06-12  648  	if (ret)
647cf4397da3324 Tomeu Vizoso 2024-06-12  649  		goto out_cleanup_job;
647cf4397da3324 Tomeu Vizoso 2024-06-12  650  
647cf4397da3324 Tomeu Vizoso 2024-06-12  651  	ret = drm_gem_objects_lookup(file,
647cf4397da3324 Tomeu Vizoso 2024-06-12  652  				     (void __user *)(uintptr_t)job->in_bo_handles,
647cf4397da3324 Tomeu Vizoso 2024-06-12  653  				     job->in_bo_handle_count, &rjob->in_bos);
647cf4397da3324 Tomeu Vizoso 2024-06-12  654  	if (ret)
647cf4397da3324 Tomeu Vizoso 2024-06-12  655  		goto out_cleanup_job;
647cf4397da3324 Tomeu Vizoso 2024-06-12  656  
647cf4397da3324 Tomeu Vizoso 2024-06-12  657  	rjob->in_bo_count = job->in_bo_handle_count;
647cf4397da3324 Tomeu Vizoso 2024-06-12  658  
647cf4397da3324 Tomeu Vizoso 2024-06-12  659  	ret = drm_gem_objects_lookup(file,
647cf4397da3324 Tomeu Vizoso 2024-06-12  660  				     (void __user *)(uintptr_t)job->out_bo_handles,
647cf4397da3324 Tomeu Vizoso 2024-06-12  661  				     job->out_bo_handle_count, &rjob->out_bos);
647cf4397da3324 Tomeu Vizoso 2024-06-12  662  	if (ret)
647cf4397da3324 Tomeu Vizoso 2024-06-12  663  		goto out_cleanup_job;
647cf4397da3324 Tomeu Vizoso 2024-06-12  664  
647cf4397da3324 Tomeu Vizoso 2024-06-12  665  	rjob->out_bo_count = job->out_bo_handle_count;
647cf4397da3324 Tomeu Vizoso 2024-06-12  666  
647cf4397da3324 Tomeu Vizoso 2024-06-12  667  	ret = rocket_job_push(rjob);
647cf4397da3324 Tomeu Vizoso 2024-06-12  668  	if (ret)
647cf4397da3324 Tomeu Vizoso 2024-06-12  669  		goto out_cleanup_job;
647cf4397da3324 Tomeu Vizoso 2024-06-12  670  
647cf4397da3324 Tomeu Vizoso 2024-06-12  671  out_cleanup_job:
647cf4397da3324 Tomeu Vizoso 2024-06-12  672  	if (ret)
647cf4397da3324 Tomeu Vizoso 2024-06-12  673  		drm_sched_job_cleanup(&rjob->base);
647cf4397da3324 Tomeu Vizoso 2024-06-12  674  out_put_job:
647cf4397da3324 Tomeu Vizoso 2024-06-12  675  	rocket_job_put(rjob);
647cf4397da3324 Tomeu Vizoso 2024-06-12  676  
647cf4397da3324 Tomeu Vizoso 2024-06-12  677  	return ret;
647cf4397da3324 Tomeu Vizoso 2024-06-12  678  }
647cf4397da3324 Tomeu Vizoso 2024-06-12  679  
647cf4397da3324 Tomeu Vizoso 2024-06-12  680  int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
647cf4397da3324 Tomeu Vizoso 2024-06-12  681  {
647cf4397da3324 Tomeu Vizoso 2024-06-12  682  	struct drm_rocket_submit *args = data;
647cf4397da3324 Tomeu Vizoso 2024-06-12  683  	struct drm_rocket_job *jobs;
647cf4397da3324 Tomeu Vizoso 2024-06-12  684  	int ret = 0;
647cf4397da3324 Tomeu Vizoso 2024-06-12  685  	unsigned int i = 0;
647cf4397da3324 Tomeu Vizoso 2024-06-12  686  
647cf4397da3324 Tomeu Vizoso 2024-06-12 @687  	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
647cf4397da3324 Tomeu Vizoso 2024-06-12  688  	if (!jobs) {
647cf4397da3324 Tomeu Vizoso 2024-06-12  689  		DRM_DEBUG("Failed to allocate incoming job array\n");
647cf4397da3324 Tomeu Vizoso 2024-06-12  690  		return -ENOMEM;
647cf4397da3324 Tomeu Vizoso 2024-06-12  691  	}
647cf4397da3324 Tomeu Vizoso 2024-06-12  692  
647cf4397da3324 Tomeu Vizoso 2024-06-12  693  	if (copy_from_user(jobs,
647cf4397da3324 Tomeu Vizoso 2024-06-12  694  			   (void __user *)(uintptr_t)args->jobs,
647cf4397da3324 Tomeu Vizoso 2024-06-12  695  			   args->job_count * sizeof(*jobs))) {
647cf4397da3324 Tomeu Vizoso 2024-06-12  696  		ret = -EFAULT;
647cf4397da3324 Tomeu Vizoso 2024-06-12  697  		DRM_DEBUG("Failed to copy incoming job array\n");
647cf4397da3324 Tomeu Vizoso 2024-06-12  698  		goto exit;
647cf4397da3324 Tomeu Vizoso 2024-06-12  699  	}
647cf4397da3324 Tomeu Vizoso 2024-06-12  700  
647cf4397da3324 Tomeu Vizoso 2024-06-12  701  	for (i = 0; i < args->job_count; i++)
647cf4397da3324 Tomeu Vizoso 2024-06-12  702  		rocket_ioctl_submit_job(dev, file, &jobs[i]);
647cf4397da3324 Tomeu Vizoso 2024-06-12  703  
647cf4397da3324 Tomeu Vizoso 2024-06-12  704  exit:
647cf4397da3324 Tomeu Vizoso 2024-06-12 @705  	kfree(jobs);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
