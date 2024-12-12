Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809DD204C3D
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997510; cv=none; b=aRDDwYZrRa9TING7tXoCxkG9XOdsZKNjcq7jKSpyRP9OhL+WwFM4x+w6s6wR3J481M3Ga8gfl8If27sPJdjFUHiZon+wxghIrHimbsS42YM9mYP50WP9hsSpXn0/F427yrG/hhcivduhX5olbKLHytBPnz0ylW9VLD1tuWasS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997510; c=relaxed/simple;
	bh=DJXOxgrRewjoPQbSHG0ub/f2Dj6IbcJBIWhimz5yjA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkMx4Uvq1ut4Kqy8ii7cTvtD/lJkWnnDCq1q+AY8BxQbHPUiHF71iNP1uV1Ro7Oyg+Z0w5mt7k0GhZYi9jbJteEi+36AsJDgfYUxs4V65L+RFTW+YHD5EMWmmH65ncAMMOL21x21OijvIoY+XlllBO+LiKUwlAq97gz1jVrC5KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRqrZp/T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRqrZp/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733997509; x=1765533509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJXOxgrRewjoPQbSHG0ub/f2Dj6IbcJBIWhimz5yjA4=;
  b=LRqrZp/Tns57MVOmW+6ToQ1EdmDzGRU8wOZWUGANQ0D8+lXrj7E4Npar
   Z3EAgvPeI1lC+H47w9PLsFoMyqy8Rafa5L04HQfSsbrVcnKigtSWr/cMB
   znyaGGrEK2U9mrbQ6iiEAk4h2HLQ/o0UuJU0hMLDY42SFOqpKcn+4W+4Y
   rhGQwcIXMubJhWiXK+7IwubbfpTmPPyK8KCiXcwbuS9l/YvLB5l0bCM6D
   Hlp1LPO9PSaUtueMaFNR1bOx1118HyS7fKpASrQxGVDw21QRdF9fzhItJ
   BFvGudefvCopTK06cKO48SIAJNvMKYDwbOWvWcJuMKcNmwhVNx+vVWi15
   A==;
X-CSE-ConnectionGUID: jvB5T6rlTLSQbBYCbOOocA==
X-CSE-MsgGUID: 8pRK1+A+SmWY/dO26F+rQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34542808"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34542808"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:58:27 -0800
X-CSE-ConnectionGUID: Pah86QlKTKGyWDZg7QSWig==
X-CSE-MsgGUID: 6ItuwNGJRkmLPYTGAAmQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96638134"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Dec 2024 01:58:26 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLfxf-0007hH-1a;
	Thu, 12 Dec 2024 09:58:23 +0000
Date: Thu, 12 Dec 2024 17:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test_c.c:1405 kasan_stack_oob() error: buffer
 overflow 'array' 10 <= 26
Message-ID: <202412121704.G4JFHJrW-lkp@intel.com>
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
TO: Matthew Maurer <mmaurer@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r072-20241210 (https://download.01.org/0day-ci/archive/20241212/202412121704.G4JFHJrW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412121704.G4JFHJrW-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:1405 kasan_stack_oob() error: buffer overflow 'array' 10 <= 26

vim +/array +1405 mm/kasan/kasan_test_c.c

e5f4728767d2ec9 lib/test_kasan.c Marco Elver         2022-01-14  1399  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso    2020-10-13  1400  static void kasan_stack_oob(struct kunit *test)
eae08dcab80c695 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1401  {
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso    2020-10-13  1402  	char stack_array[10];
2dfd1bd992322f7 lib/test_kasan.c Peter Collingbourne 2022-03-24  1403  	/* See comment in kasan_global_oob_right. */
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1404  	char *volatile array = stack_array;
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14 @1405  	char *p = &array[ARRAY_SIZE(stack_array) + OOB_TAG_OFF];
eae08dcab80c695 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1406  
da17e377723f50c lib/test_kasan.c Andrey Konovalov    2021-02-24  1407  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_STACK);
eae08dcab80c695 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1408  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso    2020-10-13  1409  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
eae08dcab80c695 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1410  }
eae08dcab80c695 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1411  

:::::: The code at line 1405 was first introduced by commit
:::::: f649dc0e0d7b509c75570ee403723660f5b72ec7 kasan: fix unit tests with CONFIG_UBSAN_LOCAL_BOUNDS enabled

:::::: TO: Peter Collingbourne <pcc@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
