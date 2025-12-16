Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7733C53E
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765881397; cv=none; b=ODjvtWrjviBvIACDFj4K1Bv0Pf0o1LZKlRU1H5kZ0aVDu6/Pf+X1GyD8NwYXkYKzQ8OA85Csr+Ky9k6va+WYMLHmUXYqj5vydgOrl7BfSiJ68ruJPEYdizhgOoXvr4XALShid1aX9EFpOjfqcujGnCXKiLUkdpjIizLMOzyLQ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765881397; c=relaxed/simple;
	bh=HjHtZWik+uTu7djbEjAGxWhhchyYnZE8KKrgKJ7VqKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JR5y9+EISmU5NzdENtT/0agWNPLcoIIRiz0iABJx4Jiw3rzszWSI2zrMgTEYrhz40zjv/X8J8XnkAJ/enX9ogFJGIH5EcOvzZkTPobg8vKnXdf7EkR5du030MumH6USb2s7bhGKUnS93LV75Y8uj/gpFQ5R0+G4+v3rx/GWSurg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ps1qmiYa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ps1qmiYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765881395; x=1797417395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HjHtZWik+uTu7djbEjAGxWhhchyYnZE8KKrgKJ7VqKU=;
  b=Ps1qmiYaao6iwNjO6+5aUugT51SBgJDrpgWKgn1FoxvjL9VwPmYNFz75
   3hbqTT933Wi05/IAUFaYvkM/l5gHCQQUpPk2nzell2GVsDWB8x5Uh7Ik8
   Zq8sdk4O2h50swPXwaDFvh7PBzdefVhfDYQWBP9t8uniBVuhtayZK8Cxi
   XDuNBCY3IlgpBm7XhRP4DWz71RCPixHmdQguVUNCkzzyQLX6bo8dw8voD
   UIUdsTsQ5nk6cmmWTWMvUF4c3JcO19NEU9EB2DkUx8v/hUoNML9/2Ca5t
   QD13yp/zbshxFxmQ3OGepb45h8LPCFSAXSyOuqN14hg9houbBSs+74xBv
   Q==;
X-CSE-ConnectionGUID: xodPDcSzSUqHEjkLg/AuoA==
X-CSE-MsgGUID: QlT1Sp6aTaqbXFx2C2i0sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55366131"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="55366131"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:36:32 -0800
X-CSE-ConnectionGUID: 1Xo3kCnOR4GF/tNQeD6biw==
X-CSE-MsgGUID: PJzp/VAgQX23Uep2QI76pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202167891"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Dec 2025 02:36:31 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVSPs-000000001VA-312Y;
	Tue, 16 Dec 2025 10:36:28 +0000
Date: Tue, 16 Dec 2025 18:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-2025-09 1/1] lib/math/div64.c:219:25:
 sparse: sparse: division by zero
Message-ID: <202512161851.KSBY6rlU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/math/div64.c:219:25: sparse: sparse: division by zero"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   664cf6f08da637d184ba4d36b299b1fdc5ae7dc0
commit: 1635e62e75a7bbb1c6274f6b43911cedfe0da60a [1/1] mul_u64_u64_div_u64: basic sanity test
:::::: branch date: 32 hours ago
:::::: commit date: 1 year, 3 months ago
config: arm-randconfig-r131-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161851.KSBY6rlU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161851.KSBY6rlU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512161851.KSBY6rlU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/math/div64.c:219:25: sparse: sparse: division by zero

vim +219 lib/math/div64.c

b29a62d87cc0af Nicolas Pitre 2024-07-07  214  
1635e62e75a7bb Nicolas Pitre 2024-07-07  215  	/* make sure c is not zero, trigger exception otherwise */
1635e62e75a7bb Nicolas Pitre 2024-07-07  216  #pragma GCC diagnostic push
1635e62e75a7bb Nicolas Pitre 2024-07-07  217  #pragma GCC diagnostic ignored "-Wdiv-by-zero"
1635e62e75a7bb Nicolas Pitre 2024-07-07  218  	if (unlikely(c == 0))
1635e62e75a7bb Nicolas Pitre 2024-07-07 @219  		return 1/0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
