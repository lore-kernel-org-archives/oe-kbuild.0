Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802D4AF65
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7QJVWTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701441139; x=1732977139;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yeu7kSIgvCUxH/ci1Dnkyh6kCbGQa6YIBL6V7B1qNYc=;
  b=B7QJVWTAS7Lnk9dvVnC6J9iokXVyVmpiZx0XLUVtf80iedQgu/k4NJbP
   yPpNTeRs5DJPpggB+LukyWzRE8dB2lItJk87E4jSQjNBUbEikOtKfQ9ew
   b0xBxNfBLdOlHebI+jMGCtAJJzGrMWd52Sbq2RQ/Z5ZXZAD8oBpAnmR5U
   cstZI2pt+NiopcOvAgbDJbt5UXg8dS+NtdEQRHRdkunT6ADgEgpHpPvOR
   B9VCel27OQlvPWClQidj0G2TQkeCokNhVSsqhuRM/tU6uTPa+nZIA7WSg
   tu9XvmV/kw+p8A3INsO7Mn6oQkT6LyEEiiWP9EprklZ1f7jJl63EbX9Nb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="424660833"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="424660833"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 06:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="860574191"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="860574191"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2023 06:32:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r94Yw-0003oZ-0A;
	Fri, 01 Dec 2023 14:32:14 +0000
Date: Fri, 1 Dec 2023 22:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/ttm/ttm_bo.c:266 ttm_bo_handle_move_mem() warn:
 missing unwind goto?
Message-ID: <202312012234.pgWMF33I-lkp@intel.com>
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
TO: Dave Airlie <airlied@redhat.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: "hristian König" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: ebdf565169af006ee3be8c40eecbfc77d28a3b84 drm/ttm: add multihop infrastrucutre (v3)
date:   3 years, 1 month ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 years, 1 month ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231201/202312012234.pgWMF33I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312012234.pgWMF33I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312012234.pgWMF33I-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:266 ttm_bo_handle_move_mem() warn: missing unwind goto?

Old smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:753 ttm_mem_evict_first() warn: iterator used outside loop: 'bo'
drivers/gpu/drm/ttm/ttm_bo.c:767 ttm_mem_evict_first() warn: inconsistent returns '&ttm_bo_glob.lru_lock'.
drivers/gpu/drm/ttm/ttm_bo.c:1531 ttm_bo_swapout() warn: inconsistent returns '&glob->lru_lock'.

vim +266 drivers/gpu/drm/ttm/ttm_bo.c

7748e2dcdaad90 Huang Rui        2018-08-06  231  
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  232  static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
2966141ad2dda2 Dave Airlie      2020-08-04  233  				  struct ttm_resource *mem, bool evict,
ebdf565169af00 Dave Airlie      2020-10-29  234  				  struct ttm_operation_ctx *ctx,
ebdf565169af00 Dave Airlie      2020-10-29  235  				  struct ttm_place *hop)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  236  {
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  237  	struct ttm_bo_device *bdev = bo->bdev;
9de59bc201496f Dave Airlie      2020-08-04  238  	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, bo->mem.mem_type);
9de59bc201496f Dave Airlie      2020-08-04  239  	struct ttm_resource_manager *new_man = ttm_manager_type(bdev, mem->mem_type);
f5a9a9383f279d Christian König  2020-07-15  240  	int ret;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  241  
fe662d846c957c Christian König  2019-09-30  242  	ttm_bo_unmap_virtual(bo);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  243  
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  244  	/*
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  245  	 * Create and bind a ttm if required.
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  246  	 */
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  247  
be1213a341a289 Christian König  2020-07-21  248  	if (new_man->use_tt) {
be1213a341a289 Christian König  2020-07-21  249  		/* Zero init the new TTM structure if the old location should
be1213a341a289 Christian König  2020-07-21  250  		 * have used one as well.
be1213a341a289 Christian König  2020-07-21  251  		 */
be1213a341a289 Christian König  2020-07-21  252  		ret = ttm_tt_create(bo, old_man->use_tt);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  253  		if (ret)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  254  			goto out_err;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  255  
28ee846e83782e Dave Airlie      2020-10-20  256  		if (mem->mem_type != TTM_PL_SYSTEM) {
28ee846e83782e Dave Airlie      2020-10-20  257  			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
28ee846e83782e Dave Airlie      2020-10-20  258  			if (ret)
28ee846e83782e Dave Airlie      2020-10-20  259  				goto out_err;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  260  		}
28ee846e83782e Dave Airlie      2020-10-20  261  	}
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  262  
ebdf565169af00 Dave Airlie      2020-10-29  263  	ret = bdev->driver->move(bo, evict, ctx, mem, hop);
ebdf565169af00 Dave Airlie      2020-10-29  264  	if (ret) {
ebdf565169af00 Dave Airlie      2020-10-29  265  		if (ret == -EMULTIHOP)
ebdf565169af00 Dave Airlie      2020-10-29 @266  			return ret;
9f1feed2e16652 Ben Skeggs       2012-01-25  267  		goto out_err;
ebdf565169af00 Dave Airlie      2020-10-29  268  	}
dc97b3409a790d Jerome Glisse    2011-11-18  269  
6cd2e71e897f42 Christian König  2017-04-27  270  	ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  271  	return 0;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  272  
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  273  out_err:
9eca33f4a13919 Dave Airlie      2020-08-04  274  	new_man = ttm_manager_type(bdev, bo->mem.mem_type);
2ff6e69c044984 Dave Airlie      2020-09-15  275  	if (!new_man->use_tt)
2ff6e69c044984 Dave Airlie      2020-09-15  276  		ttm_bo_tt_destroy(bo);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  277  
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  278  	return ret;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  279  }
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
