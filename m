Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8671632DD
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 01:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755738416; cv=none; b=hwoo9pJDZTOjHCOIM2oy06aCS6MV2OwaB9NqBE5FvkCGEwdKCcf9xA3GiRLm07kTsbx/x5NIecquPAf59qAy8A+nH5eyythvC6mChy5BNAsgporQF0/rht0d1RSiSBLqdtW36NWI2a5al9duYDDBmYXA3G+V7DWEol2wJS+FOMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755738416; c=relaxed/simple;
	bh=QKN0W7MhFnp2/Je+HZuf3Hvl2C5+JSVviuza30/DU1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pZh/lYM5eSPUzEoklYQ2eewamKD7EXYhjVYi5spXVepiFilde/J/G0+kCejaGo8yGZAfiyx7Iao8M7mHAN9yCO9RzBXVCc3/gLkwrcOXWo/SQFjveeJaguVQ5dKpWtUk+4EhrqBpQ/CQ78pxby27oZNe9WqEkdNVB97jWK6+LsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZYd+Z1U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZYd+Z1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755738408; x=1787274408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QKN0W7MhFnp2/Je+HZuf3Hvl2C5+JSVviuza30/DU1Q=;
  b=iZYd+Z1UXXnLktOfwOMfS3LB3Hg5fFGAVZa3uEuQfFcWFJu1UzOpB8kR
   oEAFxybQwSwuTMMExChHhT/qeJuEJ28VDeEPnNxzEpTPO0hEBrDBRJbQh
   IlciFuNVwbS31IjbNF6ZifPn/F4/aL3DuD+kIqQn3ACa5je5mOKUpclVn
   +AhZt0FjO50GESLJx6TqPN9Ozdt6rSGDA2e7foV1pkjeRalYD4NbhenyJ
   DLPKIWmuc3TmyjllI5kawptn7579fHuFjHrKbSus2yLQiz/Z43i9v48ZZ
   og8HZNLYzaj0hO7n1hmEbJazGS2YhrCOhd465Xg+BJ4m5JEXnYp7UK92T
   Q==;
X-CSE-ConnectionGUID: As1ndksYRbSiDB3zEcMv6A==
X-CSE-MsgGUID: 2XDOWD6BTB+D6HugB6IQWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57043496"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57043496"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 18:06:47 -0700
X-CSE-ConnectionGUID: nmGw28VfRqyO9utanAF/LQ==
X-CSE-MsgGUID: Jl/Y7aH+SraI/4kWY/3mng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199252996"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Aug 2025 18:06:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uotlB-000Jnr-1J;
	Thu, 21 Aug 2025 01:06:37 +0000
Date: Thu, 21 Aug 2025 09:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/6] dt-bindings: mfd: twl: Add missing sub-nodes for
 TWL4030 & TWL603x
Message-ID: <202508210841.fpsRvyVt-lkp@intel.com>
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
In-Reply-To: <20250816021523.167049-2-jihed.chaibi.dev@gmail.com>
References: <20250816021523.167049-2-jihed.chaibi.dev@gmail.com>
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
CC: linus.walleij@linaro.org
CC: brgl@bgdev.pl
CC: aaro.koskinen@iki.fi
CC: khilman@baylibre.com
CC: rogerq@kernel.org
CC: tony@atomide.com
CC: linux-gpio@vger.kernel.org
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: linux-omap@vger.kernel.org
CC: shuah@kernel.org
CC: jihed.chaibi.dev@gmail.com

