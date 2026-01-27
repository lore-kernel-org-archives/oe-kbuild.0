Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4BA34AB00
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514446; cv=none; b=eUwZ18n1aYhx/kgGJ6Tvjl8QhNGuBGhLA3r9U9dXI0HPpriNGyUGer2BXwbpcafAb7lFFIAU4TzVy4Yt1x1Ky4eH7VzXhI6+XvlAZ2UimGD1OciRei671Xzn6ZuVvHTcB8+af4dY2su2JyLU8ebykb1xw/2/TA9s3v7qr3qWohE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514446; c=relaxed/simple;
	bh=01OcK09DrkDhxVdmhLOhHbI3q2hxHpKI4Bww6zWIclE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nxs4vEiuQeJ+J91hBsThy4AbVOsgefUEu2WKwb30Va+2MCFMxZwnv5iG/fHnHpAoswJMEypDXTk80jfgBhB7X5i5OjBZpb5FyKRmMPPRc49pTl4IUqSpg+AHLHaIIgZSgzQwuydX5j3nFukqVuRRjYQJWzvYz+d77+/4MruGAz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cI3L6KaQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cI3L6KaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769514446; x=1801050446;
  h=date:from:to:cc:subject:message-id;
  bh=01OcK09DrkDhxVdmhLOhHbI3q2hxHpKI4Bww6zWIclE=;
  b=cI3L6KaQdJZFjDG9uIvBpjWsav0U/5/3Ozs9B1CuywsnqI5Bk4W9xzZ4
   eekwc1zwCiJPYIWArVEwuFIDoKd8vqgu1uXMz7+TD6+UuITDvcHbXptrS
   PxOnFS7csNTNlBjNrCfRR1TVsRhGQbxfTrV1HUGWpGtHVWo5NgWoH1Dcs
   VXawLh1gC4cS66/8YnZIe1eHU1zfgu3u7s6hTEkff2MLeKA3tTgnQdZa5
   Jq2bWiR4Su+0NwgWHzDFDRZ75RB7r+Z/h3fqfo+hbOC/GHBjRzL2hlPcR
   b9GFCgY6N2xvJYbGXmAC1+cg637EQjDXvNaCk79LIom82cphwWi+ugIxV
   A==;
X-CSE-ConnectionGUID: lO8Or8OCS5KxtkOMPp5Sfg==
X-CSE-MsgGUID: P7hvbLAqRS2nMLME5o+V0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74552720"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="74552720"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 03:47:25 -0800
X-CSE-ConnectionGUID: pN+/h/nGQNOFlhsOCTXfsg==
X-CSE-MsgGUID: eyeml+43SuiQIvTFOQ6I4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207745659"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jan 2026 03:47:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkhXV-00000000YQu-24nY;
	Tue, 27 Jan 2026 11:47:21 +0000
Date: Tue, 27 Jan 2026 19:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7457/9596]
 lib/tests/min_heap_kunit.c:208:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601271908.kGAWYFQX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/min_heap_kunit.c:208:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ryota Sakamoto <sakamo.ryota@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Ryota,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   615aad0f61e0c7a898184a394dc895c610100d4f
commit: 30edc7fafbd64d63480f6a5c8b7d919a94fde4da [7457/9596] lib/tests: convert test_min_heap module to KUnit
:::::: branch date: 12 hours ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-r112-20260127 (https://download.01.org/0day-ci/archive/20260127/202601271908.kGAWYFQX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271908.kGAWYFQX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601271908.kGAWYFQX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/min_heap_kunit.c:208:1: sparse: sparse: bad integer constant expression
   lib/tests/min_heap_kunit.c:208:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/tests/min_heap_kunit.c:209:1: sparse: sparse: bad integer constant expression
   lib/tests/min_heap_kunit.c:209:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +208 lib/tests/min_heap_kunit.c

6e24628d78e478 lib/test_min_heap.c Ian Rogers   2020-02-13  207  
303474913271af lib/test_min_heap.c Jeff Johnson 2024-06-19 @208  MODULE_DESCRIPTION("Test cases for the min max heap");

:::::: The code at line 208 was first introduced by commit
:::::: 303474913271af4eb3ec1c5f955d1e01682f3e1f KUnit: add missing MODULE_DESCRIPTION() macros for lib/test_*.ko

:::::: TO: Jeff Johnson <quic_jjohnson@quicinc.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
