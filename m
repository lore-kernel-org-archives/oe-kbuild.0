Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B963FBEA8
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670505; cv=none; b=dTlJUU1Cqn9TbzNXuVn5n6vtmabE5iNqUOUi8rB6dpRSPFmlL5+5g7RVcd3L1Z2Iwnss412udl1o58TWQIszKrOgxg+qwqFnRFfxBcph45GQxuo+YqBDuaioOWzGjzzKkw3MOdbFq2ycrawicOfjtZRV4d3uaGsa2252fS4b2pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670505; c=relaxed/simple;
	bh=RKynpSy28PWCfyFrLdn0/wz4rApbiHohkX0hRHI3VLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LpHWAgP299CAp81bXL2GVoMteWtnBhGeVuk2RgvcZdTzdM+oc2w336iOPXip5xm0QPoWqcNbYExlAw1v4hFlWbl+yorie9/xWADsnYCpEUk/QI5ixFrW9ldNjtTiViWWiX2wxCRAS8ASvcOqKtprglxtfcR1hAD5CS2SUOtLKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiL2wszY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiL2wszY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778670501; x=1810206501;
  h=date:from:to:cc:subject:message-id;
  bh=RKynpSy28PWCfyFrLdn0/wz4rApbiHohkX0hRHI3VLs=;
  b=EiL2wszYF10E+gim/T8CE54Y9cLrA1bcxXMKOjzbqoNbqif6cuKXongi
   MSnABSW/jv9Oix0idZCrOy7yKp3QmyP68FjFi1T/evpM0dEt0upcTcaN0
   +4jq2TAFV13+EJd18Wdlrne2ycnUbX7RkXrjQyfqHt+YFShiS+JlNr9++
   i+2yIDcSxa3gQFE0wwukkyZzQMMqKXNX14av/m/LagY4ojAXKNmbK7g4G
   Z53mH3ajjqN+DOLYQgXAGqFQGbvE7lVnEYdTkrAooxwJgBZkx753vpqxL
   MIkxQwxNqJa/354117EROgMgV+As+jOnOLoZgd83DiSKuay9OOKvjEpSH
   Q==;
X-CSE-ConnectionGUID: 4t9hNuCWRK6uCa9CO+Kk9A==
X-CSE-MsgGUID: /IlKXzAyQHG66u8CpZQDZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79577482"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79577482"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 04:08:20 -0700
X-CSE-ConnectionGUID: YBSXbnRjRUyoLmLIV0p9Xg==
X-CSE-MsgGUID: eqC6wbv2SpSG43dE5Gg/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="238301775"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2026 04:08:19 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN7Ro-000000003yN-0huu;
	Wed, 13 May 2026 11:08:16 +0000
Date: Wed, 13 May 2026 19:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [deller-parisc:parisc-7.0-1 4/10]
 arch/parisc/kernel/drivers.c:928 qemu_header() error: strcpy()
 'boot_cpu_data.pdc.sys_model_name' too large for 'name_mpe' (81 vs 80)
Message-ID: <202605131913.dfb23qZE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-7.0-1
head:   1651d69443c3a5fc12f1dee1229d526e7af9020a
commit: 97cb9150ff2dd8bc87726a04045f1b3eda6f52b3 [4/10] parisc: Export model name for MPE/ix
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: parisc-randconfig-r072-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131913.dfb23qZE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605131913.dfb23qZE-lkp@intel.com/

smatch warnings:
arch/parisc/kernel/drivers.c:928 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large for 'name_mpe' (81 vs 80)

