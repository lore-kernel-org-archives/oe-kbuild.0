Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E91917DF
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723812298; cv=none; b=CbYZbmQOKhVULUIiTYcVmAUR5rTt6tIiuIu8BzoQpv+y5kQ5wF3N5fxo+/1Ovyh7sehR4MQlwvMNP4SEfqyox5jNEpLAf75YO7oxZlJDVszCCVi1X2mkxEw1oTK11gxelgiBbNjfWMAPtYKqvJlGGAeSWJAfjqXQN0FE3vNHzlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723812298; c=relaxed/simple;
	bh=5mrvmKwFJb/1RzZ1Bn5psu3kmw1SO580RNHmuAdXS6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3+cCspZuy7xQ+OC9t4czoqLjtYITKXIxFKa+0zuM3CavDCD6RGZfq4f/4h0ooXPsrq1/TcPIUj3Hl5f7Kg8Cj3q7Kd1zI2n4A4ClWoSSibJtuwUeF3CkRu0Q/m/xyZs3kDzvb1gp9FS1K2Dw6/wRun95AiZhjiQhd7OI3QT8fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVz4QggU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVz4QggU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723812296; x=1755348296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5mrvmKwFJb/1RzZ1Bn5psu3kmw1SO580RNHmuAdXS6A=;
  b=CVz4QggUDSw0kREBI+MeWJtWQKMNukOcTAmUhxWLm5b3WJjyk2026Y+z
   FxaVDHzVCxAmN2ch1fanGfP4PyHuHz3WRv9r+wpUH0oJqVqvD87ekJsQF
   0laAxhPXmnkO74j/CBtQIeP5HBB0CtJEmL+nNZIhHkllCWGKmILXUDu5n
   NpFiL9gPHJyntro1RmMUwKanTVgu4FzFHncO/mm21OS2rRdsozSrZ8RkW
   88HEJzz6SvK22vHAsuJqw8wESLWuiBZj2ksOJYydqUkuD0/tVUqULYer8
   GKnyXX+XHvn/gSLZAMgxZ4/JONKsr3cpmQedWRkINoAJwYHFEhYbpoaCl
   w==;
X-CSE-ConnectionGUID: JUB3Kb4uRWS3AE86gBNDow==
X-CSE-MsgGUID: Y+T2rbqnTLWggzALQ1fiyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="44625445"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="44625445"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 05:44:55 -0700
X-CSE-ConnectionGUID: akh10W+QTH+63iTotA3Z0w==
X-CSE-MsgGUID: y9nFnE/FSGyRTaanQrvXkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="64333873"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2024 05:44:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sewK4-0006Q4-0u;
	Fri, 16 Aug 2024 12:44:52 +0000
Date: Fri, 16 Aug 2024 20:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.1.y 24/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /efuse: failed to match
 any schema with compatible: ['amlogic,meson-gxbb-efuse']
