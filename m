Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C49E223DCE
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jun 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781390623; cv=none; b=NCgMh5Ypi8jpfxsEV+2hMKfg+1Be0XWYHsTfqh2RwLS3u+pcXqBXHQy29SYHtvtsa4SrPjoSeF4w1lTezeY4iAZgHxjUXRlxI9YV3eH0//Gi9TjYfPEivzsmAcoVB+PQcYIb9/dYn54kDP5xiOC6KMa/88UxAGI5wbdkHA/zQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781390623; c=relaxed/simple;
	bh=0vYdMyHp7A6V7M2mthbKJGTRlecVn5PZDMMqFKGnUsI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZN75ER0Fsmv7nNpUgNd69bMs+GeUml/WzBmERoQGdol2b0P2XTBeKlbeu5WRa9OGPzC9jObKVkWSn6NEgiNxp54Z52hjDx3yNLG12aePaykDA5fpNpBJfA207i4Q2bJb1PotfGwwAI2f3TRHd5ACE4rNzyJXIj1CCwf8pVZtFsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjimjerI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjimjerI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781390622; x=1812926622;
  h=date:from:to:cc:subject:message-id;
  bh=0vYdMyHp7A6V7M2mthbKJGTRlecVn5PZDMMqFKGnUsI=;
  b=cjimjerIFE13Ip2YHN1IwDOX1L1/Hy/MA0j0YfhZGmevvcg3ayoXgTxf
   picjqvu40ke4o3u7jNDgFnrrmJ5bG3e53iGW2JSNMOH6btow4BqWseImv
   MKky1JZaOzhFie3BS9sYRO9M/QLDGJR/yA3geZfzZP383iINFfqKj70Vk
   I+mWvIIZNCGU49OJT2PEuDfu/Dm8ZZnQ48vZLw+lt8isnyFn0Yu/od/NQ
   qfyL+R0Gz77XqmCJpSJRRKAr88vDOGBI/HAt+ns5xxvyNdgj9IfiRhBuR
   JNkcRMe9D60YVnIr2600NAfjh6w8LZuBCj6E+5W84DIqa2V/oWMxJ39J9
   Q==;
X-CSE-ConnectionGUID: PgixO6YjQaapqk9g+v+XFQ==
X-CSE-MsgGUID: u6Y6+5WWQbeqYSTnGUskfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82372773"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82372773"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 15:43:42 -0700
X-CSE-ConnectionGUID: m9Ecm1csQM+q4tPRvn8VIA==
X-CSE-MsgGUID: 8DdDDAnjQ4utJF1H2JzUfA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2026 15:43:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYX4k-00000000QKi-2tGT;
	Sat, 13 Jun 2026 22:43:38 +0000
Date: Sun, 14 Jun 2026 06:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/genalloc.o: warning: objtool: gen_pool_free_owner+0xf0:
 unreachable instruction
Message-ID: <202606140609.9mOzHkI2-lkp@intel.com>
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
TO: Saeed Mahameed <saeedm@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Dragos Tatulea <dtatulea@nvidia.com>
CC: Cosmin Ratiu <cratiu@nvidia.com>
CC: Tariq Toukan <tariqt@nvidia.com>
CC: Mina Almasry <almasrymina@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b07ea76fd28989bde5993532d7a943a6f90e246
commit: cb575e5e9fd1cba99f1514c36375e74609f92e70 net: Kconfig NET_DEVMEM selects GENERIC_ALLOCATOR
date:   1 year, 1 month ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260614/202606140609.9mOzHkI2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140609.9mOzHkI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cb575e5e9fd1 ("net: Kconfig NET_DEVMEM selects GENERIC_ALLOCATOR")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606140609.9mOzHkI2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/genalloc.o: warning: objtool: gen_pool_free_owner+0xf0: unreachable instruction
>> lib/genalloc.o: warning: objtool: gen_pool_alloc_algo_owner+0x344: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
