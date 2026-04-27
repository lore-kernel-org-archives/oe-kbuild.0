Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425D22C027B
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Apr 2026 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318456; cv=none; b=MkFn44J58N+Sd+boyWCYqMNXRoWx8Zw35HhT4msy1KykuyFTYlviVijJzJUl8ECXGw+EWXWV86wpTGTRIW85wA9zyXGfbQXxgrzhlxNcZOd+F6L3R8ixZtTVjbXHo4i7zvZwP2l9V+/Z86ScHFI+MHGYSYJnVtEgOR32bvDb66A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318456; c=relaxed/simple;
	bh=GBihDU1gsxatF8HuSf0iD3O8qAw72yK8wzah64BPI9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gwijvCUb72p8P6Ka/82qWnY6CUpnh16P7Hy94UzrI+6Qdi7I1CwJnMhJBoIuuRp6Eu6iry0OO8sse5ew6hmM8Jf03il5Y2smg10CsaX7wUiopirNnglofyja6q7r7NyY2kkRxPJrVh1TJPv3f+Qn+IEl/6IM9v83qwjc+b2c2g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0gLQUOv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0gLQUOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777318455; x=1808854455;
  h=date:from:to:cc:subject:message-id;
  bh=GBihDU1gsxatF8HuSf0iD3O8qAw72yK8wzah64BPI9U=;
  b=B0gLQUOv8lF+LuX7iBVykJ0zU1IwrM2r/YIYM7Q+NeOp+YcmQlFKIVFW
   CaXSguZOlCQz7S2qOHKg1gBoxhSB2Rx/RIVLXX03H2Y+LzQkH9IBEwTYT
   g/1jqGpHI8fvKczwED6L9wtUCdO2qpYZd/PT71PywwV6HrQY6C8HgDYBY
   zXAGGpJrL17jmi75ZpiLnln9C1513fCcF8WhoiO0cK9gvkrNA45gSREU1
   m6bak295KohTiAsgLUd8v9SHgnv/qpo2fNf8zA76ppKNXK9/Zwe911Y6P
   /87gIutvgdHFekimxu4oYgVp3NjdZlLvfkOvlbFD04ZG1MjJA6pmhWjdP
   A==;
X-CSE-ConnectionGUID: rp64bBmZR7ajSzlGo1FV2Q==
X-CSE-MsgGUID: Kde55Qr0TxqX/OX0ZoJhjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88915837"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="88915837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 12:34:15 -0700
X-CSE-ConnectionGUID: n2pQlZqnRm6wqWwwAFnhEQ==
X-CSE-MsgGUID: 5l7+OikmQrK65ZdjZ/YDfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="230559409"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Apr 2026 12:34:13 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHRid-0000000099B-1PIF;
	Mon, 27 Apr 2026 19:34:11 +0000
Date: Tue, 28 Apr 2026 03:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 461/799]
 fs/bcachefs/util/rcu_pending.c:183:8-10: ERROR: reference preceded by free on
 line 183
Message-ID: <202604280323.eYffno1X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: a5c2f21bff6a883e2a0fc96e4f0127350186665e [461/799] bcachefs: move utility code to subdir
:::::: branch date: 6 months ago
:::::: commit date: 6 months ago
config: m68k-randconfig-r054-20260428 (https://download.01.org/0day-ci/archive/20260428/202604280323.eYffno1X-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202604280323.eYffno1X-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/util/rcu_pending.c:183:8-10: ERROR: reference preceded by free on line 183
--
>> fs/bcachefs/util/rcu_pending.c:507:1-7: preceding lock on line 435
>> fs/bcachefs/util/rcu_pending.c:507:1-7: preceding lock on line 435
   fs/bcachefs/util/rcu_pending.c:507:1-7: preceding lock on line 525

vim +183 fs/bcachefs/util/rcu_pending.c

8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  178  
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  179  #ifndef __KERNEL__
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  180  static inline void kfree_bulk(size_t nr, void ** p)
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  181  {
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  182  	while (nr--)
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23 @183  		kfree(*p);
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  184  }
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  185  #endif
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  186  

:::::: The code at line 183 was first introduced by commit
:::::: d2ed0f206a9d8b3add18879f39dd128ff55e4d77 bcachefs: rcu_pending now works in userspace

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
