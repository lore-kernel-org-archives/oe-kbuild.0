Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6D3247280
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 12:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663998; cv=none; b=ReKXebhV1GrNNqa0idZ7UrMwLTc04fOpe4Z+hE5cur0mSzJ/9jXWIymhP8cjcz4RzE4/dgtg7u92UbfADTAU1EnHUC/Ea05kp5vhplFaT1C0MC02AKRQnAfFjZk/trLgN5PyZ3IWm53zn1I0FiIuSWOHuTvYZ4VX79y3KhfmZuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663998; c=relaxed/simple;
	bh=9E1hmDLaVfnsgvPZCrvutdk0AxRiukUabIQppgp9Qis=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i8UnICaTWs0dkpYxl/WHPc+QHuaj0IBDv3ZRbC8sjYqTHYN5SPbYPB8GZvqqk7DrmycLBUKmg3LYlQPedTl3J9SQr5Qw6AENiO2i7kWEbMiFejAa2b/x0mr4c60DbRKDJnGfq+ht9u7ueYo0UoVNaoiMJctl0/lbGENO71GIrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZDaghYr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZDaghYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780663997; x=1812199997;
  h=date:from:to:cc:subject:message-id;
  bh=9E1hmDLaVfnsgvPZCrvutdk0AxRiukUabIQppgp9Qis=;
  b=KZDaghYr8CFIdNAX5q0zP2dOm45lMDnIOoYfAwnoGoAtD/5FNcazXdS4
   hp2fLKj8GDhzIa1QVVoo06ExFHIpHrsbCiANZWVIPaA34sTTRf45cPCA3
   CB6UQHEf8gJF9BJ+/7waRz/lsSrGdUYWtPF7vmgOvHDU6zInz073UeC2M
   gXyoK+i81tJoOR56Qi/ABn6/HlC+M5YmTbvpR3rsLircMxOaODMJgq+Uj
   1EfTkV/b2eWzCeYyx+1MB3D2z0x28TTqu2zrNwMg1S0DpywXUFrx9p22j
   lQU4Hz6fjIeQYJjWALGhP3qHYo/fGdpJGD+EfNCuFq8PxwORWQUhTL30L
   A==;
X-CSE-ConnectionGUID: 8anqufMDRMKInuIZgXfBzw==
X-CSE-MsgGUID: piobEEg+TIuZAQrAjFfUsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80633457"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="80633457"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 05:53:16 -0700
X-CSE-ConnectionGUID: BPRcu+rnS/ybZGMJvDfTuQ==
X-CSE-MsgGUID: HjHVxjHVTaCLWCFTE/i3yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="240649750"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jun 2026 05:53:15 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVU2z-000000002ZR-18rh;
	Fri, 05 Jun 2026 12:53:13 +0000
Date: Fri, 05 Jun 2026 14:53:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:aspeed/dt 22/26]
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202606051401.I6afJWjh-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Peter Shen <sjg168@gmail.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git aspeed/dt
head:   e600933b6e518397b3f256dddd233e5d8e6cff93
commit: bc83b7353d2bfefba73193335bacc3542d8a7ae2 [22/26] ARM: dts: aspeed: Add Facebook Anacapa platform
:::::: branch date: 5 months ago
:::::: commit date: 5 months ago
config: arm-randconfig-2051-20260604 (https://download.01.org/0day-ci/archive/20260605/202606051401.I6afJWjh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051401.I6afJWjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606051401.I6afJWjh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
