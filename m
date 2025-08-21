Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049B2F852
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755802058; cv=none; b=NQUIEeQrCGsAJhG8aRCd32w/UmJTWW1GzeieJgNivLzotymfiN+MYGuU4uf/O5VtUaP9f61l+fcLipCD8kjUPVX5i57bn9q3qVOoJpjI/qowkjizgHAidN4sOcFK+Q4NJ+P7vI3P7JmIB1teq7Iawqhvegwq9+JqFN8h2vgnddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755802058; c=relaxed/simple;
	bh=2APvvRURr2zbfLZRxHU5prlMTASf95piYtv0Y0QwLDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6XMdPgLTZ2v6WT+9lvTCOlU+raqUlo45JRhLVqXTwa6JVAIphrIBD6ghFPEdEsekAV1VmJLHUR7iwZkm2Or/l+ZdticzNGb+3i3wcWYhtUlXnPphNI6fgL2GYQwMb+93A0NfDiE7omAoBqXMxJFrmjSerQdbLb4BhkPo2dfe6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSb20q6l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSb20q6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755802054; x=1787338054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2APvvRURr2zbfLZRxHU5prlMTASf95piYtv0Y0QwLDw=;
  b=jSb20q6lu7+BQHjHQmG366AuDRzxlrALEgCe1r5QQdBDty4iwpvjneaJ
   TTIo9mBGDGrV3fekKnzq501WfwwshmsbEdcG8EUSsMyIdLEAOk0nUpS0U
   lauhujNJtIvh0qogL9C7TtzlkW1FBbHDSF/bsFu+FqwSHgdCrlG1yYxbS
   9/hNwxNKMss0BHxaWrRonQtcR8E4R+wdN0eRBxVtxQHjxxCjKSGyntS3r
   CDVuud8JM97flK4G+pNnv/wCjhXpGkF1NXsk8Elv88zcC+ndpA6n2HCpi
   E0YyNghM0hGP6Fch+wx7T+bTedxWWbZDTFnEY0+qegDyeOwRWb4S4QEYC
   w==;
X-CSE-ConnectionGUID: a0OD0VKjT4O00pkG62s4GA==
X-CSE-MsgGUID: SphN6+yxQ3yHd7O6O8/Q8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58029661"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58029661"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 11:47:33 -0700
X-CSE-ConnectionGUID: fFephnfEQzWGMxA9hqIhZQ==
X-CSE-MsgGUID: sHhJSU+cQzCfEvfLcNDeiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="167717041"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Aug 2025 11:47:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upAJf-000Kad-3A;
	Thu, 21 Aug 2025 18:47:18 +0000
Date: Fri, 22 Aug 2025 02:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 9/9] dt-bindings: mfd: twl: Add missing sub-nodes for
 TWL4030 & TWL603x
Message-ID: <202508220226.9tqud9wl-lkp@intel.com>
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
In-Reply-To: <20250814132129.138943-10-jihed.chaibi.dev@gmail.com>
References: <20250814132129.138943-10-jihed.chaibi.dev@gmail.com>
TO: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
TO: linux-kernel@vger.kernel.org
CC: andreas@kemnade.info
CC: peter.ujfalusi@gmail.com
CC: dmitry.torokhov@gmail.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: lgirdwood@gmail.com
CC: tiwai@suse.com
CC: conor+dt@kernel.org
CC: lee@kernel.org
CC: ukleinek@kernel.org
CC: broonie@kernel.org
CC: gregkh@linuxfoundation.org
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: shuah@kernel.org
CC: jihed.chaibi.dev@gmail.com

