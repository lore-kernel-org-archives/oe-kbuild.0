Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5C4283FE2
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579450; cv=none; b=XITYlqo7U6Z2vntjHjkitYde8zuWIYER24DyuP8bzbGcTiWgziQWT9Za4qZBCKRkCpirCPE8DJLI8rTTomPtKM0COTSzh7VHhiRQ/eVmSCvHyqxDQqgJnED+XNe1ErXPAKJ5mEhmfPa1PQUElrUgNC3/buhRyiVz+omgbHaRfEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579450; c=relaxed/simple;
	bh=rIbmVwsKfHmHkEC0cTlA/Wyp9FFVLcYCV4XeGm080zU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LUNB+yNwWsPwIVOz9pauc6us8agA9c9Qr4Vsp5l2jNrx79aJ2CUaALRE1UA2hJDujtU6s1ycvH0D01vhjW2T0/b6IQj6s9E2X2ArYrbLfUGa3rr2Ibbv8Nmr8xYPjDNQPMwiQgcrwNUE8+z6QL/RKfaVTaCOWc6JiDZ9FJnAXTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1yB5gAd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1yB5gAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771579448; x=1803115448;
  h=date:from:to:cc:subject:message-id;
  bh=rIbmVwsKfHmHkEC0cTlA/Wyp9FFVLcYCV4XeGm080zU=;
  b=D1yB5gAdJpios7ZGMHWQc4jolz/n+5Dlr2upS9iVx4DfgDAPzIB9GWhF
   S40vQ1CIWxemaUD6aeUrJF1DCiL/RMhn5zOCPRdQOxwvej41WwTDFOEnU
   wOeTebnD6Z4T2LOpe5yoA0b1LMWd6xc6qD2RA8jneYlcadJSnnj3jMCVC
   Xg/ViiWYlmpgr2M7SxK/dc1Go4kNqKkAPg/ICzrHC+t2RyOE7FXLdyeTP
   4tgdNqT1I68xetxxIq4wdgIwJGp4eRNGW0wvMEJeBqRr59eQLofRh49+3
   qH2EsKI1KLNCxCt6V/iv+DaS9s5KeWXQH/l5QwJgTUySeOyDa/UoAaIi0
   A==;
X-CSE-ConnectionGUID: 7pvpECgDRMeqW/jA5Af1yw==
X-CSE-MsgGUID: 7Bmtu03WTQ+YlBXIi6wvIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76287342"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="76287342"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 01:24:08 -0800
X-CSE-ConnectionGUID: dVBdag4bRTSn0mu8Oz8L8g==
X-CSE-MsgGUID: 1vsZlu76TbaU3uyqWszTnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="214811442"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Feb 2026 01:24:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtMk0-000000013y0-2XAs;
	Fri, 20 Feb 2026 09:24:04 +0000
Date: Fri, 20 Feb 2026 17:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/msm/msm_kms.c:251 msm_drm_kms_uninit() warn:
 variable dereferenced before check 'kms' (see line 235)
Message-ID: <202602201720.wuEIxMsG-lkp@intel.com>
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
head:   8bf22c33e7a172fbc72464f4cc484d23a6b412ba
commit: a409b78fcdf724422fa030bd5ef177ebf3b7608a drm/msm: move wq handling to KMS code
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-r071-20260220 (https://download.01.org/0day-ci/archive/20260220/202602201720.wuEIxMsG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602201720.wuEIxMsG-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_kms.c:251 msm_drm_kms_uninit() warn: variable dereferenced before check 'kms' (see line 235)

vim +/kms +251 drivers/gpu/drm/msm/msm_kms.c

506efcba31296e9 Dmitry Baryshkov 2023-10-09  219  
506efcba31296e9 Dmitry Baryshkov 2023-10-09  220  void msm_drm_kms_uninit(struct device *dev)
506efcba31296e9 Dmitry Baryshkov 2023-10-09  221  {
506efcba31296e9 Dmitry Baryshkov 2023-10-09  222  	struct platform_device *pdev = to_platform_device(dev);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  223  	struct msm_drm_private *priv = platform_get_drvdata(pdev);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  224  	struct drm_device *ddev = priv->dev;
506efcba31296e9 Dmitry Baryshkov 2023-10-09  225  	struct msm_kms *kms = priv->kms;
506efcba31296e9 Dmitry Baryshkov 2023-10-09  226  	int i;
506efcba31296e9 Dmitry Baryshkov 2023-10-09  227  
506efcba31296e9 Dmitry Baryshkov 2023-10-09  228  	BUG_ON(!kms);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  229  
a409b78fcdf7244 Dmitry Baryshkov 2025-07-05  230  	/* We must cancel and cleanup any pending vblank enable/disable
a409b78fcdf7244 Dmitry Baryshkov 2025-07-05  231  	 * work before msm_irq_uninstall() to avoid work re-enabling an
a409b78fcdf7244 Dmitry Baryshkov 2025-07-05  232  	 * irq after uninstall has disabled it.
a409b78fcdf7244 Dmitry Baryshkov 2025-07-05  233  	 */
a409b78fcdf7244 Dmitry Baryshkov 2025-07-05  234  
a409b78fcdf7244 Dmitry Baryshkov 2025-07-05 @235  	flush_workqueue(kms->wq);
a409b78fcdf7244 Dmitry Baryshkov 2025-07-05  236  
506efcba31296e9 Dmitry Baryshkov 2023-10-09  237  	/* clean up event worker threads */
506efcba31296e9 Dmitry Baryshkov 2023-10-09  238  	for (i = 0; i < priv->num_crtcs; i++) {
506efcba31296e9 Dmitry Baryshkov 2023-10-09  239  		if (priv->event_thread[i].worker)
506efcba31296e9 Dmitry Baryshkov 2023-10-09  240  			kthread_destroy_worker(priv->event_thread[i].worker);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  241  	}
506efcba31296e9 Dmitry Baryshkov 2023-10-09  242  
506efcba31296e9 Dmitry Baryshkov 2023-10-09  243  	drm_kms_helper_poll_fini(ddev);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  244  
506efcba31296e9 Dmitry Baryshkov 2023-10-09  245  	msm_disp_snapshot_destroy(ddev);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  246  
506efcba31296e9 Dmitry Baryshkov 2023-10-09  247  	pm_runtime_get_sync(dev);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  248  	msm_irq_uninstall(ddev);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  249  	pm_runtime_put_sync(dev);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  250  
506efcba31296e9 Dmitry Baryshkov 2023-10-09 @251  	if (kms && kms->funcs)
506efcba31296e9 Dmitry Baryshkov 2023-10-09  252  		kms->funcs->destroy(kms);
506efcba31296e9 Dmitry Baryshkov 2023-10-09  253  }
506efcba31296e9 Dmitry Baryshkov 2023-10-09  254  

:::::: The code at line 251 was first introduced by commit
:::::: 506efcba31296e9cbc4f8f148eec1e4b29039931 drm/msm: carve out KMS code from msm_drv.c

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
