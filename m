Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F4F3BB100
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774460; cv=none; b=HAW/dvLxOSNNXd0Snof6I77dolM2KQvjHNGd7vBq1Lqo8kxbgvf7l+bQ9TeXY63ljPyXODUf9RO7H7YkDPz6sQfvq8MDdswVSb59Ycv8OZcrdON9O10sd7zxCXWdb8Z2r9UgFjtGTsGiqjLUzz5HvfRWDXpjzqfigQhXLRi6lqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774460; c=relaxed/simple;
	bh=/nVatfU2Ia9F4VpGmMH9m48dZIxqIUEKPELUVJU2CjQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DEkUNm07e/WZbafO1qrf/N8V91qRxtfTv4AeIf8SHcGhOtYMjDMfWZQayDH208MFY9Gbuqnb1/e+1ekNOHcYVbdA4eNGuw1YlTu94NgF/8LIE7ICMto5dPW96+NtUt5Rmx7iEFYutAbAAoQ+mb2qyCZ2AhifNCou6T2VRpngE7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvoM8A0D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvoM8A0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790774437; x=1822310437;
  h=date:from:to:cc:subject:message-id;
  bh=/nVatfU2Ia9F4VpGmMH9m48dZIxqIUEKPELUVJU2CjQ=;
  b=EvoM8A0D0XChVAZNz3rWQieVBa9asSOa5CN/iwe/kFJgPFCCvc5GJPuD
   XKFteln/0zBHb06d8M3M3gVg18ajxMkPnOF57pSXWLokIclEGWQWUtCL6
   09GsAXwavkMZJMbs4R2QI2IqnPTRwpl7Ruq1JhAfQGD1skJ9iASRgNPW/
   TOkVrCgFsP8/72Oyu9N5kXtSJc1TbujadjLiuDseEzifF9PQE/bxTZdmJ
   eSqN5PmTbEmYtrv+hKo5fA+UDJOLY/oXBWw/yiwP+Xsuk7zWMFOGYl+s5
   w/W3ceY45DHIcRvBsPwtWq15yo85YLT3u0yKACaV3kq7Jmg/+4jiRVV9J
   Q==;
X-CSE-ConnectionGUID: 5vyKTftxR/WC7YmID67I1w==
X-CSE-MsgGUID: MP7O4YVgS5uV/TEwblx6+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107896972"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="107896972"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:20:34 -0700
X-CSE-ConnectionGUID: RgVeA1EAT46GEl5KffywLQ==
X-CSE-MsgGUID: AakmPpNmTBqWwFzPx1F4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274806161"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Sep 2026 06:20:33 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBuEX-000000001sd-3uU2;
	Wed, 30 Sep 2026 13:20:29 +0000
Date: Wed, 30 Sep 2026 15:19:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 98/98]
 ./include/linux/iommu.h:1918:40: error: 'struct iommu_plb_gather' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202609301517.uGvbfJft-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   02e32237447fad73b1113af3e12dddaf2b08b5f6
commit: 51aee14260ab017517da536fbc531488b8e67975 [98/98] iommu/ummu-core: introduce iommu sva permission operation
:::::: branch date: 33 hours ago
:::::: commit date: 8 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260930/202609301517.uGvbfJft-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301517.uGvbfJft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609301517.uGvbfJft-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:103:
>> ./include/linux/iommu.h:1918:40: warning: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration
    1918 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/linkdata/sxe2/base/compat/sxe2_compat.h:22,
                    from drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2.h:35,
                    from drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_acl.c:25:
>> ./include/linux/iommu.h:1918:40: error: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
    1918 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/net/ethernet/linkdata/sxe2/base/compat/sxe2_compat.h:22,
                    from drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:23:
>> ./include/linux/iommu.h:1918:40: error: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
    1918 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1533:27: error: 'sxe2_pm_resume' declared 'static' but never defined [-Werror=unused-function]
    1533 | static int __maybe_unused sxe2_pm_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe2/sxe2pf/sxe2_main.c:1534:27: error: 'sxe2_pm_suspend' declared 'static' but never defined [-Werror=unused-function]
    1534 | static int __maybe_unused sxe2_pm_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/net/ethernet/linkdata/sxe2vf/base/compat/sxe2_compat.h:22,
                    from drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:24:
>> ./include/linux/iommu.h:1918:40: error: 'struct iommu_plb_gather' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
    1918 |                                 struct iommu_plb_gather *plb_gather) {}
         |                                        ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:1864:27: error: 'sxe2vf_pm_resume' declared 'static' but never defined [-Werror=unused-function]
    1864 | static int __maybe_unused sxe2vf_pm_resume(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/linkdata/sxe2vf/sxe2vf/sxe2vf_main.c:1865:27: error: 'sxe2vf_pm_suspend' declared 'static' but never defined [-Werror=unused-function]
    1865 | static int __maybe_unused sxe2vf_pm_suspend(struct device *dev);
         |                           ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +1918 ./include/linux/iommu.h

51aee14260ab01 Lei Gong 2025-08-21  1910  
51aee14260ab01 Lei Gong 2025-08-21  1911  static inline int iommu_sva_ungrant(struct iommu_sva *sva, void *va,
51aee14260ab01 Lei Gong 2025-08-21  1912  				    size_t size, void *cookie)
51aee14260ab01 Lei Gong 2025-08-21  1913  {
51aee14260ab01 Lei Gong 2025-08-21  1914  	return -EOPNOTSUPP;
51aee14260ab01 Lei Gong 2025-08-21  1915  }
51aee14260ab01 Lei Gong 2025-08-21  1916  static inline void iommu_plb_sync_all(struct iommu_domain *domain) {}
51aee14260ab01 Lei Gong 2025-08-21  1917  static inline void iommu_plb_sync(struct iommu_domain *domain,
51aee14260ab01 Lei Gong 2025-08-21 @1918  				struct iommu_plb_gather *plb_gather) {}

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
