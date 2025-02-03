Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112D4209F59
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601217; cv=none; b=P1VSwoawuj+epWwJ4KiqpgiXg4DZkCOoK1q2/F21l8IFYBL0kCYA/mwKtc+tcj9JVdhqy18o0OUPB3dNwPOTWfN7oiQIrh/Wq7SvV3/cX+TMnnS0NKmS5pm2CaEher/2/h2Elk+tyrIezUF5/xkoMfm1WIOdi5lE36t3p2fXG2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601217; c=relaxed/simple;
	bh=HQuiIYK6r2jskMd+evhKb/5fI3a9IA//AzT822JCmhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J/MZb4NjRNu5HSWb71t0uDGQxE4tN3WUVYFwACWgkBhdbFoRHWPXibzXGT5VkysnrFmZbS7fm9Mu9Kdr7pR8HZdx2vjApFs3LfxJlFw0GIjQiBa8mrRvBFSKcvKXmcvsq1WF7292XR++Pl9byaN6XzcLEX3cZ2bb1C6LPMcL/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NugOY+K9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NugOY+K9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738601214; x=1770137214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQuiIYK6r2jskMd+evhKb/5fI3a9IA//AzT822JCmhc=;
  b=NugOY+K96I/HZs9XNTcT4Vw6l/bkAT2TPfW1KIM9G+KfHODTpEEHhaU7
   7UIg/9UinsdZNOAcnskw4bJ2LKareo984M8XNv9BLbjD1kcLTdkP3k4IK
   EgD/9aJLHbAFt8zeBL2Skaz/dsJzTI/ia7nCgU38bH8+hfzsGy/kBS+KN
   zAPkIPLQlkgzgoNEYgQCCHpAbA8mNPfyGJJBK78IcsmSMlmI2uT1Zxm78
   QF2oaoc7fmwu/SZ7TcVAMLHU3e3335BB9vp77PTq8UPf40RJUrDLje+MF
   Ib2tXNqm+nXiy+pz73ho90V129R2V6G/V5BwiKTN0PhDFfZlmHMqwpPHh
   Q==;
X-CSE-ConnectionGUID: p8C8s+dYTZCLCFpeGruBFg==
X-CSE-MsgGUID: GfTTKBk5RFud761IP2StZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38979605"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="38979605"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:46:53 -0800
X-CSE-ConnectionGUID: jGGOnzqxRW6/4FBtLYyE+A==
X-CSE-MsgGUID: 2cNBjSReSEqqWNBnOezOVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="115365722"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2025 08:46:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tezaz-000rCZ-20;
	Mon, 03 Feb 2025 16:46:49 +0000
Date: Tue, 4 Feb 2025 00:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 46/53]
 arch/xtensa/boot/dts/esp32.dtsi:172.19-178.5: Warning (unit_address_vs_reg):
 /soc/syscon@3ff48000: node has a unit name, but no reg or ranges property
