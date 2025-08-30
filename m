Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4563A42049
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 04:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756528389; cv=none; b=QtaQBNtPXmCiG55Pvygtc95JMD34tgjZ/DO4LeStTh4qA+2y35VbXQzbt4W6uVuXx2Krd9WRh2Ki6zqtLfWLS66023f+odSROldDbGGrZfHY695ajNyfk1nCrBZbP7aHh+WE4iED/WZ3UpSPgZPQQqjw/Z0yRhm88g6D2AWhhqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756528389; c=relaxed/simple;
	bh=Rbfb9lSCtnm5Kyxe1KyowawdPD0trOI8zK2gxgAbcWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n4iOSCs/WgmkYHq+6yuIA6aJItyNr6LGthl7LYdLZlDvm+Ol7dMClvplE1djeluRND01TROycLI/i//9s7qyotVQ3Tf8F2gPvsiaxoGsMZz+wM6oinSS8tJ7lSNZ29CPzXN5Zoa8e6vSEOTmPlcJyQuG/QnkuNoMVL5dEBszkwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nha3naiS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nha3naiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756528387; x=1788064387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rbfb9lSCtnm5Kyxe1KyowawdPD0trOI8zK2gxgAbcWs=;
  b=nha3naiSyKHGWsuGMic5TPVspWRwd9u8jaFILi7fQCyxqB34p0wF5L8n
   /Q9q9CjWRljT3EJELvtF4cYm0vzDVY0PNHIuhRupLzlJiHxuF471eq7UV
   UIKMLwjb/rQDNSwbylCP5qPS1uGs8f8YxK9mxOVDaKdQgXUekKqoZfxxK
   WZzFQL6Hp5TjAISsSM+xBL4ZRmgVJ4yI6kVAz3MZhw0Kpq/gvfl/NAmGI
   7FN6uGDgtONSu02vOM1QC68XKxlgcqWVLT2ZEyyL7qxBeeLe4Pbu2SZSk
   ziG0c1+O0pp5fvIchOWl+ujkTIptA/9PY5M3gOPKfYrgwd88RrYvLy9we
   g==;
X-CSE-ConnectionGUID: S4jUbI6aTkKiAH+zgeHA9Q==
X-CSE-MsgGUID: XyD4RHAAR2KZK//GLaKmLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69519129"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69519129"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 21:33:06 -0700
X-CSE-ConnectionGUID: YMjwPsKuSEyqOeY8ARRBRQ==
X-CSE-MsgGUID: 5HlbHLkYTRa+lzU+0gEiZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170907728"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Aug 2025 21:33:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usDGx-000VAV-0Y;
	Sat, 30 Aug 2025 04:33:03 +0000
Date: Sat, 30 Aug 2025 12:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/mutex.h:226 class_mutex_try_constructor() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202508301208.YtAc26lq-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11e7861d680c3757eab18ec0a474ff680e007dc4
commit: 857d18f23ab17284d1b6de6f61f4e74958596376 cleanup: Introduce ACQUIRE() and ACQUIRE_ERR() for conditional locks
date:   6 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
config: powerpc-randconfig-r072-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301208.YtAc26lq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508301208.YtAc26lq-lkp@intel.com/

smatch warnings:
include/linux/mutex.h:226 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +226 include/linux/mutex.h

b1fca26631f76a Eric Paris     2009-03-23  224  
54da6a0924311c Peter Zijlstra 2023-05-26  225  DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
e4ab322fbaaaf8 Peter Zijlstra 2023-09-17 @226  DEFINE_GUARD_COND(mutex, _try, mutex_trylock(_T))
857d18f23ab172 Peter Zijlstra 2025-07-11  227  DEFINE_GUARD_COND(mutex, _intr, mutex_lock_interruptible(_T), _RET == 0)
54da6a0924311c Peter Zijlstra 2023-05-26  228  

:::::: The code at line 226 was first introduced by commit
:::::: e4ab322fbaaaf84b23d6cb0e3317a7f68baf36dc cleanup: Add conditional guard support

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
