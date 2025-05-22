Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4457271A60
	for <oe-kbuild@lists.linux.dev>; Thu, 22 May 2025 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956657; cv=none; b=GqOhxWRKXZVSgyHua3nW/Nuk0LSF8TDd4M0xao8Vq+suVX+3KK1mRbbEUcY+XOdZfMeg3hYK3fS7ZM6fWtV4se/XRrsLMSdbeA3uP5+288JiqxcIc4ENE4uqeiz0yhTDI9+2o+4CGaetR5yRSd5E5iWFKUokneyhMod15dy19xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956657; c=relaxed/simple;
	bh=XYkNrAHLdW2H0siqIMHnceHK21LVsK8isi69r9lITbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/39MJ+GLly9yQpbMTn3RI1NzRGpSC3nKIc77woFeRalCS5YxGsfemoqxpqll8ELVXEZemLzQkCPZVVzYWUeRJUFtyC8y5zm6/kUu/xSBrBab0wLss7AG43dE12CbHfUWPPegBfvEOP09TfEDbUUSJV2LSdHEHKyFNRvx24nIzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQx8S1qw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQx8S1qw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747956655; x=1779492655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYkNrAHLdW2H0siqIMHnceHK21LVsK8isi69r9lITbA=;
  b=ZQx8S1qwEYrwwP6X65bb7tD/R/xKIiXQ3aSToPcO7kWXgHzrioCrGboL
   5XdtVYzzt6nYiNX4YQsDYi1exw2B8Wrj7qS3mIkrGAxvRV5THJF1BUIv4
   SocKs+5yFSF4QOVYjMi+wmoVKU+BpEFjyiVmEwKT9hacRVNGqJpEaJqlq
   yqkf3rWnvppsmjAx50V/LiXiE4ZY9b1SVi6MFoDKrOSdRpuRg3ZULlKE/
   11wQzd8I/w3MJ3yR14cPS4hJTPchJFd6unoTORetjR12AteBq1CoW6VOD
   rzZpTwRrqhcw8eAH9ko67cISOKRd5pSgJlfhF5DCzW9q5Wd1H0CsDXm0e
   w==;
X-CSE-ConnectionGUID: c2/g6S5JTw29xQ0/R+MmHQ==
X-CSE-MsgGUID: ztLkWqlRSfSkN0Sf3R4dgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60256225"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="60256225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:30:54 -0700
X-CSE-ConnectionGUID: pfCtxYtdR4qHW2dMFOt+zQ==
X-CSE-MsgGUID: ZowPjJ2KS126OGdDqChE6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140695848"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2025 16:30:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIFMy-000Pm8-10;
	Thu, 22 May 2025 23:30:36 +0000
Date: Fri, 23 May 2025 07:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
Message-ID: <202505230705.6EOoxLbq-lkp@intel.com>
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
In-Reply-To: <20250521140649.4058526-3-David.Francis@amd.com>
References: <20250521140649.4058526-3-David.Francis@amd.com>
TO: David Francis <David.Francis@amd.com>
TO: dri-devel@lists.freedesktop.org
CC: tvrtko.ursulin@igalia.com
CC: Felix.Kuehling@amd.com
CC: David.YatSin@amd.com
CC: Chris.Freehill@amd.com
CC: Christian.Koenig@amd.com
CC: dcostantino@meta.com
CC: sruffell@meta.com
CC: simona@ffwll.ch
CC: mripard@kernel.org
CC: tzimmermann@suse.de
CC: David Francis <David.Francis@amd.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on next-20250522]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Francis/drm-amdgpu-Adding-amdgpu-CRIU-ioctl/20250521-230706
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250521140649.4058526-3-David.Francis%40amd.com
patch subject: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: loongarch-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230705.6EOoxLbq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505230705.6EOoxLbq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:160 amdgpu_criu_checkpoint() warn: potential ! vs ~ typo

vim +160 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c