Message-ID: <202502040012.9E6UtfCa-lkp@intel.com>
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
commit: 9b28056e5c922c8db787c2e4be5fdf02aee6df82 [46/53] xtensa: esp32: add platform
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: xtensa-randconfig-052-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040012.9E6UtfCa-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040012.9E6UtfCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502040012.9E6UtfCa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/xtensa/boot/dts/esp32.dtsi:172.19-178.5: Warning (unit_address_vs_reg): /soc/syscon@3ff48000: node has a unit name, but no reg or ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:40.19-44.5: Warning (simple_bus_reg): /clocks/clk80m: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:45.23-49.5: Warning (simple_bus_reg): /clocks/clk8m5: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:50.21-54.5: Warning (simple_bus_reg): /clocks/clk128m: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:56.24-61.5: Warning (simple_bus_reg): /clocks/uart0_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:62.24-67.5: Warning (simple_bus_reg): /clocks/uart1_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:68.24-73.5: Warning (simple_bus_reg): /clocks/uart2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:74.22-79.5: Warning (simple_bus_reg): /clocks/spi2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:80.22-85.5: Warning (simple_bus_reg): /clocks/spi3_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:172.19-178.5: Warning (simple_bus_reg): /soc/syscon@3ff48000: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:191.27-198.5: Warning (simple_bus_reg): /soc/pinctrl@3ff49000: simple-bus unit address format error, expected "3ff49004"
>> arch/xtensa/boot/dts/esp32.dtsi:200.26-208.5: Warning (simple_bus_reg): /soc/serial@3ff50000: simple-bus unit address format error, expected "3ff40000"
>> arch/xtensa/boot/dts/esp32.dtsi:210.22-220.5: Warning (simple_bus_reg): /soc/spi@3ff64000: simple-bus unit address format error, expected "60024000"
>> arch/xtensa/boot/dts/esp32.dtsi:222.22-232.5: Warning (simple_bus_reg): /soc/spi@3ff65000: simple-bus unit address format error, expected "60025000"
>> arch/xtensa/boot/dts/esp32.dtsi:234.26-242.5: Warning (simple_bus_reg): /soc/serial@3ff6e000: simple-bus unit address format error, expected "3ff40000"
>> arch/xtensa/boot/dts/esp32.dtsi:35.9-86.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/xtensa/boot/dts/esp32.dtsi:167.21-170.5: Warning (unique_unit_address_if_enabled): /soc/lpm@3ff48000: duplicate unit-address (also used in node /soc/syscon@3ff48000)
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /: failed to match any schema with compatible: ['esp32']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: uart2_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: clk128m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: clk80m: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: clk8m5: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: spi2_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: uart1_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: uart0_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: spi3_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /pic: failed to match any schema with compatible: ['cdns,xtensa-pic']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: soc: syscon@3ff48000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/clk_gpio@3ff000c0: failed to match any schema with compatible: ['esp,esp32-clk-gpio']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/reset@3ff000c4: failed to match any schema with compatible: ['esp,esp32-reset']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/intc@3ff00104: failed to match any schema with compatible: ['esp,esp32-intc']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: serial@3ff40000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: serial@3ff40000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: gpio@3ff44000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/gpio@3ff44000: failed to match any schema with compatible: ['esp,esp32-gpio']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: gpio_in_mux@3ff44130: $nodename:0: 'gpio_in_mux@3ff44130' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: gpio_out_mux@3ff44530: $nodename:0: 'gpio_out_mux@3ff44530' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: lpm@3ff48000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/clk@3ff48070: failed to match any schema with compatible: ['esp,esp32-core-clock']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: pinctrl@3ff49000: 'i2c0_pins', 'uart0_pins' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: pinctrl@3ff49000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: serial@3ff50000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/spi@3ff64000: failed to match any schema with compatible: ['esp,esp32-spi']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/spi@3ff65000: failed to match any schema with compatible: ['esp,esp32-spi']
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: serial@3ff6e000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
>> arch/xtensa/boot/dts/esp32-wrover-dev.dtb: /soc/trng@3ff75144: failed to match any schema with compatible: ['esp,esp32-trng']
--
>> arch/xtensa/boot/dts/esp32s3.dtsi:150.19-156.5: Warning (unit_address_vs_reg): /soc/syscon@60008000: node has a unit name, but no reg or ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:36.24-41.5: Warning (simple_bus_reg): /clocks/uart0_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:42.24-47.5: Warning (simple_bus_reg): /clocks/uart1_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:48.24-53.5: Warning (simple_bus_reg): /clocks/uart2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:55.22-60.5: Warning (simple_bus_reg): /clocks/spi2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:61.22-66.5: Warning (simple_bus_reg): /clocks/spi3_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:68.20-73.5: Warning (simple_bus_reg): /clocks/usb_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:150.19-156.5: Warning (simple_bus_reg): /soc/syscon@60008000: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:175.27-182.5: Warning (simple_bus_reg): /soc/pinctrl@60009000: simple-bus unit address format error, expected "60009004"
>> arch/xtensa/boot/dts/esp32s3.dtsi:301.23-311.5: Warning (simple_bus_reg): /soc/intc@600c2000: simple-bus unit address format error, expected "600c2800"
>> arch/xtensa/boot/dts/esp32s3.dtsi:31.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/xtensa/boot/dts/esp32s3.dtsi:93.18-105.5: Warning (avoid_unnecessary_addr_size): /soc/flash@42000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/xtensa/boot/dts/esp32s3.dtsi:145.21-148.5: Warning (unique_unit_address_if_enabled): /soc/lpm@60008000: duplicate unit-address (also used in node /soc/syscon@60008000)
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /: failed to match any schema with compatible: ['esp32s3']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: usb_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: spi2_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: uart2_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: spi3_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: uart1_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: uart0_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /pic: failed to match any schema with compatible: ['cdns,xtensa-pic']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: soc: syscon@60008000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: flash@42000000: partitions: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells' is a required property
   	'#size-cells' is a required property
   	'fis-index-block' is a required property
   	'partitions-table-offset' is a required property
