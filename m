Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115D5211A
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 03:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694748468; x=1726284468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Ptkc8gTE0+8rQGCSmxvYwMktpKNhqUk9MqP2Jj5cys=;
  b=KppJjr6Ouz58Kg4dAtzwFwa7ZlJ6d3so19B5RfpV/Z4IkuXZ08xctjIt
   6Hc1whfOiPwAo8UlBqj1Gub0frrH5Cv59oUa9VYNKK2gmvhgWDd31o+r3
   OkyoSId9WoxgrFWunmJhyHv/hCUQT6K4usvVvw1CEnLhxygoLKnITM85K
   f1DU5dI8/1CwYMgJkABjY1OCdGq84k+3mgu5PJwnQ2mGSeh18UJZTwtQK
   HQ0Fh+rXH1uFKAl05u2dVjLmTw4uOShk6VE9ng64iqP6Uf/1PrATARBhp
   frlD4mwfRPLmE0ybY/Lvdw/DXZCKxpvMkGuS2xiElVVGWDdg1QyLA6L5a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359403311"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="359403311"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 20:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779926199"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="779926199"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Sep 2023 20:27:35 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgzUT-0002NZ-11;
	Fri, 15 Sep 2023 03:27:33 +0000
Date: Fri, 15 Sep 2023 11:27:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:pending-fixes 5/445] checkpatch: WARNING: %Lx is
 non-standard C, use %llx
Message-ID: <202309151120.DpIUuO0k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Helge Deller <deller@gmx.de>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   66b45e71c969032c8c1564217e8596103b451145
commit: c1ebb94071cb4455177bafa619423acb3494d15d [5/445] parisc: sba-iommu: Fix sparse warnigs
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309151120.DpIUuO0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309151120.DpIUuO0k-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: A patch subject line should describe the change not the tool that found it
#4: 
Subject: sba-iommu: Fix sparse warnigs

ERROR: Macros with complex values should be enclosed in parentheses
#33: arch/parisc/include/asm/ropes.h:116:
+#define SBA_AGPGART_COOKIE	(__force __le64) 0x0000badbadc0ffeeULL

WARNING: Using vsprintf specifier '%px' potentially exposes the kernel memory layout, if you don't really need the address please consider using '%p'.
#102: drivers/parisc/sba_iommu.c:1435:
+	DBG_INIT("%s() hpa %px mem %ldMB IOV %dMB (%d bits)\n",
 			__func__,
 			ioc->ioc_hpa,
 			(unsigned long) totalram_pages() >> (20 - PAGE_SHIFT),
@@ -1469,7 +1469,7 @@ sba_ioc_init(struct parisc_device *sba, struct ioc *ioc, int ioc_num)

WARNING: %Lx is non-standard C, use %llx
#120: drivers/parisc/sba_iommu.c:1584:
+		DBG_INIT("%s() hpa %px ioc_ctl 0x%Lx ->",

WARNING: Using vsprintf specifier '%px' potentially exposes the kernel memory layout, if you don't really need the address please consider using '%p'.
#120: drivers/parisc/sba_iommu.c:1584:
+		DBG_INIT("%s() hpa %px ioc_ctl 0x%Lx ->",
 			__func__, sba_dev->sba_hpa, ioc_ctl);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
