Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B1328241
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255519; cv=none; b=RkplH3+TQnt3ihnmx979shGbqS3hyaujPUuTGfVMn/1slcrAHiuJ168duEQzrzT1CdJopbN9Vzb8pGRRx3LNiUNrtXSyITb0uHCenymRKtg0uyhXABtTvzWwakL9oTnk58KLG4SBdlgZbJHUns6Xhzbsh2ykGLW4zwvicWso13s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255519; c=relaxed/simple;
	bh=WOaSSzwvGlqZDx1bA5gTDImiyKBAvLdwaFX2QMC0FnE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P6Q40O9vOkljHyEehAQlgecJoA/f97kso4X6Xa1096hOSUGKoseS9521/PFsduQ9PKEIHpO/q0jW7F7iRywmX1B8ZHiDQaSioRbR9VW10R3cjR2BYYnlF9XXTiI38ejzWi9teiaDCII+1fkxyXAh/8YJd0SAi4NZSKWNvaOqs2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCze8H8s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCze8H8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771255518; x=1802791518;
  h=date:from:to:cc:subject:message-id;
  bh=WOaSSzwvGlqZDx1bA5gTDImiyKBAvLdwaFX2QMC0FnE=;
  b=YCze8H8sVKX+VeEETthwwO3eny5EWsQbfzI0W6nJkK+4xsiI+s5K7WqM
   H/FhUiFhWQiZwYK3+hvyAbFfPhMu22W+ks+iVQBgcGloxd3RJjtTFwd32
   yQfHF3X4tO4B8Q+4Us+pMICO0FJE4Jh6R7r7olkXZdTagVQlXyE7Znq+4
   OD7xryT6EDYEEarJYbgk1Xe/PD1vkJQwWjqehkb4aLYP/xD6iOgJXb6/O
   bTjZnF/coT5SDrES+c1YoERaPOZX+lDg+A4CCOye3Y5UY1WHzxIhbnfye
   gjP0wrkFPu6dDFnGSFpRlfJZUPkIHCUIDtqlXK5pc8fK0d1jQ5clCXQCK
   w==;
X-CSE-ConnectionGUID: EH3U9pnCTR2X6W5+oHiT+g==
X-CSE-MsgGUID: OYc0tnwcSUGcKHHXzQX/fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="59904481"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="59904481"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 07:25:13 -0800
X-CSE-ConnectionGUID: jDfJbPt+Tey6D8S+gxG2Kw==
X-CSE-MsgGUID: 4n3ytbr+SyWmMSMCSoJfIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212733371"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Feb 2026 07:25:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs0TF-0000000101C-3gHH;
	Mon, 16 Feb 2026 15:25:09 +0000
Date: Mon, 16 Feb 2026 23:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/mutex.h:226 class_mutex_try_constructor()
 warn: passing zero to 'ERR_PTR'
Message-ID: <202602162315.vUv0w8Nb-lkp@intel.com>
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
CC: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: 857d18f23ab17284d1b6de6f61f4e74958596376 cleanup: Introduce ACQUIRE() and ACQUIRE_ERR() for conditional locks
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: um-randconfig-r071-20260215 (https://download.01.org/0day-ci/archive/20260216/202602162315.vUv0w8Nb-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602162315.vUv0w8Nb-lkp@intel.com/

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
