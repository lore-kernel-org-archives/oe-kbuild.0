Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95CE7263D
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 20:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746650236; cv=none; b=XnrF3zB/YilBGEhJEyxxG55VAu9abp2bKn4yMWPbknuvGnWqJx54NRi6iOeeQtlnM0tEeODw61zZj3x7jqCOAgAGEzauaD8pE12rzLXW91ap0cFnuKcCgyb6erkYo0QHlqGJxRqqsU2seRYrKzXRcweGjaVZN1O4ZJPhtDPX3m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746650236; c=relaxed/simple;
	bh=uEwhDVbTAIglv0j5GI/CJdijyU088H5/6kEC6LvVXNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tlLOMr6LZAymSi4OOxeW9nu6QmnYbH90kjf27YBXEQcUzXtEgNKHiKEqF9Wi6CMKVBKaaxiMpl/iLWhMeuN0F7d0MtJyBU2a9nqMCSrdheqn2Y7SHOt05MeiasOhqExTaF7KhmZqrK/CkKbddlq44cnyCkulxATzpXffiRUT/Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiHQr0Zv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiHQr0Zv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746650234; x=1778186234;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uEwhDVbTAIglv0j5GI/CJdijyU088H5/6kEC6LvVXNk=;
  b=eiHQr0ZvefkNQMrQI2wQ2mez+tDGjNhYsI+qr7Hq2yiEkNhg6S/6HyAr
   8w09W1C9DN1Cf7RpWMVYe9LBgv1SLs3EezD9LUFAX1N2oDEAx3hLoY1se
   En1dUQYT7eMxzJn0RZc4NJc5duWS6bwxevPA2+uGLkbiln6OtVFAbJfbs
   f5w/gRmyk2NK47CMiURS4sXfTRxAAk6pkH93qfZCF8Jlz4RiGzIbluGAU
   A7Tr+Ez8VnwrqSyZu3qrhtAP1EtrSzh5ZOgSlZa0JISjMh830UIsSMYR0
   kNnvZD5X/Hq3f+XrxgZkJpy0dlLjPGpR+0N7/zxS1/XQtH3chqktEy45v
   A==;
X-CSE-ConnectionGUID: WaDqCgPXRbCcGziOA99hdg==
X-CSE-MsgGUID: P1CMF2nLQZCFI0DQyvic0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59396637"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="59396637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 13:37:13 -0700
X-CSE-ConnectionGUID: JcTe7rUyQhOkBLo9Uf/ywQ==
X-CSE-MsgGUID: mc1gENXMSqGbMrappIKiwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="141038427"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2025 13:37:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uClVs-00091x-2z;
	Wed, 07 May 2025 20:37:08 +0000
Date: Thu, 8 May 2025 04:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6980/9308]
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:856
 amdgpu_userq_wait_ioctl() warn: missing error code 'r'
