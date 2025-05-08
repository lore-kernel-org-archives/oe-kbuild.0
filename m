Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D636C195FE8
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 07:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690277; cv=none; b=FvK37usoSB4fms64F6oMzSkobEhLT/5BAnS4GIEY5uqMying3e/d8yGJvzVbmeNqGn9mI1CZS2p/GqHpMe6JO8C5ZfFKKbY19TF6SqjnbYmfVBXmltdptTfHud5WgdMlrSLLp44cAHH89QDkMz7WmS9MUTqfdvK6hghvNdPxGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690277; c=relaxed/simple;
	bh=Ii+6Rl0YeiLy9mFjPLuGenKg7Ai7qOXxDLIPxSKhofo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QWsqBk9sL09R37OXajtkObXvwK0cr4hFnuk02EYm4RNwHuIg3LlDxY4N30YQLsVzAHwxiTGxvspl4q8zXU6OShFwuE2aG8Ep3tUnPMiSIYaPAm/fJrX5HLBp72+Izu+8OiqqdMwQ6nDRHJ6QUN9lUI9CJWxqny+tyvPIL/kLbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/T+BSiw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/T+BSiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746690276; x=1778226276;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ii+6Rl0YeiLy9mFjPLuGenKg7Ai7qOXxDLIPxSKhofo=;
  b=d/T+BSiwCfH4IUDiRcjv1eFDZ8IoIldeZZPPenNVvKHBOdGN5GcgH4m9
   i8UhIvfWQNNe1jYMqm3a/cvKIw9USKZSQhoy4r5eSLqjeZHudVdIOtHna
   +6HFFCV/yp8r9cUI92u9esxJ2zmQ+f3EACxkDF3DPnT4Ht+n5i+vmDkre
   KVQgDUQX0+H16DoN+k6U0qWUk0LaygdM5EdX85kpVlz08XsisbCL37elw
   s0fBayPMJU+ZaAfi5mSAFWZVTIJgAr0Gnt/MX82oXVmLuc3ZZHbQ1VhFs
   ODP3i4e0g3ld0vd92Ln2Rdjjc5cKvG3yKPvTsaRVA9lPgYk18CsOUIG1d
   w==;
X-CSE-ConnectionGUID: Y74L48YvQs+xaa7S3LAJ7w==
X-CSE-MsgGUID: hqt6eWFMRQaK9y55r9GLEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59120944"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59120944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 00:44:33 -0700
X-CSE-ConnectionGUID: xkyB/MwySaS3hYW23qwRPQ==
X-CSE-MsgGUID: 14arekIyRUG5YShgDbJKBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="173410752"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2025 00:44:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCvvi-000AlD-0q;
	Thu, 08 May 2025 07:44:30 +0000
Date: Thu, 8 May 2025 15:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:drm-next 194/507] drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:100
 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be
 null (see line 85)
Message-ID: <202505081542.y8PfJPbZ-lkp@intel.com>
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

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   b54695dae995590fa5db899234871ce49fd077a8
commit: 70773bef4e091ff6d2a91e3dfb4f29013eb81f1f [194/507] drm/amdgpu: update userqueue BOs and PDs
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20250410 (https://download.01.org/0day-ci/archive/20250508/202505081542.y8PfJPbZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505081542.y8PfJPbZ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:100 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be null (see line 85)

vim +/bo_va +100 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

70773bef4e091ff Arvind Yadav 2024-09-25   75  
70773bef4e091ff Arvind Yadav 2024-09-25   76  static void
70773bef4e091ff Arvind Yadav 2024-09-25   77  amdgpu_gem_update_bo_mapping(struct drm_file *filp,
70773bef4e091ff Arvind Yadav 2024-09-25   78  			     struct amdgpu_bo_va *bo_va,
70773bef4e091ff Arvind Yadav 2024-09-25   79  			     uint32_t operation,
70773bef4e091ff Arvind Yadav 2024-09-25   80  			     uint64_t point,
70773bef4e091ff Arvind Yadav 2024-09-25   81  			     struct dma_fence *fence,
70773bef4e091ff Arvind Yadav 2024-09-25   82  			     struct drm_syncobj *syncobj,
70773bef4e091ff Arvind Yadav 2024-09-25   83  			     struct dma_fence_chain *chain)
70773bef4e091ff Arvind Yadav 2024-09-25   84  {
70773bef4e091ff Arvind Yadav 2024-09-25  @85  	struct amdgpu_bo *bo = bo_va ? bo_va->base.bo : NULL;
70773bef4e091ff Arvind Yadav 2024-09-25   86  	struct amdgpu_fpriv *fpriv = filp->driver_priv;
70773bef4e091ff Arvind Yadav 2024-09-25   87  	struct amdgpu_vm *vm = &fpriv->vm;
70773bef4e091ff Arvind Yadav 2024-09-25   88  	struct dma_fence *last_update;
70773bef4e091ff Arvind Yadav 2024-09-25   89  
70773bef4e091ff Arvind Yadav 2024-09-25   90  	if (!syncobj)
70773bef4e091ff Arvind Yadav 2024-09-25   91  		return;
70773bef4e091ff Arvind Yadav 2024-09-25   92  
70773bef4e091ff Arvind Yadav 2024-09-25   93  	/* Find the last update fence */
70773bef4e091ff Arvind Yadav 2024-09-25   94  	switch (operation) {
70773bef4e091ff Arvind Yadav 2024-09-25   95  	case AMDGPU_VA_OP_MAP:
70773bef4e091ff Arvind Yadav 2024-09-25   96  	case AMDGPU_VA_OP_REPLACE:
70773bef4e091ff Arvind Yadav 2024-09-25   97  		if (bo && (bo->tbo.base.resv == vm->root.bo->tbo.base.resv))
70773bef4e091ff Arvind Yadav 2024-09-25   98  			last_update = vm->last_update;
70773bef4e091ff Arvind Yadav 2024-09-25   99  		else
70773bef4e091ff Arvind Yadav 2024-09-25 @100  			last_update = bo_va->last_pt_update;
70773bef4e091ff Arvind Yadav 2024-09-25  101  		break;
70773bef4e091ff Arvind Yadav 2024-09-25  102  	case AMDGPU_VA_OP_UNMAP:
70773bef4e091ff Arvind Yadav 2024-09-25  103  	case AMDGPU_VA_OP_CLEAR:
70773bef4e091ff Arvind Yadav 2024-09-25  104  		last_update = fence;
70773bef4e091ff Arvind Yadav 2024-09-25  105  		break;
70773bef4e091ff Arvind Yadav 2024-09-25  106  	default:
70773bef4e091ff Arvind Yadav 2024-09-25  107  		return;
70773bef4e091ff Arvind Yadav 2024-09-25  108  	}
70773bef4e091ff Arvind Yadav 2024-09-25  109  
70773bef4e091ff Arvind Yadav 2024-09-25  110  	/* Add fence to timeline */
70773bef4e091ff Arvind Yadav 2024-09-25  111  	if (!point)
70773bef4e091ff Arvind Yadav 2024-09-25  112  		drm_syncobj_replace_fence(syncobj, last_update);
70773bef4e091ff Arvind Yadav 2024-09-25  113  	else
70773bef4e091ff Arvind Yadav 2024-09-25  114  		drm_syncobj_add_point(syncobj, chain, last_update, point);
70773bef4e091ff Arvind Yadav 2024-09-25  115  }
70773bef4e091ff Arvind Yadav 2024-09-25  116  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
