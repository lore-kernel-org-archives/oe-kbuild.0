Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C7B26F476
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777830453; cv=none; b=mlscoZBk9GkKeexg9uPrKE4rP9ZlIcYoY4VpYBpyIYM2CW1qp2YXMoSnHdOZN9yHr6y6brmM1gY+lcgPywK/05rwcpx20Xe5KZrlsW6YP8/DEbJ1HuTU8nZl1vC8p4PT5cwNNr2mI0tYEqfd+seXHUG87Y9AWDlSD6iudg4nMEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777830453; c=relaxed/simple;
	bh=8tIzpxEhkOf6YV6uaJNWKAurjORsy0Jksqze1i8iSUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eUeK3jsjCZ+hVHWI569FnyXnhe5hb8vgR4t02rIO5ohRntMtjxhz6GPhwpheu1LHxPA8r6B5tQUXqdqjzYKjn10LkEyiSJ/4mgCONhXluSm3xj8WeP9dULWWauyAVV9j+Ne5oXyMs68u2+Ow+zlGBBwzWcwr8aQPuewU4u3QM3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUDYDOBv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUDYDOBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777830452; x=1809366452;
  h=date:from:to:cc:subject:message-id;
  bh=8tIzpxEhkOf6YV6uaJNWKAurjORsy0Jksqze1i8iSUo=;
  b=HUDYDOBvow1YEqDlSFcHAXpClVXKgb164hCUvUYHnWcR04ocDpMJyg0y
   Yxnqo4qwNPDFu5nqy1ih6HNhyu1usq7fSy7j+ou8b5jYNxGn4r/2gkqHt
   XJE8zfiCtfKML5BPxpfZzhrXSaERHWa+r5NyrosfyXRrnxtsz2Pcc4rhz
   SW2baIl4ETWdXYZ40uy0RgARRy3lg6zy6oNrXOwP7OUajmhP73xgO8BJG
   rm208Qt3FB5vt3L7lEBPNmXxVpMnF+KcHaYQezxOlBYL7zPvK2CMfIfvu
   5aZMvANjrcY37JEMRRSbG3LHsXgdGd0Rjqn6RiR2Gr9jJd/zE7QxC4lVC
   g==;
X-CSE-ConnectionGUID: UamifEo6SdO5zUhfm4hH8Q==
X-CSE-MsgGUID: 6nm6SkdIQ9qgZ/1PBy8fuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82559766"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="82559766"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 10:47:31 -0700
X-CSE-ConnectionGUID: nsYCHrZ7Rwm6+oc4R06MfA==
X-CSE-MsgGUID: 7K+m7mIpQRW+qqe5fUZ9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="237102347"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 May 2026 10:47:30 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJauR-000000002pb-2QMx;
	Sun, 03 May 2026 17:47:19 +0000
Date: Mon, 04 May 2026 01:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/ptp/ptp_vmclock.c:392:24: warning: unused variable
 'st'
Message-ID: <202605040151.8XwAzkix-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Arthur-Kiyanovski/ptp-Add-ioctls-for-PHC-timestamps-with-quality-attributes/20260501-120618, commit: df313359b943b68d54c834330766e4f1d3afade0"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Arthur Kiyanovski <akiyano@amazon.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Arthur-Kiyanovski/ptp-Add-ioctls-for-PHC-timestamps-with-quality-attributes/20260501-120618
head:   02bdf82208619595607dd1a4004fa7b729f7b43a
commit: df313359b943b68d54c834330766e4f1d3afade0 ptp: ptp_vmclock: Implement attributes ioctls
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-001-20260503 (https://download.01.org/0day-ci/archive/20260504/202605040151.8XwAzkix-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040151.8XwAzkix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040151.8XwAzkix-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'ptp_vmclock_do_getcrosststamp':
>> drivers/ptp/ptp_vmclock.c:392:24: warning: unused variable 'st' [-Wunused-variable]
     struct vmclock_state *st = vctx->st;
                           ^~


vim +/st +392 drivers/ptp/ptp_vmclock.c

20503272422693d David Woodhouse   2024-10-06  388  
df313359b943b68 Arthur Kiyanovski 2026-04-30  389  static int ptp_vmclock_do_getcrosststamp(struct vmclock_crosststamp_ctx *vctx,
20503272422693d David Woodhouse   2024-10-06  390  					 struct system_device_crosststamp *xtstamp)
20503272422693d David Woodhouse   2024-10-06  391  {
df313359b943b68 Arthur Kiyanovski 2026-04-30 @392  	struct vmclock_state *st = vctx->st;
df313359b943b68 Arthur Kiyanovski 2026-04-30  393  	int ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn, vctx,
20503272422693d David Woodhouse   2024-10-06  394  						NULL, xtstamp);
20503272422693d David Woodhouse   2024-10-06  395  #ifdef SUPPORT_KVMCLOCK
20503272422693d David Woodhouse   2024-10-06  396  	/*
20503272422693d David Woodhouse   2024-10-06  397  	 * On x86, the KVM clock may be used for the system time. We can
20503272422693d David Woodhouse   2024-10-06  398  	 * actually convert a TSC reading to that, and return a paired
20503272422693d David Woodhouse   2024-10-06  399  	 * timestamp that get_device_system_crosststamp() *can* handle.
20503272422693d David Woodhouse   2024-10-06  400  	 */
20503272422693d David Woodhouse   2024-10-06  401  	if (ret == -ENODEV) {
20503272422693d David Woodhouse   2024-10-06  402  		struct system_time_snapshot systime_snapshot;
20503272422693d David Woodhouse   2024-10-06  403  
20503272422693d David Woodhouse   2024-10-06  404  		ktime_get_snapshot(&systime_snapshot);
20503272422693d David Woodhouse   2024-10-06  405  
20503272422693d David Woodhouse   2024-10-06  406  		if (systime_snapshot.cs_id == CSID_X86_TSC ||
20503272422693d David Woodhouse   2024-10-06  407  		    systime_snapshot.cs_id == CSID_X86_KVM_CLK) {
20503272422693d David Woodhouse   2024-10-06  408  			WRITE_ONCE(st->sys_cs_id, systime_snapshot.cs_id);
20503272422693d David Woodhouse   2024-10-06  409  			ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn,
df313359b943b68 Arthur Kiyanovski 2026-04-30  410  							    vctx, NULL, xtstamp);
20503272422693d David Woodhouse   2024-10-06  411  		}
20503272422693d David Woodhouse   2024-10-06  412  	}
20503272422693d David Woodhouse   2024-10-06  413  #endif
20503272422693d David Woodhouse   2024-10-06  414  	return ret;
20503272422693d David Woodhouse   2024-10-06  415  }
20503272422693d David Woodhouse   2024-10-06  416  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
