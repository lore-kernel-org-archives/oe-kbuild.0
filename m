Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE7CF507
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 04:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768105369; cv=none; b=aIYSOBgdUn8Q8CGl6Zt59mnnU2DmGJcbJE4c0OP4Lcm6QmgwU6Zten+sMNU/pslhHwSUDdPTpnz9jPsMNgRYL3tOs96UmPWDDWIVIFBOzYe91oKEg8E4yNkv3REoL5MH8Mk5vv2Qcfu2OgjOxxdQBiSCFrhN3Dzm5dd1/b4NXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768105369; c=relaxed/simple;
	bh=qr/fdMRPp1ikjwXe3JquPsiAI4cqjPAtUlrF0xTzYXw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Opw3fnRSpUVr+sPqR5wNoZAqZJ3RaixvXU/iUm43hi/wcpDInZYjd+jYvQc8sR/2D6EiV2ACMFjEsOOIa0aFurlooaCfBqCrXzFZ6eAalJsAlk10lRoSYHiPgo0kQZN56vOdt6Z9l/AhI1ipZh5/FUPhpDHuwa2znarUaCIoie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwgXH17a; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwgXH17a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768105365; x=1799641365;
  h=date:from:to:cc:subject:message-id;
  bh=qr/fdMRPp1ikjwXe3JquPsiAI4cqjPAtUlrF0xTzYXw=;
  b=DwgXH17asYOTyBfliAXJRY3gDiEbhUuHDqTLEpUJ13t4GT3n/h1mTvmV
   ObSYInhAGRgJeSBP+1CZ/BnJusj4R9yVnHOmyMsey1wLkeOXANt1K+WDB
   uUFSc69S1UuKCiK/6aYsZ94KpJeazkQIrH9d7mOOSjevKnOEhHSGpltIq
   mhG8n67FIVz+YoA+SuDEdiJf+feZXQY/0/lgl6my7yAb67BpSjevrBYJy
   UBnMcJhwQ1Dy+pQqGf0FOnWsMRZ2OkyNweTRGU4mRlmQYFatJB/99ABIE
   ZTc7mGYSX4t5MyLy/CxHmRMEw5PtKC6rW4wjargbjnXWYmKiDfVSFb7lk
   Q==;
X-CSE-ConnectionGUID: UqzJJeILRCS8BwTTEQMpFw==
X-CSE-MsgGUID: poZwZMqYTjitLC5kTuErIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69354460"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69354460"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 20:22:44 -0800
X-CSE-ConnectionGUID: eyMpxUlXRACcJeIz5U3fRQ==
X-CSE-MsgGUID: vs3IjKz6Sji9oKAgpHImOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="203810011"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jan 2026 20:22:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vemyP-000000009aU-0Lkp;
	Sun, 11 Jan 2026 04:22:41 +0000
Date: Sun, 11 Jan 2026 12:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_pt.c:1465 op_check_svm_userptr() warn:
 iterator 'i' not incremented
