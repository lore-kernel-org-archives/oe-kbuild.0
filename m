Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671A4A5B
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 04:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694578446; x=1726114446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ilc9EaaaisFfJ2IQHUiHcFpJIV/roNoegA2eqNAjqk=;
  b=H60Q/hx2SnrLl7X6yHhEXszm30Q/xAnIs1Ms3gv9kfOBdfhD8bzQVyxq
   /Vuog9tBwCkh2ZCNsgb63FQlriNLA0kbtggim53hK/4/35BLpNyVJMc4u
   HN7Kb0Fc7o2hqgcadnqnw3XR0r3O+9xIsvFXBhzn1G9km+8hRNakYmoGe
   bdBATXs60kvpaM6QOh6dR4lYSRC7TeWyP2n4nqcmWP6gMTZo89meRUJeO
   zAGLbEDf0xIw4PeC6KFwKQYbHyhrZ0iB/Xq+rWy1vNpnKQAuZFcZ/gbo1
   gBX1a8cu59XcFVIY+q8B+xakmo0qlJ7Ib8eGqvrvFvTleEH13Zxw6ho/E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378472890"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="378472890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 21:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="779053618"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="779053618"
Received: from lkp-server02.sh.intel.com (HELO e6439d5ea182) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Sep 2023 21:14:03 -0700
Received: from kbuild by e6439d5ea182 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgHGL-000069-1y;
	Wed, 13 Sep 2023 04:14:01 +0000
Date: Wed, 13 Sep 2023 12:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH drm-misc-next v2 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <202309131107.SbsUYO4f-lkp@intel.com>
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
In-Reply-To: <20230906214723.4393-7-dakr@redhat.com>
References: <20230906214723.4393-7-dakr@redhat.com>
TO: Danilo Krummrich <dakr@redhat.com>
TO: airlied@gmail.com
TO: daniel@ffwll.ch
TO: matthew.brost@intel.com
TO: thomas.hellstrom@linux.intel.com
TO: sarah.walker@imgtec.com
TO: donald.robson@imgtec.com
TO: boris.brezillon@collabora.com
TO: christian.koenig@amd.com
TO: faith.ekstrand@collabora.com
CC: nouveau@lists.freedesktop.org
CC: Danilo Krummrich <dakr@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org

Hi Danilo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6bd3d8da51ca1ec97c724016466606aec7739b9f]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-gpuva_mgr-allow-building-as-module/20230907-054931
base:   6bd3d8da51ca1ec97c724016466606aec7739b9f
patch link:    https://lore.kernel.org/r/20230906214723.4393-7-dakr%40redhat.com
patch subject: [PATCH drm-misc-next v2 6/7] drm/gpuvm: generalize dma_resv/extobj handling and GEM validation
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230913/202309131107.SbsUYO4f-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309131107.SbsUYO4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309131107.SbsUYO4f-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_gpuva_mgr.c:942 drm_gpuvm_exec_lock_range() error: uninitialized symbol 'ret'.

vim +/ret +942 drivers/gpu/drm/drm_gpuva_mgr.c

14fe9477549560 Danilo Krummrich 2023-09-06  904  
14fe9477549560 Danilo Krummrich 2023-09-06  905  /**
14fe9477549560 Danilo Krummrich 2023-09-06  906   * drm_gpuvm_exec_lock_range() - prepare all BOs mapped within a given range
14fe9477549560 Danilo Krummrich 2023-09-06  907   * @vm_exec: the &drm_gpuvm_exec abstraction
14fe9477549560 Danilo Krummrich 2023-09-06  908   * @addr: the start address within the VA space
14fe9477549560 Danilo Krummrich 2023-09-06  909   * @range: the range to iterate within the VA space
14fe9477549560 Danilo Krummrich 2023-09-06  910   * @num_fences: the amount of &dma_fences to reserve
14fe9477549560 Danilo Krummrich 2023-09-06  911   * @interruptible: sleep interruptible if waiting
14fe9477549560 Danilo Krummrich 2023-09-06  912   *
14fe9477549560 Danilo Krummrich 2023-09-06  913   * Acquires all dma-resv locks of all &drm_gem_objects mapped between @addr and
14fe9477549560 Danilo Krummrich 2023-09-06  914   * @addr + @range.
14fe9477549560 Danilo Krummrich 2023-09-06  915   *
14fe9477549560 Danilo Krummrich 2023-09-06  916   * Returns: 0 on success, negative error code on failure.
14fe9477549560 Danilo Krummrich 2023-09-06  917   */
14fe9477549560 Danilo Krummrich 2023-09-06  918  int
14fe9477549560 Danilo Krummrich 2023-09-06  919  drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
14fe9477549560 Danilo Krummrich 2023-09-06  920  			  u64 addr, u64 range,
14fe9477549560 Danilo Krummrich 2023-09-06  921  			  unsigned int num_fences,
14fe9477549560 Danilo Krummrich 2023-09-06  922  			  bool interruptible)
14fe9477549560 Danilo Krummrich 2023-09-06  923  {
14fe9477549560 Danilo Krummrich 2023-09-06  924  	struct drm_gpuvm *gpuvm = vm_exec->vm;
14fe9477549560 Danilo Krummrich 2023-09-06  925  	struct drm_exec *exec = &vm_exec->exec;
14fe9477549560 Danilo Krummrich 2023-09-06  926  	uint32_t flags;
14fe9477549560 Danilo Krummrich 2023-09-06  927  	int ret;
14fe9477549560 Danilo Krummrich 2023-09-06  928  
14fe9477549560 Danilo Krummrich 2023-09-06  929  	flags = interruptible ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0 |
14fe9477549560 Danilo Krummrich 2023-09-06  930  		DRM_EXEC_IGNORE_DUPLICATES;
14fe9477549560 Danilo Krummrich 2023-09-06  931  
14fe9477549560 Danilo Krummrich 2023-09-06  932  	drm_exec_init(exec, flags);
14fe9477549560 Danilo Krummrich 2023-09-06  933  
14fe9477549560 Danilo Krummrich 2023-09-06  934  	drm_exec_until_all_locked(exec) {
14fe9477549560 Danilo Krummrich 2023-09-06  935  		ret = drm_gpuvm_prepare_range(gpuvm, exec, addr, range,
14fe9477549560 Danilo Krummrich 2023-09-06  936  					      num_fences);
14fe9477549560 Danilo Krummrich 2023-09-06  937  		drm_exec_retry_on_contention(exec);
14fe9477549560 Danilo Krummrich 2023-09-06  938  		if (ret)
14fe9477549560 Danilo Krummrich 2023-09-06  939  			goto err;
14fe9477549560 Danilo Krummrich 2023-09-06  940  	}
14fe9477549560 Danilo Krummrich 2023-09-06  941  
14fe9477549560 Danilo Krummrich 2023-09-06 @942  	return ret;
14fe9477549560 Danilo Krummrich 2023-09-06  943  
14fe9477549560 Danilo Krummrich 2023-09-06  944  err:
14fe9477549560 Danilo Krummrich 2023-09-06  945  	drm_exec_fini(exec);
14fe9477549560 Danilo Krummrich 2023-09-06  946  	return ret;
14fe9477549560 Danilo Krummrich 2023-09-06  947  }
14fe9477549560 Danilo Krummrich 2023-09-06  948  EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_range);
14fe9477549560 Danilo Krummrich 2023-09-06  949  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
