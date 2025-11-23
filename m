Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22C19C546
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763870871; cv=none; b=PFEIN0VwW3JWfx4OEuq3fY8xAFwNvTHwR4Wk69nmoFAPrDmFbIZVTQdRmkN1wyELz5VKr+4xqnBO1jYCK+dtWZ2JU0x6UpdyuDtwoLHHpZvq5L8fpGaiHo41jx+AH/MZBcA6zrqugXNZGsYWsbXYYWq7kjPvXNnVsjcFFXHfmu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763870871; c=relaxed/simple;
	bh=NpmmHSKr5VMKm2MiT4+L2l7FroB1NDdTztfDKQlumqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iiyioJZCdnKboth4FSOT4QV/0mxUgvHxlOh+t4BK0M3NxOy4csXoFtKGNZBP+5qxZP8f30jP4JwNsWaFNhNhw5Q8vs2MGn0tlZIwRZ5EIBj3klDic1LERuypP6xSnXtMiIDHFP3+MpERQOrmertGJdNtmT54ePM/XY5H0hXBWbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mH/urTPf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mH/urTPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763870870; x=1795406870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NpmmHSKr5VMKm2MiT4+L2l7FroB1NDdTztfDKQlumqA=;
  b=mH/urTPf38H+YG/MCgZ87XMdqfW3u4rKLT581ReflFIioT0WhPCtnAd6
   eyt+9KLOc5PTQ41EzgvvYmWtWW7KqB3u0pua8mwAVMojy1dmVim1ZB7+M
   sZ5rGqKCLAnaT2hcUVw/tKdJ//ZWoEI4cza+8bPkip4j90cmCkuFx/spK
   nTEHAyVYaalbxr48fkfJIbNJshttQBt+wukd1wpe2FRyvSLRuzjnbC+AO
   2TqjpdSFKguzPPVyaRAc5GAVk8RlFoh+y8r0W2tNUD8LrGwAqWxzFj421
   f8AxDZbdsS+Oh2REMRi3fkQB3ii/OiCDHni8FAmO8cnthyQ5ywLd4xFAK
   Q==;
X-CSE-ConnectionGUID: 2kKeUbeDT9WzIfGPplnNwg==
X-CSE-MsgGUID: thbdcL+NQeWmPJ02umu97A==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="53481362"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="53481362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 20:07:49 -0800
X-CSE-ConnectionGUID: S0RwtcmVT4ymkvfkPG0z5g==
X-CSE-MsgGUID: uRlMjiXVRL2xSM6Jy+kLag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192807164"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 20:07:48 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN1O6-000829-05;
	Sun, 23 Nov 2025 04:07:46 +0000
Date: Sun, 23 Nov 2025 12:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/kasan/kasan_test.o: error: objtool: asan.module_ctor+0x11: call
 without frame pointer save/setup
Message-ID: <202511231203.vCIOKZQM-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d13f3ac64efb868d09cb2726b1e84929afe90235
commit: 36799069b48198e5ce92d99310060c4aecb4b3e3 objtool: Add CONFIG_OBJTOOL_WERROR
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231203.vCIOKZQM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231203.vCIOKZQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511231203.vCIOKZQM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kasan/kasan_test.o: error: objtool: asan.module_ctor+0x11: call without frame pointer save/setup
   mm/kasan/kasan_test.o: error: objtool:   asan.module_ctor+0x0: <=== (sym)
>> mm/kasan/kasan_test.o: error: objtool: asan.module_dtor+0x11: call without frame pointer save/setup
   mm/kasan/kasan_test.o: error: objtool:   asan.module_dtor+0x0: <=== (sym)
   mm/kasan/kasan_test.o: error: objtool: 2 warning(s) upgraded to errors
   ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --ibt --mcount --mnop --retpoline --sls --stackval --static-call --uaccess --Werror --backtrace --link --module mm/kasan/kasan_test.o.orig -o mm/kasan/kasan_test.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
