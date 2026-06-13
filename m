Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7721A6830
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jun 2026 06:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781330721; cv=none; b=Shoi03qQej3CIBri+da6w4htwUYwYag+miMsALxlPpH4oWvpezcpybcbMxU0SUtYhaQVzE+xPsFypa4y/rkBuYBy5jG3sdq0pSa/MQ0shBlYMCVN5seclmIp9nI8Ctc/wnJZNBKZWeJl//1b77m5p87EGhbImq4IA2UGYZjPATI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781330721; c=relaxed/simple;
	bh=u6LqLfl1jCYm9YuFgemgycvRAGE/tTDf665w6TJYN9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FQbot4Qix0u7IWI/FxpnJL0eYSF12iGBdJ+/aB7mE0fdVyE8UJx6qs+x8OrxJaSW9aFLbAAl+pr37045M0LKZJo8/DpGEYV+UqM+7/IpCVpvvT8CBDGBM5ZztnysE59QKgQ7Qi0uCFOkrFcYi+GEUcCVBumTUDYYQHcKer84h5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+LyoSji; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+LyoSji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781330718; x=1812866718;
  h=date:from:to:cc:subject:message-id;
  bh=u6LqLfl1jCYm9YuFgemgycvRAGE/tTDf665w6TJYN9A=;
  b=W+LyoSjivFj59wn7Zv/T6vpzHryBFcwzdPqHHIG7xxrZketv+nwGec7L
   z3QHppYLwIUtiqae1wjmQ8TIRQtDQbnQpKIqyjfB3l1fgasACAVviCcX8
   QDqi8Zcd68wwPTFnjrW0gYWzwwMAZ32e3PjxXEkygngGec4LO7sW90j4r
   npNvJPG9ih8oRnKmwq48JUbaTpU62EEfMbbeIJWI0c6zqP4ELErXQEYxZ
   cUg3pNywKHuhsAlWI+ZMWQeYEd0+/e3K5U4FF1JY/v+hG86jfjCCGBdSZ
   GK5hXtfdQ76XV0zSCEXHF9IyDnmRgmHZNCPscRBnw8+Ng3Cxsph5N+tJq
   Q==;
X-CSE-ConnectionGUID: Z93LzcNsRvmmtdV7yLIXBQ==
X-CSE-MsgGUID: Bq2FD3GcRYW3hBY/U9QSCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="84728047"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="84728047"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 23:05:17 -0700
X-CSE-ConnectionGUID: 8350NgfnRdatuqBEW1HYKA==
X-CSE-MsgGUID: zGlKfKpsQ4moFbxjE7boAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="248893306"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2026 23:05:17 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYHUZ-000000004Rx-2rS9;
	Sat, 13 Jun 2026 06:05:15 +0000
Date: Sat, 13 Jun 2026 08:04:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 36/42]
 ../../../lib/interval_tree_test.c:7:10: fatal error: linux/printk.h: No such
 file or directory
Message-ID: <202606130842.wCasqP3G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Samuel Moelius <sam.moelius@trailofbits.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   de7d0714e758f151ebe93e19022c4ee49d4bd189
commit: 668b4f201693fabe078d1e0963fb6f880d9b7be6 [36/42] lib-interval_tree_test-validate-benchmark-parameters-fix
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260613/202606130842.wCasqP3G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130842.wCasqP3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606130842.wCasqP3G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from interval_tree_test.c:11:
>> ../../../lib/interval_tree_test.c:7:10: fatal error: linux/printk.h: No such file or directory
       7 | #include <linux/printk.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
