Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7868318ED2
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 11:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770724095; cv=none; b=lX/fqnVk6KwamDQBfX8iQ/O87bTXH/Yeo052vAEVB3ZAIHAADHyI2m54OZaFHNAJBTfFM5ssjNM3l9nbnpPJ8cyOrrCJ6EeVAD4SyVc5U9qqBmoizmdfKqpcIPMB3KldatHk4ZOQbAdICHJ7+fIyocVauBLfdIkYkAHTar9zOfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770724095; c=relaxed/simple;
	bh=1MuzycqKFn+sB90t6dQ9dkOCsmTEYLxcEqu6ovCBcG8=;
	h=Date:From:To:Subject:Message-ID; b=JtXnEqU2pQNJ5PJemL0Ucd9zX12PNNjQhxuyLo72exVMvyp6gzxry9K44PT4UkHORfFsNEOpdxVJe2vWhubK8xrqKRfjiaePEzuqUfQ/IhU/2Agnqqh212DdEiEp9S1e54T7TeKHbobIGBKNRPS6tfbm2R8zqQwm+X7xpBisDjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVYNnT/W; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVYNnT/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770724094; x=1802260094;
  h=date:from:to:subject:message-id;
  bh=1MuzycqKFn+sB90t6dQ9dkOCsmTEYLxcEqu6ovCBcG8=;
  b=MVYNnT/WCdWTKA5aIPTvqA1/2yI9e/ktlW4zM5BbWvz66ofRvGy3EKFd
   oUoa7fJxQoWUea/vpIqLkTIdv8blwdH4apbb/pYlB/4AAz2eWcx96mnAk
   SslLoQsfpdIn5oB9X7RHPjEt1t6IM+O8TWF2Km2o0KeriKGK0z5U5SHDs
   h5wL0HX+brb6/301H6LNf5KfSPmrxGSa6cz1YJcjpM7gdd+MTNo4UtLM2
   M+t/qSxETGGlXMk4dfnB4D4zd3ILqav7UlWa+57Ips/NXFxv4ztNURuEZ
   ZAO9qoy6c8CFcHiqDqNaNFz3QwKm/8Hhh1D+7ApJkxjWZ17bj/D1Q/bSd
   A==;
X-CSE-ConnectionGUID: qahOwGhhQ5q6x57HG2pqfA==
X-CSE-MsgGUID: JeVlZ6J5S+KMJ+Av3uVehg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89263494"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89263494"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 03:48:14 -0800
X-CSE-ConnectionGUID: 60fXfhk9TKSLwdpugvFPGQ==
X-CSE-MsgGUID: ONUusZnFQXaag6eJvHPGxQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Feb 2026 03:48:13 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpmDz-000000000nZ-2yT1
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 11:48:11 +0000
Date: Tue, 10 Feb 2026 12:48:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept_alt 56/58] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602101237.953DrhRT-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept_alt
head:   f9d48449fbf9aff6cdced4703cdfdfc1d2e49efe
commit: c0217e7e37b85fc6e5e46e866e61d0f094dc3bcc [56/58] tmp
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602101237.953DrhRT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#159: FILE: arch/x86/kvm/mmu/tdp_mmu.c:637:
+	/*
+	  * Temporarily freeze the SPTE until the external PTE operation has

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
