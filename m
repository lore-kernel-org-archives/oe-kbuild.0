Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169A2E6100
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Nov 2025 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762430053; cv=none; b=mb/i9PH7ADGbpLw1w2qows8SgPNx0xPZwlKU/eudJPdWmt7dnnlVhiW1uV72m5D+yBfiNJa9fbKEbhRLZGTVE0SkgbWDFCBePvq3yERQ96dSDjXspEAtgpBekjxa3lGpha9ZVnpQvQKc6f7UWklUn1CI5NFaAnlDZhYqbOR0BC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762430053; c=relaxed/simple;
	bh=TsY5mRKsUljZShww4ENTbpWnI0uPQ5dC0FM/pWtfmF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kt4i/fDu3jMLsVhczHPZhJLwhqVBvjdRWL0/1MbZynBAl1+3X7TNha5mTtihZU0qbwjF2cUY1vFFF5a15a1MzLwAvndxxqk4zqkinpWJYguY2oy6WwHrn2yY+2XGRNYhl6B2bhAur6p2NqmpGIW84OH+eO3WA8D5m2XZxxxhIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ummn8sQE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ummn8sQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762430051; x=1793966051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TsY5mRKsUljZShww4ENTbpWnI0uPQ5dC0FM/pWtfmF8=;
  b=Ummn8sQE4eQriRWezKSYj6NOW8oB9MFHX5JSCGiSdRsJOFsZpe9QUjU/
   x919uXxDOeG6E7vmkA1VwLrO8uAooAAvcnBMZU8ATd7YEUYJul6OeLjXy
   L9hAUCLRTEwBUndaEzx+FhMWTTuRRQ50YmP0AiB9HesvX2P/4lRDOh/+t
   XxGPSE3DdCLiKkN+EverEvQZFaFkfi5n5bClr4bh3PrYc2Q7q3c7HGiVT
   moYkaTHmpoBoBj4L8HTvj7rSa5tuaChyZ9HtyGskggt7ICYNAA9rlvoqV
   yoRnpyCcz5fBWO+He1xAHyXw1rKeuaaaA8V50Mh/5Z+NII1r49D3M4z+a
   w==;
X-CSE-ConnectionGUID: GQQSxQZ6SmiXJCYO0P2dYg==
X-CSE-MsgGUID: NM3HdnuySBKa38dXcEN0NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64445281"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64445281"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:54:10 -0800
X-CSE-ConnectionGUID: DkunB+L1TAS3ff0q9uXYLg==
X-CSE-MsgGUID: lw3L9y/rTlOQZGwrkoeU/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187683539"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2025 03:54:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGyZ4-000Tsa-0E;
	Thu, 06 Nov 2025 11:54:06 +0000
Date: Thu, 6 Nov 2025 19:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/msm_kms.c:251 msm_drm_kms_uninit() warn:
 variable dereferenced before check 'kms' (see line 235)
Message-ID: <202511061924.Y0EaYmPu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Rob Clark <robin.clark@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc77806cf3b4788d328fddf245e86c5b529f31a2
commit: a409b78fcdf724422fa030bd5ef177ebf3b7608a drm/msm: move wq handling to KMS code
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
config: powerpc64-randconfig-r073-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061924.Y0EaYmPu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511061924.Y0EaYmPu-lkp@intel.com/

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
