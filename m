Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D33663CB
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 04:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766205104; cv=none; b=bexdHgXP62FwRzMf2v9GivmdL6ahvTTCngGMVZhBFCsGwYdfHsLIyZuu82/AedqCLXKV5Lvpb7+KedHONY0UhVPg29jhSDiUvMUkZEhZDCrYmMy8MW68zBPpIfJoGPTDjDB5W+3m4NtFOq/V1F+HdzsAJoQuVklET8jlKSpHac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766205104; c=relaxed/simple;
	bh=wZmCwMoJc+Qt29tVCO4pGoRjADS6qcymAJUjlmRbDyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EG4orlp0SXvTT9HS7Uozc77l1lW4L6jRDIz/5lc7VkO0QVrzjv8oTMSIKy4xK0NaOxGWuOOruxOULLNLq5VunfoS7gzCAhegUnaQXM3ZP/3G07JjHsE3zauezbG7cyLwi23wUPaONbqZ2rwevDE+cDWY9ZQYsaibaRIn93f/buc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpL5PICe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpL5PICe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766205102; x=1797741102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wZmCwMoJc+Qt29tVCO4pGoRjADS6qcymAJUjlmRbDyg=;
  b=GpL5PICe/xdLkTwsFwURI3oK075GnkbsX1zoi0PDMgJTs5fUYhp/GoTg
   arCtQKOCLNo1EH0I4Pci23q2IR9TuueJrYbiN7jSe4aFc5ExEEKECLfp9
   WlxqZfD1Im1vNTjYOPV3vgPZz8zeVny383eBdO4R2eMPaMyyc+THHEMG7
   IKDpfzw6tlxLgeqTHuR0uFvPsN6Y8ULlrlutumZmpWuQEwb4b3X0cgbcj
   mwMqVKU85ksuC5mNN1xK90p+s40XjMJZgqrdtXhzjABcfTnyw76zOiyxj
   4pIv0wC70W9AQKMQtGwPLQ3FddSdRp9sYf4W1USDS9+xr53LUYWherAlD
   g==;
X-CSE-ConnectionGUID: 1mq7ug/FRxWmhIBZQKGQMA==
X-CSE-MsgGUID: OSs6WzIUSVyoZLtyWdBZIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67910843"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="67910843"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 20:31:41 -0800
X-CSE-ConnectionGUID: ccXo1pIVRJ2MKvaMGUIQTg==
X-CSE-MsgGUID: hoS7rT5ARjiLGBQ6LVN66g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198616889"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Dec 2025 20:31:40 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWod0-000000004Kp-1hgH;
	Sat, 20 Dec 2025 04:31:38 +0000
Date: Sat, 20 Dec 2025 12:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1525/2671] fs/fuse/file.c:1326:9: error: call to
 '__compiletime_assert_603' declared with 'error' attribute: min(((pos + len
 - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
Message-ID: <202512201212.xumGaza6-lkp@intel.com>
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
TO: David Laight <david.laight.linux@gmail.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 [1525/2671] fs: use min() or umin() instead of min_t()
:::::: branch date: 25 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-012-20251220 (https://download.01.org/0day-ci/archive/20251220/202512201212.xumGaza6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201212.xumGaza6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512201212.xumGaza6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/file.c:1326:9: error: call to '__compiletime_assert_603' declared with 'error' attribute: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
    1326 |         return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,
         |                ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:618:2: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:611:4: note: expanded from macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:132:1: note: expanded from here
     132 | __compiletime_assert_603
         | ^
>> fs/fuse/file.c:1326:9: error: call to '__compiletime_assert_603' declared with 'error' attribute: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:618:2: note: expanded from macro '_compiletime_assert'
     618 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:611:4: note: expanded from macro '__compiletime_assert'
     611 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:132:1: note: expanded from here
     132 | __compiletime_assert_603
         | ^
   2 errors generated.


vim +1326 fs/fuse/file.c

ea9b9907b82a09 Nicholas Piggin       2008-04-30  1322  
5da784cce4308a Constantine Shulyupin 2018-09-06  1323  static inline unsigned int fuse_wr_pages(loff_t pos, size_t len,
5da784cce4308a Constantine Shulyupin 2018-09-06  1324  				     unsigned int max_pages)
d07f09f509fb21 Maxim Patlasov        2012-10-26  1325  {
0f5bb0cfb0b40a David Laight          2025-11-19 @1326  	return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,
5da784cce4308a Constantine Shulyupin 2018-09-06  1327  		   max_pages);
d07f09f509fb21 Maxim Patlasov        2012-10-26  1328  }
d07f09f509fb21 Maxim Patlasov        2012-10-26  1329  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
