Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F241F2BAD
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 19:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765654878; cv=none; b=uH5f/4X52+5Wvtg54to4t3aYhARJGzglM7QKJI+V0HzUsDh2OtsAez9L6fgPFuBbpUgRKZqrryo7+QfAHPaFQFETGJ/gJvW6VVVcFPFRVe2eX4yTjGwPQWpGgUte+ERW0DJDo7EVmgxK8n+/2RHdArFlb0rU8ulXfKX7fT8waeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765654878; c=relaxed/simple;
	bh=X1On21rUfQTGLXmVW5iA1xS3hkdGWXkX90XAq2iTyyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mesH9tq5hME8IJrENnQlryhRnnYzIEQCoZuwLlboMqFBFBp55xQWxRaUIRaQb8H8W+7ChjjQ4K5RYtd4qRclgC+pMRp/nnVtfmqf5tXnixD+tpBySau2P1tJ1/lYh1AEO+rPzEaqTeyPmomIGxJFuGHm3slC3n2DdwB8w6yWfvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sxwri4Lu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sxwri4Lu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765654877; x=1797190877;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X1On21rUfQTGLXmVW5iA1xS3hkdGWXkX90XAq2iTyyY=;
  b=Sxwri4LuKtzHHiEKVm+SGkm0WdihgxdMftbZ5eaIbkL89g6zC9f8FFgX
   uO4JKbblxPhZ8lZAkB0GZErpagKN8bJPcOJYSTjOwcQNvlYRy4gQRGl/D
   WnmzRzh1i7/8bUGRZbU0OpACOD26UE6Mna8gWFDjGT89JUHSCKJSePaBo
   8VvKCGod2pEVCLfo5rTU4EBX7u0A5C3TAQnbRTBsB+WXrdvaN4kHGXt+s
   2nWglQlk7t2Xxcl8IJD/LIoC1D+T2KOKyZmKpVZ7qSfHWALLJ7ys3Cwng
   d1PS6rd1e8Ua99gKih1VUQqH4f0/LH8uGeYbofrJt/PtU3V2FtrTv+uDL
   Q==;
X-CSE-ConnectionGUID: lPvJ+EdcQ8WqmEHcSUx3iA==
X-CSE-MsgGUID: 3ZxNyxafRVyoaoC0DZ77Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78736349"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78736349"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:41:17 -0800
X-CSE-ConnectionGUID: H8WZGKvqSLeC91bJz4papQ==
X-CSE-MsgGUID: f85SN18kQxqZXxjHoRxztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201776738"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 11:41:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVUO-0000000087N-2oTB;
	Sat, 13 Dec 2025 19:41:12 +0000
Date: Sun, 14 Dec 2025 03:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_vm.c:3230 vm_bind_ioctl_ops_execute() error:
 uninitialized symbol 'fence'.
Message-ID: <202512140339.M7yiIcbs-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 8f25e5abcbfb9cbcd923021774f2e785db3f7f55 drm/xe: Convert existing drm_exec transactions for exhaustive eviction
date:   3 months ago
:::::: branch date: 80 minutes ago
:::::: commit date: 3 months ago
config: s390-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140339.M7yiIcbs-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140339.M7yiIcbs-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:3230 vm_bind_ioctl_ops_execute() error: uninitialized symbol 'fence'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2408 new_vma() error: uninitialized symbol 'vma'.
drivers/gpu/drm/xe/xe_vm.c:2858 prefetch_ranges() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_vm.c:2936 op_lock_and_prep() error: uninitialized symbol 'region'.
drivers/gpu/drm/xe/xe_vm.c:3866 xe_vm_range_tilemask_tlb_inval() error: uninitialized symbol 'err'.
drivers/gpu/drm/xe/xe_vm.c:4081 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/xe/xe_vm.c:4215 xe_vm_alloc_vma() error: uninitialized symbol 'default_pat'.

vim +/fence +3230 drivers/gpu/drm/xe/xe_vm.c

61e3270ef9610a Matthew Brost          2024-04-24  3196  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  3197  static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
701109f2e3a45b Matthew Brost          2024-04-24  3198  						   struct xe_vma_ops *vops)
f3e9b1f4345874 Matthew Brost          2023-09-14  3199  {
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3200  	struct xe_validation_ctx ctx;
77f2ef3f16f511 Matthew Brost          2024-04-24  3201  	struct drm_exec exec;
75192758d64022 Matthew Brost          2024-04-24  3202  	struct dma_fence *fence;
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3203  	int err = 0;
f3e9b1f4345874 Matthew Brost          2023-09-14  3204  
f3e9b1f4345874 Matthew Brost          2023-09-14  3205  	lockdep_assert_held_write(&vm->lock);
f3e9b1f4345874 Matthew Brost          2023-09-14  3206  
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3207  	xe_validation_guard(&ctx, &vm->xe->val, &exec,
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3208  			    ((struct xe_val_flags) {
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3209  				    .interruptible = true,
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3210  				    .exec_ignore_duplicates = true,
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3211  			    }), err) {
701109f2e3a45b Matthew Brost          2024-04-24  3212  		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
77f2ef3f16f511 Matthew Brost          2024-04-24  3213  		drm_exec_retry_on_contention(&exec);
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3214  		xe_validation_retry_on_oom(&ctx, &err);
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3215  		if (err)
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3216  			return ERR_PTR(err);
77f2ef3f16f511 Matthew Brost          2024-04-24  3217  
0131514f97890c Thomas Hellström       2025-09-08  3218  		xe_vm_set_validation_exec(vm, &exec);
4dbbe4579490b4 Matthew Brost          2024-04-24  3219  		fence = ops_execute(vm, vops);
0131514f97890c Thomas Hellström       2025-09-08  3220  		xe_vm_set_validation_exec(vm, NULL);
b43e864af0d4e7 Matthew Brost          2025-03-05  3221  		if (IS_ERR(fence)) {
b43e864af0d4e7 Matthew Brost          2025-03-05  3222  			if (PTR_ERR(fence) == -ENODATA)
b43e864af0d4e7 Matthew Brost          2025-03-05  3223  				vm_bind_ioctl_ops_fini(vm, vops, NULL);
8f25e5abcbfb9c Thomas Hellström       2025-09-08  3224  			return fence;
b43e864af0d4e7 Matthew Brost          2025-03-05  3225  		}
e8babb280b5ef9 Matthew Brost          2024-07-03  3226  
e8babb280b5ef9 Matthew Brost          2024-07-03  3227  		vm_bind_ioctl_ops_fini(vm, vops, fence);
77f2ef3f16f511 Matthew Brost          2024-04-24  3228  	}
f3e9b1f4345874 Matthew Brost          2023-09-14  3229  
8f25e5abcbfb9c Thomas Hellström       2025-09-08 @3230  	return err ? ERR_PTR(err) : fence;
f3e9b1f4345874 Matthew Brost          2023-09-14  3231  }
9d42476f71a9a0 Francois Dugast        2024-11-13  3232  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
f3e9b1f4345874 Matthew Brost          2023-09-14  3233  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
