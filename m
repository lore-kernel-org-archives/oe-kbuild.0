Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CD32459D9
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760785940; cv=none; b=j83VJoFq1Quuj1tkID37fZfYkfLNMBnIeRrEUMbG0sS6Kl8UGbK7UJz+x1Bjbc91aIHIgosjrNLxiZivKSDIZoejzY3sFG/3A4ywBeXk2pooBMQBJNcUOD86tk9jM0jM3FDiPD7uf+9I2iZXcbyAGjv9Kn5GpIoBnuh15/TuWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760785940; c=relaxed/simple;
	bh=YFRWVLf+q8ih6ZM6cICfEm9atva3CU+r8rHjPp+riZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H9HHJ1hKo8bDpm59Ojk1YXwG8TjGqP7YCaBWVQDAPs7RnSIgryRRroQRIfUoWmrwdoQebFYSRSvGo3dNFmtRKhzPvlanH5i693pS9VLf55bkrs7n9DrM9ocer5hL21m2W/8B485i8K4sjtor1Yl8ST2Z5kEja272lxZuX+lmI48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCLcKC0m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCLcKC0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760785937; x=1792321937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YFRWVLf+q8ih6ZM6cICfEm9atva3CU+r8rHjPp+riZw=;
  b=RCLcKC0m7gUpvb9o3tFjzK6Gg9vpeoC7TmzmjBJ+iIq1FsFOI+3Pptxw
   fzVJcWtPc1zalpyXlcSJYGmsIl4kFcWxD89h4ewST6q+1ij6Y4W++H4lM
   FyXSygKOjz9xjDoI7+jYLhm9/XG7W3OWRne4boltbIA45M7PmLFCtn9ux
   mSqwAyUiZilQGZSs4DgwFpIocq0J+7hbePTMJQctRxGDoRS31Utxr1MeA
   PvceFUkMyPj7Qya4bWncKmRE+vDisWvbX6OgjzxS8iOkvue5Xapzv/e7g
   +CfVFR/lX3uvbYHVS6eW4AI5xnoFsscddLcWUNVYBgoJXqU3Gdeh5ltMJ
   w==;
X-CSE-ConnectionGUID: 9q6jbSHISISJj2FMQmGG/w==
X-CSE-MsgGUID: KOjh7UTNTOi4z5a+e+Z0Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66627556"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="66627556"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 04:12:17 -0700
X-CSE-ConnectionGUID: oveQe18VQRm5f19hSxFt+w==
X-CSE-MsgGUID: fuTQi8dXTpSov7CQ3+RCYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="213909867"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Oct 2025 04:12:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA4r7-0008FJ-31;
	Sat, 18 Oct 2025 11:12:13 +0000
Date: Sat, 18 Oct 2025 19:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [davidhildenbrand:balloon 16/22] mm/balloon.c:316:3: error: call to
 '__compiletime_assert_380' declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202510181904.Gky7jupL-lkp@intel.com>
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
TO: David Hildenbrand <david@redhat.com>

Hi David,

First bad commit (maybe != root cause):

tree:   https://github.com/davidhildenbrand/linux balloon
head:   7eef08e97c0bed3ecf03a02e2283be82b9bce389
commit: 853feb75ffb0b0ab4a283afc27cad4a8732839ea [16/22] mm: rename balloon_compaction.(c|h) to balloon.(c|h)
:::::: branch date: 21 hours ago
:::::: commit date: 23 hours ago
config: i386-buildonly-randconfig-003-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181904.Gky7jupL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181904.Gky7jupL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510181904.Gky7jupL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/balloon.c:316:3: error: call to '__compiletime_assert_380' declared with 'error' attribute: BUILD_BUG failed
     316 |                 BUILD_BUG();
         |                 ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:597:2: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:28:1: note: expanded from here
      28 | __compiletime_assert_380
         | ^
   1 error generated.


vim +316 mm/balloon.c

