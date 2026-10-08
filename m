Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58851F2B8D
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791421978; cv=none; b=o1/7MuXwaWOiyR2QJypyyxoDoou4GavB2bYiOw0mbdNdQ/IDsOFdhNTSQp/hIgV2Ixt4/pEAmIqVb2Yf3Wt73hBxT0P0eLTK4/WlJKbssnXGP+QzfeqkrREsly8evGEY0b5gwb8BAuKPJfgAn93imE+8SvsaweeYJu9JU4Hf60A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791421978; c=relaxed/simple;
	bh=rCD221bWmyEeozg7SJKTjk2TF3cucpFtNEdHhTLzp1s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WYGYm+K+pKKgWnVTpUe0w7YLi5yVJYhzwJNeLt++aBk2nxYFK3t+Le458Wq3iQmxtnP64gm1BpQlKzbduH0D9kyU2AdwK/m91uE60uzIwIuA/QIucOaclXPdgn9Yrsj1WiyPtSmSS7WCwhh3qpIQhg5icMwl2fI92I/VHxhx2FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdJpP0n5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdJpP0n5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791421977; x=1822957977;
  h=date:from:to:cc:subject:message-id;
  bh=rCD221bWmyEeozg7SJKTjk2TF3cucpFtNEdHhTLzp1s=;
  b=DdJpP0n5xqTboHYwG89UJYWE3TfW4sPCfE220T0nQXWtk7sAPJJGhgRI
   iStajYGZ/B2rkm4UPpzFXQ5k6v653G/4ovqwvHqPSHCdRbymnoRbQ1acT
   My2/Te4ptx3BWLXs67Gr8J4zRvXbFZkKM8ZnRUYysIVHOzdJdHx7snT1u
   kArlZHLqj1BSKlcdyoyags/4BuMmXI6tQHe4Tjr1QYUTMk+TUU8yfxLoA
   AsbpX6J+/KD0I11rSMHA/AjTfOwJJFyHbpiIbCXKrBINau9lSHJ7GHxnp
   lBaFtE47dly3CB9Tmj36jTtb2YSZtokglvoo4AHp58WexxhqB0X9exoxc
   w==;
X-CSE-ConnectionGUID: bcv9+8ZxS7OC29+vBz48pA==
X-CSE-MsgGUID: /KPrc5YOQ9ycnaAx023VIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="94999"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="94999"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 18:12:57 -0700
X-CSE-ConnectionGUID: hblpISIfSFquxxfmpWy34w==
X-CSE-MsgGUID: ycwE83kZTpik5bDMScRqAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1613355"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 07 Oct 2026 18:12:55 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEcgn-000000004Td-14A8;
	Thu, 08 Oct 2026 01:12:53 +0000
Date: Thu, 08 Oct 2026 03:12:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/gup.o: warning: objtool:
 follow_pmd_mask.constprop.0.isra.0+0x138: unreachable instruction
Message-ID: <202610080322.A5EdN1H1-lkp@intel.com>
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
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b63ef2d55f24519e7e9e5f4d15dbea03f126e40
commit: c6f11553c067d7d9ed2dcffe1e01780441d4e6e2 mm: decouple protnone helpers from CONFIG_NUMA_BALANCING
date:   9 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 weeks ago
config: loongarch-randconfig-r2105-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080322.A5EdN1H1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080322.A5EdN1H1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c6f11553c067 ("mm: decouple protnone helpers from CONFIG_NUMA_BALANCING")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610080322.A5EdN1H1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/gup.o: warning: objtool: gup_fast_pgd_range+0x1a8: unreachable instruction
>> mm/gup.o: warning: objtool: follow_pmd_mask.constprop.0.isra.0+0x138: unreachable instruction
   mm/gup.o: warning: objtool: __get_user_pages+0x234: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
