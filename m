Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ED32D9499
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756277408; cv=none; b=ns6IaJ48+4E2kGDazc0mYmmFXxg5uQ9ivhDQqjPZopIb5OzaYT61S9+F6CUHm222g2j59iuTR3BSOm0I17/tMxPIe3n/m8VnF3QEmrtzv7jkrZwKfmK8C6AqDw8/l11eqDVjb/F2be3tjlhsNEOSWyQGm2cvfQR/3j9J/k71tFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756277408; c=relaxed/simple;
	bh=BwRY9Oa+W3UUbZ0XQ7Ros2Aa/j9TRY6EMJ7SjF4+LEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l52uxegM0q3Ua+6F4E8fy6+jjZvZp0SCQgoC3745jiT/kWAef2SNhRva5Ca133agr3WnKympnGkfuhUZnyXdhPC//pal3bxvgd6Wm8L30kMmF3RHAHXbWLx5/WiAlZuWZKV5aLnQdGwbkzftPr1FkSWt6yrI1Xm2V1hYlvqEEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7a8SOEL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7a8SOEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756277406; x=1787813406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BwRY9Oa+W3UUbZ0XQ7Ros2Aa/j9TRY6EMJ7SjF4+LEE=;
  b=a7a8SOELbJYgOfsmvfktCHUhksX34ytfWBz702geWPn2ZqDP0YTOPdoQ
   RQZa+ks/jYXTLpnbwogUbAuv+foDG93KLl1yWUHrdeyG2Kxut+pSELpSf
   ZSYs4xmGVTgU7QvRwJxP2Ixk1gGQdrdF49acfBZ1336ejXn+jCXzdZzqR
   hQBm1yTmYh5pemBGaAwT5ardA5fBFhZ+/gltktAAqfYZ734R3ZPgTECrK
   pYDXvhpuEmw2j6Cnfdyrx8lO0LaGHJdDZv5/dH5oTzASmEzuZFdJqU9ua
   mFUTY2WKiJtpw03id5I5eGyL13CeA3YBntJ5Gv8pUGSHA2Bi6UdUCVhDp
   g==;
X-CSE-ConnectionGUID: SjHuFrkET9KNGZVpHa8LVw==
X-CSE-MsgGUID: NVPIBIIQQQCM6gOFOL7m3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69239020"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69239020"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 23:50:05 -0700
X-CSE-ConnectionGUID: CjftJlRQQGupOBxHjOOV/Q==
X-CSE-MsgGUID: xumt1CilQBaS44XSQdcZ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="175070626"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Aug 2025 23:50:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur9yj-000Skd-1J;
	Wed, 27 Aug 2025 06:49:55 +0000
Date: Wed, 27 Aug 2025 14:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [Patch v2 2/2] mm/pageblock-flags: remove
 PB_migratetype_bits/PB_migrate_end
Message-ID: <202508271419.3bLlTMSZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250827021121.13645-3-richard.weiyang@gmail.com>
References: <20250827021121.13645-3-richard.weiyang@gmail.com>
TO: Wei Yang <richard.weiyang@gmail.com>
TO: akpm@linux-foundation.org
TO: david@redhat.com
TO: lorenzo.stoakes@oracle.com
TO: vbabka@suse.cz
CC: linux-mm@kvack.org
CC: Wei Yang <richard.weiyang@gmail.com>
CC: Zi Yan <ziy@nvidia.com>

Hi Wei,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-page_alloc-use-xxx_pageblock_isolate-for-better-reading/20250827-101755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250827021121.13645-3-richard.weiyang%40gmail.com
patch subject: [Patch v2 2/2] mm/pageblock-flags: remove PB_migratetype_bits/PB_migrate_end
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-buildonly-randconfig-004-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271419.3bLlTMSZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271419.3bLlTMSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508271419.3bLlTMSZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
     373 |         BUILD_BUG_ON(__MIGRATE_TYPE_END > MIGRATETYPE_MASK);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
>> mm/page_alloc.c:373:2: error: call to '__compiletime_assert_499' declared with 'error' attribute: BUILD_BUG_ON failed: __MIGRATE_TYPE_END > MIGRATETYPE_MASK
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:242:1: note: expanded from here
     242 | __compiletime_assert_499
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +373 mm/page_alloc.c

42f46ed99ac6c0 Zi Yan   2025-06-16  360  
42f46ed99ac6c0 Zi Yan   2025-06-16  361  static __always_inline void
42f46ed99ac6c0 Zi Yan   2025-06-16  362  get_pfnblock_bitmap_bitidx(const struct page *page, unsigned long pfn,
42f46ed99ac6c0 Zi Yan   2025-06-16  363  			   unsigned long **bitmap_word, unsigned long *bitidx)
42f46ed99ac6c0 Zi Yan   2025-06-16  364  {
42f46ed99ac6c0 Zi Yan   2025-06-16  365  	unsigned long *bitmap;
42f46ed99ac6c0 Zi Yan   2025-06-16  366  	unsigned long word_bitidx;
42f46ed99ac6c0 Zi Yan   2025-06-16  367  
e904bce2d9d43e Zi Yan   2025-06-16  368  #ifdef CONFIG_MEMORY_ISOLATION
e904bce2d9d43e Zi Yan   2025-06-16  369  	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
e904bce2d9d43e Zi Yan   2025-06-16  370  #else
42f46ed99ac6c0 Zi Yan   2025-06-16  371  	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
e904bce2d9d43e Zi Yan   2025-06-16  372  #endif
61e515c5edd709 Wei Yang 2025-08-27 @373  	BUILD_BUG_ON(__MIGRATE_TYPE_END > MIGRATETYPE_MASK);
42f46ed99ac6c0 Zi Yan   2025-06-16  374  	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
42f46ed99ac6c0 Zi Yan   2025-06-16  375  
42f46ed99ac6c0 Zi Yan   2025-06-16  376  	bitmap = get_pageblock_bitmap(page, pfn);
42f46ed99ac6c0 Zi Yan   2025-06-16  377  	*bitidx = pfn_to_bitidx(page, pfn);
42f46ed99ac6c0 Zi Yan   2025-06-16  378  	word_bitidx = *bitidx / BITS_PER_LONG;
42f46ed99ac6c0 Zi Yan   2025-06-16  379  	*bitidx &= (BITS_PER_LONG - 1);
42f46ed99ac6c0 Zi Yan   2025-06-16  380  	*bitmap_word = &bitmap[word_bitidx];
42f46ed99ac6c0 Zi Yan   2025-06-16  381  }
42f46ed99ac6c0 Zi Yan   2025-06-16  382  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
