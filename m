Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A09221FC6
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 00:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786149340; cv=none; b=gzgcPDSZgguH+pytpfptrg8ZoQKEFjvuhPjcQvVw4dFXuxd5eRoPI0Rup37QLGVwWFP/Ya3K7su5WZGDE0D/G0+CPlf8NbSMDro5Xe0crrS/Y65fAWjmVRjiuPheCmkIiT7CqOYD4D4q9W41jXxx82ll7K5UuH+fNFEDQz+P5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786149340; c=relaxed/simple;
	bh=vlRvXixJmD9lokbmSU8bAmnTgw43RxiLLE10GWDm8fI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=suS39ZeQkhxS25c8Wj6qORp88orR8idJgXO72W2DzmZiVvFURYzRGdZVjMwTSCKKHNmMF4aVyzw3oS2QkrZNd1BbQgdYAOVbVt5zs5rXM+zY29xbs2PPKpIfLvvWtpofONuQczejVti5gvWGofX+MGw/LwRDk1dzJoz1EVpQs5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmyE+1hr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmyE+1hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786149339; x=1817685339;
  h=date:from:to:cc:subject:message-id;
  bh=vlRvXixJmD9lokbmSU8bAmnTgw43RxiLLE10GWDm8fI=;
  b=BmyE+1hrCQS8O/ocPSuU6dLGaDeE5yAIvOt1pOogzdScRkkFm6DrpCG5
   efbvxc0KvrZHp0Yrso4BGnuSliNsk3A1j/zynSMNwylF/ioOtryf7Dyd0
   Pun0h0mVHq4ErfboFXG+3QKu2f9GzBa+A5qJuOPnYPofmTVWPlCpUw/vn
   Qr2GbntXhFSSygbiqay1X2PiXsLMYHb3CnL5MBfe4opl7YnWJOKXQhQ4J
   B/Eg+XBFFERyVVfGK/9HgFTfCgG8753Crwqz2/B6LHD7iaxOeGE3LlMmM
   LhegB2d208a1eumvKgBdyN6zyrPZF5FcPKgqJ0iDKwxGwqeoG00lqD0+r
   w==;
X-CSE-ConnectionGUID: x/bFoi13QHu1xHwVdOCpXg==
X-CSE-MsgGUID: 1z4ZswUhQwm4PMzqFZLgTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="104160151"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="104160151"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 17:35:38 -0700
X-CSE-ConnectionGUID: SQzuctcxQ9+Kh4OgkJSXXg==
X-CSE-MsgGUID: 23PEDJliTWCZuEFhtshP+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="262579491"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2026 17:35:37 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsV2F-00000000JYt-1PuX;
	Sat, 08 Aug 2026 00:35:35 +0000
Date: Sat, 08 Aug 2026 08:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/rwsem.h:273
 class_rwsem_write_try_constructor() warn: passing zero to 'ERR_PTR'
Message-ID: <202608080744.hkptlhd7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: e4fd3be884cf33a42c5bcde087b0722a5b8f25ca locking/rwsem: Support Clang's context analysis
date:   7 months ago
:::::: branch date: 35 minutes ago
:::::: commit date: 7 months ago
config: openrisc-randconfig-r073-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080744.hkptlhd7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e4fd3be884cf ("locking/rwsem: Support Clang's context analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608080744.hkptlhd7-lkp@intel.com/

New smatch warnings:
include/linux/rwsem.h:273 class_rwsem_write_try_constructor() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
lib/test_context-analysis.c:96 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:556 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_context-analysis.c:120 test_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:604 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/mutex.h:255 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/rwsem.h:262 class_rwsem_read_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +273 include/linux/rwsem.h

e4fd3be884cf33 Marco Elver 2025-12-19  271  
e4fd3be884cf33 Marco Elver 2025-12-19  272  DEFINE_LOCK_GUARD_1(rwsem_write, struct rw_semaphore, down_write(_T->lock), up_write(_T->lock))
e4fd3be884cf33 Marco Elver 2025-12-19 @273  DEFINE_LOCK_GUARD_1_COND(rwsem_write, _try, down_write_trylock(_T->lock))
e4fd3be884cf33 Marco Elver 2025-12-19  274  DEFINE_LOCK_GUARD_1_COND(rwsem_write, _kill, down_write_killable(_T->lock), _RET == 0)
e4fd3be884cf33 Marco Elver 2025-12-19  275  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