Message-ID: <202408162052.3z7FE6dm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2ab07fb3568ffe3b7e17805f28619cd38a41f370
commit: ee5c9c2db6a7bb0c38aba7e5aea83a20d173fb47 [24/91] ODROID-N2: arm64/dts: add 'meson64_odroidn2.dts' for compability
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240816/202408162052.3z7FE6dm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162052.3z7FE6dm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408162052.3z7FE6dm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1731.28-2003.7: Warning (unit_address_vs_reg): /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:265.33-1539.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gxbb-efuse']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/pcie@fc000000: failed to match any schema with compatible: ['amlogic,g12a-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@34400/pinctrl@40: failed to match any schema with compatible: ['amlogic,meson-g12a-periphs-pinctrl']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/phy@36000: failed to match any schema with compatible: ['amlogic,g12a-usb2-phy']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/phy@3a000: failed to match any schema with compatible: ['amlogic,g12a-usb2-phy']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@3c000/system-controller@0: failed to match any schema with compatible: ['amlogic,meson-gx-hhi-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@3c000/system-controller@0/clock-controller: failed to match any schema with compatible: ['amlogic,g12b-clkc']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/phy@46000: failed to match any schema with compatible: ['amlogic,g12a-usb3-pcie-phy']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/mdio-multiplexer@4c000: failed to match any schema with compatible: ['amlogic,g12a-mdio-mux']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/audio-controller@40000: failed to match any schema with compatible: ['amlogic,g12a-pdm', 'amlogic,axg-pdm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/audio-controller@40000: failed to match any schema with compatible: ['amlogic,g12a-pdm', 'amlogic,axg-pdm']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@100: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@100: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@140: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@140: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@180: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@180: failed to match any schema with compatible: ['amlogic,g12a-toddr', 'amlogic,axg-toddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@1c0: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@1c0: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@200: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@200: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@240: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@240: failed to match any schema with compatible: ['amlogic,g12a-frddr', 'amlogic,axg-frddr']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@300: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@300: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@340: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@340: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@380: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@380: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@3c0: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@3c0: failed to match any schema with compatible: ['amlogic,g12a-tdmin', 'amlogic,axg-tdmin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@400: failed to match any schema with compatible: ['amlogic,g12a-spdifin', 'amlogic,axg-spdifin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@400: failed to match any schema with compatible: ['amlogic,g12a-spdifin', 'amlogic,axg-spdifin']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@480: failed to match any schema with compatible: ['amlogic,g12a-spdifout', 'amlogic,axg-spdifout']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@480: failed to match any schema with compatible: ['amlogic,g12a-spdifout', 'amlogic,axg-spdifout']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@500: failed to match any schema with compatible: ['amlogic,g12a-tdmout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@540: failed to match any schema with compatible: ['amlogic,g12a-tdmout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@580: failed to match any schema with compatible: ['amlogic,g12a-tdmout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@680: failed to match any schema with compatible: ['amlogic,g12a-spdifout', 'amlogic,axg-spdifout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@680: failed to match any schema with compatible: ['amlogic,g12a-spdifout', 'amlogic,axg-spdifout']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/sys-ctrl@0: failed to match any schema with compatible: ['amlogic,meson-gx-ao-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-g12a-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/sys-ctrl@0/pinctrl@14: failed to match any schema with compatible: ['amlogic,meson-g12a-aobus-pinctrl']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/rtc@a8: failed to match any schema with compatible: ['amlogic,meson-vrtc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/pwm@2000: failed to match any schema with compatible: ['amlogic,meson-g12a-ao-pwm-cd']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/pwm@7000: failed to match any schema with compatible: ['amlogic,meson-g12a-ao-pwm-ab']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ff800000/ir@8000: failed to match any schema with compatible: ['amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/interrupt-controller@f080: failed to match any schema with compatible: ['amlogic,meson-g12a-gpio-intc', 'amlogic,meson-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/interrupt-controller@f080: failed to match any schema with compatible: ['amlogic,meson-g12a-gpio-intc', 'amlogic,meson-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/pwm@19000: failed to match any schema with compatible: ['amlogic,meson-g12a-ee-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/pwm@1a000: failed to match any schema with compatible: ['amlogic,meson-g12a-ee-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/pwm@1b000: failed to match any schema with compatible: ['amlogic,meson-g12a-ee-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/bus@ffd00000/clock-measure@18000: failed to match any schema with compatible: ['amlogic,meson-g12a-clk-measure']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/sd@ffe03000: failed to match any schema with compatible: ['amlogic,meson-axg-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/sd@ffe05000: failed to match any schema with compatible: ['amlogic,meson-axg-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /soc/mmc@ffe07000: failed to match any schema with compatible: ['amlogic,meson-axg-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /audio-controller-0: failed to match any schema with compatible: ['amlogic,axg-tdm-iface']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /audio-controller-1: failed to match any schema with compatible: ['amlogic,axg-tdm-iface']
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /audio-controller-2: failed to match any schema with compatible: ['amlogic,axg-tdm-iface']
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: l2-cache0: 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /sound: failed to match any schema with compatible: ['amlogic,axg-sound-card']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
