Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3648191
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Nov 2022 00:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667868338; x=1699404338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJFrV4qLMjelUQ+VMpvrmIskf994xIRtFoUwyvSmLFA=;
  b=bFiMASztOV0KiqyWoSwDarPD6typv9L9DQ6UQt3MFN7l++FVP0YVlgIV
   NRuBxD6w6pLIFRjxhX/O+CM8fFLzk3EQMvCacZIX/uhvgfC7bjLB5cXkh
   RMe2WKb7bckgW7vNryAO863j+1WFb3iMQ14pGmkY/hJoXcA711rEp8N+X
   Mi0BPSz+7gnWvl3akpnuB/u7mPir6mvSGviHO3lwih99j1z0FvXgDtDv8
   KUfE5aMpLdXdFwFkAZIFkwoeTxSygPQmIdh1uzk2wclycVr6GNPUpsDWz
   iFFp9mjJy+f2kuq6IGaCjG2xVzsN75gebTM6ojWnRdIeE2AJFrhtatiJp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="337286169"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="337286169"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 16:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="667385639"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="667385639"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Nov 2022 16:45:28 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osCk3-0001MG-1r;
	Tue, 08 Nov 2022 00:45:27 +0000
Date: Tue, 8 Nov 2022 08:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/slab.c:1650:24: warning: Uninitialized variables:
 slab.__page_flags, slab.__unused_1, slab.freelist, slab.units,
 slab.__unused_2, slab.__page_refcount [uninitvar]
Message-ID: <202211080838.Ng2mr30t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/slab.c:1650:24: warning: Uninitialized variables: slab.__page_flags, slab.__unused_1, slab.freelist, slab.units, slab.__unused_2, slab.__page_refcount [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hyeonggon Yoo <42.hyeyoo@gmail.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   59f2f4b8a757412fce372f6d0767bdb55da127a8
commit: b01af5c0b0414f96e6c3891e704d1c40faa18813 mm/slob: Remove unnecessary page_mapcount_reset() function call
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b01af5c0b0414f96e6c3891e704d1c40faa18813
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
   mm/slab.c:3334:16: warning: Local variable 'slab' shadows outer variable [shadowVariable]
     struct slab *slab;
                  ^
   mm/slab.c:3328:15: note: Shadowed declaration
    struct slab *slab;
                 ^
   mm/slab.c:3334:16: note: Shadow variable
     struct slab *slab;
                  ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/slab.c:3310:7: warning: Redundant assignment of 'objp' to itself. [selfAssignment]
    objp = cache_alloc_debugcheck_after(cachep, flags, objp, caller);
         ^
   mm/slab.c:3455:7: warning: Redundant assignment of 'objp' to itself. [selfAssignment]
    objp = cache_free_debugcheck(cachep, objp, caller);
         ^
   mm/slab.c:3515:8: warning: Redundant assignment of 'p[i]' to itself. [selfAssignment]
     p[i] = cache_alloc_debugcheck_after(s, flags, p[i], caller);
          ^
   mm/slab.c:405:9: warning: Local variable 'slab_size' shadows outer function [shadowFunction]
    size_t slab_size = PAGE_SIZE << gfporder;
           ^
   mm/slab.h:194:22: note: Shadowed declaration
   static inline size_t slab_size(const struct slab *slab)
                        ^
   mm/slab.c:405:9: note: Shadow variable
    size_t slab_size = PAGE_SIZE << gfporder;
           ^
>> mm/slab.c:1650:24: warning: Uninitialized variables: slab.__page_flags, slab.__unused_1, slab.freelist, slab.units, slab.__unused_2, slab.__page_refcount [uninitvar]
     slab_destroy(cachep, slab);
                          ^

vim +1650 mm/slab.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1639  
678ff6a7afccc4 Shakeel Butt    2020-09-26  1640  /*
678ff6a7afccc4 Shakeel Butt    2020-09-26  1641   * Update the size of the caches before calling slabs_destroy as it may
678ff6a7afccc4 Shakeel Butt    2020-09-26  1642   * recursively call kfree.
678ff6a7afccc4 Shakeel Butt    2020-09-26  1643   */
97654dfa20caa5 Joonsoo Kim     2014-08-06  1644  static void slabs_destroy(struct kmem_cache *cachep, struct list_head *list)
97654dfa20caa5 Joonsoo Kim     2014-08-06  1645  {
7981e67efb8590 Vlastimil Babka 2021-11-02  1646  	struct slab *slab, *n;
97654dfa20caa5 Joonsoo Kim     2014-08-06  1647  
7981e67efb8590 Vlastimil Babka 2021-11-02  1648  	list_for_each_entry_safe(slab, n, list, slab_list) {
7981e67efb8590 Vlastimil Babka 2021-11-02  1649  		list_del(&slab->slab_list);
7981e67efb8590 Vlastimil Babka 2021-11-02 @1650  		slab_destroy(cachep, slab);
97654dfa20caa5 Joonsoo Kim     2014-08-06  1651  	}
97654dfa20caa5 Joonsoo Kim     2014-08-06  1652  }
97654dfa20caa5 Joonsoo Kim     2014-08-06  1653  

:::::: The code at line 1650 was first introduced by commit
:::::: 7981e67efb85908d9c4924c8e6669c5d5fe365b7 mm/slab: Convert most struct page to struct slab by spatch

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
