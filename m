Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B9E567
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202176; cv=none; b=mbDITG6AhqPt/Dl/w1aSNSZdZhE7IXqPgtBoGpJ8GHhLrOPdB67xI04Jh8mwEH5xBXwElD2ng0/I7nMHq9KUBNxyla13JGuVCt0fcSxIlGUiC4lbJD1X7/+6HDr0EmS4rDv+bdRD1yCATjj0YnG6dQHdx9fb26+0HnA7FVJSXuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202176; c=relaxed/simple;
	bh=oZmEuVdT2lUSYnc7ObWPuCrDExSwZVduZxexeDCc5e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y91Z5iJPfcP41b0diOJsHPMgWkSAgOyI9jLzVuebIbt0rtpKjR9O+XnOR53DWVPCReaW/aG1W6A7aEzVZ10a3hyQmGSwSLjoRekuUksdR5553/859y4G8LgIVXvZKOWXYaL4MSRH8KKwJPO7GNCadz3nJzZauf5Uj+uXR1cgHds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhkRlUys; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhkRlUys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742202174; x=1773738174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oZmEuVdT2lUSYnc7ObWPuCrDExSwZVduZxexeDCc5e4=;
  b=HhkRlUys9/UeSVqUlBXbW23Nhon1avM3kUo+tzrcE6VpL457mDyCk/ar
   D0FT2cUGcUfJ09+VVfBkBDhrgQUQTqJsCmYRgdENP8LXaLiUvXoHL8qvb
   iCAWNVI/Y+WJmJAL/oHqPvgYq1+isMzyFKNNUQ32xUcRU2p1faiY+D3lg
   zAQFApDpZRh8Jjif2Mz53wKPNPkwyNynvV07+Zp7BGsf7GHKCOtDK0K7E
   GnHBxwcCce6htE/C0n+PA6QAfiGi17NsRdvCi9RVrfCz+2eRx04dzAn4y
   n9IevP/ObAN8/txAdVuuPxXzSUhKbFs/Db3IB1Tk4E8TPkWhdMlZSYGmd
   g==;
X-CSE-ConnectionGUID: xPrFDLVvSauo+aR6nS0QRw==
X-CSE-MsgGUID: TPOwSyVrTRCiid6PCw74Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43313700"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43313700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 02:02:54 -0700
X-CSE-ConnectionGUID: hMpHDwJLRYWu4XUiIVj2jw==
X-CSE-MsgGUID: 5aRQtUmITHmWNTTSbJu7mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121897555"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Mar 2025 02:02:52 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu6Mr-000Ccd-3A;
	Mon, 17 Mar 2025 09:02:46 +0000
Date: Mon, 17 Mar 2025 17:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/thermal/testing/zone.c:345 tt_zone_add_trip() warn: passing
 positive error code '(-22)' to 'PTR_ERR'
