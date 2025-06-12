Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1031DED60
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Jun 2025 23:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771437; cv=none; b=D8XNlfuO7uGyyBlwkgKWMsA9l9HMGNYMjy3iTfLkworfwkzAohweg/Hyp7JepB2f4x/UvGuQabpuzJiU3HwZ9xKxKzZmMbKY9u6QI/ZvGAMzTiNd6UeJpAAf/5SAfqjMc9D6OmjuqMlrU1XR0DPo0yXXmndiO51bLr2P+GDiAtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771437; c=relaxed/simple;
	bh=Hg7B1VmTwj1wBgijXUV1ukhLaVI/bD6iWz9YP+ZMKe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r1t5pq9DPYpFKlL/tKgNnT1hl6FSaPUArDqXSurQHdx0ei3apVM6DwIh+Vr6ulwRlutsincygtEkxpHEdyg6AYRizNDdU6WfxUvOxDmhhC6BczUlw1XRSPCEYd2Eb1dmUkxpPJzzFOoSEAXkO8YtfgTwWr+dl+2iDJxX9Ao4BqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drtu9MAv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drtu9MAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749771433; x=1781307433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hg7B1VmTwj1wBgijXUV1ukhLaVI/bD6iWz9YP+ZMKe0=;
  b=drtu9MAvkFeIAq0VMevlkWQwJpu6YETPyoM05+h8Z6r+Ml3b2+2bNpVZ
   gp1F8eX0WVSTRiUBQX0adJ7kxKu1Gf8Q2+g+TXZpI4dNWFsTtnJFNAHW1
   vIW0Jv8q1uQo2tvNWcWH6133N58fKHCKP8+xcspoZBVLQ/WWk1SU9RjpI
   YIDrtM+GzSdgJeStjXvu1GEadckcsXZyCub90fW25yOFaMarRkaAayrku
   bxuXwE2imOSshmlITUPiyxmKVDCfpQ7SdRTETcPmNsI+TVNLUEBlpxYy8
   b9cTzoijprxPyoywLAFVefyZr0vD4/TAOI1P6XcZb2ZgQmyDHtmtKeDNA
   w==;
X-CSE-ConnectionGUID: JHv+xH74QbeNnJSLIbSH4A==
X-CSE-MsgGUID: UBNpbJoQT7ebYz2xQ7lPHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62584470"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="62584470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 16:37:12 -0700
X-CSE-ConnectionGUID: R0dqgE7USnyOTY8nhqn2zA==
X-CSE-MsgGUID: CBuQ7s/PQRWWrFvh/s6T9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152436939"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2025 16:37:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPrTo-000C1q-2I;
	Thu, 12 Jun 2025 23:37:08 +0000
