Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA34334165E
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Sep 2025 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010350; cv=none; b=iMrhmpZejiusgaQHkdhJyj0MceEDCGWL68koWb4CJ008nA6zQQZrqbND8vap3+chEQejR+ni9w2NF9WGvmqfNrG7vrcA6BRocy4Ok1YBG1jUEo5got8Ax0NUU89yEfnS4s7ETgkfD7Z2jgOIcIqfCoz9KasXDT9LKPlb7JlWVtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010350; c=relaxed/simple;
	bh=YaUX587lghrIXGUEl/ww4YEw7dkFYCxhfBH7l9gLLQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dno6BxJwXrX8BitTIqn/2Vor5ChfMa7HQdEPy7u30rYNqLhBMhQTDgNAppvp9ZNhyEcQDwpN9jsZ9mCxK1Vq2KUhSnoW5IoqngYrRQlIfXl7IGa28acJXGn+qHdeVOg1g/diWIQsfB/x1kHFmBRro+wMOgbgN1b7MOXH6tIfDx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nga1KT84; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nga1KT84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757010349; x=1788546349;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YaUX587lghrIXGUEl/ww4YEw7dkFYCxhfBH7l9gLLQM=;
  b=nga1KT84+d4WA2l5x9oU8jarouxiOsHFLnSE6iA58iO+wj5NdOkBf551
   5R6RZsOH1Bd7Ke8R4CCrqzkAcbTBCZf9swhhD+/Yt1VpxptugGjhbXAqY
   IxpSWRTa3P8R1SOdpOeRxbsulhg3y3/sySthEj1li6W4zT5OsXmBqyw7O
   EwdJ/NiPhdq5KbabkxZZyjrQWvIvJcYLEe/lVIMpe0zHQMnhGrvI8LYbF
   2E5Poo20uD5lBqq4cLyR4qfTiRAVEBkiZQmSqm++BiqF5aZk1AcLI6Gyk
   jyuLTnufzB7ICl8BU/KVNZfHTH1tLFvS40XRiUz3ufsXIGtfXuwmlRBaD
   w==;
X-CSE-ConnectionGUID: Gn2ze7I2RDaYAaii0XweFQ==
X-CSE-MsgGUID: RvmKVCaBQz2Ol5P8oS1JwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76815851"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="76815851"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 11:25:47 -0700
X-CSE-ConnectionGUID: w35a4e4MQmW9hctyGxYQug==
X-CSE-MsgGUID: P24rT6P6Qge25ErtGJzwQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="176305162"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2025 11:25:46 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuEeV-0005cY-2P;
	Thu, 04 Sep 2025 18:25:43 +0000
