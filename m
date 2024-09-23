Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16633198830
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727110179; cv=none; b=LOBaFpZcdVVQe/SD6HlWOP9nAAgNmbgv5v0d5oQVMECOTPBaGKUBFO1JHiC9zd9rvZoegW8z/q3C4l/izGM4nGS9HzwOPbXyT1UGAitNHnSvnb8Rzqii0G5T0dFirE2CL9Zq4ETSCcLGvEPbbi9+z+Jvk5cP4KWy3XnN7JitR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727110179; c=relaxed/simple;
	bh=fP1u3Ff3KaO3ey4C9r48EqS0bntNJBcMKhwStMCdzRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XbncY34uTi6ZOjYrEvOzLHCC+w81HGALJrzBM/2/FQAU2aPMMCNwJI1HLBMCy8VZ+EwoSzz8pzKhYF17/jlH1SoOv/S/WKB8hxi0oHwRDJTU9Vp09ffMJoDwdCxQ5yqkijZig2G7qDDpKL9myQa1rkQK/C3NQMUeoPhpwsghyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMLFr9dr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMLFr9dr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727110177; x=1758646177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fP1u3Ff3KaO3ey4C9r48EqS0bntNJBcMKhwStMCdzRY=;
  b=LMLFr9drtwnKNObNVjEqGamFc3xuowHg9JrrmCmnQD4WJ+Kh+5mryTpO
   us/E2tjf7WzzJ1q4Ue9KUl0JUn9BPX0W+VHTFBUDgLD3UROOTdYi7NSbM
   U8TCkbO8f2PrkqtwkY+nH9f06/KerPoUSLsunPy68ETzHNzM2wwvlcWyL
   wOlWGlrFXYboPmUGamEBxiP2skaGmPfQH7Durro51azCmTKdBo/cxDcXW
   9TPrFQ58Ii5eb1AcQgpBIbuTRitA+2nGvhKfUxQD4ISePkfiZJlbr41ol
   9wrHjgvlBwddMHTYnrtwc6R76VNpBx305FBVblTOzbwkgBWqWUtY8saKW
   g==;
X-CSE-ConnectionGUID: mbRn7k9TQtmNAHpYsonsQg==
X-CSE-MsgGUID: 9QJbZk20TBmxMygSnvLyOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43587023"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="43587023"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 09:49:36 -0700
X-CSE-ConnectionGUID: fvbhoR4WRk2ZgeptH2DRMw==
X-CSE-MsgGUID: 8o/3qPXUQpuneq5Blb8KQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="70708272"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2024 09:49:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssmFh-000HQo-11;
	Mon, 23 Sep 2024 16:49:33 +0000
Date: Tue, 24 Sep 2024 00:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11807/12558] mm/kasan/kasan_test_c.c:1405
 kasan_stack_oob() error: buffer overflow 'array' 10 <= 26
Message-ID: <202409240032.zlQB8irZ-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Matthew Maurer <mmaurer@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef545bc03a65438cabe87beb1b9a15b0ffcb6ace
commit: a2f11547052001bd448ccec81dd1e68409078fbb [11807/12558] kasan: rust: Add KASAN smoke test via UAF
:::::: branch date: 13 hours ago
:::::: commit date: 7 days ago
config: arm64-randconfig-r071-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240032.zlQB8irZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409240032.zlQB8irZ-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:1405 kasan_stack_oob() error: buffer overflow 'array' 10 <= 26

vim +/array +1405 mm/kasan/kasan_test_c.c

e5f4728767d2ec lib/test_kasan.c Marco Elver         2022-01-14  1399  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1400  static void kasan_stack_oob(struct kunit *test)
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1401  {
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1402  	char stack_array[10];
2dfd1bd992322f lib/test_kasan.c Peter Collingbourne 2022-03-24  1403  	/* See comment in kasan_global_oob_right. */
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1404  	char *volatile array = stack_array;
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14 @1405  	char *p = &array[ARRAY_SIZE(stack_array) + OOB_TAG_OFF];
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1406  
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1407  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_STACK);
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1408  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1409  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1410  }
eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1411  

:::::: The code at line 1405 was first introduced by commit
:::::: f649dc0e0d7b509c75570ee403723660f5b72ec7 kasan: fix unit tests with CONFIG_UBSAN_LOCAL_BOUNDS enabled

:::::: TO: Peter Collingbourne <pcc@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
