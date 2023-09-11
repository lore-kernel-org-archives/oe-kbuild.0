Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79646259B
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694423335; x=1725959335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p+vdNodXk1sH9dBWZEkLRLRlKQcONnzpPGkzYog4+i0=;
  b=IWhEZC8Xz0PAi/EIw1fXJdvWqS62MpSJ8LBxqeAp0AjZ4hVHbdBeXBnS
   aIU5xJ3fQrfRAP+iWaeB99Jiw61C2jpu7Lm9MZa+3cbIwTLXkFZm+eDFD
   hEz/4E96NKddcg86JGEHgw+jiRYD5XfYk2ewdVTivzingbYiUN6FHZwJM
   oa+SDXIJO1Jaiw0xNujYKAkhI67rHlOAAR7IFeUE8jMHz4dJNnGbF2BOc
   hM9oaLdNIYjz7dJ+XYzSGSAOHLUcZsUHtGfD2zTARLrCGqZVLD2FZEBy7
   TfZoSlZg3A+KAa11uKrNi6QKcIFW7SU8h2qW5fyfyIl86zOSkhIqfKq2t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381834869"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="381834869"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 02:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="736711089"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="736711089"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Sep 2023 02:08:54 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfcuZ-00061g-36;
	Mon, 11 Sep 2023 09:08:51 +0000
Date: Mon, 11 Sep 2023 17:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <202309111607.ARG8RvRv-lkp@intel.com>
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
In-Reply-To: <20230909153125.30032-7-dakr@redhat.com>
References: <20230909153125.30032-7-dakr@redhat.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-gpuvm-rename-struct-drm_gpuva_manager-to-struct-drm_gpuvm/20230909-233346
base:   6bd3d8da51ca1ec97c724016466606aec7739b9f
patch link:    https://lore.kernel.org/r/20230909153125.30032-7-dakr%40redhat.com
patch subject: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize dma_resv/extobj handling and GEM validation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230911/202309111607.ARG8RvRv-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309111607.ARG8RvRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309111607.ARG8RvRv-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_gpuvm.c:955 drm_gpuvm_prepare_objects() error: uninitialized symbol '__vm_bo'.
drivers/gpu/drm/drm_gpuvm.c:955 drm_gpuvm_prepare_objects() error: uninitialized symbol '__vm_bo'.
drivers/gpu/drm/drm_gpuvm.c:1143 drm_gpuvm_exec_lock_range() error: uninitialized symbol 'ret'.
drivers/gpu/drm/drm_gpuvm.c:1171 drm_gpuvm_validate() error: uninitialized symbol '__vm_bo'.
drivers/gpu/drm/drm_gpuvm.c:1171 drm_gpuvm_validate() error: uninitialized symbol '__vm_bo'.

vim +/__vm_bo +955 drivers/gpu/drm/drm_gpuvm.c

