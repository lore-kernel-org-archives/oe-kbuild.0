Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E802673AA
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 22:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771022391; cv=none; b=ufnHEJphJKxMCPrbUycJo3YLdf1qXtKPqhzo1xIIXzjmgUtAs/wseuorSBRnNIBVtvuUoy/ISyIkwCbPsF2n6P5BzTCifw00EfXJjxYRfi6/V9BzmMusDrEIWm9iq6pp+uA3UsvsJdGpSxw2UUkqJUz2BFEXcpDmwM7s6CXFdW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771022391; c=relaxed/simple;
	bh=xmkJGIvKt7JgkaJ0Zvb9Ik91zkc9EyW6M2KNKL5jAN0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S6Waz6ASZjMU5LaHCnJhNqJBbqN5EtL6OMKTbXvTijP6g91HVcE2DzFmbi6cBi+kpzSez90wSpmS8QDp0Laj6fKIv/rO7z+9WvGHnKcf6bolKxHO4Z6aGcuJA//+QITJu0UQmur7koezjlxoLfM3glKQM+3/fYjvfiw82Y1fGA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmVIQJmf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmVIQJmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771022390; x=1802558390;
  h=date:from:to:cc:subject:message-id;
  bh=xmkJGIvKt7JgkaJ0Zvb9Ik91zkc9EyW6M2KNKL5jAN0=;
  b=HmVIQJmfExapUFjzdAbVv9TNG61/1FPGOkFmR2phZM6HNC4Wd3X5/pUY
   qEKGLyh8Qz3tiTAaQv8VLEp9/36eJWeZp936AYPf1NGnTAwraWxu2i+gy
   zc9JH27zWVaWF9Ge6O06c2OjAX0l8AQAX55+NKkK+WqHJwWZyyO53OXjF
   O5YDJI2hsJ+uh7vWO+ENFTTJiZVfZnkYG+CqTv9qZg2g+VdKvpALTKOyM
   OZBtMV0dAUf+yt61XUA1KAfpOAw1rag2941xbRVhVayJvPzLxj5conyiI
   HFwCKtVyXkOyxH7cFpvLvxGAEWFZNsKnA82F3Om+mOlRsGECyWzvRgfOA
   g==;
X-CSE-ConnectionGUID: QfxtsT8dS++saBv2NH2LUg==
X-CSE-MsgGUID: LxqxOOecSF6QaNDoeEPcgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="59781305"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="59781305"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 14:39:50 -0800
X-CSE-ConnectionGUID: dlUK7KpzRXu8QW3ES1dwQw==
X-CSE-MsgGUID: u/GS586iSb2+KStIWMM3nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="217166787"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2026 14:39:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr1pC-00000000vs0-1k0z;
	Fri, 13 Feb 2026 22:39:46 +0000
Date: Sat, 14 Feb 2026 06:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/x86/events/intel/uncore_discovery.c:290:2-8: ERROR:
 missing iounmap; ioremap on line 285 and execution via conditional on line
 289
