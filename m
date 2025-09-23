Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE69184
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758631867; cv=none; b=Kdtz5e8SMuWPRvtdHPSb+rvq3pame03ODSHuh2lGxdgbBJEbGrUwRxj1jqJdnVfu4irKkR08iQopzX1YKDs8MK/D5qRfOEsb7BhT+tSMXPREVI0kFHH2pNa2eg3NX/UodyybQX7HG1mkwBCeCbvBgjXzu6MMNFwn4QVREavMbco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758631867; c=relaxed/simple;
	bh=8TcIC2wtTUixiw3aveIPnPt5UDbzdJ075C8RByl7iQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ux0pSn8IMaQhCFJ1XyiNiRJ6x/99KXenbSQsx+ye/v0921nRDrJMhydKgcJqE1Um0t2Jr+PEuukSwYyrgJ+CGnWjO4nZvMw5+ZV+sRWGiNXUBuKgfkVnHC8CjjlxCn30fuHdh1QugkQcUJwZ0SYKNnY64B24XnygIBDBJIc1Chs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXszaaqX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXszaaqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758631865; x=1790167865;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8TcIC2wtTUixiw3aveIPnPt5UDbzdJ075C8RByl7iQE=;
  b=BXszaaqXkXg9BZzIAUkNB7AJKfCMKjGz5zHt9rqOihOFCR1N4JOiM8wR
   b8vxiu1RA9QqeH9zzWqLnPdNwa30bfUFQv9lyEqMUPGqCIgSLAOA/3nAQ
   I3HQOeo0f6qrjlqB3QPHSFfajKchVaCNwFximc1NzS45wYz2c+xUUnN2d
   EQHwe+uoYyd4/D7C+VC0NpTuSGYQUBGs9DiiPrOBPImOvNgoBvqdgTieq
   MvPbdGx006Acdy5uwMp8UVYKG09eLjRNMkqJw+U2eQopUAODHBbClWfeX
   gkqa+NoRU/EVSaX2d65k8OUBDXw+qHZ6Lqq+JbjBpE+NKoSV+tqDFzlU4
   w==;
X-CSE-ConnectionGUID: QVAPnhl2QMOcIidStlQzBw==
X-CSE-MsgGUID: 5O4t0eW/R8W9whQQNf5G6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78515176"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="78515176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 05:51:05 -0700
X-CSE-ConnectionGUID: ZN6790SVRlGkTIpvb1Cbcg==
X-CSE-MsgGUID: lfR5vNXORXChj/utwmb9fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="177133256"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Sep 2025 05:51:03 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v12U1-00037R-0N;
	Tue, 23 Sep 2025 12:51:01 +0000
Date: Tue, 23 Sep 2025 20:50:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 2/2]
 drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all()
 error: uninitialized symbol 'ret'.
