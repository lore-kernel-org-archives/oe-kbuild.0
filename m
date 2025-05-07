Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0903D14A639
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630721; cv=none; b=mUe6X94cGUKlJy/Zwa0ZW7hTBUPHwDEkO1WWEHcq4GKkwlYDVAet/L3tMt3U8r0Ojdsb1DoEtpBooB8gQAKhWY2iOJmBpsQoQKtF6gwZ8HDzNf6sAg20WeSdCTobl5xrNErR0knHcbzKtwtmqSpWuinTC4mRwTaDqfnRr8OqsbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630721; c=relaxed/simple;
	bh=92edab/gsie/ZsRiZ9zQEryFDdRgiKu2JVuHLeCeW9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hx+Vp9/cSnsMAprrb5LWBksC02ZcRhm/o2mUb7I91eTMCUYS/oTnFBWRrliOSdNDZ3tMZoNyOVpCWUlBDNm6L+hFcWV2UA95eTnqiXUNaaBV3ZejXHb3WLMdqr21+IUEaGtEUeSbg79OF89G+vKXeadt5Ww56AnNjByKQv29oVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8WnHXmk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8WnHXmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630719; x=1778166719;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=92edab/gsie/ZsRiZ9zQEryFDdRgiKu2JVuHLeCeW9I=;
  b=I8WnHXmk3GzAD1yTUhFAH+ePSGwzIBzQYMYixmZrD2Rf49gVMIrqsVvk
   sgpUPqWVxptw2Re+VESy4tObEcWkfk8la3b/x74AygjnI8qYKtrSFaIgg
   APwnncqdMVxzXmR0oOjyvGJDuK8mZ+9zqxBmRZ7iu/rys/pjhpVb63IV5
   DugCTggu+iQZQfu/1BZe7COtKHbYvea3FyS79+RlgcCrV75T7iXrYUK5S
   2j4q0g45ta1EBwWx5oxgZIAGmZKN0mMSU20OxwwmpJihi9g/Gi6yxraLH
   vOnNkTfqs+mPmp9WsRdI3WxJKLlHZBKH6qG27oOtzhQTXLXw2pkUh/Qan
   A==;
X-CSE-ConnectionGUID: RQtd5WlGRHu469slpM9DPQ==
X-CSE-MsgGUID: g7iv+JMeTH+zeSoWEhlkSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48076772"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48076772"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:11:58 -0700
X-CSE-ConnectionGUID: fhNeteMaTke6SjPR4WM+sw==
X-CSE-MsgGUID: TDM4n7pWTierX0W/Q+R7Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140739556"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 08:11:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCgR9-000836-11;
	Wed, 07 May 2025 15:11:55 +0000
Date: Wed, 7 May 2025 23:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1827/9308]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:100 amdgpu_gem_update_bo_mapping()
 error: we previously assumed 'bo_va' could be null (see line 85)
Message-ID: <202505072330.5TII4xep-lkp@intel.com>
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
TO: Arvind Yadav <arvind.yadav@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>
CC: Shashank Sharma <shashank.sharma@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 70773bef4e091ff6d2a91e3dfb4f29013eb81f1f [1827/9308] drm/amdgpu: update userqueue BOs and PDs
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20250410 (https://download.01.org/0day-ci/archive/20250507/202505072330.5TII4xep-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505072330.5TII4xep-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:100 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be null (see line 85)

vim +/bo_va +100 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

70773bef4e091f Arvind Yadav 2024-09-25   75  
70773bef4e091f Arvind Yadav 2024-09-25   76  static void
70773bef4e091f Arvind Yadav 2024-09-25   77  amdgpu_gem_update_bo_mapping(struct drm_file *filp,
70773bef4e091f Arvind Yadav 2024-09-25   78  			     struct amdgpu_bo_va *bo_va,
70773bef4e091f Arvind Yadav 2024-09-25   79  			     uint32_t operation,
70773bef4e091f Arvind Yadav 2024-09-25   80  			     uint64_t point,
70773bef4e091f Arvind Yadav 2024-09-25   81  			     struct dma_fence *fence,
70773bef4e091f Arvind Yadav 2024-09-25   82  			     struct drm_syncobj *syncobj,
70773bef4e091f Arvind Yadav 2024-09-25   83  			     struct dma_fence_chain *chain)
70773bef4e091f Arvind Yadav 2024-09-25   84  {
70773bef4e091f Arvind Yadav 2024-09-25  @85  	struct amdgpu_bo *bo = bo_va ? bo_va->base.bo : NULL;
70773bef4e091f Arvind Yadav 2024-09-25   86  	struct amdgpu_fpriv *fpriv = filp->driver_priv;
70773bef4e091f Arvind Yadav 2024-09-25   87  	struct amdgpu_vm *vm = &fpriv->vm;
70773bef4e091f Arvind Yadav 2024-09-25   88  	struct dma_fence *last_update;
70773bef4e091f Arvind Yadav 2024-09-25   89  
70773bef4e091f Arvind Yadav 2024-09-25   90  	if (!syncobj)
70773bef4e091f Arvind Yadav 2024-09-25   91  		return;
70773bef4e091f Arvind Yadav 2024-09-25   92  
70773bef4e091f Arvind Yadav 2024-09-25   93  	/* Find the last update fence */
70773bef4e091f Arvind Yadav 2024-09-25   94  	switch (operation) {
70773bef4e091f Arvind Yadav 2024-09-25   95  	case AMDGPU_VA_OP_MAP:
70773bef4e091f Arvind Yadav 2024-09-25   96  	case AMDGPU_VA_OP_REPLACE:
70773bef4e091f Arvind Yadav 2024-09-25   97  		if (bo && (bo->tbo.base.resv == vm->root.bo->tbo.base.resv))
70773bef4e091f Arvind Yadav 2024-09-25   98  			last_update = vm->last_update;
70773bef4e091f Arvind Yadav 2024-09-25   99  		else
70773bef4e091f Arvind Yadav 2024-09-25 @100  			last_update = bo_va->last_pt_update;
70773bef4e091f Arvind Yadav 2024-09-25  101  		break;
70773bef4e091f Arvind Yadav 2024-09-25  102  	case AMDGPU_VA_OP_UNMAP:
70773bef4e091f Arvind Yadav 2024-09-25  103  	case AMDGPU_VA_OP_CLEAR:
70773bef4e091f Arvind Yadav 2024-09-25  104  		last_update = fence;
70773bef4e091f Arvind Yadav 2024-09-25  105  		break;
70773bef4e091f Arvind Yadav 2024-09-25  106  	default:
70773bef4e091f Arvind Yadav 2024-09-25  107  		return;
70773bef4e091f Arvind Yadav 2024-09-25  108  	}
70773bef4e091f Arvind Yadav 2024-09-25  109  
70773bef4e091f Arvind Yadav 2024-09-25  110  	/* Add fence to timeline */
70773bef4e091f Arvind Yadav 2024-09-25  111  	if (!point)
70773bef4e091f Arvind Yadav 2024-09-25  112  		drm_syncobj_replace_fence(syncobj, last_update);
70773bef4e091f Arvind Yadav 2024-09-25  113  	else
70773bef4e091f Arvind Yadav 2024-09-25  114  		drm_syncobj_add_point(syncobj, chain, last_update, point);
70773bef4e091f Arvind Yadav 2024-09-25  115  }
70773bef4e091f Arvind Yadav 2024-09-25  116  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
