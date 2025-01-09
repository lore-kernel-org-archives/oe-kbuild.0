Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07A10A3E
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736409982; cv=none; b=pJnDL9GsF/xXvr/HQYuTxAz8eW4ReEraGSiHZvFdeIvmZEw5aowcCOCuMpSKgLGqDQGghQO/QEYoNSggKXeJ9yKlTbUHkudOmX8hgLTddpQBnxVEJXDcBf595pC7wYdKpDLbck7luERVZA+I2hH3imEft2rMtKOwEHvQYUQTn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736409982; c=relaxed/simple;
	bh=0cJJfoufH+nlqFH/W5qZ43jRuAmww8TPOjpyXdZfVXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G9ExAOTzXHt/QKxsWzEpzxd11lU803meCpNGGwjP7aT8GlcmmoBxRcWhNBPp8xSHmTu6jwqIIMBBTtzX2O/vayibaoEbYpYrK3+fkqLIR64EsxcK022UJXMLAERsgzKFHjbePk2qsz0wr1RT1OKsvbpD3vIcMRr9oGuk/fQ36lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOnz+lRd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOnz+lRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736409980; x=1767945980;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0cJJfoufH+nlqFH/W5qZ43jRuAmww8TPOjpyXdZfVXY=;
  b=nOnz+lRdYRC1+dLiKUtUx+jKGHflJEMBeuTSEL5JM05piqngZOxSOqwA
   9LFaauwVYOiyJLUR2yUK2oNTdWLIb9jZA2R426bN6UL2R56n8o4IuQKOG
   hfJYVuDngPqx91/UqCm9spUrWKmcEAUKH6ZzrIqZOaTlzObQIq68dgIei
   b56d4PP0PKUqU5UomE3+fb9Wk/Rnpgjgz7AGocNZKf0ub+e0NiXflwxgN
   RGmas8NA+CwRfmWGsCvf4XPhFoTmd+2KRspipMzIypn52B6FgI/3xRTK+
   MZjbZrIJQDLYmTMIvpczRM2mbgCpn4YjrsNJDUwnPCxFgHab+82jhxk+W
   g==;
X-CSE-ConnectionGUID: z6rSXMRcSgSu8Dfz5V0H3A==
X-CSE-MsgGUID: SXEk2htYSG2MmJ4W9bix8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40423361"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="40423361"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 00:06:19 -0800
X-CSE-ConnectionGUID: BQqWsVjPQEyFh6JTM+8vJA==
X-CSE-MsgGUID: oZNWmiOkT4K6+9H8gZDi5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="134172643"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jan 2025 00:06:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVnYV-000HFT-1g;
	Thu, 09 Jan 2025 08:06:15 +0000
Date: Thu, 9 Jan 2025 16:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mripard:cgroup-dmem-drm 3/4] drivers/gpu/drm/ttm/ttm_bo.c:486
 ttm_bo_evict_first() error: uninitialized symbol 'ret'.
