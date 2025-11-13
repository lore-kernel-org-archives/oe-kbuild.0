Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBE1303C97
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 04:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009607; cv=none; b=EFxtYLYoG8BFyX2uwDdmO1z0Yo5QTiDIys93NuvuOHWr7GuSHt/5gUsQ2FHLTjQlJLBJ3mk/1wQX4Njlk0Uwg8ixBk2d22g81uwt4zCexpHJNQH7JiNj3HyO6jEO7TOOtC/vy+2BQJtgs8EPRL+y6ndKC6n7C5AHf5ucOCZaNh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009607; c=relaxed/simple;
	bh=I1ErXkTBK1qYwxhQJHOASRvvo2F89S1ITEmux3EgAjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEWYda0FgWxUywDk8Id4nYIn5kOzaiciCzzwdQSnmQuUTe594NS6rGoqR2xCuGMzuutdb1aUM9jAES42rh6BIrpdDYjkvQlY4/jc/RTy0r5lygp2f7qQZvQ7v2zTq17CVbeteagQWy+mb+vuWhgnJYuO/4BUt2AVGhwfPmY51iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7FIw36x; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7FIw36x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009606; x=1794545606;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I1ErXkTBK1qYwxhQJHOASRvvo2F89S1ITEmux3EgAjE=;
  b=j7FIw36xJE8U7zBAMQISOCxCNVy5fplNZ+P1juoERNX1o0gojqpfCAWT
   N+oT43d0t2FWiiRsrIvA6kYiHB32eAwZ9iXq66oOMj488PSTcOjjFbvJh
   Sz8OcWqktcol3vYhUwKDfCWjYMnjS1VLwAy6p6dFKcp34bEA7rCWfeHSn
   yL56E6aeK3ysqTUY1mJI+Wk3nJ+NpCVWJkt2ROnIuYoqPYuGIhmw8POHR
   N9JmoK2H6DBo85wgvdc1IzaNmarfPJaSfvocYhGb1US21a3z+E2FkoR6s
   VRxmhIwzPYPg6753B9LQfl8y8ZluOqMe4xncInVAGDOhZo4rhYwJC9p09
   g==;
X-CSE-ConnectionGUID: wdVfsI1pQLyo96+Bb7cgkg==
X-CSE-MsgGUID: 7wAeq2Q1T/21spBKF569rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65175890"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65175890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:23 -0800
X-CSE-ConnectionGUID: L2hSTCkORG+zYk9RSQ1zOQ==
X-CSE-MsgGUID: rAKJnOkzTCuca8dmQbUAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="190138865"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2025 20:53:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004u1-1M;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 drivers/gpu/drm/ttm/ttm_resource.c:116
 ttm_resource_manager_force_list_clean() error: uninitialized symbol 'ret'.
Message-ID: <202511131258.s4rE5rUy-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   4fc4507b1c87bd379cb8574bee9caba08e53542a
commit: 495948bdf32e2c16c1e51b6d6782e4f54dba77f5 [1/1] drm/ttm: Should to return the evict error
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131258.s4rE5rUy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511131258.s4rE5rUy-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_resource.c:116 ttm_resource_manager_force_list_clean() error: uninitialized symbol 'ret'.

vim +/ret +116 drivers/gpu/drm/ttm/ttm_resource.c

