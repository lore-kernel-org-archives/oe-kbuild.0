Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD338C2B8
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Apr 2026 19:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971970; cv=none; b=mADoiID2yYIeqX8gHq0esH+PWEjKwoQXfzu7CL4A+jKzwFE6jdxOdIbIfb0mDoy4ZAiUQ/8tBcB4l3H2+PGj9pgoci7AtCS1CIjtjAKhuW2XkdgkwC4TCo2ZcXk9v+7OhH6q6CVHFKvAaAi5Vptq+qq0z+k1tTtyczrCnQAiXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971970; c=relaxed/simple;
	bh=ZN6WOKRsZG4pkEix56vlBh3wZfBQg5iHnFiQ+qEKcQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=myplkW+iCnEgyU/P+1MgsatIpZkx66LkImGmEEOFL3d61eIASajApuwUqhWM/tVMkt3cfcCDuF3BBOmn1U2H28A2bRY4Ura1M+LbKMJmyhyRv1xa3fWMwESS6P4y53RiH2itFQkHHvsFkkaTJeybqzjomjzGUMjmPIqVjbnN5z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0hwcTph; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0hwcTph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776971969; x=1808507969;
  h=date:from:to:cc:subject:message-id;
  bh=ZN6WOKRsZG4pkEix56vlBh3wZfBQg5iHnFiQ+qEKcQs=;
  b=U0hwcTphYxW7v0xSFTncJ+6kRtgJezTG6ewqvXzi5OJECGpyCMK1v/+A
   l1oUgT/v5s/KvtRzTqv4N6iOULX4gZMS3TFw51vJ/pruNxEB9apAVJ0gO
   Ci8miHfwZQnSgtKWTrZK70xCUOYlTujzDyN9NyhKltHCQk9UPCYN5AWJ6
   +ozV/tIDEcgDd7jXFhZUHbpRj1vz038OOWPI6vR/LysbkeJNJHYxO04lj
   jWGtdv4WhiufbJGTxZak5G3CAGmdNvQUVuBwyOQC71ovl7aV8NJaFDfLA
   eh2mUis9KZ3jRjKyonZEDUXCNxKlqeZcRFYiD+/W2pw7BuLYZBmfpTKbq
   A==;
X-CSE-ConnectionGUID: VQS4poK2TeG2CxGeIqx6Lw==
X-CSE-MsgGUID: qMGzBmb7Ra2hppx2tZD2ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="103413219"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="103413219"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 12:19:29 -0700
X-CSE-ConnectionGUID: dGrZJpYWRx+5LaoSYnu4YQ==
X-CSE-MsgGUID: OQynwTYVQqWUoyfCsTnGDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="231876617"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Apr 2026 12:19:28 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFza8-000000004Tt-30iD;
	Thu, 23 Apr 2026 19:19:24 +0000
Date: Fri, 24 Apr 2026 03:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 20/43] include/linux/rwsem.h:262
 class_rwsem_read_try_constructor() warn: passing zero to 'ERR_PTR'
Message-ID: <202604240345.beAsG12p-lkp@intel.com>
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
commit: e4fd3be884cf33a42c5bcde087b0722a5b8f25ca [20/43] locking/rwsem: Support Clang's context analysis
:::::: branch date: 4 weeks ago
:::::: commit date: 4 months ago
config: mips-randconfig-r073-20260423 (https://download.01.org/0day-ci/archive/20260424/202604240345.beAsG12p-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604240345.beAsG12p-lkp@intel.com/

New smatch warnings:
include/linux/rwsem.h:262 class_rwsem_read_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/rwsem.h:273 class_rwsem_write_try_constructor() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
lib/test_context-analysis.c:96 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:556 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_context-analysis.c:120 test_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:604 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/mutex.h:255 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +262 include/linux/rwsem.h

e4fd3be884cf33 Marco Elver 2025-12-19  260  
e4fd3be884cf33 Marco Elver 2025-12-19  261  DEFINE_LOCK_GUARD_1(rwsem_read, struct rw_semaphore, down_read(_T->lock), up_read(_T->lock))
e4fd3be884cf33 Marco Elver 2025-12-19 @262  DEFINE_LOCK_GUARD_1_COND(rwsem_read, _try, down_read_trylock(_T->lock))
e4fd3be884cf33 Marco Elver 2025-12-19  263  DEFINE_LOCK_GUARD_1_COND(rwsem_read, _intr, down_read_interruptible(_T->lock), _RET == 0)
e4fd3be884cf33 Marco Elver 2025-12-19  264  
e4fd3be884cf33 Marco Elver 2025-12-19  265  DECLARE_LOCK_GUARD_1_ATTRS(rwsem_read, __acquires_shared(_T), __releases_shared(*(struct rw_semaphore **)_T))
e4fd3be884cf33 Marco Elver 2025-12-19  266  #define class_rwsem_read_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(rwsem_read, _T)
e4fd3be884cf33 Marco Elver 2025-12-19  267  DECLARE_LOCK_GUARD_1_ATTRS(rwsem_read_try, __acquires_shared(_T), __releases_shared(*(struct rw_semaphore **)_T))
e4fd3be884cf33 Marco Elver 2025-12-19  268  #define class_rwsem_read_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(rwsem_read_try, _T)
e4fd3be884cf33 Marco Elver 2025-12-19  269  DECLARE_LOCK_GUARD_1_ATTRS(rwsem_read_intr, __acquires_shared(_T), __releases_shared(*(struct rw_semaphore **)_T))
e4fd3be884cf33 Marco Elver 2025-12-19  270  #define class_rwsem_read_intr_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(rwsem_read_intr, _T)
e4fd3be884cf33 Marco Elver 2025-12-19  271  
e4fd3be884cf33 Marco Elver 2025-12-19  272  DEFINE_LOCK_GUARD_1(rwsem_write, struct rw_semaphore, down_write(_T->lock), up_write(_T->lock))
e4fd3be884cf33 Marco Elver 2025-12-19 @273  DEFINE_LOCK_GUARD_1_COND(rwsem_write, _try, down_write_trylock(_T->lock))
e4fd3be884cf33 Marco Elver 2025-12-19  274  DEFINE_LOCK_GUARD_1_COND(rwsem_write, _kill, down_write_killable(_T->lock), _RET == 0)
e4fd3be884cf33 Marco Elver 2025-12-19  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
