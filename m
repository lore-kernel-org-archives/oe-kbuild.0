Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F3721772A
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 01:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768612700; cv=none; b=o3lynI3fEX4XyaIQ6g5EBXmBt7C6E/3J0NVfUtQ6hM6TZVASzQV/3u7OxTG0Z3AK+lwzb5szktkGlDQWK4rlUYOzsOZxBV8hvRMGyu78idMxhKrKrp/22ohKTCVmu1f25ehzj3ZpxCkEEu6NRJReWRxmrW8+sW2+HEQJRW46UG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768612700; c=relaxed/simple;
	bh=Cc+v29KFKK3XIX2LpIi4BlKS4jFusxGelxbFSNVvPAM=;
	h=Date:From:To:Subject:Message-ID; b=kiHterTK4jg249iRYN5lbBVJ8/III59ALjIJOMdxKDuNobzfofbi/+2dsmu1vASyQOWnqtuy1EIuSEYViDfBXTWb2WeNp81QSvtfhwKfMqTtQnpr54n4m/Y4jKS1lbniVBvO+wNoOjZcbRNsa3YjTZG/pGxjMajJapjzi16iDIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRqkOpka; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRqkOpka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768612700; x=1800148700;
  h=date:from:to:subject:message-id;
  bh=Cc+v29KFKK3XIX2LpIi4BlKS4jFusxGelxbFSNVvPAM=;
  b=XRqkOpkarmM7sIuTxx7EgfrgMWziwLeLTwxMkM+WLNwraPGUgpSO0shx
   jGAy1oGf15SjXREz6N5JQFOHWhTXNwEQmIFymWkI2646L/Q0ypT2zur3Q
   nmNG4201xKVpi+YGtrBw1fKzXjLV+JgOOeD1xW8lvWowqJv/AX++UzguS
   W9EVLUuf0Hc6IJx5uBQLZ5t1BDQG84jRwjk+PotllZOTDs7hOAkIqsacL
   Y7ZuYy46QPCg4H8nDB6stqSEPH8NbnWiU0nhfzjgXDM1mzrLpe/yQ6m0e
   xZpMG9TrMwdsIZwe2wVA2xj6bIK2WbZzbPA54QFBcyN3tKbGSHf6nuXBm
   Q==;
X-CSE-ConnectionGUID: tDKgrtwsSBm877413/kPPg==
X-CSE-MsgGUID: 9Pwiw6oUS6aeHDwV+o6Ohw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="70095751"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="70095751"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 17:18:19 -0800
X-CSE-ConnectionGUID: z2NzRbIRQgWyKryLdo2vIw==
X-CSE-MsgGUID: k0kDRyeLRnGY/3VPwCC6nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205802538"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2026 17:18:18 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vguxE-000000001st-1Prb
	for oe-kbuild@lists.linux.dev;
	Sat, 17 Jan 2026 01:18:16 +0000
Date: Sat, 17 Jan 2026 02:17:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bennolossin:pin-init/sync 6/17] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'at'
Message-ID: <202601170204.AWHz1H28-lkp@intel.com>
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
TO: Benno Lossin <lossin@kernel.org>

tree:   https://github.com/bennolossin/linux pin-init/sync
head:   3026d6d1abe4c5c256bab3f23b6957b28b85120c
commit: b8df725a61b4663c3e911aa600e2368ebb40d993 [6/17] rust: pin-init: internal: add utility API for syn error handling
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260117/202601170204.AWHz1H28-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'at'
#10: 
by returning `Err(ErrorGuaranteed)`) and non-fatal ones at at generation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
