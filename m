Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB1F145A05
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765616606; cv=none; b=j2wIcQLrk2///a7JXiUXAg3Y5OuGUnmtInyCc/9Q5T5ZiSRSX6+PE1kGdos6rd3B51SLPtgGTtlPkdNktSBoO2zAp++0KYIuRQhux1ZMu+KXSC9HkhFxDmeSoQbRF1U30I9UTvWN8E2+W4yEmiwEPyqXWuk91cQhmW3DyF3bdxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765616606; c=relaxed/simple;
	bh=svrmwgL2UVPGGMSnStNwggL5uYFz3M+bwbYRFShw++8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmVCWJeizLqH6NVBC7BBMvN9T1xbrZYvFWevtTaEo5GtOqJTBacWGilJjU6wYGTcnwai1D06x08W3p49pwfSM3zwNnaWSrLCO1WKS39obpmfJbXOEamSYl21eRmgbcOksL9Rz2XcLWgx4Rpevt6PxyWrvYkWL6LB0sMLzeyygww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIxYVLPz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIxYVLPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765616605; x=1797152605;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=svrmwgL2UVPGGMSnStNwggL5uYFz3M+bwbYRFShw++8=;
  b=jIxYVLPzjEblnPxVZFee6gQwnLCJz+yG11LXBbWsuUbhPkGr0zoOUtl6
   VPypmfwDPy2L/6qnbCXw5h7pLgiyBvimH74Mg1sEqumJlRMc4fq0/djza
   Gux40PpDqr9fW7WNUgl/u6981cSxNDC2AjdFd7fybxqDGkpBozG+nNbQP
   /XsQ5dEtTHFc93pClPXM8rzqt44c7aKBBU0k3Cw5Ka6XJ7jgp0qRpbGmL
   2z4Ug+x9EgwO7XHT1+qikQYUDt+n46ctQ4gC38R04gKsh67uYckL3jlPc
   yi1FgIL5cMoRAPBJ/6kXEBh8o/DpaRoYubfFDBIvDd0/1vbMcqYVAAZ2F
   A==;
X-CSE-ConnectionGUID: See4yKeUStSb0S8cmHDiUA==
X-CSE-MsgGUID: F9sS0VBuRyKCLRIA4V4u5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="93079732"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="93079732"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:03:24 -0800
X-CSE-ConnectionGUID: fgCBJgDISZu7DLcz461WBg==
X-CSE-MsgGUID: GC5wSM76SUS0y6NGAc46pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196568170"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 01:03:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULX6-000000007OL-1W29;
	Sat, 13 Dec 2025 09:03:20 +0000
Date: Sat, 13 Dec 2025 17:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:100
 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be
 null (see line 85)
Message-ID: <202512131704.dhYp30j8-lkp@intel.com>
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
TO: Arvind Yadav <arvind.yadav@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>
CC: Shashank Sharma <shashank.sharma@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 70773bef4e091ff6d2a91e3dfb4f29013eb81f1f drm/amdgpu: update userqueue BOs and PDs
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131704.dhYp30j8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131704.dhYp30j8-lkp@intel.com/

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
