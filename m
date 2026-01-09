Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D51E32A2
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 01:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767921217; cv=none; b=IYYOQtVpiE1yPmdGe2PXWpAxMkP+czCC/1wOb3cjz2eaZZt7VfC2ImR7nDH0TZO6rZsvKbkMOkyWdL46OGNxqMS95yqGA3KaMKDWjsAS4WFboZs8jR7Z+XLSqIjJ2HTPkXB7pOK3Ta2RVAaEYsTlGFPehaFm8xbqyK48OBFsEOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767921217; c=relaxed/simple;
	bh=8fqTRP6d8ZXunQg62EcCPvc6HHJ6w+h6KGlSxmo6JRk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kmaCZlZ9ZEwN+kWgZSZbA0IdMlx6vtGKm1bFvU9JBA77SCR/CZsAocx/MJY1/kuIAoOAS3ntwKlXx/8qfy2ue4wvZjMAfs/VFjwAxocCaMp6Thco0U8W7WriOOGKHaebS83Hcyc8ZoUNjK91yKoprY6KnNudX67lzShRDduftkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bvz76Gbu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bvz76Gbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767921215; x=1799457215;
  h=date:from:to:cc:subject:message-id;
  bh=8fqTRP6d8ZXunQg62EcCPvc6HHJ6w+h6KGlSxmo6JRk=;
  b=Bvz76GbuElkDesK2drUeoRs56g9tKzl66Cb3b/0q3ALOBIjCs9S15o+H
   b+DX6HTkVXT3DLf2ChAZjDELoeH1MF3F3PCBOaQ7KGvRadHQnQsJlpKD6
   nkDCaiLYQL2E/RspobguqW1+gcU+84LVOeNRRNogAXEzcuWsqr6DiaLFb
   OyXgSVl01Bbzu+K0Hcc4FhNfKAyqoVOLEp6wOxnX5M90mmz1EF/XzJZvG
   uaybkWP/hbQ4MPtcoyZAiY7RX4IVBK5gkUQau5tpFWOM3lWGSbakCtYQ2
   0gL4n1AgeUj2TYW729wCJcKDehyXrxkbQ5vVjBBl2wNnP+x9/x2+8uInh
   Q==;
X-CSE-ConnectionGUID: dQ2bUn88S56Tl4iUrtSUUQ==
X-CSE-MsgGUID: DlJU4jIBTl65nbw9yd0pHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80415721"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="80415721"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 17:13:35 -0800
X-CSE-ConnectionGUID: AXgtfl8JTWy3wUTfjv8SEQ==
X-CSE-MsgGUID: yhayM+/aSPSBzlZuF8BKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="240842614"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jan 2026 17:13:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve14G-000000005IE-0arT;
	Fri, 09 Jan 2026 01:13:32 +0000
Date: Fri, 09 Jan 2026 09:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool: acpi_idle_do_entry+0x9: call to
 perf_lopwr_cb.isra.0() leaves .noinstr.text section
Message-ID: <202601090902.V4rnbDJR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5572ad8fddecd4a0db19801262072ff5916b7589
commit: 4759670bc3e670069c055c2b33174813099fea4f objtool: Fix CONFIG_OBJTOOL_WERROR for vmlinux.o
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-003-20260109 (https://download.01.org/0day-ci/archive/20260109/202601090902.V4rnbDJR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090902.V4rnbDJR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601090902.V4rnbDJR-lkp@intel.com/

All errors (new ones prefixed by >>):

   vmlinux.o: error: objtool: __ct_user_enter+0x94: call to rcu_irq_work_resched() leaves .noinstr.text section
>> vmlinux.o: error: objtool: acpi_idle_do_entry+0x9: call to perf_lopwr_cb.isra.0() leaves .noinstr.text section
   vmlinux.o: error: objtool: 2 warning(s) upgraded to errors
   ./tools/objtool/objtool --Werror --noinstr --link vmlinux.o.orig -o vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
