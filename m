Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAA81F3D59
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442753; cv=none; b=P9WDv7slWzA81/3dJuXozJh8r9rJSFasWGcW2sBmpQcZELonyvT4qXrzGakB+iuwmy3n/iZnfV2GkbZXEHJJQlr5EKSrrJM8b6vOtrhS1u9mDondYP2+XHxcVg4f7VpX1nt002+mZmNaVB5L9sttm7a1k+n+aBdaluJJd2SeaWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442753; c=relaxed/simple;
	bh=KbON/IyCyHgs+Ki/zOn82+m71OLsB7WBDfxtme+uOcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmA/3h6CZIum8dwj5N6Rn5S5gh5t8nd24Cb0uN8uys3pHC6zwHJPTDiZgXPVO3tBgoDuFj6J3RRCHUkjN3oJ4Sj9ekavclyqyx30SSqYHRV7tlHIZB48iJQuRMaS6autaziFPtkg8f1Muw6jl5WOR4nKkFHexlJjKCxRrF6aOJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiNBzYXn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiNBzYXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734442752; x=1765978752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KbON/IyCyHgs+Ki/zOn82+m71OLsB7WBDfxtme+uOcc=;
  b=CiNBzYXnN9KkgVp7R6WWFin4jgDNQUea3cV1mBZte4lBYzlZrL9OeP4j
   lEtkhVUqDlNXRxnH5NHR6OsConGhHCPYwQY4Q3VN0Coukk5dj7FIvEPWO
   Q0KRcLhkjVTa7ZFKmSjJT9+XYlVh7zT/rXW5bW26o0Z0h7QN4P6J3FluF
   cRITrsZH51BoVVYG4qF4InHSzHtbA9p1jILlMYjRMCTLOAZ39Swu30zFx
   XmErLVRpKK7A1cJRnLj8bOdlWP6yhPMh/OYJfGRNzS7cC5nkpUzHLbey3
   96dK7WOTnkfT1PImeZB70eTpKo7UuLPcuXrxKE2MOrJN6EYQR5uBjVore
   w==;
X-CSE-ConnectionGUID: 0k20xFH4S3+zC0BJWkROrQ==
X-CSE-MsgGUID: nmT8cPOrQiajzGBty/vong==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46262783"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46262783"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:39:11 -0800
X-CSE-ConnectionGUID: ghhrVx0kSW2zhl+AhGIrag==
X-CSE-MsgGUID: KfvTjonyTS2fndcXhSY9mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102631726"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Dec 2024 05:39:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNXn1-000F1c-0w;
	Tue, 17 Dec 2024 13:39:07 +0000
Date: Tue, 17 Dec 2024 21:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 1/1] kernel/time/tick-sched.c:212
 tick_sched_do_timer() error: uninitialized symbol 'tick_cpu'.
Message-ID: <202412172110.IbsQbVfV-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   4c2c65ff08ee9a0f8d838770b1e921da2adf3fa2
commit: a94ba5ab288780f141d741107751b4866bc24be3 [1/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241217/202412172110.IbsQbVfV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412172110.IbsQbVfV-lkp@intel.com/

smatch warnings:
kernel/time/tick-sched.c:212 tick_sched_do_timer() error: uninitialized symbol 'tick_cpu'.

vim +/tick_cpu +212 kernel/time/tick-sched.c

5bb962269c29cb Frederic Weisbecker 2012-10-15  210  
5bb962269c29cb Frederic Weisbecker 2012-10-15  211  	/* Check, if the jiffies need an update */
a94ba5ab288780 Thomas Gleixner     2024-08-12 @212  	if (tick_cpu == cpu) {
5bb962269c29cb Frederic Weisbecker 2012-10-15  213  		tick_do_update_jiffies64(now);
9bdaa3fa874dbe Amir Vajid          2020-10-20  214  		trace_android_vh_jiffies_update(NULL);
9bdaa3fa874dbe Amir Vajid          2020-10-20  215  	}
ff7de6203131e3 Rafael J. Wysocki   2018-04-06  216  
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  217  	/*
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  218  	 * If jiffies update stalled for too long (timekeeper in stop_machine()
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  219  	 * or VMEXIT'ed for several msecs), force an update.
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  220  	 */
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  221  	if (ts->last_tick_jiffies != jiffies) {
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  222  		ts->stalled_jiffies = 0;
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  223  		ts->last_tick_jiffies = READ_ONCE(jiffies);
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  224  	} else {
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  225  		if (++ts->stalled_jiffies == MAX_STALLED_JIFFIES) {
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  226  			tick_do_update_jiffies64(now);
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  227  			ts->stalled_jiffies = 0;
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  228  			ts->last_tick_jiffies = READ_ONCE(jiffies);
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  229  		}
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  230  	}
a1ff03cd6fb9c5 Frederic Weisbecker 2022-02-02  231  
ff7de6203131e3 Rafael J. Wysocki   2018-04-06  232  	if (ts->inidle)
ff7de6203131e3 Rafael J. Wysocki   2018-04-06  233  		ts->got_idle_tick = 1;
5bb962269c29cb Frederic Weisbecker 2012-10-15  234  }
5bb962269c29cb Frederic Weisbecker 2012-10-15  235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
