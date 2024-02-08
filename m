Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A17D406
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Feb 2024 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400366; cv=none; b=GE5dbb4pk48QbQjc6NNev+4He0TdXKi9FOy3lhe/rjo4NzAswxDFo9u4etkEitWODWzQ7g6diXp3VLHI17t1ol+MsAwJotKB/K7R6M1QYyBGfqwD7OJWx787fY7K28y+4nq3JdQf1vLcoRnT0MkBAWvNwhBCE/6dnQPS4VPfk94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400366; c=relaxed/simple;
	bh=ehCilfrBFUyESfzcOW/TKlj4mYO/3w2Btsd5gAt4u1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7Zbb89hC3i0M20k93IJ0x5QLDsmTqc3I3qhO2rxy9cnLrubTb+OCQcqD+KKgPan7xtFC0hd4FH3rjj5jLd73m+KQP6ZKGhGeiFxjUFhSNmBCdEE1695XiJFtuvCTBfYBxU18h9nh0HFhi3BxBCPbAl56HJQQ6wqnHccAcL1q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djTB5Mwa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djTB5Mwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707400365; x=1738936365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ehCilfrBFUyESfzcOW/TKlj4mYO/3w2Btsd5gAt4u1c=;
  b=djTB5Mwa6FYVHs28R7ZQR7O+gMRe37xJmZGN4hqCe613wlBo+5X1CiWG
   Wro20J+3UsXeG9HlZmRTrdc3UbbFUiqaiBqyaOpxULRlNt9n4RNaNccaZ
   pfkMaraZNx6n2EA/gEQmmAqIMSbRtwdZH2FhY6iBYYmvv/8+X+/iuvnJT
   FzhSTzVmaKy2f1WDw22mRlMOR7tksax3wav1KpyDd4VQ/WVAVWcWYQtph
   H4hhqeKHXkmhjQ6jI/hftEQz2xoovyeYe1Pe4uCB6fgMgz+wEZNSM6Wmo
   Q7rwNQqTOAfKp2OjkTxHSnkMpza8Abq+WeJWeeoOMNKsHYXFwGSviCQg2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1106911"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1106911"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 05:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6313803"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Feb 2024 05:52:43 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY4pU-0003nC-0t;
	Thu, 08 Feb 2024 13:52:40 +0000
Date: Thu, 8 Feb 2024 21:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4175/5494] lib/test_ubsan.c:30:18: sparse:
 sparse: shift count is negative (-1)
Message-ID: <202402082159.OIfX4oDm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/test_ubsan.c:30:18: sparse: sparse: shift count is negative (-1)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b1d3a0e70c3881d2f8cf6692ccf7c2a4fb2d030d
commit: 30edbdf9b98ddc9087f5f8b9a9644fa5c05fa5b1 [4175/5494] ubsan: Silence W=1 warnings in self-test
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r113-20240208 (https://download.01.org/0day-ci/archive/20240208/202402082159.OIfX4oDm-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240208/202402082159.OIfX4oDm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402082159.OIfX4oDm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_ubsan.c:30:18: sparse: sparse: shift count is negative (-1)

vim +30 lib/test_ubsan.c

854686f4edf483 Jinbum Park 2018-04-10  22  
854686f4edf483 Jinbum Park 2018-04-10  23  static void test_ubsan_shift_out_of_bounds(void)
854686f4edf483 Jinbum Park 2018-04-10  24  {
4a26f49b7b3dbe Kees Cook   2020-12-15  25  	volatile int neg = -1, wrap = 4;
30edbdf9b98ddc Kees Cook   2024-01-30  26  	volatile int val1 = 10;
30edbdf9b98ddc Kees Cook   2024-01-30  27  	volatile int val2 = INT_MAX;
4a26f49b7b3dbe Kees Cook   2020-12-15  28  
4a26f49b7b3dbe Kees Cook   2020-12-15  29  	UBSAN_TEST(CONFIG_UBSAN_SHIFT, "negative exponent");
4a26f49b7b3dbe Kees Cook   2020-12-15 @30  	val1 <<= neg;
854686f4edf483 Jinbum Park 2018-04-10  31  
4a26f49b7b3dbe Kees Cook   2020-12-15  32  	UBSAN_TEST(CONFIG_UBSAN_SHIFT, "left overflow");
4a26f49b7b3dbe Kees Cook   2020-12-15  33  	val2 <<= wrap;
854686f4edf483 Jinbum Park 2018-04-10  34  }
854686f4edf483 Jinbum Park 2018-04-10  35  

:::::: The code at line 30 was first introduced by commit
:::::: 4a26f49b7b3dbe998d9b2561f9f256a1c3fdb74a ubsan: expand tests and reporting

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
