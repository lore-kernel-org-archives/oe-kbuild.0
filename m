Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA2E10E3
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 01:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209221; cv=none; b=kismgN9XD6wECvZtklHrAu8Q+LXt7W8sDxzy11uiAIEoOnTBgxDOXDfeQDqCfk1mHNTE5qI8FavL29r2W7f2mjBIhA/FVhz3lVVpQfVQr5oSG2MY1VhB2fq9kzfLoN3eEFdGJFwIwCM3XEPyXGtWZmy+6eBMyp+iO43ImvzptMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209221; c=relaxed/simple;
	bh=SryXCoBZViOuv0U/s7ylwgsV1dknW7RAY8VDpC+covg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GJmpLav4ciTi6vL/knQBm3ui+DFH7nGB4+hQ6YAtrc+Qu6wQl6hRvPk5itzn6DVNlIpRkfglsXI1IplF0hT44Omiul/zAYtunYecGtDBVZg9IzP6vLrrDdsKeZuXrBJY2iCU4Tu8X5yw79GRh8sBXWqm3EYgUlLeUIkXYFeUU1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlG+ei+I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlG+ei+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750209220; x=1781745220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SryXCoBZViOuv0U/s7ylwgsV1dknW7RAY8VDpC+covg=;
  b=BlG+ei+Ir4d2Y8jOTUGAGWWGxDGBuUKSRPK3Ns8q/wQX2g/TEJ0nC6xC
   4QeMWnuaODWddRbC4E2YYDINmg1p/T5i9p7s6N5/NfMamioUanbxvNHx4
   MzrR8AJJaAuhen4Xi0ur3VQhmO7bZQ/tZ5LymZjQj+S/z8ZEdsaet3QDw
   cWsFUjUcp7pHbokesC994A99mvUItwyd75/HkeSOgUinYZ+9ab2PISKyE
   MIBWTg494Wy69SygiB+YzHlaHcTBya28bfkd/E2TvxpmpZci7Cuafe5jo
   aQOepbtPokmDVsEch0lpUj+ek8J++mCool8E3kO82sCJPi7PTZ8MAB84i
   A==;
X-CSE-ConnectionGUID: hBbo8qf9T9WajB2weG4HtQ==
X-CSE-MsgGUID: vhYuaUWQSaijOjAhLiE0rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56225130"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="56225130"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 18:13:40 -0700
X-CSE-ConnectionGUID: TDUcuzjmQe+EdPhGSh49bg==
X-CSE-MsgGUID: igGefLoCT/ST9d4Ylv522g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="186354315"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2025 18:13:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRhMu-000JHC-1J;
	Wed, 18 Jun 2025 01:13:36 +0000
Date: Wed, 18 Jun 2025 09:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 174/174] mm/zblock.h:21:2: sparse: sparse: This
 PAGE_SIZE is not quite supported yet
Message-ID: <202506180901.VHfl4lau-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/zblock.h:21:2: sparse: sparse: This PAGE_SIZE is not quite supported yet"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vitaly Wool <vitaly.wool@konsulko.se>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Igor Belousov <igor.b@beldev.am>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   2f24ee10fe6d1959d674a4298d63b66f54508a68
commit: 2f24ee10fe6d1959d674a4298d63b66f54508a68 [174/174] mm: add zblock allocator
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-r111-20250618 (https://download.01.org/0day-ci/archive/20250618/202506180901.VHfl4lau-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250618/202506180901.VHfl4lau-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506180901.VHfl4lau-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/zblock.c: note: in included file:
>> mm/zblock.h:21:2: sparse: sparse: This PAGE_SIZE is not quite supported yet

vim +21 mm/zblock.h

2f24ee10fe6d19 Vitaly Wool 2025-04-12  13  
2f24ee10fe6d19 Vitaly Wool 2025-04-12  14  #if PAGE_SIZE == 0x1000
2f24ee10fe6d19 Vitaly Wool 2025-04-12  15  /* max 64 slots per block, max table size 64 */
2f24ee10fe6d19 Vitaly Wool 2025-04-12  16  #define SLOT_BITS 6
2f24ee10fe6d19 Vitaly Wool 2025-04-12  17  #elif PAGE_SIZE == 0x4000
2f24ee10fe6d19 Vitaly Wool 2025-04-12  18  /* max 256 slots per block, max table size 64 */
2f24ee10fe6d19 Vitaly Wool 2025-04-12  19  #define SLOT_BITS 8
2f24ee10fe6d19 Vitaly Wool 2025-04-12  20  #else
2f24ee10fe6d19 Vitaly Wool 2025-04-12 @21  #warning This PAGE_SIZE is not quite supported yet
2f24ee10fe6d19 Vitaly Wool 2025-04-12  22  #define SLOT_BITS 8
2f24ee10fe6d19 Vitaly Wool 2025-04-12  23  #endif
2f24ee10fe6d19 Vitaly Wool 2025-04-12  24  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