>> 	arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: flash@42000000: partitions:compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/flash@42000000/partitions: failed to match any schema with compatible: ['esp,esp32-partition-table']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: serial@60000000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: serial@60000000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio@60004000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/gpio@60004000: failed to match any schema with compatible: ['esp,esp32s3-gpio']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio_in_mux@60004154: $nodename:0: 'gpio_in_mux@60004154' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: gpio_out_mux@60004554: $nodename:0: 'gpio_out_mux@60004554' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: lpm@60008000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/usb_phy@60008120: failed to match any schema with compatible: ['esp,esp32s3-usb-phy']
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: pinctrl@60009000: 'i2c0_pins', 'spi2_pins', 'uart0_pins' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: pinctrl@60009000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: serial@60010000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: spi@60024000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/spi@60024000: failed to match any schema with compatible: ['esp,esp32s3-spi']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: mmc_spi@0: $nodename:0: 'mmc_spi@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: mmc_spi@0: 'spi-max-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/spi@60025000: failed to match any schema with compatible: ['esp,esp32s3-spi']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: serial@6002e000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-uart.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/trng@6003507c: failed to match any schema with compatible: ['esp,esp32-trng']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: acm@60038000: $nodename:0: 'acm@60038000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-acm.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: acm@60038000: 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/serial/esp,esp32-acm.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: acm@60038000: status: 'oneOf' conditional failed, one must be fixed:
   	['ok'] is not of type 'object'
   	'ok' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: usb@60080000: compatible: 'oneOf' conditional failed, one must be fixed:
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
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/usb@60080000: failed to match any schema with compatible: ['esp,esp32s3-usb', 'snps,dwc2']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/ipc@600c0004: failed to match any schema with compatible: ['esp,esp32-ipc']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/ipc@600c0004/flash@2: failed to match any schema with compatible: ['esp,esp32-ipc-flash']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/ipc@600c0004/wifi@1: failed to match any schema with compatible: ['esp,esp32-wifi-shmem']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/clk@600c0010: failed to match any schema with compatible: ['esp,esp32s3-core-clock']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/clk_gpio@600c0018: failed to match any schema with compatible: ['esp,esp32-clk-gpio']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/clk_gpio@600c001c: failed to match any schema with compatible: ['esp,esp32-clk-gpio']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/reset@600c0020: failed to match any schema with compatible: ['esp,esp32-reset']
>> arch/xtensa/boot/dts/esp32s3-devkit-c1.dtb: /soc/intc@600c2000: failed to match any schema with compatible: ['esp,esp32-intc']

vim +172 arch/xtensa/boot/dts/esp32.dtsi

