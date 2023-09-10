Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13758825
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 21:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694379924; x=1725915924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vtrIGDrTelIpjNbyGPukrSHbX4GNM3/N2ZjJT0t2mWw=;
  b=SV3/yJIdHa+WMo2+W7qquhRXbmEx74VWgvCKVXljTGq0/QArHLSMgUfX
   cQq9KNW58rJz9tLRvGrIGV/s81OiiRkC2MUEjZ4dify1GZktf7Olb7XK8
   AVfz5S5XEMqPIZsJrBHhh6GA5tvV9NGsAAMYvhBOeb5k0aj1bA7pbTBUF
   8de65cufjNgzt4NLVsN+ZOgi4DlkGsk1F6Fc6xAJlsS9CF0ukbk+UPIUH
   EOQl0YPv5byGERpEo1p6cP6wWXWyZDsOjrEDPiP6tSHzmydkY7BTPhOMk
   FJUbhq/tFMoPIqY/vcU0kMm9em6tJZxMhg9JkvOMGIAzbQQteGrtH4YUO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="362969095"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="362969095"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 14:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858073472"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="858073472"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2023 14:05:23 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfRcP-0005Pc-0b;
	Sun, 10 Sep 2023 21:05:21 +0000
Date: Mon, 11 Sep 2023 05:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/memcpy_kunit.c:299 init_large() warn: calling memset(x, y,
 ARRAY_SIZE());
Message-ID: <202309110524.wasJTGqB-lkp@intel.com>
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
head:   1548b060d6f32a00a2f7e2c11328205fb66fc4fa
commit: 96fce387d58fa8eae6e8d9b1ecdfbc18292d7a68 kunit/memcpy: Add dynamic size and window tests
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: openrisc-randconfig-r071-20230906 (https://download.01.org/0day-ci/archive/20230911/202309110524.wasJTGqB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309110524.wasJTGqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309110524.wasJTGqB-lkp@intel.com/

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
