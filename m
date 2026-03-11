Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8682E2BEC5E
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 06:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210785; cv=none; b=ZRsyVMFYY7oSnLNtr5Heo/aySw3QCws01lSm2FfeQk9iJVGAE5ODdy8JAW30svXnlAvq/1VxtL5ZAV66HmVHM1xsGcm424x6FcPRpIeV5b2IPQlAFeuKkEqs8BLu00FXsiQbd2zYmIeZw4cRXwjZd0ID1yTI+Yj3xkt5D0WSCoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210785; c=relaxed/simple;
	bh=Tv3ESvz3jQK+MsuiPq3GdMUw/tqRTzzi9/D916uUrI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GH4LN5kak2u1/9qfDMe+IyaboOjskgbqnhQOHL2ryfWrsQqMdKdMyzwmkSTUXoEqrhjkTCdYqYC0dzn37lSusO/qu7ZZn4vYsHLEkni/tVyFPfS8TuHNL64pqxcVo+tSwRuK2Fogk771ENxFvzB1Si4HRollEYrm21u13Q84GL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYnmby1d; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYnmby1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773210784; x=1804746784;
  h=date:from:to:cc:subject:message-id;
  bh=Tv3ESvz3jQK+MsuiPq3GdMUw/tqRTzzi9/D916uUrI4=;
  b=HYnmby1d+kgK2ocMS/94aMUUX22dW5HWKf90oD62Drxa3hJksFqry5B6
   1fueBjS0X5AqMxugEFTIaR4fBmgwfodwL7RztvE899qkjdH4C2h3mN+F3
   +IGESCYzR7lWBRLOK6widjuiV/zCDwSzRpiXxyif8/tvBp7NwYOxdsSaF
   bm2wm7W4RZOQe8J/Iu7uI5lq8kGM2nJAWiHdL7hsOt6d3dxIao+uuEyTw
   Hc1t6wxnVQsDyuDDyI1nQBjSuggBpIT9l5ICqLkYrWAdPvDEPUOwh+0dN
   1xb75npMCdheMFeBzBGfj9dV1CUXZ4AIJ07bcZlH0jKH4KvaGshqnWvs3
   g==;
X-CSE-ConnectionGUID: 5YuTowVRTROwNDCANE7VSA==
X-CSE-MsgGUID: 52pQtRBGRmyuk0/3U+qmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85748938"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85748938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 23:33:03 -0700
X-CSE-ConnectionGUID: /yTMDmiGTHKMd1xqKaKgVA==
X-CSE-MsgGUID: 7w4AFHT1R2muMitZtPYygA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219495807"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2026 23:33:02 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0D7r-000000000oR-1dga;
	Wed, 11 Mar 2026 06:32:59 +0000
Date: Wed, 11 Mar 2026 14:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6-2026-01 7/7]
 drivers/base/power/domain.c:428 genpd_dev_pm_set_performance_state() error:
 'genpd' dereferencing possible ERR_PTR()
Message-ID: <202603111451.89WOCsz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-01
head:   55a68c4f435cad4cfd9da2af8f25d3997a081ebb
commit: b0882fabc49919f137b1683af811b7acf4693347 [7/7] UPSTREAM: PM: domains: Implement the ->set_performance_state() callback for genpd
:::::: branch date: 25 hours ago
:::::: commit date: 2 years ago
config: i386-randconfig-141-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111451.89WOCsz8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603111451.89WOCsz8-lkp@intel.com/

New smatch warnings:
drivers/base/power/domain.c:428 genpd_dev_pm_set_performance_state() error: 'genpd' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/base/power/domain.c:823 genpd_dev_pm_start() error: 'genpd' dereferencing possible ERR_PTR()

vim +/genpd +428 drivers/base/power/domain.c

5937c3ce21228d Ulf Hansson 2021-06-03  421  
b0882fabc49919 Ulf Hansson 2023-09-25  422  static int genpd_dev_pm_set_performance_state(struct device *dev,
b0882fabc49919 Ulf Hansson 2023-09-25  423  					      unsigned int state)
b0882fabc49919 Ulf Hansson 2023-09-25  424  {
b0882fabc49919 Ulf Hansson 2023-09-25  425  	struct generic_pm_domain *genpd = dev_to_genpd(dev);
b0882fabc49919 Ulf Hansson 2023-09-25  426  	int ret = 0;
b0882fabc49919 Ulf Hansson 2023-09-25  427  
b0882fabc49919 Ulf Hansson 2023-09-25 @428  	genpd_lock(genpd);
b0882fabc49919 Ulf Hansson 2023-09-25  429  	if (pm_runtime_suspended(dev)) {
b0882fabc49919 Ulf Hansson 2023-09-25  430  		dev_gpd_data(dev)->rpm_pstate = state;
b0882fabc49919 Ulf Hansson 2023-09-25  431  	} else {
b0882fabc49919 Ulf Hansson 2023-09-25  432  		ret = genpd_set_performance_state(dev, state);
b0882fabc49919 Ulf Hansson 2023-09-25  433  		if (!ret)
b0882fabc49919 Ulf Hansson 2023-09-25  434  			dev_gpd_data(dev)->rpm_pstate = 0;
b0882fabc49919 Ulf Hansson 2023-09-25  435  	}
b0882fabc49919 Ulf Hansson 2023-09-25  436  	genpd_unlock(genpd);
b0882fabc49919 Ulf Hansson 2023-09-25  437  
b0882fabc49919 Ulf Hansson 2023-09-25  438  	return ret;
b0882fabc49919 Ulf Hansson 2023-09-25  439  }
b0882fabc49919 Ulf Hansson 2023-09-25  440  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