Date: Fri, 13 Jun 2025 07:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: crypto: Convert ti,omap4-des to DT schema
Message-ID: <202506130713.vYAbGrhO-lkp@intel.com>
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
In-Reply-To: <20250611231058.1402457-1-robh@kernel.org>
References: <20250611231058.1402457-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master krzk-dt/for-next linus/master v6.16-rc1 next-20250612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-crypto-Convert-ti-omap4-des-to-DT-schema/20250612-071304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250611231058.1402457-1-robh%40kernel.org
patch subject: [PATCH v2] dt-bindings: crypto: Convert ti,omap4-des to DT schema
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm-randconfig-054-20250612 (https://download.01.org/0day-ci/archive/20250613/202506130713.vYAbGrhO-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130713.vYAbGrhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506130713.vYAbGrhO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/regulator: failed to match any schema with compatible: ['motorola,mapphone-cpcap-regulator']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/rtc: failed to match any schema with compatible: ['motorola,cpcap-rtc']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/phy: failed to match any schema with compatible: ['motorola,mapphone-cpcap-usb-phy']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-adl: failed to match any schema with compatible: ['motorola,cpcap-led-adl']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-cp: failed to match any schema with compatible: ['motorola,cpcap-led-cp']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
--
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/regulator: failed to match any schema with compatible: ['motorola,mapphone-cpcap-regulator']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/rtc: failed to match any schema with compatible: ['motorola,cpcap-rtc']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/phy: failed to match any schema with compatible: ['motorola,mapphone-cpcap-usb-phy']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-adl: failed to match any schema with compatible: ['motorola,cpcap-led-adl']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-cp: failed to match any schema with compatible: ['motorola,cpcap-led-cp']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
--
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/pmic@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/pmic@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: imu@68 (invensense,mpu9150): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/imu/invensense,mpu6050.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: imu@68 (invensense,mpu9150): Unevaluated properties are not allowed ('interrupt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/imu/invensense,mpu6050.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: wlcore@2 (ti,wl1283): interrupt-names: ['irq'] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/ti,wlcore.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: wlcore@2 (ti,wl1283): Unevaluated properties are not allowed ('interrupt-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/ti,wlcore.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-panda.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-panda.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/eth@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/eth@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/eth@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/eth@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
--
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/regulator: failed to match any schema with compatible: ['motorola,mapphone-cpcap-regulator']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/rtc: failed to match any schema with compatible: ['motorola,cpcap-rtc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/phy: failed to match any schema with compatible: ['motorola,mapphone-cpcap-usb-phy']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-adl: failed to match any schema with compatible: ['motorola,cpcap-led-adl']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-cp: failed to match any schema with compatible: ['motorola,cpcap-led-cp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz609.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
--
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/regulator: failed to match any schema with compatible: ['motorola,mapphone-cpcap-regulator']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/rtc: failed to match any schema with compatible: ['motorola,cpcap-rtc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/button: failed to match any schema with compatible: ['motorola,cpcap-pwrbutton']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/phy: failed to match any schema with compatible: ['motorola,mapphone-cpcap-usb-phy']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-red: failed to match any schema with compatible: ['motorola,cpcap-led-red']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-green: failed to match any schema with compatible: ['motorola,cpcap-led-green']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-blue: failed to match any schema with compatible: ['motorola,cpcap-led-blue']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-adl: failed to match any schema with compatible: ['motorola,cpcap-led-adl']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/led-cp: failed to match any schema with compatible: ['motorola,cpcap-led-cp']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml#
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-xyboard-mz617.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/ti,cpsw-switch.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am4372']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@47810000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@53501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@47900000/spi@0/flash@0: failed to match any schema with compatible: ['mx66l51235l']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: sram@0 (mmio-sram): 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: display (osddisplays,osd070t1718-19ts): compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/ti/omap/am43x-epos-evm.dtb: display (osddisplays,osd070t1718-19ts): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
--
   	from schema $id: http://devicetree.org/schemas/net/ti,cpsw-switch.yaml#
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am4372']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@47810000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@53501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: sram@0 (mmio-sram): 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
--
   	from schema $id: http://devicetree.org/schemas/net/ti,cpsw-switch.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am4372']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@47810000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@53501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: sram@0 (mmio-sram): 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: display (osddisplays,osd070t1718-19ts): compatible: ['osddisplays,osd070t1718-19ts', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: display (osddisplays,osd070t1718-19ts): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/ti/omap/am437x-gp-evm.dtb: display (osddisplays,osd070t1718-19ts): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/net/ti,cpsw-switch.yaml#
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am4372']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@47810000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@53501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@47900000/spi@0/flash@0: failed to match any schema with compatible: ['mx66l51235l']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: sram@0 (mmio-sram): 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-idk-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
--
   	from schema $id: http://devicetree.org/schemas/net/ti,cpsw-switch.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am4372']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@47810000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@53501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: sram@0 (mmio-sram): 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: display (startek,startek-kd050c): enable-gpios: [[122, 14, 0], [123, 28, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/startek,startek-kd050c.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: display (startek,startek-kd050c): port:endpoint: Unevaluated properties are not allowed ('data-lines' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/startek,startek-kd050c.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dtb: display (startek,startek-kd050c): 'power-supply' is a required property
--
   	from schema $id: http://devicetree.org/schemas/net/ti,cpsw-switch.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am4372']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@47810000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@53501000/aes@0: failed to match any schema with compatible: ['ti,omap4-aes']
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
>> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@47900000/spi@0/flash@0: failed to match any schema with compatible: ['mx66l51235l']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: sram@0 (mmio-sram): 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: display (newhaven,nhd-4.3-480272ef-atxl): compatible: ['newhaven,nhd-4.3-480272ef-atxl', 'panel-dpi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
   arch/arm/boot/dts/ti/omap/am437x-sk-evm.dtb: display (newhaven,nhd-4.3-480272ef-atxl): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
