Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD6313AD5
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Dec 2023 20:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGbRfVpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703880158; x=1735416158;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=afY4Xd87I8EW6h4xxngzOWDkrmJp0v9/XXszxVyumjU=;
  b=eGbRfVpBJ9qzgUw8JjSqHNP31eCQPwyv6um2FQKMLA3ZKsd/JagkHX3J
   drTtYoc+MkluWORNrJ9SNtQP4EMoFyUldFqn0XaYQgH0E71ky+5+mM1sY
   qm0Tfz+wRp8NR6JEUFy8IW+AtMicWYZragca4V3USI26IUrqfebY1fQqd
   OvVN3Qv7UBwh4aQ1lFULG5kGN55qHj1Od407kALP2ZgOrIpTrBjww7clN
   Vs/GkIaB/YJVEE32gA5QzJUYM5B7czGTKkWcBtIQPYBNYyq/utk8hjv8B
   jq+TyMg5FQdBgMR9wPG82GXyP0DPZD2+ydF3Dsb00AC0C6wXHFeZAVUUN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="10261641"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="10261641"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 12:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="27226248"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Dec 2023 12:02:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJJ3x-000Hkb-04;
	Fri, 29 Dec 2023 20:02:33 +0000
Date: Sat, 30 Dec 2023 04:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] drm/virtio: Implement RESOURCE_GET_LAYOUT ioctl
Message-ID: <202312300305.2LQ96scM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/virtio/virtgpu_ioctl.c:712:1: sparse: sparse: unused label 'valid'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231221100016.4022353-2-julia.zhang@amd.com>
References: <20231221100016.4022353-2-julia.zhang@amd.com>
TO: Julia Zhang <julia.zhang@amd.com>
TO: Gurchetan Singh <gurchetansingh@chromium.org>
TO: "Chia-I Wu" <olvaffe@gmail.com>
TO: David Airlie <airlied@redhat.com>
TO: Gerd Hoffmann <kraxel@redhat.com>
TO: linux-kernel@vger.kernel.org
TO: dri-devel@lists.freedesktop.org
TO: amd-gfx@lists.freedesktop.org
TO: virtualization@lists.linux-foundation.org
CC: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: Daniel Stone <daniels@collabora.com>
CC: "Erik Faye-Lund" <kusmabite@gmail.com>
CC: "Marek Olšák" <marek.olsak@amd.com>
CC: Chen Jiqian <Jiqian.Chen@amd.com>
CC: Huang Rui <ray.huang@amd.com>
CC: Honglei Huang <honglei1.huang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Julia Zhang <julia.zhang@amd.com>
CC: "Christian König" <christian.koenig@amd.com>

