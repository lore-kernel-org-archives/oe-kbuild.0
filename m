Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F35D8633F
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Jul 2025 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752102637; cv=none; b=LuqQ+8TDpEuJ/2fHmq6wNdRrU9wV1hnoVEzgF/n3oeO+3hKScH3ndbySvt0eXUlnVkF9edU91zSlpD3ff7UsXhMeXb31DlgS7chnG0KzWMBqCV9iyk16kTQFRRE0C2AJKnsp5bc2zajCzLICWzZf4vi6jDJURBEqdYsbUXG7FX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752102637; c=relaxed/simple;
	bh=DuapvlAMDCbwXOQ453H0UTV+dksZ0UenvHXmT60xQcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAdjWW5rDqcO0vgSJgldtdqVIiM0HomLUjrDeliB1lhAGVIVdUdEVQM3Sd0JdEuukx2cOIvzmfujpejweHZYmePGt3TxwZZX07baLYH++Le9A4xETz18DFedqrwgKhWTWIvmHqaZXZaBKUaQmQG5j/EIijnlPe8NJk3y1e1YAD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kr6r9x4+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr6r9x4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752102634; x=1783638634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DuapvlAMDCbwXOQ453H0UTV+dksZ0UenvHXmT60xQcM=;
  b=kr6r9x4+7dGLoKioUbcjcVJivocH4ONZfaUTjbYr3SfRpQdeebfjzM6O
   DNX0TyOVWWsL4xPmc9geLxWvvicytekswrZE273Bv+/Ih7IBkoERieNbQ
   4aSjIXhUHVRrcgPQZN3jYGKoPr8TCmxa+xex6XBuNVzOEu6QQfOYHmFCa
   xFzZRrW7JHeX4nT7dbZr95/UWPl3DFq/Fok6vaw7zmpKVWyyD27ciVRxZ
   UHErss17QLCFLASUKU/OEXGjAHGcWlJirmr0tjhGnaBKpMRXZy45zR9ag
   8PhWqZwYXse1i6lxQZa1XK4b9IAL3KrwVZ3vcVIpP+QzrPOGG0gpQC/jD
   w==;
X-CSE-ConnectionGUID: yA+DQgHaS1GHNYaf+i3m3w==
X-CSE-MsgGUID: 23X2UrtjSraakFCMeyDMtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54504044"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="54504044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 16:10:34 -0700
X-CSE-ConnectionGUID: ptmuKmnCTMiT5v/0uZSc7g==
X-CSE-MsgGUID: 41sv3pynQS2zFQ3Y86cCYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="160451313"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2025 16:10:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZdvq-0004BD-2m;
	Wed, 09 Jul 2025 23:10:30 +0000
Date: Thu, 10 Jul 2025 07:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 9/9] ARM: dts: aspeed: Add Facebook Darwin (AST2600)
 BMC
Message-ID: <202507100623.iCoBOtVE-lkp@intel.com>
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
In-Reply-To: <20250706042404.138128-10-rentao.bupt@gmail.com>
References: <20250706042404.138128-10-rentao.bupt@gmail.com>
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
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16-rc5 next-20250708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/rentao-bupt-gmail-com/ARM-dts-aspeed-wedge400-Fix-DTB-warnings/20250706-122729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250706042404.138128-10-rentao.bupt%40gmail.com
patch subject: [PATCH v2 9/9] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20250706 (https://download.01.org/0day-ci/archive/20250710/202507100623.iCoBOtVE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100623.iCoBOtVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507100623.iCoBOtVE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: timer (arm,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: bus@1e600000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: lpc@1e789000 (aspeed,ast2600-lpc-v2): lpc-snoop@80: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: kcs@24 (aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
