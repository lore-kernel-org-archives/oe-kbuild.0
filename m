Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F21419AA
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Mar 2024 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710269781; cv=none; b=gWC2mqpLcvACsIVtgANPGlauA1FxHpKv5M2ILvzu91M9oDumt1iC5Y4kOKVz9M5sP51H+OBCFi11hK0woEGRhDBKwsy0SOnVtks9M35k85WORm/cPSNhNT+pfHV4MyzQcRtIR99SWuPm/MfAOeyUNY9/Lnlq6oW8L5rlvgPd3DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710269781; c=relaxed/simple;
	bh=+KwVSSgWbtsNzdEmZlIfvNmnWlbDSHfdCnbVmgelMvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VY01ua/DmWrDyNpxdk21ECsw8c76i6Q7mDbo5tUVRc0/LPQpwjf1NGTPOs/0QHj+vQjkqWuuOUn06LxlW7RcP4BR0CoWK28k4SIv/avuhrJnm+3gx/2YcBwFrLDPA3gJgqouWJJ3xzmd+LsLY2po+5aabGALsQEq4Pf2tEWEdmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6Xu6Rxb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6Xu6Rxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710269779; x=1741805779;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+KwVSSgWbtsNzdEmZlIfvNmnWlbDSHfdCnbVmgelMvI=;
  b=g6Xu6Rxbz43OCWN47/qwQAphcavtA5uanLXD/qdV4sDtvJW3o3PvCl5J
   zOiMH3z0D7U0V6cxKc3ww3lGD3JTJTrHKFyAH7xeOJFc4gCpD2F71kWCa
   tEtUhA4geCNcZTjFtLA43rCvt7h4EF+7GTn7JNTrwWmfbyLbRwsSGdrNc
   20pCepMyo0Hfr5RqcoYGe+GbN9LsH5YqdPALLdsyNBV7o1kC1JCOigZSV
   fp+TId9SaTspOrpJu612/j1LqJFz+hOTSP+8QgnC5m3U+0js8GcBxuiBX
   bCdK9L/IoluIYQXeB86MndHrh5u/HjFRdYgMOhRyMzFhxUoV8aSiZtGPQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4850256"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4850256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 11:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16204024"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Mar 2024 11:56:17 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk7IN-000BZs-0x;
	Tue, 12 Mar 2024 18:56:15 +0000
Date: Wed, 13 Mar 2024 02:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v4 4/4] drm/ttm: Allow continued swapout after -ENOSPC
 falure
