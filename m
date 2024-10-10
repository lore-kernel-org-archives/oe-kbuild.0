Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45A206E8F
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Oct 2024 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728547501; cv=none; b=PH7IS6tUinN7DjVRmQzHvn8Ip5vIeFJ/a0KxPCMkPvqaLF7CcI8l2yvj+Sn91esYm6rIPOPY2RMOr4JwS0A7JgZ5zxsN4Xg0e/56zPwLIHP3JFIB+ucEyL4TTFBjMo226oP9ZRkVqDo+eYF3MAo507Zat92a8JEjSBbBO8d42yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728547501; c=relaxed/simple;
	bh=mnPXokasmsgfNUFud09oxxGXe8EMrwghnD7MTShuBTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2tBJ5KN5sJIU+cI6HlGRKUa7JasFz9ISl4qN7fEuqfI+ZP9rp3HRB3dDjovqlq0n0f5YTkbmjtcHOsxRI2ZAliBpTjN7v6yUf0y1T1mxz6rUFefDhsOuE/3RqPMfTJ7hkhqaqN6kCCZFN5QPAvOsVBQ0Y35MvNAlHNxKpwoCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ud7/Dgo9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ud7/Dgo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728547500; x=1760083500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnPXokasmsgfNUFud09oxxGXe8EMrwghnD7MTShuBTE=;
  b=Ud7/Dgo9RB0tE5niFlABVN9H3g1TYJeNUqcjE33GtByM649/cRevh75n
   3SwjII8zbAyckcmc580eFoeSU5F2YXBoZ8B72y0HvUT3G0hxOvFWgX60J
   6o/0Jj1xyae+dT253C3uI1sVKRJVeJGePlWKsnKGzc5fAG/UDLeFPuZVC
   PJ9lcnW1DASStAzx0aTjYNGA2bPHnow4sq6dJzj/l4CHImtBHEIH5fJqv
   VURBSbqP3od0HzhucL8U5oPdDaFOipQXTMdAh0VnsJziMuu3kMde6bipg
   y9XFtJLJroBWfyHe7//fd6G85AH/8C+62XkAYmeL56I4ZU1kheIswHukG
   A==;
X-CSE-ConnectionGUID: r0lFHNsGSOe0FIZcd3JjjA==
X-CSE-MsgGUID: suEOmfHLRwmFS4qRXb/d4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28005450"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="28005450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 01:04:58 -0700
X-CSE-ConnectionGUID: rq/CERqgRLafr2/fy7/1bg==
X-CSE-MsgGUID: C814pClnRGGTeFUptIYvYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76725885"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2024 01:04:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syoAH-000ANR-27;
	Thu, 10 Oct 2024 08:04:53 +0000
Date: Thu, 10 Oct 2024 16:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:mirror-chromeos-5.10-arcvm 4286/30000]
 drivers/gpu/drm/virtio/virtgpu_ioctl.c:776 virtio_gpu_context_init_ioctl()
 warn: inconsistent returns '&vfpriv->context_lock'.
Message-ID: <202410101617.JslGNk0O-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a008d597f5ebedde0d000d27364ddb38be189ae4
commit: 8815d47cf0d4cf662b4209e3a3edfe7bef0a4bca [4286/30000] CHROMIUM: drm/virtio: implement context init: support init ioctl
:::::: branch date: 25 hours ago
:::::: commit date: 3 years, 4 months ago
config: x86_64-randconfig-161-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101617.JslGNk0O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410101617.JslGNk0O-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/virtio/virtgpu_ioctl.c:776 virtio_gpu_context_init_ioctl() warn: inconsistent returns '&vfpriv->context_lock'.

Old smatch warnings:
drivers/gpu/drm/virtio/virtgpu_ioctl.c:578 virtio_gpu_get_caps_ioctl() warn: iterator used outside loop: 'cache_ent'

vim +776 drivers/gpu/drm/virtio/virtgpu_ioctl.c

d12c79f730cf11 Gerd Hoffmann      2020-09-23  713  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  714  static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  715  					 void *data, struct drm_file *file)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  716  {
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  717  	int ret = 0;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  718  	uint32_t num_params, i, param, value;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  719  	size_t len;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  720  	struct drm_virtgpu_context_set_param *ctx_set_params;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  721  	struct virtio_gpu_device *vgdev = dev->dev_private;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  722  	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  723  	struct drm_virtgpu_context_init *args = data;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  724  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  725  	num_params = args->num_params;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  726  	len = num_params * sizeof(struct drm_virtgpu_context_set_param);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  727  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  728  	if (!vgdev->has_context_init || !vgdev->has_virgl_3d)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  729  		return -EINVAL;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  730  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  731  	/* Number of unique parameters supported at this time. */
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  732  	if (num_params > 1)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  733  		return -EINVAL;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  734  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  735  	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  736  				     len);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  737  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  738  	if (IS_ERR(ctx_set_params))
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  739  		return PTR_ERR(ctx_set_params);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  740  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  741  	mutex_lock(&vfpriv->context_lock);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  742  	if (vfpriv->context_created) {
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  743  		ret = -EEXIST;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  744  		goto out_unlock;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  745  	}
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  746  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  747  	for (i = 0; i < num_params; i++) {
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  748  		param = ctx_set_params[i].param;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  749  		value = ctx_set_params[i].value;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  750  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  751  		switch (param) {
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  752  		case VIRTGPU_CONTEXT_PARAM_CAPSET_ID:
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  753  			if (value > MAX_CAPSET_ID)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  754  				return -EINVAL;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  755  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  756  			if ((vgdev->capset_id_mask & (1 << value)) == 0)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  757  				return -EINVAL;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  758  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  759  			/* Context capset ID already set */
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  760  			if (vfpriv->context_init &
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  761  			    VIRTIO_GPU_CONTEXT_INIT_CAPSET_ID_MASK)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  762  				return -EINVAL;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  763  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  764  			vfpriv->context_init |= value;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  765  			break;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  766  		default:
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  767  			return -EINVAL;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  768  		}
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  769  	}
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  770  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  771  	virtio_gpu_create_context_locked(vgdev, vfpriv);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  772  	virtio_gpu_notify(vgdev);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  773  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  774  out_unlock:
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  775  	mutex_unlock(&vfpriv->context_lock);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27 @776  	return ret;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  777  }
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  778  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