Message-ID: <202601111213.vQ0f1Vgj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Matthew Auld <matthew.auld@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   755bc1335e3b116b702205b72eb57b7b8aef2bb2
commit: 7477c4bd20dc1aba02ef2d955591826da24e2b04 drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r072-20260109 (https://download.01.org/0day-ci/archive/20260111/202601111213.vQ0f1Vgj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601111213.vQ0f1Vgj-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:1465 op_check_svm_userptr() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:767 xe_pt_stage_bind() error: we previously assumed 'bo' could be null (see line 758)
drivers/gpu/drm/xe/xe_pt.c:2068 op_prepare() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_pt.c:2292 op_commit() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_pt.c:2493 xe_pt_update_ops_run() error: uninitialized symbol 'ifence'.
drivers/gpu/drm/xe/xe_pt.c:2498 xe_pt_update_ops_run() error: uninitialized symbol 'mfence'.

vim +/i +1465 drivers/gpu/drm/xe/xe_pt.c

dd08ebf6c3525a Matthew Brost 2023-03-30  1435  
7477c4bd20dc1a Matthew Auld  2025-08-28  1436  static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
e8babb280b5ef9 Matthew Brost 2024-07-03  1437  				struct xe_vm_pgtable_update_ops *pt_update)
e8babb280b5ef9 Matthew Brost 2024-07-03  1438  {
e8babb280b5ef9 Matthew Brost 2024-07-03  1439  	int err = 0;
dd08ebf6c3525a Matthew Brost 2023-03-30  1440  
9e978741488261 Matthew Auld  2025-08-28  1441  	xe_svm_assert_held_read(vm);
e8babb280b5ef9 Matthew Brost 2024-07-03  1442  
e8babb280b5ef9 Matthew Brost 2024-07-03  1443  	switch (op->base.op) {
e8babb280b5ef9 Matthew Brost 2024-07-03  1444  	case DRM_GPUVA_OP_MAP:
e8babb280b5ef9 Matthew Brost 2024-07-03  1445  		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
e8babb280b5ef9 Matthew Brost 2024-07-03  1446  			break;
e8babb280b5ef9 Matthew Brost 2024-07-03  1447  
e8babb280b5ef9 Matthew Brost 2024-07-03  1448  		err = vma_check_userptr(vm, op->map.vma, pt_update);
e8babb280b5ef9 Matthew Brost 2024-07-03  1449  		break;
e8babb280b5ef9 Matthew Brost 2024-07-03  1450  	case DRM_GPUVA_OP_REMAP:
e8babb280b5ef9 Matthew Brost 2024-07-03  1451  		if (op->remap.prev)
e8babb280b5ef9 Matthew Brost 2024-07-03  1452  			err = vma_check_userptr(vm, op->remap.prev, pt_update);
e8babb280b5ef9 Matthew Brost 2024-07-03  1453  		if (!err && op->remap.next)
e8babb280b5ef9 Matthew Brost 2024-07-03  1454  			err = vma_check_userptr(vm, op->remap.next, pt_update);
e8babb280b5ef9 Matthew Brost 2024-07-03  1455  		break;
e8babb280b5ef9 Matthew Brost 2024-07-03  1456  	case DRM_GPUVA_OP_UNMAP:
e8babb280b5ef9 Matthew Brost 2024-07-03  1457  		break;
e8babb280b5ef9 Matthew Brost 2024-07-03  1458  	case DRM_GPUVA_OP_PREFETCH:
7477c4bd20dc1a Matthew Auld  2025-08-28  1459  		if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va))) {
7477c4bd20dc1a Matthew Auld  2025-08-28  1460  			struct xe_svm_range *range = op->map_range.range;
7477c4bd20dc1a Matthew Auld  2025-08-28  1461  			unsigned long i;
e8babb280b5ef9 Matthew Brost 2024-07-03  1462  
7477c4bd20dc1a Matthew Auld  2025-08-28  1463  			xe_assert(vm->xe,
7477c4bd20dc1a Matthew Auld  2025-08-28  1464  				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
7477c4bd20dc1a Matthew Auld  2025-08-28 @1465  			xa_for_each(&op->prefetch_range.range, i, range) {
7477c4bd20dc1a Matthew Auld  2025-08-28  1466  				xe_svm_range_debug(range, "PRE-COMMIT");
e8babb280b5ef9 Matthew Brost 2024-07-03  1467  
7477c4bd20dc1a Matthew Auld  2025-08-28  1468  				if (!xe_svm_range_pages_valid(range)) {
7477c4bd20dc1a Matthew Auld  2025-08-28  1469  					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
7477c4bd20dc1a Matthew Auld  2025-08-28  1470  					return -ENODATA;
7477c4bd20dc1a Matthew Auld  2025-08-28  1471  				}
7477c4bd20dc1a Matthew Auld  2025-08-28  1472  			}
7477c4bd20dc1a Matthew Auld  2025-08-28  1473  		} else {
7477c4bd20dc1a Matthew Auld  2025-08-28  1474  			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
7477c4bd20dc1a Matthew Auld  2025-08-28  1475  		}
7477c4bd20dc1a Matthew Auld  2025-08-28  1476  		break;
7477c4bd20dc1a Matthew Auld  2025-08-28  1477  #if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
7477c4bd20dc1a Matthew Auld  2025-08-28  1478  	case DRM_GPUVA_OP_DRIVER:
7477c4bd20dc1a Matthew Auld  2025-08-28  1479  		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
7477c4bd20dc1a Matthew Auld  2025-08-28  1480  			struct xe_svm_range *range = op->map_range.range;
e8babb280b5ef9 Matthew Brost 2024-07-03  1481  
7477c4bd20dc1a Matthew Auld  2025-08-28  1482  			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
e8babb280b5ef9 Matthew Brost 2024-07-03  1483  
7477c4bd20dc1a Matthew Auld  2025-08-28  1484  			xe_svm_range_debug(range, "PRE-COMMIT");
e8babb280b5ef9 Matthew Brost 2024-07-03  1485  
7477c4bd20dc1a Matthew Auld  2025-08-28  1486  			if (!xe_svm_range_pages_valid(range)) {
7477c4bd20dc1a Matthew Auld  2025-08-28  1487  				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
7477c4bd20dc1a Matthew Auld  2025-08-28  1488  				return -EAGAIN;
7477c4bd20dc1a Matthew Auld  2025-08-28  1489  			}
e8babb280b5ef9 Matthew Brost 2024-07-03  1490  		}
7477c4bd20dc1a Matthew Auld  2025-08-28  1491  		break;
7477c4bd20dc1a Matthew Auld  2025-08-28  1492  #endif
7477c4bd20dc1a Matthew Auld  2025-08-28  1493  	default:
7477c4bd20dc1a Matthew Auld  2025-08-28  1494  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
e8babb280b5ef9 Matthew Brost 2024-07-03  1495  	}
e8babb280b5ef9 Matthew Brost 2024-07-03  1496  
e8babb280b5ef9 Matthew Brost 2024-07-03  1497  	return err;
e8babb280b5ef9 Matthew Brost 2024-07-03  1498  }
dd08ebf6c3525a Matthew Brost 2023-03-30  1499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
