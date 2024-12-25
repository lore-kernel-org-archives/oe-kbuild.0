Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D691BC3F
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Dec 2024 22:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735167401; cv=none; b=T1kh7bQYf+rZ7L7lsCmrtXFMLHijrUd4nP+erzpqs/q13MiXv0aV6zWY+pZiF/KdZGPevFR5lZ+GYKSEKcldaL1QchDUmECdyO5W2fSbDw95QhGy4UO/qa/nxj/PrwfYO2vf7nIimqsC1a4LSWNArKeiaZrLrR6JaUEC5FQ+jFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735167401; c=relaxed/simple;
	bh=5m2swc4dR8KLv8u4B1jYydmui7yr/2peXv9m9o8wgZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RGddTEDwoIUpXS70w5/rJrHKmQRhNe2YXsxgCnJQtOMlQlGkedkDfrZ+PluSj6g96xqlA6GtbCy317VetISo5L4GtPueRb+K6+l+mjggzihsL/eqByqP6dISfKGzlFW3bAk1mLb4fSWhz/K/5AHoY3yKA5n8+04Z0fD9FFe68/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGSsLfco; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGSsLfco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735167398; x=1766703398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5m2swc4dR8KLv8u4B1jYydmui7yr/2peXv9m9o8wgZ0=;
  b=jGSsLfcoEfA8vd8RZgTlG/kPmjct2A7OgnD2e2Gvy5JXwmP1BeD3rfTW
   JeS0XATDmGw/mQ0ASynG49FE0YFPyhD5higJWK5HbUmCkHpeAeBG2kiQm
   5OlUSsoNgIRwuBEpz9TekaUKJ1WdLidMbWDVXozZRksbtc6dhqjgxZxEB
   sC0XwGYOoB4/678UiN3/AX6gG0WtiCMqbEQwrVDis4+GMQMEHcx2eKuwP
   8Eh9/cpVvSpbizhDS2x2H7OQ644NTuJom2swEQhTk7L7n6fiJrEwUIM9a
   6zCwE9Dxwew8kQffKV/W+duZCx5tDUvzhKrOS0EFIMlYLgUzq2ql/uPxS
   A==;
X-CSE-ConnectionGUID: OGwntAHoQJySkF708eHDfw==
X-CSE-MsgGUID: QMBxGR9WRLObuXKgyLAxWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35627373"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35627373"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 14:56:38 -0800
X-CSE-ConnectionGUID: EiSk4KSVSQqMPNO/4tjaGA==
X-CSE-MsgGUID: bd4nZXXlTJmTKc5oAVngVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130776165"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Dec 2024 14:56:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQaIr-0002Cg-38;
	Wed, 25 Dec 2024 22:56:33 +0000
Date: Thu, 26 Dec 2024 06:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 1662/1662] arch/loongarch/kernel/smp.c:292:6-9:
 WARNING: Unsigned expression compared with zero: cpu < 0
Message-ID: <202412260650.f6qSIlDO-lkp@intel.com>
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
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   17d734cf11b0235f16580f53a6cb52660a38c77d
commit: 083374f2b20d03f184ce6430fea68d64de4a05a5 [1662/1662] LoongArch: Fix cpu hotplug issue
:::::: branch date: 14 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-r052-20241226 (https://download.01.org/0day-ci/archive/20241226/202412260650.f6qSIlDO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412260650.f6qSIlDO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/smp.c:292:6-9: WARNING: Unsigned expression compared with zero: cpu < 0

vim +292 arch/loongarch/kernel/smp.c

c79c0a45da4cfa Bibo Mao    2024-03-25  276  
88d4d957edc707 Binbin Zhou 2022-12-10  277  static void __init fdt_smp_setup(void)
88d4d957edc707 Binbin Zhou 2022-12-10  278  {
88d4d957edc707 Binbin Zhou 2022-12-10  279  #ifdef CONFIG_OF
88d4d957edc707 Binbin Zhou 2022-12-10  280  	unsigned int cpu, cpuid;
88d4d957edc707 Binbin Zhou 2022-12-10  281  	struct device_node *node = NULL;
88d4d957edc707 Binbin Zhou 2022-12-10  282  
88d4d957edc707 Binbin Zhou 2022-12-10  283  	for_each_of_cpu_node(node) {
88d4d957edc707 Binbin Zhou 2022-12-10  284  		if (!of_device_is_available(node))
88d4d957edc707 Binbin Zhou 2022-12-10  285  			continue;
88d4d957edc707 Binbin Zhou 2022-12-10  286  
88d4d957edc707 Binbin Zhou 2022-12-10  287  		cpuid = of_get_cpu_hwid(node, 0);
88d4d957edc707 Binbin Zhou 2022-12-10  288  		if (cpuid >= nr_cpu_ids)
88d4d957edc707 Binbin Zhou 2022-12-10  289  			continue;
88d4d957edc707 Binbin Zhou 2022-12-10  290  
083374f2b20d03 Xianglai Li 2024-10-28  291  		cpu = topo_add_cpu(cpuid);
083374f2b20d03 Xianglai Li 2024-10-28 @292  		if (cpu < 0)
083374f2b20d03 Xianglai Li 2024-10-28  293  			continue;
88d4d957edc707 Binbin Zhou 2022-12-10  294  
88d4d957edc707 Binbin Zhou 2022-12-10  295  		num_processors++;
88d4d957edc707 Binbin Zhou 2022-12-10  296  		set_cpu_possible(cpu, true);
88d4d957edc707 Binbin Zhou 2022-12-10  297  		set_cpu_present(cpu, true);
88d4d957edc707 Binbin Zhou 2022-12-10  298  		__cpu_number_map[cpuid] = cpu;
88d4d957edc707 Binbin Zhou 2022-12-10  299  		__cpu_logical_map[cpu] = cpuid;
0812d278e7ec00 Jiaxun Yang 2024-07-29  300  
083374f2b20d03 Xianglai Li 2024-10-28  301  		early_numa_add_cpu(cpuid, 0);
0812d278e7ec00 Jiaxun Yang 2024-07-29  302  		set_cpuid_to_node(cpuid, 0);
88d4d957edc707 Binbin Zhou 2022-12-10  303  	}
88d4d957edc707 Binbin Zhou 2022-12-10  304  
88d4d957edc707 Binbin Zhou 2022-12-10  305  	loongson_sysconf.nr_cpus = num_processors;
872b368b228260 Huacai Chen 2023-06-29  306  	set_bit(0, &(loongson_sysconf.cores_io_master));
88d4d957edc707 Binbin Zhou 2022-12-10  307  #endif
88d4d957edc707 Binbin Zhou 2022-12-10  308  }
88d4d957edc707 Binbin Zhou 2022-12-10  309  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
