Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF391AAA1E
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750184657; cv=none; b=QqwiGN2lDhg97f5pTQvwZYJAyGWPJgIIlSC5fO7iCQpzoIdeRe2365zJxggx6rM/a5PunVzmPOVhGcji2CHxz1rDKTNVJilM5C8OoJ2+If1hxFPEB37R21WdKK4+RrZWspoa60VkdRdrlyQc7avMou8l9jT5wuytot0p6YA29uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750184657; c=relaxed/simple;
	bh=IjbnNywYHTuU488w8vRbNEHXqnuYBm0egBu5v65BSyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/tg32RZdy6uIN8p1lycmJmZ91QPZ9kZLN3kKKYfzM6PxfziEEDjf6aEBKhvr1h6uJ4jStjdCbzpwqng8TM+T7Te6fqcbcMTBgS4+L9ZaDne19A4az3TZs9nIWSMJ+rSkCplKFHwq/XfsJe19O8WiTrjyuU90OYGwLchR1VqtgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqwRH+3v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqwRH+3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750184655; x=1781720655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IjbnNywYHTuU488w8vRbNEHXqnuYBm0egBu5v65BSyw=;
  b=hqwRH+3veQ8P/2qP10BAk8K7CBjByu3H9b4/g78sKvt5OQ7JbiCYu42o
   NiXFtK72UsPeOvlNwrgVhKp7+rV60jr7OvMDokqXscOUnebtiHJtnF0Ju
   lhuZ1eyDOSmqMylj8ujMuZCYA5RHWKDL+Hn5ioX5LKYCbGKi8laS0GZoN
   YNNx+FIPZvFrbwDx2XbQ7uhyi2qunt6/NUYLhe4bDZIO//xtF/6AK+/ti
   CPeuvvBLWB6AfGXtADLNb223kw/lBAC5e/V9sBNB3bSLCX278uqVl2+Hh
   fLtRkNV2UOl5oGIByxG60aHvtEHO9u+rCzdkshFwj6229DROqrH+aBM65
   g==;
X-CSE-ConnectionGUID: jAS85GpTTmabsAJ5cXDHFw==
X-CSE-MsgGUID: kLC5qFaqSeScLr9zTJWPrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52080879"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52080879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 11:24:14 -0700
X-CSE-ConnectionGUID: FOMmL5C0SyeVKGu7Qde9Wg==
X-CSE-MsgGUID: ZVALg3IwTPCW2jCmfGXbJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="179856595"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2025 11:24:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRayh-000HzS-0m;
	Tue, 17 Jun 2025 18:24:11 +0000
Date: Wed, 18 Jun 2025 02:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] ARM: tegra: Add device-tree for Asus Portable AiO
 P1801-T
Message-ID: <202506180151.BeAoB0tl-lkp@intel.com>
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
In-Reply-To: <20250616073947.13675-3-clamor95@gmail.com>
References: <20250616073947.13675-3-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Maxim Schwalm <maxim.schwalm@gmail.com>
TO: David Heidelberg <david@ixit.cz>
TO: Ion Agorria <ion@agorria.com>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-arm-tegra-Add-Asus-Portable-AiO-P1801-T/20250616-154236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250616073947.13675-3-clamor95%40gmail.com
patch subject: [PATCH v1 2/2] ARM: tegra: Add device-tree for Asus Portable AiO P1801-T
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-051-20250617 (https://download.01.org/0day-ci/archive/20250618/202506180151.BeAoB0tl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180151.BeAoB0tl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506180151.BeAoB0tl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts:55.22-61.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1154.15-1166.4: Warning (unique_unit_address_if_enabled): /usb@7d004000: duplicate unit-address (also used in node /usb-phy@7d004000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'nvidia,ddc-i2c-bus' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'nvidia,hpd-gpio' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks', 'realtek,ldo1-en-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /i2c@7000d000/pmic@2d: failed to match any schema with compatible: ['ti,tps65911']
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /bridge: failed to match any schema with compatible: ['mstar,tsumu88adt3-lf-1']

vim +55 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dts

05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  11  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  12  / {
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  13  	model = "Asus Portable AiO P1801-T";
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  14  	compatible = "asus,p1801-t", "nvidia,tegra30";
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  15  	chassis-type = "convertible";
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  16  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  17  	aliases {
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  18  		mmc0 = &sdmmc4; /* eMMC */
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  19  		mmc1 = &sdmmc1; /* uSD slot */
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  20  		mmc2 = &sdmmc3; /* WiFi */
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  21  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  22  		rtc0 = &pmic;
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  23  		rtc1 = "/rtc@7000e000";
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  24  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  25  		display0 = &hdmi;
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  26  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  27  		serial1 = &uartc; /* Bluetooth */
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  28  		serial2 = &uartb; /* GPS */
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  29  	};
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  30  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  31  	/*
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  32  	 * The decompressor and also some bootloaders rely on a
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  33  	 * pre-existing /chosen node to be available to insert the
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  34  	 * command line and merge other ATAGS info.
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  35  	 */
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  36  	chosen {};
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  37  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  38  	firmware {
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  39  		trusted-foundations {
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  40  			compatible = "tlm,trusted-foundations";
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  41  			tlm,version-major = <2>;
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  42  			tlm,version-minor = <8>;
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  43  		};
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  44  	};
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  45  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  46  	memory@80000000 {
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  47  		reg = <0x80000000 0x80000000>;
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  48  	};
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  49  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  50  	reserved-memory {
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  51  		#address-cells = <1>;
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  52  		#size-cells = <1>;
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  53  		ranges;
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16  54  
05eb98b28d80409 Svyatoslav Ryhel 2025-06-16 @55  		linux,cma@80000000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
