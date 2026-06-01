Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306693009E2
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321487; cv=none; b=dOz3xyzIYqeT/lJjAD3QjnxDPGyHrm/+nVivZDbBooAgk+pCnKDBk7UmmfZsOdvcW+sfmJL6ElW9WSar0Hgpwigp2gdQ5fAIOZ2BCJMziCcnZPTyw1ssdDG5Yq6/3QZqUaRH5KsGlQwkjlGNCOBVKqJ5GTC2v4fpbfsjc2SvCOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321487; c=relaxed/simple;
	bh=eQD6NUrhhC6yFlwb6ZpY498+L6Ru9nM/IJp3k7kaHXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y3+roGu5+uceFrsNN5VB8C3nTYsq2jVjYuSwBcP6jnGNMKgZGWy2xKb+0dTj7ia0F1wu2t4d9Fy2NJbCBKV/DdkmWh2QC7iHBTaWFMZNeob3ojNl363MJ09xi6fBPb4xivC/i5IIInqVUcLvab+0K4JgG4D+MxHjm3BuZNHgj9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msyGSbs7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msyGSbs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780321486; x=1811857486;
  h=date:from:to:cc:subject:message-id;
  bh=eQD6NUrhhC6yFlwb6ZpY498+L6Ru9nM/IJp3k7kaHXM=;
  b=msyGSbs7pnZAMeTwC1f4mAfOMx9vFs6i/o22hTMHuEnbjCAJI+T8286g
   ySwDyEXz+fOoHWHdJNgDjD3YJoPEcP8YwB8R31dOBzUwpC/ZH3jtUD6XR
   +1aWJzSKoQUqI7B4LLDtq99JT2UpbzqXMtoLRyvEkb7iNC4otPVEOWuVI
   jzJ2yY+MDWZ4EGgpUAP5xT8FD91A16RnQ/FHWUhmMTkoelOUU7mOCSI7b
   BAJK7j6vHm3pJCGozhu/lwUj5kSuBcb6BY8drZyBbToYRC6qvfZ2frxbG
   3neR6g9N0pY2mciMP8DtU08R40toV8CSjVGvtCqd805PNUHyR5fPrYTa9
   g==;
X-CSE-ConnectionGUID: V4qsVx/2TtenhjbNzeP1Qg==
X-CSE-MsgGUID: FQF6Q9z2QTaYBrEIoq5VpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81190771"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81190771"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 06:44:46 -0700
X-CSE-ConnectionGUID: 02oaRLXJR1ijxhfZFwzn6Q==
X-CSE-MsgGUID: /AkEoZsQTWSOC1z7fAZn3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="239405053"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jun 2026 06:44:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU2wc-00000000Acy-16gr;
	Mon, 01 Jun 2026 13:44:42 +0000
Date: Mon, 01 Jun 2026 21:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/mutex.h:226 class_mutex_try_constructor()
 warn: passing zero to 'ERR_PTR'
Message-ID: <202606012143.SOfXUucy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 857d18f23ab17284d1b6de6f61f4e74958596376 cleanup: Introduce ACQUIRE() and ACQUIRE_ERR() for conditional locks
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-r071-20260601 (https://download.01.org/0day-ci/archive/20260601/202606012143.SOfXUucy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 857d18f23ab1 ("cleanup: Introduce ACQUIRE() and ACQUIRE_ERR() for conditional locks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606012143.SOfXUucy-lkp@intel.com/

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
