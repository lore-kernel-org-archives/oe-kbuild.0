Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF983C0A19
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778772721; cv=none; b=TxS9s4CTh3pr/VJtwnSyaYaW2c/mpgZ9mkRw699z55uXuMwX5266gqrJk7SHF/uGL8vmLQn7WAbfvsrWf+67B7O98Z73U256Y6O1eQz9C1fhO3Bn7SrcqrTb4kbvZHd11k1aecZBQN6jyfPaG3aeyr+EyNPbg6/cgCjRktGqnuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778772721; c=relaxed/simple;
	bh=cNQO4jFVofb+Ziava6Mf9LHv8a0hw4F8QuBinTw7Mvg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nP+/XrWLwbc90ytzgWs/Qy6vyDzsIBJ9U6HGYW60v3pUsvLK4lifGCE8guTk0N385f1l94Z84F9uyoP6H47sVQOsSGDqcAR/82J0THe23trxnhqTaTkJx6jUPRD/IlCVQiXhLtjYcxL35DiPgLpL7t+eJvq5Nqwr9QIXoIOn28M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nU+/HEWx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nU+/HEWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778772720; x=1810308720;
  h=date:from:to:cc:subject:message-id;
  bh=cNQO4jFVofb+Ziava6Mf9LHv8a0hw4F8QuBinTw7Mvg=;
  b=nU+/HEWxKdDL9penE7i92EPLkzS6Bm2SfgTWfPmXtSplJPQL9tcSSDkz
   p4k5cGC44PlE5/P3VpxtKPg49cJmi9P3ULvQZhxWDv1GI8XCA21WfZM/n
   WBuGYut1Jr2cRSDlk0xbSLeqo7EKKnd8Iq8HEo0T+GWtOcdOhUiDU0Kx6
   9jCgNlqgUjdClwvvJmXTBcWfrC0EAct4SATlYbaZNjSjj89vJ4fsH3Zfu
   82K22YpU3C5nimHMGAtgFqWbi+CYzsaO4WizoepWnbfqyoqIo2cU5FU65
   25qinfmiO4fBsiGPn+Mc57izZWzWjg6hGlKqX5B8U97EzlvNtStUdDEGv
   A==;
X-CSE-ConnectionGUID: hIkplQl8R7uyANeRfK5ntg==
X-CSE-MsgGUID: Lttc5pMyRXGDm9j/18wcNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79575441"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79575441"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 08:31:59 -0700
X-CSE-ConnectionGUID: gutgVgHQQ3e+GKRa1hfEgw==
X-CSE-MsgGUID: EkEsWdAmROGCd+u3hwtdfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="262160108"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2026 08:31:58 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNY2V-000000006gp-3CvN;
	Thu, 14 May 2026 15:31:55 +0000
Date: Thu, 14 May 2026 23:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-vfs:vfs.all 11/11] fs/fcntl.c:1172:2: error: call
 to '__compiletime_assert_384' declared with 'error' attribute: BUILD_BUG_ON
 failed: 21 - 1 != HWEIGHT32( (VALID_OPENAT2_FLAGS & ~(O_NONBLOCK | O_NDELAY))
 | __FMODE_EXEC)
Message-ID: <202605142356.aUnJ1v8s-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   1202b9c177076b8c00ba826717a8d7023e4c8f98
commit: 1202b9c177076b8c00ba826717a8d7023e4c8f98 [11/11] Merge branch 'vfs-7.2.misc' into vfs.all
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260514/202605142356.aUnJ1v8s-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142356.aUnJ1v8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605142356.aUnJ1v8s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fcntl.c:1172:2: error: call to '__compiletime_assert_384' declared with 'error' attribute: BUILD_BUG_ON failed: 21 - 1 != HWEIGHT32( (VALID_OPENAT2_FLAGS & ~(O_NONBLOCK | O_NDELAY)) | __FMODE_EXEC)
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
   <scratch space>:37:1: note: expanded from here
      37 | __compiletime_assert_384
         | ^
   1 error generated.


vim +1172 fs/fcntl.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  1164  
454eedb8901da89 Wu Fengguang      2010-08-10  1165  static int __init fcntl_init(void)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1166  {
3ab04d5cf9736b7 James Bottomley   2010-09-09  1167  	/*
3ab04d5cf9736b7 James Bottomley   2010-09-09  1168  	 * Please add new bits here to ensure allocation uniqueness.
3ab04d5cf9736b7 James Bottomley   2010-09-09  1169  	 * Exceptions: O_NONBLOCK is a two bit define on parisc; O_NDELAY
3ab04d5cf9736b7 James Bottomley   2010-09-09  1170  	 * is defined as O_NONBLOCK on some platforms and not on others.
3ab04d5cf9736b7 James Bottomley   2010-09-09  1171  	 */
3adfed795a99d74 Dorjoy Chowdhury  2026-03-28 @1172  	BUILD_BUG_ON(21 - 1 /* for O_RDONLY being 0 */ !=
80f18379a7c350c Christoph Hellwig 2017-04-27  1173  		HWEIGHT32(
3adfed795a99d74 Dorjoy Chowdhury  2026-03-28  1174  			(VALID_OPENAT2_FLAGS & ~(O_NONBLOCK | O_NDELAY)) |
ebe559609d7829b Al Viro           2024-11-15  1175  			__FMODE_EXEC));
454eedb8901da89 Wu Fengguang      2010-08-10  1176  
^1da177e4c3f415 Linus Torvalds    2005-04-16  1177  	fasync_cache = kmem_cache_create("fasync_cache",
839d68206de869b Vasily Averin     2021-09-02  1178  					 sizeof(struct fasync_struct), 0,
839d68206de869b Vasily Averin     2021-09-02  1179  					 SLAB_PANIC | SLAB_ACCOUNT, NULL);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1180  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1181  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  1182  

:::::: The code at line 1172 was first introduced by commit
:::::: 3adfed795a99d740cdb3ed71eae6ef03ce5431c8 openat2: new OPENAT2_REGULAR flag support

:::::: TO: Dorjoy Chowdhury <dorjoychy111@gmail.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
