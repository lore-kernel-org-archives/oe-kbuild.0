Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F10275864
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766265467; cv=none; b=kTg++AjO0RwTxlg3rI5cA57dZmLJdZ8/XAcFwyQr2rtUfe1GUgrZaadMnjwVsjnYuq7oDcFKZkBh2rbA7HMecoZhmvjA7EPi5CC2x9OMUgxOHgMXYz6A0y7LLyEhH2s+mYs2gh73agJjWOJrSq5suAhvmuXzG4S9p4Kyj/cgK04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766265467; c=relaxed/simple;
	bh=Nu0WYRIuWtesS8Rh2PstBnCYBp2X3V/+AS3nD1yK/nM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L0LB0TOX8d9/31yj0TF7ZMGyDP7nNO5yhXE21sK7OzXLXm82NBZRlCW95J/DH0nD5T+8qVgl/0vJa3MBe2MLPwD4mb20p7jMie294UsUKb11JrD6icd2wbn1/oSfdr58bVtLeHGhxmJcDAW4WoXw9BZ0KYkXs0ScxXbHolMXiTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcasoTdV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcasoTdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766265465; x=1797801465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nu0WYRIuWtesS8Rh2PstBnCYBp2X3V/+AS3nD1yK/nM=;
  b=EcasoTdVFsjycKppGk/h0t7OzDF/RoK3WIAyX7dZsTHycHbAK1hBwhCG
   gmV1sjxJpkXmjw6IKZ2AlpObBrlm5+J58q+O2rs/E0eoZobyXErYO2iaG
   /Sds6BF84S/DradOYHG8yOega1NaT9DqYKUVu8Hy4+MqS33GBh39fz4NW
   L1sBa0YU7ReR3DJRmMWgwSkG89+EtsC6fEV2UYzdolqlcMyReUcn/N05q
   C6KjOodpsd5P5fDhgaCZUmgsyG/H/3BpG03RwEFfzaeOPtFPYKLDFb1YB
   NDOu4I47mufdyih54BPddJWgbE5zz2QRyGbSPOxkF4tRPSl9fV90afePP
   Q==;
X-CSE-ConnectionGUID: PrzQ8Fa7Rq+HLELcHZpQjA==
X-CSE-MsgGUID: ChAPtlxtR5GaGkncZga+SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79304521"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79304521"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 13:17:45 -0800
X-CSE-ConnectionGUID: vxL4TwlRQmquFABjgTV9GA==
X-CSE-MsgGUID: 78DNmu25RwONIM5iZbIuUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="222646935"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2025 13:17:44 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX4Kc-0000000058P-1AQo;
	Sat, 20 Dec 2025 21:17:42 +0000
Date: Sun, 21 Dec 2025 05:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.19-rc 26/106]
 drivers/mtd/mtdrw/mtd-rw.c:52:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202512210417.qdh2v6KB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mtd/mtdrw/mtd-rw.c:52:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   5ee5189ef893fbbb9311f0cdb9f2f382c4a17eb1
commit: 78e8e9bbfde8df1603de9e80d8751874cde1cfe8 [26/106] add mtd-rw driver
:::::: branch date: 28 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-r121-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210417.qdh2v6KB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210417.qdh2v6KB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210417.qdh2v6KB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/mtdrw/mtd-rw.c:52:1: sparse: sparse: bad integer constant expression
   drivers/mtd/mtdrw/mtd-rw.c:52:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/mtd/mtdrw/mtd-rw.c:53:1: sparse: sparse: bad integer constant expression
   drivers/mtd/mtdrw/mtd-rw.c:53:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/mtd/mtdrw/mtd-rw.c:129:1: sparse: sparse: bad integer constant expression
   drivers/mtd/mtdrw/mtd-rw.c:129:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/mtd/mtdrw/mtd-rw.c:130:1: sparse: sparse: bad integer constant expression
   drivers/mtd/mtdrw/mtd-rw.c:130:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mtd/mtdrw/mtd-rw.c:131:1: sparse: sparse: bad integer constant expression
   drivers/mtd/mtdrw/mtd-rw.c:131:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mtd/mtdrw/mtd-rw.c:132:1: sparse: sparse: bad integer constant expression
   drivers/mtd/mtdrw/mtd-rw.c:132:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"

vim +52 drivers/mtd/mtdrw/mtd-rw.c

78e8e9bbfde8df Frank Wunderlich 2025-07-06  50  
78e8e9bbfde8df Frank Wunderlich 2025-07-06  51  static bool i_want_a_brick = false;
78e8e9bbfde8df Frank Wunderlich 2025-07-06 @52  module_param(i_want_a_brick, bool, S_IRUGO);
78e8e9bbfde8df Frank Wunderlich 2025-07-06  53  MODULE_PARM_DESC(i_want_a_brick, "Make all partitions writeable");
78e8e9bbfde8df Frank Wunderlich 2025-07-06  54  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