Message-ID: <202503171644.D33HDX6Z-lkp@intel.com>
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
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4701f33a10702d5fc577c32434eb62adde0a1ae1
commit: 9782dd101f343d7f1cad824dc26ad355341e1f3b thermal: testing: Simplify tt_get_tt_zone()
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: m68k-randconfig-r073-20250314 (https://download.01.org/0day-ci/archive/20250317/202503171644.D33HDX6Z-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503171644.D33HDX6Z-lkp@intel.com/

New smatch warnings:
drivers/thermal/testing/zone.c:345 tt_zone_add_trip() warn: passing positive error code '(-22)' to 'PTR_ERR'
drivers/thermal/testing/zone.c:428 tt_zone_reg() warn: passing positive error code '(-22)' to 'PTR_ERR'
drivers/thermal/testing/zone.c:443 tt_zone_unreg() warn: passing positive error code '(-22)' to 'PTR_ERR'

Old smatch warnings:
drivers/thermal/testing/zone.c:188 tt_add_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:240 tt_del_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:331 tt_zone_add_trip() error: uninitialized symbol 'tt_trip'.
drivers/thermal/testing/zone.c:389 tt_zone_register_tz() error: uninitialized symbol 'trips'.

vim +345 drivers/thermal/testing/zone.c

f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  327  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  328  int tt_zone_add_trip(const char *arg)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  329  {
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  330  	struct tt_work *tt_work __free(kfree);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  331  	struct tt_trip *tt_trip __free(kfree);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  332  	struct tt_thermal_zone *tt_zone;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  333  	int id;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  334  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  335  	tt_work = kzalloc(sizeof(*tt_work), GFP_KERNEL);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  336  	if (!tt_work)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  337  		return -ENOMEM;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  338  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  339  	tt_trip = kzalloc(sizeof(*tt_trip), GFP_KERNEL);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  340  	if (!tt_trip)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  341  		return -ENOMEM;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  342  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  343  	tt_zone = tt_get_tt_zone(arg);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  344  	if (IS_ERR(tt_zone))
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22 @345  		return PTR_ERR(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  346  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  347  	id = ida_alloc(&tt_zone->ida, GFP_KERNEL);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  348  	if (id < 0) {
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  349  		tt_put_tt_zone(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  350  		return id;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  351  	}
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  352  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  353  	tt_trip->trip.type = THERMAL_TRIP_ACTIVE;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  354  	tt_trip->trip.temperature = THERMAL_TEMP_INVALID;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  355  	tt_trip->trip.flags = THERMAL_TRIP_FLAG_RW;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  356  	tt_trip->id = id;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  357  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  358  	guard(tt_zone)(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  359  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  360  	list_add_tail(&tt_trip->list_node, &tt_zone->trips);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  361  	tt_zone->num_trips++;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  362  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  363  	INIT_WORK(&tt_work->work, tt_zone_add_trip_work_fn);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  364  	tt_work->tt_zone = tt_zone;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  365  	tt_work->tt_trip = no_free_ptr(tt_trip);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  366  	schedule_work(&(no_free_ptr(tt_work)->work));
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  367  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  368  	return 0;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  369  }
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  370  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  371  static int tt_zone_get_temp(struct thermal_zone_device *tz, int *temp)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  372  {
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  373  	struct tt_thermal_zone *tt_zone = thermal_zone_device_priv(tz);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  374  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  375  	*temp = READ_ONCE(tt_zone->tz_temp);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  376  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  377  	if (*temp < THERMAL_TEMP_INVALID)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  378  		return -ENODATA;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  379  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  380  	return 0;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  381  }
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  382  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  383  static struct thermal_zone_device_ops tt_zone_ops = {
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  384  	.get_temp = tt_zone_get_temp,
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  385  };
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  386  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  387  static int tt_zone_register_tz(struct tt_thermal_zone *tt_zone)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  388  {
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  389  	struct thermal_trip *trips __free(kfree);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  390  	struct thermal_zone_device *tz;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  391  	struct tt_trip *tt_trip;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  392  	int i;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  393  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  394  	guard(tt_zone)(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  395  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  396  	if (tt_zone->tz)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  397  		return -EINVAL;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  398  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  399  	trips = kcalloc(tt_zone->num_trips, sizeof(*trips), GFP_KERNEL);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  400  	if (!trips)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  401  		return -ENOMEM;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  402  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  403  	i = 0;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  404  	list_for_each_entry(tt_trip, &tt_zone->trips, list_node)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  405  		trips[i++] = tt_trip->trip;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  406  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  407  	tt_zone->tz_temp = tt_zone->temp;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  408  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  409  	tz = thermal_zone_device_register_with_trips("test_tz", trips, i, tt_zone,
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  410  						     &tt_zone_ops, NULL, 0, 0);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  411  	if (IS_ERR(tz))
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  412  		return PTR_ERR(tz);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  413  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  414  	tt_zone->tz = tz;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  415  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  416  	thermal_zone_device_enable(tz);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  417  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  418  	return 0;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  419  }
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  420  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  421  int tt_zone_reg(const char *arg)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  422  {
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  423  	struct tt_thermal_zone *tt_zone;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  424  	int ret;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  425  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  426  	tt_zone = tt_get_tt_zone(arg);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  427  	if (IS_ERR(tt_zone))
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22 @428  		return PTR_ERR(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  429  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  430  	ret = tt_zone_register_tz(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  431  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  432  	tt_put_tt_zone(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  433  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  434  	return ret;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  435  }
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  436  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  437  int tt_zone_unreg(const char *arg)
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  438  {
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  439  	struct tt_thermal_zone *tt_zone;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  440  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  441  	tt_zone = tt_get_tt_zone(arg);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  442  	if (IS_ERR(tt_zone))
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22 @443  		return PTR_ERR(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  444  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  445  	tt_zone_unregister_tz(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  446  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  447  	tt_put_tt_zone(tt_zone);
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  448  
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  449  	return 0;
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  450  }
f6a034f2df426e2 Rafael J. Wysocki 2024-08-22  451  

:::::: The code at line 345 was first introduced by commit
:::::: f6a034f2df426e279f1ecad53626bab80c04796a thermal: Introduce a debugfs-based testing facility

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