Hi Jihed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on dtor-input/next dtor-input/for-linus linus/master v6.17-rc1 next-20250815]
[cannot apply to lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jihed-Chaibi/dt-bindings-mfd-twl-Add-missing-sub-nodes-for-TWL4030-TWL603x/20250816-102205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250816021523.167049-2-jihed.chaibi.dev%40gmail.com
patch subject: [PATCH v3 1/6] dt-bindings: mfd: twl: Add missing sub-nodes for TWL4030 & TWL603x
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20250817 (https://download.01.org/0day-ci/archive/20250821/202508210841.fpsRvyVt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210841.fpsRvyVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508210841.fpsRvyVt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): audio: {'compatible': ['ti,twl4030-audio'], 'codec': {}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/sound/ti,twl4030-audio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): audio: Unevaluated properties are not allowed ('codec', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,use-leds': True, 'phandle': 286} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'status': ['disabled']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 270} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: eeprom@50 (atmel,24c64): Unevaluated properties are not allowed ('readonly' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-35xx-devkit.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
   	'at25@0' does not match '^eeprom@[0-9a-f]{1,2}$'
--
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): audio: {'compatible': ['ti,twl4030-audio'], 'codec': {}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/sound/ti,twl4030-audio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): audio: Unevaluated properties are not allowed ('codec', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,use-leds': True, 'phandle': 292} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'status': ['disabled']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[240]], 'usb1v8-supply': [[241]], 'usb3v1-supply': [[238]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 276} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: eeprom@50 (atmel,24c64): Unevaluated properties are not allowed ('readonly' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
   	'at25@0' does not match '^eeprom@[0-9a-f]{1,2}$'
--
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): audio: {'compatible': ['ti,twl4030-audio'], 'codec': {}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/sound/ti,twl4030-audio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): audio: Unevaluated properties are not allowed ('codec', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,use-leds': True, 'phandle': 292} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'status': ['disabled']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[240]], 'usb1v8-supply': [[241]], 'usb3v1-supply': [[238]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 276} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: eeprom@50 (atmel,24c64): Unevaluated properties are not allowed ('readonly' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit-28.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
   	'at25@0' does not match '^eeprom@[0-9a-f]{1,2}$'
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): audio: Unevaluated properties are not allowed ('codec', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,use-leds': True} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[238]], 'usb1v8-supply': [[239]], 'usb3v1-supply': [[236]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 271} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): audio: Unevaluated properties are not allowed ('codec', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,use-leds': True} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-idle-osc-off', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[240]], 'usb1v8-supply': [[241]], 'usb3v1-supply': [[238]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 273} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[232]], 'usb1v8-supply': [[233]], 'usb3v1-supply': [[230]], 'usb_mode': [1], '#phy-cells': 0} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/wdt@48314000: failed to match any schema with compatible: ['ti,omap3-wdt']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 253} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 253} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): audio: Unevaluated properties are not allowed ('codec', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,use-leds': True, 'ti,pullups': 2, 'ti,pulldowns': 238020, 'phandle': 275} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): power:compatible:0: 'ti,twl4030-power-beagleboard-xm' is not one of ['ti,twl4030-power', 'ti,twl4030-power-reset', 'ti,twl4030-power-idle', 'ti,twl4030-power-idle-osc-off']
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[240]], 'usb1v8-supply': [[241]], 'usb3v1-supply': [[238]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 255} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): audio: Unevaluated properties are not allowed ('codec', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,use-leds': True, 'ti,pullups': 2, 'ti,pulldowns': 238020, 'phandle': 275} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): power:compatible:0: 'ti,twl4030-power-beagleboard-xm' is not one of ['ti,twl4030-power', 'ti,twl4030-power-reset', 'ti,twl4030-power-idle', 'ti,twl4030-power-idle-osc-off']
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[240]], 'usb1v8-supply': [[241]], 'usb3v1-supply': [[238]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 255} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-beagleboard-xm', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,use-leds': True, 'phandle': 280, 'en-on-board-gpio-61-hog': {'gpio-hog': True, 'gpios': [[2, 0]], 'output-low': True, 'line-name': ['en_hsusb2_clk']}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'en-on-board-gpio-61-hog', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'linux,keymap': [33685506, 16842755, 4, 50462725, 33619974, 16777223, 16973832, 50397193, 33554442, 33751095, 131083, 50331731, 16908302, 65564]} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows', 'linux,keymap' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): power:compatible:0: 'ti,twl4030-power-omap3-evm' is not one of ['ti,twl4030-power', 'ti,twl4030-power-reset', 'ti,twl4030-power-idle', 'ti,twl4030-power-idle-osc-off']
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-omap3-evm', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 262} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: gpio (ti,twl4030-gpio): 'en-on-board-gpio-61-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,twl4030-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-omap3-evm', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48060000/tvp5146@5c: failed to match any schema with compatible: ['ti,tvp5146m2']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,use-leds': True, 'phandle': 282, 'en-on-board-gpio-61-hog': {'gpio-hog': True, 'gpios': [[2, 0]], 'output-low': True, 'line-name': ['en_hsusb2_clk']}} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'en-on-board-gpio-61-hog', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'linux,keymap': [33685506, 16842755, 4, 50462725, 33619974, 16777223, 16973832, 50397193, 33554442, 33751095, 131083, 50331731, 16908302, 65564]} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows', 'linux,keymap' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): power:compatible:0: 'ti,twl4030-power-omap3-evm' is not one of ['ti,twl4030-power', 'ti,twl4030-power-reset', 'ti,twl4030-power-idle', 'ti,twl4030-power-idle-osc-off']
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-omap3-evm', 'ti,twl4030-power-idle'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 264} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: gpio (ti,twl4030-gpio): 'en-on-board-gpio-61-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ti,twl4030-gpio.yaml#
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-omap3-evm', 'ti,twl4030-power-idle']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48060000/tvp5146@5c: failed to match any schema with compatible: ['ti,tvp5146m2']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,pullups': 4, 'ti,pulldowns': 238019} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'status': ['disabled']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[246]], 'usb1v8-supply': [[247]], 'usb3v1-supply': [[244]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 280} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: tca6507@45 (ti,tca6507): led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: tsc2007@48 (ti,tsc2007): 'touchscreen-fuzz-pressure', 'touchscreen-fuzz-x', 'touchscreen-fuzz-y', 'touchscreen-inverted-y', 'touchscreen-max-pressure', 'touchscreen-min-x', 'touchscreen-min-y', 'touchscreen-size-x', 'touchscreen-size-y' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a3.dtb: lis302@1d (st,lis331dlh): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-click-time-limit', 'st,click-latency', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,pullups': 4, 'ti,pulldowns': 238019} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'status': ['disabled']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[246]], 'usb1v8-supply': [[247]], 'usb3v1-supply': [[244]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 278} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: tca6507@45 (ti,tca6507): led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: tsc2007@48 (ti,tsc2007): 'touchscreen-fuzz-pressure', 'touchscreen-fuzz-x', 'touchscreen-fuzz-y', 'touchscreen-inverted-y', 'touchscreen-max-pressure', 'touchscreen-min-x', 'touchscreen-min-y', 'touchscreen-size-x', 'touchscreen-size-y' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-gta04a4.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,pullups': 4, 'ti,pulldowns': 238019, 'phandle': 293} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'status': ['disabled']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[247]], 'usb1v8-supply': [[248]], 'usb3v1-supply': [[245]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 274} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: tca6507@45 (ti,tca6507): led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: tsc2007@48 (ti,tsc2007): 'touchscreen-fuzz-pressure', 'touchscreen-fuzz-x', 'touchscreen-fuzz-y', 'touchscreen-inverted-y', 'touchscreen-max-pressure', 'touchscreen-min-x', 'touchscreen-min-y', 'touchscreen-size-x', 'touchscreen-size-y' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,pullups': 4, 'ti,pulldowns': 238019, 'phandle': 293} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'status': ['disabled']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[247]], 'usb1v8-supply': [[248]], 'usb3v1-supply': [[245]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 274} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'clock-names', 'clocks', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: tca6507@45 (ti,tca6507): led@6: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: tsc2007@48 (ti,tsc2007): 'touchscreen-fuzz-pressure', 'touchscreen-fuzz-x', 'touchscreen-fuzz-y', 'touchscreen-inverted-y', 'touchscreen-max-pressure', 'touchscreen-min-x', 'touchscreen-min-y', 'touchscreen-size-x', 'touchscreen-size-y' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-gta04a5one.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[241]], 'usb1v8-supply': [[242]], 'usb3v1-supply': [[239]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 265} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-ha.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[242]], 'usb1v8-supply': [[243]], 'usb3v1-supply': [[240]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 266} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[240]], 'usb1v8-supply': [[241]], 'usb3v1-supply': [[238]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 271} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48060000/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[241]], 'usb1v8-supply': [[242]], 'usb3v1-supply': [[239]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 271} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48060000/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 264} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[240]], 'usb1v8-supply': [[241]], 'usb3v1-supply': [[238]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 264} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[243]], 'usb1v8-supply': [[244]], 'usb3v1-supply': [[241]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 275} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): audio: Unevaluated properties are not allowed ('compatible', 'ti,enable-vibra' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): gpio: {'compatible': ['ti,twl4030-gpio'], 'gpio-controller': True, '#gpio-cells': 2, 'interrupt-controller': True, '#interrupt-cells': 1, 'ti,pullups': 0, 'ti,pulldowns': 261951, 'phandle': 302} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8, 'linux,keymap': [16, 65560, 131097, 196659, 262158, 393246, 458783, 16777233, 16842784, 16908321, 16973858, 17039395, 17104932, 17170469, 17236006, 33554450, 33620020, 33685607, 33751068, 33882156, 33947693, 34013230, 34078787, 50331667, 50397231, 50462768, 50528305, 50593842, 50659385, 50724921, 50790505, 67108884, 67174508, 67240042, 67371037, 67436644, 67502122, 67633220, 83886101, 84410455, 100663318, 117440535, 117506113, 117571650]} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows', 'linux,keymap' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): power:compatible:0: 'ti,twl4030-power-n900' is not one of ['ti,twl4030-power', 'ti,twl4030-power-reset', 'ti,twl4030-power-idle', 'ti,twl4030-power-idle-osc-off']
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): power:compatible: ['ti,twl4030-power-n900', 'ti,twl4030-power-idle-osc-off'] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[241]], 'usb1v8-supply': [[242]], 'usb3v1-supply': [[239]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 276} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-n900.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'power', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48070000/twl@48/power: failed to match any schema with compatible: ['ti,twl4030-power-n900', 'ti,twl4030-power-idle-osc-off']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/led-controller@30: failed to match any schema with compatible: ['adi,adp1653']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48072000/si4713@63: failed to match any schema with compatible: ['silabs,si4713']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: /ocp@68000000/i2c@48060000/camera@3e: failed to match any schema with compatible: ['toshiba,et8ek8']
   arch/arm/boot/dts/ti/omap/omap3-n900.dtb: tsc2005@0 (ti,tsc2005): $nodename:0: 'tsc2005@0' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
