Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7431AEACE
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Feb 2025 02:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739587611; cv=none; b=CQ9l0e42lI3tYTEPXLArR4WRLPmT1r0CFxjO7RcMvYmuJYllZ0cvpGkTefP68R9ZfFTarlk+fChm+4x7KDF1+5UWCZlIgrxyOEg14ad3fEtJPIeSlZQAE6brMHSf5IU8pJ68RJN0OJkU4tNYjrJv9PjEpzJw6QEnFF6yE5GK9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739587611; c=relaxed/simple;
	bh=4rYU5+CoN8F3xufXih3jArlmOmX60QeFAGkoo76hUPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Djctrlm0QBZ7Zxqg7xYYrzdopKLjvXdgzzvH1a4Sv8+BenwW2344FXAT8Own9iJxa7FmmnOoG9HYCPSdoKO820NZwxGbMHWzwJ/wgIzoZlJDYUFQArWryrjJKtI101sl5+mVKCjQ9jzbFhoSp1bX75rR/URybxDk6P5qmt/whbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfLMjwux; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfLMjwux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739587610; x=1771123610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4rYU5+CoN8F3xufXih3jArlmOmX60QeFAGkoo76hUPI=;
  b=NfLMjwuxSz7396CVCbSG5UzbzGdSK6gGxn4D5NA4ecjoQnpehDJvKC0v
   EyYKNIaLZwnClu4qjHL3VQMIXsaZJ3yncaQaFFxBq3+Nmf07iGsitU6Gu
   GSZRQ3HQuQ5XZa3a3oJXKgX07hhMnvTLK6g1zLCbezK4m5VC/gLrhfpCd
   dUUBzNM808UwL8ehCo9LAGAimklRCj1lwB/21w/mivnAsBAwMDnQeZh0b
   +LH8FZ5gjcjqeE/RFbyXRwmhfAxE/Wci23A+6GV1jptx5GVVASrVGDp3Q
   N17CAPfjuMOhCT7fXtTqrne3NudfhHpMqovIIzC7kNe/nVhs9kWGppklU
   w==;
X-CSE-ConnectionGUID: SGJXtdCBTaKbG8UnILXbxw==
X-CSE-MsgGUID: 3YXdYnsMTw+i/5JbDw7PAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51326376"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="51326376"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 18:46:49 -0800
X-CSE-ConnectionGUID: c0CIEXJ0RzyIvKJwB1Gsxw==
X-CSE-MsgGUID: /9cKH2kvQnOuwqQtS+qQZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="113476976"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2025 18:46:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj8Cb-001ARP-0v;
	Sat, 15 Feb 2025 02:46:45 +0000
Date: Sat, 15 Feb 2025 10:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1018/4011] drivers/gpu/drm/xe/xe_vm.c:2721
 vm_bind_ioctl_ops_execute() error: uninitialized symbol 'fence'.
Message-ID: <202502151025.zQcv8Qnb-lkp@intel.com>
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
TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: dcdd6b84d9acaa0794c29de7024cfdb20cfd7b92 [1018/4011] drm/xe/pxp: Allocate PXP execution resources
:::::: branch date: 17 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-141-20250214 (https://download.01.org/0day-ci/archive/20250215/202502151025.zQcv8Qnb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502151025.zQcv8Qnb-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2721 vm_bind_ioctl_ops_execute() error: uninitialized symbol 'fence'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:2040 new_vma() error: we previously assumed 'bo' could be null (see line 2014)
drivers/gpu/drm/xe/xe_vm.c:3457 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

vim +/fence +2721 drivers/gpu/drm/xe/xe_vm.c

61e3270ef9610a Matthew Brost          2024-04-24  2692  
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  2693  static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
701109f2e3a45b Matthew Brost          2024-04-24  2694  						   struct xe_vma_ops *vops)
f3e9b1f4345874 Matthew Brost          2023-09-14  2695  {
77f2ef3f16f511 Matthew Brost          2024-04-24  2696  	struct drm_exec exec;
75192758d64022 Matthew Brost          2024-04-24  2697  	struct dma_fence *fence;
f3e9b1f4345874 Matthew Brost          2023-09-14  2698  	int err;
f3e9b1f4345874 Matthew Brost          2023-09-14  2699  
f3e9b1f4345874 Matthew Brost          2023-09-14  2700  	lockdep_assert_held_write(&vm->lock);
f3e9b1f4345874 Matthew Brost          2023-09-14  2701  
77f2ef3f16f511 Matthew Brost          2024-04-24  2702  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
77f2ef3f16f511 Matthew Brost          2024-04-24  2703  		      DRM_EXEC_IGNORE_DUPLICATES, 0);
77f2ef3f16f511 Matthew Brost          2024-04-24  2704  	drm_exec_until_all_locked(&exec) {
701109f2e3a45b Matthew Brost          2024-04-24  2705  		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
77f2ef3f16f511 Matthew Brost          2024-04-24  2706  		drm_exec_retry_on_contention(&exec);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  2707  		if (err) {
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  2708  			fence = ERR_PTR(err);
77f2ef3f16f511 Matthew Brost          2024-04-24  2709  			goto unlock;
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  2710  		}
77f2ef3f16f511 Matthew Brost          2024-04-24  2711  
4dbbe4579490b4 Matthew Brost          2024-04-24  2712  		fence = ops_execute(vm, vops);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29  2713  		if (IS_ERR(fence))
77f2ef3f16f511 Matthew Brost          2024-04-24  2714  			goto unlock;
e8babb280b5ef9 Matthew Brost          2024-07-03  2715  
e8babb280b5ef9 Matthew Brost          2024-07-03  2716  		vm_bind_ioctl_ops_fini(vm, vops, fence);
77f2ef3f16f511 Matthew Brost          2024-04-24  2717  	}
f3e9b1f4345874 Matthew Brost          2023-09-14  2718  
77f2ef3f16f511 Matthew Brost          2024-04-24  2719  unlock:
77f2ef3f16f511 Matthew Brost          2024-04-24  2720  	drm_exec_fini(&exec);
dcdd6b84d9acaa Daniele Ceraolo Spurio 2025-01-29 @2721  	return fence;
f3e9b1f4345874 Matthew Brost          2023-09-14  2722  }
9d42476f71a9a0 Francois Dugast        2024-11-13  2723  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
f3e9b1f4345874 Matthew Brost          2023-09-14  2724  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