Message-ID: <202509232037.ZFgTcAPJ-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   f8638596656f07c98ff01f23703519c247d3f54d
commit: ba382e06a5d7987496cab78859d0f81a4428687d [2/2] drm/ttm: Should to return the evict error
:::::: branch date: 14 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-141-20250923 (https://download.01.org/0day-ci/archive/20250923/202509232037.ZFgTcAPJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509232037.ZFgTcAPJ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all() error: uninitialized symbol 'ret'.

vim +/ret +440 drivers/gpu/drm/ttm/ttm_resource.c

b2458726b38cb6 Christian König 2020-08-03  401  
b2458726b38cb6 Christian König 2020-08-03  402  /*
4ce032d64c2a30 Christian König 2020-10-01  403   * ttm_resource_manager_evict_all
b2458726b38cb6 Christian König 2020-08-03  404   *
b2458726b38cb6 Christian König 2020-08-03  405   * @bdev - device to use
b2458726b38cb6 Christian König 2020-08-03  406   * @man - manager to use
b2458726b38cb6 Christian König 2020-08-03  407   *
4ce032d64c2a30 Christian König 2020-10-01  408   * Evict all the objects out of a memory manager until it is empty.
b2458726b38cb6 Christian König 2020-08-03  409   * Part of memory manager cleanup sequence.
b2458726b38cb6 Christian König 2020-08-03  410   */
8af8a109b34fa8 Christian König 2020-10-01  411  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
b2458726b38cb6 Christian König 2020-08-03  412  				   struct ttm_resource_manager *man)
b2458726b38cb6 Christian König 2020-08-03  413  {
b2458726b38cb6 Christian König 2020-08-03  414  	struct ttm_operation_ctx ctx = {
b2458726b38cb6 Christian König 2020-08-03  415  		.interruptible = false,
b2458726b38cb6 Christian König 2020-08-03  416  		.no_wait_gpu = false,
c44dfe4de05391 Christian König 2020-11-02  417  		.force_alloc = true
b2458726b38cb6 Christian König 2020-08-03  418  	};
b2458726b38cb6 Christian König 2020-08-03  419  	struct dma_fence *fence;
b2458726b38cb6 Christian König 2020-08-03  420  	int ret;
b2458726b38cb6 Christian König 2020-08-03  421  	unsigned i;
b2458726b38cb6 Christian König 2020-08-03  422  
b2458726b38cb6 Christian König 2020-08-03  423  	/*
b2458726b38cb6 Christian König 2020-08-03  424  	 * Can't use standard list traversal since we're unlocking.
b2458726b38cb6 Christian König 2020-08-03  425  	 */
b2458726b38cb6 Christian König 2020-08-03  426  
a1f091f8ef2b68 Christian König 2020-10-06  427  	spin_lock(&bdev->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  428  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
b2458726b38cb6 Christian König 2020-08-03  429  		while (!list_empty(&man->lru[i])) {
a1f091f8ef2b68 Christian König 2020-10-06  430  			spin_unlock(&bdev->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  431  			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
b2458726b38cb6 Christian König 2020-08-03  432  						  NULL);
b2458726b38cb6 Christian König 2020-08-03  433  			if (ret)
b2458726b38cb6 Christian König 2020-08-03  434  				return ret;
a1f091f8ef2b68 Christian König 2020-10-06  435  			spin_lock(&bdev->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  436  		}
b2458726b38cb6 Christian König 2020-08-03  437  	}
a1f091f8ef2b68 Christian König 2020-10-06  438  	spin_unlock(&bdev->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  439  
ba382e06a5d798 Emily Deng      2025-06-03 @440  	if (ret && ret != -ENOENT)
ba382e06a5d798 Emily Deng      2025-06-03  441  		return ret;
ba382e06a5d798 Emily Deng      2025-06-03  442  
b2458726b38cb6 Christian König 2020-08-03  443  	spin_lock(&man->move_lock);
b2458726b38cb6 Christian König 2020-08-03  444  	fence = dma_fence_get(man->move);
b2458726b38cb6 Christian König 2020-08-03  445  	spin_unlock(&man->move_lock);
b2458726b38cb6 Christian König 2020-08-03  446  
b2458726b38cb6 Christian König 2020-08-03  447  	if (fence) {
b2458726b38cb6 Christian König 2020-08-03  448  		ret = dma_fence_wait(fence, false);
b2458726b38cb6 Christian König 2020-08-03  449  		dma_fence_put(fence);
b2458726b38cb6 Christian König 2020-08-03  450  		if (ret)
b2458726b38cb6 Christian König 2020-08-03  451  			return ret;
b2458726b38cb6 Christian König 2020-08-03  452  	}
b2458726b38cb6 Christian König 2020-08-03  453  
b2458726b38cb6 Christian König 2020-08-03  454  	return 0;
b2458726b38cb6 Christian König 2020-08-03  455  }
4ce032d64c2a30 Christian König 2020-10-01  456  EXPORT_SYMBOL(ttm_resource_manager_evict_all);
b2458726b38cb6 Christian König 2020-08-03  457  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
