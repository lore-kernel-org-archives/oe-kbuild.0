Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744027;
	b=LwSFAXJv25rp0hcY5a4rQkM0h3zYi5oO1B0ez6sRNbavlNCvLkh4lJ9TJH3xwGVxH7+q
	 1oXwTQnhuUcc7n3JJCBGnox+Bq0pLpjXSGwjaWFQ4v/i4SgG2XfkLaJM/nr0etNB7TcKQ
	 K/mZmQTBA2fzZQr9R80xauQ4BhiBOzKpXrn1wIzzbszj1YTrgGCjs4E2ajgpVrSDIXdS7
	 A9etTOHcdymsW9xsbB8Gs5HhrhUE4VWLwV+yIKZbpBWCjlSw0iFxs7dUzF0KVC4WGlYdm
	 y1mb0qwxNtyQVyLiK7MwFQCKW/7Q4/LG+3LeN4XDVgiFCFZTnBO5v02hWdCHr0Cdn7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744027;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bctVVKGAyCd+0aOc5rM8r+zw/ft8ERJOIbR++MCd+d0=;
	b=FYh9BpovmcOi6HcLRGkCpFy9cMs8Pr4K6Eo/ctgfXeJdnKdQ3xnvTOwn+qecG2K4Wtd3
	 larp1mtiP4md540aJKYVQYbUVRcmzfGEzM7Jw6+LqvHLpSRmEAUvgPsvHqiGzMlMEm7dn
	 9tKobd7gxyQraDZR3ACec2WJXi3bnKLpzHgswC6pKpnM7zf7Zlyj2BM+jxK6NKb+kHzcZ
	 SO0cdHrI3xwk8dNa8bjWe5+wjTy8aoR3elcguMujVBoyqH5U1fmlbIfgBqKI3Bpz5/WpS
	 C8bIxTscgNQ4q1F6X2kng+A/xOwQfu9Keq91+2gmusDEo2TJjsct0G9S5smK1mu+2ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BhuUF9pG;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB116606A31E
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 12:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB116606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BhuUF9pG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794744026; x=1826280026;
  h=date:from:to:cc:subject:message-id;
  bh=Cx/CADlg3ndKyYg1MT/bfZEAuKxvXt3XzS78uitARjI=;
  b=BhuUF9pGitSABpBI4rPmmWAEFTrBCR79YybkeJjP9Oyq8w7LHXW5eoNU
   /6hl8XHDHAtuMMNBBDjA5pS9nI4MsG5WU0AWv+7DvChJWB+bBBT+AAumd
   n9xlCUNHB5lgCUPmJvkhpNVX33F2W8VS6jaCrFlKjt+1E7h1BV+XkAPOD
   zH0dk3m2WNxvG5aWjGCH+MqEi3tyxgoymsuTilC+qG9uiyGpUGlv7qekj
   R4isCURLjzng0l8zODLbQITuuM1nOSUoJrSaVqcAunZlQzJJjRv1G54f2
   Co9iakyZZ0dzHTtjWOdIZSC2oZFG/mZqQPJjkMm5TPkvXRieIa4ppxJSJ
   w==;
X-CSE-ConnectionGUID: sC/ZVpF8QT6ZUNbwknetQg==
X-CSE-MsgGUID: rFbPvaWUTFetw2WtaqiCHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3390067"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3390067"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 04:00:26 -0800
X-CSE-ConnectionGUID: dJukr0PVTnWnd+60mRizTQ==
X-CSE-MsgGUID: LXnZYL7ZQZO17QJZjhZ1xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9394706"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Nov 2026 04:00:24 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSYuE-000000002AO-0vLB;
	Sun, 15 Nov 2026 12:00:22 +0000
Date: Sun, 15 Nov 2026 13:00:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/compiler_types.h:702:45: error: call to
 '__compiletime_assert_553' declared with attribute error: BUILD_BUG_ON
 failed: NR_PAGE_ORDERS > F2FS_IOSTAT_RD_FOLIO_ORDERS
Message-ID: <202611151212.6JugEzAL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/62/626ff2b34dbb7679b798f7a4962a8b3def695045-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hajime Tazaki <thehajime@gmail.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Ricardo Koller <ricarkol@google.com>

Hi Hajime,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 um: allow deselecting CONFIG_MMU
date:   7 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 weeks ago
config: um-randconfig-r2300-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151212.6JugEzAL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151212.6JugEzAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 626ff2b34dbb ("um: allow deselecting CONFIG_MMU")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151212.6JugEzAL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/f2fs/iostat.c: In function 'f2fs_init_iostat':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_553' declared with attribute error: BUILD_BUG_ON failed: NR_PAGE_ORDERS > F2FS_IOSTAT_RD_FOLIO_ORDERS
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/f2fs/iostat.c:339:9: note: in expansion of macro 'BUILD_BUG_ON'
     339 |         BUILD_BUG_ON(NR_PAGE_ORDERS > F2FS_IOSTAT_RD_FOLIO_ORDERS);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_553 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
