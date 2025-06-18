Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC6B3085CC
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 22:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750287467; cv=none; b=ilBLAL7Pss4awDNacxlWTXfKjnPeIPLexguTtGqBCnvbwU/CtTz2YyR8SGpaJrWgE7NOeXem+loNWYxs1ytnO+gtFs/8eyujH1ZEeBuIH3RYO7Y5kR46o+Sm1GljuL+ZdBjk70Xo2wA7DJYFRSfHBM+b+hNw3585NA+E+TyBdvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750287467; c=relaxed/simple;
	bh=DsV5UfblYe9nj6q4knJcZh6i21lnyVOZ+2Tz/4IvrFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVv/HEa706ex/tFGaq86lkzQrF5VWSaKLNLzOzzATZbD7E8OKn57ztOJAhnbAvOyEPzhIQVB1D/QY/2rCol2TUUuRCpvyBokJoZ9qTARlQfTAnYawj8Xdsy/ueo50vyYtmZwov7C6nGsyjFxLuFaQ5pgKjXhxUtMrCPNJYnqgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb5/+67o; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb5/+67o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750287465; x=1781823465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DsV5UfblYe9nj6q4knJcZh6i21lnyVOZ+2Tz/4IvrFM=;
  b=Yb5/+67o5uhXIJPNHVxHGX2hUJyQgUr7sfYquaH8DSJtZjsaWhv2Eci6
   RMhnfXvnKW3xcUOJzWtj71F5JQIWpD8xcFyhDXIoZEFDX+Rf4kSCocwPa
   Mp9jLBFCFtb6sO7jxiMOreAkWeE93RfXqrgfwETqGsPkjsvOyEj6dsb5z
   IwSmFA+4KJ7LJfHYHQ8XYAf0+93iHZPy7+hvHlN5f1AdzIaS9sfOIh2Ca
   n3wLe0qHVgh9CLHmj3XNs57/ZStWkkF77vtfoQCbUGQH9a2tVtUv8T3+a
   6rKf9jL5MwDjrJgkDJBFzA13qH0VJwJt2KNZqsxsGNdwJOBj3l7f5fjg/
   w==;
X-CSE-ConnectionGUID: dsTyNz2UTo6W3Be2je/vsQ==
X-CSE-MsgGUID: XhGdLkCHTmWkfJBdFOe0vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40138283"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="40138283"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 15:57:45 -0700
X-CSE-ConnectionGUID: 49biSVOxRwuF00/YUBKShg==
X-CSE-MsgGUID: pT/Q76/FTGi3/HC0AltDAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="150779499"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jun 2025 15:57:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS1iw-000KEk-16;
	Wed, 18 Jun 2025 22:57:42 +0000
Date: Thu, 19 Jun 2025 06:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] ARM: tegra: Add device-tree for ASUS VivoTab RT
 TF600T
Message-ID: <202506190651.D3f6dWGz-lkp@intel.com>
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
In-Reply-To: <20250617070320.9153-3-clamor95@gmail.com>
References: <20250617070320.9153-3-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: David Heidelberg <david@ixit.cz>
TO: Ion Agorria <ion@agorria.com>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-arm-tegra-Add-Asus-VivoTab-RT-TF600T/20250617-150708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250617070320.9153-3-clamor95%40gmail.com
patch subject: [PATCH v1 2/2] ARM: tegra: Add device-tree for ASUS VivoTab RT TF600T
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250618 (https://download.01.org/0day-ci/archive/20250619/202506190651.D3f6dWGz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190651.D3f6dWGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506190651.D3f6dWGz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts:48.22-54.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1110.15-1123.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1196.15-1208.4: Warning (unique_unit_address_if_enabled): /usb@7d008000: duplicate unit-address (also used in node /usb-phy@7d008000)
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /i2c@7000c500/flash-led@33: failed to match any schema with compatible: ['ti,tps61052']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /i2c@7000d000/pmic@2d: failed to match any schema with compatible: ['ti,tps65911']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: light-sensor@48 (capella,cm32181): 'vdd-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
>> arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']

vim +48 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts

fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  12  
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  13  / {
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  14  	model = "Asus VivoTab RT TF600T";
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  15  	compatible = "asus,tf600t", "nvidia,tegra30";
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  16  	chassis-type = "convertible";
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  17  
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  18  	aliases {
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  19  		mmc0 = &sdmmc4; /* eMMC */
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  20  		mmc1 = &sdmmc1; /* uSD slot */
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  21  		mmc2 = &sdmmc3; /* WiFi */
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  22  
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  23  		rtc0 = &pmic;
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  24  		rtc1 = "/rtc@7000e000";
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  25  
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  26  		display1 = &hdmi;
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  27  
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  28  		serial1 = &uartc; /* Bluetooth */
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  29  		serial2 = &uartb; /* GPS */
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  30  	};
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  31  
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  32  	/*
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  33  	 * The decompressor and also some bootloaders rely on a
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  34  	 * pre-existing /chosen node to be available to insert the
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  35  	 * command line and merge other ATAGS info.
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  36  	 */
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  37  	chosen {};
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  38  
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  39  	memory@80000000 {
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  40  		reg = <0x80000000 0x80000000>;
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  41  	};
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  42  
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  43  	reserved-memory {
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  44  		#address-cells = <1>;
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  45  		#size-cells = <1>;
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  46  		ranges;
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17  47  
fbcc4c6dc57b9e Svyatoslav Ryhel 2025-06-17 @48  		linux,cma@80000000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
