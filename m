Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC73858AB1
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 20:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBlDo4O5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701463264; x=1732999264;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5PX638DObiz7lNHQXFtQSmxa1Ym/ezWWN85j40SZc7c=;
  b=SBlDo4O5pdsfNOqMpCNAAIlTEuNA+6WxtRN54abP9CF4rTDb4Hrwa4/P
   lgFv6cA0gZoS7ewm75OfVnWJgbn0a24AN8dQmeyaQdLuTnm95t71ZcAXQ
   WgenZy9qDTpVlsIE6YecnyfawoYNvwUrMVPiNrDvjppDaMczuHvOKOKUK
   jbGrdfZNQKJfWg/B8fmdkWfk9Ckv4xgHdRJ1WbYJ6EdSfHVUvO7c7Fg2R
   b+y3rmQsno23ksmRBqEFV3411/yNF1TDHQhwzsKoJ+qmePN/nwInVBqyn
   mcF0nNC6eh8ooC/c1dJ+O9kPsXvq9/FJgtbasztEpiFHwN3ubhzWWYo7K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="396352653"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="396352653"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 12:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="804183212"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="804183212"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Dec 2023 12:41:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9AJn-0004Gj-1o;
	Fri, 01 Dec 2023 20:40:59 +0000
Date: Sat, 2 Dec 2023 04:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/ttm/ttm_bo.c:686 ttm_mem_evict_first() warn:
 inconsistent returns '&bdev->lru_lock'.
Message-ID: <202312020406.zMldj9Qx-lkp@intel.com>
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
CC: Colin Ian King <colin.king@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: 58442f0db3f89b7e77113295c72ac0672f74f92a drm/ttm: fix invalid NULL deref
date:   2 years, 8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 years, 8 months ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231202/202312020406.zMldj9Qx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020406.zMldj9Qx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312020406.zMldj9Qx-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:686 ttm_mem_evict_first() warn: inconsistent returns '&bdev->lru_lock'.

Old smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:195 ttm_bo_handle_move_mem() warn: missing unwind goto?
drivers/gpu/drm/ttm/ttm_bo.c:672 ttm_mem_evict_first() warn: iterator used outside loop: 'bo'

vim +686 drivers/gpu/drm/ttm/ttm_bo.c

