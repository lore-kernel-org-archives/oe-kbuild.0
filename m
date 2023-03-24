Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B68417C9
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 01:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679622297; x=1711158297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aFbg+fVgn7tCBea0t0CWmhJV3SDI9E7MysDMIJ9bXrQ=;
  b=BlnDfT2tAdK4YJFN+mryD242BePM2d0S26TktJZqS12wATukXIQQd1vD
   nBTNirY4TgNgAuz68ssjR7W7AZPrB+2dNvUBk2K3x7S4+GRPcqCGRL8dC
   sl2PDkUPnkFX7kI2x8bChoZJGW8J028Ny3M28fhmKViISrAWkNlkStXxE
   9Hx7SDEoVYTssU56DfkC+5Ia2VYyiaAsbE4GL3tlFpkPfRM1oUphr1Wtx
   HybbvUbCnhhH/nJ3ybO/kZcIDxC10ET1F3gPPCjjtYn5vaiSzrNSdG1yT
   pTDvjvB21fVLlPbngYq6iSeauVJr5VDsaoMNGKqByAZheoYHa8tkRBxgy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="342057959"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="342057959"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 18:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="1012071923"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="1012071923"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2023 18:44:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfWU9-000Eso-14;
	Fri, 24 Mar 2023 01:44:53 +0000
Date: Fri, 24 Mar 2023 09:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 269/293] mm/mm_init.c:787:32: sparse: sparse:
 shift too big (4294967295) for type unsigned long
Message-ID: <202303240907.UO4oYfmj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/mm_init.c:787:32: sparse: sparse: shift too big (4294967295) for type unsigned long"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Mike Rapoport (IBM)" <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   51551d71edbc998fd8c8afa7312db3d270f5998e
commit: a37d26b620530076879100bb6e3953458bf069fe [269/293] mm: move most of core MM initialization to mm/mm_init.c
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: sparc-randconfig-s052-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240907.UO4oYfmj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=a37d26b620530076879100bb6e3953458bf069fe
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout a37d26b620530076879100bb6e3953458bf069fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303240907.UO4oYfmj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mm_init.c:420:25: sparse: sparse: shift count is negative (-1)
   mm/mm_init.c:531:25: sparse: sparse: shift count is negative (-1)
>> mm/mm_init.c:787:32: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/mm_init.c:863:21: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/mm_init.c:1923:25: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/mm_init.c:1954:13: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/mm_init.c:1954:13: sparse: sparse: shift too big (4294967295) for type unsigned long
   mm/mm_init.c:2056:32: sparse: sparse: shift count is negative (-1)

vim +787 mm/mm_init.c

a37d26b6205300 Mike Rapoport (IBM  2023-03-21  756) 
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  757) /*
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  758)  * Only struct pages that correspond to ranges defined by memblock.memory
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  759)  * are zeroed and initialized by going through __init_single_page() during
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  760)  * memmap_init_zone_range().
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  761)  *
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  762)  * But, there could be struct pages that correspond to holes in
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  763)  * memblock.memory. This can happen because of the following reasons:
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  764)  * - physical memory bank size is not necessarily the exact multiple of the
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  765)  *   arbitrary section size
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  766)  * - early reserved memory may not be listed in memblock.memory
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  767)  * - memory layouts defined with memmap= kernel parameter may not align
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  768)  *   nicely with memmap sections
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  769)  *
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  770)  * Explicitly initialize those struct pages so that:
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  771)  * - PG_Reserved is set
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  772)  * - zone and node links point to zone and node that span the page if the
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  773)  *   hole is in the middle of a zone
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  774)  * - zone and node links point to adjacent zone/node if the hole falls on
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  775)  *   the zone boundary; the pages in such holes will be prepended to the
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  776)  *   zone/node above the hole except for the trailing pages in the last
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  777)  *   section that will be appended to the zone/node below.
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  778)  */
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  779) static void __init init_unavailable_range(unsigned long spfn,
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  780) 					  unsigned long epfn,
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  781) 					  int zone, int node)
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  782) {
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  783) 	unsigned long pfn;
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  784) 	u64 pgcnt = 0;
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  785) 
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  786) 	for (pfn = spfn; pfn < epfn; pfn++) {
a37d26b6205300 Mike Rapoport (IBM  2023-03-21 @787) 		if (!pfn_valid(pageblock_start_pfn(pfn))) {
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  788) 			pfn = pageblock_end_pfn(pfn) - 1;
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  789) 			continue;
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  790) 		}
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  791) 		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  792) 		__SetPageReserved(pfn_to_page(pfn));
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  793) 		pgcnt++;
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  794) 	}
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  795) 
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  796) 	if (pgcnt)
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  797) 		pr_info("On node %d, zone %s: %lld pages in unavailable ranges",
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  798) 			node, zone_names[zone], pgcnt);
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  799) }
a37d26b6205300 Mike Rapoport (IBM  2023-03-21  800) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
