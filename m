Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73E314C5AE
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Sep 2024 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352017; cv=none; b=X7RCnXd91uKASqd4PyXRMrchBKCyFJB3n/b+O4L8UAjnX60LwogwdM5/kDhjVuD7pIdAplgCngPs6ik+2fJjSgO8j+a96hCMNXHxPLh95nBN2whrDjEIJ/zgAx2iVn2YpR+jJix1pYsH1iHTMZ0an+Sxb11tX67x588TtUTig3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352017; c=relaxed/simple;
	bh=0ZhSwihlSbUpx/X93rhvBFxyHTHKMlSIUBlYGNB66GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjRbM8MtWupTAZefymeTU0BryIp+UW5JvApvnM1leOaBj04ceMOOUPWgC3r09g2dWbeOatJfRipSDWgCm1bAd6iJ0OhdwTtCjf/uemhn3GRpYf6mSN4BLmQMkQ60FZO2mLafnULOBIFgljUDpBIPa8KeYsSrnzTbSK8wkHda1cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2In6Ch6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2In6Ch6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727352016; x=1758888016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZhSwihlSbUpx/X93rhvBFxyHTHKMlSIUBlYGNB66GQ=;
  b=K2In6Ch6OlZBgif0eXHjWirNIcNr5xr7opZepAj8cxyhbqUo4c8RVWE+
   iPyk9CIVxPqtVViyHuOP8FZMvfgoNpUOrxOyXmwZ94rOm7VxPmcbLPmk3
   1FJiEEpxCKwT5LRwSvoHjfCSU52ddGjaDgYZ36XvunLHU3DSxMR5ro6Iv
   jcAK92KIy0YTKImZl1vbXYdzhlC6dEoeB811q6DFhNKhVVuvM1tjs98+3
   YlreWZfl+8IVXvUBXxu1IVBQcsNkVt7fxi70/e49KbbZ9/T2UPhDEc12N
   9auwu2cCegYo0JRlnVkLJOoyupRu/Bj97l0ivlstESD0mb+WsOW1NfCGc
   Q==;
X-CSE-ConnectionGUID: Z6600d8MTVuaO5xJnTOFXA==
X-CSE-MsgGUID: cvNNywofRnSIGJiHy65/ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51856137"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="51856137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:00:13 -0700
X-CSE-ConnectionGUID: 44usRTGMSlGrVCTHKYUAcQ==
X-CSE-MsgGUID: xywGk7MESzC38MzDCJ7lhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72424103"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Sep 2024 05:00:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stnAH-000Kfj-2I;
	Thu, 26 Sep 2024 12:00:09 +0000
Date: Thu, 26 Sep 2024 19:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip-rt 155/30000] lib/radix-tree.c:90:30: warning:
 'radix_tree_preloads_lock' defined but not used
Message-ID: <202409261948.3CQPO8jC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 0d33988d0368969323bff070ed0f3331e23a6abb [155/30000] radix-tree: use local locks
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409261948.3CQPO8jC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261948.3CQPO8jC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409261948.3CQPO8jC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/radix-tree.c: In function 'set_iter_tags':
   lib/radix-tree.c:1609:22: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
    1609 |         if (tag_long < RADIX_TREE_TAG_LONGS - 1) {
         |                      ^
   In file included from lib/radix-tree.c:41:
   lib/radix-tree.c: At top level:
>> lib/radix-tree.c:90:30: warning: 'radix_tree_preloads_lock' defined but not used [-Wunused-const-variable=]
      90 | static DEFINE_LOCAL_IRQ_LOCK(radix_tree_preloads_lock);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   lib/radix-tree.c:235: warning: Function parameter or member 'node' not described in 'radix_tree_find_next_bit'
   lib/radix-tree.c:235: warning: Function parameter or member 'tag' not described in 'radix_tree_find_next_bit'
   lib/radix-tree.c:235: warning: Excess function parameter 'addr' description in 'radix_tree_find_next_bit'
   lib/radix-tree.c:235: warning: Excess function parameter 'size' description in 'radix_tree_find_next_bit'
   lib/radix-tree.c:690: warning: Function parameter or member 'root' not described in 'radix_tree_shrink'
   lib/radix-tree.c:690: warning: Function parameter or member 'update_node' not described in 'radix_tree_shrink'
   lib/radix-tree.c:1251: warning: Function parameter or member 'iter' not described in 'radix_tree_iter_replace'


vim +/radix_tree_preloads_lock +90 lib/radix-tree.c

7ad3d4d85c7af9 Matthew Wilcox            2016-12-16  80  
^1da177e4c3f41 Linus Torvalds            2005-04-16  81  /*
^1da177e4c3f41 Linus Torvalds            2005-04-16  82   * Per-cpu pool of preloaded nodes
^1da177e4c3f41 Linus Torvalds            2005-04-16  83   */
^1da177e4c3f41 Linus Torvalds            2005-04-16  84  struct radix_tree_preload {
2fcd9005cc03ab Matthew Wilcox            2016-05-20  85  	unsigned nr;
1293d5c5f54d51 Matthew Wilcox            2017-01-16  86  	/* nodes->parent points to next preallocated node */
9d2a8da006fcbf Kirill A. Shutemov        2015-06-25  87  	struct radix_tree_node *nodes;
^1da177e4c3f41 Linus Torvalds            2005-04-16  88  };
8cef7d57a4a47e Harvey Harrison           2009-01-06  89  static DEFINE_PER_CPU(struct radix_tree_preload, radix_tree_preloads) = { 0, };
0d33988d036896 Sebastian Andrzej Siewior 2017-01-25 @90  static DEFINE_LOCAL_IRQ_LOCK(radix_tree_preloads_lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  91  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