--
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 266} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 266} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 263} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 266} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 263} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 268} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 268} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 265} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 268} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 265} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 261} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 264} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[239]], 'usb1v8-supply': [[240]], 'usb3v1-supply': [[237]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 265} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 259} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 262} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[237]], 'usb1v8-supply': [[238]], 'usb3v1-supply': [[235]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 263} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml#
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
--
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,pulldowns', 'ti,pullups', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[234]], 'usb1v8-supply': [[235]], 'usb3v1-supply': [[232]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 258} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('audio', 'gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/i2c@48070000/twl@48/audio: failed to match any schema with compatible: ['ti,twl4030-audio']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('#gpio-cells', '#interrupt-cells', 'compatible', 'gpio-controller', 'interrupt-controller', 'ti,use-leds' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: twl@48 (ti,twl4030): keypad: {'compatible': ['ti,twl4030-keypad'], 'interrupts': [[1]], 'keypad,num-rows': 8, 'keypad,num-columns': 8} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: twl@48 (ti,twl4030): keypad: Unevaluated properties are not allowed ('compatible', 'interrupts', 'keypad,num-columns', 'keypad,num-rows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: twl@48 (ti,twl4030): twl4030-usb: {'compatible': ['ti,twl4030-usb'], 'interrupts': [[10], [4]], 'usb1v5-supply': [[236]], 'usb1v8-supply': [[237]], 'usb3v1-supply': [[234]], 'usb_mode': [1], '#phy-cells': 0, 'phandle': 259} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/usb/ti,twlxxxx-usb.yaml#"}
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: twl@48 (ti,twl4030): twl4030-usb: Unevaluated properties are not allowed ('#phy-cells', 'compatible', 'interrupts', 'usb1v5-supply', 'usb1v8-supply', 'usb3v1-supply', 'usb_mode' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
>> arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: twl@48 (ti,twl4030): Unevaluated properties are not allowed ('gpio', 'keypad', 'madc', 'pwm', 'pwmled', 'pwrbutton', 'twl4030-usb', 'watchdog' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48060000/tvp5146@5c: failed to match any schema with compatible: ['ti,tvp5146m2']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
