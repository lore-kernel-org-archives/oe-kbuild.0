Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9492E63B3
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Feb 2023 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675265973; x=1706801973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3sqpSg4CTER7nr5RiGU5+Z936KWWaq0gkTaRz2pgQw=;
  b=Q4HwzJkdwcIbVnHpVDibNonpIsqkYX9OrAZxWSldVsGwEP39ZjsXFp0Z
   iQhiWa3Zf6wl3l0FcKKu/U6Neel11axVfGlxZwC5IdcQ+RlN7Xvx622WT
   zC+3I3W2q0MKBJZSWltBnuBCeBCOcZEhsD7HmY4QeFGIutBZ8Geu6oJki
   orgyHauGCzAWD/JPbhWDx3RgH1CNwmdLYdJOOp1JVBEsNx/4Dcigh2V0H
   fwnCIp7TQhpAH3m6j4yORRaI067CebGSfIEqNoweSTqrsOylGr9cThbgq
   9VATeEn2oJ1uEASdkpuaR+Jh4ZSR4cWnPH+HYk54f1WxcmS9OoUwjl62K
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326830091"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="326830091"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 07:39:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658353275"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="658353275"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Feb 2023 07:39:31 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNFCt-0005XS-03;
	Wed, 01 Feb 2023 15:39:31 +0000
Date: Wed, 1 Feb 2023 23:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/kunit/test.c:717:44: warning: Parameter 'match_data' can be
 declared as pointer to const [constParameter]
Message-ID: <202302012331.yuDjQrbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/kunit/test.c:717:44: warning: Parameter 'match_data' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniel Latypov <dlatypov@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: David Gow <davidgow@google.com>
CC: Brendan Higgins <brendanhiggins@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0b67534c95c537f7a506a06b98e5e85d72e2b7d
commit: 047a8a0a2da716fecfd325d21ccf509c431992d9 kunit: make kunit_kfree() only work on pointers from kunit_malloc() and friends
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 047a8a0a2da716fecfd325d21ccf509c431992d9
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   lib/kunit/test.c:221:25: warning: Parameter 'test_case' can be declared as pointer to const [constParameter]
        struct kunit_case *test_case)
                           ^
>> lib/kunit/test.c:717:44: warning: Parameter 'match_data' can be declared as pointer to const [constParameter]
            struct kunit_resource *res, void *match_data)
                                              ^
--
   mm/zsmalloc.c:2015:16: warning: Local variable 'obj_allocated' shadows outer function [shadowFunction]
    unsigned long obj_allocated = zs_stat_get(class, OBJ_ALLOCATED);
                  ^
   mm/zsmalloc.c:862:13: note: Shadowed declaration
   static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
               ^
   mm/zsmalloc.c:2015:16: note: Shadow variable
    unsigned long obj_allocated = zs_stat_get(class, OBJ_ALLOCATED);
                  ^
>> mm/zsmalloc.c:1967:15: warning: Uninitialized variables: zspage.huge, zspage.fullness, zspage.class, zspage.isolated, zspage.magic, zspage.inuse, zspage.freeobj, zspage.first_page, zspage.pool, zspage.lock [uninitvar]
     lock_zspage(zspage);
                 ^
   mm/zsmalloc.c:1957:20: note: Assuming condition is false
     if (class->index != i)
                      ^
   mm/zsmalloc.c:1967:15: note: Uninitialized variables: zspage.huge, zspage.fullness, zspage.class, zspage.isolated, zspage.magic, zspage.inuse, zspage.freeobj, zspage.first_page, zspage.pool, zspage.lock
     lock_zspage(zspage);
                 ^
   mm/zsmalloc.c:584:16: warning: Local variable 'obj_allocated' shadows outer function [shadowFunction]
    unsigned long obj_allocated, obj_used, pages_used, freeable;
                  ^
   mm/zsmalloc.c:862:13: note: Shadowed declaration
   static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
               ^
   mm/zsmalloc.c:584:16: note: Shadow variable
    unsigned long obj_allocated, obj_used, pages_used, freeable;
                  ^

vim +/match_data +717 lib/kunit/test.c

0a756853586ce1 Brendan Higgins 2019-09-23  715  
047a8a0a2da716 Daniel Latypov  2022-07-22  716  static inline bool kunit_kfree_match(struct kunit *test,
047a8a0a2da716 Daniel Latypov  2022-07-22 @717  				     struct kunit_resource *res, void *match_data)
047a8a0a2da716 Daniel Latypov  2022-07-22  718  {
047a8a0a2da716 Daniel Latypov  2022-07-22  719  	/* Only match resources allocated with kunit_kmalloc() and friends. */
047a8a0a2da716 Daniel Latypov  2022-07-22  720  	return res->free == kunit_kmalloc_array_free && res->data == match_data;
047a8a0a2da716 Daniel Latypov  2022-07-22  721  }
047a8a0a2da716 Daniel Latypov  2022-07-22  722  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
