Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0E42D9481
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776110856; cv=none; b=YdWuW/XYyl28tK7wtmzG2jOhk6iMpA6VBkO2VS23LRmDqUM9Mr7l1LcM6W5+BP0cuCfkdJk7OlqeiqfAJa4rpKzm68TQCbpoW/TMPzdfWgpgeIutYU+YCVY52tKNC4CePxl6Nl16zqiq36joCut7hnol+9ZB3slc/xw4gw7HA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776110856; c=relaxed/simple;
	bh=RmXOL4Llq2wGxu96IfFA4SyAe9bIedoIFkHFaFP12sM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UQiKR8rDOie61xNxsurFP4EtyW+8qCovrMfczZ/HC1ksfYsmypzporsY8B7aShXTGYtRc0jVVptzYQAohAeYWOJefC+09JWKWYHM9VOYUE84f2dg9tF8ef9ws/cUEKaN38IdGPYHkcC3DxQVNOh7Bs9AjDAgD9wjo1c7EKVUnLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glUqIPIQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glUqIPIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776110855; x=1807646855;
  h=date:from:to:cc:subject:message-id;
  bh=RmXOL4Llq2wGxu96IfFA4SyAe9bIedoIFkHFaFP12sM=;
  b=glUqIPIQxvUxJkDB07DIHBKL6ff97lqkS4s3Mpz8qKjIhddS9pe+B9yI
   x1msng+FQoV5yN0vWa4aXAIxlz+4FvoNSXl3f1eVum89R3ccvn7rAR5us
   YyYKB7KYCCkDmmwGApNoRSg487Y+QFz2u9n9cquTEC6PTbNBUJHk3bF3x
   iWIsCbJsDk7J3IXiRZP0wBeq9ulPmniqM3bKrSKrrpvgq3NFIevGAQ17d
   92gey+7AHQs/NKvNYwFe3eSXPyhVgYDAgQmLurqV3HfgmOFWcL3IzVebq
   3DTHHAYb4oiv2L9RF/EcFeft+kEGyqkFbBAGkAiDBhzdqJ7wv2d3U7/Bm
   w==;
X-CSE-ConnectionGUID: hG5e+6i9S9q3CmM9UhkUag==
X-CSE-MsgGUID: UXS+S4c9R16zrx+d0o9uWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77168377"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="77168377"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 13:07:34 -0700
X-CSE-ConnectionGUID: ehQ1uIqkSCqs5ceU5VdOFA==
X-CSE-MsgGUID: 4FG1Kj0ORv2CgdDoASr6Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="227205069"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Apr 2026 13:07:33 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCNZC-000000000oH-3iuf;
	Mon, 13 Apr 2026 20:07:30 +0000
Date: Tue, 14 Apr 2026 04:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:vfs-7.0.misc.2 1/33] fs/fuse/file.c:1326:9:
 error: call to '__compiletime_assert_496' declared with 'error' attribute:
 min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
Message-ID: <202604140429.mkguve33-lkp@intel.com>
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
TO: David Laight <david.laight.linux@gmail.com>
CC: Christian Brauner <brauner@kernel.org>

Hi David,

FYI, the error/warning still remains.

tree:   https://github.com/brauner/linux.git vfs-7.0.misc.2
head:   dedfae78f00960d703badc500422d10e1f12b2bc
commit: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 [1/33] fs: use min() or umin() instead of min_t()
:::::: branch date: 10 weeks ago
:::::: commit date: 4 months ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260414/202604140429.mkguve33-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140429.mkguve33-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140429.mkguve33-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/file.c:1326:9: error: call to '__compiletime_assert_496' declared with 'error' attribute: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
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
   <scratch space>:124:1: note: expanded from here
     124 | __compiletime_assert_496
         | ^
>> fs/fuse/file.c:1326:9: error: call to '__compiletime_assert_496' declared with 'error' attribute: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
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
   <scratch space>:124:1: note: expanded from here
     124 | __compiletime_assert_496
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
