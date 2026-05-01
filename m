Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FBD3F7AB2
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777652035; cv=none; b=nNnefZJr/hDB6hUMrm0f0TyOWBmR2VHFx1jzxhIp7vV06clbi8BqvBbyF/vV4cCEfEGK+ruoUWVgDZYjYu/nJuNfKCMr9MG6odK1CeNMK8uHz7JMpI83m9Q7fdNluxKi7Gc3XKbEVN0JQHSokDcGMcenLq3lSFdrHjFxKm5foUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777652035; c=relaxed/simple;
	bh=iTjGPlCqrUbyWAhCfOsvbk1n3nSGxsBXvprEwNht640=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZokOGZjL6zGOmjM1zWGmEshYx8yuMJwhGWl4f6xsIC5RlLSwkI3+CU4TpzeS6sgNbqH5TrQSYzcXcXMCAAp9PRhc507bnPgZ4VvF/7jhXoULLH9f2zacaA5e+girqQIuG9QcDcEk8Riw9czvxSUHigihFkxWSeI30xmdiN73hRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FF7pgIEF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FF7pgIEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777652028; x=1809188028;
  h=date:from:to:cc:subject:message-id;
  bh=iTjGPlCqrUbyWAhCfOsvbk1n3nSGxsBXvprEwNht640=;
  b=FF7pgIEFXUOxp17v1Uv9byEZnMnDumr9PMCDq9aVdgAkqHo924rYf44S
   tdn0xUUeaEVg7b8e+LP1rZ7pJIsmfSDzF3s1AnQHpimlFXWMELqNda8p6
   GCOd5NJorng8xHSdaZqwID634roYsa068242gSWP1ezijROMJJ5Dxrd/F
   rE9H2SoO+ReH/uQsYt5AoUMkyvfogBEesMBBwszmkGi74ypOCBIDmYn9s
   XcS7GOTOkCc6cZ1CR0w58KdolDHtxDeU8PD1cBCDhTV6gaVwhtyjw5y08
   UWgcnyyFTESoQckQfSWbQqdgsBAqv1t7BhWofyxhZ1XJ9W3K1lE0crTer
   Q==;
X-CSE-ConnectionGUID: 1k2pQYzHQ+Ww1NID86KrFQ==
X-CSE-MsgGUID: PYiPEiGESO+9ox3Bmp/hdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78810837"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78810837"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 09:13:41 -0700
X-CSE-ConnectionGUID: fWXX/NMUSTSlhancs87JxQ==
X-CSE-MsgGUID: 6jS8/v6LTT2UNgTww0j7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="239222444"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 May 2026 09:13:40 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIqUj-000000000gn-1M04;
	Fri, 01 May 2026 16:13:37 +0000
Date: Sat, 02 May 2026 00:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 90/90]
 drivers/gpu/drm/msm/msm_gem_submit.c:895 msm_ioctl_gem_submit() warn:
 sleeping in atomic context