vim +928 arch/parisc/kernel/drivers.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  914  
a77ab0e7ce232a6 Helge Deller   2018-03-25  915  static __init void qemu_header(void)
a77ab0e7ce232a6 Helge Deller   2018-03-25  916  {
a77ab0e7ce232a6 Helge Deller   2018-03-25  917  	int num;
a77ab0e7ce232a6 Helge Deller   2018-03-25  918  	unsigned long *p;
97cb9150ff2dd8b Helge Deller   2026-01-28  919  	char name_mpe[80];
a77ab0e7ce232a6 Helge Deller   2018-03-25  920  
a77ab0e7ce232a6 Helge Deller   2018-03-25  921  	pr_info("--- cut here ---\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  922  	pr_info("/* AUTO-GENERATED HEADER FILE FOR SEABIOS FIRMWARE */\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  923  	pr_cont("/* generated with Linux kernel */\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  924  	pr_cont("/* search for PARISC_QEMU_MACHINE_HEADER in Linux */\n\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  925  
97cb9150ff2dd8b Helge Deller   2026-01-28  926  	pr_info("#define PARISC_MODEL     \"%s\"\n",
a77ab0e7ce232a6 Helge Deller   2018-03-25  927  			boot_cpu_data.pdc.sys_model_name);
97cb9150ff2dd8b Helge Deller   2026-01-28 @928  	strcpy(name_mpe, boot_cpu_data.pdc.sys_model_name);
97cb9150ff2dd8b Helge Deller   2026-01-28  929  	pdc_model_sysmodel(OS_ID_MPEXL, name_mpe);
97cb9150ff2dd8b Helge Deller   2026-01-28  930  	pr_info("#define PARISC_MODEL_MPE \"%s\"\n\n", name_mpe);
a77ab0e7ce232a6 Helge Deller   2018-03-25  931  
b137b9d60b8add5 Helge Deller   2023-08-31  932  	#define p ((unsigned long *)&boot_cpu_data.pdc.model)
a77ab0e7ce232a6 Helge Deller   2018-03-25  933  	pr_info("#define PARISC_PDC_MODEL 0x%lx, 0x%lx, 0x%lx, "
b63b4f1a79e6ad3 Helge Deller   2023-10-23  934  		"0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx\n\n",
b63b4f1a79e6ad3 Helge Deller   2023-10-23  935  		p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
a77ab0e7ce232a6 Helge Deller   2018-03-25  936  	#undef p
a77ab0e7ce232a6 Helge Deller   2018-03-25  937  
a77ab0e7ce232a6 Helge Deller   2018-03-25  938  	pr_info("#define PARISC_PDC_VERSION 0x%04lx\n\n",
a77ab0e7ce232a6 Helge Deller   2018-03-25  939  			boot_cpu_data.pdc.versions);
a77ab0e7ce232a6 Helge Deller   2018-03-25  940  
a77ab0e7ce232a6 Helge Deller   2018-03-25  941  	pr_info("#define PARISC_PDC_CPUID 0x%04lx\n\n",
a77ab0e7ce232a6 Helge Deller   2018-03-25  942  			boot_cpu_data.pdc.cpuid);
a77ab0e7ce232a6 Helge Deller   2018-03-25  943  
a77ab0e7ce232a6 Helge Deller   2018-03-25  944  	pr_info("#define PARISC_PDC_CAPABILITIES 0x%04lx\n\n",
a77ab0e7ce232a6 Helge Deller   2018-03-25  945  			boot_cpu_data.pdc.capabilities);
a77ab0e7ce232a6 Helge Deller   2018-03-25  946  
a77ab0e7ce232a6 Helge Deller   2018-03-25  947  	pr_info("#define PARISC_PDC_ENTRY_ORG 0x%04lx\n\n",
a77ab0e7ce232a6 Helge Deller   2018-03-25  948  #ifdef CONFIG_64BIT
a77ab0e7ce232a6 Helge Deller   2018-03-25  949  		(unsigned long)(PAGE0->mem_pdc_hi) << 32 |
a77ab0e7ce232a6 Helge Deller   2018-03-25  950  #endif
a77ab0e7ce232a6 Helge Deller   2018-03-25  951  		(unsigned long)PAGE0->mem_pdc);
a77ab0e7ce232a6 Helge Deller   2018-03-25  952  
a77ab0e7ce232a6 Helge Deller   2018-03-25  953  	pr_info("#define PARISC_PDC_CACHE_INFO");
a77ab0e7ce232a6 Helge Deller   2018-03-25  954  	p = (unsigned long *) &cache_info;
a77ab0e7ce232a6 Helge Deller   2018-03-25  955  	for (num = 0; num < sizeof(cache_info); num += sizeof(unsigned long)) {
a77ab0e7ce232a6 Helge Deller   2018-03-25  956  		if (((num % 5) == 0)) {
a77ab0e7ce232a6 Helge Deller   2018-03-25  957  			pr_cont(" \\\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  958  			pr_info("\t");
a77ab0e7ce232a6 Helge Deller   2018-03-25  959  		}
a77ab0e7ce232a6 Helge Deller   2018-03-25  960  		pr_cont("%s0x%04lx",
a77ab0e7ce232a6 Helge Deller   2018-03-25  961  			num?", ":"", *p++);
a77ab0e7ce232a6 Helge Deller   2018-03-25  962  	}
a77ab0e7ce232a6 Helge Deller   2018-03-25  963  	pr_cont("\n\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  964  }
a77ab0e7ce232a6 Helge Deller   2018-03-25  965  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
