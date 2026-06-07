Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C88223DE9
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jun 2026 16:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780850315; cv=none; b=or4HQ5w+3tqVCm+L8rfuZhan9pyRCs9/UKo1BGbkJM5Iy0ZYYrxqVYFU2TKiNP17p22Fj3WtjiiKCMJ4hJ3g6u21YfvKKxl/+BnDXzFJz71L3DItCj38fKHuv2kafc2W1EqzBxOJ/5OvEsBUmfyYEF/DPeu6Z4tC0ybID7dLX0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780850315; c=relaxed/simple;
	bh=y9mCPVqOODOh5GeCKDtXR2fxtom0AIhERqAebe4Gx/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CG0c7cKukbsT/oyUAim6cmODGu6E0gvDTt+jlP9mobYmTyy0ybI7dYWr8pPInIHDA4+G9OSqd3zI3pptcWumfnZdcaV2H9xgLKSLvIiDDfZi0sJ/cR0b1swda/c0S1c7Dip6o/Nx237pamYGBKMwRM9dAqfWKkqqEKTQnSr5UVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNo5SZaC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNo5SZaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780850314; x=1812386314;
  h=date:from:to:cc:subject:message-id;
  bh=y9mCPVqOODOh5GeCKDtXR2fxtom0AIhERqAebe4Gx/s=;
  b=gNo5SZaCdMBI/RMiZjf7yVQcdQhQzq0uMxP2LNSkdM+irKCupv6ilYuP
   8hEJsRXhAjB9KWCikuBc4qDl2xoXmq7HUxNVAyUUuzkTIqCtg6NBfSegR
   NM5r0Hgk3G38CYEROjA/UephCBHMfm06Xy7XjbarwAB+U6j3y2FIXAtoh
   drFf0bkF11Sq1LKYuEoCKrBBXQhCH40BixoCgMpRX+n9gnbglIDojYLwd
   mzXnyO67DKs21xkrS0dDCDdj6crRIIvaaQOk2yPsLlmxg7y8rmXVBOqXH
   mymbd9QWGMnZltFTb026PX09Y+3mHsfghEZGd1m9Std5HiwGFyIS818ig
   g==;
X-CSE-ConnectionGUID: H0QB1WBTREKQ8AZRf7SEbA==
X-CSE-MsgGUID: ICQitSedRfeD1V8q5bQHbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="99013440"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="99013440"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 09:38:33 -0700
X-CSE-ConnectionGUID: jaI/LGkMSRWyB0+dPPtEuQ==
X-CSE-MsgGUID: jYUbsslKRi+teneWdMD6SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="245453685"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2026 09:38:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWGW4-00000000HzS-3eqE;
	Sun, 07 Jun 2026 16:38:28 +0000
Date: Mon, 08 Jun 2026 00:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/msm_kms.c:251 msm_drm_kms_uninit() warn:
 variable dereferenced before check 'kms' (see line 235)
Message-ID: <202606080054.BCH7u6o1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Rob Clark <robin.clark@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   979c294509f9248fe1e7c358d582fb37dd5ca12d
commit: a409b78fcdf724422fa030bd5ef177ebf3b7608a drm/msm: move wq handling to KMS code
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-r072-20260607 (https://download.01.org/0day-ci/archive/20260608/202606080054.BCH7u6o1-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606080054.BCH7u6o1-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_kms.c:251 msm_drm_kms_uninit() warn: variable dereferenced before check 'kms' (see line 235)

vim +/kms +251 drivers/gpu/drm/msm/msm_kms.c

506efcba31296e Dmitry Baryshkov 2023-10-09  219  
506efcba31296e Dmitry Baryshkov 2023-10-09  220  void msm_drm_kms_uninit(struct device *dev)
506efcba31296e Dmitry Baryshkov 2023-10-09  221  {
506efcba31296e Dmitry Baryshkov 2023-10-09  222  	struct platform_device *pdev = to_platform_device(dev);
506efcba31296e Dmitry Baryshkov 2023-10-09  223  	struct msm_drm_private *priv = platform_get_drvdata(pdev);
506efcba31296e Dmitry Baryshkov 2023-10-09  224  	struct drm_device *ddev = priv->dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  225  	struct msm_kms *kms = priv->kms;
506efcba31296e Dmitry Baryshkov 2023-10-09  226  	int i;
506efcba31296e Dmitry Baryshkov 2023-10-09  227  
506efcba31296e Dmitry Baryshkov 2023-10-09  228  	BUG_ON(!kms);
506efcba31296e Dmitry Baryshkov 2023-10-09  229  
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  230  	/* We must cancel and cleanup any pending vblank enable/disable
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  231  	 * work before msm_irq_uninstall() to avoid work re-enabling an
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  232  	 * irq after uninstall has disabled it.
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  233  	 */
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  234  
a409b78fcdf724 Dmitry Baryshkov 2025-07-05 @235  	flush_workqueue(kms->wq);
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  236  
506efcba31296e Dmitry Baryshkov 2023-10-09  237  	/* clean up event worker threads */
506efcba31296e Dmitry Baryshkov 2023-10-09  238  	for (i = 0; i < priv->num_crtcs; i++) {
506efcba31296e Dmitry Baryshkov 2023-10-09  239  		if (priv->event_thread[i].worker)
506efcba31296e Dmitry Baryshkov 2023-10-09  240  			kthread_destroy_worker(priv->event_thread[i].worker);
506efcba31296e Dmitry Baryshkov 2023-10-09  241  	}
506efcba31296e Dmitry Baryshkov 2023-10-09  242  
506efcba31296e Dmitry Baryshkov 2023-10-09  243  	drm_kms_helper_poll_fini(ddev);
506efcba31296e Dmitry Baryshkov 2023-10-09  244  
506efcba31296e Dmitry Baryshkov 2023-10-09  245  	msm_disp_snapshot_destroy(ddev);
506efcba31296e Dmitry Baryshkov 2023-10-09  246  
506efcba31296e Dmitry Baryshkov 2023-10-09  247  	pm_runtime_get_sync(dev);
506efcba31296e Dmitry Baryshkov 2023-10-09  248  	msm_irq_uninstall(ddev);
506efcba31296e Dmitry Baryshkov 2023-10-09  249  	pm_runtime_put_sync(dev);
506efcba31296e Dmitry Baryshkov 2023-10-09  250  
506efcba31296e Dmitry Baryshkov 2023-10-09 @251  	if (kms && kms->funcs)
506efcba31296e Dmitry Baryshkov 2023-10-09  252  		kms->funcs->destroy(kms);
506efcba31296e Dmitry Baryshkov 2023-10-09  253  }
506efcba31296e Dmitry Baryshkov 2023-10-09  254  

:::::: The code at line 251 was first introduced by commit
:::::: 506efcba31296e9cbc4f8f148eec1e4b29039931 drm/msm: carve out KMS code from msm_drv.c

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