Message-ID: <202505080458.rnV8YfiY-lkp@intel.com>
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
TO: Arvind Yadav <Arvind.Yadav@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Sunil Khatri <sunil.khatri@amd.com>
CC: "Christian König" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 56801cb83c8c95ae23ea576570c75a01c1f07774 [6980/9308] drm/amdgpu: remove DRM_AMDGPU_NAVI3X_USERQ config for UQ
:::::: branch date: 13 hours ago
:::::: commit date: 7 days ago
config: loongarch-randconfig-r071-20250502 (https://download.01.org/0day-ci/archive/20250508/202505080458.rnV8YfiY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505080458.rnV8YfiY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:856 amdgpu_userq_wait_ioctl() warn: missing error code 'r'

vim +/r +856 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  594  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  595  int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  596  			    struct drm_file *filp)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  597  {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  598  	u32 *syncobj_handles, *timeline_points, *timeline_handles, *bo_handles_read, *bo_handles_write;
2761bb9a31f1b8 Arunpravin Paneer Selvam 2024-11-11  599  	u32 num_syncobj, num_read_bo_handles, num_write_bo_handles;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  600  	struct drm_amdgpu_userq_fence_info *fence_info = NULL;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  601  	struct drm_amdgpu_userq_wait *wait_info = data;
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  602  	struct amdgpu_fpriv *fpriv = filp->driver_priv;
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  603  	struct amdgpu_userq_mgr *userq_mgr = &fpriv->userq_mgr;
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  604  	struct amdgpu_usermode_queue *waitq;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  605  	struct drm_gem_object **gobj_write;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  606  	struct drm_gem_object **gobj_read;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  607  	struct dma_fence **fences = NULL;
2761bb9a31f1b8 Arunpravin Paneer Selvam 2024-11-11  608  	u16 num_points, num_fences = 0;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  609  	int r, i, rentry, wentry, cnt;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  610  	struct drm_exec exec;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  611  
2761bb9a31f1b8 Arunpravin Paneer Selvam 2024-11-11  612  	num_read_bo_handles = wait_info->num_bo_read_handles;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  613  	bo_handles_read = memdup_user(u64_to_user_ptr(wait_info->bo_read_handles),
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  614  				      sizeof(u32) * num_read_bo_handles);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  615  	if (IS_ERR(bo_handles_read))
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  616  		return PTR_ERR(bo_handles_read);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  617  
2761bb9a31f1b8 Arunpravin Paneer Selvam 2024-11-11  618  	num_write_bo_handles = wait_info->num_bo_write_handles;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  619  	bo_handles_write = memdup_user(u64_to_user_ptr(wait_info->bo_write_handles),
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  620  				       sizeof(u32) * num_write_bo_handles);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  621  	if (IS_ERR(bo_handles_write)) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  622  		r = PTR_ERR(bo_handles_write);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  623  		goto free_bo_handles_read;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  624  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  625  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  626  	num_syncobj = wait_info->num_syncobj_handles;
2761bb9a31f1b8 Arunpravin Paneer Selvam 2024-11-11  627  	syncobj_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_handles),
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  628  				      sizeof(u32) * num_syncobj);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  629  	if (IS_ERR(syncobj_handles)) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  630  		r = PTR_ERR(syncobj_handles);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  631  		goto free_bo_handles_write;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  632  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  633  
2761bb9a31f1b8 Arunpravin Paneer Selvam 2024-11-11  634  	num_points = wait_info->num_syncobj_timeline_handles;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  635  	timeline_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_timeline_handles),
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  636  				       sizeof(u32) * num_points);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  637  	if (IS_ERR(timeline_handles)) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  638  		r = PTR_ERR(timeline_handles);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  639  		goto free_syncobj_handles;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  640  	}
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  641  
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  642  	timeline_points = memdup_user(u64_to_user_ptr(wait_info->syncobj_timeline_points),
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  643  				      sizeof(u32) * num_points);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  644  	if (IS_ERR(timeline_points)) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  645  		r = PTR_ERR(timeline_points);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  646  		goto free_timeline_handles;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  647  	}
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  648  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  649  	gobj_read = kmalloc_array(num_read_bo_handles, sizeof(*gobj_read), GFP_KERNEL);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  650  	if (!gobj_read) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  651  		r = -ENOMEM;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  652  		goto free_timeline_points;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  653  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  654  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  655  	for (rentry = 0; rentry < num_read_bo_handles; rentry++) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  656  		gobj_read[rentry] = drm_gem_object_lookup(filp, bo_handles_read[rentry]);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  657  		if (!gobj_read[rentry]) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  658  			r = -ENOENT;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  659  			goto put_gobj_read;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  660  		}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  661  	}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  662  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  663  	gobj_write = kmalloc_array(num_write_bo_handles, sizeof(*gobj_write), GFP_KERNEL);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  664  	if (!gobj_write) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  665  		r = -ENOMEM;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  666  		goto put_gobj_read;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  667  	}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  668  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  669  	for (wentry = 0; wentry < num_write_bo_handles; wentry++) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  670  		gobj_write[wentry] = drm_gem_object_lookup(filp, bo_handles_write[wentry]);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  671  		if (!gobj_write[wentry]) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  672  			r = -ENOENT;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  673  			goto put_gobj_write;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  674  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  675  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  676  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  677  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  678  		      (num_read_bo_handles + num_write_bo_handles));
e7cf21fbb2773c Arunpravin Paneer Selvam 2024-10-30  679  
e7cf21fbb2773c Arunpravin Paneer Selvam 2024-10-30  680  	/* Lock all BOs with retry handling */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  681  	drm_exec_until_all_locked(&exec) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  682  		r = drm_exec_prepare_array(&exec, gobj_read, num_read_bo_handles, 1);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  683  		drm_exec_retry_on_contention(&exec);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  684  		if (r) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  685  			drm_exec_fini(&exec);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  686  			goto put_gobj_write;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  687  		}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  688  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  689  		r = drm_exec_prepare_array(&exec, gobj_write, num_write_bo_handles, 1);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  690  		drm_exec_retry_on_contention(&exec);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  691  		if (r) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  692  			drm_exec_fini(&exec);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  693  			goto put_gobj_write;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  694  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  695  	}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  696  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  697  	if (!wait_info->num_fences) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  698  		if (num_points) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  699  			struct dma_fence_unwrap iter;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  700  			struct dma_fence *fence;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  701  			struct dma_fence *f;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  702  
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  703  			for (i = 0; i < num_points; i++) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  704  				r = drm_syncobj_find_fence(filp, timeline_handles[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  705  							   timeline_points[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  706  							   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  707  							   &fence);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  708  				if (r)
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  709  					goto exec_fini;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  710  
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  711  				dma_fence_unwrap_for_each(f, &iter, fence)
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  712  					num_fences++;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  713  
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  714  				dma_fence_put(fence);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  715  			}
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  716  		}
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  717  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  718  		/* Count syncobj's fence */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  719  		for (i = 0; i < num_syncobj; i++) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  720  			struct dma_fence *fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  721  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  722  			r = drm_syncobj_find_fence(filp, syncobj_handles[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  723  						   0,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  724  						   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  725  						   &fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  726  			if (r)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  727  				goto exec_fini;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  728  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  729  			num_fences++;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  730  			dma_fence_put(fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  731  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  732  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  733  		/* Count GEM objects fence */
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  734  		for (i = 0; i < num_read_bo_handles; i++) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  735  			struct dma_resv_iter resv_cursor;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  736  			struct dma_fence *fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  737  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  738  			dma_resv_for_each_fence(&resv_cursor, gobj_read[i]->resv,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  739  						DMA_RESV_USAGE_READ, fence)
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  740  				num_fences++;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  741  		}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  742  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  743  		for (i = 0; i < num_write_bo_handles; i++) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  744  			struct dma_resv_iter resv_cursor;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  745  			struct dma_fence *fence;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  746  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  747  			dma_resv_for_each_fence(&resv_cursor, gobj_write[i]->resv,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  748  						DMA_RESV_USAGE_WRITE, fence)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  749  				num_fences++;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  750  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  751  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  752  		/*
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  753  		 * Passing num_fences = 0 means that userspace doesn't want to
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  754  		 * retrieve userq_fence_info. If num_fences = 0 we skip filling
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  755  		 * userq_fence_info and return the actual number of fences on
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  756  		 * args->num_fences.
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  757  		 */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  758  		wait_info->num_fences = num_fences;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  759  	} else {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  760  		/* Array of fence info */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  761  		fence_info = kmalloc_array(wait_info->num_fences, sizeof(*fence_info), GFP_KERNEL);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  762  		if (!fence_info) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  763  			r = -ENOMEM;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  764  			goto exec_fini;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  765  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  766  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  767  		/* Array of fences */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  768  		fences = kmalloc_array(wait_info->num_fences, sizeof(*fences), GFP_KERNEL);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  769  		if (!fences) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  770  			r = -ENOMEM;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  771  			goto free_fence_info;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  772  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  773  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  774  		/* Retrieve GEM read objects fence */
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  775  		for (i = 0; i < num_read_bo_handles; i++) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  776  			struct dma_resv_iter resv_cursor;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  777  			struct dma_fence *fence;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  778  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  779  			dma_resv_for_each_fence(&resv_cursor, gobj_read[i]->resv,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  780  						DMA_RESV_USAGE_READ, fence) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  781  				if (WARN_ON_ONCE(num_fences >= wait_info->num_fences)) {
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  782  					r = -EINVAL;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  783  					goto free_fences;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  784  				}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  785  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  786  				fences[num_fences++] = fence;
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  787  				dma_fence_get(fence);
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  788  			}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  789  		}
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  790  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  791  		/* Retrieve GEM write objects fence */
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  792  		for (i = 0; i < num_write_bo_handles; i++) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  793  			struct dma_resv_iter resv_cursor;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  794  			struct dma_fence *fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  795  
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  796  			dma_resv_for_each_fence(&resv_cursor, gobj_write[i]->resv,
cb4a73f46f253b Arunpravin Paneer Selvam 2024-10-30  797  						DMA_RESV_USAGE_WRITE, fence) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  798  				if (WARN_ON_ONCE(num_fences >= wait_info->num_fences)) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  799  					r = -EINVAL;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  800  					goto free_fences;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  801  				}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  802  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  803  				fences[num_fences++] = fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  804  				dma_fence_get(fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  805  			}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  806  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  807  
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  808  		if (num_points) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  809  			struct dma_fence_unwrap iter;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  810  			struct dma_fence *fence;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  811  			struct dma_fence *f;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  812  
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  813  			for (i = 0; i < num_points; i++) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  814  				r = drm_syncobj_find_fence(filp, timeline_handles[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  815  							   timeline_points[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  816  							   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  817  							   &fence);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  818  				if (r)
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  819  					goto free_fences;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  820  
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  821  				dma_fence_unwrap_for_each(f, &iter, fence) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  822  					if (WARN_ON_ONCE(num_fences >= wait_info->num_fences)) {
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  823  						r = -EINVAL;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  824  						goto free_fences;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  825  					}
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  826  
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  827  					dma_fence_get(f);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  828  					fences[num_fences++] = f;
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  829  				}
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  830  
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  831  				dma_fence_put(fence);
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  832  			}
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  833  		}
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  834  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  835  		/* Retrieve syncobj's fence */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  836  		for (i = 0; i < num_syncobj; i++) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  837  			struct dma_fence *fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  838  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  839  			r = drm_syncobj_find_fence(filp, syncobj_handles[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  840  						   0,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  841  						   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  842  						   &fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  843  			if (r)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  844  				goto free_fences;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  845  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  846  			if (WARN_ON_ONCE(num_fences >= wait_info->num_fences)) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  847  				r = -EINVAL;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  848  				goto free_fences;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  849  			}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  850  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  851  			fences[num_fences++] = fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  852  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  853  
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  854  		waitq = idr_find(&userq_mgr->userq_idr, wait_info->waitq_id);
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  855  		if (!waitq)
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11 @856  			goto free_fences;

:::::: The code at line 856 was first introduced by commit
:::::: 4b27406380b0b9ada6b4893bc8f6766dd34fff36 drm/amdgpu: Add queue id support to the user queue wait IOCTL

:::::: TO: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