d970da5c8545bbc David Francis 2025-05-21  119  
d970da5c8545bbc David Francis 2025-05-21  120  	struct amdgpu_vm *avm = &((struct amdgpu_fpriv *)data->driver_priv)->vm;
d970da5c8545bbc David Francis 2025-05-21  121  	struct drm_amdgpu_criu_bo_bucket *bo_buckets;
d970da5c8545bbc David Francis 2025-05-21  122  	struct drm_amdgpu_criu_vm_bucket *vm_buckets;
d970da5c8545bbc David Francis 2025-05-21  123  	struct drm_gem_object *gobj;
d970da5c8545bbc David Francis 2025-05-21  124  	int vm_priv_index = 0;
d970da5c8545bbc David Francis 2025-05-21  125  	int bo_index = 0;
d970da5c8545bbc David Francis 2025-05-21  126  	int num_bos = 0;
d970da5c8545bbc David Francis 2025-05-21  127  	int fd, id, ret;
d970da5c8545bbc David Francis 2025-05-21  128  
d970da5c8545bbc David Francis 2025-05-21  129  	spin_lock(&data->table_lock);
d970da5c8545bbc David Francis 2025-05-21  130  	idr_for_each_entry(&data->object_idr, gobj, id)
d970da5c8545bbc David Francis 2025-05-21  131  		num_bos += 1;
d970da5c8545bbc David Francis 2025-05-21  132  	spin_unlock(&data->table_lock);
d970da5c8545bbc David Francis 2025-05-21  133  
d970da5c8545bbc David Francis 2025-05-21  134  	if (args->num_bos != num_bos) {
d970da5c8545bbc David Francis 2025-05-21  135  		ret = -EINVAL;
d970da5c8545bbc David Francis 2025-05-21  136  		goto exit;
d970da5c8545bbc David Francis 2025-05-21  137  	}
d970da5c8545bbc David Francis 2025-05-21  138  
d970da5c8545bbc David Francis 2025-05-21  139  	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
d970da5c8545bbc David Francis 2025-05-21  140  	if (!bo_buckets) {
d970da5c8545bbc David Francis 2025-05-21  141  		ret = -ENOMEM;
d970da5c8545bbc David Francis 2025-05-21  142  		goto free_buckets;
d970da5c8545bbc David Francis 2025-05-21  143  	}
d970da5c8545bbc David Francis 2025-05-21  144  
d970da5c8545bbc David Francis 2025-05-21  145  	vm_buckets = kvzalloc(args->num_vms * sizeof(*vm_buckets), GFP_KERNEL);
d970da5c8545bbc David Francis 2025-05-21  146  	if (!vm_buckets) {
d970da5c8545bbc David Francis 2025-05-21  147  		ret = -ENOMEM;
d970da5c8545bbc David Francis 2025-05-21  148  		goto free_vms;
d970da5c8545bbc David Francis 2025-05-21  149  	}
d970da5c8545bbc David Francis 2025-05-21  150  
d970da5c8545bbc David Francis 2025-05-21  151  	idr_for_each_entry(&data->object_idr, gobj, id) {
d970da5c8545bbc David Francis 2025-05-21  152  		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
d970da5c8545bbc David Francis 2025-05-21  153  		struct drm_amdgpu_criu_bo_bucket *bo_bucket;
d970da5c8545bbc David Francis 2025-05-21  154  		struct amdgpu_vm_bo_base *vm_bo_base;
d970da5c8545bbc David Francis 2025-05-21  155  
d970da5c8545bbc David Francis 2025-05-21  156  		bo_bucket = &bo_buckets[bo_index];
d970da5c8545bbc David Francis 2025-05-21  157  
d970da5c8545bbc David Francis 2025-05-21  158  		bo_bucket->size = amdgpu_bo_size(bo);
d970da5c8545bbc David Francis 2025-05-21  159  		bo_bucket->offset = amdgpu_bo_mmap_offset(bo);
d970da5c8545bbc David Francis 2025-05-21 @160  		bo_bucket->alloc_flags = bo->flags & (!AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
d970da5c8545bbc David Francis 2025-05-21  161  		bo_bucket->preferred_domains = bo->preferred_domains;
d970da5c8545bbc David Francis 2025-05-21  162  
d970da5c8545bbc David Francis 2025-05-21  163  		if (is_import(bo))
d970da5c8545bbc David Francis 2025-05-21  164  			bo_bucket->flags |= AMDGPU_CRIU_BO_FLAG_IS_IMPORT;
d970da5c8545bbc David Francis 2025-05-21  165  
d970da5c8545bbc David Francis 2025-05-21  166  		drm_gem_prime_handle_to_fd(dev, data, id, 0, &fd);
d970da5c8545bbc David Francis 2025-05-21  167  		if (fd)
d970da5c8545bbc David Francis 2025-05-21  168  			bo_bucket->dmabuf_fd = fd;
d970da5c8545bbc David Francis 2025-05-21  169  
d970da5c8545bbc David Francis 2025-05-21  170  		vm_bo_base = bo->vm_bo;
d970da5c8545bbc David Francis 2025-05-21  171  
d970da5c8545bbc David Francis 2025-05-21  172  		while (vm_bo_base) {
d970da5c8545bbc David Francis 2025-05-21  173  			struct amdgpu_bo_va *bo_va = container_of(vm_bo_base, struct amdgpu_bo_va, base);
d970da5c8545bbc David Francis 2025-05-21  174  			struct amdgpu_bo_va_mapping *mapping;
d970da5c8545bbc David Francis 2025-05-21  175  
d970da5c8545bbc David Francis 2025-05-21  176  			if (vm_bo_base->vm == avm) {
d970da5c8545bbc David Francis 2025-05-21  177  				list_for_each_entry(mapping, &bo_va->invalids, list) {
d970da5c8545bbc David Francis 2025-05-21  178  					vm_buckets[vm_priv_index].start = mapping->start;
d970da5c8545bbc David Francis 2025-05-21  179  					vm_buckets[vm_priv_index].last = mapping->last;
d970da5c8545bbc David Francis 2025-05-21  180  					vm_buckets[vm_priv_index].offset = mapping->offset;
d970da5c8545bbc David Francis 2025-05-21  181  					vm_buckets[vm_priv_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
d970da5c8545bbc David Francis 2025-05-21  182  					vm_buckets[vm_priv_index].gem_handle = id;
d970da5c8545bbc David Francis 2025-05-21  183  					vm_priv_index += 1;
d970da5c8545bbc David Francis 2025-05-21  184  
d970da5c8545bbc David Francis 2025-05-21  185  					bo_bucket->addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
d970da5c8545bbc David Francis 2025-05-21  186  				}
d970da5c8545bbc David Francis 2025-05-21  187  				list_for_each_entry(mapping, &bo_va->valids, list) {
d970da5c8545bbc David Francis 2025-05-21  188  					vm_buckets[vm_priv_index].start = mapping->start;
d970da5c8545bbc David Francis 2025-05-21  189  					vm_buckets[vm_priv_index].last = mapping->last;
d970da5c8545bbc David Francis 2025-05-21  190  					vm_buckets[vm_priv_index].offset = mapping->offset;
d970da5c8545bbc David Francis 2025-05-21  191  					vm_buckets[vm_priv_index].flags = hardware_flags_to_uapi_flags(drm_to_adev(dev), mapping->flags);
d970da5c8545bbc David Francis 2025-05-21  192  					vm_buckets[vm_priv_index].gem_handle = id;
d970da5c8545bbc David Francis 2025-05-21  193  					vm_priv_index += 1;
d970da5c8545bbc David Francis 2025-05-21  194  
d970da5c8545bbc David Francis 2025-05-21  195  					bo_bucket->addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
d970da5c8545bbc David Francis 2025-05-21  196  				}
d970da5c8545bbc David Francis 2025-05-21  197  			}
d970da5c8545bbc David Francis 2025-05-21  198  
d970da5c8545bbc David Francis 2025-05-21  199  			vm_bo_base = vm_bo_base->next;
d970da5c8545bbc David Francis 2025-05-21  200  		}
d970da5c8545bbc David Francis 2025-05-21  201  
d970da5c8545bbc David Francis 2025-05-21  202  		bo_index += 1;
d970da5c8545bbc David Francis 2025-05-21  203  	}
d970da5c8545bbc David Francis 2025-05-21  204  
d970da5c8545bbc David Francis 2025-05-21  205  	ret = copy_to_user((void __user *)args->bos, bo_buckets, num_bos * sizeof(*bo_buckets));
d970da5c8545bbc David Francis 2025-05-21  206  	if (ret) {
d970da5c8545bbc David Francis 2025-05-21  207  		pr_debug("Failed to copy BO information to user\n");
d970da5c8545bbc David Francis 2025-05-21  208  		ret = -EFAULT;
d970da5c8545bbc David Francis 2025-05-21  209  		goto free_vms;
d970da5c8545bbc David Francis 2025-05-21  210  	}
d970da5c8545bbc David Francis 2025-05-21  211  
d970da5c8545bbc David Francis 2025-05-21  212  	ret = copy_to_user((void __user *)args->vms, vm_buckets, args->num_vms * sizeof(*vm_buckets));
d970da5c8545bbc David Francis 2025-05-21  213  	if (ret) {
d970da5c8545bbc David Francis 2025-05-21  214  		pr_debug("Failed to copy BO information to user\n");
d970da5c8545bbc David Francis 2025-05-21  215  		ret = -EFAULT;
d970da5c8545bbc David Francis 2025-05-21  216  		goto free_vms;
d970da5c8545bbc David Francis 2025-05-21  217  	}
d970da5c8545bbc David Francis 2025-05-21  218  
d970da5c8545bbc David Francis 2025-05-21  219  free_vms:
d970da5c8545bbc David Francis 2025-05-21  220  	kvfree(vm_buckets);
d970da5c8545bbc David Francis 2025-05-21  221  free_buckets:
d970da5c8545bbc David Francis 2025-05-21  222  	kvfree(bo_buckets);
d970da5c8545bbc David Francis 2025-05-21  223  exit:
d970da5c8545bbc David Francis 2025-05-21  224  
d970da5c8545bbc David Francis 2025-05-21  225  	return ret;
d970da5c8545bbc David Francis 2025-05-21  226  }
d970da5c8545bbc David Francis 2025-05-21  227  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