b2458726b38cb6 Christian König 2020-08-03   76  
b2458726b38cb6 Christian König 2020-08-03   77  /*
b2458726b38cb6 Christian König 2020-08-03   78   * ttm_resource_manager_force_list_clean
b2458726b38cb6 Christian König 2020-08-03   79   *
b2458726b38cb6 Christian König 2020-08-03   80   * @bdev - device to use
b2458726b38cb6 Christian König 2020-08-03   81   * @man - manager to use
b2458726b38cb6 Christian König 2020-08-03   82   *
b2458726b38cb6 Christian König 2020-08-03   83   * Force all the objects out of a memory manager until clean.
b2458726b38cb6 Christian König 2020-08-03   84   * Part of memory manager cleanup sequence.
b2458726b38cb6 Christian König 2020-08-03   85   */
b2458726b38cb6 Christian König 2020-08-03   86  int ttm_resource_manager_force_list_clean(struct ttm_bo_device *bdev,
b2458726b38cb6 Christian König 2020-08-03   87  					  struct ttm_resource_manager *man)
b2458726b38cb6 Christian König 2020-08-03   88  {
b2458726b38cb6 Christian König 2020-08-03   89  	struct ttm_operation_ctx ctx = {
b2458726b38cb6 Christian König 2020-08-03   90  		.interruptible = false,
b2458726b38cb6 Christian König 2020-08-03   91  		.no_wait_gpu = false,
b2458726b38cb6 Christian König 2020-08-03   92  		.flags = TTM_OPT_FLAG_FORCE_ALLOC
b2458726b38cb6 Christian König 2020-08-03   93  	};
b2458726b38cb6 Christian König 2020-08-03   94  	struct ttm_bo_global *glob = &ttm_bo_glob;
b2458726b38cb6 Christian König 2020-08-03   95  	struct dma_fence *fence;
b2458726b38cb6 Christian König 2020-08-03   96  	int ret;
b2458726b38cb6 Christian König 2020-08-03   97  	unsigned i;
b2458726b38cb6 Christian König 2020-08-03   98  
b2458726b38cb6 Christian König 2020-08-03   99  	/*
b2458726b38cb6 Christian König 2020-08-03  100  	 * Can't use standard list traversal since we're unlocking.
b2458726b38cb6 Christian König 2020-08-03  101  	 */
b2458726b38cb6 Christian König 2020-08-03  102  
b2458726b38cb6 Christian König 2020-08-03  103  	spin_lock(&glob->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  104  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
b2458726b38cb6 Christian König 2020-08-03  105  		while (!list_empty(&man->lru[i])) {
b2458726b38cb6 Christian König 2020-08-03  106  			spin_unlock(&glob->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  107  			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
b2458726b38cb6 Christian König 2020-08-03  108  						  NULL);
b2458726b38cb6 Christian König 2020-08-03  109  			if (ret)
b2458726b38cb6 Christian König 2020-08-03  110  				return ret;
b2458726b38cb6 Christian König 2020-08-03  111  			spin_lock(&glob->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  112  		}
b2458726b38cb6 Christian König 2020-08-03  113  	}
b2458726b38cb6 Christian König 2020-08-03  114  	spin_unlock(&glob->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  115  
495948bdf32e2c Emily Deng      2025-06-03 @116  	if (ret && ret != -ENOENT)
495948bdf32e2c Emily Deng      2025-06-03  117  		return ret;
495948bdf32e2c Emily Deng      2025-06-03  118  
b2458726b38cb6 Christian König 2020-08-03  119  	spin_lock(&man->move_lock);
b2458726b38cb6 Christian König 2020-08-03  120  	fence = dma_fence_get(man->move);
b2458726b38cb6 Christian König 2020-08-03  121  	spin_unlock(&man->move_lock);
b2458726b38cb6 Christian König 2020-08-03  122  
b2458726b38cb6 Christian König 2020-08-03  123  	if (fence) {
b2458726b38cb6 Christian König 2020-08-03  124  		ret = dma_fence_wait(fence, false);
b2458726b38cb6 Christian König 2020-08-03  125  		dma_fence_put(fence);
b2458726b38cb6 Christian König 2020-08-03  126  		if (ret)
b2458726b38cb6 Christian König 2020-08-03  127  			return ret;
b2458726b38cb6 Christian König 2020-08-03  128  	}
b2458726b38cb6 Christian König 2020-08-03  129  
b2458726b38cb6 Christian König 2020-08-03  130  	return 0;
b2458726b38cb6 Christian König 2020-08-03  131  }
b2458726b38cb6 Christian König 2020-08-03  132  EXPORT_SYMBOL(ttm_resource_manager_force_list_clean);
b2458726b38cb6 Christian König 2020-08-03  133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
