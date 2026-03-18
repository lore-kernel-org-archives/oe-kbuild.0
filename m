Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED17376BD7
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833756; cv=none; b=DfrRftrBIMTlJgHPjNT0YhTxoJC3UdY2HwTEJ0cFMY/b/edauDjLIIJl2rLymsawegM2FRMF5jLO4nr8uqztNkeQnDSEfhtVI5U0qMtVLIZ5kpxQxZXO4yUhbhsdTUntGr6Ybe2avy4DuaZzNsbtbQYAPu7kIYNnob24Gw9QsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833756; c=relaxed/simple;
	bh=kV0Kt6ivrv9u2HsGqA4gi9b2bmZj7klozYlz6xMkIzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DPKg3EcqVVlp1042NpHhOHXO+n7umG1WhmCtnLVWQt10gnQd6ahwvyTqQYIjBxTbD3NTdetwTshEDhhR+mIIlVBXV5SnB04gdP7qLBsoL3D0Fbj0gduiVsnxhVLrko4AFLh0selrjFEuhrpoDbJ+69ZcMswUbgqE2gjtz8jg2qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDbdhAgD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDbdhAgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773833755; x=1805369755;
  h=date:from:to:cc:subject:message-id;
  bh=kV0Kt6ivrv9u2HsGqA4gi9b2bmZj7klozYlz6xMkIzk=;
  b=KDbdhAgDv8AywxUvNh9Z/UWHjr8zVzkXZSZII/VvUTAdZM/+sd/ieslC
   Lvd7FaTrU9LA571OX3XZmfRB/DIXl50fOPodj1am2zRlslrVU0IG2hRT4
   RD3ATA7Lj9AbO1M9nvybKNY5VKBNRtCqrO5nyUgQmJT0+LQO6b1a+G4j0
   YLiq9N6D+IysPydcqRB/IZXbZFRIJr8mA2+rk4JU5Dn6w2bEzrVd2zwQL
   n8rF714JQXWo6dW5hTal+wBNMuYI9MGgvcFUd15/vol1ojHBboZBGQY0d
   IAchQ2B6AYvmewxPRZbRcv0XKLjXmU6XdLpdkEl3HlnypzwjAq9uDOQJH
   g==;
X-CSE-ConnectionGUID: 1Q/yPJ4OSAqfjRWCS4XtEw==
X-CSE-MsgGUID: uVugQuO8RX+EQVUKegThCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74770641"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74770641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 04:35:55 -0700
X-CSE-ConnectionGUID: +aobJEk4T3+DpSwHquVqEg==
X-CSE-MsgGUID: +Rxst3o1TXSMhMAGQUECQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222578793"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2026 04:35:52 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2pBm-000000002ql-2WH4;
	Wed, 18 Mar 2026 11:35:50 +0000
Date: Wed, 18 Mar 2026 19:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline 3/3]
 arch/x86/events/intel/uncore_discovery.c:290:2-8: ERROR: missing iounmap;
 ioremap on line 285 and execution via conditional on line 289
Message-ID: <202603181918.tQPAR6Mk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   1337287790349b2d5411cdfeb332ba7ee1be4d50
commit: b575fc0e33574f3a476b68057e340ebe32d7b750 [3/3] perf/x86/intel/uncore: Add domain global init callback
:::::: branch date: 5 days ago
:::::: commit date: 2 months ago
config: i386-randconfig-r061-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181918.tQPAR6Mk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603181918.tQPAR6Mk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/events/intel/uncore_discovery.c:290:2-8: ERROR: missing iounmap; ioremap on line 285 and execution via conditional on line 289

vim +290 arch/x86/events/intel/uncore_discovery.c

