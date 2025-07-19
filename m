Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C1618A6DF
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 22:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752964271; cv=none; b=I02moWYidLawI7XsU9lpPkdWzcahTHILf3jwrVQOYho0pmyBGiRcEQ5chovMWStlJh2FdcZoMejFqrTjOq9A+BpqbloFC9fQChtPlUrw6F1Gnyi3l6IGW71KBTXU7LKKuqt7nKIoOfEtWvSCorFNJBF0AldKLYUgiOJM6HYifFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752964271; c=relaxed/simple;
	bh=nfgrl3ruK3xI2YaiZK1/QCBmGZt815tgH8P5isFjpKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncNHTLsWmvpvsD3o2Im7HlmqFI5nPTX2Caexn8EHBJA6DCdbSKrHDIvwL2be0GJwntAhx/t16qEmGRH98xO/dTUU+ZJR4HFCi7j7JCVKP0YnLRPODoM7sKCsFl4sx733yiYQPJcEP6Bv4bFV0LYmBWmI8H/bsAym/eLS6dgZYg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQ+5yQDQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQ+5yQDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752964269; x=1784500269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfgrl3ruK3xI2YaiZK1/QCBmGZt815tgH8P5isFjpKk=;
  b=TQ+5yQDQNS6RdM569KeFz8Mr1YjxrfAFK1a5LgndjbvnDxa6A1Tqur5A
   jvG/poVjU/NM145HtZkEPRKA1+WPI8qpr8XfUZXCN1SyE8bK0sa7d3vpW
   NLvSk2+kcCty26mXZRwT7x0eRnXAB3yg1f/ju5qe1SVTF3wGcjDF2YsWd
   8rlOrO5AOvuP55ITPwe1kETdFZ8LR44Kp6E31YgPGVok86Xw3IMkyg4pt
   bq3E5uFvs+pTiKO466eYY70C8g6tixp4c5+l7cUoYM3f2RZNyx279Si/I
   3hd0SzKjO9kSmp8nl3uBC8ePOhuxSZQ7yiFkH3yvk4tzojq5uj+lCXxSD
   Q==;
X-CSE-ConnectionGUID: mw3+9tIBQLuyR8ZP1nC0kQ==
X-CSE-MsgGUID: eAiJ3KkyT9i6bwlODcy7xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="54936370"
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="54936370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 15:31:09 -0700
X-CSE-ConnectionGUID: x551JIyJRNuInnyL53FqMA==
X-CSE-MsgGUID: W3NQdDSqSgm0AiCxGYyJCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="159205330"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jul 2025 15:31:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udG5B-000Fob-1h;
	Sat, 19 Jul 2025 22:31:05 +0000
Date: Sun, 20 Jul 2025 06:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brgl:gpio/for-next 95/99]
 arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000000
 (cirrus,ep7209-gpio): reg: [[2147483648, 1], [2147483712, 1]] is too long
Message-ID: <202507200843.pivebZZ7-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   5607f5ed3c5f30f41e72ce09c8e616af0fc0d474
commit: f03a7f20b23c1abb1066f791806bbca406362324 [95/99] dt-bindings: gpio: Create a trivial GPIO schema
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250718 (https://download.01.org/0day-ci/archive/20250720/202507200843.pivebZZ7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507200843.pivebZZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507200843.pivebZZ7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/cirrus/ep7209.dtsi:44.23-49.5: Warning (unique_unit_address_if_enabled): /soc/clks@80000000: duplicate unit-address (also used in node /soc/gpio@80000000)
   arch/arm/boot/dts/cirrus/ep7209.dtsi:51.23-56.5: Warning (unique_unit_address_if_enabled): /soc/intc@80000000: duplicate unit-address (also used in node /soc/gpio@80000000)
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /: failed to match any schema with compatible: ['cirrus,edb7211', 'cirrus,ep7211', 'cirrus,ep7209']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /: failed to match any schema with compatible: ['cirrus,edb7211', 'cirrus,ep7211', 'cirrus,ep7209']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /: failed to match any schema with compatible: ['cirrus,edb7211', 'cirrus,ep7211', 'cirrus,ep7209']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: cpus: #address-cells: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: cpu (arm,arm720t): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /soc/clks@80000000: failed to match any schema with compatible: ['cirrus,ep7209-clk']
>> arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000000 (cirrus,ep7209-gpio): reg: [[2147483648, 1], [2147483712, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000001 (cirrus,ep7209-gpio): reg: [[2147483649, 1], [2147483713, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000003 (cirrus,ep7209-gpio): reg: [[2147483651, 1], [2147483715, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: gpio@80000083 (cirrus,ep7209-gpio): reg: [[2147483779, 1], [2147483843, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: /soc/bus@80000180: failed to match any schema with compatible: ['cirrus,ep7209-bus', 'simple-bus']
   arch/arm/boot/dts/cirrus/ep7211-edb7211.dtb: nor@0 (cfi-flash): $nodename:0: 'nor@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
