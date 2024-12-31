Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997932AD21
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Dec 2024 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735641874; cv=none; b=tGfZrinAe6Nat7VZ4r5r2LTNJo978ZUAxfTV3HE5NlDtop0PBLwXcBcvbMvbC4eNKYuh8LI0zg/wE2xPEzZOXOid2f6RhBfkbN2E02+fAcHwey5QumMIdm9E9yNg3HNsV1ZjrylCkDZpueDwfEpIFK4rK7yAM7plF4DLiliXmEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735641874; c=relaxed/simple;
	bh=jZiwrlpaYunuj5hpAb2V/F4UBe6R9Qd3gCxY5ZfEWHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTs+zEop5gKfOqJb3LbsVeG3YLi9uKfmYsO7v5C4us6mI7Em4a0KzR/h+BsAN307IRTN0PntZRPs0+YW5KJfkHn7d4GvxxQsP5cz9hPW08GEOT9eg0/DAtvnnAu+nlrXQmjgTJv3TtIq951SkOAtGqOMo6MbEdnlKKN7ccQsGaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6A6Z8De; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6A6Z8De"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735641872; x=1767177872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jZiwrlpaYunuj5hpAb2V/F4UBe6R9Qd3gCxY5ZfEWHk=;
  b=H6A6Z8De78LSb8GurlFeRPQdz85AnKpFeMA3q6f6CTlGx3W0IRsKIiBC
   YbZPPQc+AUCbzv0wuZA7ROFhqOIRGQNc+ISzSYVaSFtRnHBGrp8DJl6lf
   6vKRHlCnqsbBDn27PJJuAgfrFkCKlAax5WYFutxERwh6FrtvSP39n4XF5
   jB+Ie0EnaH/7qvhBgUjauuvduxJjRwMf8NPfCndd5vC/TQF3asp+wj231
   7/Z8tzkd3rLjqQiSbM9HPNXjrpJvJXaXayaJHKkktVxvO95+iWyrqEuQ8
   BNBJaLe3o5meItrOGbPYx417co5OJ7qr5It2A03kUMa8zf/d8skSnq+9i
   g==;
X-CSE-ConnectionGUID: St8F8LlmR1C3MN1TH/jH0w==
X-CSE-MsgGUID: 1NOBBXiRTiG2bkzvi6nOEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="38754674"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="38754674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 02:44:32 -0800
X-CSE-ConnectionGUID: dMkiBobgTd+z0zoUtz5Kxw==
X-CSE-MsgGUID: fYOErUobTCaAFPTGBEQ60w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="101444338"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Dec 2024 02:44:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSZjg-00074N-2Z;
	Tue, 31 Dec 2024 10:44:28 +0000
Date: Tue, 31 Dec 2024 18:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] ARM: dts: omap4: panda: cleanup bluetooth
Message-ID: <202412311852.AflFNKba-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/boot/dts/ti/omap/omap4-panda.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 73, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[117]], 'interrupts-extended': [[1, 0, 73, 4], [115, 220]], 'bluetooth': {'compatible': ['ti,wl1271-st'], 'pinctrl-names': ['default'], 'pinctrl-0': [[118]], 'enable-gpios': [[119, 14, 0]], 'clocks': [[120, 0]], 'clock-names': ['ext_clock']}, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241229230125.85787-3-andreas@kemnade.info>
References: <20241229230125.85787-3-andreas@kemnade.info>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: linux-omap@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: Roger Quadros <rogerq@kernel.org>
TO: Aaro Koskinen <aaro.koskinen@iki.fi>
TO: Kevin Hilman <khilman@baylibre.com>
TO: devicetree@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
CC: Andreas Kemnade <andreas@kemnade.info>

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/ARM-dts-omap4-panda-fix-resources-needed-for-Panda/20241230-070349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241229230125.85787-3-andreas%40kemnade.info
patch subject: [PATCH 2/2] ARM: dts: omap4: panda: cleanup bluetooth
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm-randconfig-052-20241230 (https://download.01.org/0day-ci/archive/20241231/202412311852.AflFNKba-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311852.AflFNKba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412311852.AflFNKba-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 74, 4]], 'clock-frequency': 48000000, 'interrupts-extended': [[1, 0, 74, 4], [115, 260]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
>> arch/arm/boot/dts/ti/omap/omap4-panda.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 73, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[117]], 'interrupts-extended': [[1, 0, 73, 4], [115, 220]], 'bluetooth': {'compatible': ['ti,wl1271-st'], 'pinctrl-names': ['default'], 'pinctrl-0': [[118]], 'enable-gpios': [[119, 14, 0]], 'clocks': [[120, 0]], 'clock-names': ['ext_clock']}, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 70, 4]], 'clock-frequency': 48000000, 'interrupts-extended': [[1, 0, 70, 4], [115, 284]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: twl@48: Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-panda.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 74, 4]], 'clock-frequency': 48000000, 'interrupts-extended': [[1, 0, 74, 4], [115, 260]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
>> arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 73, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[117]], 'interrupts-extended': [[1, 0, 73, 4], [115, 220]], 'bluetooth': {'compatible': ['ti,wl1271-st'], 'pinctrl-names': ['default'], 'pinctrl-0': [[118]], 'enable-gpios': [[119, 14, 0]], 'clocks': [[120, 0]], 'clock-names': ['ext_clock']}, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 70, 4]], 'clock-frequency': 48000000, 'interrupts-extended': [[1, 0, 70, 4], [115, 284]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: twl@48: Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-panda-a4.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000: failed to match any schema with compatible: ['ti,omap4-l4-per', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: segment@0: $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: segment@0: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 74, 4]], 'clock-frequency': 48000000, 'interrupts-extended': [[1, 0, 74, 4], [117, 260]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
>> arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 73, 4]], 'clock-frequency': 48000000, 'pinctrl-names': ['default'], 'pinctrl-0': [[119]], 'interrupts-extended': [[1, 0, 73, 4], [117, 220]], 'bluetooth': {'compatible': ['ti,wl1271-st'], 'pinctrl-names': ['default'], 'pinctrl-0': [[120]], 'enable-gpios': [[121, 14, 0]], 'clocks': [[122, 0]], 'clock-names': ['ext_clock']}, '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: serial@0: {'compatible': ['ti,omap4-uart'], 'reg': [[0, 256]], 'interrupts': [[0, 70, 4]], 'clock-frequency': 48000000, 'interrupts-extended': [[1, 0, 70, 4], [117, 284]], '$nodename': ['serial@0']} is valid under each of {'required': ['interrupts-extended']}, {'required': ['interrupts']}
   	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: twl@48: Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-panda-es.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
