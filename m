Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B823BE
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Feb 2024 06:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707632092; cv=none; b=aGQF63cfuA6Fx8CRxZlBNymcsRHknck6H8Gf3E0mpTBANUZuyDHyh384VidS0D07UIMsDxy4TjA5dgWBnJppA1rN9ZOlAPrpEpzm+slrfDEkCGvGDKcF9pv0Vnfaf1Oqyto63THOeVkp46r6Lg7xz0OcjtzEs9TOIwIpC5lC5gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707632092; c=relaxed/simple;
	bh=r+ljpFhS4oUBKi0FcBvkkd5z/TkmEBPr5iu8g55dm8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IApn7NOilJCDo0ThOZfp72iZ8Kmyhkk8iVBLKZb+MwU2em3kmeEB3RaqtaTUtWTSlbCqv+oJJoNuoSNLm5dy/E63S7OWfdfI3iSNOSCOpIXWX/yBdkGPBDsRCMmbZOpeaZjp1Byh+fkbEXi3cHLe8hXgJlYUFarfqWx/6eE4c+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7KB1/R+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7KB1/R+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707632090; x=1739168090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+ljpFhS4oUBKi0FcBvkkd5z/TkmEBPr5iu8g55dm8I=;
  b=O7KB1/R+uxE3HhbpNtlom6hcx8Vpnz9Bmr/yk5ZME+U3YRqkY0domQwe
   v/bTrF/z4C9AzeNExwq8mlnmT/53Mek07JrOYG8Jvo+gt8mvRWELIRy2Z
   L25N7d1cm9oqTKzb6Ijyf+k3EjWEzAON4cROXhWmMSHVXPV4ku5lG76AR
   Cc8EtUjxR61EtNodztsnu7Gn26cwCxFqfkrPMEtM2O6kizIwQ96plFFIT
   /r7AqxtzfyBPHw7rYynM/RmyW29j5yzwt12H4xgNf12yTKTrVgDfFiZzS
   qlLH0awoBgyyXKw8J8kNJ4XOEuNCHDaDPEQaNQHktEeCFOKOEJGxxP9x/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="1747957"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="1747957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 22:14:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="2599246"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2024 22:14:48 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ36z-0006Mg-2S;
	Sun, 11 Feb 2024 06:14:45 +0000
Date: Sun, 11 Feb 2024 14:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 74/80] drivers/thermal/thermal_core.c:1230
 thermal_zone_get_crit_temp() warn: this array is probably non-NULL.
 'tz->trips'
Message-ID: <202402111448.R5x5hs70-lkp@intel.com>
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
CC: linux-acpi@vger.kernel.org
CC: devel@acpica.org
CC: linux-pm@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   1cc7a914a31bd41feb404b644539a007f99b4f00
commit: 888085f258b2e617bfc4548a9907b09f935efcbb [74/80] thermal: core: Store zone trips table in struct thermal_zone_device
:::::: branch date: 10 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-141-20240211 (https://download.01.org/0day-ci/archive/20240211/202402111448.R5x5hs70-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402111448.R5x5hs70-lkp@intel.com/

smatch warnings:
drivers/thermal/thermal_core.c:1230 thermal_zone_get_crit_temp() warn: this array is probably non-NULL. 'tz->trips'
drivers/thermal/thermal_trip.c:125 __thermal_zone_get_trip() warn: this array is probably non-NULL. 'tz->trips'

vim +1230 drivers/thermal/thermal_core.c

e5f2cda61d068e Daniel Lezcano 2022-07-22  1222  
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1223  int thermal_zone_get_crit_temp(struct thermal_zone_device *tz, int *temp)
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1224  {
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1225  	int i, ret = -EINVAL;
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1226  
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1227  	if (tz->ops->get_crit_temp)
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1228  		return tz->ops->get_crit_temp(tz, temp);
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1229  
7c3d5c20dc169e Daniel Lezcano 2022-10-03 @1230  	if (!tz->trips)
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1231  		return -EINVAL;
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1232  
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1233  	mutex_lock(&tz->lock);
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1234  
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1235  	for (i = 0; i < tz->num_trips; i++) {
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1236  		if (tz->trips[i].type == THERMAL_TRIP_CRITICAL) {
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1237  			*temp = tz->trips[i].temperature;
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1238  			ret = 0;
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1239  			break;
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1240  		}
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1241  	}
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1242  
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1243  	mutex_unlock(&tz->lock);
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1244  
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1245  	return ret;
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1246  }
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1247  EXPORT_SYMBOL_GPL(thermal_zone_get_crit_temp);
7c3d5c20dc169e Daniel Lezcano 2022-10-03  1248  

:::::: The code at line 1230 was first introduced by commit
:::::: 7c3d5c20dc169e55064f7f38c1c56cfbc39ee5b2 thermal/core: Add a generic thermal_zone_get_trip() function

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
