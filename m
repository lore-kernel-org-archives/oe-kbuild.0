Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2262B1E00A0
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Apr 2025 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745756084; cv=none; b=mV9GucbG3ZpMl0IAgPPr0VFvj+sGqJBJAe8H94OyFGfpDGCbyJA4LKK5GLgxlfIpioFB7uxXEHjmtKpRNvJC3iyMvHq0NXijaEpv8F85lsOXa+eVSiS+pO37YEvM9ih/8zHoOxxY7dZ0Qc5Y8PdP10kdwEN0f6J9BuY5aszGPPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745756084; c=relaxed/simple;
	bh=n3AdHfCHgeRHbYJw/DSRfFn+KWclTqWJZ1fcpMmYLts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/n6APbEiHvww/HT+imOROei/ZbyDqanRtOavS+7vDj8yQm2NWEJHCieol4RiInzqP5JKHJ5wzF09s8jmeN4I2SNwQzlwAmRkHi+Vk87dziQ+V+o0PytdET3r3/uVsBe47Gu0034K16i7nR5smJCIV36P+n+AcwQZybsw4L2vIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBKeGS8P; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBKeGS8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745756082; x=1777292082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3AdHfCHgeRHbYJw/DSRfFn+KWclTqWJZ1fcpMmYLts=;
  b=UBKeGS8PwTD3lRX0VCqmIjp8vVupVXoT7/jpmG677+YF2qm1RRgi/TlZ
   vsw1kO/yb26ua79iBQUNIxPtWEpDwXFdZM60AWt5ZzCwSh65Jib7emhMD
   /qmmD8u1prr03b1M3wjIdG9u8+FpPSX4OfZGkK4fqOCrDEXu8x0QgPpRH
   Rf2Y9SdSWfPcstcfLJm2xaDbG4qxjCXyJbLlnV/VntlYHKLGxq+WwsEMX
   4EE4jI+CO2d5PiE6ljFmJFoZ3PDWFVwYP47+NwIv+ERpIiDCyGtv8WrxF
   M1twpe/hnfZdunwcTli7sSjcY0UaFfU/Cb2/3KDBrcEoK0VJMdDBAaD8d
   g==;
X-CSE-ConnectionGUID: bVopoPHPRiqQ0PDgMWL6Pw==
X-CSE-MsgGUID: zuEMXYNOQNOdc/vXhDhjAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47268250"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="47268250"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 05:14:42 -0700
X-CSE-ConnectionGUID: emRsnUqLQxeofDq/AnwRcg==
X-CSE-MsgGUID: cWaHqxCdQZ2NXHQvhejTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="133265417"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Apr 2025 05:14:41 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u90u6-0006Hx-26;
	Sun, 27 Apr 2025 12:14:38 +0000
Date: Sun, 27 Apr 2025 20:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mmc/host/sdhci.o: warning: objtool:
 sdhci_initialize_data+0x54: unreachable instruction
Message-ID: <202504271929.BkrvqYJV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Victor Shih <victor.shih@genesyslogic.com.tw>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Ben Chuang <ben.chuang@genesyslogic.com.tw>
CC: AKASHI Takahiro <takahiro.akashi@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 9cbb2358bb1f17b61bf75cbebc2c9746b3a29e32 mmc: sdhci-uhs2: add request() and others
date:   6 months ago
:::::: branch date: 3 days ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r111-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271929.BkrvqYJV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250427/202504271929.BkrvqYJV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504271929.BkrvqYJV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci.o: warning: objtool: sdhci_initialize_data+0x54: unreachable instruction
   drivers/mmc/host/sdhci.o: warning: objtool: sdhci_transfer_pio+0x1f4: unreachable instruction

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
