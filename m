Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AEB12B6C
	for <oe-kbuild@lists.linux.dev>; Sun,  5 May 2024 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714907223; cv=none; b=gIwBveb+gG4IYEht3lk7b6ms54nxH7vwYv6s1ixUKbzu/CgwlyeagINZrytZK0muL1o/3ZXgi/qJi66hQMsFKiGOnuBWkmv7aR6c5rUYblFDHHv8OzkWXCJAbcgQQqMctapwd8Ijex2/0MzGwQwkFJLTXPdY0wx5SkcStdC7FIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714907223; c=relaxed/simple;
	bh=DKICEsnV19Sr+e/Vj8UcRWouREKTy9b66kXaORgUxLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HUOY+SiJgCWl4hbe/TphvQU7ELnQRstk5lCvAekkoOFiOawR5iH2ta4LSqo8XopSldGYPkGk487k1/KYPVvxZ+wufH6x2/0eIVm3Hggsdmc/4MqAitwvqsUy/wvQ6+uQZx9BvIIuPTcZ06zrqKy/S/SDe0cw2OaW1KqozW7t7+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1FXXXV0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1FXXXV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714907221; x=1746443221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DKICEsnV19Sr+e/Vj8UcRWouREKTy9b66kXaORgUxLs=;
  b=d1FXXXV0pQqzBBr5CgAV4MP2sIT2e3i/0w3/oMmLdvqLUOyD5vz4mZGs
   BS1rHsjFTb63UF+1KimA45n9PRU/OqRO3QPkvihecWlqZmB30S9tXJThF
   XID1A9l1pVM+R6arQEAqO8uokOMNhTh/isrHEW8OGo67MvahPqqc926WT
   3kk6owiE97YP7uOA+2+OI07/5LISN6FbL51nT9BA72fA5YWOoiYJPPPxw
   Al2ac0ZtPbgqMV0c2jTTPLWucZqAvteqI+DG5qnzW3G+Rc3X0RLe11bSA
   bOxwv/cRpEvUBzLOHirugq0oPWP90zY6T4z55mcuRwtl2BAfFYVHCoTZc
   g==;
X-CSE-ConnectionGUID: Spe25Qq6QiyeXesX5Ms1cg==
X-CSE-MsgGUID: O/zggd1jQyCgSok/A2NNmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14447203"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="14447203"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 04:06:57 -0700
X-CSE-ConnectionGUID: fELEtKfCQnWf4VNhwje8CA==
X-CSE-MsgGUID: 2WdGXVpdTjmUDAhS0+F4Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="27960817"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 May 2024 04:06:56 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3Zhl-00009I-18;
	Sun, 05 May 2024 11:06:53 +0000
