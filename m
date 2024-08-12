Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD0B191F87
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 20:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723493053; cv=none; b=gVrD5XhcwuiYjaUMdAxHqM/UKLXvJNGwe75pCT7xTzXoOxghTNFMPSP+7D7ahl6FOkEJOhtzjiUZWkSOFRCbMy8bXPSPGvLnjCUw4vxFvJiO47YdanhXgU9FKgQ1GP6OKC7Zh8zUocHBSzstiPPZs0ipFPCu2f1yFaZ9PXEFtzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723493053; c=relaxed/simple;
	bh=rM8w0vU3NyY6ubqD38IZUD5UQYBmKSTPEAE4tlxagy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gNkWLhMZc1NRxYO1GR9bSCsjqdghlb6WxSGLdOoYOhtCxAEp+7skTyKG8qfofzhABaHBCzjO8rNrtppZdST7PV+4isVDFHWAirRyFzkmpKeL6jCIE20bagBn+A8ugFciMu8XgR5Xv53bHT52tHur2CiakJ2+qNlzQG0j/MoDHKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UegYWQet; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UegYWQet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723493052; x=1755029052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rM8w0vU3NyY6ubqD38IZUD5UQYBmKSTPEAE4tlxagy0=;
  b=UegYWQetSLnGrQD/CfSuo+w+5hEfTLs5YL+9Um/mslUyK4+r6z5FHoBh
   k6oi6/yK/72ttrOgYfWyvHJaKFVlJicod4HjdAdw9Yda2XowouP2QO/g8
   x3y/400VEpaqIlRqqUJaqGED8h3mDwyvbtTMCcF2dU+Uc/oDGuXZODrNR
   08t0HhE8yQGRobRniuzA1CpdN7Lt/6gtzNJsPy82IRAuCwE6FI/e+KLXj
   ma4unEk4Nn8FNv37bQ6/LmE3Y+ZP77vFKMcDxb36Xl7/azlLw02Pb+9cT
   056tB++dSgjl5dAhf1xyGntfTDpgXLt0p3l5r6eaGibGs2I6gp5MnLXcJ
   A==;
X-CSE-ConnectionGUID: PlFag98gQkaNzOLuwF54JA==
X-CSE-MsgGUID: 1hUxfmW/R+G5c0OsGicEBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39073004"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="39073004"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 13:04:09 -0700
X-CSE-ConnectionGUID: Tc7sMb8SSSeQaoFe8tIluQ==
X-CSE-MsgGUID: /tipdnm3Tf+EtXJ7eMVRdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="58320381"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2024 13:04:06 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdbGt-000C8L-1w;
	Mon, 12 Aug 2024 20:04:03 +0000
Date: Tue, 13 Aug 2024 04:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.1.y 24/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtb: /efuse: failed to match
 any schema with compatible: ['amlogic,meson-gxbb-efuse']
Message-ID: <202408130404.o4DXrIoy-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2a5f985c90ffd8f4e2de3a2fd76f00c3e322aa6f
commit: ee5c9c2db6a7bb0c38aba7e5aea83a20d173fb47 [24/91] ODROID-N2: arm64/dts: add 'meson64_odroidn2.dts' for compability
:::::: branch date: 6 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240813/202408130404.o4DXrIoy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130404.o4DXrIoy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408130404.o4DXrIoy-lkp@intel.com/

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