Message-ID: <202501091604.Jy63wyRz-lkp@intel.com>
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
TO: Maarten Lankhorst <dev@lankhorst.se>
CC: Maxime Ripard <mripard@kernel.org>
CC: Friedrich Vock <friedrich.vock@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git cgroup-dmem-drm
head:   aa4f9d7f77836d5a48daaa99479c2603e9a548ed
commit: 6627b2708ea9f8e3e3c2e6ee8d5d4bb277edad96 [3/4] drm/ttm: Handle cgroup based eviction in TTM
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250109 (https://download.01.org/0day-ci/archive/20250109/202501091604.Jy63wyRz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501091604.Jy63wyRz-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:486 ttm_bo_evict_first() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:156 ttm_bo_handle_move_mem() warn: missing unwind goto?

vim +/ret +486 drivers/gpu/drm/ttm/ttm_bo.c

a2ab19fed9d1dc Christian König   2016-08-30  435  
3756310e9fe1e0 Thomas Hellström  2024-07-05  436  /**
3756310e9fe1e0 Thomas Hellström  2024-07-05  437   * ttm_bo_evict_first() - Evict the first bo on the manager's LRU list.
3756310e9fe1e0 Thomas Hellström  2024-07-05  438   * @bdev: The ttm device.
3756310e9fe1e0 Thomas Hellström  2024-07-05  439   * @man: The manager whose bo to evict.
3756310e9fe1e0 Thomas Hellström  2024-07-05  440   * @ctx: The TTM operation ctx governing the eviction.
d5769ba315d8ff Roger He          2017-12-21  441   *
3756310e9fe1e0 Thomas Hellström  2024-07-05  442   * Return: 0 if successful or the resource disappeared. Negative error code on error.
d5769ba315d8ff Roger He          2017-12-21  443   */
3756310e9fe1e0 Thomas Hellström  2024-07-05  444  int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man,
3756310e9fe1e0 Thomas Hellström  2024-07-05  445  		       struct ttm_operation_ctx *ctx)
d5769ba315d8ff Roger He          2017-12-21  446  {
3756310e9fe1e0 Thomas Hellström  2024-07-05  447  	struct ttm_resource_cursor cursor;
3756310e9fe1e0 Thomas Hellström  2024-07-05  448  	struct ttm_buffer_object *bo;
3756310e9fe1e0 Thomas Hellström  2024-07-05  449  	struct ttm_resource *res;
3756310e9fe1e0 Thomas Hellström  2024-07-05  450  	unsigned int mem_type;
6627b2708ea9f8 Maarten Lankhorst 2024-12-04  451  	int ret;
d5769ba315d8ff Roger He          2017-12-21  452  
3756310e9fe1e0 Thomas Hellström  2024-07-05  453  	spin_lock(&bdev->lru_lock);
3756310e9fe1e0 Thomas Hellström  2024-07-05  454  	res = ttm_resource_manager_first(man, &cursor);
3756310e9fe1e0 Thomas Hellström  2024-07-05  455  	ttm_resource_cursor_fini(&cursor);
3756310e9fe1e0 Thomas Hellström  2024-07-05  456  	if (!res) {
3756310e9fe1e0 Thomas Hellström  2024-07-05  457  		ret = -ENOENT;
3756310e9fe1e0 Thomas Hellström  2024-07-05  458  		goto out_no_ref;
a2848d08742c8e Christian König   2023-07-07  459  	}
3756310e9fe1e0 Thomas Hellström  2024-07-05  460  	bo = res->bo;
3756310e9fe1e0 Thomas Hellström  2024-07-05  461  	if (!ttm_bo_get_unless_zero(bo))
3756310e9fe1e0 Thomas Hellström  2024-07-05  462  		goto out_no_ref;
3756310e9fe1e0 Thomas Hellström  2024-07-05  463  	mem_type = res->mem_type;
3756310e9fe1e0 Thomas Hellström  2024-07-05  464  	spin_unlock(&bdev->lru_lock);
3756310e9fe1e0 Thomas Hellström  2024-07-05  465  	ret = ttm_bo_reserve(bo, ctx->interruptible, ctx->no_wait_gpu, NULL);
3756310e9fe1e0 Thomas Hellström  2024-07-05  466  	if (ret)
3756310e9fe1e0 Thomas Hellström  2024-07-05  467  		goto out_no_lock;
3756310e9fe1e0 Thomas Hellström  2024-07-05  468  	if (!bo->resource || bo->resource->mem_type != mem_type)
3756310e9fe1e0 Thomas Hellström  2024-07-05  469  		goto out_bo_moved;
a2848d08742c8e Christian König   2023-07-07  470  
3756310e9fe1e0 Thomas Hellström  2024-07-05  471  	if (bo->deleted) {
3756310e9fe1e0 Thomas Hellström  2024-07-05  472  		ret = ttm_bo_wait_ctx(bo, ctx);
3756310e9fe1e0 Thomas Hellström  2024-07-05  473  		if (!ret)
3756310e9fe1e0 Thomas Hellström  2024-07-05  474  			ttm_bo_cleanup_memtype_use(bo);
d5769ba315d8ff Roger He          2017-12-21  475  	} else {
3756310e9fe1e0 Thomas Hellström  2024-07-05  476  		ret = ttm_bo_evict(bo, ctx);
d5769ba315d8ff Roger He          2017-12-21  477  	}
3756310e9fe1e0 Thomas Hellström  2024-07-05  478  out_bo_moved:
abb50d67adf3f0 Thomas Hellström  2021-06-02  479  	dma_resv_unlock(bo->base.resv);
3756310e9fe1e0 Thomas Hellström  2024-07-05  480  out_no_lock:
3756310e9fe1e0 Thomas Hellström  2024-07-05  481  	ttm_bo_put(bo);
3756310e9fe1e0 Thomas Hellström  2024-07-05  482  	return ret;
abb50d67adf3f0 Thomas Hellström  2021-06-02  483  
3756310e9fe1e0 Thomas Hellström  2024-07-05  484  out_no_ref:
3756310e9fe1e0 Thomas Hellström  2024-07-05  485  	spin_unlock(&bdev->lru_lock);
d5769ba315d8ff Roger He          2017-12-21 @486  	return ret;
d5769ba315d8ff Roger He          2017-12-21  487  }
d5769ba315d8ff Roger He          2017-12-21  488  

:::::: The code at line 486 was first introduced by commit
:::::: d5769ba315d8ffcf6eeb90b6d7c99d3143547ddb drm/ttm: add new function to check if bo is allowable to evict or swapout

:::::: TO: Roger He <Hongbo.He@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
