Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D538F92A
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976248; cv=none; b=rfgN2gR6rSashc6mH5ubipzj/+XDjXm8OnZMJ+glka0Jn+SVGfGHl3sdBIQ41aivJOj9hrd3cGTA3aSEANrzoG3pvMOSN/z3ypUZil35SS/EuYikJvhfRJMvzvaa7sVHqddKMuTG6+urX/TNvCyO2F8k1GI/jsV8nzSrR6QvMlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976248; c=relaxed/simple;
	bh=qX9uL0F08NU4oniJj6c61aE79GgpGFzlKNEWcO55wpo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mz63g8diW3nDvyIPoSXYxxzfDqLJlcYaWv5ic+mgR39+CxmV8vV6o4RlONRH4zyjIYRmLSYybrP78qYtWRoT4/v4HLfbUXTkfpBnVvtL2KRNNd1W3Wtw8ypQR/zItZW1YtQK19T9zOII1DacoLs83E2DHjeJ8Ak4Q2yTXIJPYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CR6Z71Fk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CR6Z71Fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782976247; x=1814512247;
  h=date:from:to:cc:subject:message-id;
  bh=qX9uL0F08NU4oniJj6c61aE79GgpGFzlKNEWcO55wpo=;
  b=CR6Z71FkBr/Ot8/p/HZBrDyp/egyIwY/BEE7IvUXhhoTif9SOiTRnv7z
   oySQU+7mbauUijtJ+A01eeZMWctWHmdO6d2565a2p0v3L0axdiq6LJQk7
   C2EsR2n3q0py4DkjBvj6ySvTx/x1mSHH7MYOBR90MEFc1NH1vYxG42GG1
   qzlQV99beE59F9Q0QtNe7JIYBc3LKiVd6SVjoOOZG4AR7x6Kdf2GG4SRV
   zXnTLp6BRTRvyLFSDMJtnOsQEK+6p0CA2EnP4IernyuSZowrlY5IPeqOx
   tvB8JG+2rlbzhQ4a77GT9uRrMyf3ynTJt35stCDYvPHSvMyYuv74DEj3t
   w==;
X-CSE-ConnectionGUID: k3VhGUacSFe2tQTyyq9c9w==
X-CSE-MsgGUID: xQ3TDPyoS5eReDn2TzjK+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87396477"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87396477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:10:47 -0700
X-CSE-ConnectionGUID: QdCf2sFtQl2WHKfTK/WPCw==
X-CSE-MsgGUID: lmoWue7pRCihN5fyRGB6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="282859787"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2026 00:10:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfBZL-00000000AGp-06RH;
	Thu, 02 Jul 2026 07:10:43 +0000
Date: Thu, 02 Jul 2026 15:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/futex/core.c:62:16: sparse: sparse: cast truncates
 bits from constant value (123456789abcdef becomes 89abcdef)
Message-ID: <202607021439.koGQ9S5r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20260702-004403/K-Prateek-Nayak/x86-runtime-const-Introduce-runtime_const_mask_32/20260630-130124, commit: b6e8471b174f2264b132157c6a5b58fd8935e1c9"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>
CC: 0day robot <lkp@intel.com>
CC: K Prateek Nayak <kprateek.nayak@amd.com>

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260702-004403/K-Prateek-Nayak/x86-runtime-const-Introduce-runtime_const_mask_32/20260630-130124
head:   c5019a5edc81040af1fdd5cb6685672b7d09cf6e
commit: b6e8471b174f2264b132157c6a5b58fd8935e1c9 futex: Use runtime constants for __futex_hash() hot path
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-r112-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021439.koGQ9S5r-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021439.koGQ9S5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607021439.koGQ9S5r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/core.c:532:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:532:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:532:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:532:51: sparse:     got void *
   kernel/futex/core.c:548:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:548:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:548:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:548:51: sparse:     got void *
>> kernel/futex/core.c:62:16: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)

vim +62 kernel/futex/core.c

cec199c5e39bde7 kernel/futex/core.c Peter Zijlstra  2025-04-16  59  
b6e8471b174f226 kernel/futex/core.c Peter Zijlstra  2026-06-30  60  static __always_inline struct futex_hash_bucket **futex_queues(void)
b6e8471b174f226 kernel/futex/core.c Peter Zijlstra  2026-06-30  61  {
b6e8471b174f226 kernel/futex/core.c Peter Zijlstra  2026-06-30 @62  	return runtime_const_ptr(__futex_queues);
b6e8471b174f226 kernel/futex/core.c Peter Zijlstra  2026-06-30  63  }
a52b89ebb6d4499 kernel/futex.c      Davidlohr Bueso 2014-01-12  64  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
