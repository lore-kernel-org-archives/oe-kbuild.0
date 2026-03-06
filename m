Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF94047ECF6
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829546; cv=none; b=iI3q72GSaEKpBkFefd/KZM5XXc34nsr/5661c4VR5ypuhCu41V92R182YCmjrbdrRzvZ5npfPfAyIAPdjQZnvD4q+K3LJ8hDSlZY8KB8bVZRlZIgGGSlcvcqN6hfQToS1jkz/jyMRjGm2pSzvAPPp9guACsmC3GPPE5XAri2Pso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829546; c=relaxed/simple;
	bh=2TyKxH+O+mmcLae7ZZfQc2bpJ5wOnpwXew5jJeFTl3s=;
	h=Date:From:To:Subject:Message-ID; b=TCguo0hYlwDs1KIhrr+/LTqA7OrvrbgQv5urOGMsJ8E4weFYUmTLxO3crKLR85hvIimQxvJ+lTwVQMHjjH6ljmO0FrFwD33l50PDmooqZVGsRQYnALqH2L9Vgjd1prsaW9rLqmPw5l2dbYW33cMGC6PtpbpqoYmnufaQVfaEBuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEEarHfx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEEarHfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772829546; x=1804365546;
  h=date:from:to:subject:message-id;
  bh=2TyKxH+O+mmcLae7ZZfQc2bpJ5wOnpwXew5jJeFTl3s=;
  b=DEEarHfxPKbbQxCeZjhl7Vfip4/qpJsXrsKTv6xFson30yqaX/8R6RLQ
   Ynp10PA8B7jU7o7VSBPyMwWo/WD1xwq+qo8TxP6NSUGnNJliYzTEQvhbl
   ytLjyoq1nlU1zMWKE2lMmkDhflKm/QS72S+Xt/iwO5uQi/6SfJYTvbFYF
   cYiaJB+nfolMGdaGOqHictHSrA0s3RdrAzFvMySC8ZgqgNvZGrtfHLdfi
   hI4LXTP9XKwHaD/qYQGGYz8llqvyul7LHuU9f6NwHFbXExi1jkLuIeWZw
   3OrqZTPPxhdYi4koCYeS0z0QeZ1kgCP+3gQYOCyDcz4TEUsUlm99VMpoZ
   Q==;
X-CSE-ConnectionGUID: 2NUnLs4mQFiS7LeWg59TjA==
X-CSE-MsgGUID: BtiXY55/RJ2eZqYzJ43aIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84578734"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84578734"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:39:03 -0800
X-CSE-ConnectionGUID: NbLIWSBFSGemUd0irAlbJw==
X-CSE-MsgGUID: SckaCPffTQiM+MqCbRqriQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223233739"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2026 12:39:01 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybwp-000000002LO-1gEd
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 20:38:59 +0000
Date: Fri, 06 Mar 2026 21:38:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260306-1425 15/31]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'data'
Message-ID: <202603062125.p5y6YxZG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260306-1425
head:   8e85a7c6fd859479abc528a78dec59382ef82d3d
commit: bd9f6a5918ce0bfbd26d80ae05792dbd1c463e50 [15/31] RDMA/hfi2: Add driver and interrupt infrastructure
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603062125.p5y6YxZG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'data'
#3120: FILE: drivers/infiniband/hw/hfi2/msix.c:373:
+ * @dd: valid device data data structure

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
