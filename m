Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4151E370
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Nov 2024 00:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731544622; cv=none; b=ahQtb1TyovFy8KxhubDhKVFVzRrFD7K1GG2W0I/mAH6deYsA6Hni+h4KK0vApqI1X5Pa9IL3/nCB3NsfbARI5OoW83qWZG0tHSPxurADQQoJx/oFRn9NnXOV/CXd2plVoojaPERlHcPzW0Pnmpad5+XuSb/xU1qY14LPXqdKJ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731544622; c=relaxed/simple;
	bh=LJaErNT60eT48nurb1I80FU7/KDCOPGXTbECcVE+L9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q4TUGqGzQUqRb7c6UsszPk2piioCguDVtRNun+PMWNFCq9SCI/SzoCsbPeKMF8gKqR7QITMgbj0yYzNwY7unPBdnJH1mJve3g4OCmtERGu6oeq2rDjQv+5GwHDeYVwY6/tnIEFuqndJJXHoZy3rxrZPNB+bcoepFGa6FDHbuVgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUr+C47m; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUr+C47m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731544620; x=1763080620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJaErNT60eT48nurb1I80FU7/KDCOPGXTbECcVE+L9A=;
  b=RUr+C47mHcgoPg8OZCZB5s+iEZDiipIcRvOhkfqWoyLtCUH1QDyQtAEM
   lsrJDXZPmcNxqp2x5cOGXYOCoWAPG+qvZsLHdUBeXMbOClWTINRUEBh6N
   JhQQl+Zlpd7UL/AOBxKs68Ha5ZVW8yitYe0yNuRESxQ5wA6Fctm26Tooc
   psQ0ATeruMgxdr49up4oFcblIuCxMz33JD50hviXHrBvKh87JsrUXQXaM
   lgvmBJ5puT0mMQM137EGnPxeXxFjmcbYIiIK2JDRUJRKt2xynTveCRI5h
   snaQI6G5e0TAsI8AOT86ncRhZRTsliqQLLgh0+XLYmVCFLNek7uw5SOy5
   w==;
X-CSE-ConnectionGUID: 4xN9hllBRreszf9MyXJVmw==
X-CSE-MsgGUID: X7mSCXkBTciT2Gj4LMQLIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="56854492"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="56854492"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 16:36:59 -0800
X-CSE-ConnectionGUID: Qe5kEm13SpmgOjCNlj4BXA==
X-CSE-MsgGUID: Yz9YN3FlROCjp6nBdRmMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="87791113"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2024 16:36:58 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBNqy-0000z7-1J;
	Thu, 14 Nov 2024 00:36:56 +0000
Date: Thu, 14 Nov 2024 08:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 447/448] drivers/thermal/testing/zone.c:333
 tt_zone_add_trip() error: uninitialized symbol 'tt_zone'.
Message-ID: <202411140825.w4TfKdbS-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   d1bf954af846f66ac2ea07b2457b4a089a009c08
commit: 498ea32432db6f2a0bce88fd521e529a58a370c4 [447/448] thermal: testing: Use DEFINE_FREE() and __free() to simplify code
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140825.w4TfKdbS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411140825.w4TfKdbS-lkp@intel.com/

New smatch warnings:
drivers/thermal/testing/zone.c:333 tt_zone_add_trip() error: uninitialized symbol 'tt_zone'.
drivers/thermal/testing/zone.c:333 tt_zone_add_trip() error: uninitialized symbol 'tt_zone'.

Old smatch warnings:
drivers/thermal/testing/zone.c:188 tt_add_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:240 tt_del_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:335 tt_zone_add_trip() error: uninitialized symbol 'tt_trip'.
drivers/thermal/testing/zone.c:390 tt_zone_register_tz() error: uninitialized symbol 'trips'.

vim +/tt_zone +333 drivers/thermal/testing/zone.c

f6a034f2df426e Rafael J. Wysocki 2024-08-22  330  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  331  int tt_zone_add_trip(const char *arg)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  332  {
498ea32432db6f Rafael J. Wysocki 2024-11-10 @333  	struct tt_thermal_zone *tt_zone __free(put_tt_zone);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  334  	struct tt_work *tt_work __free(kfree);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  335  	struct tt_trip *tt_trip __free(kfree);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  336  	int id;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  337  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  338  	tt_work = kzalloc(sizeof(*tt_work), GFP_KERNEL);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  339  	if (!tt_work)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  340  		return -ENOMEM;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  341  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  342  	tt_trip = kzalloc(sizeof(*tt_trip), GFP_KERNEL);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  343  	if (!tt_trip)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  344  		return -ENOMEM;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  345  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  346  	tt_zone = tt_get_tt_zone(arg);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  347  	if (IS_ERR(tt_zone))
f6a034f2df426e Rafael J. Wysocki 2024-08-22  348  		return PTR_ERR(tt_zone);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  349  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  350  	id = ida_alloc(&tt_zone->ida, GFP_KERNEL);
498ea32432db6f Rafael J. Wysocki 2024-11-10  351  	if (id < 0)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  352  		return id;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  353  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  354  	tt_trip->trip.type = THERMAL_TRIP_ACTIVE;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  355  	tt_trip->trip.temperature = THERMAL_TEMP_INVALID;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  356  	tt_trip->trip.flags = THERMAL_TRIP_FLAG_RW;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  357  	tt_trip->id = id;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  358  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  359  	guard(tt_zone)(tt_zone);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  360  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  361  	list_add_tail(&tt_trip->list_node, &tt_zone->trips);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  362  	tt_zone->num_trips++;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  363  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  364  	INIT_WORK(&tt_work->work, tt_zone_add_trip_work_fn);
498ea32432db6f Rafael J. Wysocki 2024-11-10  365  	tt_work->tt_zone = no_free_ptr(tt_zone);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  366  	tt_work->tt_trip = no_free_ptr(tt_trip);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  367  	schedule_work(&(no_free_ptr(tt_work)->work));
f6a034f2df426e Rafael J. Wysocki 2024-08-22  368  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  369  	return 0;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  370  }
f6a034f2df426e Rafael J. Wysocki 2024-08-22  371  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