18468d93e53b03 mm/balloon_compaction.c Rafael Aquini           2012-12-11  273  
68f2736a858324 mm/balloon_compaction.c Matthew Wilcox (Oracle  2022-06-07  274) static int balloon_page_migrate(struct page *newpage, struct page *page,
b1123ea6d3b3da mm/balloon_compaction.c Minchan Kim             2016-07-26  275  		enum migrate_mode mode)
18468d93e53b03 mm/balloon_compaction.c Rafael Aquini           2012-12-11  276  {
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  277  	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  278  	unsigned long flags;
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  279  	int rc;
18468d93e53b03 mm/balloon_compaction.c Rafael Aquini           2012-12-11  280  
3544c4faccb8f0 mm/balloon_compaction.c David Hildenbrand       2025-07-04  281  	/* Isolated balloon pages cannot get deflated. */
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  282  	if (WARN_ON_ONCE(!b_dev_info))
3544c4faccb8f0 mm/balloon_compaction.c David Hildenbrand       2025-07-04  283  		return -EAGAIN;
3544c4faccb8f0 mm/balloon_compaction.c David Hildenbrand       2025-07-04  284  
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  285  	rc = b_dev_info->migratepage(b_dev_info, newpage, page, mode);
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  286  	if (rc && rc != -ENOENT)
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  287  		return rc;
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  288  
87268a419a027d mm/balloon_compaction.c David Hildenbrand       2025-10-13  289  	spin_lock_irqsave(&balloon_pages_lock, flags);
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  290  	switch (rc) {
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  291  	case 0:
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  292  		/* Insert the new page into the balloon list. */
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  293  		get_page(newpage);
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  294  
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  295  		balloon_page_insert(b_dev_info, newpage);
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  296  		__count_vm_event(BALLOON_MIGRATE);
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  297  
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  298  		if (b_dev_info->adjust_managed_page_count &&
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  299  		    page_zone(page) != page_zone(newpage)) {
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  300  			/*
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  301  			 * When we migrate a page to a different zone we
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  302  			 * have to fixup the count of both involved zones.
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  303  			 */
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  304  			adjust_managed_page_count(page, 1);
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  305  			adjust_managed_page_count(newpage, -1);
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  306  		}
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  307  		break;
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  308  	case -ENOENT:
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  309  		/* The new page was not inflated. */
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  310  		__count_vm_event(BALLOON_DEFLATE);
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  311  
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  312  		if (b_dev_info->adjust_managed_page_count)
5ed6fe63ac1eef mm/balloon_compaction.c David Hildenbrand       2025-10-08  313  			adjust_managed_page_count(page, 1);
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  314  		break;
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  315  	default:
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01 @316  		BUILD_BUG();
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  317  	}
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  318  
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  319  	b_dev_info->isolated_pages--;
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  320  
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  321  	/* Free the now-deflated page we isolated in balloon_page_isolate(). */
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  322  	balloon_page_finalize(page);
e7c70fca0eda36 mm/balloon_compaction.c David Hildenbrand       2025-10-13  323  	spin_unlock_irqrestore(&balloon_pages_lock, flags);
e7c70fca0eda36 mm/balloon_compaction.c David Hildenbrand       2025-10-13  324  
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  325  	put_page(page);
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  326  
3dfc835763a437 mm/balloon_compaction.c David Hildenbrand       2025-08-01  327  	return 0;
18468d93e53b03 mm/balloon_compaction.c Rafael Aquini           2012-12-11  328  }
18468d93e53b03 mm/balloon_compaction.c Rafael Aquini           2012-12-11  329  

:::::: The code at line 316 was first introduced by commit
:::::: 3dfc835763a4371cf82fbd61365c129f20a11d6a mm/balloon_compaction: centralize basic page migration handling

:::::: TO: David Hildenbrand <david@redhat.com>
:::::: CC: David Hildenbrand <david@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