e6303f323b1ad9 drivers/gpu/drm/drm_gpuva_mgr.c Danilo Krummrich 2023-07-20   923  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   924  /**
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   925   * drm_gpuvm_prepare_objects() - prepare all assoiciated BOs
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   926   * @gpuvm: the &drm_gpuvm
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   927   * @exec: the &drm_exec locking context
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   928   * @num_fences: the amount of &dma_fences to reserve
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   929   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   930   * Calls drm_exec_prepare_obj() for all &drm_gem_objects the given
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   931   * &drm_gpuvm contains mappings of.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   932   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   933   * Using this function directly, it is the drivers responsibility to call
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   934   * drm_exec_init() and drm_exec_fini() accordingly.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   935   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   936   * Note: This function is safe against concurrent insertion and removal of
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   937   * external objects, however it is not safe against concurrent usage itself.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   938   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   939   * Drivers need to make sure to protect this case with either an outer VM lock
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   940   * or by calling drm_gpuvm_prepare_vm() before this function within the
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   941   * drm_exec_until_all_locked() loop, such that the GPUVM's dma-resv lock ensures
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   942   * mutual exclusion.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   943   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   944   * Returns: 0 on success, negative error code on failure.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   945   */
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   946  int
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   947  drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   948  			  struct drm_exec *exec,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   949  			  unsigned int num_fences)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   950  {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   951  	struct drm_gpuvm_bo *vm_bo;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   952  	LIST_HEAD(extobjs);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   953  	int ret = 0;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   954  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  @955  	for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   956  		ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   957  		if (ret)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   958  			break;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   959  	}
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   960  	/* Drop ref in case we break out of the loop. */
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   961  	drm_gpuvm_bo_put(vm_bo);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   962  	restore_vm_bo_list(gpuvm, extobj, &extobjs);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   963  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   964  	return ret;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   965  }
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   966  EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_objects);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   967  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   968  /**
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   969   * drm_gpuvm_prepare_range() - prepare all BOs mapped within a given range
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   970   * @gpuvm: the &drm_gpuvm
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   971   * @exec: the &drm_exec locking context
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   972   * @addr: the start address within the VA space
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   973   * @range: the range to iterate within the VA space
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   974   * @num_fences: the amount of &dma_fences to reserve
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   975   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   976   * Calls drm_exec_prepare_obj() for all &drm_gem_objects mapped between @addr
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   977   * and @addr + @range.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   978   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   979   * Returns: 0 on success, negative error code on failure.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   980   */
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   981  int
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   982  drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   983  			u64 addr, u64 range, unsigned int num_fences)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   984  {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   985  	struct drm_gpuva *va;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   986  	u64 end = addr + range;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   987  	int ret;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   988  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   989  	drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   990  		struct drm_gem_object *obj = va->gem.obj;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   991  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   992  		ret = drm_exec_prepare_obj(exec, obj, num_fences);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   993  		if (ret)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   994  			return ret;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   995  	}
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   996  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   997  	return 0;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   998  }
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09   999  EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_range);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1000  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1001  /**
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1002   * drm_gpuvm_exec_lock() - lock all dma-resv of all assoiciated BOs
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1003   * @vm_exec: the &drm_gpuvm_exec abstraction
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1004   * @num_fences: the amount of &dma_fences to reserve
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1005   * @interruptible: sleep interruptible if waiting
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1006   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1007   * Acquires all dma-resv locks of all &drm_gem_objects the given
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1008   * &drm_gpuvm contains mappings of.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1009   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1010   * Addionally, when calling this function with struct drm_gpuvm_exec::extra
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1011   * being set the driver receives the given @fn callback to lock additional
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1012   * dma-resv in the context of the &drm_gpuvm_exec instance. Typically, drivers
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1013   * would call drm_exec_prepare_obj() from within this callback.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1014   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1015   * Returns: 0 on success, negative error code on failure.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1016   */
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1017  int
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1018  drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1019  		    unsigned int num_fences,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1020  		    bool interruptible)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1021  {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1022  	struct drm_gpuvm *gpuvm = vm_exec->vm;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1023  	struct drm_exec *exec = &vm_exec->exec;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1024  	uint32_t flags;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1025  	int ret;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1026  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1027  	flags = interruptible ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0 |
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1028  		DRM_EXEC_IGNORE_DUPLICATES;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1029  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1030  	drm_exec_init(exec, flags);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1031  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1032  	drm_exec_until_all_locked(exec) {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1033  		ret = drm_gpuvm_prepare_vm(gpuvm, exec, num_fences);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1034  		drm_exec_retry_on_contention(exec);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1035  		if (ret)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1036  			goto err;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1037  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1038  		ret = drm_gpuvm_prepare_objects(gpuvm, exec, num_fences);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1039  		drm_exec_retry_on_contention(exec);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1040  		if (ret)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1041  			goto err;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1042  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1043  		if (vm_exec->extra.fn) {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1044  			ret = vm_exec->extra.fn(vm_exec, num_fences);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1045  			drm_exec_retry_on_contention(exec);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1046  			if (ret)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1047  				goto err;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1048  		}
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1049  	}
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1050  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1051  	return 0;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1052  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1053  err:
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1054  	drm_exec_fini(exec);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1055  	return ret;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1056  }
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1057  EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1058  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1059  static int
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1060  fn_lock_array(struct drm_gpuvm_exec *vm_exec, unsigned int num_fences)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1061  {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1062  	struct {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1063  		struct drm_gem_object **objs;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1064  		unsigned int num_objs;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1065  	} *args = vm_exec->extra.priv;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1066  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1067  	return drm_exec_prepare_array(&vm_exec->exec, args->objs,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1068  				      args->num_objs, num_fences);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1069  }
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1070  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1071  /**
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1072   * drm_gpuvm_exec_lock_array() - lock all dma-resv of all assoiciated BOs
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1073   * @vm_exec: the &drm_gpuvm_exec abstraction
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1074   * @objs: additional &drm_gem_objects to lock
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1075   * @num_objs: the number of additional &drm_gem_objects to lock
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1076   * @num_fences: the amount of &dma_fences to reserve
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1077   * @interruptible: sleep interruptible if waiting
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1078   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1079   * Acquires all dma-resv locks of all &drm_gem_objects the given &drm_gpuvm
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1080   * contains mappings of, plus the ones given through @objs.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1081   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1082   * Returns: 0 on success, negative error code on failure.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1083   */
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1084  int
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1085  drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1086  			  struct drm_gem_object **objs,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1087  			  unsigned int num_objs,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1088  			  unsigned int num_fences,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1089  			  bool interruptible)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1090  {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1091  	struct {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1092  		struct drm_gem_object **objs;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1093  		unsigned int num_objs;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1094  	} args;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1095  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1096  	args.objs = objs;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1097  	args.num_objs = num_objs;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1098  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1099  	vm_exec->extra.fn = fn_lock_array;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1100  	vm_exec->extra.priv = &args;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1101  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1102  	return drm_gpuvm_exec_lock(vm_exec, num_fences, interruptible);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1103  }
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1104  EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_array);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1105  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1106  /**
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1107   * drm_gpuvm_exec_lock_range() - prepare all BOs mapped within a given range
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1108   * @vm_exec: the &drm_gpuvm_exec abstraction
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1109   * @addr: the start address within the VA space
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1110   * @range: the range to iterate within the VA space
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1111   * @num_fences: the amount of &dma_fences to reserve
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1112   * @interruptible: sleep interruptible if waiting
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1113   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1114   * Acquires all dma-resv locks of all &drm_gem_objects mapped between @addr and
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1115   * @addr + @range.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1116   *
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1117   * Returns: 0 on success, negative error code on failure.
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1118   */
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1119  int
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1120  drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1121  			  u64 addr, u64 range,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1122  			  unsigned int num_fences,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1123  			  bool interruptible)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1124  {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1125  	struct drm_gpuvm *gpuvm = vm_exec->vm;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1126  	struct drm_exec *exec = &vm_exec->exec;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1127  	uint32_t flags;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1128  	int ret;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1129  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1130  	flags = interruptible ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0 |
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1131  		DRM_EXEC_IGNORE_DUPLICATES;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1132  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1133  	drm_exec_init(exec, flags);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1134  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1135  	drm_exec_until_all_locked(exec) {
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1136  		ret = drm_gpuvm_prepare_range(gpuvm, exec, addr, range,
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1137  					      num_fences);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1138  		drm_exec_retry_on_contention(exec);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1139  		if (ret)
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1140  			goto err;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1141  	}
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1142  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09 @1143  	return ret;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1144  
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1145  err:
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1146  	drm_exec_fini(exec);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1147  	return ret;
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1148  }
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1149  EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_range);
76f730f6cfee1b drivers/gpu/drm/drm_gpuvm.c     Danilo Krummrich 2023-09-09  1150  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
