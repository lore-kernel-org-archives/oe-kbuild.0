Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10AE31C592
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Sep 2025 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419137; cv=none; b=DigZllI45U9t4konK9082Pn+LGCk5t/W17szkGqZrX9gcF1VzG1ToVYexxE47vIllS7LH5pUhE8VvVhqOZl8nz6T5K8Ix/NSBhzx+mx93LEgkG7r1y7ci4xYxkSE1cCJRpwaGmPsjAWNVh2w/BMs1LBxvjBQjh2UBizMNJZSLeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419137; c=relaxed/simple;
	bh=aCoLyRTELY+e2+BRgdw8PBTDEaGb1adLo+bwYgStoH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ucd5O9tNkZJPKapP3GpMVdgy2AiBkVHCb/rvgBUvVJZxO0fscVnxAo2z0E6jFlzLXQvi86ODG38jTGC+b5VF4J7MIyooq6N9IkDzQpzbr3X2NnGlDe8lyryzRdvMnws2GXFmyupfCNZEdLQnyBCnMV6HsabWKGckznBrh2tokiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyAEaGo3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyAEaGo3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757419136; x=1788955136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aCoLyRTELY+e2+BRgdw8PBTDEaGb1adLo+bwYgStoH4=;
  b=CyAEaGo3tmm2zTBv9aS/Uay2gcoc2i07NE586RVIxvv0lJJ57UCPAXnN
   pcLdw9TaoPSbImENo8zzY+Wq+xOAneo/nXpKiOm0/buB+L457du5Mjg1C
   sH9BigKVgAf26iKUEW8sW74FX6LdvptTYw3htqNRiJU7xq1162qzwX0Tc
   IWVVdVj9wpEjeEIsZXK7BITfDZvcA1U9vhgdQrHITPv+MD6FN9yjhh2xu
   K7xN3WX+AtJDIVzsLECuFYLL5Q//HEsZiSOL6POcgdO0Qhwm8LI8HHzKU
   OjCvHmNcVkNafLDIPQQDVl6FS/kKpZAV5AqlX51Z2ka5LvxDeqQfhSYNN
   Q==;
X-CSE-ConnectionGUID: Xb2JBuRzSYaTRUTOCuefHA==
X-CSE-MsgGUID: yCfgiMMpTRabFePX532OFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59394757"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59394757"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 04:58:55 -0700
X-CSE-ConnectionGUID: MNv3XSQRT7u9Nv2k/0qWug==
X-CSE-MsgGUID: isbvABM+QRq0Nb9wNAD0qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="196737622"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Sep 2025 04:58:54 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvwzr-0004ot-3C;
	Tue, 09 Sep 2025 11:58:51 +0000
Date: Tue, 9 Sep 2025 19:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/kasan/kasan_test_c.c:1489:27: sparse: sparse: Variable length
 array is used.
Message-ID: <202509091933.7TyimpII-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f777d1112ee597d7f7dd3ca232220873a34ad0c8
commit: 5e88c48cb4bcbd0ea683373a106268933bb4edd2 kbuild: Switch from -Wvla to -Wvla-larger-than=1
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-121-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091933.7TyimpII-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091933.7TyimpII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509091933.7TyimpII-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test_c.c:1489:27: sparse: sparse: Variable length array is used.
   mm/kasan/kasan_test_c.c:1504:27: sparse: sparse: Variable length array is used.

vim +1489 mm/kasan/kasan_test_c.c

eae08dcab80c69 lib/test_kasan.c Andrey Ryabinin     2016-05-20  1485  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1486  static void kasan_alloca_oob_left(struct kunit *test)
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1487  {
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1488  	volatile int i = 10;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06 @1489  	char alloca_array[i];
2dfd1bd992322f lib/test_kasan.c Peter Collingbourne 2022-03-24  1490  	/* See comment in kasan_global_oob_right. */
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1491  	char *volatile array = alloca_array;
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1492  	char *p = array - 1;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1493  
58b999d7a22c59 lib/test_kasan.c Andrey Konovalov    2020-11-01  1494  	/* Only generic mode instruments dynamic allocas. */
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1495  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1496  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_STACK);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1497  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1498  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1499  }
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1500  

:::::: The code at line 1489 was first introduced by commit
:::::: 00a14294bb33af533f7ac002fb20623fdd8ea0d7 kasan: add tests for alloca poisoning

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
