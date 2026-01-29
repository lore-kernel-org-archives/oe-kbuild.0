Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3A33F8B7
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 21:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769720779; cv=none; b=lMSs/lzV2w6Vr/QHQF+hrm2Mc1vhdOi2v6UQzyuQCj9YkBLdMN2j44BRxVSjIde+f9Qro8Ar3SQ6G/hHIHJYfUPzpygVsW+bNF4wWteR3PjJPtkBC25zEfzjy08wuHSHNjCPTqLsnF+l/7Umpc/oXM3PnqpwgNMFO9GQr1U35aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769720779; c=relaxed/simple;
	bh=1jskjHp3NVWk+xqqQWgVousTGFVW7TpdlFv62Z3sz7Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j0WJQyP/YMQcMaKh09+9FBQseOETk/Gx1mhbccm0ryu+yB5e2IAFmo0jLmcDbi69Bg3uS5e369WMl999DEZdayGpmrb0yaDsvI3hjJcE+kbn8pHs9/P2wNCA2sLeo11zDnPJCNC8tj6g66ezUNqpvXCQejpMJdJ5kXQqN+WUq5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObhJTw0j; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObhJTw0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769720777; x=1801256777;
  h=date:from:to:cc:subject:message-id;
  bh=1jskjHp3NVWk+xqqQWgVousTGFVW7TpdlFv62Z3sz7Q=;
  b=ObhJTw0jCTBNPaRAvonT7KsxAq2hNJrFQPXUmNzh+5Hdyldl/RLyjT6F
   14/gOEzsJpAnoDB0JJtVgGaWDFFUmDkicesgDU05o+IT2RE9Ce8U5sDYB
   JQ3QF1biz2hrAhh1u2b2m80edBIA3H0ZxsXbjs1vLmQfJNpo/+xo4AbTY
   Keb1+aKA7uSTy+7AHfQIpXsYkUWm+AE2o7BDYFtbC2ngiJfp+OAOWMdRt
   tqP/M6emFaO6pZZ/Y7feySRTuJH/Gn8SnOjVga0LnG/jb5QOpbJk826vi
   kPJ0Cw1kJZQEvO87PT+PZ1UmzdZGZolBfhWGXeQ89vGo01Gj8mERK4hnr
   g==;
X-CSE-ConnectionGUID: tqBUHEphR4eBDrIsROJJgA==
X-CSE-MsgGUID: cSHkw2CKQLKsxVjZG+lNrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="93630568"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="93630568"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 13:06:16 -0800
X-CSE-ConnectionGUID: RMdLNYiOSN20n7Ed5ZV4Wg==
X-CSE-MsgGUID: NwOLPD7YQhaSFscO1uPAfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="213637728"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Jan 2026 13:06:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlZDQ-00000000bsU-1jSi;
	Thu, 29 Jan 2026 21:06:12 +0000
Date: Fri, 30 Jan 2026 05:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9772/10718]
 arch/parisc/kernel/drivers.c:928 qemu_header() error: strcpy()
 'boot_cpu_data.pdc.sys_model_name' too large for 'name_mpe' (81 vs 64)
