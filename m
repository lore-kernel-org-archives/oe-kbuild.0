Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732E57261B
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605593; cv=none; b=IkQj3d6/p2GT2fY83Gmri3iUv9grzM6r0pt2rRpDJBqCvIWyNl+/IwSRDuOMxG6XpzZzl+NEIke5ydAncdNgB+KQvxocOxbtUZNkHKMTcwa1BrvICHEYv4C8fMh4zZwOi8kpXqrJH+YP2o29AW/dDtHaVN0NjXESt/PKXMq1GP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605593; c=relaxed/simple;
	bh=oCd77HKf6eGoN+l4dIGUOHKaXb8Z7m9b1R39qO2kcAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rWRus1hm9NegNlnr4InW6L8mIvxYSjNdfFnlOJ7dlNLybEBrpTmG6hHl8BYEQ4DaSYKlIQhEh2CnI4TDi8R9HWXynKr3Uts8eowXeaxWWtUgF6ABiCpXTAlvwCAdn9UDBQBZXKHVFkNh/OmlxYfDJG23Zulpx5FYmplioditGf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctuGKMJ5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctuGKMJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746605591; x=1778141591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oCd77HKf6eGoN+l4dIGUOHKaXb8Z7m9b1R39qO2kcAI=;
  b=ctuGKMJ538Rgopj8mUvx9SXtVmqha+oHnT5Y06inlU7IbjSlFfLybSBZ
   JVlrioCzM6GjoIm5ACIPe5PmsI0R3GCROdiE1/rpmnnREx2mM6I7RZSAy
   r52dnPkl3VYjQgIuEFidjRT0bUkSlNvmYwCjVi8dE4N0OzAtWdXuBvQ7K
   a8B9hDxF6atBhv9P/xFShMUikWZ+byOQKgsHKdrTopTqqRMh78wT/C9xu
   Gs3/ETu2rJj8hSNdv3ejcFi33fbJKgpNH6P2CcjK70bXBEkaoUtprkEu1
   C8dEiqBUJLbIRq8x9uxWZs+KMl8++WCXr865NZ/Eadtnw1PFwh7SSwgd/
   Q==;
X-CSE-ConnectionGUID: KW75ir26SU6k87lqwpQ+7A==
X-CSE-MsgGUID: y+809iqsSAa7+RrAiHdzeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48330744"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48330744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:13:11 -0700
X-CSE-ConnectionGUID: F6gFlNosSoyTvP4HqvIG9w==
X-CSE-MsgGUID: XTI4W+osRES/jd5psaz4Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="139938751"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 01:13:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZts-0007OG-0H;
	Wed, 07 May 2025 08:13:08 +0000
Date: Wed, 7 May 2025 16:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/slub_kunit.c:131 test_clobber_redzone_free() error:
 dereferencing freed memory 'p' (line 130)
Message-ID: <202505071641.6E14bqVh-lkp@intel.com>
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
TO: Kees Cook <kees@kernel.org>
CC: David Gow <davidgow@google.com>
CC: Rae Moar <rmoar@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071641.6E14bqVh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505071641.6E14bqVh-lkp@intel.com/

smatch warnings:
lib/tests/slub_kunit.c:131 test_clobber_redzone_free() error: dereferencing freed memory 'p' (line 130)

vim +/p +131 lib/tests/slub_kunit.c

1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  122  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  123  static void test_clobber_redzone_free(struct kunit *test)
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  124  {
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30  125  	struct kmem_cache *s = test_kmem_cache_create("TestSlub_RZ_free", 64,
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30  126  							SLAB_RED_ZONE);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  127  	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  128  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  129  	kasan_disable_current();
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28 @130  	kmem_cache_free(s, p);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28 @131  	p[64] = 0xab;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  132  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  133  	validate_slab_cache(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  134  	KUNIT_EXPECT_EQ(test, 2, slab_errors);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  135  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  136  	kasan_enable_current();
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  137  	kmem_cache_destroy(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  138  }
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  139  

:::::: The code at line 131 was first introduced by commit
:::::: 1f9f78b1b376f82cdd8ed73cc0abdb74d0453d43 mm/slub, kunit: add a KUnit test for SLUB debugging functionality

:::::: TO: Oliver Glitta <glittao@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
