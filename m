Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7A1D6DB5
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Apr 2026 12:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948146; cv=none; b=AOIkMrp5Nj4ja066xoA6JX374Uox8SXk3SxpAvv8y0n0eeu+XHsNCUUq376cthKOhSzpBso5MrLGOyzSf8Bw7rV66+6E0tcSI/A3oGXLyukuzH1Of2aRmixwHm+FuIARB6ObJ4j1daMQTQNtkqZsQ4YphBWarKa3wt2obKMmI9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948146; c=relaxed/simple;
	bh=hVxmN+VAFbkjIO1mDzuzMaRrrK18kpIM6YWGAbk1MaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pSsJOmKnv//n0uicHdVQAqqUvOIFd6cTVKJ2YfolBarKzzYSQ1r/utzEiZBvmV4RnqE+5qasWgKEYflIBCMlXgCFRLpOkg/DVC588+1iBKg67hX5pI3d38W5sKY2K/RGnD2np2PUwXrm/acbwDo3JkogMX8FDGreKvO8oVMHQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5GEdtlc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5GEdtlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776948144; x=1808484144;
  h=date:from:to:cc:subject:message-id;
  bh=hVxmN+VAFbkjIO1mDzuzMaRrrK18kpIM6YWGAbk1MaU=;
  b=H5GEdtlcotmsioJODboy5YgTXsN1U1DOVSH8h56aRQ7fb55Ds0epe0pX
   Xzz1E20qOLijyP/HxXqcWfPoO/9rKNPDjEgXiG1Rm4ENFaiKeWi2lUAFX
   +7CNGbFQuWemyfSKYC1GaTprNUf3h9Xl618yMqfYcmV/iSSpKo6/F6+tU
   QhJNj7Wpg84ROawH6lOZa+onnpOu/V1LXn+m8KOIoNWqHmbwMmTC1NdNV
   b53wtdxRiQ7zSkoKpJjX/85c7QJ9kTYRrkeq00H3C978svLiM/KODgL6M
   I5m8HsJfLBWg1QCxwgCVYiYmf6LRrzBnZvRLOtv0a1T1arc/xZ7+FFKfy
   w==;
X-CSE-ConnectionGUID: wUClHEJ4RwWoXAWjd1S7jA==
X-CSE-MsgGUID: qNpxuq+7SvOLtb0yoFNqyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="65448236"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="65448236"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 05:42:24 -0700
X-CSE-ConnectionGUID: eHOrV37mSHWWegOw+IDEQA==
X-CSE-MsgGUID: Dlsj3I3DSGSFvcT4vA8CWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="236639032"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Apr 2026 05:42:23 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFtNr-00000000337-3dD9;
	Thu, 23 Apr 2026 12:42:19 +0000
Date: Thu, 23 Apr 2026 20:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 11/43] include/linux/spinlock.h:556
 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
Message-ID: <202604232040.ARIH2hY5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   a21c1e961de28b95099a9ca2c3774b2eee1a33bb
commit: f16a802d402d735a55731f8c94952b3bbb5ddfe8 [11/43] locking/rwlock, spinlock: Support Clang's context analysis
:::::: branch date: 4 weeks ago
:::::: commit date: 4 months ago
config: mips-randconfig-r073-20260423 (https://download.01.org/0day-ci/archive/20260423/202604232040.ARIH2hY5-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604232040.ARIH2hY5-lkp@intel.com/

New smatch warnings:
include/linux/spinlock.h:556 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_context-analysis.c:114 test_spinlock_trylock_extra() warn: mixing irq and irqsave

Old smatch warnings:
lib/test_context-analysis.c:90 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:604 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +556 include/linux/spinlock.h

54da6a0924311c Peter Zijlstra 2023-05-26  555  
e4ab322fbaaaf8 Peter Zijlstra 2023-09-17 @556  DEFINE_LOCK_GUARD_1_COND(raw_spinlock, _try, raw_spin_trylock(_T->lock))
f16a802d402d73 Marco Elver    2025-12-19  557  DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_try, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
f16a802d402d73 Marco Elver    2025-12-19  558  #define class_raw_spinlock_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_try, _T)
e4ab322fbaaaf8 Peter Zijlstra 2023-09-17  559  

:::::: The code at line 556 was first introduced by commit
:::::: e4ab322fbaaaf84b23d6cb0e3317a7f68baf36dc cleanup: Add conditional guard support

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
