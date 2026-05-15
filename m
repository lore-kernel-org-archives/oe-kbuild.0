Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AFA38425D
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846316; cv=none; b=SFe+EkWv1mHcavZsB06w5JeKAeSLT/CJTofCjE9HQZ5mak+bwhwYRRD/0IyqrxlP5YOzRWf0ySogDVnML8rDSKOkz/n3jkyZBtImNwk97JpZfDR2BXHyG1oU5CDyT5Er1rIDqNMcrzyyrX/4ud73Iv0LCTcURFC5jRA+0spcQh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846316; c=relaxed/simple;
	bh=O42WvYYhv9ER/CYJRHFSdlrsyTQe3RNMzpCZN7r3mMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FCRTse7n/E4T/rdhZdqGSQSY0IQhKTznc8MDQIppYdE7dDE6IUhui9c7cjmCGk8Qy2fPlVCJc6WRA3ADD8U0M8i95D1oXn5A3oc9Ow10fYnJK1LNUt8GdjRiSUrGA/2DQvhHO8/WDA/pP9MN/uyZp+Aw2xawdBV0NHO0608fdfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxG33VP0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxG33VP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778846315; x=1810382315;
  h=date:from:to:cc:subject:message-id;
  bh=O42WvYYhv9ER/CYJRHFSdlrsyTQe3RNMzpCZN7r3mMY=;
  b=fxG33VP0V0q41qeraB0qHpn8Zoj7xoU6JmrH/kcC2O5F+o9S7jMKvn1S
   FSf5yJUh4Jz1abG203Rm+7f2ZdvSBYe05O5fwb+PuBmgUQPoj5tWDsrjZ
   tYsdXpslpd2VXsRlZiojKPa060PWR3xHU/oOHgxWIRfp/TM0omNodpkmy
   DikzvwCFKd11VdaaxEjwzXNbTZnOZtXMKWAzG1WxGud9rc0hJ5nQIR3PK
   lwr1tUfeuKWVOcQHVJxhqyG+7uLFyJzeG91eTlgUxTymj2Fky2gg7K77s
   oxMxGQzAh/hLZrhCizWHCZn7h46kObjPcd9mywPKjfjpF4crV8HeL5RUO
   Q==;
X-CSE-ConnectionGUID: 7YdGq+PRTyOmav334Jt0nQ==
X-CSE-MsgGUID: 4sr9wDpgRW206GxK/6sd7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90904318"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90904318"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:58:35 -0700
X-CSE-ConnectionGUID: wy9ZmhhrSTOwk4veDi5CNA==
X-CSE-MsgGUID: RzvGM+yPRxGvBQi87tzoiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="232273730"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 May 2026 04:58:33 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNrBW-000000001Uv-48jL;
	Fri, 15 May 2026 11:58:30 +0000
Date: Fri, 15 May 2026 19:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/infiniband/core/ucaps.c:59:3: warning: 'return' with
 no value, in function returning non-void
Message-ID: <202605151948.LYSpxx9A-lkp@intel.com>
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
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: powerpc-randconfig-002-20260515 (https://download.01.org/0day-ci/archive/20260515/202605151948.LYSpxx9A-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151948.LYSpxx9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605151948.LYSpxx9A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/core/ucaps.c: In function 'ib_cleanup_ucaps':
>> drivers/infiniband/core/ucaps.c:59:3: warning: 'return' with no value, in function returning non-void
      return;
      ^~~~~~
   drivers/infiniband/core/ucaps.c:54:12: note: declared here
    static int ib_cleanup_ucaps(void)
               ^~~~~~~~~~~~~~~~


vim +/return +59 drivers/infiniband/core/ucaps.c

61e51682816d39 Chiara Meiohas  2025-03-06  48  
61e51682816d39 Chiara Meiohas  2025-03-06  49  /**
61e51682816d39 Chiara Meiohas  2025-03-06  50   * ib_cleanup_ucaps - cleanup all API resources and class.
61e51682816d39 Chiara Meiohas  2025-03-06  51   *
61e51682816d39 Chiara Meiohas  2025-03-06  52   * This is called once, when removing the ib_uverbs module.
61e51682816d39 Chiara Meiohas  2025-03-06  53   */
3dbf7413558cdd Jason Gunthorpe 2026-05-13  54  static int ib_cleanup_ucaps(void)
61e51682816d39 Chiara Meiohas  2025-03-06  55  {
61e51682816d39 Chiara Meiohas  2025-03-06  56  	mutex_lock(&ucaps_mutex);
61e51682816d39 Chiara Meiohas  2025-03-06  57  	if (!ucaps_class_is_registered) {
61e51682816d39 Chiara Meiohas  2025-03-06  58  		mutex_unlock(&ucaps_mutex);
61e51682816d39 Chiara Meiohas  2025-03-06 @59  		return;
61e51682816d39 Chiara Meiohas  2025-03-06  60  	}
61e51682816d39 Chiara Meiohas  2025-03-06  61  
61e51682816d39 Chiara Meiohas  2025-03-06  62  	for (int i = RDMA_UCAP_FIRST; i < RDMA_UCAP_MAX; i++)
61e51682816d39 Chiara Meiohas  2025-03-06  63  		WARN_ON(ucaps_list[i]);
61e51682816d39 Chiara Meiohas  2025-03-06  64  
61e51682816d39 Chiara Meiohas  2025-03-06  65  	class_unregister(&ucaps_class);
61e51682816d39 Chiara Meiohas  2025-03-06  66  	ucaps_class_is_registered = false;
61e51682816d39 Chiara Meiohas  2025-03-06  67  	unregister_chrdev_region(ucaps_base_dev, RDMA_UCAP_MAX);
61e51682816d39 Chiara Meiohas  2025-03-06  68  	mutex_unlock(&ucaps_mutex);
3dbf7413558cdd Jason Gunthorpe 2026-05-13  69  	return 0;
61e51682816d39 Chiara Meiohas  2025-03-06  70  }
61e51682816d39 Chiara Meiohas  2025-03-06  71  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
