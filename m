Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A237284B4F
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 05:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760420112; cv=none; b=qebYiAjcdWmwcN+yRNrz2We2uMwyOKNnoGDetg2KHAy9u2JiJzn72RWARoTTWXT03gaY9njehRmwy+KN76UD7TGkT4t1Q7DdiefLenl1WE3+LAyHW5D8t/iKPzBUx7qYsxHvYgq64bXHS2vbbkFo4gBIEHTcMcJ3r6sj+2cPIac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760420112; c=relaxed/simple;
	bh=cyFEb9xoiKCIxg5nvsMl9/VeKmssZvihHB+fzl1qo2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hB3Q0squ4hOgnYeGdNOp1LEqsWReP17XTmhtS4ot0ixQsxVBCB2nR2C2YQJVwIUIWcXsQ218YkREz2q5xNTKbEFeIo5OBmAQ2tW07bTBSMNzumRJD/hvczSoaleY3d5mwt90X16H0v5Lo+gGkHV6/max45532JW5GZE4BmZssjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0HOwQyS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0HOwQyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760420111; x=1791956111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cyFEb9xoiKCIxg5nvsMl9/VeKmssZvihHB+fzl1qo2w=;
  b=A0HOwQySvYpjUPbwdjxI2M6vwKgKS9M73ykMwSAuP3mEg614MRYNK8r5
   lQtnDOAm2O28UV1u6hVfiX5qYPDtr2FAtP0rBcbr5jU0Hx/SlTOmAK1kG
   sFjAvIxkVq+PTPHYlQ4WVJy6XhtUMy7tlOHrNFVCG0W3/T5yDmKoyZKu4
   hUxXp4H4EOd5vMFFDxi3HRnECwTGI1ZW0FS3By61qPchx41w4Cqq4Yh9P
   lDsPUFXKNuGOG1TiT5sbyxwOrCtUakGBmoWEl1zB4gUXEJqkcG7m9cu9s
   vJVkzbFGmCdtHN86vFZXZXODiz7VZvHSG6sCh/31JEV2u1fb6V75pCyIL
   Q==;
X-CSE-ConnectionGUID: 3H+/CRKCR7WX42UXGIYn1w==
X-CSE-MsgGUID: NLqaz40sSTi7dl3noKnlkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62607764"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="62607764"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 22:35:10 -0700
X-CSE-ConnectionGUID: mJPleWrWRxGvxZ4t6FxFow==
X-CSE-MsgGUID: NFDnmpZQQrqkr2GxVArM1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="186041580"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 13 Oct 2025 22:35:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Xgg-0002PH-12;
	Tue, 14 Oct 2025 05:35:06 +0000
Date: Tue, 14 Oct 2025 13:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 1/1] lib/radix-tree.c:1596:2:
 error: call to '__compiletime_assert_291' declared with 'error' attribute:
 BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
Message-ID: <202510141325.DmOdAIyF-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Vaibhav,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ec2c6aa54df228239e034cb4fd6686f5e1e257
commit: 345e3e5b6400f9ee03b8fad705e399b05d46ef1a [1/1] ANDROID: mm: Fix gfp bit position of __GFP_NO_INIT_ON_ALLOC
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141325.DmOdAIyF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141325.DmOdAIyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510141325.DmOdAIyF-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/radix-tree.c:288:6: warning: no previous prototype for function 'radix_tree_node_rcu_free' [-Wmissing-prototypes]
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         |      ^
   lib/radix-tree.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     288 | void radix_tree_node_rcu_free(struct rcu_head *head)
         | ^
         | static 
>> lib/radix-tree.c:1596:2: error: call to '__compiletime_assert_291' declared with 'error' attribute: BUILD_BUG_ON failed: RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32
    1596 |         BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:375:2: note: expanded from macro 'compiletime_assert'
     375 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:363:2: note: expanded from macro '_compiletime_assert'
     363 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:356:4: note: expanded from macro '__compiletime_assert'
     356 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:159:1: note: expanded from here
     159 | __compiletime_assert_291
         | ^
   1 warning and 1 error generated.


vim +1596 lib/radix-tree.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  1591  
^1da177e4c3f41 Linus Torvalds            2005-04-16  1592  void __init radix_tree_init(void)
^1da177e4c3f41 Linus Torvalds            2005-04-16  1593  {
d544abd5ff7d8b Sebastian Andrzej Siewior 2016-11-03  1594  	int ret;
7e7844226f1053 Michal Hocko              2017-05-03  1595  
7e7844226f1053 Michal Hocko              2017-05-03 @1596  	BUILD_BUG_ON(RADIX_TREE_MAX_TAGS + __GFP_BITS_SHIFT > 32);

:::::: The code at line 1596 was first introduced by commit
:::::: 7e7844226f1053236b6f6d5d122a06509fb14fd9 lockdep: allow to disable reclaim lockup detection

:::::: TO: Michal Hocko <mhocko@suse.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
