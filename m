Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C714C5381
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jun 2023 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687171045; x=1718707045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+MO1O29wz+C4u1606jNHJRx9Dld5T32cZPfiYH7Nfc=;
  b=icHXxgwE2OVBd6RRNX8URQlmLbfnwCZxeLsziemqQwc02scL1AgIqdSi
   9VYf6ud1813I93ZszjDOzxKjl+s75DAKXRDtESu5HHd8lTCkZWHQjv67Z
   9m+MsCH7rw84PyAzh8S6vEZiRSw+FAdsD8sxZNU0gQDxtIeuyghEU8fCf
   YWM8+2mvKSzfWGxpDQy0KPSUqURAbvY8FT22rko1QABa7s02xZM5tCvLv
   BQ8dKJ8sKMm/5A2g0zIUjQZzxgNcM7ocylkOCfdvNwERpcRraRdPmWTEG
   WyO2saRnlfcBT9kEWNH2BYU0lDwAibTVCtG4fZbORsqVYdUKHbwbTl53t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="349320134"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="349320134"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 03:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="743409532"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="743409532"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jun 2023 03:37:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBCGB-0004dk-1B;
	Mon, 19 Jun 2023 10:37:23 +0000
Date: Mon, 19 Jun 2023 18:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works
 in KASAN generic outline mode!
Message-ID: <202306191845.ddCTgcG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Patricia Alfonso <trishalfonso@google.com>
CC: Richard Weinberger <richard@nod.at>
CC: Vincent Whitchurch <vincent.whitchurch@axis.com>
CC: David Gow <davidgow@google.com>
CC: Johannes Berg <johannes@sipsolutions.net>
CC: Dmitry Vyukov <dvyukov@google.com>
CC: Andrey Konovalov <andreyknvl@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45a3e24f65e90a047bef86f927ebdc4c710edaa1
commit: 5b301409e8bc5d7fad2ee138be44c5c529dd0874 UML: add support for KASAN under x86_64
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: um-randconfig-r023-20230619 (https://download.01.org/0day-ci/archive/20230619/202306191845.ddCTgcG9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191845.ddCTgcG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306191845.ddCTgcG9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kasan/generic.c:34:
>> mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works in KASAN generic outline mode!
     485 | #error kasan_arch_is_ready only works in KASAN generic outline mode!
         |  ^~~~~
--
   In file included from lib/test_kasan.c:28:
>> lib/../mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works in KASAN generic outline mode!
     485 | #error kasan_arch_is_ready only works in KASAN generic outline mode!
         |  ^~~~~


vim +485 mm/kasan/kasan.h

e2db1a9aa38149 Andrey Konovalov 2021-02-25  481  
af3751f3c2b628 Daniel Axtens    2021-06-28  482  #ifndef kasan_arch_is_ready
af3751f3c2b628 Daniel Axtens    2021-06-28  483  static inline bool kasan_arch_is_ready(void)	{ return true; }
af3751f3c2b628 Daniel Axtens    2021-06-28  484  #elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
af3751f3c2b628 Daniel Axtens    2021-06-28 @485  #error kasan_arch_is_ready only works in KASAN generic outline mode!
af3751f3c2b628 Daniel Axtens    2021-06-28  486  #endif
af3751f3c2b628 Daniel Axtens    2021-06-28  487  

:::::: The code at line 485 was first introduced by commit
:::::: af3751f3c2b6282bebcb56c35bbe4c8b671f80aa kasan: allow architectures to provide an outline readiness check

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
