Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD992750FB
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 07:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771485160; cv=none; b=Ji24VFHVyWVEGEMaAUiM3RItU/3o85K8+Lwm3sFKqDkLMoEWFOF9+TiPLK0/yCHK956PGf0K6QI9BI1SUTUsHtMHYEyqtejbrQZwNC9keFOsRjl+59SEwh12J0u6PQOdBqGGHnY0+GJT2maK5/sjRZpfQn7FCZv64tX5jDJlMKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771485160; c=relaxed/simple;
	bh=mlDgRqXIPR4Bm68zN9tj4REIiuOwS5Bko7cLmP017YY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R8l6XZxYfZGJrdn7bsQR/wK4KYajv/slea8cXMGwiXz6oWNei7zVTQF6W1zhi2JENfE+v6ZKXDxjeDEUKwZl7VnyaVqJvNM7AfcVA0zQix0cGKbfmIdUrpwUltePbRekl/LoOrvS5ul3lJAcS8Mw5N3tBXl/PxDl8Gbcw5cYR0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULpLxpWq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULpLxpWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771485159; x=1803021159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mlDgRqXIPR4Bm68zN9tj4REIiuOwS5Bko7cLmP017YY=;
  b=ULpLxpWqJbAf78EOnjr+AAlXo6GyOgab0InRKfQDDPvGguS+H0xtw5O4
   IpuXFZO/uR39nYETLd1Bfq+JtEIeJ/S1Q1yy+3CII9FQZtX26cY0NV+Sx
   sQToJar6uqkENzEXQ4gMisMbSQmqE6qjbEAQG5RBdfJr3brcxYKLNIk8I
   sCY+DYPs7r5yt7Q0IhHCk7b/PKLcmH4P33uf/sBa4WwZOdwIuZF0Ym94n
   FtsK3vWm+ywWWkVpjZ/GwbDOZrSFcvskkQme+Xwejf7yS9+smhgqI6RWG
   6Xhb0VmTxJFznchbIXkunikyGAXBMYyfgAgem6ZXQiK4skhl0BIUzWPDR
   A==;
X-CSE-ConnectionGUID: AJOmjN2BQ++DXtuHH0lUBg==
X-CSE-MsgGUID: vu3vojvITg2ZLtPpjkVFuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71769406"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="71769406"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:12:38 -0800
X-CSE-ConnectionGUID: q/2c/Gt/QOquI7x5NOMvzA==
X-CSE-MsgGUID: +v/KlKDNR/uEjDsiYjPYnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="212702410"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2026 23:12:37 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsyDD-000000003wX-1QB8;
	Thu, 19 Feb 2026 07:12:35 +0000
Date: Thu, 19 Feb 2026 08:11:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/7] arm64: dts: amlogic: Add clock and EMMC for T7
Message-ID: <202602190858.SkfjjdFX-lkp@intel.com>
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
In-Reply-To: <20260218102045.35633-1-linux-kernel-dev@aliel.fr>
References: <20260218102045.35633-1-linux-kernel-dev@aliel.fr>
TO: Ronald Claveau <linux-kernel-dev@aliel.fr>
TO: linux-amlogic@lists.infradead.org
CC: Ronald Claveau <linux-kernel-dev@aliel.fr>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Kevin Hilman <khilman@baylibre.com>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Ronald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master next-20260218]
[cannot apply to robh/for-next v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ronald-Claveau/dt-bindings-clk-meson-Add-Amlogic-T7-fix-pll-support/20260218-183657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260218102045.35633-1-linux-kernel-dev%40aliel.fr
patch subject: [PATCH 6/7] arm64: dts: amlogic: Add clock and EMMC for T7
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-2052-20260218 (https://download.01.org/0day-ci/archive/20260219/202602190858.SkfjjdFX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190858.SkfjjdFX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602190858.SkfjjdFX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:261.34-337.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:261.34-337.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: interrupt-controller@fff01000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
>> 	arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: interrupt-controller@fff01000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   		['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
   		'nvidia,tegra210-agic' was expected
   		'arm,cortex-a15-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic', 'nvidia,tegra264-agic']
   	'arm,gic-400' was expected
   	'arm,arm1176jzf-devchip-gic' was expected
   	'brcm,brahma-b15-gic' was expected
   	'arm,cortex-a9-gic' is not one of ['arm,cortex-a15-gic', 'arm,cortex-a7-gic']
   	'arm,arm11mp-gic' was expected
   	'arm,cortex-a15-gic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:1: 'sys' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:2: 'fix' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:3: 'fdiv2' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:4: 'fdiv2p5' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:5: 'fdiv3' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:6: 'fdiv4' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:7: 'fdiv5' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:8: 'fdiv7' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:9: 'hifi' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names: ['xtal', 'fdiv2', 'fdiv2p5', 'fdiv3', 'fdiv4', 'fdiv5', 'hifi', 'mpll2', 'mpll3', 'gp0'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clocks: [[12], [13, 3], [13, 5], [13, 7], [13, 9], [13, 11], [14, 1], [15, 6], [15, 8], [16, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@8040 (amlogic,t7-fpll): clock-names:0: 'in0' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml
--
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:261.34-337.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:261.34-337.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: interrupt-controller@fff01000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
>> 	arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: interrupt-controller@fff01000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   		['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
   		'nvidia,tegra210-agic' was expected
   		'arm,cortex-a15-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic', 'nvidia,tegra264-agic']
   	'arm,gic-400' was expected
   	'arm,arm1176jzf-devchip-gic' was expected
   	'brcm,brahma-b15-gic' was expected
   	'arm,cortex-a9-gic' is not one of ['arm,cortex-a15-gic', 'arm,cortex-a7-gic']
   	'arm,arm11mp-gic' was expected
   	'arm,cortex-a15-gic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:1: 'sys' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:2: 'fix' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:3: 'fdiv2' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:4: 'fdiv2p5' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:5: 'fdiv3' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:6: 'fdiv4' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:7: 'fdiv5' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:8: 'fdiv7' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:9: 'hifi' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names: ['xtal', 'fdiv2', 'fdiv2p5', 'fdiv3', 'fdiv4', 'fdiv5', 'hifi', 'mpll2', 'mpll3', 'gp0'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clocks: [[12], [13, 3], [13, 5], [13, 7], [13, 9], [13, 11], [14, 1], [15, 6], [15, 8], [16, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@8040 (amlogic,t7-fpll): clock-names:0: 'in0' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
