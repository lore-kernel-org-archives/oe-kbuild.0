Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D035F8C5
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 16:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804919; cv=none; b=E6+H3fnRbdw6kNFyAk/zgFSJZ+r8Kq5iyZoPpnq27fqojT1Z3QVAXlDKmw7mjqV7JjLq45E+GLYoTRSbM6tpShpH6fsG6jUvbm8SropvHFTOUqEpS2YrFVFqKqCinLeBBlujdDuFEMKv3YxWsMz6T8tHH/WYINmDCo3CInOMRh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804919; c=relaxed/simple;
	bh=0Ygkw9bO0CbDbT9ItXnIzNt7h4YIZ9zx0Z02JBo56HU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X20BFU2TIaFHONEqiDEwDYBnIUsY9c6z6ViId3RXyaGfSxHDulIZJu+zT4eMRh49QPc6bA10yA+7jNOKeETUlLHvWkkP6Y1C/7RxwuOy7zn+353DMsmAnNhj8ndthX3g0jrp803Anb0maBOk/VocbcpwoKEGoP+8/AAUGeI1agA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGXpoKIo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGXpoKIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767804910; x=1799340910;
  h=date:from:to:cc:subject:message-id;
  bh=0Ygkw9bO0CbDbT9ItXnIzNt7h4YIZ9zx0Z02JBo56HU=;
  b=CGXpoKIoZafp/62PVSr19V6Y47/UyJo8V+f1fItYUMsALMx+I7XWtVJ5
   gyoP0hV6XTS5IxVCKLo3REwO/oRe0kxkm2N/2cVuJIVWIhJEgeMXJCnd1
   mI4aXO6RP0TM1c3LOPaNJndCKxB9ecNCWJWvGzlQV4hPWv6KM0bC7AOuZ
   OS7SOKiYZMm4iT6xEwc0Ko692nGLSY6AqDBBEtmeXJ9Jdh5ZTO9Mj9IHp
   daf/J3XLltaNtEoc63uERIxd4BEkwSavYc++UiX4lzW5DaYDL5+Gs9Ivt
   bvW+sNLQFV8WvA+K1rsbOou280lKUF1QuQvluKtVfi3DFe4kejjsrIP46
   Q==;
X-CSE-ConnectionGUID: W+j8bVvkT3CIjEZtRScSaw==
X-CSE-MsgGUID: IlqptXb7SaWaAUbxNJ7Xcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86767383"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="86767383"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 08:55:03 -0800
X-CSE-ConnectionGUID: VaIx3S5YSGiCFMspsMlUuA==
X-CSE-MsgGUID: 7RtuXKnkRimNPFRN07UIOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="240454261"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Jan 2026 08:55:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdWoF-0000000040n-34cA;
	Wed, 07 Jan 2026 16:54:59 +0000
Date: Thu, 08 Jan 2026 00:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 20/40] include/linux/rwsem.h:262
 class_rwsem_read_try_constructor() warn: passing zero to 'ERR_PTR'
Message-ID: <202601080002.GfL3Vts3-lkp@intel.com>
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
head:   c10d860e0baae0853773dc90a94b26adc5687380
commit: e4fd3be884cf33a42c5bcde087b0722a5b8f25ca [20/40] locking/rwsem: Support Clang's context analysis
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r073-20260107 (https://download.01.org/0day-ci/archive/20260108/202601080002.GfL3Vts3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601080002.GfL3Vts3-lkp@intel.com/

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
