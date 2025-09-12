Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E9266B6F
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757670835; cv=none; b=Rq6an9UECfDIyJvK39ofqpNnaLxYtGIfB2mHdr8cC0PR8LQu9U8xaZW3k5w8Sk7ZbcqToNEKkaj7kgtfbP7yJvBFXrPg4cqLAkXm9vbPUi1pNT0mZclHE8OwVNdzykM5eCyH+kI9C8lOXEy3/QGIm64463m/aZwz1xlIwsv6Bik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757670835; c=relaxed/simple;
	bh=gyJ3Fy8W9oF7rcX+pL871KubRD0sUhi1xJqdqF+urBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IOFHA7Ve6344TgTsmKsSDCWfObZK3wv/MfLif3LjaEqarJFsGVIm7Oqiz76d0sGcE3V/1M5VS1WWsfyqDhmjcg6Huv8wAfWEdC9EK1XBSFqxKgZ/X6c+L4WSc+Fj3ZUDaFvqNXZvE0mgT66T7ycBmtAaVQ4Ig6DdHHWkWYYGWUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBlokwwj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBlokwwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757670833; x=1789206833;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gyJ3Fy8W9oF7rcX+pL871KubRD0sUhi1xJqdqF+urBY=;
  b=JBlokwwjWyUHC9o4ROwK5KeafSwJewuHvM/8Mn+t0th0GtnQ4jz5GycZ
   +G6vSyQjdP7rFoA+QJk7zUP2xrxgpzXLAfHkHXhF/TcNrsT2XP/kDXE2w
   VUX7SB/f0dfkHy86BADkA/rhNEEovVxp36ZPL5NPF4CMJpC0VW5HkIWa6
   XzWlJDmrxQmRs62618H9lrCADu89iMEd+d4ImVZ4E4ABKnOSFNborBWWb
   HuW7r9nXLkpUxFH7cckZ4bnVfWDcz667nb5rsjxARivByr0zq7hUquzrp
   AnGLA4DsV+1E3cbY6rzUAqWKggrJL0+PlA7RAl+M9+gfacH9FONg1Hgq3
   A==;
X-CSE-ConnectionGUID: gAd6iiJYRQ6zKIMaIjUslQ==
X-CSE-MsgGUID: qxvh7RcqTfypkXnOl0rAYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="77624923"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="77624923"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 02:53:53 -0700
X-CSE-ConnectionGUID: W0nnd6BiQj+EkqDuntjGGg==
X-CSE-MsgGUID: 0SLrFiZoTL6WuN39ILXtIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="174001892"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Sep 2025 02:53:51 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux0TU-0000wy-2S;
	Fri, 12 Sep 2025 09:53:48 +0000
Date: Fri, 12 Sep 2025 17:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7385/8719] drivers/gpu/drm/xe/xe_dma_buf.c:253
 xe_dma_buf_init_obj() error: uninitialized symbol 'bo'.
Message-ID: <202509121747.MZEQ1fF2-lkp@intel.com>
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
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: eb289a5f6cc668853f9b2ea6aca04afe58ed11c7 [7385/8719] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250911 (https://download.01.org/0day-ci/archive/20250912/202509121747.MZEQ1fF2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509121747.MZEQ1fF2-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_dma_buf.c:253 xe_dma_buf_init_obj() error: uninitialized symbol 'bo'.

vim +/bo +253 drivers/gpu/drm/xe/xe_dma_buf.c

dd08ebf6c3525a Matthew Brost    2023-03-30  217  
dd08ebf6c3525a Matthew Brost    2023-03-30  218  static struct drm_gem_object *
dd08ebf6c3525a Matthew Brost    2023-03-30  219  xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
dd08ebf6c3525a Matthew Brost    2023-03-30  220  		    struct dma_buf *dma_buf)
dd08ebf6c3525a Matthew Brost    2023-03-30  221  {
dd08ebf6c3525a Matthew Brost    2023-03-30  222  	struct dma_resv *resv = dma_buf->resv;
dd08ebf6c3525a Matthew Brost    2023-03-30  223  	struct xe_device *xe = to_xe_device(dev);
eb289a5f6cc668 Thomas Hellström 2025-09-08  224  	struct xe_validation_ctx ctx;
eb289a5f6cc668 Thomas Hellström 2025-09-08  225  	struct drm_gem_object *dummy_obj;
eb289a5f6cc668 Thomas Hellström 2025-09-08  226  	struct drm_exec exec;
dd08ebf6c3525a Matthew Brost    2023-03-30  227  	struct xe_bo *bo;
eb289a5f6cc668 Thomas Hellström 2025-09-08  228  	int ret = 0;
eb289a5f6cc668 Thomas Hellström 2025-09-08  229  
eb289a5f6cc668 Thomas Hellström 2025-09-08  230  	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
eb289a5f6cc668 Thomas Hellström 2025-09-08  231  	if (!dummy_obj)
eb289a5f6cc668 Thomas Hellström 2025-09-08  232  		return ERR_PTR(-ENOMEM);
eb289a5f6cc668 Thomas Hellström 2025-09-08  233  
eb289a5f6cc668 Thomas Hellström 2025-09-08  234  	dummy_obj->resv = resv;
eb289a5f6cc668 Thomas Hellström 2025-09-08  235  	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, ret) {
eb289a5f6cc668 Thomas Hellström 2025-09-08  236  		ret = drm_exec_lock_obj(&exec, dummy_obj);
eb289a5f6cc668 Thomas Hellström 2025-09-08  237  		drm_exec_retry_on_contention(&exec);
eb289a5f6cc668 Thomas Hellström 2025-09-08  238  		if (ret)
eb289a5f6cc668 Thomas Hellström 2025-09-08  239  			break;
dd08ebf6c3525a Matthew Brost    2023-03-30  240  
622f709ca6297d Pallavi Mishra   2023-08-11  241  		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
622f709ca6297d Pallavi Mishra   2023-08-11  242  					    0, /* Will require 1way or 2way for vm_bind */
eb289a5f6cc668 Thomas Hellström 2025-09-08  243  					    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
eb289a5f6cc668 Thomas Hellström 2025-09-08  244  		drm_exec_retry_on_contention(&exec);
dd08ebf6c3525a Matthew Brost    2023-03-30  245  		if (IS_ERR(bo)) {
dd08ebf6c3525a Matthew Brost    2023-03-30  246  			ret = PTR_ERR(bo);
eb289a5f6cc668 Thomas Hellström 2025-09-08  247  			xe_validation_retry_on_oom(&ctx, &ret);
eb289a5f6cc668 Thomas Hellström 2025-09-08  248  			break;
dd08ebf6c3525a Matthew Brost    2023-03-30  249  		}
eb289a5f6cc668 Thomas Hellström 2025-09-08  250  	}
eb289a5f6cc668 Thomas Hellström 2025-09-08  251  	drm_gem_object_put(dummy_obj);
dd08ebf6c3525a Matthew Brost    2023-03-30  252  
eb289a5f6cc668 Thomas Hellström 2025-09-08 @253  	return ret ? ERR_PTR(ret) : &bo->ttm.base;
dd08ebf6c3525a Matthew Brost    2023-03-30  254  }
dd08ebf6c3525a Matthew Brost    2023-03-30  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