Message-ID: <202403130229.ada3fBTp-lkp@intel.com>
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
In-Reply-To: <20240306070125.27071-5-thomas.hellstrom@linux.intel.com>
References: <20240306070125.27071-5-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
TO: intel-xe@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: "Christian König" <christian.koenig@amd.com>
CC: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
CC: dri-devel@lists.freedesktop.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8 next-20240312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240306-150355
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240306070125.27071-5-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v4 4/4] drm/ttm: Allow continued swapout after -ENOSPC falure
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-r051-20240312 (https://download.01.org/0day-ci/archive/20240313/202403130229.ada3fBTp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403130229.ada3fBTp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/ttm_device.c:156:1-10: second lock on line 176
   drivers/gpu/drm/ttm/ttm_device.c:176:4-13: second lock on line 176

vim +156 drivers/gpu/drm/ttm/ttm_device.c

f9e2a03e110ad0 Christian König  2020-10-06  146  
f9e2a03e110ad0 Christian König  2020-10-06  147  int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
f9e2a03e110ad0 Christian König  2020-10-06  148  		       gfp_t gfp_flags)
f9e2a03e110ad0 Christian König  2020-10-06  149  {
5d05b988f1c0fd Christian König  2021-06-08  150  	struct ttm_resource_cursor cursor;
f9e2a03e110ad0 Christian König  2020-10-06  151  	struct ttm_resource_manager *man;
6a9b028994025f Christian König  2021-07-16  152  	struct ttm_resource *res;
5d05b988f1c0fd Christian König  2021-06-08  153  	unsigned i;
ebd59851c796c2 Christian König  2020-10-06  154  	int ret;
ebd59851c796c2 Christian König  2020-10-06  155  
a1f091f8ef2b68 Christian König  2020-10-06 @156  	spin_lock(&bdev->lru_lock);
f9e2a03e110ad0 Christian König  2020-10-06  157  	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
f9e2a03e110ad0 Christian König  2020-10-06  158  		man = ttm_manager_type(bdev, i);
f9e2a03e110ad0 Christian König  2020-10-06  159  		if (!man || !man->use_tt)
f9e2a03e110ad0 Christian König  2020-10-06  160  			continue;
f9e2a03e110ad0 Christian König  2020-10-06  161  
5d05b988f1c0fd Christian König  2021-06-08  162  		ttm_resource_manager_for_each_res(man, &cursor, res) {
5d05b988f1c0fd Christian König  2021-06-08  163  			struct ttm_buffer_object *bo = res->bo;
81b0d0e4f81155 Christian König  2022-06-03  164  			uint32_t num_pages;
ebd59851c796c2 Christian König  2020-10-06  165  
9a9a8fe2675133 Thomas Hellström 2023-03-07  166  			if (!bo || bo->resource != res)
81b0d0e4f81155 Christian König  2022-06-03  167  				continue;
81b0d0e4f81155 Christian König  2022-06-03  168  
81b0d0e4f81155 Christian König  2022-06-03  169  			num_pages = PFN_UP(bo->base.size);
ebd59851c796c2 Christian König  2020-10-06  170  			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
14fb6041b4dee4 Thomas Hellström 2024-03-06  171  			/* Couldn't swap out, and retained the lru_lock */
14fb6041b4dee4 Thomas Hellström 2024-03-06  172  			if (ret == -EBUSY)
14fb6041b4dee4 Thomas Hellström 2024-03-06  173  				continue;
14fb6041b4dee4 Thomas Hellström 2024-03-06  174  			/* Couldn't swap out and dropped the lru_lock */
14fb6041b4dee4 Thomas Hellström 2024-03-06  175  			if (ret == -ENOSPC) {
14fb6041b4dee4 Thomas Hellström 2024-03-06 @176  				spin_lock(&bdev->lru_lock);
14fb6041b4dee4 Thomas Hellström 2024-03-06  177  				continue;
cd259b6156f7e7 Thomas Hellström 2024-03-06  178  			}
14fb6041b4dee4 Thomas Hellström 2024-03-06  179  			/*
14fb6041b4dee4 Thomas Hellström 2024-03-06  180  			 * Dropped the lock and either succeeded or
14fb6041b4dee4 Thomas Hellström 2024-03-06  181  			 * hit an error that forces us to break.
14fb6041b4dee4 Thomas Hellström 2024-03-06  182  			 */
cd259b6156f7e7 Thomas Hellström 2024-03-06  183  			ttm_resource_cursor_fini(&cursor);
14fb6041b4dee4 Thomas Hellström 2024-03-06  184  			return ret ? ret : num_pages;
ebd59851c796c2 Christian König  2020-10-06  185  		}
cd259b6156f7e7 Thomas Hellström 2024-03-06  186  	}
cd259b6156f7e7 Thomas Hellström 2024-03-06  187  	ttm_resource_cursor_fini_locked(&cursor);
a1f091f8ef2b68 Christian König  2020-10-06  188  	spin_unlock(&bdev->lru_lock);
ebd59851c796c2 Christian König  2020-10-06  189  	return 0;
ebd59851c796c2 Christian König  2020-10-06  190  }
f9e2a03e110ad0 Christian König  2020-10-06  191  EXPORT_SYMBOL(ttm_device_swapout);
ebd59851c796c2 Christian König  2020-10-06  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
