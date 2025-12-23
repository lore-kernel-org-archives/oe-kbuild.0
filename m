Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7241C28E
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766500851; cv=none; b=MsGXoeyL0/XBHr0Iro+DRPK6QV2ggMUu2httLXcV2wlr/Qwk1TQ9Glzwhu3V+4LIJzVLJ9tD3wnFcVZ/Lk9J8wJ4VrNrsac0WnVaMzo4b6RO5CYYUfKikNaOErUkyua0Tg1rZbhxdLkZwyBxlV8xvPlWQt0EvvcXlqR2wYNt1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766500851; c=relaxed/simple;
	bh=kG021NnjtlR8x26HwdeRq792vFWkqad1uSHxt3hiCdo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xsk5htbYlkacxrX2DM5bMCB/zbNYG+YI8YiIN+QK9xvkhzaBud9fP8n91gdKN7B8JsmyPNw4oOcZrrg84kAiQWFqOi/vsdtECBLaEufHkWkDIc9v6WUNrSNZjYnoB4aFkgQO0uHMuSqJ7hFsysbRe/IEX461uZqqsCK0NW1gx5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYPBT4uv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYPBT4uv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766500850; x=1798036850;
  h=date:from:to:cc:subject:message-id;
  bh=kG021NnjtlR8x26HwdeRq792vFWkqad1uSHxt3hiCdo=;
  b=eYPBT4uv/cfyGtbwlVznfw/9UG6f1lah8YOMCwBGUY6D5wRqjyCq/Pb6
   Bk3y4WLDNQ+JsZpYYPa+4dDcm2nJsrsQomW4RipVGbsQwDyUrdd0Lj1WI
   0fbs1I8PryukxKjWXcN8ZhwkQwpYcsMj7OidH0FH72kHgqTIjzvFZmQe0
   xI4rQCdRjN86HKftktqpNIhPLYvx6ld4jrjuGXiU3YKeVRBJkj7VAs886
   pn/hLDdWAYK5WmZeA3/CAHVUPQiw/HQHG7wj8hgXoTHt8Jwmu8WrImigL
   t5aSe0bjG9A1ydj62e2kop5WcmerDb+68XeHahZ++2zvULWaKvsh8nHUR
   w==;
X-CSE-ConnectionGUID: gMnjk8ZLT/C79MFbQBZNXQ==
X-CSE-MsgGUID: TGz+bv0YT7q/yQg0a9bs+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68104687"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68104687"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 06:40:48 -0800
X-CSE-ConnectionGUID: Z5oJ/F/nQbGC1AfR6vV07w==
X-CSE-MsgGUID: qhFmAgGSTI680bjfKQQ9zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="200698187"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Dec 2025 06:40:47 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY3Yv-00000000221-3OMN;
	Tue, 23 Dec 2025 14:40:35 +0000
Date: Tue, 23 Dec 2025 22:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: "__flush_tlb_pending"
 [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
Message-ID: <202512232245.iwlQhMjU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20251218-180733/Kevin-Brodsky/powerpc-64s-Do-not-re-activate-batched-TLB-flush/20251215-230757, commit: f07263c9c5112e254739f5fc177f02a48afa0a67"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Kevin Brodsky <kevin.brodsky@arm.com>
CC: 0day robot <lkp@intel.com>

Hi Kevin,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20251218-180733/Kevin-Brodsky/powerpc-64s-Do-not-re-activate-batched-TLB-flush/20251215-230757
head:   cacf20184d5f227dd60a4768f15678ad615d25b7
commit: f07263c9c5112e254739f5fc177f02a48afa0a67 mm: Add basic tests for lazy_mmu
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc64-randconfig-002-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232245.iwlQhMjU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232245.iwlQhMjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512232245.iwlQhMjU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__flush_tlb_pending" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
>> ERROR: modpost: "ppc64_tlb_batch" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
