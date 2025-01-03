Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F61F9F65
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904521; cv=none; b=Iy9p0wGnyu8UjPRxmpcbi+Vst95NoxqkgNsEKDp2WNrz3P8gr0A/YDcY9ohf77ZWtbEjCYx1u8eZ1v5z1pFydcNlvjKPxz/ZwXn6DBhJe579u7CZuYcTtc7ZGt3Fzor3g/yPVbkb6vge/PdcTmSF/9flepeQDF53er758roWokY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904521; c=relaxed/simple;
	bh=1RhLsC6Do7xkwPxpaOBisdplsC7us7Bt+mVbXu5fBOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KZ0Kj4ch9J1EFOuL6XbWPX++ukQzgM2VDbSTY7j4IJsA9AKcMInpcDdktJAQBWKQtWhMnyuc7K94Mk8daj7pcvQpPsvOKGTG2WjkPJ6VxEX/yYwb4+PWtrK3HomACksVVCWHmuunxlC17Gaqd6yW6RLfKO6YJrxZxOvCSLZnH2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yn6SlKu7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yn6SlKu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735904519; x=1767440519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1RhLsC6Do7xkwPxpaOBisdplsC7us7Bt+mVbXu5fBOY=;
  b=Yn6SlKu7ZQOr+ZeWwm6iZUsa6EMQx7/dS7d938WwMtBH5QzaUTa2UTXF
   FGMiwetv+Aopk+j310z0SF37SmIBd8Wfbz4YRsTu922/ignAUzsZX0Jcy
   NC8McMTkH4HfmixpPN12Vp3KjItZJiljtHT1x3aBpEYuhdS/ZMWGCL4DK
   cGd7XRT/LBVzq07Yko2kgZU/QfZIR/d94CeDMqKCOnZbe27ZE63BG8hpC
   fHGDSP8YvTSnvh7tVDxS5LOfJKl4SHgB0HSdH0pB4qSEnsD/lXh1pdmCX
   LcgF3/ucHAM5xrPFczmZt5bVOi1G21t5/afaS4CTCUYoKh69paqdJyM/Z
   A==;
X-CSE-ConnectionGUID: 2jr4H3e0Q8mCUpLuNA+Iog==
X-CSE-MsgGUID: 8CplD0YsQmud87ecTkwoYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36057358"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36057358"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 03:41:59 -0800
X-CSE-ConnectionGUID: q0zfXx5BQ3qkRWcbHzkNCg==
X-CSE-MsgGUID: PUpG43dcQ9+XwOE+bUdLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102276415"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 03:41:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTg3v-0009gB-2U;
	Fri, 03 Jan 2025 11:41:55 +0000
Date: Fri, 3 Jan 2025 19:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-5.10 2616/2616]
 arch/arm64/kernel/mpam/mpam_device.c:1838:1-33: WARNING: Function
 "for_each_available_child_of_node" should have of_node_put() before break
 around line 1841.
Message-ID: <202501031939.oFEiUJOt-lkp@intel.com>
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
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d51fb86ce6a3a3e59d7cba58738b63903b8cb37c
commit: c0ec28ac9769e4df7757ba3ed94295446243ec31 [2616/2616] arm64/mpam: refactor device tree structure to support multiple devices
:::::: branch date: 4 hours ago
:::::: commit date: 2 years, 11 months ago
config: arm64-randconfig-r052-20250101 (https://download.01.org/0day-ci/archive/20250103/202501031939.oFEiUJOt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501031939.oFEiUJOt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/mpam/mpam_device.c:1838:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before break around line 1841.

vim +/for_each_available_child_of_node +1838 arch/arm64/kernel/mpam/mpam_device.c

7926bf06ce9fb8 Xingang Wang 2022-01-10  1817  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1818  static int arm_mpam_device_probe(struct platform_device *pdev)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1819  {
7926bf06ce9fb8 Xingang Wang 2022-01-10  1820  	int ret;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1821  	struct device *dev = &pdev->dev;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1822  	struct device_node *node = dev->of_node;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1823  	struct device_node *child = NULL;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1824  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1825  	if (!cpus_have_const_cap(ARM64_HAS_MPAM))
7926bf06ce9fb8 Xingang Wang 2022-01-10  1826  		return 0;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1827  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1828  	if (!acpi_disabled || mpam_enabled != MPAM_ENABLE_OF)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1829  		return 0;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1830  
c0ec28ac9769e4 Xingang Wang 2022-01-29  1831  	if (!node || !of_match_node(arm_mpam_of_device_ids, pdev->dev.of_node))
c0ec28ac9769e4 Xingang Wang 2022-01-29  1832  		return -EINVAL;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1833  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1834  	ret = mpam_discovery_start();
7926bf06ce9fb8 Xingang Wang 2022-01-10  1835  	if (ret)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1836  		return ret;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1837  
c0ec28ac9769e4 Xingang Wang 2022-01-29 @1838  	for_each_available_child_of_node(node, child) {
c0ec28ac9769e4 Xingang Wang 2022-01-29  1839  		ret = of_mpam_add_child(pdev, child);
c0ec28ac9769e4 Xingang Wang 2022-01-29  1840  		if (ret)
c0ec28ac9769e4 Xingang Wang 2022-01-29 @1841  			break;
c0ec28ac9769e4 Xingang Wang 2022-01-29  1842  	}
7926bf06ce9fb8 Xingang Wang 2022-01-10  1843  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1844  	if (ret) {
7926bf06ce9fb8 Xingang Wang 2022-01-10  1845  		mpam_discovery_failed();
7926bf06ce9fb8 Xingang Wang 2022-01-10  1846  	} else {
7926bf06ce9fb8 Xingang Wang 2022-01-10  1847  		ret = mpam_discovery_complete();
7926bf06ce9fb8 Xingang Wang 2022-01-10  1848  		if (!ret)
7926bf06ce9fb8 Xingang Wang 2022-01-10  1849  			pr_info("Successfully init mpam by DT.\n");
7926bf06ce9fb8 Xingang Wang 2022-01-10  1850  	}
7926bf06ce9fb8 Xingang Wang 2022-01-10  1851  
7926bf06ce9fb8 Xingang Wang 2022-01-10  1852  	return ret;
7926bf06ce9fb8 Xingang Wang 2022-01-10  1853  }
7926bf06ce9fb8 Xingang Wang 2022-01-10  1854  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
