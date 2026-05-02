Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7147B27EFF7
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777739244; cv=none; b=FomPvpfrGrbZ+dIrEbLlyr6Ah9tJq36OTzjy6OxV7liZ/QXK/UFG6y98velxUbVdH9WdteIs6gpKkX4y5sfuvViAF6CIbRncFnkkO3RXs/qIH3o2BUHobo8LPYisZuQ8hwf54n5KTHhYRE5pJQYScu82/+EYckGZrkVqjdJY/tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777739244; c=relaxed/simple;
	bh=Snso9CaNi+Oq2AFD4Dufid4dxw56TrN4xT/Xtv0M/bc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aQxofyz4SleGYdonD+dIoSaa8dIo9N49/Fh8Cn/IXp97aRNItHHX+0gJ0F/RnR+C9+GQ3O3hliZ8C7qnuUqdNvzmwI3Q0gsLtue6e/LpuFvL/CNB6mbLKpUBC+3RuW/IQ5WN6gcJAcZLYsg6biuSld/V36E6kmei22zD5sL/Z4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvg2dzKf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvg2dzKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777739243; x=1809275243;
  h=date:from:to:cc:subject:message-id;
  bh=Snso9CaNi+Oq2AFD4Dufid4dxw56TrN4xT/Xtv0M/bc=;
  b=fvg2dzKf1Kn3B8tNNRnpKROFyaYXjvEL/iX35LcLNPZk7a6Gfs2YPZxw
   alIRvlDEuyFVhOL1W2lIsNqAsEqaOv5i8sNwMGlu7QYYMm3wNA9K9agKk
   iElHH35sq3tIv5TvIYk5FobY1GRzZTmzXtnhrPdeMSNQ2mL5CQi8B8SAB
   290YEDBs9QF7b7HkhzOv1jDLxZ8e+zP2b9iz2oq++3U0//CHr+iU10Wds
   HL5vvRNmRMvVzV4O9kA/XWQNbKquFDl4XvWYkiT4aTSLAqgZjaucLoiJl
   oouVPFTFasUVwte5HutB/uKHDspcH1H40XQGn41dXWlX/ajkKbGJSMD0j
   Q==;
X-CSE-ConnectionGUID: +ke5SJX2QhOfT7Qrri4jDQ==
X-CSE-MsgGUID: /dS9NrSHTNy6IefxzSX6pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78696053"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="78696053"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 09:27:23 -0700
X-CSE-ConnectionGUID: OI/WIfKdQbW3xM9MdMO9OA==
X-CSE-MsgGUID: YXFhHfc5Qk6K3yrPTHnfBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="236903912"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 May 2026 09:27:22 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJDBX-000000001ZT-3Nu6;
	Sat, 02 May 2026 16:27:19 +0000
Date: Sun, 03 May 2026 00:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:vfs-7.2.reopen 1/2] fs/fcntl.c:1172:2:
 error: call to '__compiletime_assert_537' declared with 'error' attribute:
 BUILD_BUG_ON failed: 21 - 1 != HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK |
 O_NDELAY)) | __FMODE_EXEC)
Message-ID: <202605030050.VZThPvhc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Jori Koolstra <jkoolstra@xs4all.nl>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git vfs-7.2.reopen
head:   89f1e153b6fa4a7a1e2f3d5a4ede7d9c3108c099
commit: 097b1e297e41636d34856f987875e9f80b381813 [1/2] vfs: add O_EMPTYPATH to openat(2)/openat2(2)
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605030050.VZThPvhc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030050.VZThPvhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605030050.VZThPvhc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fcntl.c:1172:2: error: call to '__compiletime_assert_537' declared with 'error' attribute: BUILD_BUG_ON failed: 21 - 1 != HWEIGHT32( (VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) | __FMODE_EXEC)
    1172 |         BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:699:2: note: expanded from macro 'compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:113:1: note: expanded from here
     113 | __compiletime_assert_537
         | ^
   1 error generated.


vim +1172 fs/fcntl.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1164  
454eedb8901da8 Wu Fengguang      2010-08-10  1165  static int __init fcntl_init(void)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1166  {
3ab04d5cf9736b James Bottomley   2010-09-09  1167  	/*
3ab04d5cf9736b James Bottomley   2010-09-09  1168  	 * Please add new bits here to ensure allocation uniqueness.
3ab04d5cf9736b James Bottomley   2010-09-09  1169  	 * Exceptions: O_NONBLOCK is a two bit define on parisc; O_NDELAY
3ab04d5cf9736b James Bottomley   2010-09-09  1170  	 * is defined as O_NONBLOCK on some platforms and not on others.
3ab04d5cf9736b James Bottomley   2010-09-09  1171  	 */
097b1e297e4163 Jori Koolstra     2026-04-19 @1172  	BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=
80f18379a7c350 Christoph Hellwig 2017-04-27  1173  		HWEIGHT32(
80f18379a7c350 Christoph Hellwig 2017-04-27  1174  			(VALID_OPEN_FLAGS & ~(O_NONBLOCK | O_NDELAY)) |
ebe559609d7829 Al Viro           2024-11-15  1175  			__FMODE_EXEC));
454eedb8901da8 Wu Fengguang      2010-08-10  1176  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1177  	fasync_cache = kmem_cache_create("fasync_cache",
839d68206de869 Vasily Averin     2021-09-02  1178  					 sizeof(struct fasync_struct), 0,
839d68206de869 Vasily Averin     2021-09-02  1179  					 SLAB_PANIC | SLAB_ACCOUNT, NULL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1180  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1181  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
