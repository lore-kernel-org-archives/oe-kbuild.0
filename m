Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018823655CC
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848616; cv=none; b=nMzF5QApvRef109bBZYoG0DOV1P8XcoNhI00uGKxpti7673uraeID3miYNVPPEnJsEMv8LlOTpVC9+pbcmYuY6wh9U01/b4RvZU768XPKL7m/iDhzqMDC8wBB53j5M9tTiFmSNzFYgs3X9jK/zlZJA5z5SjGa8gInchg/lV7h+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848616; c=relaxed/simple;
	bh=cjrgZK1sBiIQv+IuJANILGr1i+hPNX3FSxcV6wU3AmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IioT5SEnJ7ms7eSOE9ix9zSYw8Fll9btjTKjl9t0d0Ffe2r9K7WYFfLZ8MR9ehOom0M7Jap2fxwyGZ2Z2X4GE32wSF2BATEz34waS0Q+mfUSg92U9qnV41dy0u3eb6TYlRAGQlF+c64bJVkhllyDImZ4kX8V/Gv8lsyYInf3RDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSVl/8vA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSVl/8vA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778848615; x=1810384615;
  h=date:from:to:cc:subject:message-id;
  bh=cjrgZK1sBiIQv+IuJANILGr1i+hPNX3FSxcV6wU3AmU=;
  b=dSVl/8vAq+/TSS3YqSTbZ50kkfN1gyz9ZpTFVl+xxAjG3oSll80JRdGf
   tOUHK5SGn1Mw04lqbC3S+9pirNQ7pkjiXPx6jMy6YgqnbamKaba2A2il1
   tqRm4DsGy17ZDxSTFGFxU0B1cP8ovHlICgoe8k5mRJDNikfkvGnkztyZg
   llmPnzPdHLQQG/c0TDZ8RsQWyH3xMZFwovOvtPHuDaJYkKhwWK+JvWZY4
   TCmWfjU+1rUr1HRjwU2ABDNykuvdgWmaZKj72bkrJRg7InHbraDAiK23O
   UTrN+cRN2mCMv+8nY6dtnsCRznHE716Y0QTybSH9eWAiuvpOMhKuwhgqM
   Q==;
X-CSE-ConnectionGUID: A7cCWj9sTdCpbaEJMdgiZA==
X-CSE-MsgGUID: nSYgkdQ4STiVM5u07br4NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102475910"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="102475910"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 05:36:55 -0700
X-CSE-ConnectionGUID: N9AVbxz+TLOeNmcSEl7n4g==
X-CSE-MsgGUID: NNMfrJ79S36TNTDtYdQE0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="269034888"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 May 2026 05:36:52 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNrmO-000000001YZ-1g1Y;
	Fri, 15 May 2026 12:36:38 +0000
Date: Fri, 15 May 2026 20:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/infiniband/core/ucaps.c:59:17: error: 'return' with
 no value, in function returning non-void
Message-ID: <202605152032.UjO6hyLX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Jason-Gunthorpe/RDMA-core-Move-the-_ib_copy_validate_udata-functions-to-ib_core_uverbs/20260515-124950, commit: 3dbf7413558cdd522ca96a3ed689c4bb4bc3ee84"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/RDMA-core-Move-the-_ib_copy_validate_udata-functions-to-ib_core_uverbs/20260515-124950
head:   977f5904705ca589d536ed5c49d433817ce73366
commit: 3dbf7413558cdd522ca96a3ed689c4bb4bc3ee84 RDMA/core: Move ucaps into ib_uverbs_support.ko
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-buildonly-randconfig-005-20260515 (https://download.01.org/0day-ci/archive/20260515/202605152032.UjO6hyLX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152032.UjO6hyLX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605152032.UjO6hyLX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/core/ucaps.c: In function 'ib_cleanup_ucaps':
>> drivers/infiniband/core/ucaps.c:59:17: error: 'return' with no value, in function returning non-void [-Wreturn-mismatch]
      59 |                 return;
         |                 ^~~~~~
   drivers/infiniband/core/ucaps.c:54:12: note: declared here
      54 | static int ib_cleanup_ucaps(void)
         |            ^~~~~~~~~~~~~~~~


vim +/return +59 drivers/infiniband/core/ucaps.c

61e51682816d395 Chiara Meiohas  2025-03-06  48  
61e51682816d395 Chiara Meiohas  2025-03-06  49  /**
61e51682816d395 Chiara Meiohas  2025-03-06  50   * ib_cleanup_ucaps - cleanup all API resources and class.
61e51682816d395 Chiara Meiohas  2025-03-06  51   *
61e51682816d395 Chiara Meiohas  2025-03-06  52   * This is called once, when removing the ib_uverbs module.
61e51682816d395 Chiara Meiohas  2025-03-06  53   */
3dbf7413558cdd5 Jason Gunthorpe 2026-05-13  54  static int ib_cleanup_ucaps(void)
61e51682816d395 Chiara Meiohas  2025-03-06  55  {
61e51682816d395 Chiara Meiohas  2025-03-06  56  	mutex_lock(&ucaps_mutex);
61e51682816d395 Chiara Meiohas  2025-03-06  57  	if (!ucaps_class_is_registered) {
61e51682816d395 Chiara Meiohas  2025-03-06  58  		mutex_unlock(&ucaps_mutex);
61e51682816d395 Chiara Meiohas  2025-03-06 @59  		return;
61e51682816d395 Chiara Meiohas  2025-03-06  60  	}
61e51682816d395 Chiara Meiohas  2025-03-06  61  
61e51682816d395 Chiara Meiohas  2025-03-06  62  	for (int i = RDMA_UCAP_FIRST; i < RDMA_UCAP_MAX; i++)
61e51682816d395 Chiara Meiohas  2025-03-06  63  		WARN_ON(ucaps_list[i]);
61e51682816d395 Chiara Meiohas  2025-03-06  64  
61e51682816d395 Chiara Meiohas  2025-03-06  65  	class_unregister(&ucaps_class);
61e51682816d395 Chiara Meiohas  2025-03-06  66  	ucaps_class_is_registered = false;
61e51682816d395 Chiara Meiohas  2025-03-06  67  	unregister_chrdev_region(ucaps_base_dev, RDMA_UCAP_MAX);
61e51682816d395 Chiara Meiohas  2025-03-06  68  	mutex_unlock(&ucaps_mutex);
3dbf7413558cdd5 Jason Gunthorpe 2026-05-13  69  	return 0;
61e51682816d395 Chiara Meiohas  2025-03-06  70  }
61e51682816d395 Chiara Meiohas  2025-03-06  71  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
