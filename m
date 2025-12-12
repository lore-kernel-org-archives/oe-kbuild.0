Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FB53B8D6A
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 23:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765582281; cv=none; b=JbVIqUfCF7oikE/ePgjdAAow89DqGXJeJV0u949ya/qNGVjORKi/XiGZmtUne0lbfdK/eQGA+lKQ2lAikdn7OhNMRZ648OIndJpBSHG89334tR7KX/Is97SpICJUN3J5zCDGgXCpqocTYe/xEFYhKc9jxHw09yNI9qG3gltVKvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765582281; c=relaxed/simple;
	bh=XivVT0kNEWpN1r/9gU0lJ5lnv8yxwcAZVEbybqFuL/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YCf93vVEQX9J5hPFyBZzGcP0psK5Ennhs11DnefTqQmMMnJo36BlYbxYlKYL9lVVVIq4bDVpTYi/LrZca5za82I2BvtdpiPQf2FqOmg1ayDMY/+VGSL9/ZXPfrp/0iV9oNhIgPEhgimxmH5IFSQEvsk89y5rOs3POBhJ62gjJXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOH1nzih; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOH1nzih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765582280; x=1797118280;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XivVT0kNEWpN1r/9gU0lJ5lnv8yxwcAZVEbybqFuL/I=;
  b=gOH1nzihhw2JwQfErQbiq2EAwGyK2INlSoe7ysWzP7OhsJaIsUp2G2y7
   ZpmJK9J7JAr/kxBPngFEd3LMk5VkjNDcy792xEGhjGxjkSE102OkYUEzD
   RV1ln4bMGKRYeTM5SraomeGXCoHMn/4YzPkHtnX+XnrIBozRFS/fkRAoR
   jujDqsdjuFrvuQvVMRZw2VTwM5OAk6TbwmMTcax8Np5/nHe9dx6xxlJJd
   zBBrEWKNdOXehP/dae0ZkdfZjZ5HMG9DQYPfWu9TAAnB9YoMXwREujwx2
   oovBtkDGXYbWRm9tUgHdF+UE3EmsvARmo1tBUXN4j37v35SmSFEd3tSPH
   w==;
X-CSE-ConnectionGUID: msqIgvVARhykZcXL40Jdlw==
X-CSE-MsgGUID: 2QjV2Vz7StOTeIIXqC/74w==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67627779"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67627779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:27:41 -0800
X-CSE-ConnectionGUID: cZV5nDs2RdiIIq20IBIRFw==
X-CSE-MsgGUID: +fcNNfadR1GFiYxOwNcpcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201696120"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 15:27:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCXx-000000006lZ-08N8;
	Fri, 12 Dec 2025 23:27:37 +0000
Date: Sat, 13 Dec 2025 07:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:495
 amdgpu_vmid_alloc_reserved() warn: missing error code 'r'
Message-ID: <202512130700.eSq4XiyW-lkp@intel.com>
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
TO: "Christian König" <christian.koenig@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 90e09ea4cfd4aaaf07ababa6d8c880035587e7e9 drm/amdgpu: revert "rework reserved VMID handling" v2
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: microblaze-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130700.eSq4XiyW-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130700.eSq4XiyW-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:495 amdgpu_vmid_alloc_reserved() warn: missing error code 'r'

vim +/r +495 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c

320debca1ba3a8 Christian König 2024-01-19  475  
90e09ea4cfd4aa Christian König 2025-09-19  476  /*
90e09ea4cfd4aa Christian König 2025-09-19  477   * amdgpu_vmid_alloc_reserved - reserve a specific VMID for this vm
90e09ea4cfd4aa Christian König 2025-09-19  478   * @adev: amdgpu device structure
90e09ea4cfd4aa Christian König 2025-09-19  479   * @vm: the VM to reserve an ID for
90e09ea4cfd4aa Christian König 2025-09-19  480   * @vmhub: the VMHUB which should be used
90e09ea4cfd4aa Christian König 2025-09-19  481   *
90e09ea4cfd4aa Christian König 2025-09-19  482   * Mostly used to have a reserved VMID for debugging and SPM.
90e09ea4cfd4aa Christian König 2025-09-19  483   *
90e09ea4cfd4aa Christian König 2025-09-19  484   * Returns: 0 for success, -ENOENT if an ID is already reserved.
90e09ea4cfd4aa Christian König 2025-09-19  485   */
90e09ea4cfd4aa Christian König 2025-09-19  486  int amdgpu_vmid_alloc_reserved(struct amdgpu_device *adev, struct amdgpu_vm *vm,
620f774f4687d8 Christian König 2017-12-18  487  			       unsigned vmhub)
620f774f4687d8 Christian König 2017-12-18  488  {
e44a0fe630c58b Christian König 2022-11-25  489  	struct amdgpu_vmid_mgr *id_mgr = &adev->vm_manager.id_mgr[vmhub];
e44a0fe630c58b Christian König 2022-11-25  490  	struct amdgpu_vmid *id;
90e09ea4cfd4aa Christian König 2025-09-19  491  	int r = 0;
e44a0fe630c58b Christian König 2022-11-25  492  
90e09ea4cfd4aa Christian König 2025-09-19  493  	mutex_lock(&id_mgr->lock);
90e09ea4cfd4aa Christian König 2025-09-19  494  	if (vm->reserved_vmid[vmhub])
90e09ea4cfd4aa Christian König 2025-09-19 @495  		goto unlock;
90e09ea4cfd4aa Christian König 2025-09-19  496  	if (id_mgr->reserved_vmid) {
90e09ea4cfd4aa Christian König 2025-09-19  497  		r = -ENOENT;
90e09ea4cfd4aa Christian König 2025-09-19  498  		goto unlock;
90e09ea4cfd4aa Christian König 2025-09-19  499  	}
e44a0fe630c58b Christian König 2022-11-25  500  	/* Remove from normal round robin handling */
90e09ea4cfd4aa Christian König 2025-09-19  501  	id = list_first_entry(&id_mgr->ids_lru, struct amdgpu_vmid, list);
e44a0fe630c58b Christian König 2022-11-25  502  	list_del_init(&id->list);
90e09ea4cfd4aa Christian König 2025-09-19  503  	vm->reserved_vmid[vmhub] = id;
90e09ea4cfd4aa Christian König 2025-09-19  504  	id_mgr->reserved_vmid = true;
620f774f4687d8 Christian König 2017-12-18  505  	mutex_unlock(&id_mgr->lock);
90e09ea4cfd4aa Christian König 2025-09-19  506  
e44a0fe630c58b Christian König 2022-11-25  507  	return 0;
90e09ea4cfd4aa Christian König 2025-09-19  508  unlock:
90e09ea4cfd4aa Christian König 2025-09-19  509  	mutex_unlock(&id_mgr->lock);
90e09ea4cfd4aa Christian König 2025-09-19  510  	return r;
620f774f4687d8 Christian König 2017-12-18  511  }
620f774f4687d8 Christian König 2017-12-18  512  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
