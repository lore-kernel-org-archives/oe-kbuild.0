Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E889D286A1
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Jul 2025 04:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751517399; cv=none; b=hrzJzNgCSGvKgBHD81Y7nwJXagf3hUkFU2g/tlwExoJ/WkjkJn+SuDf9kS8CLFnEUTG4d/TL5D2eq3sDmMJuHPqpybXBCZirJgPXLdm6y+azaSUXqDvMuhJg4GQ7oA3QZ8tNNbh4Em/jh68CotJWW63YNlve6y7lqsD7R5XGPCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751517399; c=relaxed/simple;
	bh=3TjzC0fY7Y0EDvW8JEyDRePS06O6WMTEjoFOsFVIVvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nd60705y3kj1zEHxzb8ytI7497PNsxhNYPRhn8ldVbp/aI+S3y7I+VVK2FYHcO5xw68tT76EBDCNRn6jhQr0XRYJp8YyhWhepeZcJCQ51h8MxNEcLh0mb5ndgKNbhJxgf47tMJkG6LfrwVP/+3GRfF1KA6jx0JOzqf02OftEMxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ky6642EG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ky6642EG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751517398; x=1783053398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3TjzC0fY7Y0EDvW8JEyDRePS06O6WMTEjoFOsFVIVvY=;
  b=ky6642EGuulUNBG4lzwC2rW0BVVPcCs8UjNsvP6o+Lyg//6PzZ9ktkQ1
   O5rm/DnAqUwSMzorNDZAsYlFCSrUXg35i50ZgI3tmLn6PBmux5gTwFxJL
   VosEiZxlMcIR3ba/6ELGJJca/UODpp4bAxGItY28UMyQLEBZTFlsL+Fd1
   EV39Bwq75ivAPtjkblDItF++EQPOQrC5SYhFnbjjxFYQooSIVtFfX8xtU
   MACPgc0ChpligJF+AkKBIiz276GxlodU76KwuJDvlHEZ5P9C0X73SRnXv
   m3XAt6gRPk9KIYz9HUh/X7CoraGnZnB4HzVV93aR3Cc+AIv0Ze+w/tZvv
   Q==;
X-CSE-ConnectionGUID: 8zVos4H5Qfuq5+gs90As4w==
X-CSE-MsgGUID: Kts5ifywQpycoujQlazvTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65286278"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="65286278"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 21:36:35 -0700
X-CSE-ConnectionGUID: c0xqxC5VQxKI8hSI3icNgg==
X-CSE-MsgGUID: UdVvv4RWSWKHkyNcgewJGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154025086"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jul 2025 21:36:34 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXBgW-0001Tr-0L;
	Thu, 03 Jul 2025 04:36:32 +0000
Date: Thu, 3 Jul 2025 12:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/phy/ax88796b_rust.o: error: objtool:
 asan.module_ctor+0xd: call without frame pointer save/setup
Message-ID: <202507031237.Kkrp1YJt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4911fb0b060899e4eebca0151eb56deb86921ec
commit: 36799069b48198e5ce92d99310060c4aecb4b3e3 objtool: Add CONFIG_OBJTOOL_WERROR
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-008-20250703 (https://download.01.org/0day-ci/archive/20250703/202507031237.Kkrp1YJt-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507031237.Kkrp1YJt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507031237.Kkrp1YJt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/ax88796b_rust.o: error: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   drivers/net/phy/ax88796b_rust.o: error: objtool:   asan.module_ctor+0x0: <=== (sym)
>> drivers/net/phy/ax88796b_rust.o: error: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   drivers/net/phy/ax88796b_rust.o: error: objtool:   asan.module_dtor+0x0: <=== (sym)
   drivers/net/phy/ax88796b_rust.o: error: objtool: 2 warning(s) upgraded to errors
   ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --retpoline --stackval --static-call --uaccess --Werror --backtrace --link --module drivers/net/phy/ax88796b_rust.o.orig -o drivers/net/phy/ax88796b_rust.o
--
>> drivers/block/rnull_mod.o: error: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   drivers/block/rnull_mod.o: error: objtool:   asan.module_ctor+0x0: <=== (sym)
>> drivers/block/rnull_mod.o: error: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   drivers/block/rnull_mod.o: error: objtool:   asan.module_dtor+0x0: <=== (sym)
   drivers/block/rnull_mod.o: error: objtool: 2 warning(s) upgraded to errors
   ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --retpoline --stackval --static-call --uaccess --Werror --backtrace --link --module drivers/block/rnull_mod.o.orig -o drivers/block/rnull_mod.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
