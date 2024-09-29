Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAC114D6E6
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Sep 2024 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727606187; cv=none; b=t2hUYOiZ+2OMrrYbb0tmW2pNwwotNfdS427CJyjMk7lFeWH0NLBtCNUApLr2xzPmEWJPKmrR1W63MPiqXjA+a86mDnCeoapNuqv7bqWQGP/nJp0H9u1JXKz27c53zC7x/3bkwtID1m5iMpGVc/BnIyfw7XL4wTYGUZKkhEPLWOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727606187; c=relaxed/simple;
	bh=e1O8LG5xRhifelizeKQYPtOQPVgADufvUYDoSjdjvns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFPfvj4LSkyO6H3+ZkM3bt+sU5H4ZmOsIwZAbeM7V25hWiKOrZolJ9qUQskeqaJ+OC9dI12aErP/Fqr7RNbnJeAaz3Y30yeDtJJjDZ4oaoPXjgyUJ16FEs/1yBrQ1zwhHq7uPqbyuyfE35qoVH3rDvePC4XelPjw+XK42xN8BTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMUO10NM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMUO10NM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727606185; x=1759142185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e1O8LG5xRhifelizeKQYPtOQPVgADufvUYDoSjdjvns=;
  b=VMUO10NM/ZG4YugC25pTy5tIZpP0XofGRNR3e0IOaAeWzHPK2g3htFx+
   LWajGYD1wmdE8wDkw3pMp9jfrZTDjUUvoUfSMnscgEhfK+2BayhNe1KPO
   zw2EkdnbL0cqwwgECnWhfer9/J+8sMYQNhQM7w4tQ+AD/qT8BGLmnBiTJ
   D7vU7vQDJ+uQnrXf+zPbG0Th0IAAJXJCCuNzFMQASrFXsfudPJZgzDUDV
   D0BX6vxFKVjgINCMTnrCViO+rSK+spkYNmR59skkWi/XG7FBPPsVTTN24
   1H1EwJ1i/hIJfK8C813005cU51FczsEaXCa8p5X2EOcINY/tAeHs5IAbE
   w==;
X-CSE-ConnectionGUID: 79DbJJeyQ3W9PZcBWQSuEQ==
X-CSE-MsgGUID: Q+Jq5dH1RQ+DTOIdbzaL6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26654229"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26654229"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 03:36:25 -0700
X-CSE-ConnectionGUID: k/H6/QQATISuEf/9MudJxg==
X-CSE-MsgGUID: v+89+NGFS/63MEC2vEFYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73296691"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Sep 2024 03:36:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1surHp-000OD5-2U;
	Sun, 29 Sep 2024 10:36:21 +0000
Date: Sun, 29 Sep 2024 18:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 6/6] drm/amdgpu: use drm_file::name in
 task_info::process_desc
Message-ID: <202409291853.Iussp65w-lkp@intel.com>
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
In-Reply-To: <20240927084848.263718-7-pierre-eric.pelloux-prayer@amd.com>
References: <20240927084848.263718-7-pierre-eric.pelloux-prayer@amd.com>
TO: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
TO: dri-devel@lists.freedesktop.org
TO: christian.koenig@amd.com
TO: tursulin@igalia.com
TO: simona.vetter@ffwll.ch
TO: robdclark@gmail.com
TO: alexander.deucher@amd.com
TO: amd-gfx@lists.freedesktop.org
TO: dmitry.osipenko@collabora.com
CC: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>

Hi Pierre-Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master next-20240927]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-add-DRM_SET_CLIENT_NAME-ioctl/20240927-165116
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240927084848.263718-7-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH v4 6/6] drm/amdgpu: use drm_file::name in task_info::process_desc
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-r073-20240929 (https://download.01.org/0day-ci/archive/20240929/202409291853.Iussp65w-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409291853.Iussp65w-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2432 amdgpu_vm_set_task_info() error: we previously assumed 'vm->task_info' could be null (see line 2424)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:702 amdgpu_vm_flush() error: we previously assumed 'ring->funcs->emit_vm_flush' could be null (see line 679)
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1263 amdgpu_vm_bo_update() error: we previously assumed 'bo' could be null (see line 1203)

vim +2432 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2415  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2416  /**
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2417   * amdgpu_vm_set_task_info - Sets VMs task info.
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2418   *
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2419   * @vm: vm for which to set the info
28a1484be1acce Pierre-Eric Pelloux-Prayer 2024-09-27  2420   * @filp: drm_file instance
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2421   */
28a1484be1acce Pierre-Eric Pelloux-Prayer 2024-09-27  2422  void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2423  {
a051b5cb51400d Pierre-Eric Pelloux-Prayer 2024-09-27 @2424  	if (!vm->task_info) {
28a1484be1acce Pierre-Eric Pelloux-Prayer 2024-09-27  2425  		if (amdgpu_vm_create_task_info(vm, filp))
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2426  			return;
a051b5cb51400d Pierre-Eric Pelloux-Prayer 2024-09-27  2427  	} else if (vm->task_info->pid == current->pid) {
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2428  		return;
a051b5cb51400d Pierre-Eric Pelloux-Prayer 2024-09-27  2429  	}
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2430  
a051b5cb51400d Pierre-Eric Pelloux-Prayer 2024-09-27  2431  	/* Update task attributes. */
b8f67b9ddf4f8f Shashank Sharma            2024-01-18 @2432  	vm->task_info->pid = current->pid;
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2433  	get_task_comm(vm->task_info->task_name, current);
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2434  }
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
