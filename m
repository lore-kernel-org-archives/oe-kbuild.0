Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D3165F1D
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jan 2025 23:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738364675; cv=none; b=THeUaoM6ntrTxaphdc+9rVOqDmh5g71Sr5zC5x7kr+DVkMujjVo02ejlcRvokZNdolEIhJV2FYsLDsD58MMzUBn3/m8PWo5M/gYOlhWTa5fnhboqXwIohnM2sMY0YcZ1afOPythUf/f3TlkOz2gTe2+1NTBbOGphl+PTg2ltWpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738364675; c=relaxed/simple;
	bh=QBPCaB5K4x2JVdfb7xCmjI1yD1+9m7ebWGpN48SYjfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNI05oORHuMJg0mYX2cTCODaCtTDaViYIQkVXqHaxQYmqyMO1fMulTaVExzKqWMU9FrcF+JnrsBkJfP7OfjpuUbthc6Gzecz8mvLhTXtZR1asGWcQgVgConDi78cLLSqnuOVnbZ9K8MKJxgESBmKf7JIXazVlNdutHIO3WLmeL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joNDU2JJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joNDU2JJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738364674; x=1769900674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QBPCaB5K4x2JVdfb7xCmjI1yD1+9m7ebWGpN48SYjfI=;
  b=joNDU2JJpRRf3o2PSfXEeTsNVO64fK7yodnEWsiWbcXfBWfQ750NC1rX
   I3qiGJ1WHWxEysdilbd256OBCv1GKUUlDHcpq1Igvxd/Wrf+zoUnCCVWJ
   +2WYAFpINw0glWHxoln81Uh++smKDUq+p9bZ15yNBfyaTXoaz4naxiMEp
   //Qj87ALtsuSU6tVL+jPqmORiOrimqP0rysueUV69H6zrtZ8IRdsMhTvN
   WsSuxZp6HWTj6/Mw6ofRDZvtZng7+UuF8tChF4Z1Ru5FRhTVxdzHJsSnf
   RWuNGB+6UXMFHexo0zz/T6cNmcD0F3+46mMNoh2RWTDnPmCq0YP3QVHlc
   g==;
X-CSE-ConnectionGUID: VdEcVdleQlSkBDOk/wcjfQ==
X-CSE-MsgGUID: coFZlKPSRZu5EbpzuaGHmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="50327677"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="50327677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 15:04:33 -0800
X-CSE-ConnectionGUID: Q7XAAhpyS8aWv3VBhL6u6g==
X-CSE-MsgGUID: x1ycbKUtS3CyuqaVY+AtGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114355378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jan 2025 15:04:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te03p-000nNR-2o;
	Fri, 31 Jan 2025 23:04:29 +0000
Date: Sat, 1 Feb 2025 07:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline 2/2]
 drivers/thermal/testing/zone.c:271:23-30: ERROR: invalid reference to the
 index variable of the iterator on line 256
Message-ID: <202502010710.vc7DHoj0-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   ba938c6b44fc0d9e717ac05dfb30bdcf4c5388e3
commit: f6a034f2df426e279f1ecad53626bab80c04796a [2/2] thermal: Introduce a debugfs-based testing facility
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-r052-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010710.vc7DHoj0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502010710.vc7DHoj0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/testing/zone.c:271:23-30: ERROR: invalid reference to the index variable of the iterator on line 256
   drivers/thermal/testing/zone.c:303:8-15: ERROR: invalid reference to the index variable of the iterator on line 292

vim +271 drivers/thermal/testing/zone.c

f6a034f2df426e Rafael J. Wysocki 2024-08-22  237  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  238  int tt_del_tz(const char *arg)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  239  {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  240  	struct tt_work *tt_work __free(kfree);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  241  	struct tt_thermal_zone *tt_zone, *aux;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  242  	int ret;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  243  	int id;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  244  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  245  	ret = sscanf(arg, "%d", &id);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  246  	if (ret != 1)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  247  		return -EINVAL;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  248  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  249  	tt_work = kzalloc(sizeof(*tt_work), GFP_KERNEL);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  250  	if (!tt_work)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  251  		return -ENOMEM;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  252  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  253  	guard(mutex)(&tt_thermal_zones_lock);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  254  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  255  	ret = -EINVAL;
f6a034f2df426e Rafael J. Wysocki 2024-08-22 @256  	list_for_each_entry_safe(tt_zone, aux, &tt_thermal_zones, list_node) {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  257  		if (tt_zone->id == id) {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  258  			if (tt_zone->refcount) {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  259  				ret = -EBUSY;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  260  			} else {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  261  				list_del(&tt_zone->list_node);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  262  				ret = 0;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  263  			}
f6a034f2df426e Rafael J. Wysocki 2024-08-22  264  			break;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  265  		}
f6a034f2df426e Rafael J. Wysocki 2024-08-22  266  	}
f6a034f2df426e Rafael J. Wysocki 2024-08-22  267  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  268  	if (ret)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  269  		return ret;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  270  
f6a034f2df426e Rafael J. Wysocki 2024-08-22 @271  	tt_zone_unregister_tz(tt_zone);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  272  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  273  	INIT_WORK(&tt_work->work, tt_del_tz_work_fn);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  274  	tt_work->tt_zone = tt_zone;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  275  	schedule_work(&(no_free_ptr(tt_work)->work));
f6a034f2df426e Rafael J. Wysocki 2024-08-22  276  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  277  	return 0;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  278  }
f6a034f2df426e Rafael J. Wysocki 2024-08-22  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
