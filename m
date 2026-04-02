Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1706E34A795
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157867; cv=none; b=hwPiqb+enYlPDgoVkasn7BLA0HiRRKOBHU4tK5yJYJP/ZwTXB5yJzNUY52IqxTq9kY3CBp3bIIfgRtPT/C2Hk1lZsaG557sHINayU07yRexQ+coohM2QRB9Wq8M8pP84kykGc57zzNz1gJvyTBPWmSCASLBIXzZx72KBW1K7cvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157867; c=relaxed/simple;
	bh=o21Yt1YPWE07abiRdbqLz9y2mDdRK3LaoU59QPFulI0=;
	h=Date:From:To:Subject:Message-ID; b=leWWbGba0mqVjt4U+HdsUDdiOgLqN/hiubhCNO5KVmevF/0LIdfoSEgtsmGl796J/7FaKfJqU+PVmZ8pqBVN7Ns+qQNDs2UBCgONp+ofempj3JGvcysXHXr6q6pDRgqNXR+KdNLPO9tnfx2Z5q2WX71e9iMbYTWR2dzt3mel6ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClUoBi/x; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClUoBi/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775157867; x=1806693867;
  h=date:from:to:subject:message-id;
  bh=o21Yt1YPWE07abiRdbqLz9y2mDdRK3LaoU59QPFulI0=;
  b=ClUoBi/xtb6tGanP3VTCOP+RLC0siuuRKmOIDmeIZKOp6+3tfoitJkmg
   u05N00ncAPt+zylFhgPlQohDCjKY8cUNiE5xBed3POAT0ZG5XP+m50+Wq
   SGk3GexcjkxuwTGSsgjZN2HRJnw9c0AZ+5lxiDLKes/RwDqC/DZSVfpY4
   BG+2IqoioKzxZRxH9GRRPcpwez/jENl4jVejk8I5bQiLar4oKQYJU4fo3
   6ykd4ieVoIbaGOMwWCzZH9qP3aCZq8A2FMLHnu0e1rYIsLnBs8+EEYeag
   u5/i5OKh/zyvHoxLceQ5Hx01q+XAWZ71i2XfignedA8oSuCWdEZqIFSNO
   g==;
X-CSE-ConnectionGUID: 4O8uTElfRy+SRJXXNDeUVA==
X-CSE-MsgGUID: vq9FrjNHTdCRae/2xlGo3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76193045"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="76193045"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 12:24:26 -0700
X-CSE-ConnectionGUID: wcZZKRpgSoSmcb2a1PrCog==
X-CSE-MsgGUID: vGEyQZKJTx+u4SYPKqPORw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="222708269"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Apr 2026 12:24:24 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8NeP-0000000097J-3NC2
	for oe-kbuild@lists.linux.dev;
	Thu, 02 Apr 2026 19:24:21 +0000
Date: Thu, 02 Apr 2026 21:23:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_arm64 44/53] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202604022120.t8xEJdEW-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt_arm64
head:   386de42c67a6d6b567ec9167593768eec79b8ce5
commit: b56a2ad56d8abc7987e03783a918a6d1edb4b417 [44/53] iommupt: Add a kunit to test the iotlb invalidation flow
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260402/202604022120.t8xEJdEW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#32: 
struct iommu_iotlb_gather into HW operations executed on the the xarray

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
