Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211752882D0
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751814541; cv=none; b=qx/ycq2NeaO/RRUHOoypp/QftiAx8SMbVNnh1EjiyZ2OM7pTfe80/HXZTPpuVGKlDy4Wp56hgQ+mE6hFKiepxbC+Cm19/F/2Hf3En3Q59eYmzyxa+okrsveqI6RqxsOK+uZz8DC21NMOim51Tm61OvTKBCYUPZ3wREG+O0W+FKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751814541; c=relaxed/simple;
	bh=fAgfY4FfknFnm21CcOFJQuMeaaR7X/V0m02CSH1sc54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apy/MGlNZjnYo1XIZLMZNtMUnfCttUZDTVrgPxILNBXRzizuK3neyrB8rxBQHNkAo2dJ+o820PukDFOccLP5pXqzG4Ow3BGAAevOTtzRubxm0Pb5kcO2/3t6mOXdhiJWbZpSzj2gXpdsh+04nOSPXd0KyXPuPCI+qktEx57CE0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kktphKvk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kktphKvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751814540; x=1783350540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fAgfY4FfknFnm21CcOFJQuMeaaR7X/V0m02CSH1sc54=;
  b=kktphKvkxX3xp8zAiGmGaVvW+ANv44F4uFz5ByZMl9lxU0fWHMuLXxkU
   /a5JEmu310XI5OPrNxptW9/EheCawWQ0m2SbrmgrPn2SL63UtoEPtOj+3
   CoqjjIS0U8yx5qKR2hPS1uIZ117to4k/23hcAD9U5o2u93eojhUghUEaZ
   N3ET6Ygs6tkziIVjZgMhUP5jmhw0PWPd/+Za6B60Fa9nVOVDNnu1Evg1I
   msc8j838dBwOIU0LxA6aT5YNTQoyBJpuxbc8MwgcNDUC9davDwHE+qAq2
   TyZS8zG4Ca89+nihlmbSOgKWQROyp4eGXHYif1iSXsxHrx4xxlxZ9DhXW
   A==;
X-CSE-ConnectionGUID: KPv+b0nMQYCs2sZozUiVGQ==
X-CSE-MsgGUID: r0yvMZUfSdeu5lDQIyBs5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53974207"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="53974207"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 08:08:59 -0700
X-CSE-ConnectionGUID: NFfAaBgaSP+tRmP+PmcmZA==
X-CSE-MsgGUID: 0d0GyhfTSNi1PBSvWEnmiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="155494877"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jul 2025 08:08:58 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYQz9-00056d-25;
	Sun, 06 Jul 2025 15:08:55 +0000
Date: Sun, 6 Jul 2025 23:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/9] ARM: dts: aspeed: wedge400: Extend data0
 partition to 64MB
Message-ID: <202507062220.0h61hzDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250706042404.138128-6-rentao.bupt@gmail.com>
References: <20250706042404.138128-6-rentao.bupt@gmail.com>
TO: rentao.bupt@gmail.com
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org
TO: Andrew Lunn <andrew@lunn.ch>
TO: Tao Ren <taoren@meta.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/rentao-bupt-gmail-com/ARM-dts-aspeed-wedge400-Fix-DTB-warnings/20250706-122729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250706042404.138128-6-rentao.bupt%40gmail.com
patch subject: [PATCH v2 5/9] ARM: dts: aspeed: wedge400: Extend data0 partition to 64MB
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm-randconfig-052-20250706 (https://download.01.org/0day-ci/archive/20250706/202507062220.0h61hzDV-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507062220.0h61hzDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507062220.0h61hzDV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi:12.11-15.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: sd-controller@1e740000 (aspeed,ast2500-sd-controller): sdhci@200: Unevaluated properties are not allowed ('sdhci-caps-mask' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/pwm-tacho-controller@1e786000: failed to match any schema with compatible: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: lpc@1e789000 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: lpc@1e789000 (aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'

vim +12 arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi

62ab9ff4d06aaa Tao Ren 2025-07-05   3  
62ab9ff4d06aaa Tao Ren 2025-07-05   4  partitions {
62ab9ff4d06aaa Tao Ren 2025-07-05   5  	compatible = "fixed-partitions";
62ab9ff4d06aaa Tao Ren 2025-07-05   6  	#address-cells = <1>;
62ab9ff4d06aaa Tao Ren 2025-07-05   7  	#size-cells = <1>;
62ab9ff4d06aaa Tao Ren 2025-07-05   8  
62ab9ff4d06aaa Tao Ren 2025-07-05   9  	/*
62ab9ff4d06aaa Tao Ren 2025-07-05  10  	 * u-boot partition: 896KB.
62ab9ff4d06aaa Tao Ren 2025-07-05  11  	 */
62ab9ff4d06aaa Tao Ren 2025-07-05 @12  	u-boot@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
