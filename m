Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7962940B
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 02:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738895210; cv=none; b=EZ8sT1PZ5KsSW5Tj2e+XGYmOl5V8f7m0Sgm21ddSVfIwDqRNBZ6x1CS/+Sl3hRTfJR22aPHlklZlwemFEZax5na+N5xa4Wkc1I3W/OoEysevhSt9aTLJTTPUSQ24IPXOyktOH2ULNyLAN9THNUQcjot/rBF/vhvRGPrtqRuWEBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738895210; c=relaxed/simple;
	bh=IxuARviAak7sjwYeUm97YidBW+BZ7P8tSl1lVut9IjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r3M2deUAx9S60PDpOVICfi8gBSu9Us1uTq9WvIu2DkRjk6rUHzOc28h4OmFxzjUF9zPhiVYE3qCgORYpElpTBPzfaDSqXoPcb2OJ1ttd+d99P7gLXkL7aYcfhWrFFoULyFV8XCPbtklrpQz84EspXBBSYkrVoz70wtHMIP+u5lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0lS2YLF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0lS2YLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738895210; x=1770431210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IxuARviAak7sjwYeUm97YidBW+BZ7P8tSl1lVut9IjM=;
  b=E0lS2YLFNuaihHXA7HY3IeOeNIPzxvnjcL375bCMCxG1pViUv7wwDQ97
   o2vMiW8HLCIyWucTn+qn1Xrfm0psV2FUoEzV/B+PZgxvgfhDNmPQ5E231
   1pWepCZuFg12sWwHVwXw3Gc14wgKQ6AEtD4Etfdho1RLJaHtLb7KMnpEf
   8fZVJJeaFtR3A6rhKEgHq6mV846JJ1gG9x2R1mryB5cvvWbDjyRT+DMtF
   HxQ9byM/6KwsL4v8/TtWakJoCrsNSWR7kzoQXIuTzctdg67VziN1Rw0WV
   HEHNZDRfHhaq0BBaRMOx0GpWr4QMySvRa3lQHNo8Nm8hKKfdTaezj5HC2
   w==;
X-CSE-ConnectionGUID: N+CYzx3rSvSYTB62ms1E6A==
X-CSE-MsgGUID: XhK18ncCTxu5IVsqQzftvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50511447"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="50511447"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 18:26:48 -0800
X-CSE-ConnectionGUID: vID8uGpRRnm5a/5136agFw==
X-CSE-MsgGUID: w4I5egg0T3yBdKtMyX1RmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111833232"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Feb 2025 18:26:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgE4q-000xed-33;
	Fri, 07 Feb 2025 02:26:44 +0000
Date: Fri, 7 Feb 2025 10:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 36/36]
 drivers/fpga/tests/fpga-bridge-test.c:89:2: warning: releasing mutex
 'ctx->bridge->mutex' that was not held
Message-ID: <202502071055.yME9ASTo-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   ce14c650535d31959070629f347cb214f6e51d3d
commit: ce14c650535d31959070629f347cb214f6e51d3d [36/36] scripts/Makefile.clang: Unconditionally enable thread-safety checking
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: hexagon-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071055.yME9ASTo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project ee3bccab34f57387bdf33853cdd5f214fef349a2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071055.yME9ASTo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502071055.yME9ASTo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fpga/tests/fpga-bridge-test.c:89:2: warning: releasing mutex 'ctx->bridge->mutex' that was not held [-Wthread-safety-analysis]
      89 |         fpga_bridge_put(ctx->bridge);
         |         ^
   1 warning generated.
--
>> drivers/fpga/tests/fpga-mgr-test.c:224:2: warning: releasing mutex 'ctx->mgr->ref_mutex' that was not held [-Wthread-safety-analysis]
     224 |         fpga_mgr_unlock(ctx->mgr);
         |         ^
   1 warning generated.


vim +89 drivers/fpga/tests/fpga-bridge-test.c

9e6823481e5f6f Marco Pagani 2023-07-18  77  
9e6823481e5f6f Marco Pagani 2023-07-18  78  static void fpga_bridge_test_get(struct kunit *test)
9e6823481e5f6f Marco Pagani 2023-07-18  79  {
9e6823481e5f6f Marco Pagani 2023-07-18  80  	struct bridge_ctx *ctx = test->priv;
9e6823481e5f6f Marco Pagani 2023-07-18  81  	struct fpga_bridge *bridge;
9e6823481e5f6f Marco Pagani 2023-07-18  82  
4d2bc3f7dea4d1 Marco Pagani 2024-03-29  83  	bridge = fpga_bridge_get(ctx->dev, NULL);
9e6823481e5f6f Marco Pagani 2023-07-18  84  	KUNIT_EXPECT_PTR_EQ(test, bridge, ctx->bridge);
9e6823481e5f6f Marco Pagani 2023-07-18  85  
4d2bc3f7dea4d1 Marco Pagani 2024-03-29  86  	bridge = fpga_bridge_get(ctx->dev, NULL);
9e6823481e5f6f Marco Pagani 2023-07-18  87  	KUNIT_EXPECT_EQ(test, PTR_ERR(bridge), -EBUSY);
9e6823481e5f6f Marco Pagani 2023-07-18  88  
9e6823481e5f6f Marco Pagani 2023-07-18 @89  	fpga_bridge_put(ctx->bridge);
9e6823481e5f6f Marco Pagani 2023-07-18  90  }
9e6823481e5f6f Marco Pagani 2023-07-18  91  

:::::: The code at line 89 was first introduced by commit
:::::: 9e6823481e5f6f2d4f4b43b6f3b00ace21b83f25 fpga: add an initial KUnit suite for the FPGA Bridge

:::::: TO: Marco Pagani <marpagan@redhat.com>
:::::: CC: Xu Yilun <yilun.xu@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
