Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F891F936
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 00:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754958765; cv=none; b=LrAMttF48rIXnRETKKKa1x263sqlNGWh3d6aTTM8HQbWOLI2bfSz85Nz5NdWMznHs0jEZoq5M5/uvKFfSBOKvSzgbsY61M1tE29OLZWMmbApjrxGDRjW/LGdPN80Ct68nPjkQuSYqHlXDVOUva+YcXVRpIk60AKxVFEQoGEQHE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754958765; c=relaxed/simple;
	bh=ITitRD3EizTZaiU8Xlxecwq2461712F2oBBux8gMx84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qS5Vp4dXq/Dvyu1p0VhjOkZPKj33KGM6+ZrqbafElRLcz8E1OkPohk4HiVvycnwSRgnhp7AltrzmwC+4gixm+SREkIvECmkwHfJoMVV1BkDkVKi9zSPlyjwbRk7OL/SOhBRAkIReIrw9o8wSRay1E9lQrbCgqRhJRY0HIZ3nBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMhT658s; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMhT658s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754958763; x=1786494763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITitRD3EizTZaiU8Xlxecwq2461712F2oBBux8gMx84=;
  b=cMhT658sikAXXbPKGAjN6cPlJglSj52ypv3XTQIKak4qdQ0eiZvnIYKz
   PqW0E6xDRM3CgZk2vkAyL3jfUwxb7OgI/nD5hkTR8oeb/xLGQWnBpcas0
   T1AZMip7Bgcltz24f16lDrudo37KjG47zKtvHBMWjQfZhEJLijgA/YF5I
   toG6Dbr64Pc9mkh9ib+65aI78iGOs4HMOFe/PGKcflnZXonc2/kx/0aBU
   qKa7CTOAPvMXGCSWLsM66EjyccyJBPU2yQciJ75CqS0O99tHWnm6XFoR2
   Calr3XNZLiw9Qs4fc/lSGaCl2UOXUoOpr4w4JdnMYMhagX5JEZDgKiU3M
   w==;
X-CSE-ConnectionGUID: p8zEXUjTQBi8m4l1o3JOAQ==
X-CSE-MsgGUID: 4atJo7YeQM6maOc0CsNzsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56250084"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56250084"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 17:32:43 -0700
X-CSE-ConnectionGUID: Y9vW9fgzQDu3wkVJ9cMMpw==
X-CSE-MsgGUID: OE3J34/XRpO7L9VCr40iNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166347488"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2025 17:32:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulcwQ-0006Jo-2y;
	Tue, 12 Aug 2025 00:32:38 +0000
Date: Tue, 12 Aug 2025 08:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 1/2] accel/rocket: Fix Rockchip NPU compilation
Message-ID: <202508120730.PLbjlKbI-lkp@intel.com>
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
In-Reply-To: <20250802-fix-rockchip-npu-build-v1-1-fb0f0dacb3fe@brighamcampbell.com>
References: <20250802-fix-rockchip-npu-build-v1-1-fb0f0dacb3fe@brighamcampbell.com>
TO: Brigham Campbell <me@brighamcampbell.com>
TO: Tomeu Vizoso <tomeu@tomeuvizoso.net>
TO: Oded Gabbay <ogabbay@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linux-kernel-mentees@lists.linux.dev
CC: skhan@linuxfoundation.org
CC: Brigham Campbell <me@brighamcampbell.com>

Hi Brigham,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 01ac6e4e53b6351df42c97d217b0d2dbeef5c917]

