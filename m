Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04681F461D
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756119410; cv=none; b=Vk/zAxHzkW2IWcxRIxGfqq4b9uIZoW4HX6kSva2BXScocMzvRbbfObG4qw1iJYojU5vBrfJKO5YXx5lRBNeUC4WLF8X4XzpLFc4T7P5CNK9IKkz7eA4SafoeMO+0ppKwkev7qHvLVPLpuzyHgLgBRyZZrKZnMxlLo8rs5SPid9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756119410; c=relaxed/simple;
	bh=zXa7LjA4H3SL/dV8Qw1VF//Sl11xoFplZthzhVfNH4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEPIds505/Q6OjZtZm0jCty0SAjw/kWEksYOg9RJ3XWwzprfszLpEJR8iQ/zOmySl9bKI1hGOf/amFir6nt4cnh4/YKQ/p1RssqdIvkiDuls/KCxsTHaa0zuKyO5v4SCUKZd8Y7L9jLsmPJoJG06zCt/M24YmCWTFPJJqVFYeDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYAs5q3x; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYAs5q3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756119409; x=1787655409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXa7LjA4H3SL/dV8Qw1VF//Sl11xoFplZthzhVfNH4o=;
  b=FYAs5q3xaiy6JGL75uZXzDUEog9Oz6S0zD53lDAnmjGFuoShyJqpXazh
   UWmAbpc8amj7MbJ+PmPUD5TLGinITo+Ral5iR3siMnUk0PSAHdJ2S+pwA
   HbdxfevGJ1XUrGNOphG3szWE7YVEHQwcDUMHNBzpUcmRg/VD95lyZtXWv
   EkR0VMjfwPVFbP9zmTzzLUfjGb5Db3G6ZFIF3AKJmCXnZPhBtjGPD24mA
   DCbDBjYQ7niBJnKMRTUFEKtxeY93mnclrK4OMZln7koiPntZAvPLxgNVL
   xBGhA/zGmMCaR9ViYThvKuUVIExee4n0dq1LZE5sLYgX20LwoAOqBV0Gk
   w==;
X-CSE-ConnectionGUID: 99CuQ7DnS5O90ZcDEHtuew==
X-CSE-MsgGUID: 6OHRSZgrQaqj6gl4wGdFvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69430772"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69430772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 03:56:48 -0700
X-CSE-ConnectionGUID: g9V2SN+xQJCZUWBJ74L1kQ==
X-CSE-MsgGUID: OmiOJloiRoamJfmmgBg87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169657163"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2025 03:56:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqUrs-000Nbv-1f;
	Mon, 25 Aug 2025 10:56:20 +0000
Date: Mon, 25 Aug 2025 18:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC 3/3] ARM: dts: ti/omap: epson-bt2ws: add touchpad
Message-ID: <202508251843.sCa7ZXyD-lkp@intel.com>
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
In-Reply-To: <20250825-ektp-submit-v1-3-1dd476c1277b@kemnade.info>
References: <20250825-ektp-submit-v1-3-1dd476c1277b@kemnade.info>
TO: Andreas Kemnade <andreas@kemnade.info>

Hi Andreas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1b237f190eb3d36f52dffe07a40b5eb210280e00]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-input-elan-Introduce-Elan-eKTP1059-Touchpad/20250825-061128
base:   1b237f190eb3d36f52dffe07a40b5eb210280e00
patch link:    https://lore.kernel.org/r/20250825-ektp-submit-v1-3-1dd476c1277b%40kemnade.info
patch subject: [PATCH RFC 3/3] ARM: dts: ti/omap: epson-bt2ws: add touchpad
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-051-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251843.sCa7ZXyD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251843.sCa7ZXyD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508251843.sCa7ZXyD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/pmic@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/pmic@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/pmic@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: imu@68 (invensense,mpu9150): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/imu/invensense,mpu6050.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: imu@68 (invensense,mpu9150): Unevaluated properties are not allowed ('interrupt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/imu/invensense,mpu6050.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: touchpad@0 (elan,ektp1059): 'spi-cpha', 'spi-cpol', 'spi-max-frequency' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/elan,ektp1059.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: wlcore@2 (ti,wl1283): interrupt-names: ['irq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/ti,wlcore.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: wlcore@2 (ti,wl1283): Unevaluated properties are not allowed ('interrupt-names' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
