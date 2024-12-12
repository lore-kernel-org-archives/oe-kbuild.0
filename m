Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9096F307
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734013064; cv=none; b=hNh3YmrrOKUweyOEdWbnug+USktL/6Wft0B5os3XOr8avMiCIkq26HQUHi6YjIh0OqAzm10uJzi+EXzjsm8Ea8+QkmF6J875TEZvh4uzfjaDy38+mAvCCjK8C5RZsSDDJ9Cnh0JLTRu8uUGCb07RYPmN2ILz2Y63aUR3OiYvMYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734013064; c=relaxed/simple;
	bh=7WfUs2l5AcSQPsb+lSyN6W7D9O4KPqlqqOogNQvw9EM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEWByo87cD91anwUkoIb7o+82d2B/goyUVkZznwodwwaCs+kjOoCtoZtw1/UTyVYuSLyDSUTvkyg2K9Ed2YLrFAYH1bxzuMm/+EXCjNtx0GrJfgSkZfusw+krAZez9cwrXqaNcnPPFP57lEM9XgmmlgyvmZ8DnC2Q8W/6HoZfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHw/txfy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHw/txfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734013063; x=1765549063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WfUs2l5AcSQPsb+lSyN6W7D9O4KPqlqqOogNQvw9EM=;
  b=OHw/txfyr0kvD2DVa6j/IcjMzRhusaZS9/3nWyvaeOGE5O+PeB69P5Gt
   HjIzJMcoz2yL1J2OsSZ79SxW/1pev/eiyc+Uh3P+FSXrCitYhvOFyoV0q
   8AFXgJBTTWGFju03hcsHhlcUHq4WHmbuwqX/TbE631egN0HmYlzId/t77
   gPiNcHG6TZ3QFFSxa/bIQerJN/bvqnOKj+910KxFiuv6jfd2Fx8QXIzlU
   dikwoa/plMESi2HQQfdBmoRsJoXQ51HGStZI1bJfceuQfDyDQI6FwnJL6
   EhhSzjRCsfj47sfxqL9z4SFnBEiTW9nwxehi/U1/XDrfPVo+oR5RSJDFC
   g==;
X-CSE-ConnectionGUID: YNcHQ4jCTbqxlm3CVFMAIQ==
X-CSE-MsgGUID: 4T7qeIRdTzaM+l68zN++WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34157134"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34157134"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:17:41 -0800
X-CSE-ConnectionGUID: qrJUTdDhQniGwB7X79WEuQ==
X-CSE-MsgGUID: QlxwyH9dSreDrVZKyvLpkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97034248"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2024 06:17:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLk0W-0007vG-05;
	Thu, 12 Dec 2024 14:17:36 +0000
Date: Thu, 12 Dec 2024 22:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kfence/kfence_test.c:397 test_use_after_free_read_nofault() warn:
 passing freed memory 'addr' (line 395)
Message-ID: <202412122208.LmoUHCba-lkp@intel.com>
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
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: 811808d365398680b628d2b88aafeba77c88691a mm/kfence: add a new kunit test test_use_after_free_read_nofault()
date:   4 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r072-20241210 (https://download.01.org/0day-ci/archive/20241212/202412122208.LmoUHCba-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412122208.LmoUHCba-lkp@intel.com/

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