Hi Jihed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes robh/for-next broonie-sound/for-next dtor-input/next dtor-input/for-linus linus/master v6.17-rc2 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jihed-Chaibi/mfd-dt-bindings-ti-twl4030-audio-convert-to-DT-schema/20250814-212550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250814132129.138943-10-jihed.chaibi.dev%40gmail.com
patch subject: [PATCH v2 9/9] dt-bindings: mfd: twl: Add missing sub-nodes for TWL4030 & TWL603x
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-051-20250815 (https://download.01.org/0day-ci/archive/20250822/202508220226.9tqud9wl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508220226.9tqud9wl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508220226.9tqud9wl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: power (ti,twl4030-power-idle-osc-off): compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl4030-power.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: eeprom@50 (atmel,24c64): Unevaluated properties are not allowed ('readonly' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
--
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: power (ti,twl4030-power-idle-osc-off): compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl4030-power.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: eeprom@50 (atmel,24c64): Unevaluated properties are not allowed ('readonly' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
--
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: power (ti,twl4030-power-idle-osc-off): compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl4030-power.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: eeprom@50 (atmel,24c64): Unevaluated properties are not allowed ('readonly' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: power (ti,twl4030-power-idle-osc-off): compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl4030-power.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: power (ti,twl4030-power-idle-osc-off): compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl4030-power.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: power (ti,twl4030-power-beagleboard-xm): compatible:0: 'ti,twl4030-power-beagleboard-xm' is not one of ['ti,twl4030-power', 'ti,twl4030-power-reset', 'ti,twl4030-power-idle', 'ti,twl4030-power-idle-osc-off']
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl4030-power.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: power (ti,twl4030-power-beagleboard-xm): compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl4030-power.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: power (ti,twl4030-power-beagleboard-xm): compatible:0: 'ti,twl4030-power-beagleboard-xm' is not one of ['ti,twl4030-power', 'ti,twl4030-power-reset', 'ti,twl4030-power-idle', 'ti,twl4030-power-idle-osc-off']
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl4030-power.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: power (ti,twl4030-power-beagleboard-xm): compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl4030-power.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48072000/itg3200@68: failed to match any schema with compatible: ['invensense,itg3200']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: tca6507@45 (ti,tca6507): led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48072000/tsc2007@48: failed to match any schema with compatible: ['ti,tsc2007']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: lis302@1d (st,lis331dlh): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-click-time-limit', 'st,click-latency', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48072000/itg3200@68: failed to match any schema with compatible: ['invensense,itg3200']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: tca6507@45 (ti,tca6507): led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48072000/tsc2007@48: failed to match any schema with compatible: ['ti,tsc2007']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: tca6507@45 (ti,tca6507): led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48072000/tsc2007@48: failed to match any schema with compatible: ['ti,tsc2007']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: tca6507@45 (ti,tca6507): led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48072000/tsc2007@48: failed to match any schema with compatible: ['ti,tsc2007']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: lcd@1 (tpo,td043mtea1): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: pwmled (ti,twl4030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: lcd@1 (tpo,td043mtea1): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: interconnect@48000000 (ti,omap4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: twl@4b (ti,twl6040): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: twl@4b (ti,twl6040): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: twl@4b (ti,twl6040): 'vddvibl-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-duovero-parlor.dtb: twl@4b (ti,twl6040): 'vddvibr-supply' is a required property
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: interconnect@48000000 (ti,omap4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: pmic@48 (ti,twl6032): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: imu@68 (invensense,mpu9150): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/imu/invensense,mpu6050.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: imu@68 (invensense,mpu9150): Unevaluated properties are not allowed ('interrupt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/iio/imu/invensense,mpu6050.yaml#
   arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: interconnect@48000000 (ti,omap4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@a5000/des@0: failed to match any schema with compatible: ['ti,omap4-des']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-kc1.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: interconnect@48000000 (ti,omap4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
>> arch/arm/boot/dts/ti/omap/omap4-panda.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: twl@4b (ti,twl6040): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: twl@4b (ti,twl6040): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: twl@4b (ti,twl6040): 'vddvibl-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: twl@4b (ti,twl6040): 'vddvibr-supply' is a required property
--
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: interconnect@48000000 (ti,omap4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
>> arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: twl@4b (ti,twl6040): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: twl@4b (ti,twl6040): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: twl@4b (ti,twl6040): 'vddvibl-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: twl@4b (ti,twl6040): 'vddvibr-supply' is a required property
--
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: interconnect@48000000 (ti,omap4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
>> arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: twl@4b (ti,twl6040): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: twl@4b (ti,twl6040): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: twl@4b (ti,twl6040): 'vddvibl-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: twl@4b (ti,twl6040): 'vddvibr-supply' is a required property
--
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: interconnect@48000000 (ti,omap4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780']
>> arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: twl@4b (ti,twl6040): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: twl@4b (ti,twl6040): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/eth@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: interconnect@48000000 (ti,omap4-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780']
>> arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: twl@4b (ti,twl6040): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: twl@4b (ti,twl6040): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/eth@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: twl@4b (ti,twl6040): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: twl@4b (ti,twl6040): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: twl@4b (ti,twl6040): 'vddvibl-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: twl@4b (ti,twl6040): 'vddvibr-supply' is a required property
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
>> arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('usb-comparator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: pwmled (ti,twl6030-pwmled): $nodename:0: 'pwmled' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/ti,twl-pwmled.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: twl@4b (ti,twl6040): 'gpio-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: twl@4b (ti,twl6040): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: twl@4b (ti,twl6040): 'vddvibl-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: twl@4b (ti,twl6040): 'vddvibr-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
