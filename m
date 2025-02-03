Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98B20B808
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 17:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604283; cv=none; b=E1+hrqLF5IX9pJEYdxrwpKg3/c2sttsOG02JzvGMuDXcg/28p1IGkL9nxACf4o0QNn6YFhRJXk80FP489N2EXywVg3I9CEgiAdNS/CIC2iKVLN+wsJLFCj8EHzR+Vu2PmxJffX/RN/3eVGHBtah0kT0vlR9+sxJJ/tr3GWFo2Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604283; c=relaxed/simple;
	bh=S5Gv6wLV622GNItgAhTXyJC+IeLhaXz/HI1eJPHGrXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dE3fZmHUQsa/1H1iGFsWLiwCJYWWrWs34UPnT7n0PAag8tLhSgPVzXjxhH9BdopTGNoEdYBcycEH0FZs5to2INEqmRo62ZQmbB+tq2MgDlYxRnhRBnLm0W4mUxQRgIIzj1VAF9R4ycv+dqe3m2gn4DVtGkOWbWY1YezqPmh7XHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsXowesb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsXowesb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738604281; x=1770140281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5Gv6wLV622GNItgAhTXyJC+IeLhaXz/HI1eJPHGrXU=;
  b=fsXowesbIdwqRxr2/hLvkF8qryOOsYwhvWVNtVdcFOe25UPhaBpqNV2S
   z9hqxTblWUZqwWS8UiZ3qoRn96TsRqaPbXv9g3hVZD9vti0wi+JcJp6YV
   zt5/XmM8Yso54tocuk/VYYcwQ9tlVn0Jp5XtqsFCfGb/s1BLiIbFLfqFr
   4nFKI2k6inFWsSByiqKPMpVZ2z4cC2QzQUKKX4s9iyH4rWvX5/75G6mOd
   ZhalC4JpQwmfH2J39o6aCEjaOLqFdySmAj8HONEUej1h4YstICbWqPHTh
   pEYFkKUffzXIsQdi2rIbryNj7DVA0BupTEXj4mguVKa9YHZZmpG1KKrPI
   w==;
X-CSE-ConnectionGUID: WdzEL2/EQAS0y99bktWn4g==
X-CSE-MsgGUID: TVyj/EvpTOqkYl0L4aoCZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39263020"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="39263020"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 09:38:00 -0800
X-CSE-ConnectionGUID: N/NsTbJaSo+hinAKZ+6U9Q==
X-CSE-MsgGUID: YNq4yZO3QpSDZbTxZR+MXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110154742"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2025 09:38:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf0OS-000rH1-34;
	Mon, 03 Feb 2025 17:37:56 +0000
Date: Tue, 4 Feb 2025 01:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 47/53]
 arch/xtensa/boot/dts/esp32s3-box3.dtb: /: 'model' is a required property
Message-ID: <202502040142.VKv9Yq0x-lkp@intel.com>
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
commit: 1a64cc79b9885054fbc821e34b4e916190627740 [47/53] xtensa: esp32s3: add esp32s3-box3.dts and defconfig
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: xtensa-randconfig-052-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040142.VKv9Yq0x-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040142.VKv9Yq0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502040142.VKv9Yq0x-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/xtensa/boot/dts/esp32s3.dtsi:61.22-66.5: Warning (simple_bus_reg): /clocks/spi3_clk: missing or empty reg/ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:68.20-73.5: Warning (simple_bus_reg): /clocks/usb_clk: missing or empty reg/ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:150.19-156.5: Warning (simple_bus_reg): /soc/syscon@60008000: missing or empty reg/ranges property
   arch/xtensa/boot/dts/esp32s3.dtsi:175.27-182.5: Warning (simple_bus_reg): /soc/pinctrl@60009000: simple-bus unit address format error, expected "60009004"
   arch/xtensa/boot/dts/esp32s3.dtsi:301.23-311.5: Warning (simple_bus_reg): /soc/intc@600c2000: simple-bus unit address format error, expected "600c2800"
   arch/xtensa/boot/dts/esp32s3.dtsi:31.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/xtensa/boot/dts/esp32s3.dtsi:93.18-105.5: Warning (avoid_unnecessary_addr_size): /soc/flash@42000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/xtensa/boot/dts/esp32s3.dtsi:145.21-148.5: Warning (unique_unit_address_if_enabled): /soc/lpm@60008000: duplicate unit-address (also used in node /soc/syscon@60008000)
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /: failed to match any schema with compatible: ['esp32s3']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: clocks: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: clocks: spi3_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: clocks: uart0_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: clocks: uart1_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: clocks: uart2_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: clocks: spi2_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: clocks: usb_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /pic: failed to match any schema with compatible: ['cdns,xtensa-pic']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: soc: syscon@60008000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: flash@42000000: partitions: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	'fis-index-block' is a required property
   	'partitions-table-offset' is a required property
