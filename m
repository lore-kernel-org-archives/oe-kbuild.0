Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9517F30667
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 23:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGWkYGAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699398578; x=1730934578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNEMU6J80Up9KCiY7KL6yT1f1Mm3XVQOkbfQ3PbJTNQ=;
  b=WGWkYGAsahLJgiO4MUgHARPnHyz3fUrDM6eT6Jz4eT79iI/dtepC1Yia
   Zod37NM4zqG+AvbeJ9RVLCPcZsuK9rYPBFopFbv1rACoUQfedSkCrc+ov
   ZAdqhx2w77tc4K2CT5kmofDEh71+7mywTAHCXV8HYNv1vea73NsNOIAaJ
   oUsNHlulvjfXUbNiATQsJbSolZ5mjDV0r8iYxVoEGDhxcSLG6evzgpfu9
   8n+RsrFRB3h25dXM6TB1NrVaMPO2+VFjdcVO0C2iaAeY6PQrAEKMFrl+K
   UPrAchIgcunRt5SoqhaQvyByNZ/PTfovReOw2q1oioh4W0P0SgNXCBIw2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="368978838"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="368978838"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 15:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762870727"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="762870727"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Nov 2023 15:09:36 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0VCQ-0007Ti-01;
	Tue, 07 Nov 2023 23:09:34 +0000
