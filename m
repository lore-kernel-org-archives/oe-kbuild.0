Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9162AD2E
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 18:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694456444; x=1725992444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oCMMT7qhKhkGu9Y2JCYOwYhFaQB/k7o3wvtHNIPK8rs=;
  b=HEU9Cw0tZqH9dsBTMjal6NaR/dgDn4AG5HzjR8C+9OhtlOwkYQSheRpO
   6TicsXLQTN96l+/Eu1y0Wv2iBc2XBo3kUxWatLVP0x81XeFQ3Gv0Hei1Q
   gd4ehhhD/p9Z2gr9fIkPW5xFfMZGbFFwKWpCTIucwFOcR9IOTBgJVeK8l
   69wwGDVLUTAzSDTEdwndXnTaX+1eT/kD3Sflm35opBAUQq2YS+/NithFc
   2t/yvyfsAjxoTGMINcAGRyfgkkF7G5pOJ37MTyHH6ESLmuFawNQTuaINT
   OXrFih8u5jY1itp0M7DUz2rM7m5xdsWvxcPYmMGCGmAvQ0+N0/6uFhYHL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444597069"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="444597069"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 11:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="772686152"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="772686152"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Sep 2023 11:20:31 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qflWP-0006aG-1f;
	Mon, 11 Sep 2023 18:20:29 +0000
Date: Tue, 12 Sep 2023 02:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH drm-misc-next v2 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <202309120155.0l5YexHV-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230912/202309120155.0l5YexHV-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230912/202309120155.0l5YexHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309120155.0l5YexHV-lkp@intel.com/

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