d367bd2a5e2b12c Christian König   2019-05-22  616  
8af8a109b34fa88 Christian König   2020-10-01  617  int ttm_mem_evict_first(struct ttm_device *bdev,
9de59bc201496f2 Dave Airlie       2020-08-04  618  			struct ttm_resource_manager *man,
e300180f71037fd Michel Dänzer     2014-10-09  619  			const struct ttm_place *place,
d367bd2a5e2b12c Christian König   2019-05-22  620  			struct ttm_operation_ctx *ctx,
d367bd2a5e2b12c Christian König   2019-05-22  621  			struct ww_acquire_ctx *ticket)
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10  622  {
d367bd2a5e2b12c Christian König   2019-05-22  623  	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
6ba435812e0d85b Christian König   2017-11-08  624  	bool locked = false;
cf6c467d67d319e Christian König   2017-01-10  625  	unsigned i;
6ba435812e0d85b Christian König   2017-11-08  626  	int ret;
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10  627  
58442f0db3f89b7 Christian König   2021-03-25  628  	spin_lock(&bdev->lru_lock);
cf6c467d67d319e Christian König   2017-01-10  629  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
cf6c467d67d319e Christian König   2017-01-10  630  		list_for_each_entry(bo, &man->lru[i], lru) {
d367bd2a5e2b12c Christian König   2019-05-22  631  			bool busy;
d367bd2a5e2b12c Christian König   2019-05-22  632  
d367bd2a5e2b12c Christian König   2019-05-22  633  			if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked,
d367bd2a5e2b12c Christian König   2019-05-22  634  							    &busy)) {
0dbd555a011c2d0 Christian König   2019-07-31  635  				if (busy && !busy_bo && ticket !=
52791eeec1d9f4a Christian König   2019-08-11  636  				    dma_resv_locking_ctx(bo->base.resv))
d367bd2a5e2b12c Christian König   2019-05-22  637  					busy_bo = bo;
6ba435812e0d85b Christian König   2017-11-08  638  				continue;
d367bd2a5e2b12c Christian König   2019-05-22  639  			}
a2ab19fed9d1dc5 Christian König   2016-08-30  640  
8af8a109b34fa88 Christian König   2020-10-01  641  			if (place && !bdev->funcs->eviction_valuable(bo,
cf6c467d67d319e Christian König   2017-01-10  642  								      place)) {
6ba435812e0d85b Christian König   2017-11-08  643  				if (locked)
52791eeec1d9f4a Christian König   2019-08-11  644  					dma_resv_unlock(bo->base.resv);
e300180f71037fd Michel Dänzer     2014-10-09  645  				continue;
e300180f71037fd Michel Dänzer     2014-10-09  646  			}
1ec39923ef24f55 Christian König   2019-11-11  647  			if (!ttm_bo_get_unless_zero(bo)) {
1ec39923ef24f55 Christian König   2019-11-11  648  				if (locked)
1ec39923ef24f55 Christian König   2019-11-11  649  					dma_resv_unlock(bo->base.resv);
1ec39923ef24f55 Christian König   2019-11-11  650  				continue;
1ec39923ef24f55 Christian König   2019-11-11  651  			}
e7ab20197be3ee5 Maarten Lankhorst 2012-11-28  652  			break;
e7ab20197be3ee5 Maarten Lankhorst 2012-11-28  653  		}
e7ab20197be3ee5 Maarten Lankhorst 2012-11-28  654  
6ba435812e0d85b Christian König   2017-11-08  655  		/* If the inner loop terminated early, we have our candidate */
6ba435812e0d85b Christian König   2017-11-08  656  		if (&bo->lru != &man->lru[i])
cf6c467d67d319e Christian König   2017-01-10  657  			break;
6ba435812e0d85b Christian König   2017-11-08  658  
6ba435812e0d85b Christian König   2017-11-08  659  		bo = NULL;
cf6c467d67d319e Christian König   2017-01-10  660  	}
cf6c467d67d319e Christian König   2017-01-10  661  
6ba435812e0d85b Christian König   2017-11-08  662  	if (!bo) {
1ec39923ef24f55 Christian König   2019-11-11  663  		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
1ec39923ef24f55 Christian König   2019-11-11  664  			busy_bo = NULL;
58442f0db3f89b7 Christian König   2021-03-25  665  		spin_unlock(&bdev->lru_lock);
d367bd2a5e2b12c Christian König   2019-05-22  666  		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
d367bd2a5e2b12c Christian König   2019-05-22  667  		if (busy_bo)
1ec39923ef24f55 Christian König   2019-11-11  668  			ttm_bo_put(busy_bo);
d367bd2a5e2b12c Christian König   2019-05-22  669  		return ret;
9c51ba1db37cab7 Thomas Hellstrom  2009-12-02  670  	}
9c51ba1db37cab7 Thomas Hellstrom  2009-12-02  671  
1ec39923ef24f55 Christian König   2019-11-11  672  	if (bo->deleted) {
83876c1bed8c91e Christian König   2017-04-12  673  		ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
83876c1bed8c91e Christian König   2017-04-12  674  					  ctx->no_wait_gpu, locked);
1ec39923ef24f55 Christian König   2019-11-11  675  		ttm_bo_put(bo);
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10  676  		return ret;
9c51ba1db37cab7 Thomas Hellstrom  2009-12-02  677  	}
9c51ba1db37cab7 Thomas Hellstrom  2009-12-02  678  
58442f0db3f89b7 Christian König   2021-03-25  679  	spin_unlock(&bdev->lru_lock);
9c51ba1db37cab7 Thomas Hellstrom  2009-12-02  680  
83876c1bed8c91e Christian König   2017-04-12  681  	ret = ttm_bo_evict(bo, ctx);
9165fb879f62a73 Christian König   2019-09-19  682  	if (locked)
ca262a9998d4619 Jerome Glisse     2009-12-08  683  		ttm_bo_unreserve(bo);
9c51ba1db37cab7 Thomas Hellstrom  2009-12-02  684  
1ec39923ef24f55 Christian König   2019-11-11  685  	ttm_bo_put(bo);
ca262a9998d4619 Jerome Glisse     2009-12-08 @686  	return ret;
ca262a9998d4619 Jerome Glisse     2009-12-08  687  }
ba4e7d973dd09b6 Thomas Hellstrom  2009-06-10  688  

:::::: The code at line 686 was first introduced by commit
:::::: ca262a9998d46196750bb19a9dc4bd465b170ff7 drm/ttm: Rework validation & memory space allocation (V3)

:::::: TO: Jerome Glisse <jglisse@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
