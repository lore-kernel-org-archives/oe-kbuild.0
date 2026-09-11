Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9859381AE5
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 05:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105886; cv=none; b=p5op6zeZlkSaKq5EHlz2e394EPZFc9E9fcrqM4GpgFkQ6EBE2UduaeaQx4fwXZk1cCnPynX2ZzLwdwJNQV9s8ZyJpwmd5VO1DLQVNU6/70pTGrVO5sBqnXvlnRxBFvkwcKPVct8nHYQ5yJ3XD56yAvst36XKFqLJEefAHIJ2vQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105886; c=relaxed/simple;
	bh=1Dz0a+DjlW2bypgN9y54jCT+DA3IUNfKDnUZJLBfTqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ITJ6m8Sl5iQ94p4ayu3AHWCasKA3k8aQTgLyJSsrIks9uzwTUP82VBfeE8efeN4Oy8o9ywJ0HWXz93WS6xiRmalRh1Ct8FVix0y+rH4pXnaYGDY2BRGf+slwWdtfrHza7mSo3l29vOxOwyhQzh6YPjipKRmnSk9qgWV3RkwhGno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAmL/q8U; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAmL/q8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789105885; x=1820641885;
  h=date:from:to:cc:subject:message-id;
  bh=1Dz0a+DjlW2bypgN9y54jCT+DA3IUNfKDnUZJLBfTqs=;
  b=gAmL/q8UJeqLj/R0Pfz059/sgZULB4qanB+UT0GidGda7NtCgLcDWsGN
   ntjMKBf+EclOVWz9ZLW5pQo5U/xByrkJke9opBirETyQasLp4WCckTdp5
   mxZvkn3NSrMqUBk5rmgBnmcv62PbMrCysFRsUgXTwGQz0Bs74FdHU+sd4
   SXUDbaAUjGXV+bL9IrTKVCFUpMXcd8wOWK7z1Jx7aODa7MCqpZcXXRM8Y
   YKi5ew8xiegMVGyl0E7PV+9TuVvsLn27yGWpRH70BuHSxS/kxHWpx4njM
   c4cpWMmEBe8g4doGSRSsad7KxY87dqwgaKru25x1wFDe1T2+lIq0HT/cG
   w==;
X-CSE-ConnectionGUID: fYj7JIs2TNOjHqtCCgbJCA==
X-CSE-MsgGUID: jZo8CwAeT2ySdKbrxz48Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106935583"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="106935583"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:51:25 -0700
X-CSE-ConnectionGUID: z0L8IjUkSbiEHwnsp4AclA==
X-CSE-MsgGUID: Frf78AFaRumNiMBWMDFeVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="295303292"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 22:51:23 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4u9N-0000000016u-3zIB;
	Fri, 11 Sep 2026 05:50:23 +0000
Date: Fri, 11 Sep 2026 13:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/assoc_array.o: error: objtool:
 assoc_array_insert_into_terminal_node+0x41c: can't find jump dest instruction
 at .text.assoc_array_insert_into_terminal_node+0x9d4
Message-ID: <202609111350.Nl34keoE-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: 1fd1dc41724319406b0aff221a352a400b0ddfc5 objtool: Fix ERROR_INSN() error message
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: powerpc-randconfig-r133-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111350.Nl34keoE-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111350.Nl34keoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1fd1dc417243 ("objtool: Fix ERROR_INSN() error message")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111350.Nl34keoE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/assoc_array.o: error: objtool: assoc_array_insert_into_terminal_node+0x41c: can't find jump dest instruction at .text.assoc_array_insert_into_terminal_node+0x9d4
--
>> fs/btrfs/extent-tree.o: error: objtool: do_allocation.constprop.0+0x3c: can't find jump dest instruction at .text.do_allocation.constprop.0+0x230

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