Hi Julia,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7-rc6]
[also build test WARNING on linus/master]
[cannot apply to drm-misc/drm-misc-next drm/drm-next next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julia-Zhang/drm-virtio-Implement-RESOURCE_GET_LAYOUT-ioctl/20231222-182142
base:   v6.7-rc6
patch link:    https://lore.kernel.org/r/20231221100016.4022353-2-julia.zhang%40amd.com
patch subject: [PATCH 1/1] drm/virtio: Implement RESOURCE_GET_LAYOUT ioctl
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-121-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300305.2LQ96scM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300305.2LQ96scM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312300305.2LQ96scM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/virtio/virtgpu_ioctl.c:712:1: sparse: sparse: unused label 'valid'
--
   drivers/gpu/drm/virtio/virtgpu_vq.c:1316:22: sparse: sparse: restricted __le32 degrades to integer
>> drivers/gpu/drm/virtio/virtgpu_vq.c:1325:45: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/virtio/virtgpu_vq.c:1325:45: sparse: sparse: cast from restricted __le64

vim +/valid +712 drivers/gpu/drm/virtio/virtgpu_ioctl.c

4fb530e5caf7cb Anthoine Bourgeois 2021-09-21  673  
321544a611e324 Daniel Stone       2023-12-21  674  static int virtio_gpu_resource_query_layout_ioctl(struct drm_device *dev,
321544a611e324 Daniel Stone       2023-12-21  675  						  void *data,
321544a611e324 Daniel Stone       2023-12-21  676  						  struct drm_file *file)
321544a611e324 Daniel Stone       2023-12-21  677  {
321544a611e324 Daniel Stone       2023-12-21  678  	struct drm_virtgpu_resource_query_layout *args = data;
321544a611e324 Daniel Stone       2023-12-21  679  	struct virtio_gpu_device *vgdev = dev->dev_private;
321544a611e324 Daniel Stone       2023-12-21  680  	struct drm_gem_object *obj = NULL;
321544a611e324 Daniel Stone       2023-12-21  681  	struct virtio_gpu_object *bo = NULL;
321544a611e324 Daniel Stone       2023-12-21  682  	struct virtio_gpu_query_info bo_info = {0};
321544a611e324 Daniel Stone       2023-12-21  683  	int ret = 0;
321544a611e324 Daniel Stone       2023-12-21  684  	int i;
321544a611e324 Daniel Stone       2023-12-21  685  
321544a611e324 Daniel Stone       2023-12-21  686  	if (!vgdev->has_resource_query_layout) {
321544a611e324 Daniel Stone       2023-12-21  687  		DRM_ERROR("failing: no RQL on host\n");
321544a611e324 Daniel Stone       2023-12-21  688  		return -EINVAL;
321544a611e324 Daniel Stone       2023-12-21  689  	}
321544a611e324 Daniel Stone       2023-12-21  690  
321544a611e324 Daniel Stone       2023-12-21  691  	if (args->handle > 0) {
321544a611e324 Daniel Stone       2023-12-21  692  		obj = drm_gem_object_lookup(file, args->handle);
321544a611e324 Daniel Stone       2023-12-21  693  		if (obj == NULL) {
321544a611e324 Daniel Stone       2023-12-21  694  			DRM_ERROR("invalid handle 0x%x\n", args->handle);
321544a611e324 Daniel Stone       2023-12-21  695  			return -ENOENT;
321544a611e324 Daniel Stone       2023-12-21  696  		}
321544a611e324 Daniel Stone       2023-12-21  697  		bo = gem_to_virtio_gpu_obj(obj);
321544a611e324 Daniel Stone       2023-12-21  698  	}
321544a611e324 Daniel Stone       2023-12-21  699  
321544a611e324 Daniel Stone       2023-12-21  700  	ret = virtio_gpu_cmd_get_resource_layout(vgdev, &bo_info, args->width,
321544a611e324 Daniel Stone       2023-12-21  701  						 args->height, args->format,
321544a611e324 Daniel Stone       2023-12-21  702  						 args->bind, bo ? bo->hw_res_handle : 0);
321544a611e324 Daniel Stone       2023-12-21  703  	if (ret)
321544a611e324 Daniel Stone       2023-12-21  704  		goto out;
321544a611e324 Daniel Stone       2023-12-21  705  
321544a611e324 Daniel Stone       2023-12-21  706  	ret = wait_event_timeout(vgdev->resp_wq,
321544a611e324 Daniel Stone       2023-12-21  707  				 atomic_read(&bo_info.is_valid),
321544a611e324 Daniel Stone       2023-12-21  708  				 5 * HZ);
321544a611e324 Daniel Stone       2023-12-21  709  	if (!ret)
321544a611e324 Daniel Stone       2023-12-21  710  		goto out;
321544a611e324 Daniel Stone       2023-12-21  711  
321544a611e324 Daniel Stone       2023-12-21 @712  valid:
321544a611e324 Daniel Stone       2023-12-21  713  	smp_rmb();
321544a611e324 Daniel Stone       2023-12-21  714  	WARN_ON(atomic_read(&bo_info.is_valid));
321544a611e324 Daniel Stone       2023-12-21  715  	args->num_planes = bo_info.num_planes;
321544a611e324 Daniel Stone       2023-12-21  716  	args->modifier = bo_info.modifier;
321544a611e324 Daniel Stone       2023-12-21  717  	for (i = 0; i < args->num_planes; i++) {
321544a611e324 Daniel Stone       2023-12-21  718  		args->planes[i].offset = bo_info.planes[i].offset;
321544a611e324 Daniel Stone       2023-12-21  719  		args->planes[i].stride = bo_info.planes[i].stride;
321544a611e324 Daniel Stone       2023-12-21  720  	}
321544a611e324 Daniel Stone       2023-12-21  721  	for (; i < VIRTIO_GPU_MAX_RESOURCE_PLANES; i++) {
321544a611e324 Daniel Stone       2023-12-21  722  		args->planes[i].offset = 0;
321544a611e324 Daniel Stone       2023-12-21  723  		args->planes[i].stride = 0;
321544a611e324 Daniel Stone       2023-12-21  724  	}
321544a611e324 Daniel Stone       2023-12-21  725  	ret = 0;
321544a611e324 Daniel Stone       2023-12-21  726  
321544a611e324 Daniel Stone       2023-12-21  727  out:
321544a611e324 Daniel Stone       2023-12-21  728  	if (obj)
321544a611e324 Daniel Stone       2023-12-21  729  		drm_gem_object_put(obj);
321544a611e324 Daniel Stone       2023-12-21  730  	return ret;
321544a611e324 Daniel Stone       2023-12-21  731  }
321544a611e324 Daniel Stone       2023-12-21  732  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