9b28056e5c922c Max Filippov 2019-12-15    3  
9b28056e5c922c Max Filippov 2019-12-15    4  / {
9b28056e5c922c Max Filippov 2019-12-15    5  	compatible = "esp32";
9b28056e5c922c Max Filippov 2019-12-15    6  	#address-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15    7  	#size-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15    8  	interrupt-parent = <&pic>;
9b28056e5c922c Max Filippov 2019-12-15    9  
9b28056e5c922c Max Filippov 2019-12-15   10  	chosen {
9b28056e5c922c Max Filippov 2019-12-15   11  		bootargs = "earlycon=esp32uart,mmio32,0x3ff40000,115200n8 console=ttyS0,115200n8 debug rw root=mtd:rootfs no_hash_pointers ";
9b28056e5c922c Max Filippov 2019-12-15   12  	};
9b28056e5c922c Max Filippov 2019-12-15   13  
9b28056e5c922c Max Filippov 2019-12-15   14  	aliases {
9b28056e5c922c Max Filippov 2019-12-15   15  		serial0 = "/soc/serial@3ff40000";
9b28056e5c922c Max Filippov 2019-12-15   16  		serial1 = "/soc/serial@3ff50000";
9b28056e5c922c Max Filippov 2019-12-15   17  		serial2 = "/soc/serial@3ff6e000";
9b28056e5c922c Max Filippov 2019-12-15   18  	};
9b28056e5c922c Max Filippov 2019-12-15   19  
9b28056e5c922c Max Filippov 2019-12-15   20  	memory@0 {
9b28056e5c922c Max Filippov 2019-12-15   21  		device_type = "memory";
9b28056e5c922c Max Filippov 2019-12-15   22  		reg = <0x3f800000 0x00400000>;
9b28056e5c922c Max Filippov 2019-12-15   23  	};
9b28056e5c922c Max Filippov 2019-12-15   24  
9b28056e5c922c Max Filippov 2019-12-15   25  	cpus {
9b28056e5c922c Max Filippov 2019-12-15   26  		#address-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15   27  		#size-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   28  		cpu@0 {
9b28056e5c922c Max Filippov 2019-12-15   29  			compatible = "cdns,xtensa-cpu";
9b28056e5c922c Max Filippov 2019-12-15   30  			reg = <0>;
9b28056e5c922c Max Filippov 2019-12-15   31  			clocks = <&clk 0>;
9b28056e5c922c Max Filippov 2019-12-15   32  		};
9b28056e5c922c Max Filippov 2019-12-15   33  	};
9b28056e5c922c Max Filippov 2019-12-15   34  
9b28056e5c922c Max Filippov 2019-12-15  @35  	clocks {
9b28056e5c922c Max Filippov 2019-12-15   36  		compatible = "simple-bus";
9b28056e5c922c Max Filippov 2019-12-15   37  		#address-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15   38  		#size-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   39  
9b28056e5c922c Max Filippov 2019-12-15  @40  		xtl_clk: clk80m {
9b28056e5c922c Max Filippov 2019-12-15   41  			#clock-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   42  			compatible = "fixed-clock";
9b28056e5c922c Max Filippov 2019-12-15   43  			clock-frequency = <80000000>;
9b28056e5c922c Max Filippov 2019-12-15   44  		};
9b28056e5c922c Max Filippov 2019-12-15  @45  		rc_fast_clk: clk8m5 {
9b28056e5c922c Max Filippov 2019-12-15   46  			#clock-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   47  			compatible = "fixed-clock";
9b28056e5c922c Max Filippov 2019-12-15   48  			clock-frequency = <8500000>;
9b28056e5c922c Max Filippov 2019-12-15   49  		};
9b28056e5c922c Max Filippov 2019-12-15  @50  		apll_clk: clk128m {
9b28056e5c922c Max Filippov 2019-12-15   51  			#clock-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   52  			compatible = "fixed-clock";
9b28056e5c922c Max Filippov 2019-12-15   53  			clock-frequency = <128000000>;
9b28056e5c922c Max Filippov 2019-12-15   54  		};
9b28056e5c922c Max Filippov 2019-12-15   55  
9b28056e5c922c Max Filippov 2019-12-15  @56  		uart0_clk: uart0_clk {
9b28056e5c922c Max Filippov 2019-12-15   57  			#clock-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   58  			compatible = "gpio-gate-clock";
9b28056e5c922c Max Filippov 2019-12-15   59  			clocks = <&clk 1>;
9b28056e5c922c Max Filippov 2019-12-15   60  			enable-gpios = <&clk_gpio0 2 0>;
9b28056e5c922c Max Filippov 2019-12-15   61  		};
9b28056e5c922c Max Filippov 2019-12-15  @62  		uart1_clk: uart1_clk {
9b28056e5c922c Max Filippov 2019-12-15   63  			#clock-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   64  			compatible = "gpio-gate-clock";
9b28056e5c922c Max Filippov 2019-12-15   65  			clocks = <&clk 1>;
9b28056e5c922c Max Filippov 2019-12-15   66  			enable-gpios = <&clk_gpio0 5 0>;
9b28056e5c922c Max Filippov 2019-12-15   67  		};
9b28056e5c922c Max Filippov 2019-12-15  @68  		uart2_clk: uart2_clk {
9b28056e5c922c Max Filippov 2019-12-15   69  			#clock-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   70  			compatible = "gpio-gate-clock";
9b28056e5c922c Max Filippov 2019-12-15   71  			clocks = <&clk 1>;
9b28056e5c922c Max Filippov 2019-12-15   72  			enable-gpios = <&clk_gpio0 23 0>;
9b28056e5c922c Max Filippov 2019-12-15   73  		};
9b28056e5c922c Max Filippov 2019-12-15  @74  		spi2_clk: spi2_clk {
9b28056e5c922c Max Filippov 2019-12-15   75  			#clock-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   76  			compatible = "gpio-gate-clock";
9b28056e5c922c Max Filippov 2019-12-15   77  			clocks = <&clk 1>;
9b28056e5c922c Max Filippov 2019-12-15   78  			enable-gpios = <&clk_gpio0 6 0>;
9b28056e5c922c Max Filippov 2019-12-15   79  		};
9b28056e5c922c Max Filippov 2019-12-15  @80  		spi3_clk: spi3_clk {
9b28056e5c922c Max Filippov 2019-12-15   81  			#clock-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15   82  			compatible = "gpio-gate-clock";
9b28056e5c922c Max Filippov 2019-12-15   83  			clocks = <&clk 1>;
9b28056e5c922c Max Filippov 2019-12-15   84  			enable-gpios = <&clk_gpio0 16 0>;
9b28056e5c922c Max Filippov 2019-12-15   85  		};
9b28056e5c922c Max Filippov 2019-12-15   86  	};
9b28056e5c922c Max Filippov 2019-12-15   87  
9b28056e5c922c Max Filippov 2019-12-15   88  	pic: pic {
9b28056e5c922c Max Filippov 2019-12-15   89  		compatible = "cdns,xtensa-pic";
9b28056e5c922c Max Filippov 2019-12-15   90  		/* one cell: internal irq number,
9b28056e5c922c Max Filippov 2019-12-15   91  		 * two cells: second cell == 0: internal irq number
9b28056e5c922c Max Filippov 2019-12-15   92  		 *            second cell == 1: external irq number
9b28056e5c922c Max Filippov 2019-12-15   93  		 */
9b28056e5c922c Max Filippov 2019-12-15   94  		#interrupt-cells = <2>;
9b28056e5c922c Max Filippov 2019-12-15   95  		interrupt-controller;
9b28056e5c922c Max Filippov 2019-12-15   96  	};
9b28056e5c922c Max Filippov 2019-12-15   97  
9b28056e5c922c Max Filippov 2019-12-15   98  	soc {
9b28056e5c922c Max Filippov 2019-12-15   99  		#address-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15  100  		#size-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15  101  		compatible = "simple-bus";
9b28056e5c922c Max Filippov 2019-12-15  102  		interrupt-parent = <&intc>;
9b28056e5c922c Max Filippov 2019-12-15  103  		ranges;
9b28056e5c922c Max Filippov 2019-12-15  104  
9b28056e5c922c Max Filippov 2019-12-15  105  		clk_gpio0: clk_gpio@3ff000c0 {
9b28056e5c922c Max Filippov 2019-12-15  106  			#gpio-cells = <2>;
9b28056e5c922c Max Filippov 2019-12-15  107  			compatible = "esp,esp32-clk-gpio";
9b28056e5c922c Max Filippov 2019-12-15  108  			reg = <0x3ff000c0 4>;
9b28056e5c922c Max Filippov 2019-12-15  109  			reg-names = "dat";
9b28056e5c922c Max Filippov 2019-12-15  110  		};
9b28056e5c922c Max Filippov 2019-12-15  111  
9b28056e5c922c Max Filippov 2019-12-15  112  		reset: reset@3ff000c4 {
9b28056e5c922c Max Filippov 2019-12-15  113  			#reset-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15  114  			compatible = "esp,esp32-reset";
9b28056e5c922c Max Filippov 2019-12-15  115  			reg = <0x3ff000c4 4>;
9b28056e5c922c Max Filippov 2019-12-15  116  		};
9b28056e5c922c Max Filippov 2019-12-15  117  
9b28056e5c922c Max Filippov 2019-12-15  118  		intc: intc@3ff00104 {
9b28056e5c922c Max Filippov 2019-12-15  119  			compatible = "esp,esp32-intc";
9b28056e5c922c Max Filippov 2019-12-15  120  			reg = <0x3ff00104 0x114>;
9b28056e5c922c Max Filippov 2019-12-15  121  			/* first cell: interrupt matrix row
9b28056e5c922c Max Filippov 2019-12-15  122  			 * second cell: internal xtensa core IRQ number to connect to
9b28056e5c922c Max Filippov 2019-12-15  123  			 */
9b28056e5c922c Max Filippov 2019-12-15  124  			#interrupt-cells = <2>;
9b28056e5c922c Max Filippov 2019-12-15  125  			interrupt-controller;
9b28056e5c922c Max Filippov 2019-12-15  126  			interrupt-parent = <&pic>;
9b28056e5c922c Max Filippov 2019-12-15  127  		};
9b28056e5c922c Max Filippov 2019-12-15  128  
9b28056e5c922c Max Filippov 2019-12-15  129  		uart0: serial@3ff40000 {
9b28056e5c922c Max Filippov 2019-12-15  130  			compatible = "esp,esp32-uart";
9b28056e5c922c Max Filippov 2019-12-15  131  			reg = <0x3ff40000 0x80>;
9b28056e5c922c Max Filippov 2019-12-15  132  			interrupts = <34 1>; /* UART0, external IRQ1 */
9b28056e5c922c Max Filippov 2019-12-15  133  			clocks = <&uart0_clk>;
9b28056e5c922c Max Filippov 2019-12-15  134  			resets = <&reset 2>;
9b28056e5c922c Max Filippov 2019-12-15  135  			reset-names = "reset";
9b28056e5c922c Max Filippov 2019-12-15  136  			status = "disabled";
9b28056e5c922c Max Filippov 2019-12-15  137  		};
9b28056e5c922c Max Filippov 2019-12-15  138  
9b28056e5c922c Max Filippov 2019-12-15  139  		gpio0: gpio@3ff44000 {
9b28056e5c922c Max Filippov 2019-12-15  140  			#gpio-cells = <2>;
9b28056e5c922c Max Filippov 2019-12-15  141  			compatible = "esp,esp32-gpio";
9b28056e5c922c Max Filippov 2019-12-15  142  			reg = <0x3ff44000 0x128>;
9b28056e5c922c Max Filippov 2019-12-15  143  			interrupts = <22 8>; /* GPIO, external IRQ8 */
9b28056e5c922c Max Filippov 2019-12-15  144  			interrupt-controller;
9b28056e5c922c Max Filippov 2019-12-15  145  			#interrupt-cells = <2>;
9b28056e5c922c Max Filippov 2019-12-15  146  			status = "disabled";
9b28056e5c922c Max Filippov 2019-12-15  147  		};
9b28056e5c922c Max Filippov 2019-12-15  148  
9b28056e5c922c Max Filippov 2019-12-15  149  		gpio_in_mux: gpio_in_mux@3ff44130 {
9b28056e5c922c Max Filippov 2019-12-15  150  			compatible = "pinctrl-single";
9b28056e5c922c Max Filippov 2019-12-15  151  			reg = <0x3ff44130 0x400>;
9b28056e5c922c Max Filippov 2019-12-15  152  			#pinctrl-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15  153  			pinctrl-single,register-width = <32>;
9b28056e5c922c Max Filippov 2019-12-15  154  			pinctrl-single,function-mask = <0xff>;
9b28056e5c922c Max Filippov 2019-12-15  155  			status = "disabled";
9b28056e5c922c Max Filippov 2019-12-15  156  		};
9b28056e5c922c Max Filippov 2019-12-15  157  
9b28056e5c922c Max Filippov 2019-12-15  158  		gpio_out_mux: gpio_out_mux@3ff44530 {
9b28056e5c922c Max Filippov 2019-12-15  159  			compatible = "pinctrl-single";
9b28056e5c922c Max Filippov 2019-12-15  160  			reg = <0x3ff44530 0xa0>;
9b28056e5c922c Max Filippov 2019-12-15  161  			#pinctrl-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15  162  			pinctrl-single,register-width = <32>;
9b28056e5c922c Max Filippov 2019-12-15  163  			pinctrl-single,function-mask = <0xfff>;
9b28056e5c922c Max Filippov 2019-12-15  164  			status = "disabled";
9b28056e5c922c Max Filippov 2019-12-15  165  		};
9b28056e5c922c Max Filippov 2019-12-15  166  
9b28056e5c922c Max Filippov 2019-12-15 @167  		lpm: lpm@3ff48000 {
9b28056e5c922c Max Filippov 2019-12-15  168  			compatible = "syscon";
9b28056e5c922c Max Filippov 2019-12-15  169  			reg = <0x3ff48000 0x1000>;
9b28056e5c922c Max Filippov 2019-12-15  170  		};
9b28056e5c922c Max Filippov 2019-12-15  171  
9b28056e5c922c Max Filippov 2019-12-15 @172  		syscon@3ff48000 {
9b28056e5c922c Max Filippov 2019-12-15  173  			compatible = "syscon-reboot";
9b28056e5c922c Max Filippov 2019-12-15  174  			regmap = <&lpm>;
9b28056e5c922c Max Filippov 2019-12-15  175  			offset = <0>;
9b28056e5c922c Max Filippov 2019-12-15  176  			value = <0x80000000>;
9b28056e5c922c Max Filippov 2019-12-15  177  			mask = <0x80000000>;
9b28056e5c922c Max Filippov 2019-12-15  178  		};
9b28056e5c922c Max Filippov 2019-12-15  179  
9b28056e5c922c Max Filippov 2019-12-15  180  		clk: clk@3ff48070 {
9b28056e5c922c Max Filippov 2019-12-15  181  			compatible = "esp,esp32-core-clock";
9b28056e5c922c Max Filippov 2019-12-15  182  			reg = <0x3ff48070 4
9b28056e5c922c Max Filippov 2019-12-15  183  			       0x3ff0003c 4
9b28056e5c922c Max Filippov 2019-12-15  184  			       0x3ff66000 4>;
9b28056e5c922c Max Filippov 2019-12-15  185  			clocks = <&xtl_clk>, <&rc_fast_clk>, <&apll_clk>;
9b28056e5c922c Max Filippov 2019-12-15  186  			clock-names = "xtl", "rc_fast", "apll";
9b28056e5c922c Max Filippov 2019-12-15  187  			#clock-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15  188  			/* clock-output-names = "cpu_clk", "apb_clk"; */
9b28056e5c922c Max Filippov 2019-12-15  189  		};
9b28056e5c922c Max Filippov 2019-12-15  190  
9b28056e5c922c Max Filippov 2019-12-15 @191  		iomux: pinctrl@3ff49000 {
9b28056e5c922c Max Filippov 2019-12-15  192  			compatible = "pinctrl-single";
9b28056e5c922c Max Filippov 2019-12-15  193  			reg = <0x3ff49004 0x90>;
9b28056e5c922c Max Filippov 2019-12-15  194  			#pinctrl-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15  195  			pinctrl-single,register-width = <32>;
9b28056e5c922c Max Filippov 2019-12-15  196  			pinctrl-single,function-mask = <0xffff>;
9b28056e5c922c Max Filippov 2019-12-15  197  			status = "disabled";
9b28056e5c922c Max Filippov 2019-12-15  198  		};
9b28056e5c922c Max Filippov 2019-12-15  199  
9b28056e5c922c Max Filippov 2019-12-15 @200  		uart1: serial@3ff50000 {
9b28056e5c922c Max Filippov 2019-12-15  201  			compatible = "esp,esp32-uart";
9b28056e5c922c Max Filippov 2019-12-15  202  			reg = <0x3ff40000 0x80>;
9b28056e5c922c Max Filippov 2019-12-15  203  			interrupts = <35 2>; /* UART1, external IRQ2 */
9b28056e5c922c Max Filippov 2019-12-15  204  			clocks = <&uart1_clk>;
9b28056e5c922c Max Filippov 2019-12-15  205  			resets = <&reset 5>;
9b28056e5c922c Max Filippov 2019-12-15  206  			reset-names = "reset";
9b28056e5c922c Max Filippov 2019-12-15  207  			status = "disabled";
9b28056e5c922c Max Filippov 2019-12-15  208  		};
9b28056e5c922c Max Filippov 2019-12-15  209  
9b28056e5c922c Max Filippov 2019-12-15 @210  		spi2: spi@3ff64000 {
9b28056e5c922c Max Filippov 2019-12-15  211  			#address-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15  212  			#size-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15  213  			compatible = "esp,esp32-spi";
9b28056e5c922c Max Filippov 2019-12-15  214  			reg = <0x60024000 0x100>;
9b28056e5c922c Max Filippov 2019-12-15  215  			interrupts = <30 4>; /* SPI2, external IRQ4 */
9b28056e5c922c Max Filippov 2019-12-15  216  			clocks = <&spi2_clk>;
9b28056e5c922c Max Filippov 2019-12-15  217  			resets = <&reset 6>;
9b28056e5c922c Max Filippov 2019-12-15  218  			reset-names = "reset";
9b28056e5c922c Max Filippov 2019-12-15  219  			status = "disabled";
9b28056e5c922c Max Filippov 2019-12-15  220  		};
9b28056e5c922c Max Filippov 2019-12-15  221  
9b28056e5c922c Max Filippov 2019-12-15 @222  		spi3: spi@3ff65000 {
9b28056e5c922c Max Filippov 2019-12-15  223  			#address-cells = <1>;
9b28056e5c922c Max Filippov 2019-12-15  224  			#size-cells = <0>;
9b28056e5c922c Max Filippov 2019-12-15  225  			compatible = "esp,esp32-spi";
9b28056e5c922c Max Filippov 2019-12-15  226  			reg = <0x60025000 0x100>;
9b28056e5c922c Max Filippov 2019-12-15  227  			interrupts = <31 5>; /* SPI3, external IRQ5 */
9b28056e5c922c Max Filippov 2019-12-15  228  			clocks = <&spi3_clk>;
9b28056e5c922c Max Filippov 2019-12-15  229  			resets = <&reset 16>;
9b28056e5c922c Max Filippov 2019-12-15  230  			reset-names = "reset";
9b28056e5c922c Max Filippov 2019-12-15  231  			status = "disabled";
9b28056e5c922c Max Filippov 2019-12-15  232  		};
9b28056e5c922c Max Filippov 2019-12-15  233  
9b28056e5c922c Max Filippov 2019-12-15 @234  		uart2: serial@3ff6e000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
