Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC20112B8A
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jan 2024 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JY46QUMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705396015; x=1736932015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o51FWQm13eRpDRV3CiUEZyfHKhb0jwRc4z4CTfw+VuU=;
  b=JY46QUMjscL01xeytn3l4LxccCguB3OHtEru7AmKDAoxDVtV2SjtgbnR
   1csTmqyjrQQNWWrypAU/5BD0SiWkXxIjFzZi6GllUux8RW9XLuK4KEPiG
   44QW00CMU/91M8CLTni8EeCHv+Se2zTiItUIR2SRZnwPJ6z9gQ7PRrG+A
   sUFhBVhU3ryQlYZUfV/coHZQDqfM1dxF4Uan1IFHTskVHokVx1AKodmkw
   l3CCpzTDAoVISvgQK8HUX1v93a4RqTenHXeS3Tcxbk9GocCzBUEQgfr6g
   3Mo76vAbWDTZ5AXNCn4OUgNbgQqXCzoiMVMQ/iZPgm8Cp68r644ZUcC9m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="403552326"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="403552326"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 01:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="903057173"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="903057173"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2024 01:06:53 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPfPH-0000LW-0X;
	Tue, 16 Jan 2024 09:06:51 +0000
Date: Tue, 16 Jan 2024 17:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdkfd/kfd_debug.c:937:8-13: ERROR: invalid
 reference to the index variable of the iterator on line 922
