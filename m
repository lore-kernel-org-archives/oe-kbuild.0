Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246C2367D7
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Sep 2025 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759075073; cv=none; b=kpRQkZZryGtXlEwWulLKdYeIofBYma9RcK1KDwn+lYtGvUfxIE1TylQzu758ME/kPlukfVbXLWBiYs7w6UwQRsxk/7IJcnfCACAHTcrQzgZpftVX5TtDGLPRyijq6gFUeO41GaoxfPaT+dN1kbj70ZKCUIAZ8sTeyyx5u5LUs4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759075073; c=relaxed/simple;
	bh=k7ozT/0j5jI6IhqiEv2uSAMrl6QwtrTLU49klOQdVcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K1gPHVXECXKk7l/lAsJilRbr74DQ8/9O/LwSLKjsyjgl5ySLGRt8znAGkyDjGbcGAY2QpIvx58hXfBMyASiEjDQnMWucS6e7MwG7NT2zj3Hnl2jOk0YkFTPh3Jf0YqYvRvjCLnzvszOtgB7d6L8FoIDnOhUc4e1Ie1wuG4/jTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiuZz9JJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiuZz9JJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759075072; x=1790611072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7ozT/0j5jI6IhqiEv2uSAMrl6QwtrTLU49klOQdVcg=;
  b=eiuZz9JJzLgexXbOG20T5CSTYEGFJkawqDw40E85FuIbal3RQBPGmhTL
   ixNVxxosDW1iQXhp9jmpuxZzVnxSjYpU7z9a49RaKaQ2JcO6VTu9LtjwI
   GMHQf8AXvhcPJKavY6VddRTYJYNgkgIV2rf9c5asXFyTOk9y2JK1+kPS7
   YhsKq3GzvKZLCwTkR0InLncE4iEbaZyzfukZBniMM8ZN41Be8TBWNEzbO
   PKSS1wFoyKupvZZivY1rD7JDqyFjkdZpv1h0whGJNrwrB+AaLloTpvZM2
   FsWpk7SiyCLayTZjRq9IbQXB8woZvtXD7hBZiuuyzj9BYLCth5UX2l5yN
   Q==;
X-CSE-ConnectionGUID: l+fWQcAcR9ywJ1GXpeV5Yw==
X-CSE-MsgGUID: L1Na3ieiS/qUrZviEgA6Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61223149"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="61223149"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 08:57:51 -0700
X-CSE-ConnectionGUID: RFYGroM0QeWM98Cjz+ymdw==
X-CSE-MsgGUID: hHluKz+WQXWxW68O3kEpcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="215162667"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Sep 2025 08:57:50 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2tm9-0007tT-08;
	Sun, 28 Sep 2025 15:57:45 +0000
Date: Sun, 28 Sep 2025 23:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 201/217] include/linux/pm_runtime.h:630
 class_pm_runtime_active_try_constructor() warn: passing zero to 'ERR_PTR'
Message-ID: <202509282339.5cGL81At-lkp@intel.com>
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
CC: linux-pm@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   11c0c0dd019710f162cd5d246a4efdbaefdac48b
commit: c160b0ae78a547a69b2990cf0756934b5cd44b87 [201/217] PCI/sysfs: Use runtime PM guard macro for auto-cleanup
:::::: branch date: 5 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20250928 (https://download.01.org/0day-ci/archive/20250928/202509282339.5cGL81At-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509282339.5cGL81At-lkp@intel.com/

smatch warnings:
include/linux/pm_runtime.h:630 class_pm_runtime_active_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +630 include/linux/pm_runtime.h

15bcb91d7e607d Alan Stern        2010-09-25  618  
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  619  DEFINE_GUARD(pm_runtime_active, struct device *,
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  620  	     pm_runtime_get_sync(_T), pm_runtime_put(_T));
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  621  DEFINE_GUARD(pm_runtime_active_auto, struct device *,
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  622  	     pm_runtime_get_sync(_T), pm_runtime_put_autosuspend(_T));
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  623  /*
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  624   * Use the following guards with ACQUIRE()/ACQUIRE_ERR().
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  625   *
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  626   * The difference between the "_try" and "_try_enabled" variants is that the
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  627   * former do not produce an error when runtime PM is disabled for the given
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  628   * device.
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  629   */
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26 @630  DEFINE_GUARD_COND(pm_runtime_active, _try,
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  631  		  pm_runtime_get_active(_T, RPM_TRANSPARENT))
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  632  DEFINE_GUARD_COND(pm_runtime_active, _try_enabled,
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  633  		  pm_runtime_resume_and_get(_T))
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  634  DEFINE_GUARD_COND(pm_runtime_active_auto, _try,
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  635  		  pm_runtime_get_active(_T, RPM_TRANSPARENT))
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  636  DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enabled,
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  637  		  pm_runtime_resume_and_get(_T))
9a0b47ccadccdb Rafael J. Wysocki 2025-09-26  638  

:::::: The code at line 630 was first introduced by commit
:::::: 9a0b47ccadccdb73ae09f2e10af4bb2c0e6d906e PM: runtime: Add auto-cleanup macros for "resume and get" operations

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
