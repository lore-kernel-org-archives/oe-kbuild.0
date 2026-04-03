Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C723E320
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205961; cv=none; b=Gfk9QvPbsG4VuXu5xK/jh6+xE57Uvq7YMD6OosryOUQdz42wlewBbZkewotYTIcd7LdsGQgqHHS3MXnEtzY8ASBiyttAZCjTC3vrVi8lfdNQBNgSO7psQPDqHGVw0Bv8LIauSQ6PzU551ZeRBmoSf/TJBMnZN9H7z2CGH5c5Kbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205961; c=relaxed/simple;
	bh=siquPjWHGhykHvdCDi21CLd/2YFBX7JRZ2JmxnhlIx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aEVz32L0w5ca8vmrEjgJKClzPU6GRXEoRqCsS1sWGMNHe7BO/5DJEAGSn+YinAYnUzP0yd2/IzD9p1LZgy9R+J4QagtX2cWeE08OJN696koi36KDwZZu+LKpRD+8lzbh6m+9nDTkxMNB2SMjmE31hbZUdCTmJKn6s2Lbqhyvk+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVhznrLH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVhznrLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205960; x=1806741960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=siquPjWHGhykHvdCDi21CLd/2YFBX7JRZ2JmxnhlIx4=;
  b=FVhznrLHTDTJVg/GOmb6Ob7w7LmUdE+ssrXYWwgTwOEAwGbAF/ciDm5G
   YKnHcprTXq4yZ/pzgp9Im1yp25es62HoSQ38Bt8wVoFcFlWOwORlnlGjq
   ZH3hiskZv9KMnHzB1HQ6J939RNpiNsyvRKP08ErM9v3psVC0pHumybjdp
   MsL8awx494AVAzGdWw//lMimmlShYkjbOZOduNMhAI12tKAGoLyshylAz
   hqlkurspbDDiQWCmRUi2JwMjmawMRLc79tfwIPVsS5K/Tbn0hRIiQi0vh
   v7lBqHG9wxXP3BfCEi4nYLLaR78QpGjWIY2orm/U8CONiIxAe9RxtQGwn
   A==;
X-CSE-ConnectionGUID: 9gJ2IEwtQr65uBJzEMuHYw==
X-CSE-MsgGUID: s/+S8LG4SRKHeiLYN1AtxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75993483"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75993483"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:00 -0700
X-CSE-ConnectionGUID: rLVPwG5xT2uTmHJtN7JGtw==
X-CSE-MsgGUID: +dnfsF4KThSPMTcwPEtGUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="232134359"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-0000000015z-1ouD;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 3 Apr 2026 16:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] mm/sparse: fix BUILD_BUG_ON check for section map
 alignment
Message-ID: <202604031027.A6fEk4R5-lkp@intel.com>
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
In-Reply-To: <20260331113023.2068075-1-songmuchun@bytedance.com>
References: <20260331113023.2068075-1-songmuchun@bytedance.com>
TO: Muchun Song <songmuchun@bytedance.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Hildenbrand <david@kernel.org>
CC: Lorenzo Stoakes <ljs@kernel.org>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Vlastimil Babka <vbabka@kernel.org>
CC: Mike Rapoport <rppt@kernel.org>
CC: Suren Baghdasaryan <surenb@google.com>
CC: Michal Hocko <mhocko@suse.com>
CC: Petr Tesarik <ptesarik@suse.com>
CC: linux-kernel@vger.kernel.org
CC: muchun.song@linux.dev
CC: Muchun Song <songmuchun@bytedance.com>

Hi Muchun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc6]
[cannot apply to akpm-mm/mm-everything next-20260401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muchun-Song/mm-sparse-fix-BUILD_BUG_ON-check-for-section-map-alignment/20260402-231649
base:   linus/master
patch link:    https://lore.kernel.org/r/20260331113023.2068075-1-songmuchun%40bytedance.com
patch subject: [PATCH] mm/sparse: fix BUILD_BUG_ON check for section map alignment
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260403/202604031027.A6fEk4R5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031027.A6fEk4R5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604031027.A6fEk4R5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/sparse.c:272:2: error: call to '__compiletime_assert_425' declared with 'error' attribute: BUILD_BUG_ON failed: SECTION_MAP_LAST_BIT > min(PFN_SECTION_SHIFT + __ffs(sizeof(struct page)), PAGE_SHIFT)
     272 |         BUILD_BUG_ON(SECTION_MAP_LAST_BIT > min(PFN_SECTION_SHIFT + __ffs(sizeof(struct page)),
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:706:2: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:216:1: note: expanded from here
     216 | __compiletime_assert_425
         | ^
   1 error generated.


vim +272 mm/sparse.c

9def36e0fa9a0d Logan Gunthorpe 2018-12-14  262  
29751f6991e845 Andy Whitcroft  2005-06-23  263  /*
29751f6991e845 Andy Whitcroft  2005-06-23  264   * Subtle, we encode the real pfn into the mem_map such that
29751f6991e845 Andy Whitcroft  2005-06-23  265   * the identity pfn - section_mem_map will return the actual
29751f6991e845 Andy Whitcroft  2005-06-23  266   * physical page frame number.
29751f6991e845 Andy Whitcroft  2005-06-23  267   */
29751f6991e845 Andy Whitcroft  2005-06-23  268  static unsigned long sparse_encode_mem_map(struct page *mem_map, unsigned long pnum)
29751f6991e845 Andy Whitcroft  2005-06-23  269  {
def9b71ee651a6 Petr Tesarik    2018-01-31  270  	unsigned long coded_mem_map =
def9b71ee651a6 Petr Tesarik    2018-01-31  271  		(unsigned long)(mem_map - (section_nr_to_pfn(pnum)));
d05a0da0a4e235 Muchun Song     2026-03-31 @272  	BUILD_BUG_ON(SECTION_MAP_LAST_BIT > min(PFN_SECTION_SHIFT + __ffs(sizeof(struct page)),
d05a0da0a4e235 Muchun Song     2026-03-31  273  						PAGE_SHIFT));
def9b71ee651a6 Petr Tesarik    2018-01-31  274  	BUG_ON(coded_mem_map & ~SECTION_MAP_MASK);
def9b71ee651a6 Petr Tesarik    2018-01-31  275  	return coded_mem_map;
29751f6991e845 Andy Whitcroft  2005-06-23  276  }
29751f6991e845 Andy Whitcroft  2005-06-23  277  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
