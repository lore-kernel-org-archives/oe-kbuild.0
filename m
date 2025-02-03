Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB302B667
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606810; cv=none; b=CcMUVGhycoylK6Zprygm7oCugRH7PMQslEhCZMtOXPQCwF8hmY88a1owTkq218djwlz9STPg2gNEYBoXi4k57V5PHwwkqgL6Lb4JfqeaFBekBMB1VN+SHIHBQg99Z3DDaCLgDcbJegDjDHYsjCLC9WpxgBF0zCS1F8sju/9vke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606810; c=relaxed/simple;
	bh=GWsA4NQBQtTFv7LK3eBTT/PO5/Q8QetZ0jGdMtX4/PE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQULOr4X2o+qswcNNLKZSPCwneALbdq9sGEF2kIO9hcNc4tU0Z85T04VUgiP1ipYQ02NEZWEIPWgtQcN/WbkI+983yJMPeyKw8KNYNEVe3fW4Y/cytzF3Rm4UQBDPpItSRBzhJ6eqtxF7GWg75CRTIkR9DmDaOzzHpVwIMaKCZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJkWAORR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJkWAORR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738606808; x=1770142808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GWsA4NQBQtTFv7LK3eBTT/PO5/Q8QetZ0jGdMtX4/PE=;
  b=BJkWAORRx36JiIGuvLd98lJBnFOEftmNumfkvaPtVTRobHjXibOzAdZr
   5kMIi1StaX+6w/gwejkt8Bw3Cr3UCRQhhc95mkBQLudED1WdTe6HMv1+/
   vU/pXoPJr3dvXHprEvtnFJlDTOafr0ONJgmLSpk8Br6rl4UR/63szLxBd
   H1e85Y3kQVtwMdDcNVaruUCad87tT8+CrwPJRZsvzoAlt4hSxvctf99WX
   O39n1tTa9UqkPdjSidl90m7DG7HYfktB15JfEuipzZnvQvfhw0lXGp93P
   f5w3TdAg0JTqdT283XtXOc5k1QKv1Y1TmbZXWnubBumzF4uz+Ccyfdfjr
   Q==;
X-CSE-ConnectionGUID: TjkMePc/SjK3ZtOWO0rAhQ==
X-CSE-MsgGUID: kPeQ5zckTuSjOnuycAyWbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39212864"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39212864"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 10:20:05 -0800
X-CSE-ConnectionGUID: RJGk2KxATUSOdUfByjQ5Bg==
X-CSE-MsgGUID: j6RfPFadSeeVrJLryT0dpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110905822"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2025 10:20:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf13B-000rKX-2b;
	Mon, 03 Feb 2025 18:20:01 +0000
Date: Tue, 4 Feb 2025 02:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 52/53]
 arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio_in_mux@60004154:
 'usb_device_in', 'usb_host_in' do not match any of the regexes:
 '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
Message-ID: <202502040213.TtWFs0Mh-lkp@intel.com>
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
TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 5641abdf4e861f59ec7a71210cb39e274f039485 [52/53] WIP: add USB to esp32s3-devkit-c1.dts
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: xtensa-randconfig-052-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040213.TtWFs0Mh-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040213.TtWFs0Mh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502040213.TtWFs0Mh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio@60004000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/gpio@60004000: failed to match any schema with compatible: ['esp,esp32s3-gpio']
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio_in_mux@60004154: $nodename:0: 'gpio_in_mux@60004154' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio_in_mux@60004154: 'usb_device_in', 'usb_host_in' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio_in_mux@60004154: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio_out_mux@60004554: $nodename:0: 'gpio_out_mux@60004554' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: lpm@60008000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: usb_phy@60008120: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/usb_phy@60008120: failed to match any schema with compatible: ['esp,esp32s3-usb-phy']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: pinctrl@60008484: 'usb_rtc_pins' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: pinctrl@60008484: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: pinctrl@60009000: 'i2c0_pins', 'spi2_pins', 'uart0_pins', 'usb_pins' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: pinctrl@60009000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: serial@60010000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: spi@60024000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
--
   	'snps,dwc2' was expected
   	'sophgo,cv1800-usb' was expected
   	'st,stm32f4x9-fsotg' was expected
   	'st,stm32f4x9-hsotg' was expected
   	'st,stm32f7-hsotg' was expected
   	'st,stm32mp15-fsotg' was expected
   	'st,stm32mp15-hsotg' was expected
   	'samsung,s3c6400-hsotg' was expected
   	'intel,socfpga-agilex-hsotg' was expected
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: usb@60080000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: usb@60080000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/usb@60080000: failed to match any schema with compatible: ['esp,esp32s3-usb', 'snps,dwc2']
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/ipc@600c0004: failed to match any schema with compatible: ['esp,esp32-ipc']
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/ipc@600c0004/flash@2: failed to match any schema with compatible: ['esp,esp32-ipc-flash']
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/ipc@600c0004/wifi@1: failed to match any schema with compatible: ['esp,esp32-wifi-shmem']
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/clk@600c0010: failed to match any schema with compatible: ['esp,esp32s3-core-clock']
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/clk_gpio@600c0018: failed to match any schema with compatible: ['esp,esp32-clk-gpio']
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/clk_gpio@600c001c: failed to match any schema with compatible: ['esp,esp32-clk-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