Date: Fri, 5 Sep 2025 02:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5321/6355]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:1103 amdgpu_gem_list_handles_ioctl()
 warn: maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202509050217.hiCF4RS1-lkp@intel.com>
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
TO: David Francis <David.Francis@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ac65880ebca1b68495bd8704263b26c050ac010
commit: f9db1fc52ceb42f4a18506693349316f5e209ba6 [5321/6355] drm/amdgpu: Add ioctl to get all gem handles for a process
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250904 (https://download.01.org/0day-ci/archive/20250905/202509050217.hiCF4RS1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509050217.hiCF4RS1-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:1103 amdgpu_gem_list_handles_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:139 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be null (see line 124)

vim +1103 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

d38ceaf99ed015 Alex Deucher  2015-04-20  1026  
f9db1fc52ceb42 David Francis 2025-06-16  1027  /**
f9db1fc52ceb42 David Francis 2025-06-16  1028   * drm_amdgpu_gem_list_handles_ioctl - get information about a process' buffer objects
f9db1fc52ceb42 David Francis 2025-06-16  1029   *
f9db1fc52ceb42 David Francis 2025-06-16  1030   * @dev: drm device pointer
f9db1fc52ceb42 David Francis 2025-06-16  1031   * @data: drm_amdgpu_gem_list_handles
f9db1fc52ceb42 David Francis 2025-06-16  1032   * @filp: drm file pointer
f9db1fc52ceb42 David Francis 2025-06-16  1033   *
f9db1fc52ceb42 David Francis 2025-06-16  1034   * num_entries is set as an input to the size of the entries array.
f9db1fc52ceb42 David Francis 2025-06-16  1035   * num_entries is sent back as output as the number of bos in the process.
f9db1fc52ceb42 David Francis 2025-06-16  1036   * If that number is larger than the size of the array, the ioctl must
f9db1fc52ceb42 David Francis 2025-06-16  1037   * be retried.
f9db1fc52ceb42 David Francis 2025-06-16  1038   *
f9db1fc52ceb42 David Francis 2025-06-16  1039   * Returns:
f9db1fc52ceb42 David Francis 2025-06-16  1040   * 0 for success, -errno for errors.
f9db1fc52ceb42 David Francis 2025-06-16  1041   */
f9db1fc52ceb42 David Francis 2025-06-16  1042  int amdgpu_gem_list_handles_ioctl(struct drm_device *dev, void *data,
f9db1fc52ceb42 David Francis 2025-06-16  1043  				  struct drm_file *filp)
f9db1fc52ceb42 David Francis 2025-06-16  1044  {
f9db1fc52ceb42 David Francis 2025-06-16  1045  	struct drm_amdgpu_gem_list_handles *args = data;
f9db1fc52ceb42 David Francis 2025-06-16  1046  	struct drm_amdgpu_gem_list_handles_entry *bo_entries;
f9db1fc52ceb42 David Francis 2025-06-16  1047  	struct drm_gem_object *gobj;
f9db1fc52ceb42 David Francis 2025-06-16  1048  	int id, ret = 0;
f9db1fc52ceb42 David Francis 2025-06-16  1049  	int bo_index = 0;
f9db1fc52ceb42 David Francis 2025-06-16  1050  	int num_bos = 0;
f9db1fc52ceb42 David Francis 2025-06-16  1051  
f9db1fc52ceb42 David Francis 2025-06-16  1052  	spin_lock(&filp->table_lock);
f9db1fc52ceb42 David Francis 2025-06-16  1053  	idr_for_each_entry(&filp->object_idr, gobj, id)
f9db1fc52ceb42 David Francis 2025-06-16  1054  		num_bos += 1;
f9db1fc52ceb42 David Francis 2025-06-16  1055  	spin_unlock(&filp->table_lock);
f9db1fc52ceb42 David Francis 2025-06-16  1056  
f9db1fc52ceb42 David Francis 2025-06-16  1057  	if (args->num_entries < num_bos) {
f9db1fc52ceb42 David Francis 2025-06-16  1058  		args->num_entries = num_bos;
f9db1fc52ceb42 David Francis 2025-06-16  1059  		return 0;
f9db1fc52ceb42 David Francis 2025-06-16  1060  	}
f9db1fc52ceb42 David Francis 2025-06-16  1061  
f9db1fc52ceb42 David Francis 2025-06-16  1062  	if (num_bos == 0) {
f9db1fc52ceb42 David Francis 2025-06-16  1063  		args->num_entries = 0;
f9db1fc52ceb42 David Francis 2025-06-16  1064  		return 0;
f9db1fc52ceb42 David Francis 2025-06-16  1065  	}
f9db1fc52ceb42 David Francis 2025-06-16  1066  
f9db1fc52ceb42 David Francis 2025-06-16  1067  	bo_entries = kvcalloc(num_bos, sizeof(*bo_entries), GFP_KERNEL);
f9db1fc52ceb42 David Francis 2025-06-16  1068  	if (!bo_entries)
f9db1fc52ceb42 David Francis 2025-06-16  1069  		return -ENOMEM;
f9db1fc52ceb42 David Francis 2025-06-16  1070  
f9db1fc52ceb42 David Francis 2025-06-16  1071  	spin_lock(&filp->table_lock);
f9db1fc52ceb42 David Francis 2025-06-16  1072  	idr_for_each_entry(&filp->object_idr, gobj, id) {
f9db1fc52ceb42 David Francis 2025-06-16  1073  		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
f9db1fc52ceb42 David Francis 2025-06-16  1074  		struct drm_amdgpu_gem_list_handles_entry *bo_entry;
f9db1fc52ceb42 David Francis 2025-06-16  1075  
f9db1fc52ceb42 David Francis 2025-06-16  1076  		if (bo_index >= num_bos) {
f9db1fc52ceb42 David Francis 2025-06-16  1077  			ret = -EAGAIN;
f9db1fc52ceb42 David Francis 2025-06-16  1078  			break;
f9db1fc52ceb42 David Francis 2025-06-16  1079  		}
f9db1fc52ceb42 David Francis 2025-06-16  1080  
f9db1fc52ceb42 David Francis 2025-06-16  1081  		bo_entry = &bo_entries[bo_index];
f9db1fc52ceb42 David Francis 2025-06-16  1082  
f9db1fc52ceb42 David Francis 2025-06-16  1083  		bo_entry->size = amdgpu_bo_size(bo);
f9db1fc52ceb42 David Francis 2025-06-16  1084  		bo_entry->alloc_flags = bo->flags & AMDGPU_GEM_CREATE_SETTABLE_MASK;
f9db1fc52ceb42 David Francis 2025-06-16  1085  		bo_entry->preferred_domains = bo->preferred_domains;
f9db1fc52ceb42 David Francis 2025-06-16  1086  		bo_entry->gem_handle = id;
f9db1fc52ceb42 David Francis 2025-06-16  1087  		bo_entry->alignment = bo->tbo.page_alignment;
f9db1fc52ceb42 David Francis 2025-06-16  1088  
f9db1fc52ceb42 David Francis 2025-06-16  1089  		if (bo->tbo.base.import_attach)
f9db1fc52ceb42 David Francis 2025-06-16  1090  			bo_entry->flags |= AMDGPU_GEM_LIST_HANDLES_FLAG_IS_IMPORT;
f9db1fc52ceb42 David Francis 2025-06-16  1091  
f9db1fc52ceb42 David Francis 2025-06-16  1092  		bo_index += 1;
f9db1fc52ceb42 David Francis 2025-06-16  1093  	}
f9db1fc52ceb42 David Francis 2025-06-16  1094  	spin_unlock(&filp->table_lock);
f9db1fc52ceb42 David Francis 2025-06-16  1095  
f9db1fc52ceb42 David Francis 2025-06-16  1096  	args->num_entries = bo_index;
f9db1fc52ceb42 David Francis 2025-06-16  1097  
f9db1fc52ceb42 David Francis 2025-06-16  1098  	if (!ret)
f9db1fc52ceb42 David Francis 2025-06-16  1099  		ret = copy_to_user(u64_to_user_ptr(args->entries), bo_entries, num_bos * sizeof(*bo_entries));
f9db1fc52ceb42 David Francis 2025-06-16  1100  
f9db1fc52ceb42 David Francis 2025-06-16  1101  	kvfree(bo_entries);
f9db1fc52ceb42 David Francis 2025-06-16  1102  
f9db1fc52ceb42 David Francis 2025-06-16 @1103  	return ret;
f9db1fc52ceb42 David Francis 2025-06-16  1104  }
f9db1fc52ceb42 David Francis 2025-06-16  1105  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