Message-ID: <202401161726.sfFoIQFL-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jonathan Kim <jonathan.kim@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   052d534373b7ed33712a63d5e17b2b6cdbce84fd
commit: 2b36de971d25daa2ad287114ae3ca11a8f8d49d7 drm/amdkfd: add debug query exception info operation
date:   7 months ago
:::::: branch date: 3 days ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r063-20240110 (https://download.01.org/0day-ci/archive/20240116/202401161726.sfFoIQFL-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7388b7422f9307dd5ae3fe3876a676d83d702daf)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401161726.sfFoIQFL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdkfd/kfd_debug.c:937:8-13: ERROR: invalid reference to the index variable of the iterator on line 922

vim +937 drivers/gpu/drm/amd/amdkfd/kfd_debug.c

101827e13026a9 Jonathan Kim 2022-04-27   892  
2b36de971d25da Jonathan Kim 2022-05-09   893  int kfd_dbg_trap_query_exception_info(struct kfd_process *target,
2b36de971d25da Jonathan Kim 2022-05-09   894  		uint32_t source_id,
2b36de971d25da Jonathan Kim 2022-05-09   895  		uint32_t exception_code,
2b36de971d25da Jonathan Kim 2022-05-09   896  		bool clear_exception,
2b36de971d25da Jonathan Kim 2022-05-09   897  		void __user *info,
2b36de971d25da Jonathan Kim 2022-05-09   898  		uint32_t *info_size)
2b36de971d25da Jonathan Kim 2022-05-09   899  {
2b36de971d25da Jonathan Kim 2022-05-09   900  	bool found = false;
2b36de971d25da Jonathan Kim 2022-05-09   901  	int r = 0;
2b36de971d25da Jonathan Kim 2022-05-09   902  	uint32_t copy_size, actual_info_size = 0;
2b36de971d25da Jonathan Kim 2022-05-09   903  	uint64_t *exception_status_ptr = NULL;
2b36de971d25da Jonathan Kim 2022-05-09   904  
2b36de971d25da Jonathan Kim 2022-05-09   905  	if (!target)
2b36de971d25da Jonathan Kim 2022-05-09   906  		return -EINVAL;
2b36de971d25da Jonathan Kim 2022-05-09   907  
2b36de971d25da Jonathan Kim 2022-05-09   908  	if (!info || !info_size)
2b36de971d25da Jonathan Kim 2022-05-09   909  		return -EINVAL;
2b36de971d25da Jonathan Kim 2022-05-09   910  
2b36de971d25da Jonathan Kim 2022-05-09   911  	mutex_lock(&target->event_mutex);
2b36de971d25da Jonathan Kim 2022-05-09   912  
2b36de971d25da Jonathan Kim 2022-05-09   913  	if (KFD_DBG_EC_TYPE_IS_QUEUE(exception_code)) {
2b36de971d25da Jonathan Kim 2022-05-09   914  		/* Per queue exceptions */
2b36de971d25da Jonathan Kim 2022-05-09   915  		struct queue *queue = NULL;
2b36de971d25da Jonathan Kim 2022-05-09   916  		int i;
2b36de971d25da Jonathan Kim 2022-05-09   917  
2b36de971d25da Jonathan Kim 2022-05-09   918  		for (i = 0; i < target->n_pdds; i++) {
2b36de971d25da Jonathan Kim 2022-05-09   919  			struct kfd_process_device *pdd = target->pdds[i];
2b36de971d25da Jonathan Kim 2022-05-09   920  			struct qcm_process_device *qpd = &pdd->qpd;
2b36de971d25da Jonathan Kim 2022-05-09   921  
2b36de971d25da Jonathan Kim 2022-05-09  @922  			list_for_each_entry(queue, &qpd->queues_list, list) {
2b36de971d25da Jonathan Kim 2022-05-09   923  				if (!found && queue->properties.queue_id == source_id) {
2b36de971d25da Jonathan Kim 2022-05-09   924  					found = true;
2b36de971d25da Jonathan Kim 2022-05-09   925  					break;
2b36de971d25da Jonathan Kim 2022-05-09   926  				}
2b36de971d25da Jonathan Kim 2022-05-09   927  			}
2b36de971d25da Jonathan Kim 2022-05-09   928  			if (found)
2b36de971d25da Jonathan Kim 2022-05-09   929  				break;
2b36de971d25da Jonathan Kim 2022-05-09   930  		}
2b36de971d25da Jonathan Kim 2022-05-09   931  
2b36de971d25da Jonathan Kim 2022-05-09   932  		if (!found) {
2b36de971d25da Jonathan Kim 2022-05-09   933  			r = -EINVAL;
2b36de971d25da Jonathan Kim 2022-05-09   934  			goto out;
2b36de971d25da Jonathan Kim 2022-05-09   935  		}
2b36de971d25da Jonathan Kim 2022-05-09   936  
2b36de971d25da Jonathan Kim 2022-05-09  @937  		if (!(queue->properties.exception_status & KFD_EC_MASK(exception_code))) {
2b36de971d25da Jonathan Kim 2022-05-09   938  			r = -ENODATA;
2b36de971d25da Jonathan Kim 2022-05-09   939  			goto out;
2b36de971d25da Jonathan Kim 2022-05-09   940  		}
2b36de971d25da Jonathan Kim 2022-05-09   941  		exception_status_ptr = &queue->properties.exception_status;
2b36de971d25da Jonathan Kim 2022-05-09   942  	} else if (KFD_DBG_EC_TYPE_IS_DEVICE(exception_code)) {
2b36de971d25da Jonathan Kim 2022-05-09   943  		/* Per device exceptions */
2b36de971d25da Jonathan Kim 2022-05-09   944  		struct kfd_process_device *pdd = NULL;
2b36de971d25da Jonathan Kim 2022-05-09   945  		int i;
2b36de971d25da Jonathan Kim 2022-05-09   946  
2b36de971d25da Jonathan Kim 2022-05-09   947  		for (i = 0; i < target->n_pdds; i++) {
2b36de971d25da Jonathan Kim 2022-05-09   948  			pdd = target->pdds[i];
2b36de971d25da Jonathan Kim 2022-05-09   949  			if (pdd->dev->id == source_id) {
2b36de971d25da Jonathan Kim 2022-05-09   950  				found = true;
2b36de971d25da Jonathan Kim 2022-05-09   951  				break;
2b36de971d25da Jonathan Kim 2022-05-09   952  			}
2b36de971d25da Jonathan Kim 2022-05-09   953  		}
2b36de971d25da Jonathan Kim 2022-05-09   954  
2b36de971d25da Jonathan Kim 2022-05-09   955  		if (!found) {
2b36de971d25da Jonathan Kim 2022-05-09   956  			r = -EINVAL;
2b36de971d25da Jonathan Kim 2022-05-09   957  			goto out;
2b36de971d25da Jonathan Kim 2022-05-09   958  		}
2b36de971d25da Jonathan Kim 2022-05-09   959  
2b36de971d25da Jonathan Kim 2022-05-09   960  		if (!(pdd->exception_status & KFD_EC_MASK(exception_code))) {
2b36de971d25da Jonathan Kim 2022-05-09   961  			r = -ENODATA;
2b36de971d25da Jonathan Kim 2022-05-09   962  			goto out;
2b36de971d25da Jonathan Kim 2022-05-09   963  		}
2b36de971d25da Jonathan Kim 2022-05-09   964  
2b36de971d25da Jonathan Kim 2022-05-09   965  		if (exception_code == EC_DEVICE_MEMORY_VIOLATION) {
2b36de971d25da Jonathan Kim 2022-05-09   966  			copy_size = min((size_t)(*info_size), pdd->vm_fault_exc_data_size);
2b36de971d25da Jonathan Kim 2022-05-09   967  
2b36de971d25da Jonathan Kim 2022-05-09   968  			if (copy_to_user(info, pdd->vm_fault_exc_data, copy_size)) {
2b36de971d25da Jonathan Kim 2022-05-09   969  				r = -EFAULT;
2b36de971d25da Jonathan Kim 2022-05-09   970  				goto out;
2b36de971d25da Jonathan Kim 2022-05-09   971  			}
2b36de971d25da Jonathan Kim 2022-05-09   972  			actual_info_size = pdd->vm_fault_exc_data_size;
2b36de971d25da Jonathan Kim 2022-05-09   973  			if (clear_exception) {
2b36de971d25da Jonathan Kim 2022-05-09   974  				kfree(pdd->vm_fault_exc_data);
2b36de971d25da Jonathan Kim 2022-05-09   975  				pdd->vm_fault_exc_data = NULL;
2b36de971d25da Jonathan Kim 2022-05-09   976  				pdd->vm_fault_exc_data_size = 0;
2b36de971d25da Jonathan Kim 2022-05-09   977  			}
2b36de971d25da Jonathan Kim 2022-05-09   978  		}
2b36de971d25da Jonathan Kim 2022-05-09   979  		exception_status_ptr = &pdd->exception_status;
2b36de971d25da Jonathan Kim 2022-05-09   980  	} else if (KFD_DBG_EC_TYPE_IS_PROCESS(exception_code)) {
2b36de971d25da Jonathan Kim 2022-05-09   981  		/* Per process exceptions */
2b36de971d25da Jonathan Kim 2022-05-09   982  		if (!(target->exception_status & KFD_EC_MASK(exception_code))) {
2b36de971d25da Jonathan Kim 2022-05-09   983  			r = -ENODATA;
2b36de971d25da Jonathan Kim 2022-05-09   984  			goto out;
2b36de971d25da Jonathan Kim 2022-05-09   985  		}
2b36de971d25da Jonathan Kim 2022-05-09   986  
2b36de971d25da Jonathan Kim 2022-05-09   987  		if (exception_code == EC_PROCESS_RUNTIME) {
2b36de971d25da Jonathan Kim 2022-05-09   988  			copy_size = min((size_t)(*info_size), sizeof(target->runtime_info));
2b36de971d25da Jonathan Kim 2022-05-09   989  
2b36de971d25da Jonathan Kim 2022-05-09   990  			if (copy_to_user(info, (void *)&target->runtime_info, copy_size)) {
2b36de971d25da Jonathan Kim 2022-05-09   991  				r = -EFAULT;
2b36de971d25da Jonathan Kim 2022-05-09   992  				goto out;
2b36de971d25da Jonathan Kim 2022-05-09   993  			}
2b36de971d25da Jonathan Kim 2022-05-09   994  
2b36de971d25da Jonathan Kim 2022-05-09   995  			actual_info_size = sizeof(target->runtime_info);
2b36de971d25da Jonathan Kim 2022-05-09   996  		}
2b36de971d25da Jonathan Kim 2022-05-09   997  
2b36de971d25da Jonathan Kim 2022-05-09   998  		exception_status_ptr = &target->exception_status;
2b36de971d25da Jonathan Kim 2022-05-09   999  	} else {
2b36de971d25da Jonathan Kim 2022-05-09  1000  		pr_debug("Bad exception type [%i]\n", exception_code);
2b36de971d25da Jonathan Kim 2022-05-09  1001  		r = -EINVAL;
2b36de971d25da Jonathan Kim 2022-05-09  1002  		goto out;
2b36de971d25da Jonathan Kim 2022-05-09  1003  	}
2b36de971d25da Jonathan Kim 2022-05-09  1004  
2b36de971d25da Jonathan Kim 2022-05-09  1005  	*info_size = actual_info_size;
2b36de971d25da Jonathan Kim 2022-05-09  1006  	if (clear_exception)
2b36de971d25da Jonathan Kim 2022-05-09  1007  		*exception_status_ptr &= ~KFD_EC_MASK(exception_code);
2b36de971d25da Jonathan Kim 2022-05-09  1008  out:
2b36de971d25da Jonathan Kim 2022-05-09  1009  	mutex_unlock(&target->event_mutex);
2b36de971d25da Jonathan Kim 2022-05-09  1010  	return r;
2b36de971d25da Jonathan Kim 2022-05-09  1011  }
2b36de971d25da Jonathan Kim 2022-05-09  1012  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
