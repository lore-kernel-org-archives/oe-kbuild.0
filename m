Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206F83D1CCC
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203585; cv=none; b=AulZP20/YT8YQ2t3+VHZ4GytcGe+bbmySiHLqhis76ij3uQMC3xguiPET+me59BCv8ZFNouFahxqV63YUJi5dC5vo/lacdqtEdaZSjGfEPSSTaAX5QeLKxbf99ZxJPrqAUn2AF02AapdVi1hlR7zWuV55CMPIvkyDjplfYB5yu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203585; c=relaxed/simple;
	bh=hf862+pLmYoPNnmUm+A7pJ1G4G9mBsoShntzrHoOSGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bet0r9iJAIpsOSZX5giGAm/AfqmS/IoDMYynztYYF7tu0EOkae9cSSbsSEzNU7zVXPdCVUEwrNeOasClh7tDiHAq1HYo5Qs8i4gkMxoBUWUrGBzJqOvPtcqXdWhWP0sdDZJgaLKIV8TXSwjsAzKsa1e2JHIRrAqDCCBljGnTqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzgHJ2rm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzgHJ2rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770203584; x=1801739584;
  h=date:from:to:cc:subject:message-id;
  bh=hf862+pLmYoPNnmUm+A7pJ1G4G9mBsoShntzrHoOSGw=;
  b=RzgHJ2rmOI0j7K+1MQgeBRIJNshoSkA8R6dCwoebkZ4e8imOyj7U0yND
   AuWsvqPUm9PZCoJuin6mdwexpJ16TlPB7lfXdvoNqz9/el2Uw24zCjmNU
   PmnfZ6S7jkCUx4ECDjkozkV2g6opTqaTp9w4Ecg1743UrpNb4qtsiCfjQ
   9uKL90qn0JUqMVI0hxFYVSmdKRDNvBmEos8ta+yHKsjeJCvK80bOsYFLY
   9NIbwA2wj8zTWaFORsWhKvIgxcPMAqUWKvwA91OIdac+vpMg1KLt8i8AU
   /lYkQYr2khhGGqUweBqT2m+a9c4IeKIxDH4+64gZ/1xAdmG38qAdcD829
   w==;
X-CSE-ConnectionGUID: OMni5E5+So6PZyvTM48u5g==
X-CSE-MsgGUID: z76WMwwxTlCK+wv3IOMhxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70405869"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="70405869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:13:04 -0800
X-CSE-ConnectionGUID: UkEj+yZtTgabJI4CcBTA2A==
X-CSE-MsgGUID: WR/DD0u1R1iuEdpGD3A5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209739076"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2026 03:13:03 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnaof-000000003gj-0HeT;
	Wed, 04 Feb 2026 11:13:01 +0000
Date: Wed, 04 Feb 2026 12:12:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:objtool/urgent 3/7]
 arch/x86/include/asm/asm-offsets.h:1:10: fatal error:
 generated/asm-offsets.h: No such file or directory
Message-ID: <202602041202.tMevlUWB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
head:   78c268f3781e4b9706103def0cc011505e0c4332
commit: f387d0e1027f2d13cbfc1305b54198af701ede19 [3/7] x86/asm: Remove ANNOTATE_DATA_SPECIAL usage
:::::: branch date: 8 days ago
:::::: commit date: 9 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260204/202602041202.tMevlUWB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041202.tMevlUWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602041202.tMevlUWB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/asm.h:130,
                    from arch/x86/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/vmalloc.h:5,
                    from ../../../drivers/nvdimm/dimm.c:5:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: generated/asm-offsets.h: No such file or directory
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +1 arch/x86/include/asm/asm-offsets.h

559df2e0210352 Sam Ravnborg 2009-04-19 @1  #include <generated/asm-offsets.h>

:::::: The code at line 1 was first introduced by commit
:::::: 559df2e0210352f83926d178c40c51142292a18c kbuild: move asm-offsets.h to include/generated

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: Michal Marek <mmarek@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
