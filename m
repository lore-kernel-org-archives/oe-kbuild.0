Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39C21F4629
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 05:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596994; cv=none; b=hbAJWVm7SdwZhUvy7z+C+4VmbvEfYJqpy9I98zyVP7+sI0ennyj23F9CcrfyWG1UIGPFzWXHnlcrF6tNnzA6ZKr6pkeHmSeeHaODB6IfnalPjt/GnvmYN0q0QUJ+hqqdC0sPg2irpc23dMbi6S6JL+OYKC3xN73Z0hi3hIdNpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596994; c=relaxed/simple;
	bh=BkO4ni5vfzuE2bjrhJ6SF3z9LfwbmQGc8rtk97Bpoqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QD8xK90DYiPUlHojOMFdoHNh3iM90zv944vinjLfuYHITT0WyveSOCL1vogUoBcKLtwoFpgI7OJivRDjJQVkz/g0eIHKPQN7I8gTjQ0tFpirKquTEOlVlCmFRusgzwZMQdwrT6TsG6lVWt8SNF6VTRkMwC6WwhVvllf/TraaUIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TB3Yscue; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TB3Yscue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596993; x=1778132993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BkO4ni5vfzuE2bjrhJ6SF3z9LfwbmQGc8rtk97Bpoqs=;
  b=TB3YscueWJEDzp/cQGceHmbrUVbXxfTWyBUlIWDpX14AfXku06ig8pGo
   LuZ4GBipys5TOwH+ltQnLW+vryIE9cacWqaxwAXl/aLgf25q/a/yrGKrQ
   HtsNRqmyn9mj3HXp3/oSZWJ1A548yDHLwdDusze2gyt1WKsvAHXtFS0KE
   vXYXHypKbvXrPuxUl+Fj2ux+V9cGbHb2MdwP1XQ0BaT2baose7dXGENh7
   FOnqlDuEAWj3b0xDGjAy4T5svrvdR59d/cEDtFO21RjlWrQLJcqjkaPLq
   V7MCgcYFAEgZjXsfZaENfOXXEfn1TL0U1bDWz+eZCUbhBjbMLEk1aeCIH
   w==;
X-CSE-ConnectionGUID: uz1N3TsKS4ScPual0o7XRw==
X-CSE-MsgGUID: dweHVWmUQ6uEP13PS89cWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52120522"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52120522"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:49:50 -0700
X-CSE-ConnectionGUID: 5o6frRQaSKy+FMvlG1gJ9Q==
X-CSE-MsgGUID: l5trHyluQr+jodgNWBO/Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140580427"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2025 22:49:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXf8-00077i-2r;
	Wed, 07 May 2025 05:49:46 +0000
Date: Wed, 7 May 2025 13:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kees:for-next/hardening 6/14] mm/kasan/kasan_test_c.c:1504:7:
 warning: argument to variable-length array may be too large due to
 conversion from 'int' to 'long unsigned int'
Message-ID: <202505071331.4iOzqmuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <kees@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
head:   48b79238694db6e7eb3dd6153cf71107db624a11
commit: 1ca6c23046d30abfe57d8706248ad5888aafa3bf [6/14] kbuild: Switch from -Wvla to -Wvla-larger-than=1
:::::: branch date: 33 hours ago
:::::: commit date: 9 days ago
config: arm64-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071331.4iOzqmuE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071331.4iOzqmuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071331.4iOzqmuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kasan/kasan_test_c.c: In function 'kasan_alloca_oob_right':
>> mm/kasan/kasan_test_c.c:1504:7: warning: argument to variable-length array may be too large due to conversion from 'int' to 'long unsigned int' [-Wvla-larger-than=]
     char alloca_array[i];
          ^~~~~~~~~~~~
   mm/kasan/kasan_test_c.c: In function 'kasan_alloca_oob_left':
   mm/kasan/kasan_test_c.c:1489:7: warning: argument to variable-length array may be too large due to conversion from 'int' to 'long unsigned int' [-Wvla-larger-than=]
     char alloca_array[i];
          ^~~~~~~~~~~~
   mm/kasan/kasan_test_c.c: At top level:
   cc1: warning: unrecognized command line option '-Wno-vla-larger-than'


vim +1504 mm/kasan/kasan_test_c.c

00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1500  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1501  static void kasan_alloca_oob_right(struct kunit *test)
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1502  {
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1503  	volatile int i = 10;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06 @1504  	char alloca_array[i];
2dfd1bd992322f lib/test_kasan.c Peter Collingbourne 2022-03-24  1505  	/* See comment in kasan_global_oob_right. */
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1506  	char *volatile array = alloca_array;
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1507  	char *p = array + i;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1508  
58b999d7a22c59 lib/test_kasan.c Andrey Konovalov    2020-11-01  1509  	/* Only generic mode instruments dynamic allocas. */
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1510  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1511  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_STACK);
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1512  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1513  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1514  }
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1515  

:::::: The code at line 1504 was first introduced by commit
:::::: 00a14294bb33af533f7ac002fb20623fdd8ea0d7 kasan: add tests for alloca poisoning

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
