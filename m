Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222D3220F4B
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748600047; cv=none; b=AkZ0itaZUeifdltgJqH7o9ooMeyDU8XYUybbUT+9NcZGdw9UnzY+h1nUqLoTtomHTDFKsl4e56l46UjReMNcCznOM1tHwyGOlk6y8gV0csWcDs/gXWYOCxyOYaoLNCxAkoLrm803IjSD8BlC3rNf98c5Gjt3WUrrviE0ND39I0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748600047; c=relaxed/simple;
	bh=C/ASzgrxb3Rro0kKrFzl5NMPIC6WvpIVYkfYg5EfcWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CawuNeL8AbFnN+FXkkoZoHukOdvefqnLtQ/Hpn57qWN/jNlkhozV2cZTtA1JV3/EEL9UafjAkr9XmuXAzimi4CFTN4RLPywIIPA3GO8bJB9JNvbQISJ8IbyLCZaSxRD5j25eTN/mpAecDaa12XnQ9Fv7RPFW0bwQabcttDH8A6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXbuobGt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXbuobGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748600045; x=1780136045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/ASzgrxb3Rro0kKrFzl5NMPIC6WvpIVYkfYg5EfcWI=;
  b=GXbuobGtOzjYVGP6oDBWFkuSFkvd1iUc8YHBIsPyc0FCZnSCJw9royad
   Nd+rcgKWRtZb8Wyz5oTLde/sew8sGyxhM4KttmhdNqAUsmig5LJ0KuVHg
   dHB9mYrB/gDVJjGpuDL0qEoFSackKdbb378AUFg+a7RiXwIcYSkQHQcWG
   eK/gckbJWOLuO6Wx3BJ1VcHpKtlPdj4LsYI2VsQKCvDBgftQgTW68y1Hj
   g7FbsjNiLMCO4Y4sVQzgfM/kVER+4ClZJMx+izA9N2GqbyQEZg0bfhGEk
   UZhx/tY1WKGwrR/7f9XckvjPFl/UsmNWo+/nY9hkKX449A6c8ftNJMIh/
   Q==;
X-CSE-ConnectionGUID: 9rMtChS6SFSetVeSpbZZdw==
X-CSE-MsgGUID: jGggJ6jnScmJqkPDzi6BeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50739519"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50739519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 03:14:05 -0700
X-CSE-ConnectionGUID: 3teRkCGFTvmIfEPk+HP4Ug==
X-CSE-MsgGUID: yXSe9tHjRaqWsJEwryW2cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="144474282"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2025 03:14:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKwkT-000XXQ-12;
	Fri, 30 May 2025 10:14:01 +0000
Date: Fri, 30 May 2025 18:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kfence/kfence_test.c:397 test_use_after_free_read_nofault() warn:
 passing freed memory 'addr' (line 395)
Message-ID: <202505301817.Lr7TLcj4-lkp@intel.com>
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
TO: Nirjhar Roy <nirjhar@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66bc387efbee59978e076ce9bf123ac353b389c
commit: 811808d365398680b628d2b88aafeba77c88691a mm/kfence: add a new kunit test test_use_after_free_read_nofault()
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: parisc-randconfig-r071-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301817.Lr7TLcj4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505301817.Lr7TLcj4-lkp@intel.com/

smatch warnings:
mm/kfence/kfence_test.c:397 test_use_after_free_read_nofault() warn: passing freed memory 'addr' (line 395)

vim +/addr +397 mm/kfence/kfence_test.c

bc8fbc5f305aecf Marco Elver 2021-02-25  385  
811808d36539868 Nirjhar Roy 2024-10-18  386  static void test_use_after_free_read_nofault(struct kunit *test)
811808d36539868 Nirjhar Roy 2024-10-18  387  {
811808d36539868 Nirjhar Roy 2024-10-18  388  	const size_t size = 32;
811808d36539868 Nirjhar Roy 2024-10-18  389  	char *addr;
811808d36539868 Nirjhar Roy 2024-10-18  390  	char dst;
811808d36539868 Nirjhar Roy 2024-10-18  391  	int ret;
811808d36539868 Nirjhar Roy 2024-10-18  392  
811808d36539868 Nirjhar Roy 2024-10-18  393  	setup_test_cache(test, size, 0, NULL);
811808d36539868 Nirjhar Roy 2024-10-18  394  	addr = test_alloc(test, size, GFP_KERNEL, ALLOCATE_ANY);
811808d36539868 Nirjhar Roy 2024-10-18 @395  	test_free(addr);
811808d36539868 Nirjhar Roy 2024-10-18  396  	/* Use after free with *_nofault() */
811808d36539868 Nirjhar Roy 2024-10-18 @397  	ret = copy_from_kernel_nofault(&dst, addr, 1);
811808d36539868 Nirjhar Roy 2024-10-18  398  	KUNIT_EXPECT_EQ(test, ret, -EFAULT);
811808d36539868 Nirjhar Roy 2024-10-18  399  	KUNIT_EXPECT_FALSE(test, report_available());
811808d36539868 Nirjhar Roy 2024-10-18  400  }
811808d36539868 Nirjhar Roy 2024-10-18  401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
