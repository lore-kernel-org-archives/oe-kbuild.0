Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8834433A000
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622398; cv=none; b=YtkU4+jLY53eu5cyBfpRtmQoO9YDitQy129VOQNBRx3rKfHiyWQTokOvza0+nTgSVHHOv3s60ngKbzMBgpvwVErTTnvpsaPQXMrNdQfNaD+CWXAkso/kLsTvjF51ggvhHBGnLUhd5sO/5ngeN0v0qDvZ9PGsjiW9QJ5VrrsRK0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622398; c=relaxed/simple;
	bh=2UAu9TRsBK1ivgauM+vYoROpu3lhazc3gcEyUNMDRxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZPJ/lXeMvXV96f5MzFri0nk2bfMxvcxaAc6E0CjcZ0QYhRPJoWdSBfsu7uVsnAw85Ve0ccB1/wNWVv8qugi6DSVV3H3GKhqix0mUw4yRq3i1GavJ0CMJIPJhlfpsUIJXCVdOLJGPgRDQqRhS7Wa+Hi3kZ5vLRH3Zu7AfUQ4QQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdnTOOxE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdnTOOxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760622397; x=1792158397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2UAu9TRsBK1ivgauM+vYoROpu3lhazc3gcEyUNMDRxE=;
  b=NdnTOOxEVfctSnO+AuhKOcds7OmeO9FLaO9LiR3Z2F3rk6EvYJJdWP+M
   Pvq5RW1fEnTIf+bbH/2QyWccfb9OtlcMdpbVm+McZ0nQGUiqfphePmZGN
   JTDciYugQkEvtj73lLUW8FazU3PlKQVScRhEINoKbYc0zvx5fa0Jnww18
   NcTAMMx7hfz605pf0jmZZR2J/BXuW/saCIXtspd7/EcTE7+ERObAo9bW5
   dLBayxY2eTHRYo2lmVQi95jKhVN798g6u5QofvlP5VqlFrOs4AlTKx6ok
   ytdI4mp1HMtngDOfDXvvZdhMetXBwLQngdp3rFytpdsL31diWYQ/Gcb22
   A==;
X-CSE-ConnectionGUID: F3sOMy/2QfW93EHyzIDGEQ==
X-CSE-MsgGUID: 7HPwzxcJTvamwi/lRGuUGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="50380869"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="50380869"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 06:46:36 -0700
X-CSE-ConnectionGUID: 0T5gR9EcRRuGWg1HfS+4hg==
X-CSE-MsgGUID: Fq42zHm2QjKWN6t0GPkcug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182252113"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Oct 2025 06:46:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9OJM-0004rp-1O;
	Thu, 16 Oct 2025 13:46:32 +0000
Date: Thu, 16 Oct 2025 21:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/kasan/kasan_test_c.c:1489:27: sparse: sparse: Variable length
 array is used.
Message-ID: <202510162150.k1JFkLnr-lkp@intel.com>
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
head:   7ea30958b3054f5e488fa0b33c352723f7ab3a2a
commit: 5e88c48cb4bcbd0ea683373a106268933bb4edd2 kbuild: Switch from -Wvla to -Wvla-larger-than=1
date:   5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-r121-20251016 (https://download.01.org/0day-ci/archive/20251016/202510162150.k1JFkLnr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510162150.k1JFkLnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510162150.k1JFkLnr-lkp@intel.com/

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