url:    https://github.com/intel-lab-lkp/linux/commits/Brigham-Campbell/accel-rocket-Fix-Rockchip-NPU-compilation/20250803-032708
base:   01ac6e4e53b6351df42c97d217b0d2dbeef5c917
patch link:    https://lore.kernel.org/r/20250802-fix-rockchip-npu-build-v1-1-fb0f0dacb3fe%40brighamcampbell.com
patch subject: [PATCH 1/2] accel/rocket: Fix Rockchip NPU compilation
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: mips-randconfig-r064-20250812 (https://download.01.org/0day-ci/archive/20250812/202508120730.PLbjlKbI-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508120730.PLbjlKbI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/rocket/rocket_job.c:633:11-12: WARNING kvmalloc is used to allocate this memory at line 612
--
>> drivers/accel/rocket/rocket_job.c:499:68-74: ERROR: application of sizeof to pointer

vim +633 drivers/accel/rocket/rocket_job.c

0810d5ad88a18f Tomeu Vizoso     2025-07-21  495  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  496  int rocket_job_open(struct rocket_file_priv *rocket_priv)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  497  {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  498  	struct rocket_device *rdev = rocket_priv->rdev;
0810d5ad88a18f Tomeu Vizoso     2025-07-21 @499  	struct drm_gpu_scheduler **scheds = kmalloc_array(rdev->num_cores, sizeof(scheds),
0810d5ad88a18f Tomeu Vizoso     2025-07-21  500  							  GFP_KERNEL);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  501  	unsigned int core;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  502  	int ret;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  503  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  504  	for (core = 0; core < rdev->num_cores; core++)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  505  		scheds[core] = &rdev->cores[core].sched;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  506  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  507  	ret = drm_sched_entity_init(&rocket_priv->sched_entity,
0810d5ad88a18f Tomeu Vizoso     2025-07-21  508  				    DRM_SCHED_PRIORITY_NORMAL,
0810d5ad88a18f Tomeu Vizoso     2025-07-21  509  				    scheds,
0810d5ad88a18f Tomeu Vizoso     2025-07-21  510  				    rdev->num_cores, NULL);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  511  	if (WARN_ON(ret))
0810d5ad88a18f Tomeu Vizoso     2025-07-21  512  		return ret;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  513  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  514  	return 0;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  515  }
0810d5ad88a18f Tomeu Vizoso     2025-07-21  516  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  517  void rocket_job_close(struct rocket_file_priv *rocket_priv)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  518  {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  519  	struct drm_sched_entity *entity = &rocket_priv->sched_entity;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  520  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  521  	kfree(entity->sched_list);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  522  	drm_sched_entity_destroy(entity);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  523  }
0810d5ad88a18f Tomeu Vizoso     2025-07-21  524  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  525  int rocket_job_is_idle(struct rocket_core *core)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  526  {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  527  	/* If there are any jobs in this HW queue, we're not idle */
0810d5ad88a18f Tomeu Vizoso     2025-07-21  528  	if (atomic_read(&core->sched.credit_count))
0810d5ad88a18f Tomeu Vizoso     2025-07-21  529  		return false;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  530  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  531  	return true;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  532  }
0810d5ad88a18f Tomeu Vizoso     2025-07-21  533  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  534  static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
0810d5ad88a18f Tomeu Vizoso     2025-07-21  535  				   struct drm_rocket_job *job)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  536  {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  537  	struct rocket_device *rdev = to_rocket_device(dev);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  538  	struct rocket_file_priv *file_priv = file->driver_priv;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  539  	struct rocket_job *rjob = NULL;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  540  	int ret = 0;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  541  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  542  	if (job->task_count == 0)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  543  		return -EINVAL;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  544  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  545  	rjob = kzalloc(sizeof(*rjob), GFP_KERNEL);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  546  	if (!rjob)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  547  		return -ENOMEM;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  548  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  549  	kref_init(&rjob->refcount);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  550  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  551  	rjob->rdev = rdev;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  552  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  553  	ret = drm_sched_job_init(&rjob->base,
0810d5ad88a18f Tomeu Vizoso     2025-07-21  554  				 &file_priv->sched_entity,
adb24c14e8329d Brigham Campbell 2025-08-02  555  				 1, NULL, file->client_id);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  556  	if (ret)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  557  		goto out_put_job;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  558  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  559  	ret = rocket_copy_tasks(dev, file, job, rjob);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  560  	if (ret)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  561  		goto out_cleanup_job;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  562  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  563  	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
0810d5ad88a18f Tomeu Vizoso     2025-07-21  564  				     job->in_bo_handle_count, &rjob->in_bos);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  565  	if (ret)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  566  		goto out_cleanup_job;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  567  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  568  	rjob->in_bo_count = job->in_bo_handle_count;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  569  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  570  	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
0810d5ad88a18f Tomeu Vizoso     2025-07-21  571  				     job->out_bo_handle_count, &rjob->out_bos);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  572  	if (ret)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  573  		goto out_cleanup_job;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  574  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  575  	rjob->out_bo_count = job->out_bo_handle_count;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  576  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  577  	rjob->domain = rocket_iommu_domain_get(file_priv);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  578  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  579  	ret = rocket_job_push(rjob);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  580  	if (ret)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  581  		goto out_cleanup_job;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  582  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  583  out_cleanup_job:
0810d5ad88a18f Tomeu Vizoso     2025-07-21  584  	if (ret)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  585  		drm_sched_job_cleanup(&rjob->base);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  586  out_put_job:
0810d5ad88a18f Tomeu Vizoso     2025-07-21  587  	rocket_job_put(rjob);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  588  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  589  	return ret;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  590  }
0810d5ad88a18f Tomeu Vizoso     2025-07-21  591  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  592  int rocket_ioctl_submit(struct drm_device *dev, void *data, struct drm_file *file)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  593  {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  594  	struct drm_rocket_submit *args = data;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  595  	struct drm_rocket_job *jobs;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  596  	int ret = 0;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  597  	unsigned int i = 0;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  598  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  599  	if (args->job_count == 0)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  600  		return 0;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  601  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  602  	if (args->job_struct_size < sizeof(struct drm_rocket_job)) {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  603  		drm_dbg(dev, "job_struct_size field in drm_rocket_submit struct is too small.\n");
0810d5ad88a18f Tomeu Vizoso     2025-07-21  604  		return -EINVAL;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  605  	}
0810d5ad88a18f Tomeu Vizoso     2025-07-21  606  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  607  	if (args->reserved != 0) {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  608  		drm_dbg(dev, "Reserved field in drm_rocket_submit struct should be 0.\n");
0810d5ad88a18f Tomeu Vizoso     2025-07-21  609  		return -EINVAL;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  610  	}
0810d5ad88a18f Tomeu Vizoso     2025-07-21  611  
0810d5ad88a18f Tomeu Vizoso     2025-07-21 @612  	jobs = kvmalloc_array(args->job_count, sizeof(*jobs), GFP_KERNEL);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  613  	if (!jobs) {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  614  		drm_dbg(dev, "Failed to allocate incoming job array\n");
0810d5ad88a18f Tomeu Vizoso     2025-07-21  615  		return -ENOMEM;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  616  	}
0810d5ad88a18f Tomeu Vizoso     2025-07-21  617  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  618  	for (i = 0; i < args->job_count; i++) {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  619  		if (copy_from_user(&jobs[i],
0810d5ad88a18f Tomeu Vizoso     2025-07-21  620  				   u64_to_user_ptr(args->jobs) + i * args->job_struct_size,
0810d5ad88a18f Tomeu Vizoso     2025-07-21  621  				   sizeof(*jobs))) {
0810d5ad88a18f Tomeu Vizoso     2025-07-21  622  			ret = -EFAULT;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  623  			drm_dbg(dev, "Failed to copy incoming job array\n");
0810d5ad88a18f Tomeu Vizoso     2025-07-21  624  			goto exit;
0810d5ad88a18f Tomeu Vizoso     2025-07-21  625  		}
0810d5ad88a18f Tomeu Vizoso     2025-07-21  626  	}
0810d5ad88a18f Tomeu Vizoso     2025-07-21  627  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  628  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  629  	for (i = 0; i < args->job_count; i++)
0810d5ad88a18f Tomeu Vizoso     2025-07-21  630  		rocket_ioctl_submit_job(dev, file, &jobs[i]);
0810d5ad88a18f Tomeu Vizoso     2025-07-21  631  
0810d5ad88a18f Tomeu Vizoso     2025-07-21  632  exit:
0810d5ad88a18f Tomeu Vizoso     2025-07-21 @633  	kfree(jobs);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