Message-ID: <202602140613.DQfDJYD4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Zide Chen <zide.chen@intel.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Dapeng Mi <dapeng1.mi@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44331bd6a6107a33f8082521b227ffa4ec063a40
commit: b575fc0e33574f3a476b68057e340ebe32d7b750 perf/x86/intel/uncore: Add domain global init callback
date:   5 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-104-20260213 (https://download.01.org/0day-ci/archive/20260214/202602140613.DQfDJYD4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602140613.DQfDJYD4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/events/intel/uncore_discovery.c:290:2-8: ERROR: missing iounmap; ioremap on line 285 and execution via conditional on line 289

vim +290 arch/x86/events/intel/uncore_discovery.c

bd9514a4d5ec25 Kan Liang 2023-01-12  259  
e75462f6c7eaa5 Zide Chen 2025-12-31  260  static int __parse_discovery_table(struct uncore_discovery_domain *domain,
e75462f6c7eaa5 Zide Chen 2025-12-31  261  				   resource_size_t addr, int die, bool *parsed)
edae1f06c2cda4 Kan Liang 2021-03-17  262  {
edae1f06c2cda4 Kan Liang 2021-03-17  263  	struct uncore_global_discovery global;
edae1f06c2cda4 Kan Liang 2021-03-17  264  	struct uncore_unit_discovery unit;
edae1f06c2cda4 Kan Liang 2021-03-17  265  	void __iomem *io_addr;
edae1f06c2cda4 Kan Liang 2021-03-17  266  	unsigned long size;
edae1f06c2cda4 Kan Liang 2021-03-17  267  	int i;
edae1f06c2cda4 Kan Liang 2021-03-17  268  
edae1f06c2cda4 Kan Liang 2021-03-17  269  	size = UNCORE_DISCOVERY_GLOBAL_MAP_SIZE;
edae1f06c2cda4 Kan Liang 2021-03-17  270  	io_addr = ioremap(addr, size);
edae1f06c2cda4 Kan Liang 2021-03-17  271  	if (!io_addr)
edae1f06c2cda4 Kan Liang 2021-03-17  272  		return -ENOMEM;
edae1f06c2cda4 Kan Liang 2021-03-17  273  
edae1f06c2cda4 Kan Liang 2021-03-17  274  	/* Read Global Discovery State */
edae1f06c2cda4 Kan Liang 2021-03-17  275  	memcpy_fromio(&global, io_addr, sizeof(struct uncore_global_discovery));
edae1f06c2cda4 Kan Liang 2021-03-17  276  	if (uncore_discovery_invalid_unit(global)) {
edae1f06c2cda4 Kan Liang 2021-03-17  277  		pr_info("Invalid Global Discovery State: 0x%llx 0x%llx 0x%llx\n",
edae1f06c2cda4 Kan Liang 2021-03-17  278  			global.table1, global.ctl, global.table3);
edae1f06c2cda4 Kan Liang 2021-03-17  279  		iounmap(io_addr);
edae1f06c2cda4 Kan Liang 2021-03-17  280  		return -EINVAL;
edae1f06c2cda4 Kan Liang 2021-03-17  281  	}
edae1f06c2cda4 Kan Liang 2021-03-17  282  	iounmap(io_addr);
edae1f06c2cda4 Kan Liang 2021-03-17  283  
edae1f06c2cda4 Kan Liang 2021-03-17  284  	size = (1 + global.max_units) * global.stride * 8;
edae1f06c2cda4 Kan Liang 2021-03-17 @285  	io_addr = ioremap(addr, size);
edae1f06c2cda4 Kan Liang 2021-03-17  286  	if (!io_addr)
edae1f06c2cda4 Kan Liang 2021-03-17  287  		return -ENOMEM;
edae1f06c2cda4 Kan Liang 2021-03-17  288  
b575fc0e33574f Zide Chen 2025-12-31 @289  	if (domain->global_init && domain->global_init(global.ctl))
b575fc0e33574f Zide Chen 2025-12-31 @290  		return -ENODEV;
b575fc0e33574f Zide Chen 2025-12-31  291  
edae1f06c2cda4 Kan Liang 2021-03-17  292  	/* Parsing Unit Discovery State */
edae1f06c2cda4 Kan Liang 2021-03-17  293  	for (i = 0; i < global.max_units; i++) {
edae1f06c2cda4 Kan Liang 2021-03-17  294  		memcpy_fromio(&unit, io_addr + (i + 1) * (global.stride * 8),
edae1f06c2cda4 Kan Liang 2021-03-17  295  			      sizeof(struct uncore_unit_discovery));
edae1f06c2cda4 Kan Liang 2021-03-17  296  
edae1f06c2cda4 Kan Liang 2021-03-17  297  		if (uncore_discovery_invalid_unit(unit))
edae1f06c2cda4 Kan Liang 2021-03-17  298  			continue;
edae1f06c2cda4 Kan Liang 2021-03-17  299  
edae1f06c2cda4 Kan Liang 2021-03-17  300  		if (unit.access_type >= UNCORE_ACCESS_MAX)
edae1f06c2cda4 Kan Liang 2021-03-17  301  			continue;
edae1f06c2cda4 Kan Liang 2021-03-17  302  
e75462f6c7eaa5 Zide Chen 2025-12-31  303  		if (uncore_ignore_unit(&unit, domain))
bd9514a4d5ec25 Kan Liang 2023-01-12  304  			continue;
bd9514a4d5ec25 Kan Liang 2023-01-12  305  
15a4bd51853b9c Kan Liang 2024-06-14  306  		uncore_insert_box_info(&unit, die);
edae1f06c2cda4 Kan Liang 2021-03-17  307  	}
edae1f06c2cda4 Kan Liang 2021-03-17  308  
edae1f06c2cda4 Kan Liang 2021-03-17  309  	*parsed = true;
edae1f06c2cda4 Kan Liang 2021-03-17  310  	iounmap(io_addr);
edae1f06c2cda4 Kan Liang 2021-03-17  311  	return 0;
edae1f06c2cda4 Kan Liang 2021-03-17  312  }
edae1f06c2cda4 Kan Liang 2021-03-17  313  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