Date: Wed, 8 Nov 2023 07:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/kernel/smp-cps.c:165:37: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202311080604.eRPO1voN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13d88ac54ddd1011b6e94443958e798aa06eb835
commit: fea8826d5fdc4ff5c93e883a738597129614039c MIPS: smp-cps: Don't rely on CP0_CMGCRBASE
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: mips-randconfig-r122-20231108 (https://download.01.org/0day-ci/archive/20231108/202311080604.eRPO1voN-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080604.eRPO1voN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311080604.eRPO1voN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/mips/kernel/smp-cps.c:165:37: sparse: sparse: cast removes address space '__iomem' of expression
   arch/mips/kernel/smp-cps.c: note: in included file (through arch/mips/include/asm/mips-cps.h, arch/mips/include/asm/smp-ops.h, arch/mips/include/asm/smp.h, ...):
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:292:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:292:1: sparse:     got void [noderef] __iomem *
   arch/mips/kernel/smp-cps.c: note: in included file (through arch/mips/include/asm/mips-cps.h, arch/mips/include/asm/smp-ops.h, arch/mips/include/asm/smp.h, ...):
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:149:1: sparse:     got void [noderef] __iomem *
   arch/mips/kernel/smp-cps.c: note: in included file (through arch/mips/include/asm/mips-cps.h, arch/mips/include/asm/smp-ops.h, arch/mips/include/asm/smp.h, ...):
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:152:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     expected void *
   arch/mips/include/asm/mips-cm.h:152:1: sparse:     got void [noderef] __iomem *
   arch/mips/include/asm/mips-cm.h:131:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@

vim +/__iomem +165 arch/mips/kernel/smp-cps.c

0ee958e102b62b4 Paul Burton 2014-01-15  118  
0ee958e102b62b4 Paul Burton 2014-01-15  119  static void __init cps_prepare_cpus(unsigned int max_cpus)
0ee958e102b62b4 Paul Burton 2014-01-15  120  {
5c399f6eb2c3911 Paul Burton 2014-04-14  121  	unsigned ncores, core_vpes, c, cca;
1ec9dd80bedc208 Paul Burton 2017-08-12  122  	bool cca_unsuitable, cores_limited;
0f4d3d1155d9a5e Paul Burton 2014-04-14  123  	u32 *entry_code;
245a7868d2f2e54 Paul Burton 2014-04-14  124  
0ee958e102b62b4 Paul Burton 2014-01-15  125  	mips_mt_set_cpuoptions();
245a7868d2f2e54 Paul Burton 2014-04-14  126  
5c399f6eb2c3911 Paul Burton 2014-04-14  127  	/* Detect whether the CCA is unsuited to multi-core SMP */
5c399f6eb2c3911 Paul Burton 2014-04-14  128  	cca = read_c0_config() & CONF_CM_CMASK;
5c399f6eb2c3911 Paul Burton 2014-04-14  129  	switch (cca) {
5c399f6eb2c3911 Paul Burton 2014-04-14  130  	case 0x4: /* CWBE */
5c399f6eb2c3911 Paul Burton 2014-04-14  131  	case 0x5: /* CWB */
5c399f6eb2c3911 Paul Burton 2014-04-14  132  		/* The CCA is coherent, multi-core is fine */
5c399f6eb2c3911 Paul Burton 2014-04-14  133  		cca_unsuitable = false;
5c399f6eb2c3911 Paul Burton 2014-04-14  134  		break;
5c399f6eb2c3911 Paul Burton 2014-04-14  135  
5c399f6eb2c3911 Paul Burton 2014-04-14  136  	default:
5c399f6eb2c3911 Paul Burton 2014-04-14  137  		/* CCA is not coherent, multi-core is not usable */
5c399f6eb2c3911 Paul Burton 2014-04-14  138  		cca_unsuitable = true;
5c399f6eb2c3911 Paul Burton 2014-04-14  139  	}
5c399f6eb2c3911 Paul Burton 2014-04-14  140  
5c399f6eb2c3911 Paul Burton 2014-04-14  141  	/* Warn the user if the CCA prevents multi-core */
1ec9dd80bedc208 Paul Burton 2017-08-12  142  	cores_limited = false;
1ec9dd80bedc208 Paul Burton 2017-08-12  143  	if (cca_unsuitable || cpu_has_dc_aliases) {
5c399f6eb2c3911 Paul Burton 2014-04-14  144  		for_each_present_cpu(c) {
1ec9dd80bedc208 Paul Burton 2017-08-12  145  			if (cpus_are_siblings(smp_processor_id(), c))
1ec9dd80bedc208 Paul Burton 2017-08-12  146  				continue;
1ec9dd80bedc208 Paul Burton 2017-08-12  147  
5c399f6eb2c3911 Paul Burton 2014-04-14  148  			set_cpu_present(c, false);
1ec9dd80bedc208 Paul Burton 2017-08-12  149  			cores_limited = true;
5c399f6eb2c3911 Paul Burton 2014-04-14  150  		}
5c399f6eb2c3911 Paul Burton 2014-04-14  151  	}
1ec9dd80bedc208 Paul Burton 2017-08-12  152  	if (cores_limited)
1ec9dd80bedc208 Paul Burton 2017-08-12  153  		pr_warn("Using only one core due to %s%s%s\n",
1ec9dd80bedc208 Paul Burton 2017-08-12  154  			cca_unsuitable ? "unsuitable CCA" : "",
1ec9dd80bedc208 Paul Burton 2017-08-12  155  			(cca_unsuitable && cpu_has_dc_aliases) ? " & " : "",
1ec9dd80bedc208 Paul Burton 2017-08-12  156  			cpu_has_dc_aliases ? "dcache aliasing" : "");
5c399f6eb2c3911 Paul Burton 2014-04-14  157  
0155a06529d4c84 Paul Burton 2014-04-16  158  	/*
0155a06529d4c84 Paul Burton 2014-04-16  159  	 * Patch the start of mips_cps_core_entry to provide:
0155a06529d4c84 Paul Burton 2014-04-16  160  	 *
0155a06529d4c84 Paul Burton 2014-04-16  161  	 * s0 = kseg0 CCA
0155a06529d4c84 Paul Burton 2014-04-16  162  	 */
0f4d3d1155d9a5e Paul Burton 2014-04-14  163  	entry_code = (u32 *)&mips_cps_core_entry;
0155a06529d4c84 Paul Burton 2014-04-16  164  	uasm_i_addiu(&entry_code, 16, 0, cca);
fea8826d5fdc4ff Jiaxun Yang 2023-02-27 @165  	UASM_i_LA(&entry_code, 17, (long)mips_gcr_base);
fea8826d5fdc4ff Jiaxun Yang 2023-02-27  166  	BUG_ON((void *)entry_code > (void *)&mips_cps_core_entry_patch_end);
0fc0708a8a2e6ff Paul Burton 2014-07-09  167  	blast_dcache_range((unsigned long)&mips_cps_core_entry,
0fc0708a8a2e6ff Paul Burton 2014-07-09  168  			   (unsigned long)entry_code);
0fc0708a8a2e6ff Paul Burton 2014-07-09  169  	bc_wback_inv((unsigned long)&mips_cps_core_entry,
0f4d3d1155d9a5e Paul Burton 2014-04-14  170  		     (void *)entry_code - (void *)&mips_cps_core_entry);
0fc0708a8a2e6ff Paul Burton 2014-07-09  171  	__sync();
0f4d3d1155d9a5e Paul Burton 2014-04-14  172  
245a7868d2f2e54 Paul Burton 2014-04-14  173  	/* Allocate core boot configuration structs */
1ec9dd80bedc208 Paul Burton 2017-08-12  174  	ncores = mips_cps_numcores(0);
245a7868d2f2e54 Paul Burton 2014-04-14  175  	mips_cps_core_bootcfg = kcalloc(ncores, sizeof(*mips_cps_core_bootcfg),
245a7868d2f2e54 Paul Burton 2014-04-14  176  					GFP_KERNEL);
245a7868d2f2e54 Paul Burton 2014-04-14  177  	if (!mips_cps_core_bootcfg) {
245a7868d2f2e54 Paul Burton 2014-04-14  178  		pr_err("Failed to allocate boot config for %u cores\n", ncores);
245a7868d2f2e54 Paul Burton 2014-04-14  179  		goto err_out;
0ee958e102b62b4 Paul Burton 2014-01-15  180  	}
0ee958e102b62b4 Paul Burton 2014-01-15  181  
245a7868d2f2e54 Paul Burton 2014-04-14  182  	/* Allocate VPE boot configuration structs */
245a7868d2f2e54 Paul Burton 2014-04-14  183  	for (c = 0; c < ncores; c++) {
1ec9dd80bedc208 Paul Burton 2017-08-12  184  		core_vpes = core_vpe_count(0, c);
245a7868d2f2e54 Paul Burton 2014-04-14  185  		mips_cps_core_bootcfg[c].vpe_config = kcalloc(core_vpes,
245a7868d2f2e54 Paul Burton 2014-04-14  186  				sizeof(*mips_cps_core_bootcfg[c].vpe_config),
245a7868d2f2e54 Paul Burton 2014-04-14  187  				GFP_KERNEL);
245a7868d2f2e54 Paul Burton 2014-04-14  188  		if (!mips_cps_core_bootcfg[c].vpe_config) {
245a7868d2f2e54 Paul Burton 2014-04-14  189  			pr_err("Failed to allocate %u VPE boot configs\n",
245a7868d2f2e54 Paul Burton 2014-04-14  190  			       core_vpes);
245a7868d2f2e54 Paul Burton 2014-04-14  191  			goto err_out;
245a7868d2f2e54 Paul Burton 2014-04-14  192  		}
0ee958e102b62b4 Paul Burton 2014-01-15  193  	}
0ee958e102b62b4 Paul Burton 2014-01-15  194  
245a7868d2f2e54 Paul Burton 2014-04-14  195  	/* Mark this CPU as booted */
f875a832d202852 Paul Burton 2017-08-12  196  	atomic_set(&mips_cps_core_bootcfg[cpu_core(&current_cpu_data)].vpe_mask,
245a7868d2f2e54 Paul Burton 2014-04-14  197  		   1 << cpu_vpe_id(&current_cpu_data));
245a7868d2f2e54 Paul Burton 2014-04-14  198  
245a7868d2f2e54 Paul Burton 2014-04-14  199  	return;
245a7868d2f2e54 Paul Burton 2014-04-14  200  err_out:
245a7868d2f2e54 Paul Burton 2014-04-14  201  	/* Clean up allocations */
245a7868d2f2e54 Paul Burton 2014-04-14  202  	if (mips_cps_core_bootcfg) {
245a7868d2f2e54 Paul Burton 2014-04-14  203  		for (c = 0; c < ncores; c++)
245a7868d2f2e54 Paul Burton 2014-04-14  204  			kfree(mips_cps_core_bootcfg[c].vpe_config);
245a7868d2f2e54 Paul Burton 2014-04-14  205  		kfree(mips_cps_core_bootcfg);
245a7868d2f2e54 Paul Burton 2014-04-14  206  		mips_cps_core_bootcfg = NULL;
245a7868d2f2e54 Paul Burton 2014-04-14  207  	}
245a7868d2f2e54 Paul Burton 2014-04-14  208  
245a7868d2f2e54 Paul Burton 2014-04-14  209  	/* Effectively disable SMP by declaring CPUs not present */
245a7868d2f2e54 Paul Burton 2014-04-14  210  	for_each_possible_cpu(c) {
245a7868d2f2e54 Paul Burton 2014-04-14  211  		if (c == 0)
245a7868d2f2e54 Paul Burton 2014-04-14  212  			continue;
245a7868d2f2e54 Paul Burton 2014-04-14  213  		set_cpu_present(c, false);
245a7868d2f2e54 Paul Burton 2014-04-14  214  	}
245a7868d2f2e54 Paul Burton 2014-04-14  215  }
245a7868d2f2e54 Paul Burton 2014-04-14  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
