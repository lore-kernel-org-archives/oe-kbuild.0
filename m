Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0BA30F9F
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 20:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694206591; x=1725742591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JXsfoe5ilWeX8Hg5uxQRpLIddzecvzdfwso5S6KPydU=;
  b=Q+YbrgnDBf3nOnVG3emHWHcpIZl6mL6hwv10b3TTqLmS74DB9h/kwS7c
   T57rAj3Od5fmJwmw5J7mMwVjsSGyPfQXmag0pTfqiB0sYr75sDDS4l45r
   RRwep53uQJEdyzb/9FSMcCdArJl8s7xCk8nmePDDzLfgOPjQayEGNgQLI
   9WAwiYEOguHPRmn8vER+hE3IR98V1gRMWrcYIcrNMkUTq0F+fZxDLSvJR
   0R9Ml5Lxko2Z5of1LHeY73TORXDZq5jeF/WPnFvdWDlaxqW73FwT+LZJ8
   YVVUUzbtAo2cVHxb7jrxdpmbf/zgKyLu8vvY8eQVgXwO9pE+gNzsk1rKQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464114549"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="464114549"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 13:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989399969"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="989399969"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2023 13:56:29 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeiWh-0002br-2L;
	Fri, 08 Sep 2023 20:56:27 +0000
Date: Sat, 9 Sep 2023 04:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/memcpy_kunit.c:299 init_large() warn: calling memset(x, y,
 ARRAY_SIZE());
Message-ID: <202309090452.5RO4tHul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a48fa7efaf1161c1c898931fe4c7f0070964233a
commit: 96fce387d58fa8eae6e8d9b1ecdfbc18292d7a68 kunit/memcpy: Add dynamic size and window tests
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: openrisc-randconfig-r071-20230906 (https://download.01.org/0day-ci/archive/20230909/202309090452.5RO4tHul-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309090452.5RO4tHul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309090452.5RO4tHul-lkp@intel.com/

smatch warnings:
lib/memcpy_kunit.c:299 init_large() warn: calling memset(x, y, ARRAY_SIZE());

vim +299 lib/memcpy_kunit.c

96fce387d58fa8 Kees Cook 2022-09-28  290  
96fce387d58fa8 Kees Cook 2022-09-28  291  	/* Get many bit patterns. */
96fce387d58fa8 Kees Cook 2022-09-28  292  	get_random_bytes(large_src, ARRAY_SIZE(large_src));
96fce387d58fa8 Kees Cook 2022-09-28  293  
96fce387d58fa8 Kees Cook 2022-09-28  294  	/* Make sure we have non-zero edges. */
96fce387d58fa8 Kees Cook 2022-09-28  295  	set_random_nonzero(test, &large_src[0]);
96fce387d58fa8 Kees Cook 2022-09-28  296  	set_random_nonzero(test, &large_src[ARRAY_SIZE(large_src) - 1]);
96fce387d58fa8 Kees Cook 2022-09-28  297  
96fce387d58fa8 Kees Cook 2022-09-28  298  	/* Explicitly zero the entire destination. */
96fce387d58fa8 Kees Cook 2022-09-28 @299  	memset(large_dst, 0, ARRAY_SIZE(large_dst));
96fce387d58fa8 Kees Cook 2022-09-28  300  }
96fce387d58fa8 Kees Cook 2022-09-28  301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