>> 	arch/xtensa/boot/dts/esp32s3-box3.dtb: flash@42000000: partitions:compatible: 'oneOf' conditional failed, one must be fixed:
   		['esp,esp32-partition-table'] is too short
   		'fixed-partitions' was expected
   		'sercomm,sc-partitions' was expected
   	'arm,arm-firmware-suite' was expected
   	'brcm,bcm4908-partitions' was expected
   	'brcm,bcm947xx-cfe-partitions' was expected
   	'linksys,ns-partitions' was expected
   	'qcom,smem-part' was expected
   	'redboot-fis' was expected
   	'tplink,safeloader-partitions' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/flash@42000000/partitions: failed to match any schema with compatible: ['esp,esp32-partition-table']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: serial@60000000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: serial@60000000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: gpio@60004000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/gpio@60004000: failed to match any schema with compatible: ['esp,esp32s3-gpio']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: gpio_in_mux@60004154: $nodename:0: 'gpio_in_mux@60004154' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: gpio_in_mux@60004154: 'usb_device_in', 'usb_host_in' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: gpio_in_mux@60004154: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: gpio_out_mux@60004554: $nodename:0: 'gpio_out_mux@60004554' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: gpio_out_mux@60004554: 'spi2_gpio_out' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: gpio_out_mux@60004554: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: lpm@60008000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: usb_phy@60008120: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/usb_phy@60008120: failed to match any schema with compatible: ['esp,esp32s3-usb-phy']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: pinctrl@60008484: 'usb_rtc_pins' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: pinctrl@60008484: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: pinctrl@60009000: 'i2c0_pins', 'lcd_pins', 'spi2_pins', 'touch_panel_pins', 'uart0_pins', 'usb_pins' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/xtensa/boot/dts/esp32s3-box3.dtb: pinctrl@60009000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/xtensa/boot/dts/esp32s3-box3.dtb: serial@60010000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: spi@60024000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/spi@60024000: failed to match any schema with compatible: ['esp,esp32s3-spi']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: lcd_spi@0: compatible:0: 'ilitek,ili9341' is not one of ['adafruit,yx240qv29', 'st,sf-tc240t-9370-t', 'canaan,kd233-tft']
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9341.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: lcd_spi@0: compatible: ['ilitek,ili9341'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9341.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: lcd_spi@0: spi-max-frequency: 10000000 was expected
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9341.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: lcd_spi@0: Unevaluated properties are not allowed ('bgr', 'buswidth', 'compatible', 'height', 'led-gpios', 'width' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9341.yaml#
   arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/spi@60025000: failed to match any schema with compatible: ['esp,esp32s3-spi']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: serial@6002e000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/trng@6003507c: failed to match any schema with compatible: ['esp,esp32-trng']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: acm@60038000: $nodename:0: 'acm@60038000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-acm.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: acm@60038000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-acm.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: acm@60038000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: usb@60080000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['esp,esp32s3-usb', 'snps,dwc2'] is too long
   	['esp,esp32s3-usb', 'snps,dwc2'] is too short
   	'brcm,bcm2835-usb' was expected
   	'hisilicon,hi6220-usb' was expected
   	'ingenic,jz4775-otg' was expected
   	'ingenic,jz4780-otg' was expected
   	'ingenic,x1000-otg' was expected
   	'ingenic,x1600-otg' was expected
   	'ingenic,x1700-otg' was expected
   	'ingenic,x1830-otg' was expected
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
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: usb@60080000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: usb@60080000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/usb@60080000: failed to match any schema with compatible: ['esp,esp32s3-usb', 'snps,dwc2']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/ipc@600c0004: failed to match any schema with compatible: ['esp,esp32-ipc']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/ipc@600c0004/flash@2: failed to match any schema with compatible: ['esp,esp32-ipc-flash']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/ipc@600c0004/wifi@1: failed to match any schema with compatible: ['esp,esp32-wifi-shmem']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/clk@600c0010: failed to match any schema with compatible: ['esp,esp32s3-core-clock']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/clk_gpio@600c0018: failed to match any schema with compatible: ['esp,esp32-clk-gpio']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/clk_gpio@600c001c: failed to match any schema with compatible: ['esp,esp32-clk-gpio']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/reset@600c0020: failed to match any schema with compatible: ['esp,esp32-reset']
>> arch/xtensa/boot/dts/esp32s3-box3.dtb: /soc/intc@600c2000: failed to match any schema with compatible: ['esp,esp32-intc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
