Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C835201D
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791041010; cv=none; b=B8IxA4d4jMGBiozQ4DeXazLJgGlq3+uJQSPTMrzHNe63g6yHnFswaaOPhwWS3fSfggqytVzuaacKvVg5h8mypzGTocl2MmkwO0UE20wbaW/CABDo608zRVb7uJqpUlAr9uNrDYXbSfPw0en201cQYmvNwqTA9Vsesx45mjk5B8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791041010; c=relaxed/simple;
	bh=Ao2AjVglD8eKvC5AOXL68m5Xhqv6hDUB+bjRVWPTLQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ms7CWrHBJcE6w4EjEnWhQT+J/x08P3+UyJvl7AYXmJve3ormCmrY06jaycW9pIWRQqTxg28v00n7WxSjxwf+jl6+qDpVDK7Eak6l1DGpor1t9H+FxEnUQNRi3yBDQSt4dZO3wanzeb5W2yam/ngGAFo9DT8YqGLuZsN2rYQcehg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmUbPXk0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmUbPXk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791041009; x=1822577009;
  h=date:from:to:cc:subject:message-id;
  bh=Ao2AjVglD8eKvC5AOXL68m5Xhqv6hDUB+bjRVWPTLQo=;
  b=XmUbPXk0nVnVvJwrUgbj9NL0qajPEHXQx3xFoUm6/niBDOCn5STc4uj+
   wDl0cVxYLbHUHsRfjYM5mFUX5bli1qypxTysjtqDLt7ctYO2/s8lYdP/I
   8rJwPU2R4L4lHaDOH+BUb4/EmV/Z4HMItIs4rZ5ZzeEu2zRAIsrPJ7xUJ
   C7+EOK7vZkWO2iZUH7xPvcR75my9qKrppJDc5EUrLWUYufmbKFDPMXj0J
   TcW+9Qm12hEVoDXChDoARtJrp9gCyUK+qHASbLi3LFEhxkXkLOSYRg2JW
   HY6mTk8AP6uSqiNh25qaxi2Idwpqe3pR/tzwZsl8vASk93bCzdj7uMhAA
   w==;
X-CSE-ConnectionGUID: 3oH8kQ5cRsWk8ouvnTpvBg==
X-CSE-MsgGUID: mKVIdOotRDWZyCSG32dhGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90834616"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90834616"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 08:23:28 -0700
X-CSE-ConnectionGUID: wP62t3+9RRm2qP/mrD6LeQ==
X-CSE-MsgGUID: k/clIfEHQ765TgyAl0dUbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="305964210"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Oct 2026 08:23:27 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD1a7-00000000151-27nu;
	Sat, 03 Oct 2026 15:23:23 +0000
Date: Sat, 03 Oct 2026 17:22:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/dma/map_benchmark.o: warning: objtool:
 dma_sg_map_benchmark_prepare+0x24c: unreachable instruction
Message-ID: <202610031632.TXmhWWYd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qinxin Xia <xiaqinxin@huawei.com>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Barry Song <baohua@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
commit: a8d14dd6e621f47344d0eda72f7ce9203bdef4f1 dma-mapping: benchmark: add support for dma_map_sg
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: loongarch-randconfig-r2105-20261002 (https://download.01.org/0day-ci/archive/20261003/202610031632.TXmhWWYd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031632.TXmhWWYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a8d14dd6e621 ("dma-mapping: benchmark: add support for dma_map_sg")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610031632.TXmhWWYd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/map_benchmark.o: warning: objtool: dma_sg_map_benchmark_prepare+0x24c: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