bd9514a4d5ec25b Kan Liang 2023-01-12  259  
e75462f6c7eaa5a Zide Chen 2025-12-31  260  static int __parse_discovery_table(struct uncore_discovery_domain *domain,
e75462f6c7eaa5a Zide Chen 2025-12-31  261  				   resource_size_t addr, int die, bool *parsed)
edae1f06c2cda41 Kan Liang 2021-03-17  262  {
edae1f06c2cda41 Kan Liang 2021-03-17  263  	struct uncore_global_discovery global;
edae1f06c2cda41 Kan Liang 2021-03-17  264  	struct uncore_unit_discovery unit;
edae1f06c2cda41 Kan Liang 2021-03-17  265  	void __iomem *io_addr;
edae1f06c2cda41 Kan Liang 2021-03-17  266  	unsigned long size;
edae1f06c2cda41 Kan Liang 2021-03-17  267  	int i;
edae1f06c2cda41 Kan Liang 2021-03-17  268  
edae1f06c2cda41 Kan Liang 2021-03-17  269  	size = UNCORE_DISCOVERY_GLOBAL_MAP_SIZE;
edae1f06c2cda41 Kan Liang 2021-03-17  270  	io_addr = ioremap(addr, size);
edae1f06c2cda41 Kan Liang 2021-03-17  271  	if (!io_addr)
edae1f06c2cda41 Kan Liang 2021-03-17  272  		return -ENOMEM;
edae1f06c2cda41 Kan Liang 2021-03-17  273  
edae1f06c2cda41 Kan Liang 2021-03-17  274  	/* Read Global Discovery State */
edae1f06c2cda41 Kan Liang 2021-03-17  275  	memcpy_fromio(&global, io_addr, sizeof(struct uncore_global_discovery));
edae1f06c2cda41 Kan Liang 2021-03-17  276  	if (uncore_discovery_invalid_unit(global)) {
edae1f06c2cda41 Kan Liang 2021-03-17  277  		pr_info("Invalid Global Discovery State: 0x%llx 0x%llx 0x%llx\n",
edae1f06c2cda41 Kan Liang 2021-03-17  278  			global.table1, global.ctl, global.table3);
edae1f06c2cda41 Kan Liang 2021-03-17  279  		iounmap(io_addr);
edae1f06c2cda41 Kan Liang 2021-03-17  280  		return -EINVAL;
edae1f06c2cda41 Kan Liang 2021-03-17  281  	}
edae1f06c2cda41 Kan Liang 2021-03-17  282  	iounmap(io_addr);
edae1f06c2cda41 Kan Liang 2021-03-17  283  
edae1f06c2cda41 Kan Liang 2021-03-17  284  	size = (1 + global.max_units) * global.stride * 8;
edae1f06c2cda41 Kan Liang 2021-03-17 @285  	io_addr = ioremap(addr, size);
edae1f06c2cda41 Kan Liang 2021-03-17  286  	if (!io_addr)
edae1f06c2cda41 Kan Liang 2021-03-17  287  		return -ENOMEM;
edae1f06c2cda41 Kan Liang 2021-03-17  288  
b575fc0e33574f3 Zide Chen 2025-12-31 @289  	if (domain->global_init && domain->global_init(global.ctl))
b575fc0e33574f3 Zide Chen 2025-12-31 @290  		return -ENODEV;
b575fc0e33574f3 Zide Chen 2025-12-31  291  
edae1f06c2cda41 Kan Liang 2021-03-17  292  	/* Parsing Unit Discovery State */
edae1f06c2cda41 Kan Liang 2021-03-17  293  	for (i = 0; i < global.max_units; i++) {
edae1f06c2cda41 Kan Liang 2021-03-17  294  		memcpy_fromio(&unit, io_addr + (i + 1) * (global.stride * 8),
edae1f06c2cda41 Kan Liang 2021-03-17  295  			      sizeof(struct uncore_unit_discovery));
edae1f06c2cda41 Kan Liang 2021-03-17  296  
edae1f06c2cda41 Kan Liang 2021-03-17  297  		if (uncore_discovery_invalid_unit(unit))
edae1f06c2cda41 Kan Liang 2021-03-17  298  			continue;
edae1f06c2cda41 Kan Liang 2021-03-17  299  
edae1f06c2cda41 Kan Liang 2021-03-17  300  		if (unit.access_type >= UNCORE_ACCESS_MAX)
edae1f06c2cda41 Kan Liang 2021-03-17  301  			continue;
edae1f06c2cda41 Kan Liang 2021-03-17  302  
e75462f6c7eaa5a Zide Chen 2025-12-31  303  		if (uncore_ignore_unit(&unit, domain))
bd9514a4d5ec25b Kan Liang 2023-01-12  304  			continue;
bd9514a4d5ec25b Kan Liang 2023-01-12  305  
15a4bd51853b9c6 Kan Liang 2024-06-14  306  		uncore_insert_box_info(&unit, die);
edae1f06c2cda41 Kan Liang 2021-03-17  307  	}
edae1f06c2cda41 Kan Liang 2021-03-17  308  
edae1f06c2cda41 Kan Liang 2021-03-17  309  	*parsed = true;
edae1f06c2cda41 Kan Liang 2021-03-17  310  	iounmap(io_addr);
edae1f06c2cda41 Kan Liang 2021-03-17  311  	return 0;
edae1f06c2cda41 Kan Liang 2021-03-17  312  }
edae1f06c2cda41 Kan Liang 2021-03-17  313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
