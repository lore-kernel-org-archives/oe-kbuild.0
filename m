Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC24EDD
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Dec 2023 03:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENJ5BWIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702785139; x=1734321139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iRnVMMSji9PKlKnY0EdO7Cn8/g315n1m5Bpwp/B1M4A=;
  b=ENJ5BWInPswpKFzb6OXb/JN454X1mrIFt7KfLbx7wgxRR6Dq2rv7TK5O
   fwjah2TmYRgsnANcJPxPTH2BHbjzPBXEtuX2Y1SRyN3bes+D2yFr3WhMU
   M4RV2TPR0jZhdqFe9LaIVXfqGqNFi4Y5T3fAGHoNuEu4aL42tnJ/r8fPx
   8Jgi26f8SqlozfGDmLyJrOoN8uIg36qNsj9UPgbfISSTdoOmXPpsOzHyo
   NtA6R1eUQLz8tXKB3/FbeT4jVdqp8FJ6A5vJ4CuZst80NWTqoOoWjSM/N
   qyxE7Ye7rQasYPFQj2mZ2eETBMX1D5p5MSl4GAnAa8eu7bwA6FQx16xqe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="426530715"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="426530715"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 19:52:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="724888954"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="724888954"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Dec 2023 19:52:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEiCN-0002bh-18;
	Sun, 17 Dec 2023 03:52:15 +0000
Date: Sun, 17 Dec 2023 11:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/etnaviv/etnaviv_iommu.c:122:15: sparse: sparse:
 memcpy with byte count of 2097152
Message-ID: <202312171155.Z0Xzqed7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/etnaviv/etnaviv_iommu.c:122:15: sparse: sparse: memcpy with byte count of 2097152"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Matthew Wilcox <willy@infradead.org>
CC: Lucas Stach <l.stach@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b8a9b2e6809d281890dd0a1102dc14d2cd11caf
commit: a20ca6744ba7e683a772bb5f1715e4662342be58 Build etnaviv on non-ARM architectures
date:   4 years, 11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 years, 11 months ago
config: parisc-randconfig-m041-20230821 (https://download.01.org/0day-ci/archive/20231217/202312171155.Z0Xzqed7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231217/202312171155.Z0Xzqed7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312171155.Z0Xzqed7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/etnaviv/etnaviv_iommu.c: note: in included file (through arch/parisc/include/uapi/asm/unistd.h, arch/parisc/include/asm/unistd.h, include/uapi/linux/unistd.h, ...):
   ./arch/parisc/include/generated/uapi/asm/unistd_32.h:343:41: sparse: sparse: no newline at end of file
>> drivers/gpu/drm/etnaviv/etnaviv_iommu.c:122:15: sparse: sparse: memcpy with byte count of 2097152

vim +122 drivers/gpu/drm/etnaviv/etnaviv_iommu.c

a8c21a5451d831 The etnaviv authors 2015-12-03  116  
b670908384bda9 Lucas Stach         2017-09-07  117  static void etnaviv_iommuv1_dump(struct etnaviv_iommu_domain *domain, void *buf)
a8c21a5451d831 The etnaviv authors 2015-12-03  118  {
b670908384bda9 Lucas Stach         2017-09-07  119  	struct etnaviv_iommuv1_domain *etnaviv_domain =
b670908384bda9 Lucas Stach         2017-09-07  120  			to_etnaviv_domain(domain);
a8c21a5451d831 The etnaviv authors 2015-12-03  121  
b670908384bda9 Lucas Stach         2017-09-07 @122  	memcpy(buf, etnaviv_domain->pgtable_cpu, PT_SIZE);
a8c21a5451d831 The etnaviv authors 2015-12-03  123  }
a8c21a5451d831 The etnaviv authors 2015-12-03  124  

:::::: The code at line 122 was first introduced by commit
:::::: b670908384bda92c42076cf36614ee4f97763253 drm/etnaviv: remove IOMMU dependency

:::::: TO: Lucas Stach <l.stach@pengutronix.de>
:::::: CC: Lucas Stach <l.stach@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
