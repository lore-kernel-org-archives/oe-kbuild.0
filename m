Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4001DDA18
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Jul 2025 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751968709; cv=none; b=kBTOitaYeLZsryzv/VoC+ly0rOysmAA+EitDREhqnXrvYqcA889iPSEDJUgxYRvoDpjEX2NoBajxVelnpUlEg6DQnf0IE2cyBu4KAxoGiq0fw5n4YzuO90+s3t4U7aKw+gTGMf+zjzcIvVq1rJgnSS+x1p249iuZJGEPdezEkZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751968709; c=relaxed/simple;
	bh=QfOof9A7hO5FEYoCf9rr2IL8Et1gXeCVu6ds97qMeeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1bgUUOmg9P6rwMsv7MCj42wVAw3yLE4Px2ath15R+uxSiciM6uLfs3BJU85nY3XGcKfQlQVEcwKG73QnuAA1GttY1etjaZFaKlZHlDeUBKP1dyN0IImw3McfC3FWYWwzRrLLMDQqJk/ZX7Q4HVV1VDaV91RvlwJSnNXZM/zlmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LftNhUz5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LftNhUz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751968707; x=1783504707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QfOof9A7hO5FEYoCf9rr2IL8Et1gXeCVu6ds97qMeeU=;
  b=LftNhUz5suHZBmzUAVcay/5UkpMzdIkKIok8JGCgQWmQu3LyEoVlsfjg
   9+9IaRbVFMBzD3T7G2TUndUeaGBab+Z4L8LtwWeMzmF4hcPs3S5N3suvR
   BYiE96KFqLSZiVOSKnAzgVyJ0xV/zKyn7L7A6n7YLpdOOnwiaZmKqJGwV
   YSjkzlSoQbCRbNtnpc9jXTlfP9J23rdIwpyDf2FNHivE5ohxlCD/Ov2t1
   Bl7E38kTULi9Ily5AR+pZNS+Qh0K+Nt/1N64YDzvmxacrJHmeC/sKVnOh
   +tb7YHBxXSF5k5sCDoOET5kS/v2Lli+Z+KbGnESa3p78TncDnvvlQr8Zh
   A==;
X-CSE-ConnectionGUID: zROBhpcOR+G0frutSjLkZw==
X-CSE-MsgGUID: O6EE73BiSnCfXQwhU8LyxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57871779"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="57871779"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 02:58:27 -0700
X-CSE-ConnectionGUID: I0BYqCXIQ5WNyOd9eRpN1g==
X-CSE-MsgGUID: X4ZhDOUWR4OaYRWJaDJhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="192629758"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jul 2025 02:58:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZ55j-0001IB-1j;
	Tue, 08 Jul 2025 09:58:23 +0000
Date: Tue, 8 Jul 2025 17:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/9] ARM: dts: aspeed: wedge400: Extend data0
 partition to 64MB
Message-ID: <202507081729.Yv0tF2vJ-lkp@intel.com>
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
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16-rc5 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/rentao-bupt-gmail-com/ARM-dts-aspeed-wedge400-Fix-DTB-warnings/20250706-122729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250706042404.138128-6-rentao.bupt%40gmail.com
patch subject: [PATCH v2 5/9] ARM: dts: aspeed: wedge400: Extend data0 partition to 64MB
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250706 (https://download.01.org/0day-ci/archive/20250708/202507081729.Yv0tF2vJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507081729.Yv0tF2vJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507081729.Yv0tF2vJ-lkp@intel.com/

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
