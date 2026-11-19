Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074121;
	b=RkSyolYx9fTX3DFL61lp/wkghzo4bOVBDsDcR+EJlvGFMGcdv3aiPFlXng5wQV19TDn8
	 TFR1Fx6mrN0zlrckNg1u0wFb0mIoihi6+aFBpXWaLvJV1I9zf4sDj2ICvitmYOwKz/kYO
	 nu1DEWfny8Z7C96m9q/Oe/2yBkdzWSFkufZZ2Kb1Fv1GFnbF3aiJiC+h9DTjTlBw9i1QK
	 Dlf5RFTQ3g9+UPM9bbywocRwBYVwNe30Xjf0j4IFnc1OPvfw/J1txlmm1tth8pTseDcuS
	 xll0yQrsqonc88nWxNnGwgXZVwFcG4g8L5wXcqyfmjRDZ53HSLp8kG6ezLfKglarKow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074121;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NlBfcMbwfjYd+HgJfvU+dKS3/g7QXWFmndFTgYXfSt0=;
	b=JQTeVepan/yQ+3Nkgc2iAzWqnLaXPAe66x+u6PywoFReaXaVupVVMrSBLO5w5w5sYCq4
	 YAysSakRGy4TOh+jP2oZ17qqgFANDKTxXER1Rs5E2m2pa0+3IrjsvH7tTA+Ny7h4FkJaY
	 0tRnb6+Vl96n40IUs429YzmZPc1QhtoDramdhMo7VLHwHa2PlMkJSkHGGpbBQ043kqe8j
	 Rss6luEHMTYbBgIM4rwztPumZ3+c1Hfv5GBxceeOljKXp1IyIvEVbrWW2sTCk55ML+W8w
	 WEk39iZyuj8nBN7DFu9r3EtiowbHq5d59zZCzycra7Gryw6jQp7rU/6+zSTpNwXfWVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PkUkp15m;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668E606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 07:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B668E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PkUkp15m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795074121; x=1826610121;
  h=date:from:to:cc:subject:message-id;
  bh=AnEPy6SvxIb6t0eAxca16XWZUt9/NFzBtKPOhGhx8P8=;
  b=PkUkp15myFa/CL5xw2jIpnsn2TzEVOpQBPAgIyLeMMrPV3KGWrF7iynC
   8Sm3twbgAZtl1DrV2lG7lbQmtd3AyS228t5SEdx47xiObnyWAjmdb3n9C
   2Lwj1iJBQ/GK3qusmhkLZG8MOvo5c8IaNwJqGTYOEvqxzH8u6reI2URWe
   Np9hVtUf/KVipZHFl8ej1QMG2Rq+YuOdIuJlFryGuPk19ln7fIFhHoYvI
   B0NZvMnIdkhE669aB+wPj3qdsEoXMbFeIapyrevVNG7bv2hzaLlavWJDZ
   k6m0FPY8IYUdqcRLHzNunB8uxyabNIFdnnepLB41WGqzuU4bxIvyhMnW0
   A==;
X-CSE-ConnectionGUID: iYooWRi3RIGMuqNDJB+WPQ==
X-CSE-MsgGUID: bsSrGNKQSASubaOISD0bhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3832907"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3832907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:42:00 -0800
X-CSE-ConnectionGUID: JytDoXTISq6IeU0yrcnR6g==
X-CSE-MsgGUID: nplSOEgtS2WtDj27SjFjEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10357524"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 23:42:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTwmK-000000003iD-0bMU;
	Thu, 19 Nov 2026 07:41:56 +0000
Date: Thu, 19 Nov 2026 08:41:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-5.15-lts 29/29]
 drivers/ufs/core/ufs-mcq.c:293 ufshcd_mcq_poll_cqe_nolock() error: we
 previously assumed 'compl_cmd' could be null (see line 292)
Message-ID: <20261119083916.lKKo8kHM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-5.15-lts
head:   6a30f9e067712464f3f2299dc278bcb5be365a3e
commit: 8563ce58954679187f0c269a504520d8def37e41 [29/29] BACKPORT: FROMLIST: scsi: ufs: Make the polling code report which command has been completed
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 7 months ago
config: i386-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119083916.lKKo8kHM-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119083916.lKKo8kHM-lkp@intel.com/

smatch warnings:
drivers/ufs/core/ufs-mcq.c:293 ufshcd_mcq_poll_cqe_nolock() error: we previously assumed 'compl_cmd' could be null (see line 292)

vim +/compl_cmd +293 drivers/ufs/core/ufs-mcq.c

31fe4a16211a23 Asutosh Das     2023-01-13  281  
8563ce58954679 Bart Van Assche 2024-04-11  282  /* Clears *@compl_cmd if and only if *@compl_cmd has been completed. */
31fe4a16211a23 Asutosh Das     2023-01-13  283  unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
8563ce58954679 Bart Van Assche 2024-04-11  284  					 struct ufs_hw_queue *hwq,
8563ce58954679 Bart Van Assche 2024-04-11  285  					 struct scsi_cmnd **compl_cmd)
31fe4a16211a23 Asutosh Das     2023-01-13  286  {
31fe4a16211a23 Asutosh Das     2023-01-13  287  	unsigned long completed_reqs = 0;
31fe4a16211a23 Asutosh Das     2023-01-13  288  
31fe4a16211a23 Asutosh Das     2023-01-13  289  	ufshcd_mcq_update_cq_tail_slot(hwq);
31fe4a16211a23 Asutosh Das     2023-01-13  290  	while (!ufshcd_mcq_is_cq_empty(hwq)) {
8563ce58954679 Bart Van Assche 2024-04-11  291  		if (ufshcd_mcq_process_cqe(hba, hwq,
8563ce58954679 Bart Van Assche 2024-04-11 @292  					   compl_cmd ? *compl_cmd : NULL))
8563ce58954679 Bart Van Assche 2024-04-11 @293  			*compl_cmd = NULL;
31fe4a16211a23 Asutosh Das     2023-01-13  294  		ufshcd_mcq_inc_cq_head_slot(hwq);
31fe4a16211a23 Asutosh Das     2023-01-13  295  		completed_reqs++;
31fe4a16211a23 Asutosh Das     2023-01-13  296  	}
31fe4a16211a23 Asutosh Das     2023-01-13  297  
31fe4a16211a23 Asutosh Das     2023-01-13  298  	if (completed_reqs)
31fe4a16211a23 Asutosh Das     2023-01-13  299  		ufshcd_mcq_update_cq_head(hwq);
31fe4a16211a23 Asutosh Das     2023-01-13  300  
31fe4a16211a23 Asutosh Das     2023-01-13  301  	return completed_reqs;
31fe4a16211a23 Asutosh Das     2023-01-13  302  }
31fe4a16211a23 Asutosh Das     2023-01-13  303  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