Message-ID: <202605020011.Q2qdoNAu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   90993a7a9684f014a3d9f2b1b0deb516badc3ecc
commit: 3398e8b2833f3fdf526c3a4fdd149924704b4c40 [90/90] drm/msm: Switch idr_lock to spinlock
:::::: branch date: 13 hours ago
:::::: commit date: 2 years, 9 months ago
config: arm64-randconfig-r073-20260426 (https://download.01.org/0day-ci/archive/20260502/202605020011.Q2qdoNAu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605020011.Q2qdoNAu-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/msm/msm_gem_submit.c:895 msm_ioctl_gem_submit() warn: sleeping in atomic context

Old smatch warnings:
drivers/gpu/drm/msm/msm_gem_submit.c:908 msm_ioctl_gem_submit() warn: sleeping in atomic context

vim +895 drivers/gpu/drm/msm/msm_gem_submit.c

ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  705  
7198e6b03155f6 Rob Clark         2013-07-19  706  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
7198e6b03155f6 Rob Clark         2013-07-19  707  		struct drm_file *file)
7198e6b03155f6 Rob Clark         2013-07-19  708  {
7198e6b03155f6 Rob Clark         2013-07-19  709  	struct msm_drm_private *priv = dev->dev_private;
7198e6b03155f6 Rob Clark         2013-07-19  710  	struct drm_msm_gem_submit *args = data;
7198e6b03155f6 Rob Clark         2013-07-19  711  	struct msm_file_private *ctx = file->driver_priv;
c498e5d39294d3 Rob Clark         2023-05-09  712  	struct msm_gem_submit *submit = NULL;
c01a958eca6e7f Rob Clark         2016-02-03  713  	struct msm_gpu *gpu = priv->gpu;
f7de15450e906e Jordan Crouse     2017-10-20  714  	struct msm_gpu_submitqueue *queue;
f97decac5f4c2d Jordan Crouse     2017-10-20  715  	struct msm_ringbuffer *ring;
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  716  	struct msm_submit_post_dep *post_deps = NULL;
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  717  	struct drm_syncobj **syncobjs_to_reset = NULL;
4cd0945901a6dd Rob Clark         2016-06-16  718  	int out_fence_fd = -1;
92ec0767710797 Daniel Vetter     2019-11-20  719  	bool has_ww_ticket = false;
7198e6b03155f6 Rob Clark         2013-07-19  720  	unsigned i;
fc1dd04c3841c4 Rob Clark         2022-08-02  721  	int ret;
375f9a63a66bae Rob Clark         2021-07-27  722  
c01a958eca6e7f Rob Clark         2016-02-03  723  	if (!gpu)
c01a958eca6e7f Rob Clark         2016-02-03  724  		return -ENXIO;
c01a958eca6e7f Rob Clark         2016-02-03  725  
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  726  	if (args->pad)
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  727  		return -EINVAL;
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  728  
4a257ca694015f Rob Clark         2022-05-02  729  	if (unlikely(!ctx->aspace) && !capable(CAP_SYS_RAWIO)) {
4a257ca694015f Rob Clark         2022-05-02  730  		DRM_ERROR_RATELIMITED("IOMMU support or CAP_SYS_RAWIO required!\n");
4a257ca694015f Rob Clark         2022-05-02  731  		return -EPERM;
4a257ca694015f Rob Clark         2022-05-02  732  	}
4a257ca694015f Rob Clark         2022-05-02  733  
7198e6b03155f6 Rob Clark         2013-07-19  734  	/* for now, we just have 3d pipe.. eventually this would need to
7198e6b03155f6 Rob Clark         2013-07-19  735  	 * be more clever to dispatch to appropriate gpu module:
7198e6b03155f6 Rob Clark         2013-07-19  736  	 */
d9c181e22a0599 Rob Clark         2016-04-23  737  	if (MSM_PIPE_ID(args->flags) != MSM_PIPE_3D0)
d9c181e22a0599 Rob Clark         2016-04-23  738  		return -EINVAL;
d9c181e22a0599 Rob Clark         2016-04-23  739  
d9c181e22a0599 Rob Clark         2016-04-23  740  	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_FLAGS)
7198e6b03155f6 Rob Clark         2013-07-19  741  		return -EINVAL;
7198e6b03155f6 Rob Clark         2013-07-19  742  
6a8bd08d0465b2 Rob Clark         2017-12-13  743  	if (args->flags & MSM_SUBMIT_SUDO) {
6a8bd08d0465b2 Rob Clark         2017-12-13  744  		if (!IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) ||
6a8bd08d0465b2 Rob Clark         2017-12-13  745  		    !capable(CAP_SYS_RAWIO))
6a8bd08d0465b2 Rob Clark         2017-12-13  746  			return -EINVAL;
6a8bd08d0465b2 Rob Clark         2017-12-13  747  	}
6a8bd08d0465b2 Rob Clark         2017-12-13  748  
f7de15450e906e Jordan Crouse     2017-10-20  749  	queue = msm_submitqueue_get(ctx, args->queueid);
f7de15450e906e Jordan Crouse     2017-10-20  750  	if (!queue)
f7de15450e906e Jordan Crouse     2017-10-20  751  		return -ENOENT;
f7de15450e906e Jordan Crouse     2017-10-20  752  
fc40e5e10c3bcc Rob Clark         2021-07-27  753  	ring = gpu->rb[queue->ring_nr];
f97decac5f4c2d Jordan Crouse     2017-10-20  754  
1d8a5ca436ee4a Rob Clark         2021-07-27  755  	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
1d8a5ca436ee4a Rob Clark         2021-07-27  756  		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
1d8a5ca436ee4a Rob Clark         2021-07-27  757  		if (out_fence_fd < 0) {
1d8a5ca436ee4a Rob Clark         2021-07-27  758  			ret = out_fence_fd;
c498e5d39294d3 Rob Clark         2023-05-09  759  			goto out_post_unlock;
1d8a5ca436ee4a Rob Clark         2021-07-27  760  		}
1d8a5ca436ee4a Rob Clark         2021-07-27  761  	}
1d8a5ca436ee4a Rob Clark         2021-07-27  762  
f0de40a131d9bd Rob Clark         2022-08-02  763  	submit = submit_create(dev, gpu, queue, args->nr_bos, args->nr_cmds);
c498e5d39294d3 Rob Clark         2023-05-09  764  	if (IS_ERR(submit)) {
c498e5d39294d3 Rob Clark         2023-05-09  765  		ret = PTR_ERR(submit);
c498e5d39294d3 Rob Clark         2023-05-09  766  		goto out_post_unlock;
c498e5d39294d3 Rob Clark         2023-05-09  767  	}
f0de40a131d9bd Rob Clark         2022-08-02  768  
fc1dd04c3841c4 Rob Clark         2022-08-02  769  	trace_msm_gpu_submit(pid_nr(submit->pid), ring->id, submit->ident,
fc1dd04c3841c4 Rob Clark         2022-08-02  770  		args->nr_bos, args->nr_cmds);
fc1dd04c3841c4 Rob Clark         2022-08-02  771  
f0de40a131d9bd Rob Clark         2022-08-02  772  	ret = mutex_lock_interruptible(&queue->lock);
f0de40a131d9bd Rob Clark         2022-08-02  773  	if (ret)
f0de40a131d9bd Rob Clark         2022-08-02  774  		goto out_post_unlock;
1d8a5ca436ee4a Rob Clark         2021-07-27  775  
1d8a5ca436ee4a Rob Clark         2021-07-27  776  	if (args->flags & MSM_SUBMIT_SUDO)
1d8a5ca436ee4a Rob Clark         2021-07-27  777  		submit->in_rb = true;
1d8a5ca436ee4a Rob Clark         2021-07-27  778  
48f243c95bdb17 Rob Clark         2017-02-25  779  	if (args->flags & MSM_SUBMIT_FENCE_FD_IN) {
2189463dba3eac Robert Foss       2018-11-05  780  		struct dma_fence *in_fence;
2189463dba3eac Robert Foss       2018-11-05  781  
48f243c95bdb17 Rob Clark         2017-02-25  782  		in_fence = sync_file_get_fence(args->fence_fd);
48f243c95bdb17 Rob Clark         2017-02-25  783  
1d8a5ca436ee4a Rob Clark         2021-07-27  784  		if (!in_fence) {
1d8a5ca436ee4a Rob Clark         2021-07-27  785  			ret = -EINVAL;
1d8a5ca436ee4a Rob Clark         2021-07-27  786  			goto out_unlock;
1d8a5ca436ee4a Rob Clark         2021-07-27  787  		}
2189463dba3eac Robert Foss       2018-11-05  788  
80bcfbd3766881 Daniel Vetter     2021-08-05  789  		ret = drm_sched_job_add_dependency(&submit->base, in_fence);
48f243c95bdb17 Rob Clark         2017-02-25  790  		if (ret)
1d8a5ca436ee4a Rob Clark         2021-07-27  791  			goto out_unlock;
48f243c95bdb17 Rob Clark         2017-02-25  792  	}
48f243c95bdb17 Rob Clark         2017-02-25  793  
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  794  	if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
1d8a5ca436ee4a Rob Clark         2021-07-27  795  		syncobjs_to_reset = msm_parse_deps(submit, file,
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  796  		                                   args->in_syncobjs,
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  797  		                                   args->nr_in_syncobjs,
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  798  		                                   args->syncobj_stride, ring);
1d8a5ca436ee4a Rob Clark         2021-07-27  799  		if (IS_ERR(syncobjs_to_reset)) {
1d8a5ca436ee4a Rob Clark         2021-07-27  800  			ret = PTR_ERR(syncobjs_to_reset);
1d8a5ca436ee4a Rob Clark         2021-07-27  801  			goto out_unlock;
1d8a5ca436ee4a Rob Clark         2021-07-27  802  		}
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  803  	}
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  804  
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  805  	if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  806  		post_deps = msm_parse_post_deps(dev, file,
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  807  		                                args->out_syncobjs,
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  808  		                                args->nr_out_syncobjs,
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  809  		                                args->syncobj_stride);
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  810  		if (IS_ERR(post_deps)) {
ab723b7a992a19 Bas Nieuwenhuizen 2020-01-24  811  			ret = PTR_ERR(post_deps);
4cd0945901a6dd Rob Clark         2016-06-16  812  			goto out_unlock;
4cd0945901a6dd Rob Clark         2016-06-16  813  		}
4cd0945901a6dd Rob Clark         2016-06-16  814  	}
4cd0945901a6dd Rob Clark         2016-06-16  815  
7198e6b03155f6 Rob Clark         2013-07-19  816  	ret = submit_lookup_objects(submit, args, file);
7198e6b03155f6 Rob Clark         2013-07-19  817  	if (ret)
1d8a5ca436ee4a Rob Clark         2021-07-27  818  		goto out;
7198e6b03155f6 Rob Clark         2013-07-19  819  
20224d715a8822 Rob Clark         2020-10-23  820  	ret = submit_lookup_cmds(submit, args, file);
20224d715a8822 Rob Clark         2020-10-23  821  	if (ret)
1d8a5ca436ee4a Rob Clark         2021-07-27  822  		goto out;
20224d715a8822 Rob Clark         2020-10-23  823  
92ec0767710797 Daniel Vetter     2019-11-20  824  	/* copy_*_user while holding a ww ticket upsets lockdep */
92ec0767710797 Daniel Vetter     2019-11-20  825  	ww_acquire_init(&submit->ticket, &reservation_ww_class);
92ec0767710797 Daniel Vetter     2019-11-20  826  	has_ww_ticket = true;
340faef2418989 Rob Clark         2016-03-14  827  	ret = submit_lock_objects(submit);
340faef2418989 Rob Clark         2016-03-14  828  	if (ret)
340faef2418989 Rob Clark         2016-03-14  829  		goto out;
340faef2418989 Rob Clark         2016-03-14  830  
ad5149c4f65f7c Rob Clark         2017-09-12  831  	ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
b6295f9a38fc3f Rob Clark         2016-03-15  832  	if (ret)
b6295f9a38fc3f Rob Clark         2016-03-15  833  		goto out;
b6295f9a38fc3f Rob Clark         2016-03-15  834  
340faef2418989 Rob Clark         2016-03-14  835  	ret = submit_pin_objects(submit);
7198e6b03155f6 Rob Clark         2013-07-19  836  	if (ret)
7198e6b03155f6 Rob Clark         2013-07-19  837  		goto out;
7198e6b03155f6 Rob Clark         2013-07-19  838  
7198e6b03155f6 Rob Clark         2013-07-19  839  	for (i = 0; i < args->nr_cmds; i++) {
7198e6b03155f6 Rob Clark         2013-07-19  840  		struct msm_gem_object *msm_obj;
78babc1633c4b0 Rob Clark         2016-11-11  841  		uint64_t iova;
7198e6b03155f6 Rob Clark         2013-07-19  842  
20224d715a8822 Rob Clark         2020-10-23  843  		ret = submit_bo(submit, submit->cmd[i].idx,
7198e6b03155f6 Rob Clark         2013-07-19  844  				&msm_obj, &iova, NULL);
7198e6b03155f6 Rob Clark         2013-07-19  845  		if (ret)
7198e6b03155f6 Rob Clark         2013-07-19  846  			goto out;
7198e6b03155f6 Rob Clark         2013-07-19  847  
20224d715a8822 Rob Clark         2020-10-23  848  		if (!submit->cmd[i].size ||
20224d715a8822 Rob Clark         2020-10-23  849  			((submit->cmd[i].size + submit->cmd[i].offset) >
20224d715a8822 Rob Clark         2020-10-23  850  				msm_obj->base.size / 4)) {
20224d715a8822 Rob Clark         2020-10-23  851  			DRM_ERROR("invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
7198e6b03155f6 Rob Clark         2013-07-19  852  			ret = -EINVAL;
7198e6b03155f6 Rob Clark         2013-07-19  853  			goto out;
7198e6b03155f6 Rob Clark         2013-07-19  854  		}
7198e6b03155f6 Rob Clark         2013-07-19  855  
20224d715a8822 Rob Clark         2020-10-23  856  		submit->cmd[i].iova = iova + (submit->cmd[i].offset * 4);
7198e6b03155f6 Rob Clark         2013-07-19  857  
7198e6b03155f6 Rob Clark         2013-07-19  858  		if (submit->valid)
7198e6b03155f6 Rob Clark         2013-07-19  859  			continue;
7198e6b03155f6 Rob Clark         2013-07-19  860  
20224d715a8822 Rob Clark         2020-10-23  861  		ret = submit_reloc(submit, msm_obj, submit->cmd[i].offset * 4,
20224d715a8822 Rob Clark         2020-10-23  862  				submit->cmd[i].nr_relocs, submit->cmd[i].relocs);
7198e6b03155f6 Rob Clark         2013-07-19  863  		if (ret)
7198e6b03155f6 Rob Clark         2013-07-19  864  			goto out;
7198e6b03155f6 Rob Clark         2013-07-19  865  	}
7198e6b03155f6 Rob Clark         2013-07-19  866  
7198e6b03155f6 Rob Clark         2013-07-19  867  	submit->nr_cmds = i;
7198e6b03155f6 Rob Clark         2013-07-19  868  
3398e8b2833f3f Rob Clark         2023-03-20  869  	spin_lock(&queue->idr_lock);
05ba44b3704e21 Rob Clark         2022-08-02  870  
17154addc5c1a1 Rob Clark         2022-02-24  871  	/*
17154addc5c1a1 Rob Clark         2022-02-24  872  	 * If using userspace provided seqno fence, validate that the id
17154addc5c1a1 Rob Clark         2022-02-24  873  	 * is available before arming sched job.  Since access to fence_idr
17154addc5c1a1 Rob Clark         2022-02-24  874  	 * is serialized on the queue lock, the slot should be still avail
17154addc5c1a1 Rob Clark         2022-02-24  875  	 * after the job is armed
17154addc5c1a1 Rob Clark         2022-02-24  876  	 */
17154addc5c1a1 Rob Clark         2022-02-24  877  	if ((args->flags & MSM_SUBMIT_FENCE_SN_IN) &&
17154addc5c1a1 Rob Clark         2022-02-24  878  			idr_find(&queue->fence_idr, args->fence)) {
3398e8b2833f3f Rob Clark         2023-03-20  879  		spin_unlock(&queue->idr_lock);
17154addc5c1a1 Rob Clark         2022-02-24  880  		ret = -EINVAL;
17154addc5c1a1 Rob Clark         2022-02-24  881  		goto out;
17154addc5c1a1 Rob Clark         2022-02-24  882  	}
17154addc5c1a1 Rob Clark         2022-02-24  883  
357285a2d1c06f Daniel Vetter     2021-08-26  884  	drm_sched_job_arm(&submit->base);
357285a2d1c06f Daniel Vetter     2021-08-26  885  
1d8a5ca436ee4a Rob Clark         2021-07-27  886  	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
f44d32c79fd591 Rob Clark         2016-06-16  887  
17154addc5c1a1 Rob Clark         2022-02-24  888  	if (args->flags & MSM_SUBMIT_FENCE_SN_IN) {
a61acbbe9cf873 Rob Clark         2021-07-27  889  		/*
17154addc5c1a1 Rob Clark         2022-02-24  890  		 * Userspace has assigned the seqno fence that it wants
17154addc5c1a1 Rob Clark         2022-02-24  891  		 * us to use.  It is an error to pick a fence sequence
17154addc5c1a1 Rob Clark         2022-02-24  892  		 * number that is not available.
17154addc5c1a1 Rob Clark         2022-02-24  893  		 */
17154addc5c1a1 Rob Clark         2022-02-24  894  		submit->fence_id = args->fence;
17154addc5c1a1 Rob Clark         2022-02-24 @895  		ret = idr_alloc_u32(&queue->fence_idr, submit->user_fence,

:::::: The code at line 895 was first introduced by commit
:::::: 17154addc5c1a175bcf3441ff0d9598efa1f05cd drm/msm: Add MSM_SUBMIT_FENCE_SN_IN

:::::: TO: Rob Clark <robdclark@chromium.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
