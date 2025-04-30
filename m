Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFE37E107
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015127; cv=none; b=lZkLB0BWMI1FBnuvqTLqN8rSeA1IC649pJ0ZudclIOk9rw7JTEew1WIFb090bE2Kw1a440yQg9pcjjRfe6UA2zGnpZi5MjNEqovrZXAcvcYR744MLncwFn/olH1m7c7uGBN5GU3iRUbEzOyVrP7Ix56C1njk/q+jYNxJiEnxgUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015127; c=relaxed/simple;
	bh=9R2STIP+vB+T8kWUgylfGDD0HlbULfCQLzj3rfuXfx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPjSNXXEKYkEkHSmurRreO9MjdNhyA9jJ0iEL7cwXgP58z3FZ7gizCnTsOoo5iY6SbdmCSgCZU/Yjk1Ej5tRzed2ZnzjuhFJMybKx4secas1X+rNL1X6LFDriEvpnHc3kp0hkr3KMwyvTFn4DuSl1Bbt3d0sr90BJRbfiFjaIQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERmQH3v5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERmQH3v5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746015125; x=1777551125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9R2STIP+vB+T8kWUgylfGDD0HlbULfCQLzj3rfuXfx0=;
  b=ERmQH3v5wb1Abufk7wALczAYs7Ut5SLVW+9PWqeaa3MPbHmMlFwxsV31
   KoQWEjDC70Ri5iwsyk5NKk5RyvL8V0omQzE8ftPJXSPKuR0vUCb/o0Wby
   gPyZDMQ5mgl0/GEg8HgsI4bVUVQccTshE9x43MgwZJI00o+SL5O2Ldn4t
   gHDhEJSbvjA0HwqmF8c23F+EXl4VV9uHfl2RMcude7B3zjXVzEySlqgYC
   uE6a4n+Dccjz8ARlDYmwg8Q0Zc1z8hHuci+VZqRwE56da/z1p3k/meUrW
   YfySdlONzPInOu6PsekE28xRH5lLmqXVkE9hg8EbOHyGSX4XEOfEGVhbL
   Q==;
X-CSE-ConnectionGUID: 5/pvRBO4TTmRHF7IMENWog==
X-CSE-MsgGUID: GjEAVkOZTP+mXPeXgICwbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47552235"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47552235"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 05:12:04 -0700
X-CSE-ConnectionGUID: 8QKPymI/Th6Bh9OhwfqfRQ==
X-CSE-MsgGUID: e5CK7zxPRqmxNFULRGm5Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134624528"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Apr 2025 05:12:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA6IC-0003Rt-22;
	Wed, 30 Apr 2025 12:12:00 +0000
Date: Wed, 30 Apr 2025 20:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 1605/1605]
 drivers/mmc/host/phytium-mci-plat.c:169:23: sparse: sparse: not addressable
Message-ID: <202504302022.yMhSCrf7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mmc/host/phytium-mci-plat.c:169:23: sparse: sparse: not addressable"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a48a35466505c8a52da57596944bd0b4485e825f
commit: d65622e6edee11f7fcbd295bdb5aef86e12dfef3 [1605/1605] mmc: add support for Phytium MMC
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-r111-20250430 (https://download.01.org/0day-ci/archive/20250430/202504302022.yMhSCrf7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250430/202504302022.yMhSCrf7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504302022.yMhSCrf7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/host/phytium-mci-plat.c:169:23: sparse: sparse: not addressable
   drivers/mmc/host/phytium-mci-plat.c:169:9: error: lvalue required as unary '&' operand
      .pm = &phytium_mci_dev_pm_ops,
            ^

vim +169 drivers/mmc/host/phytium-mci-plat.c

d65622e6edee11 Malloy Liu 2023-10-31  161  
d65622e6edee11 Malloy Liu 2023-10-31  162  static struct platform_driver phytium_mci_driver = {
d65622e6edee11 Malloy Liu 2023-10-31  163  	.probe = phytium_mci_probe,
d65622e6edee11 Malloy Liu 2023-10-31  164  	.remove = phytium_mci_remove,
d65622e6edee11 Malloy Liu 2023-10-31  165  	.driver = {
d65622e6edee11 Malloy Liu 2023-10-31  166  		.name = "phytium-mci-platform",
d65622e6edee11 Malloy Liu 2023-10-31  167  		.of_match_table = phytium_mci_of_ids,
d65622e6edee11 Malloy Liu 2023-10-31  168  		.acpi_match_table = phytium_mci_acpi_ids,
d65622e6edee11 Malloy Liu 2023-10-31 @169  		.pm = &phytium_mci_dev_pm_ops,
d65622e6edee11 Malloy Liu 2023-10-31  170  	},
d65622e6edee11 Malloy Liu 2023-10-31  171  };
d65622e6edee11 Malloy Liu 2023-10-31  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
