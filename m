Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4DB3EB0E6
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jun 2026 23:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046507; cv=none; b=bO+oUbvAH/dQU57uwCY+T7YN/tNYaPc7mm9XpQ+1QE4AjL6MC1zDxTYw0NWVwmzT1NjbYlVOxhRZmcSCamvUzXBCCC/D9Nag0KNjx4uH/Ao5Urt6mIkaPJsl0NXupjqrNxxCVM7kUBDAD8fNzJuDoQJE8SHhCg4IYDFg3fYElMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046507; c=relaxed/simple;
	bh=XlR5C4gPaKgsluqHQnClfeA5I16AbU8yb3eJ6n7Qu8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fSHNy1sj4dgUtqaApZ/uXTlAGjt1kBtiqztCcIqrF8sBmCgKXW2UyCbn2H3fmOJgtwIdLJgxqxBIatCqHAnvw/B762B+SEPAi09Tu6oqiHRIK6PCoJ3ivZhPD95RevPbu+druOXXboRGhNc0L62JLHRcEtBmXn2/A5Iz8+73I8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeEmw57s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeEmw57s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781046505; x=1812582505;
  h=date:from:to:cc:subject:message-id;
  bh=XlR5C4gPaKgsluqHQnClfeA5I16AbU8yb3eJ6n7Qu8U=;
  b=PeEmw57sxNlfAC1IFYkouIqBd7T/MawzSaposIlLth3DImEy4lGjHF7P
   e2G0I1xThi3+7+Y3nkfQzhlbhpPxsOzwWHErD1D10pjAVI/KChA7yHnfk
   4Ujf8GpV/teeRel0SkZSW759eqGYSwXqnJrL+cnRwDT/iWJ/3wZRhsaw4
   eoz5KSS1bqdBqJgT4VI++lCjof3nAGE/7LcyKmsjMPnEKkwYxe0RSWGYU
   nibuPyCzQYD7Cdqy55nG3iJPrrja5//S4OBJMkO6ssjdpTLeHCx76aHR8
   xC8N46RJzqFlwnF+WyE8epjwLUEByJJ0FjwRiL7dJ6+LaqYvWrRqj22XU
   g==;
X-CSE-ConnectionGUID: mfHwABlxTFeNiPa3ZHRDVg==
X-CSE-MsgGUID: FghDXbHETzeLoOxY01eXiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84395336"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="84395336"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 16:08:24 -0700
X-CSE-ConnectionGUID: LKwmYGRNRN+BM9opUYCMHQ==
X-CSE-MsgGUID: hNNF61sbQS2lh1rW23tBmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245857575"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2026 16:08:25 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX5YU-000000003XR-1MlN;
	Tue, 09 Jun 2026 23:08:22 +0000
Date: Wed, 10 Jun 2026 01:07:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202606100112.DZ9piNOi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kyle Hsieh <kylehsieh1995@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kyle-Hsieh/dt-bindings-arm-aspeed-add-Meta-ventura2-board/20260608-104254
head:   9ce619d525c5d7135ee30217f64ab54eaa76d7b9
commit: 9ce619d525c5d7135ee30217f64ab54eaa76d7b9 ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260608 (https://download.01.org/0day-ci/archive/20260610/202606100112.DZ9piNOi-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100112.DZ9piNOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606100112.DZ9piNOi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: fan-controller@20 (maxim,max31790): 'channel@2', 'channel@5' do not match any of the regexes: '^fan@[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: i2c@400 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,hw-timeout-ms' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/bus@1e78a000/i2c@580/power-monitor@69: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