Message-ID: <202601300419.4aPdW3N6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33a647c659ffa5bdb94abc345c8c86768ff96215
commit: fd4444b2c07a64576d4bf10f7c58d79882ef3ab8 [9772/10718] parisc: Export model name for MPE/ix
:::::: branch date: 4 hours ago
:::::: commit date: 32 hours ago
config: parisc-randconfig-r071-20260130 (https://download.01.org/0day-ci/archive/20260130/202601300419.4aPdW3N6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601300419.4aPdW3N6-lkp@intel.com/

smatch warnings:
arch/parisc/kernel/drivers.c:928 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large for 'name_mpe' (81 vs 64)

vim +928 arch/parisc/kernel/drivers.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  914  
a77ab0e7ce232a Helge Deller   2018-03-25  915  static __init void qemu_header(void)
a77ab0e7ce232a Helge Deller   2018-03-25  916  {
a77ab0e7ce232a Helge Deller   2018-03-25  917  	int num;
a77ab0e7ce232a Helge Deller   2018-03-25  918  	unsigned long *p;
fd4444b2c07a64 Helge Deller   2026-01-28  919  	char name_mpe[64];
a77ab0e7ce232a Helge Deller   2018-03-25  920  
a77ab0e7ce232a Helge Deller   2018-03-25  921  	pr_info("--- cut here ---\n");
a77ab0e7ce232a Helge Deller   2018-03-25  922  	pr_info("/* AUTO-GENERATED HEADER FILE FOR SEABIOS FIRMWARE */\n");
a77ab0e7ce232a Helge Deller   2018-03-25  923  	pr_cont("/* generated with Linux kernel */\n");
a77ab0e7ce232a Helge Deller   2018-03-25  924  	pr_cont("/* search for PARISC_QEMU_MACHINE_HEADER in Linux */\n\n");
a77ab0e7ce232a Helge Deller   2018-03-25  925  
fd4444b2c07a64 Helge Deller   2026-01-28  926  	pr_info("#define PARISC_MODEL     \"%s\"\n",
a77ab0e7ce232a Helge Deller   2018-03-25  927  			boot_cpu_data.pdc.sys_model_name);
fd4444b2c07a64 Helge Deller   2026-01-28 @928  	strcpy(name_mpe, boot_cpu_data.pdc.sys_model_name);
fd4444b2c07a64 Helge Deller   2026-01-28  929          pdc_model_sysmodel(OS_ID_MPEXL, name_mpe);
fd4444b2c07a64 Helge Deller   2026-01-28  930  	pr_info("#define PARISC_MODEL_MPE \"%s\"\n\n",name_mpe);
a77ab0e7ce232a Helge Deller   2018-03-25  931  
b137b9d60b8add Helge Deller   2023-08-31  932  	#define p ((unsigned long *)&boot_cpu_data.pdc.model)
a77ab0e7ce232a Helge Deller   2018-03-25  933  	pr_info("#define PARISC_PDC_MODEL 0x%lx, 0x%lx, 0x%lx, "
b63b4f1a79e6ad Helge Deller   2023-10-23  934  		"0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx\n\n",
b63b4f1a79e6ad Helge Deller   2023-10-23  935  		p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
a77ab0e7ce232a Helge Deller   2018-03-25  936  	#undef p
a77ab0e7ce232a Helge Deller   2018-03-25  937  
a77ab0e7ce232a Helge Deller   2018-03-25  938  	pr_info("#define PARISC_PDC_VERSION 0x%04lx\n\n",
a77ab0e7ce232a Helge Deller   2018-03-25  939  			boot_cpu_data.pdc.versions);
a77ab0e7ce232a Helge Deller   2018-03-25  940  
a77ab0e7ce232a Helge Deller   2018-03-25  941  	pr_info("#define PARISC_PDC_CPUID 0x%04lx\n\n",
a77ab0e7ce232a Helge Deller   2018-03-25  942  			boot_cpu_data.pdc.cpuid);
a77ab0e7ce232a Helge Deller   2018-03-25  943  
a77ab0e7ce232a Helge Deller   2018-03-25  944  	pr_info("#define PARISC_PDC_CAPABILITIES 0x%04lx\n\n",
a77ab0e7ce232a Helge Deller   2018-03-25  945  			boot_cpu_data.pdc.capabilities);
a77ab0e7ce232a Helge Deller   2018-03-25  946  
a77ab0e7ce232a Helge Deller   2018-03-25  947  	pr_info("#define PARISC_PDC_ENTRY_ORG 0x%04lx\n\n",
a77ab0e7ce232a Helge Deller   2018-03-25  948  #ifdef CONFIG_64BIT
a77ab0e7ce232a Helge Deller   2018-03-25  949  		(unsigned long)(PAGE0->mem_pdc_hi) << 32 |
a77ab0e7ce232a Helge Deller   2018-03-25  950  #endif
a77ab0e7ce232a Helge Deller   2018-03-25  951  		(unsigned long)PAGE0->mem_pdc);
a77ab0e7ce232a Helge Deller   2018-03-25  952  
a77ab0e7ce232a Helge Deller   2018-03-25  953  	pr_info("#define PARISC_PDC_CACHE_INFO");
a77ab0e7ce232a Helge Deller   2018-03-25  954  	p = (unsigned long *) &cache_info;
a77ab0e7ce232a Helge Deller   2018-03-25  955  	for (num = 0; num < sizeof(cache_info); num += sizeof(unsigned long)) {
a77ab0e7ce232a Helge Deller   2018-03-25  956  		if (((num % 5) == 0)) {
a77ab0e7ce232a Helge Deller   2018-03-25  957  			pr_cont(" \\\n");
a77ab0e7ce232a Helge Deller   2018-03-25  958  			pr_info("\t");
a77ab0e7ce232a Helge Deller   2018-03-25  959  		}
a77ab0e7ce232a Helge Deller   2018-03-25  960  		pr_cont("%s0x%04lx",
a77ab0e7ce232a Helge Deller   2018-03-25  961  			num?", ":"", *p++);
a77ab0e7ce232a Helge Deller   2018-03-25  962  	}
a77ab0e7ce232a Helge Deller   2018-03-25  963  	pr_cont("\n\n");
a77ab0e7ce232a Helge Deller   2018-03-25  964  }
a77ab0e7ce232a Helge Deller   2018-03-25  965  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
