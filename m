Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA6B224D6
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 20:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758660311; cv=none; b=iOF/pg3lGkO4X9CF9jbNDFoBGWNFUUr6scQv2G5yf69BLbllT1q+J5+9DBgU98vZH3Ugm/p0sNJrzHdNF2mlvw7ez+ZeDfAVN5V21x58/f3ia6aq2rqya830sH5kZ90zOXj4OtyVeihKCBsqgA3uwRQIWqANGjJpcjUhsyC8oo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758660311; c=relaxed/simple;
	bh=8vFyl9pe4bUzkxgVPLEuXf6TBFZMT7GC2LAFX8aG9dg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWZSZQs/l1KDit1RlUqTP9XpncZ4vOyE+Y45KRs8awGuOD0PivXsMI0mYj2txmuXesmBhm/FHh8HIcPiPpzDPKnVR7zGcA3GxqbhiJEElW6qqWyUnRyLSpxlmgKnWoOBBAIEoMTOCUd2O1bKHCI20AUTt3f8wdlgcrsjJ9DUEM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5/Zuf3i; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5/Zuf3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758660310; x=1790196310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8vFyl9pe4bUzkxgVPLEuXf6TBFZMT7GC2LAFX8aG9dg=;
  b=C5/Zuf3iBEfUqyIAHLb38LYI0gnsCbAz8aYmUXM7Kxc3FNxYS3+Fp6Wx
   OOJbasiiC6PigNoYqQHFdII2829cEpV6LvlVGyeAKvLV/KGB2FChiwPfV
   BgmqfKz8oaOuQrHcukMaA1QbXmDwbFiqAJhtXAYZPfq18z7emM9jzZIRZ
   CduC4TcRBSSxCjX/WKMBo+tOI8mVIqmbK1Ricx1Mz+xq8fLAqKAuL29c9
   t+cU8wOz95tO01I8RVRr5/mrheFLiuPDeCNPCICl3InGwyqNkz8ooAQzx
   +u98eguMJzMjuu8oo13TPeKTYzZkGP9/uXP3v/zrhiib14EOV2qh1oDfW
   w==;
X-CSE-ConnectionGUID: 1OAMzGyaSzew/FGtpdqqzA==
X-CSE-MsgGUID: ALCn1uyLRPiyCXeIgzpSmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="59991096"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="59991096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 13:45:10 -0700
X-CSE-ConnectionGUID: cLJe4lPXS/mvBGMd9LOBzw==
X-CSE-MsgGUID: JLgdTuzMTAOBd0kljngmHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="200554946"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2025 13:45:08 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v19so-0003X3-1X;
	Tue, 23 Sep 2025 20:45:06 +0000
Date: Wed, 24 Sep 2025 04:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 17/35] include/linux/rwsem.h:262
 class_rwsem_read_try_constructor() warn: passing zero to 'ERR_PTR'
Message-ID: <202509240429.mYSsXaQm-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   b57fd8af63116c56536eb40f04dbe4f2206ec4ed
commit: de9ef32e7baba3bb2ca12ece7bf1248dc6aa366d [17/35] locking/rwsem: Support Clang's capability analysis
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250924/202509240429.mYSsXaQm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509240429.mYSsXaQm-lkp@intel.com/

New smatch warnings:
include/linux/rwsem.h:262 class_rwsem_read_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/rwsem.h:270 class_rwsem_write_try_constructor() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
lib/test_capability-analysis.c:96 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:555 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_capability-analysis.c:120 test_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:594 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
include/linux/mutex.h:230 class_mutex_try_constructor() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +262 include/linux/rwsem.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  260  
de9ef32e7baba3 Marco Elver    2025-01-30  261  DEFINE_LOCK_GUARD_1(rwsem_read, struct rw_semaphore, down_read(_T->lock), up_read(_T->lock))
de9ef32e7baba3 Marco Elver    2025-01-30 @262  DEFINE_LOCK_GUARD_1_COND(rwsem_read, _try, down_read_trylock(_T->lock))
de9ef32e7baba3 Marco Elver    2025-01-30  263  DEFINE_LOCK_GUARD_1_COND(rwsem_read, _intr, down_read_interruptible(_T->lock), _RET == 0)
54da6a0924311c Peter Zijlstra 2023-05-26  264  
de9ef32e7baba3 Marco Elver    2025-01-30  265  DECLARE_LOCK_GUARD_1_ATTRS(rwsem_read, __assumes_cap(_T), /* */)
de9ef32e7baba3 Marco Elver    2025-01-30  266  DECLARE_LOCK_GUARD_1_ATTRS(rwsem_read_try, __assumes_cap(_T), /* */)
de9ef32e7baba3 Marco Elver    2025-01-30  267  DECLARE_LOCK_GUARD_1_ATTRS(rwsem_read_intr, __assumes_cap(_T), /* */)
de9ef32e7baba3 Marco Elver    2025-01-30  268  
de9ef32e7baba3 Marco Elver    2025-01-30  269  DEFINE_LOCK_GUARD_1(rwsem_write, struct rw_semaphore, down_write(_T->lock), up_write(_T->lock))
de9ef32e7baba3 Marco Elver    2025-01-30 @270  DEFINE_LOCK_GUARD_1_COND(rwsem_write, _try, down_write_trylock(_T->lock))
de9ef32e7baba3 Marco Elver    2025-01-30  271  DEFINE_LOCK_GUARD_1_COND(rwsem_write, _kill, down_write_killable(_T->lock), _RET == 0)
de9ef32e7baba3 Marco Elver    2025-01-30  272  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
