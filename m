Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF5816DEB3
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732604179; cv=none; b=KkBbW9QLYeN7PgxQwwhxoDMNYGpjUQfLHVDdwqo+Bez0uqxVUEMyGsfu8vkpamAFaYLXWKXI8ugU7WmqSDMH4pBdX0yYd37VKBe9Qd8eWtJptiEJ6dSMbGNMN53IAQxTM5h/agLbYSQSMQXGswUJwWgVjVkv5GPy1/9IzwF61Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732604179; c=relaxed/simple;
	bh=UIbdpEEk7A5kUmHGrXlB/ODUkDVdWp15a+pZF5LiA28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6ZaMkkgl+zbSZPGyysI/dJsaOHHygba2tnZh7f/YtyPhujF73mz9ifdbyLiLKmsdQSG7EXhwXVYGUOlgb0XYrrsWw0UY0XClPtHg5OOr55KucEjus6oJewGKY3p/sWciqAv71yZvwUhqAQgxSBMLuqqM0YlgsjBIWYMgHuyc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+M2b7PN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+M2b7PN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732604178; x=1764140178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UIbdpEEk7A5kUmHGrXlB/ODUkDVdWp15a+pZF5LiA28=;
  b=n+M2b7PNTl/WD98ITawRJZY+rLOMasJ4/4CZm/1AiaDHljhGO7ylR+/x
   HG2aOhFbY14UlJh9T5DwhY0QtU/s6tcU9/1ueNTikKbAbWfxWDcOZ+Vhr
   CvfPH0RAvIYkGbmcvw44RNeJ4FTOzGFeRCcSbZkptUf/10XX5cmDNiWdx
   IU1WUbyFBffTAvY7uiJPasc2t+Rzng/yJJ+Zei/X+dvBnQnTryvxxoT1Q
   6BO5DPuBMahlAx4/RSrXER3IYPJ+4r4FWH7N0k2eaBH/TKztlRQqmxpBU
   BJN1gLQ2nmBV7ZwVTaTdev7LHPWqSOMN8khhJXrQXD5DNE0Rz8ibwcoCS
   g==;
X-CSE-ConnectionGUID: Vufi6mksSLiXdFw41rn7Tg==
X-CSE-MsgGUID: EoPHXSNMRnCAo2POzLKOlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="44130232"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="44130232"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 22:55:47 -0800
X-CSE-ConnectionGUID: y1ww8i49S/q149ITtfX1AA==
X-CSE-MsgGUID: ecwFE4vVR3O894wlrgNAxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96582078"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 22:55:43 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFpU5-00078V-0A;
	Tue, 26 Nov 2024 06:55:41 +0000
Date: Tue, 26 Nov 2024 14:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/mm/init.c:1110 create_linear_mapping_page_table() warn:
 iterator 'i' not incremented
Message-ID: <202411261412.m7P2i09P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: 8589e346bbb679cf7a4b564f75295d94250058f0 riscv: Move the linear mapping creation in its own function
date:   1 year, 7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 7 months ago
config: riscv-randconfig-r073-20241111 (https://download.01.org/0day-ci/archive/20241126/202411261412.m7P2i09P-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411261412.m7P2i09P-lkp@intel.com/

smatch warnings:
arch/riscv/mm/init.c:1110 create_linear_mapping_page_table() warn: iterator 'i' not incremented

vim +/i +1110 arch/riscv/mm/init.c

8589e346bbb679 Alexandre Ghiti 2023-03-24  1103  
8589e346bbb679 Alexandre Ghiti 2023-03-24  1104  static void __init create_linear_mapping_page_table(void)
8589e346bbb679 Alexandre Ghiti 2023-03-24  1105  {
8589e346bbb679 Alexandre Ghiti 2023-03-24  1106  	phys_addr_t start, end;
8589e346bbb679 Alexandre Ghiti 2023-03-24  1107  	u64 i;
671f9a3e2e24cd Anup Patel      2019-06-28  1108  
2bfc6cd81bd17e Alexandre Ghiti 2021-04-11  1109  	/* Map all memory banks in the linear mapping */
b10d6bca87204c Mike Rapoport   2020-10-13 @1110  	for_each_mem_range(i, &start, &end) {
671f9a3e2e24cd Anup Patel      2019-06-28  1111  		if (start >= end)
671f9a3e2e24cd Anup Patel      2019-06-28  1112  			break;
671f9a3e2e24cd Anup Patel      2019-06-28  1113  		if (start <= __pa(PAGE_OFFSET) &&
671f9a3e2e24cd Anup Patel      2019-06-28  1114  		    __pa(PAGE_OFFSET) < end)
671f9a3e2e24cd Anup Patel      2019-06-28  1115  			start = __pa(PAGE_OFFSET);
c99127c452484a Alexandre Ghiti 2021-06-29  1116  		if (end >= __pa(PAGE_OFFSET) + memory_limit)
c99127c452484a Alexandre Ghiti 2021-06-29  1117  			end = __pa(PAGE_OFFSET) + memory_limit;
671f9a3e2e24cd Anup Patel      2019-06-28  1118  
8589e346bbb679 Alexandre Ghiti 2023-03-24  1119  		create_linear_mapping_range(start, end);
671f9a3e2e24cd Anup Patel      2019-06-28  1120  	}
6f1e9e946f0bc3 Anup Patel      2019-02-13  1121  }
f2c17aabc917e1 Anup Patel      2019-01-07  1122  

:::::: The code at line 1110 was first introduced by commit
:::::: b10d6bca87204cdafd0cd7aaa837ad30b4eb8c20 arch, drivers: replace for_each_membock() with for_each_mem_range()

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
