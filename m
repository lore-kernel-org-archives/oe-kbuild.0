Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986ABF9E8
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890531; cv=none; b=i4mzixcaAVUCWsxahoFXjO9XSGq44zkYex9tuj56Ixb1AasT5KxGfRfSIm4vgA9VxOBNu6pEA2P1+1BPt/2IaQ5gIklm1ASVlWWII9iXWXaxut4KZgZfA1MbmomkVKleBpJpeB+bWPQvNTnCLZbPDtadZUYFbu2txGEJ2XnX3rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890531; c=relaxed/simple;
	bh=6+vk2CKmk38Kvuqa3+tdbwM8nLgfUu8xAlqrD4lUgdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=chSD4HiuzRx5IDMxr6R1SqZ2Ooovf5XFWIibBcF3SJbQAPqCyhhEfDvLmS/FiGlKKo1af0nVKK+VlcJtgVDopqa7Jyn4oFhqeWxiwnBmdhF95EyTHly9J7DmQipcbVH6Ws4czLmu5XWfSw5s6H6fjPzKIrHzG+i2ayJS274qh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6KYBiqZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6KYBiqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890530; x=1797426530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6+vk2CKmk38Kvuqa3+tdbwM8nLgfUu8xAlqrD4lUgdo=;
  b=m6KYBiqZlonMCGoMRgFAs3+SvxTy+uvJYWY4ZvOwjD7jTYSlB5q5Yr+Y
   4y5iWc6M988/gwomXw/j+diKf1fQfsI6EY4dZ48+s3aO5OcS6ps7tpgZZ
   kCZRYqJevcBK5hwf0Bm0tSpnzLsp5TN8ebCLo0MsIkT7vrIVh46HPbq7t
   5q1BIRjs2aiHU/ahperpmyD+esgaAJq7UC9D2+CZ9jI69J/W5EvB4kCLV
   mMuFn9RMqbTI5DLKUfJwLQT0GtXBnBvfZUKQSwO4cGBpmCDf5duWh0ubY
   z3+p+Mj7Fu7F667NvMv7HzNq6Vii6+E3xW3lqMVMJI4TAB5TS/sD/bjxV
   g==;
X-CSE-ConnectionGUID: Z0M1AGJURGG9f13pzGyZaw==
X-CSE-MsgGUID: 18Pi/O7CToSZuPi+As+4Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70385457"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="70385457"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:08:49 -0800
X-CSE-ConnectionGUID: VJFNWzghQPmGawGUaZ1d4A==
X-CSE-MsgGUID: jprxtk4zQdqAqzvSJ6eKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197108835"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 16 Dec 2025 05:08:46 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVUn0-000000003C8-3pBJ;
	Tue, 16 Dec 2025 13:08:33 +0000
Date: Tue, 16 Dec 2025 21:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:amd-staging-drm-next 2547/2632]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3165
 kfd_ioctl_create_process() warn: variable dereferenced before check 'p' (see
 line 3162)
Message-ID: <202512162104.8deuIhSW-lkp@intel.com>
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
TO: Zhu Lingshan <lingshan.zhu@amd.com>
CC: Linux Infrastructure <z1.linuxinfra@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e4a7a6e594f81347a95c965ce5e5d07ddea16913
commit: eb39a457ba5456fbc31d9bc0765af3fc00901cfc [2547/2632] amdkfd: introduce new ioctl AMDKFD_IOC_CREATE_PROCESS
:::::: branch date: 6 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251216/202512162104.8deuIhSW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512162104.8deuIhSW-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3165 kfd_ioctl_create_process() warn: variable dereferenced before check 'p' (see line 3162)

vim +/p +3165 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c

4f98cf2baf9fae Jonathan Kim 2022-03-02  3152  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3153  /* userspace programs need to invoke this ioctl explicitly on a FD to
eb39a457ba5456 Zhu Lingshan 2025-08-21  3154   * create a secondary kfd_process which replacing its primary kfd_process
eb39a457ba5456 Zhu Lingshan 2025-08-21  3155   */
eb39a457ba5456 Zhu Lingshan 2025-08-21  3156  static int kfd_ioctl_create_process(struct file *filep, struct kfd_process *p, void *data)
eb39a457ba5456 Zhu Lingshan 2025-08-21  3157  {
eb39a457ba5456 Zhu Lingshan 2025-08-21  3158  	struct kfd_process *process;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3159  	int ret;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3160  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3161  	/* Each FD owns only one kfd_process */
eb39a457ba5456 Zhu Lingshan 2025-08-21 @3162  	if (p->context_id != KFD_CONTEXT_ID_PRIMARY)
eb39a457ba5456 Zhu Lingshan 2025-08-21  3163  		return -EINVAL;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3164  
eb39a457ba5456 Zhu Lingshan 2025-08-21 @3165  	if (!filep->private_data || !p)
eb39a457ba5456 Zhu Lingshan 2025-08-21  3166  		return -EINVAL;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3167  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3168  	mutex_lock(&kfd_processes_mutex);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3169  	if (p != filep->private_data) {
eb39a457ba5456 Zhu Lingshan 2025-08-21  3170  		mutex_unlock(&kfd_processes_mutex);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3171  		return -EINVAL;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3172  	}
eb39a457ba5456 Zhu Lingshan 2025-08-21  3173  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3174  	process = create_process(current, false);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3175  	if (IS_ERR(process)) {
eb39a457ba5456 Zhu Lingshan 2025-08-21  3176  		mutex_unlock(&kfd_processes_mutex);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3177  		return PTR_ERR(process);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3178  	}
eb39a457ba5456 Zhu Lingshan 2025-08-21  3179  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3180  	filep->private_data = process;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3181  	mutex_unlock(&kfd_processes_mutex);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3182  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3183  	ret = kfd_create_process_sysfs(process);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3184  	if (ret)
eb39a457ba5456 Zhu Lingshan 2025-08-21  3185  		pr_warn("Failed to create sysfs entry for the kfd_process");
eb39a457ba5456 Zhu Lingshan 2025-08-21  3186  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3187  	/* Each open() increases kref of the primary kfd_process,
eb39a457ba5456 Zhu Lingshan 2025-08-21  3188  	 * so we need to reduce it here when we create a new secondary process replacing it
eb39a457ba5456 Zhu Lingshan 2025-08-21  3189  	 */
eb39a457ba5456 Zhu Lingshan 2025-08-21  3190  	kfd_unref_process(p);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3191  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3192  	return 0;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3193  }
eb39a457ba5456 Zhu Lingshan 2025-08-21  3194  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
