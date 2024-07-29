Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD48653
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jul 2024 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722291608; cv=none; b=HhH4VqNGOsXocM4FLbn5OvxkXmEP4t9W2XCvmTG2hfeQSN+366YPSatBuAyU/YoDIP5H1HMn7Q3Rp2oVWo9/fpI2MEiqg5YCRjSp9u6BY7pIHt7h82iUmab5/JhynOgOubwWwyBQXnrtKuV+uPSIxOkHw+szweptTArZkVf7sUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722291608; c=relaxed/simple;
	bh=hPl/EGPzc0oppN40JjJeNchGmlDeatLNj3hzpwAP+IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XFnCf+u5UVj/MTOctBQKYInTu9X019Z3g487/D6hTrbcgYBs+2TlO04dGGmRxOL0d9CZkPTRQ2rt8lLIiqGEVfJG0zB3P7VSisHSr+rO/ycDzwRzX+rtnf1kYUErdQrnlO8VruggABSDv7Pz9hQ6MD7IuHDx3RsMxLbSd4pIOps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVGzvqbu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVGzvqbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722291607; x=1753827607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPl/EGPzc0oppN40JjJeNchGmlDeatLNj3hzpwAP+IQ=;
  b=GVGzvqbupNOtUcK/7xqlqENd4HWH0n4Gq5KSMt9b35hYX+f3E4SZOjgJ
   t9YeQL/VOdw9a7rR7rtMhQCvlWg9OHphqJYFfb3l4bRAyby7hrcoAZkLz
   zXcV0SMB//HDUGiAriH994ki7/KAoSjorZIT2cgTybS4bA6TpR3se5wBC
   H/D2MmigQxO6AGz4HFqYDLMIYbw5JD3RmddQ0+zWnfllXhiObSxH7Y3O2
   n73UDvpQbhHKVpEOGZHhgEZjNIKBrgHJqB6QL64uzpVV6GLhgi/egHp+O
   GHaK8pZDvUYCHkBOCBihdo+CWlHq4+JyTcch1wULlY52a24D7ZjQGRggv
   w==;
X-CSE-ConnectionGUID: Hz47kprjR+2IBfpScTJ3DA==
X-CSE-MsgGUID: sXTw9XhMTVGGzM9C7zCvJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20215424"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20215424"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 15:20:06 -0700
X-CSE-ConnectionGUID: 80n0CW0OSmKk4b2rfVxKQQ==
X-CSE-MsgGUID: gSMgPekaQOmohaC329Lt3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="58257384"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jul 2024 15:20:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYYio-000s8G-2W;
	Mon, 29 Jul 2024 22:20:02 +0000
Date: Tue, 30 Jul 2024 06:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 71/89] mm/swap.o: warning: objtool:
 lru_add+0x78: unreachable instruction
Message-ID: <202407300634.uB2QFSUg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   3bb434b9ff9bfeacf7f4aef6ae036146ae3c40cc
commit: d0138578b599308be104806386a4a41e24426771 [71/89] mm/swap: remove remaining _fn suffix
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240730/202407300634.uB2QFSUg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300634.uB2QFSUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407300634.uB2QFSUg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/swap.c:17:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:290:34: warning: missing braces around initializer [-Wmissing-braces]
     290 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   mm/swap.o: warning: objtool: const_folio_flags+0x30: unreachable instruction
   mm/swap.o: warning: objtool: __page_cache_release+0x94: unreachable instruction
   mm/swap.o: warning: objtool: folio_add_lru+0x58: unreachable instruction
>> mm/swap.o: warning: objtool: lru_add+0x78: unreachable instruction


objdump-func vmlinux.o lru_add:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
