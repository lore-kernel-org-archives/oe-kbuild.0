Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810124690
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Dec 2023 01:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YozI8SgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703034577; x=1734570577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwpvtREIigQMTtu3pfQycK6wQDyfd4EG+drLc86Pm3o=;
  b=YozI8SgCSpY7h8F8H2R4ako+ooQv9DhT4CZfBmB3ox2nqG7yszFx1laN
   XMYc+fWD01b0+kySofJf8DH/+vg6yaBUUnpd1vljChsseuenOPvjfFvCE
   QEbKaenThFNUkp5o1spThzNC/sGTZLaGHvMioqkhKz+M8LA9XBAmsSBX9
   tXdlMx9l5LWzafWm5+cVpyOlt7ktM3ila0CzNm31ma08cmRjO584r+qn8
   ZA7Xw1EFBK3k9pv1KtVdouNF8T0qb+irSeWQOGr9pJOqhVzxNkgNuIt7m
   zk9Ld6UmkUwGphPF2pg17OHjrgZAy9WqZmDVd5oKMWM201HBXW/am6enh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="394628273"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="394628273"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 17:09:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769414705"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="769414705"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Dec 2023 17:09:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFl5Z-0006A5-10;
	Wed, 20 Dec 2023 01:09:33 +0000
Date: Wed, 20 Dec 2023 09:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/etnaviv/etnaviv_iommu.c:122:15: sparse: sparse:
 memcpy with byte count of 2097152
Message-ID: <202312200801.LlrCUdFc-lkp@intel.com>
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
head:   55cb5f43689d7a9ea5bf35ef050f12334f197347
commit: a20ca6744ba7e683a772bb5f1715e4662342be58 Build etnaviv on non-ARM architectures
date:   4 years, 11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 years, 11 months ago
config: parisc-randconfig-m041-20230821 (https://download.01.org/0day-ci/archive/20231220/202312200801.LlrCUdFc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231220/202312200801.LlrCUdFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312200801.LlrCUdFc-lkp@intel.com/

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
