Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19128CF5D
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 07:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806560; cv=none; b=gXoa+KNmmEe417S2Gx24ECZ0q34Kt6n/djHJ4CIe/MDktZ2tu8kHhJHHTCGbEXyYkONo1ldK32lTHlleohqtIoKA5YMkqDtfOYkAay80VdWqZfzRFtXHoRO/6q8oprV4dzWCkGMer+eA+GV2ENhwyR2AY1cHjACVZvzrYbIIKnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806560; c=relaxed/simple;
	bh=TyCMD+TA5pQBABbT4e87FbjIQg2bLhhEW7U5wTPtupA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f42819THObsHv9X0u/Vq0w1fO6ro1Ky6zVUT1RhE0OoTMpMFdnlxNXBWYPOk/QwqtVbF5AeIqre2DHhl9DqFdGOgihU+FYuJpohK0b3c7H75HwKM10PbED21JtsZNNhA2VQbxGyADLGNopBbP+ZCKkn3wgk1H7lNR6/P0geKr+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkMfO76u; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkMfO76u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768806559; x=1800342559;
  h=date:from:to:cc:subject:message-id;
  bh=TyCMD+TA5pQBABbT4e87FbjIQg2bLhhEW7U5wTPtupA=;
  b=hkMfO76uLpydclUvTQO/ASN3epq1o6MsMl9eO+0jd0sBMzHTiH8IRNsq
   eMeK1U1xnHYg9qmWQQ4MyOkShuSaY/EX0G/ExH3M5bHnu60WvEAj6wwDq
   ZzroADkB0UoiVtVlaVmKgHjs/y3gDzsTjEL1hXLTcGc1Wwkcqaadr5beU
   4V3sBofbDmwgibNr3chLIwIdQw6ykfZXRcZUaVzCagaSDI1vXOdb4Tg4x
   cFAmpCMvQn2WhuWICk47CyEgEgs6bE2C6RfsDsQXwxDDp8RrmIezBmav7
   BtjnufyR7nefjwLQ4dWxpXc+if1H+K0SG2G7s6jWio0JfPSg5noeDeIH4
   g==;
X-CSE-ConnectionGUID: /DswiD83TZSWqUBa/E8gDA==
X-CSE-MsgGUID: wSe7IK7sRpuOpPDhC4Tjnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69746230"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69746230"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 23:09:18 -0800
X-CSE-ConnectionGUID: XB3WyYURQKGKSlKVuLVZFQ==
X-CSE-MsgGUID: ZcMseaNUQPmDDjfuOA+XXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="243357941"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2026 23:09:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhjNy-00000000NYf-05SH;
	Mon, 19 Jan 2026 07:09:14 +0000
Date: Mon, 19 Jan 2026 15:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1583/6849]
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an
 expression is expected before ')'
Message-ID: <202601191549.6Xb3elm3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 4cffecaf127ae10ada4da0636f87e0170e347402 [1583/6849] drm/xe/pf: Prepare for new threshold KLVs
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: alpha-randconfig-r123-20260118 (https://download.01.org/0day-ci/archive/20260119/202601191549.6Xb3elm3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191549.6Xb3elm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601191549.6Xb3elm3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: Expected ) in expression
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568:9: sparse: sparse: undefined identifier '__VA_OPT__'
--
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
>> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: an expression is expected before ')'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: Expected ) in function call
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310:9: sparse: sparse: undefined identifier '__VA_OPT__'

vim +314 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c

a1498ab229ca16 Michal Wajdeczko 2024-08-30  313  
a1498ab229ca16 Michal Wajdeczko 2024-08-30 @314  	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
a1498ab229ca16 Michal Wajdeczko 2024-08-30  315  #undef encode_threshold_config
a1498ab229ca16 Michal Wajdeczko 2024-08-30  316  
ac6598aed1b36d Michal Wajdeczko 2024-04-15  317  	return n;
ac6598aed1b36d Michal Wajdeczko 2024-04-15  318  }
ac6598aed1b36d Michal Wajdeczko 2024-04-15  319  

:::::: The code at line 314 was first introduced by commit
:::::: a1498ab229ca16dfc35331dfb309f8e28b84bb5d drm/xe/pf: Add thresholds to the VF KLV config

:::::: TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
:::::: CC: Michal Wajdeczko <michal.wajdeczko@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