Date: Sun, 5 May 2024 19:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_guc_ads.c:103:21-27: WARNING use
 flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202405051824.AmjAI5Pg-lkp@intel.com>
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
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7367539ad4b0f8f9b396baf02110962333719a48
commit: 237412e45390805e14a6936fb998d756c4eac9d8 drm/xe: Enable 32bits build
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-054-20240505 (https://download.01.org/0day-ci/archive/20240505/202405051824.AmjAI5Pg-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405051824.AmjAI5Pg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_guc_ads.c:103:21-27: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +103 drivers/gpu/drm/xe/xe_guc_ads.c

dd08ebf6c3525a Matthew Brost 2023-03-30   53  
dd08ebf6c3525a Matthew Brost 2023-03-30   54  /*
dd08ebf6c3525a Matthew Brost 2023-03-30   55   * The Additional Data Struct (ADS) has pointers for different buffers used by
dd08ebf6c3525a Matthew Brost 2023-03-30   56   * the GuC. One single gem object contains the ADS struct itself (guc_ads) and
dd08ebf6c3525a Matthew Brost 2023-03-30   57   * all the extra buffers indirectly linked via the ADS struct's entries.
dd08ebf6c3525a Matthew Brost 2023-03-30   58   *
dd08ebf6c3525a Matthew Brost 2023-03-30   59   * Layout of the ADS blob allocated for the GuC:
dd08ebf6c3525a Matthew Brost 2023-03-30   60   *
dd08ebf6c3525a Matthew Brost 2023-03-30   61   *      +---------------------------------------+ <== base
dd08ebf6c3525a Matthew Brost 2023-03-30   62   *      | guc_ads                               |
dd08ebf6c3525a Matthew Brost 2023-03-30   63   *      +---------------------------------------+
dd08ebf6c3525a Matthew Brost 2023-03-30   64   *      | guc_policies                          |
dd08ebf6c3525a Matthew Brost 2023-03-30   65   *      +---------------------------------------+
dd08ebf6c3525a Matthew Brost 2023-03-30   66   *      | guc_gt_system_info                    |
dd08ebf6c3525a Matthew Brost 2023-03-30   67   *      +---------------------------------------+
dd08ebf6c3525a Matthew Brost 2023-03-30   68   *      | guc_engine_usage                      |
dd08ebf6c3525a Matthew Brost 2023-03-30   69   *      +---------------------------------------+
dd08ebf6c3525a Matthew Brost 2023-03-30   70   *      | guc_um_init_params                    |
dd08ebf6c3525a Matthew Brost 2023-03-30   71   *      +---------------------------------------+ <== static
dd08ebf6c3525a Matthew Brost 2023-03-30   72   *      | guc_mmio_reg[countA] (engine 0.0)     |
dd08ebf6c3525a Matthew Brost 2023-03-30   73   *      | guc_mmio_reg[countB] (engine 0.1)     |
dd08ebf6c3525a Matthew Brost 2023-03-30   74   *      | guc_mmio_reg[countC] (engine 1.0)     |
dd08ebf6c3525a Matthew Brost 2023-03-30   75   *      |   ...                                 |
dd08ebf6c3525a Matthew Brost 2023-03-30   76   *      +---------------------------------------+ <== dynamic
dd08ebf6c3525a Matthew Brost 2023-03-30   77   *      | padding                               |
dd08ebf6c3525a Matthew Brost 2023-03-30   78   *      +---------------------------------------+ <== 4K aligned
dd08ebf6c3525a Matthew Brost 2023-03-30   79   *      | golden contexts                       |
dd08ebf6c3525a Matthew Brost 2023-03-30   80   *      +---------------------------------------+
dd08ebf6c3525a Matthew Brost 2023-03-30   81   *      | padding                               |
dd08ebf6c3525a Matthew Brost 2023-03-30   82   *      +---------------------------------------+ <== 4K aligned
dd08ebf6c3525a Matthew Brost 2023-03-30   83   *      | capture lists                         |
dd08ebf6c3525a Matthew Brost 2023-03-30   84   *      +---------------------------------------+
dd08ebf6c3525a Matthew Brost 2023-03-30   85   *      | padding                               |
dd08ebf6c3525a Matthew Brost 2023-03-30   86   *      +---------------------------------------+ <== 4K aligned
dd08ebf6c3525a Matthew Brost 2023-03-30   87   *      | UM queues                             |
dd08ebf6c3525a Matthew Brost 2023-03-30   88   *      +---------------------------------------+
dd08ebf6c3525a Matthew Brost 2023-03-30   89   *      | padding                               |
dd08ebf6c3525a Matthew Brost 2023-03-30   90   *      +---------------------------------------+ <== 4K aligned
dd08ebf6c3525a Matthew Brost 2023-03-30   91   *      | private data                          |
dd08ebf6c3525a Matthew Brost 2023-03-30   92   *      +---------------------------------------+
dd08ebf6c3525a Matthew Brost 2023-03-30   93   *      | padding                               |
dd08ebf6c3525a Matthew Brost 2023-03-30   94   *      +---------------------------------------+ <== 4K aligned
dd08ebf6c3525a Matthew Brost 2023-03-30   95   */
dd08ebf6c3525a Matthew Brost 2023-03-30   96  struct __guc_ads_blob {
dd08ebf6c3525a Matthew Brost 2023-03-30   97  	struct guc_ads ads;
dd08ebf6c3525a Matthew Brost 2023-03-30   98  	struct guc_policies policies;
dd08ebf6c3525a Matthew Brost 2023-03-30   99  	struct guc_gt_system_info system_info;
dd08ebf6c3525a Matthew Brost 2023-03-30  100  	struct guc_engine_usage engine_usage;
dd08ebf6c3525a Matthew Brost 2023-03-30  101  	struct guc_um_init_params um_init_params;
dd08ebf6c3525a Matthew Brost 2023-03-30  102  	/* From here on, location is dynamic! Refer to above diagram. */
dd08ebf6c3525a Matthew Brost 2023-03-30 @103  	struct guc_mmio_reg regset[0];
dd08ebf6c3525a Matthew Brost 2023-03-30  104  } __packed;
dd08ebf6c3525a Matthew Brost 2023-03-30  105  

:::::: The code at line 103 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
