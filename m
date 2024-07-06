Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E3933FD
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 02:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720233926; cv=none; b=RhNBU/uoKMqTYib4XTk8yuCqvdgPYq7PjDOHVp2Bqni+f0QDPrTsS8L/VYc3LVgjoG8kSF8gOFDN9T9ADDO8ZHxRAKdKLxFPUpo/esPW3O8Ed+PmDuXWORFwWnWYTt6T9JPLIYptRdCjOKTVMn0r/bWlZ6EUO/ScdHJjNWGyZ3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720233926; c=relaxed/simple;
	bh=DGEyqRDEPTkTrjs1uU03yDeErLv/5l6EXICejQ6akB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTQyPjaGojFxlkDgHn4jlHAOfxZk3qOvMfTi9EO97D5kuJ/va+hOM1kJj7MZQ0gs5lBEy+7DiZ24yIbNlPs0Sx2Mz2Xh/+MPiodzvcN7elhfnmDTQyL9FsvxUWjoP7WtjGXpfS/S04tkZi5lo/OJYW23qxgs6yusV5pMkLe84SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsRCLhRw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsRCLhRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720233924; x=1751769924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGEyqRDEPTkTrjs1uU03yDeErLv/5l6EXICejQ6akB0=;
  b=RsRCLhRw99cf8b2PF6DPEDgJQsqj7OATfWcRy5+hl4aWYmIgNNxGgqg9
   XSY/yaRRfotr0tc/9076loTULW6BUE9w8ifZf+FJffJphsBs0Rzj9+uei
   AJCulGfTp+KQVY/HS8VOahiOK/qcqPUztR93tA7Yp44ysbWxkSASlVEFN
   r2hOcxyihTgLQVGvMkGSPq885IGlkJRvJRHQrU0PMjS69hc6eCD3O1XWE
   RnGqPOxmaewo2cKfO/I58eXh0vDX62EyqF1mhNNnO1ysffubKHenYQAMx
   qE7Z4EYM29o3BKY/a8oLHdEpOcjDro5oHETEUDbQw62Go+bA3Pk7CFFEf
   Q==;
X-CSE-ConnectionGUID: 7fWcPtNfSXGxLXo7T7u7EA==
X-CSE-MsgGUID: rzg7wktDRdyn6wXhvyYQnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21386184"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="21386184"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 19:45:23 -0700
X-CSE-ConnectionGUID: ld69hmcxSeecfSAKOzNtxQ==
X-CSE-MsgGUID: Gc3zc8EDQKu34rsPlz/R6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="51959182"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Jul 2024 19:45:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPvQN-000TEW-0D;
	Sat, 06 Jul 2024 02:45:19 +0000
Date: Sat, 6 Jul 2024 10:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 5/5] arm64: dts: add description for solidrun cn9132
 cex7 module and clearfog board
Message-ID: <202407061008.MIKJdMGw-lkp@intel.com>
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
In-Reply-To: <20240704-cn9130-som-v7-5-eea606ba5faa@solid-run.com>
References: <20240704-cn9130-som-v7-5-eea606ba5faa@solid-run.com>
TO: Josua Mayer <josua@solid-run.com>

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/dt-bindings-arm64-marvell-add-solidrun-cn9130-som-based-boards/20240705-135940
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240704-cn9130-som-v7-5-eea606ba5faa%40solid-run.com
patch subject: [PATCH v7 5/5] arm64: dts: add description for solidrun cn9132 cex7 module and clearfog board
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20240705 (https://download.01.org/0day-ci/archive/20240706/202407061008.MIKJdMGw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061008.MIKJdMGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407061008.MIKJdMGw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2/config-space@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2/config-space@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/pmu: missing or empty reg/ranges property
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: ap807: $nodename:0: 'ap807' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: config-space@f0000000: $nodename:0: 'config-space@f0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: config-space@f0000000: pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: config-space@f0000000: timer: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/odmi@300000: failed to match any schema with compatible: ['marvell,odmi-controller']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/gicp@3f0040: failed to match any schema with compatible: ['marvell,ap806-gicp']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/interrupt-controller@3f0100: failed to match any schema with compatible: ['marvell,armada-8k-pic']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/interrupt-controller@3f0200: failed to match any schema with compatible: ['marvell,ap806-sei']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/xor@400000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/xor@400000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/xor@420000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/xor@420000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/xor@440000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/xor@440000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/xor@460000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/xor@460000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/spi@510600: failed to match any schema with compatible: ['marvell,armada-380-spi']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: mmc@6e0000: clocks: [[4, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: mmc@6e0000: clock-names: ['core'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: mmc@6e0000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f4000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@1040: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f8000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /ap807/config-space@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: cp0: $nodename:0: 'cp0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: config-space@f2000000: $nodename:0: 'config-space@f2000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'pwm-tacho-irq-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: utmi@580000: 'swap-dx-lanes' does not match any of the regexes: '^usb-phy@[0|1]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-cp110-utmi-phy.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@510000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/i2c@701100/i2c-mux@77/i2c@3/adc@48: failed to match any schema with compatible: ['ti,tla2021']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: trng@760000: compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: trng@760000: compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/config-space@f2000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: mmc@780000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: cp1: $nodename:0: 'cp1' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: config-space@f4000000: $nodename:0: 'config-space@f4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: utmi@580000: 'swap-dx-lanes' does not match any of the regexes: '^usb-phy@[0|1]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,armada-cp110-utmi-phy.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: trng@760000: compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: trng@760000: compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/config-space@f4000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: cp2: $nodename:0: 'cp2' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: config-space@f6000000: $nodename:0: 'config-space@f6000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/phy@120000: failed to match any schema with compatible: ['marvell,comphy-cp110']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/interrupt-controller@1e0000: failed to match any schema with compatible: ['marvell,cp110-icu']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/interrupt-controller@1e0000/interrupt-controller@10: failed to match any schema with compatible: ['marvell,cp110-icu-nsr']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/interrupt-controller@1e0000/interrupt-controller@50: failed to match any schema with compatible: ['marvell,cp110-icu-sei']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@100: Unevaluated properties are not allowed ('gpio-ranges', 'm2-wwan-reset-hog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: gpio@140: Unevaluated properties are not allowed ('gpio-ranges' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mvebu.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000: Unevaluated properties are not allowed ('dma-coherent', 'dr_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/xor@6a0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/xor@6c0000: failed to match any schema with compatible: ['marvell,armada-7k-xor', 'marvell,xor-v2']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: trng@760000: compatible:0: 'marvell,armada-8k-rng' is not one of ['ti,omap2-rng', 'ti,omap4-rng', 'inside-secure,safexcel-eip76']
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: trng@760000: compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76'] is too long
   	from schema $id: http://devicetree.org/schemas/rng/omap_rng.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/config-space@f6000000/trng@760000: failed to match any schema with compatible: ['marvell,armada-8k-rng', 'inside-secure,safexcel-eip76']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: crypto@800000: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/pcie@f6600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/pcie@f6620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2/pcie@f6640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
