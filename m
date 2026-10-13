Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE4953B60B
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Oct 2026 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920157; cv=none; b=PanhBL5MMFYaEAwTtwye3uInBbigps7BMO8IFRaVz3WE+aLWh/pz7AjmW1lHfpflW3EXAslDLI9C8V5A0VKRgkcOOjxMun/zjoq+5hU2VHAP7KXevSZMNaEyRkhScADLQE8IzETnLC02NaKRZZWk6TWl5Y1KOmh+ylmjGQUah5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920157; c=relaxed/simple;
	bh=T7UnctNm+ZZJUsDdQl8SUAanKZvXsj8sJCwDzA4xBIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mXhEtppBKkfJQh5b4iQDpJwYd5hSvRY40/fa2bXiszUKvNGJNnyjHoKFlprExY3oawKXBUIr9IZ3UADsW+Vx6qfvUTQi/6IpghHez4VrnUWkoSGHf4dCzACr1ZNZriPM0aw6H0lkhZjQhvfHqqk7T1LyAxK6o1amFEMW4/3KFqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJF2lI5+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJF2lI5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791920155; x=1823456155;
  h=date:from:to:cc:subject:message-id;
  bh=T7UnctNm+ZZJUsDdQl8SUAanKZvXsj8sJCwDzA4xBIY=;
  b=eJF2lI5+/7vvFGhjgrGHgNv1rNAec+lRFC0yctdxVXiZfJA1bpWMIv5j
   8RHANOe9kD4KE0GnxkfD4msifMIaIl2ybu7xfKjtFfa4xXNXlk0Pu5zzZ
   GZ2oSFpcufxQ9ppU5uDyj4W+w6vil1nhpm+u8hAScfWBTBc00Mu23ohLK
   67wT2wjfREy2D49uRhGMWO7sC15srT/j3P+ABMCCgnU5sEHAqQawu3fvx
   VWfa8oDOv1fDgQC8JJRDfDgzuE+m4qVzA/Ees+r6KZ1acXXqUsVuAQyAA
   uCs82IG7dDRGtW/dmCG+cRkFM9cLlfciDahYYVNPixKxNek1IPyuM3bwH
   A==;
X-CSE-ConnectionGUID: BvzymhnjQUSmndgS/dbY2Q==
X-CSE-MsgGUID: Id+mVAAoRSmWo3ApOshI0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="667449"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="667449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:35:54 -0700
X-CSE-ConnectionGUID: zwoLgEc7QRyhDop1ujiUoA==
X-CSE-MsgGUID: tyOu0Bb8TRuVi/F0KhtO7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1275278"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 13 Oct 2026 12:35:54 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGiHv-00000000AdD-2vnt;
	Tue, 13 Oct 2026 19:35:51 +0000
Date: Tue, 13 Oct 2026 21:35:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6617/16276] include/linux/spinlock.h:626
 class_spinlock_irqsave_try_constructor() warn: passing zero to 'ERR_PTR'
Message-ID: <202610132133.2qxXMlYV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eb2586bd40db27d77cc5b724ca9386ed0c71d53
commit: 21f6c39938a10abfc98961000b04b55fa0e70d89 [6617/16276] Input: gscps2 - serialize concurrent interrupt handlers
:::::: branch date: 25 hours ago
:::::: commit date: 3 weeks ago
config: parisc-randconfig-r2202-20261012 (https://download.01.org/0day-ci/archive/20261013/202610132133.2qxXMlYV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610132133.2qxXMlYV-lkp@intel.com/

smatch warnings:
include/linux/spinlock.h:626 class_spinlock_irqsave_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +626 include/linux/spinlock.h

54da6a0924311c Peter Zijlstra 2023-05-26  625  
e4ab322fbaaaf8 Peter Zijlstra 2023-09-17 @626  DEFINE_LOCK_GUARD_1_COND(spinlock_irqsave, _try,
e4ab322fbaaaf8 Peter Zijlstra 2023-09-17  627  			 spin_trylock_irqsave(_T->lock, _T->flags))
f16a802d402d73 Marco Elver    2025-12-19  628  DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irqsave_try, __acquires(_T), __releases(*(spinlock_t **)_T))
f16a802d402d73 Marco Elver    2025-12-19  629  #define class_spinlock_irqsave_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irqsave_try, _T)
e4ab322fbaaaf8 Peter Zijlstra 2023-09-17  630  

:::::: The code at line 626 was first introduced by commit
:::::: e4ab322fbaaaf84b23d6cb0e3317a7f68baf36dc cleanup: Add conditional guard support

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
