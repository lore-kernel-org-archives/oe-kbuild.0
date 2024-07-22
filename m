Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF721DFEF
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721672097; cv=none; b=VuCiuWP8C0u6FFZsnI0HF4u+teRp8kfAX6rLQInrhhnFEdH7R2db7ghWjffd/6N3TLLlCysIe+dgmRlUc7HqMFrF8sFefpkJ+fxSGRDsqo4iBH9oL0XNNCX7t4Z5I3yL7lMXzjZethynZ0BqnLvxT0Jp1g/obLcMqgnemm1ZxPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721672097; c=relaxed/simple;
	bh=1YZ0eONg/T0mWoCmrTKVE+nolxqXHtTl5LIT1XHiGDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbNWaXHRNbUDFoNt8/KPfO6W2dHxv7kH9QsuJDQJUJkkQ2XMviart6l6O6JfgZmrsdgsCrvEIqCyboHL4IHra07IGPRDlfTJq/Mx1oZdKHSRULh9eedN5EHpxWyEm15qAWry6yu6EQau+8xvAY45K+GAihul7sJBzhBrKHm9Qew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9IPhECg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9IPhECg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721672092; x=1753208092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1YZ0eONg/T0mWoCmrTKVE+nolxqXHtTl5LIT1XHiGDY=;
  b=O9IPhECges8Gck7p8ynsqv6jW8NEs5R8ImY8XHbkZ0wXScwKuaNeDeFP
   2HgN9OToB+ZVa/uvzMQkEOnCiRQc45cvKWiTkfCnjrRCSMyzEpoVRLs+o
   jRcDX6b9RjUAK/gzjYR48as5LzgAGzdCSjpx80/jXoqX2aTUpP5PzcPmX
   TbjakY4YgIP2/BtaUTqHhfa74F+FAecPqRb4bWVYtkHi1u0ntLMJpsobj
   VtuhJWyQx4x2PkVCGa49Ybz64QkidylCMsO8bKnb+3xBTV9ckRwlLczWD
   MtW7cTn294ArhnNyAW2FxF+cvT9w/lxaq06F4lfoLaF0PAi0XZS/URQEj
   w==;
X-CSE-ConnectionGUID: 6FTH21v4QIOsu8Wr0ed4Fg==
X-CSE-MsgGUID: J+IYE76pQtKgIbF++wivCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="18960504"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="18960504"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 11:14:51 -0700
X-CSE-ConnectionGUID: BLvtchH0SOm9HWbspuw6ow==
X-CSE-MsgGUID: MOHFR1nsThWjX4VsKuuBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="52572873"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jul 2024 11:14:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVxYd-000lIV-2A;
	Mon, 22 Jul 2024 18:14:47 +0000
Date: Tue, 23 Jul 2024 02:14:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 3/3] ARM: dts: davinci, keystone: correct watchdog
 nodenames
Message-ID: <202407230128.7c0gMOH5-lkp@intel.com>
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
In-Reply-To: <20240721170840.15569-4-five231003@gmail.com>
References: <20240721170840.15569-4-five231003@gmail.com>
TO: Kousik Sanagavarapu <five231003@gmail.com>

Hi Kousik,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tip/timers/core brgl/gpio/for-next linus/master v6.10 next-20240719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kousik-Sanagavarapu/dt-bindings-timer-ti-davinci-timer-convert-to-dtschema/20240722-012123
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240721170840.15569-4-five231003%40gmail.com
patch subject: [RFC PATCH 3/3] ARM: dts: davinci, keystone: correct watchdog nodenames
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm-randconfig-051-20240722 (https://download.01.org/0day-ci/archive/20240723/202407230128.7c0gMOH5-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230128.7c0gMOH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407230128.7c0gMOH5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:8.20-67.3: Warning (unit_address_vs_reg): /soc@0/qmss@4020000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:25.9-33.5: Warning (unit_address_vs_reg): /soc@0/qmss@4020000/qmgrs/qmgr0: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:69.24-90.3: Warning (unit_address_vs_reg): /soc@0/knav_dmas@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dts:76.18-119.4: Warning (unit_address_vs_reg): /sound@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dts:88.32-102.5: Warning (unit_address_vs_reg): /sound@0/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dts:104.32-118.5: Warning (unit_address_vs_reg): /sound@0/simple-audio-card,dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi:322.21-342.5: Warning (simple_bus_reg): /soc@0/dss@02540000: simple-bus unit address format error, expected "2540000"
>> arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi:613.26-618.5: Warning (simple_bus_reg): /soc@0/watchdog@02250000: simple-bus unit address format error, expected "2250000"
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:8.20-67.3: Warning (simple_bus_reg): /soc@0/qmss@4020000: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:69.24-90.3: Warning (simple_bus_reg): /soc@0/knav_dmas@0: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:92.22-147.3: Warning (simple_bus_reg): /soc@0/netcp@4000000: simple-bus unit address format error, expected "2620110"
   arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi:90.14-638.4: Warning (unique_unit_address_if_enabled): /soc@0: duplicate unit-address (also used in node /sound@0)
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: /: sound@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
--
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usbphy: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usb-phy@0: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usb-phy@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usb-phy@1: '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: usb-phy@1: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: soc@0: watchdog@02250000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: /soc@0: failed to match any schema with compatible: ['ti,keystone', 'simple-bus']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: /soc@0/device-state-control@2620000: failed to match any schema with compatible: ['ti,keystone-devctrl', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: /soc@0/device-state-control@2620000/keystone_irq@2a0: failed to match any schema with compatible: ['ti,keystone-irq']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: /soc@0/device-state-control@2620000/keystone_dsp_gpio@240: failed to match any schema with compatible: ['ti,keystone-dsp-gpio']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: serial@2530c00: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: serial@2531400: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-evm.dtb: /soc@0/i2c@2530000: failed to match any schema with compatible: ['ti,keystone-i2c']
--
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:8.20-67.3: Warning (unit_address_vs_reg): /soc@0/qmss@4020000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:25.9-33.5: Warning (unit_address_vs_reg): /soc@0/qmss@4020000/qmgrs/qmgr0: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:69.24-90.3: Warning (unit_address_vs_reg): /soc@0/knav_dmas@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi:322.21-342.5: Warning (simple_bus_reg): /soc@0/dss@02540000: simple-bus unit address format error, expected "2540000"
>> arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi:613.26-618.5: Warning (simple_bus_reg): /soc@0/watchdog@02250000: simple-bus unit address format error, expected "2250000"
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:8.20-67.3: Warning (simple_bus_reg): /soc@0/qmss@4020000: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:69.24-90.3: Warning (simple_bus_reg): /soc@0/knav_dmas@0: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/keystone/keystone-k2g-netcp.dtsi:92.22-147.3: Warning (simple_bus_reg): /soc@0/netcp@4000000: simple-bus unit address format error, expected "2620110"
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /: failed to match any schema with compatible: ['ti,k2g-ice', 'ti,k2g', 'ti,keystone']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /: failed to match any schema with compatible: ['ti,k2g-ice', 'ti,k2g', 'ti,keystone']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /: failed to match any schema with compatible: ['ti,k2g-ice', 'ti,k2g', 'ti,keystone']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usbphy: $nodename:0: 'usbphy' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usbphy: usb-phy@0:reg:0: [0] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usbphy: usb-phy@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usbphy: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usb-phy@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: usb-phy@1: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: soc@0: watchdog@02250000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0: failed to match any schema with compatible: ['ti,keystone', 'simple-bus']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0/device-state-control@2620000: failed to match any schema with compatible: ['ti,keystone-devctrl', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0/device-state-control@2620000/keystone_irq@2a0: failed to match any schema with compatible: ['ti,keystone-irq']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0/device-state-control@2620000/keystone_dsp_gpio@240: failed to match any schema with compatible: ['ti,keystone-dsp-gpio']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: serial@2530c00: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0/i2c@2530000: failed to match any schema with compatible: ['ti,keystone-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0/i2c@2530400: failed to match any schema with compatible: ['ti,keystone-i2c']
   arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb: /soc@0/i2c@2530800: failed to match any schema with compatible: ['ti,keystone-i2c']

vim +/2250000 +613 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi

734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   11  
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   12  / {
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   13  	compatible = "ti,k2g","ti,keystone";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   14  	model = "Texas Instruments K2G SoC";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   15  	#address-cells = <2>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   16  	#size-cells = <2>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   17  	interrupt-parent = <&gic>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   18  
f402573fc010fe arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-05-21   19  	chosen { };
f402573fc010fe arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-05-21   20  
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   21  	aliases {
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   22  		serial0 = &uart0;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06   23  		serial1 = &uart1;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06   24  		serial2 = &uart2;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09   25  		i2c0 = &i2c0;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09   26  		i2c1 = &i2c1;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09   27  		i2c2 = &i2c2;
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12   28  		rproc0 = &dsp0;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   29  	};
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   30  
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   31  	cpus {
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   32  		#address-cells = <1>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   33  		#size-cells = <0>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   34  
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   35  		cpu@0 {
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   36  			compatible = "arm,cortex-a15";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   37  			device_type = "cpu";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   38  			reg = <0>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   39  		};
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   40  	};
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   41  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13   42  	gic: interrupt-controller@2561000 {
387720c93812f1 arch/arm/boot/dts/keystone-k2g.dtsi             Marc Zyngier           2017-01-18   43  		compatible = "arm,gic-400", "arm,cortex-a15-gic";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   44  		#interrupt-cells = <3>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   45  		interrupt-controller;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   46  		reg = <0x0 0x02561000 0x0 0x1000>,
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   47  		      <0x0 0x02562000 0x0 0x2000>,
387720c93812f1 arch/arm/boot/dts/keystone-k2g.dtsi             Marc Zyngier           2017-01-18   48  		      <0x0 0x02564000 0x0 0x2000>,
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   49  		      <0x0 0x02566000 0x0 0x2000>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   50  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   51  				IRQ_TYPE_LEVEL_HIGH)>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   52  	};
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   53  
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   54  	timer {
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   55  		compatible = "arm,armv7-timer";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   56  		interrupts =
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   57  			<GIC_PPI 13
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   58  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   59  			<GIC_PPI 14
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   60  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   61  			<GIC_PPI 11
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   62  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   63  			<GIC_PPI 10
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   64  				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   65  	};
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   66  
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   67  	pmu {
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   68  		compatible = "arm,cortex-a15-pmu";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   69  		interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   70  	};
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   71  
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   72  	usbphy {
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   73  		#address-cells = <1>;
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   74  		#size-cells = <0>;
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   75  		compatible = "simple-bus";
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   76  
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   77  		usb0_phy: usb-phy@0 {
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   78  			compatible = "usb-nop-xceiv";
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   79  			reg = <0>;
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   80  			status = "disabled";
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   81  		};
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   82  
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   83  		usb1_phy: usb-phy@1 {
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   84  			compatible = "usb-nop-xceiv";
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   85  			reg = <1>;
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   86  			status = "disabled";
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   87  		};
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   88  	};
eadbe9fa2dc1da arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05   89  
eb08c33f9faebc arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2017-12-15   90  	soc0: soc@0 {
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   91  		#address-cells = <1>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   92  		#size-cells = <1>;
be76fd3197df60 arch/arm/boot/dts/keystone-k2g.dtsi             Tony Lindgren          2016-11-07   93  		#pinctrl-cells = <1>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   94  		compatible = "ti,keystone","simple-bus";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   95  		ranges = <0x0 0x0 0x0 0xc0000000>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   96  		dma-ranges = <0x80000000 0x8 0x00000000 0x80000000>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05   97  
644c5a582261ec arch/arm/boot/dts/keystone-k2g.dtsi             Krzysztof Kozlowski    2020-05-27   98  		msm_ram: sram@c000000 {
b6f922ab524fb4 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07   99  			compatible = "mmio-sram";
b6f922ab524fb4 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07  100  			reg = <0x0c000000 0x100000>;
b6f922ab524fb4 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07  101  			ranges = <0x0 0x0c000000 0x100000>;
b6f922ab524fb4 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07  102  			#address-cells = <1>;
b6f922ab524fb4 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07  103  			#size-cells = <1>;
b3511c9e525b32 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07  104  
644c5a582261ec arch/arm/boot/dts/keystone-k2g.dtsi             Krzysztof Kozlowski    2020-05-27  105  			bm-sram@f7000 {
b3511c9e525b32 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07  106  				reg = <0x000f7000 0x8000>;
b3511c9e525b32 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07  107  			};
b6f922ab524fb4 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07  108  		};
b6f922ab524fb4 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-01-07  109  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  110  		k2g_pinctrl: pinmux@2621000 {
fb25225919c43c arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-06-09  111  			compatible = "pinctrl-single";
fb25225919c43c arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-06-09  112  			reg = <0x02621000 0x410>;
fb25225919c43c arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-06-09  113  			pinctrl-single,register-width = <32>;
fb25225919c43c arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-06-09  114  			pinctrl-single,function-mask = <0x001b0007>;
fb25225919c43c arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-06-09  115  		};
fb25225919c43c arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-06-09  116  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  117  		devctrl: device-state-control@2620000 {
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  118  			compatible = "ti,keystone-devctrl", "syscon", "simple-mfd";
08fa198ded16cb arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2016-08-31  119  			reg = <0x02620000 0x1000>;
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  120  			#address-cells = <1>;
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  121  			#size-cells = <1>;
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  122  			ranges = <0x0 0x02620000 0x1000>;
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  123  
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  124  			kirq0: keystone_irq@2a0 {
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  125  				compatible = "ti,keystone-irq";
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  126  				reg = <0x2a0 0x10>;
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  127  				interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>;
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  128  				interrupt-controller;
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  129  				#interrupt-cells = <1>;
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  130  				ti,syscon-dev = <&devctrl 0x2a0>;
10c5bd2d8e0795 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  131  			};
4c4a3b8e2cdc77 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  132  
4c4a3b8e2cdc77 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  133  			dspgpio0: keystone_dsp_gpio@240 {
4c4a3b8e2cdc77 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  134  				compatible = "ti,keystone-dsp-gpio";
4c4a3b8e2cdc77 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  135  				reg = <0x240 0x4>;
4c4a3b8e2cdc77 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  136  				gpio-controller;
4c4a3b8e2cdc77 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  137  				#gpio-cells = <2>;
4c4a3b8e2cdc77 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  138  				gpio,syscon-dev = <&devctrl 0x240>;
4c4a3b8e2cdc77 arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2018-03-05  139  			};
08fa198ded16cb arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2016-08-31  140  		};
08fa198ded16cb arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2016-08-31  141  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  142  		uart0: serial@2530c00 {
1dd55813545476 arch/arm/boot/dts/keystone-k2g.dtsi             David Lechner          2017-01-06  143  			compatible = "ti,da830-uart", "ns16550a";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05  144  			current-speed = <115200>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05  145  			reg-shift = <2>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05  146  			reg-io-width = <4>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05  147  			reg = <0x02530c00 0x100>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05  148  			interrupts = <GIC_SPI 164 IRQ_TYPE_EDGE_RISING>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  149  			clocks = <&k2g_clks 0x2c 0>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  150  			power-domains = <&k2g_pds 0x2c>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  151  			status = "disabled";
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  152  		};
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  153  
07f3398d38da44 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2018-03-05  154  		uart1: serial@2531000 {
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  155  			compatible = "ti,da830-uart", "ns16550a";
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  156  			current-speed = <115200>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  157  			reg-shift = <2>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  158  			reg-io-width = <4>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  159  			reg = <0x02531000 0x100>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  160  			interrupts = <GIC_SPI 165 IRQ_TYPE_EDGE_RISING>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  161  			clocks = <&k2g_clks 0x2d 0>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  162  			power-domains = <&k2g_pds 0x2d>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  163  			status = "disabled";
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  164  		};
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  165  
07f3398d38da44 arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2018-03-05  166  		uart2: serial@2531400 {
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  167  			compatible = "ti,da830-uart", "ns16550a";
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  168  			current-speed = <115200>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  169  			reg-shift = <2>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  170  			reg-io-width = <4>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  171  			reg = <0x02531400 0x100>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  172  			interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  173  			clocks = <&k2g_clks 0x2e 0>;
a8c0961b909ec7 arch/arm/boot/dts/keystone-k2g.dtsi             Franklin S Cooper Jr   2017-12-06  174  			power-domains = <&k2g_pds 0x2e>;
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05  175  			status = "disabled";
734539eaf496b0 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2016-02-05  176  		};
0884b1b3382ffe arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2016-08-31  177  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  178  		dcan0: can@260b200 {
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  179  			compatible = "ti,am4372-d_can", "ti,am3352-d_can";
2d62aab57d2ace arch/arm/boot/dts/keystone-k2g.dtsi             Andrew Davis           2023-05-15  180  			reg = <0x0260b200 0x200>;
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  181  			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  182  			status = "disabled";
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  183  			power-domains = <&k2g_pds 0x0008>;
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  184  			clocks = <&k2g_clks 0x0008 1>;
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  185  		};
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  186  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  187  		dcan1: can@260b400 {
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  188  			compatible = "ti,am4372-d_can", "ti,am3352-d_can";
2d62aab57d2ace arch/arm/boot/dts/keystone-k2g.dtsi             Andrew Davis           2023-05-15  189  			reg = <0x0260b400 0x200>;
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  190  			interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  191  			status = "disabled";
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  192  			power-domains = <&k2g_pds 0x0009>;
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  193  			clocks = <&k2g_clks 0x0009 1>;
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  194  		};
2ff9612fb548e9 arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-10  195  
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  196  		i2c0: i2c@2530000 {
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  197  			compatible = "ti,keystone-i2c";
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  198  			reg = <0x02530000 0x400>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  199  			clocks = <&k2g_clks 0x003a 0>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  200  			power-domains = <&k2g_pds 0x003a>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  201  			interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  202  			#address-cells = <1>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  203  			#size-cells = <0>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  204  			status = "disabled";
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  205  		};
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  206  
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  207  		i2c1: i2c@2530400 {
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  208  			compatible = "ti,keystone-i2c";
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  209  			reg = <0x02530400 0x400>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  210  			clocks = <&k2g_clks 0x003b 0>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  211  			power-domains = <&k2g_pds 0x003b>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  212  			interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  213  			#address-cells = <1>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  214  			#size-cells = <0>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  215  			status = "disabled";
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  216  		};
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  217  
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  218  		i2c2: i2c@2530800 {
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  219  			compatible = "ti,keystone-i2c";
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  220  			reg = <0x02530800 0x400>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  221  			clocks = <&k2g_clks 0x003c 0>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  222  			power-domains = <&k2g_pds 0x003c>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  223  			interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  224  			#address-cells = <1>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  225  			#size-cells = <0>;
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  226  			status = "disabled";
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  227  		};
d0dfe5defdc1ed arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  228  
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  229  		dsp0: dsp@10800000 {
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  230  			compatible = "ti,k2g-dsp";
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  231  			reg = <0x10800000 0x00100000>,
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  232  			      <0x10e00000 0x00008000>,
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  233  			      <0x10f00000 0x00008000>;
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  234  			reg-names = "l2sram", "l1pram", "l1dram";
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  235  			power-domains = <&k2g_pds 0x0046>;
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  236  			ti,syscon-dev = <&devctrl 0x844>;
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  237  			resets = <&k2g_reset 0x0046 0x1>;
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  238  			interrupt-parent = <&kirq0>;
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  239  			interrupts = <0 8>;
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  240  			interrupt-names = "vring", "exception";
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  241  			kick-gpios = <&dspgpio0 27 0>;
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  242  			status = "disabled";
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  243  		};
a1b7cb92b488ab arch/arm/boot/dts/keystone-k2g.dtsi             Suman Anna             2017-08-12  244  
361a02c1e25f14 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2021-06-04  245  		msgmgr: mailbox@2a00000 {
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  246  			compatible = "ti,k2g-message-manager";
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  247  			#mbox-cells = <2>;
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  248  			reg-names = "queue_proxy_region",
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  249  				    "queue_state_debug_region";
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  250  			reg = <0x02a00000 0x400000>, <0x028c3400 0x400>;
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  251  			interrupt-names = "rx_005",
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  252  					  "rx_057";
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  253  			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  254  				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
11b897a2f7c6d6 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2016-08-31  255  		};
e39aacf6b2e39c arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2017-07-21  256  
f594874e36fd44 arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2021-06-04  257  		pmmc: system-controller@2921c00 {
e39aacf6b2e39c arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2017-07-21  258  			compatible = "ti,k2g-sci";
e39aacf6b2e39c arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2017-07-21  259  			mbox-names = "rx", "tx";
e39aacf6b2e39c arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2017-07-21  260  			mboxes = <&msgmgr 5 2>,
e39aacf6b2e39c arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2017-07-21  261  				<&msgmgr 0 0>;
e39aacf6b2e39c arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2017-07-21  262  			reg-names = "debug_messages";
e39aacf6b2e39c arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2017-07-21  263  			reg = <0x02921c00 0x400>;
2557a28938c022 arch/arm/boot/dts/keystone-k2g.dtsi             Dave Gerlach           2017-07-21  264  
2557a28938c022 arch/arm/boot/dts/keystone-k2g.dtsi             Dave Gerlach           2017-07-21  265  			k2g_pds: power-controller {
2557a28938c022 arch/arm/boot/dts/keystone-k2g.dtsi             Dave Gerlach           2017-07-21  266  				compatible = "ti,sci-pm-domain";
2557a28938c022 arch/arm/boot/dts/keystone-k2g.dtsi             Dave Gerlach           2017-07-21  267  				#power-domain-cells = <1>;
2557a28938c022 arch/arm/boot/dts/keystone-k2g.dtsi             Dave Gerlach           2017-07-21  268  			};
a0a220b6873b99 arch/arm/boot/dts/keystone-k2g.dtsi             Tero Kristo            2017-07-21  269  
39b73baa44e76c arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2021-06-04  270  			k2g_clks: clock-controller {
a0a220b6873b99 arch/arm/boot/dts/keystone-k2g.dtsi             Tero Kristo            2017-07-21  271  				compatible = "ti,k2g-sci-clk";
a0a220b6873b99 arch/arm/boot/dts/keystone-k2g.dtsi             Tero Kristo            2017-07-21  272  				#clock-cells = <2>;
a0a220b6873b99 arch/arm/boot/dts/keystone-k2g.dtsi             Tero Kristo            2017-07-21  273  			};
45b08b032a170f arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2017-07-21  274  
45b08b032a170f arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2017-07-21  275  			k2g_reset: reset-controller {
45b08b032a170f arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2017-07-21  276  				compatible = "ti,sci-reset";
45b08b032a170f arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2017-07-21  277  				#reset-cells = <2>;
45b08b032a170f arch/arm/boot/dts/keystone-k2g.dtsi             Andrew F. Davis        2017-07-21  278  			};
e39aacf6b2e39c arch/arm/boot/dts/keystone-k2g.dtsi             Nishanth Menon         2017-07-21  279  		};
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  280  
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  281  		gpio0: gpio@2603000 {
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  282  			compatible = "ti,k2g-gpio", "ti,keystone-gpio";
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  283  			reg = <0x02603000 0x100>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  284  			gpio-controller;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  285  			#gpio-cells = <2>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  286  
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  287  			interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  288  					<GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  289  					<GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  290  					<GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  291  					<GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  292  					<GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  293  					<GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  294  					<GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  295  					<GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  296  			interrupt-controller;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  297  			#interrupt-cells = <2>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  298  			ti,ngpio = <144>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  299  			ti,davinci-gpio-unbanked = <0>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  300  			clocks = <&k2g_clks 0x001b 0x0>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  301  			clock-names = "gpio";
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  302  		};
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  303  
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  304  		gpio1: gpio@260a000 {
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  305  			compatible = "ti,k2g-gpio", "ti,keystone-gpio";
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  306  			reg = <0x0260a000 0x100>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  307  			gpio-controller;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  308  			#gpio-cells = <2>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  309  			interrupts = <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  310  					<GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  311  					<GIC_SPI 444 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  312  					<GIC_SPI 445 IRQ_TYPE_EDGE_RISING>,
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  313  					<GIC_SPI 446 IRQ_TYPE_EDGE_RISING>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  314  			interrupt-controller;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  315  			#interrupt-cells = <2>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  316  			ti,ngpio = <68>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  317  			ti,davinci-gpio-unbanked = <0>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  318  			clocks = <&k2g_clks 0x001c 0x0>;
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  319  			clock-names = "gpio";
87b7c3acc59826 arch/arm/boot/dts/keystone-k2g.dtsi             Keerthy                2017-08-07  320  		};
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  321  
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  322  		dss: dss@02540000 {
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  323  			compatible = "ti,k2g-dss";
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  324  			reg = <0x02540000 0x400>,
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  325  				<0x02550000 0x1000>,
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  326  				<0x02557000 0x1000>,
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  327  				<0x0255a800 0x100>,
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  328  				<0x0255ac00 0x100>;
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  329  			reg-names = "cfg", "common", "vid1", "ovr1", "vp1";
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  330  			clocks = <&k2g_clks 0x2 0>,
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  331  					<&k2g_clks 0x2 1>;
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  332  			clock-names = "fck", "vp1";
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  333  			interrupts = <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>;
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  334  
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  335  			power-domains = <&k2g_pds 0x2>;
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  336  			status = "disabled";
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  337  			#address-cells = <1>;
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  338  			#size-cells = <1>;
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  339  			ranges;
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  340  
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  341  			max-memory-bandwidth = <230000000>;
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  342  		};
3a361eabbff081 arch/arm/boot/dts/keystone-k2g.dtsi             Jyri Sarha             2020-03-07  343  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  344  		edma0: edma@2700000 {
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  345  			compatible = "ti,k2g-edma3-tpcc", "ti,edma3-tpcc";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  346  			reg = <0x02700000 0x8000>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  347  			reg-names = "edma3_cc";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  348  			interrupts = <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>,
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  349  					<GIC_SPI 216 IRQ_TYPE_EDGE_RISING>,
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  350  					<GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  351  			interrupt-names = "edma3_ccint", "emda3_mperr",
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  352  					  "edma3_ccerrint";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  353  			dma-requests = <64>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  354  			#dma-cells = <2>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  355  
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  356  			ti,tptcs = <&edma0_tptc0 7>, <&edma0_tptc1 0>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  357  
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  358  			ti,edma-memcpy-channels = <32 33 34 35>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  359  
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  360  			power-domains = <&k2g_pds 0x3f>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  361  		};
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  362  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  363  		edma0_tptc0: tptc@2760000 {
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  364  			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  365  			reg = <0x02760000 0x400>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  366  			power-domains = <&k2g_pds 0x3f>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  367  		};
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  368  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  369  		edma0_tptc1: tptc@2768000 {
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  370  			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  371  			reg = <0x02768000 0x400>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  372  			power-domains = <&k2g_pds 0x3f>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  373  		};
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  374  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  375  		edma1: edma@2728000 {
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  376  			compatible = "ti,k2g-edma3-tpcc", "ti,edma3-tpcc";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  377  			reg = <0x02728000 0x8000>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  378  			reg-names = "edma3_cc";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  379  			interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  380  					<GIC_SPI 219 IRQ_TYPE_EDGE_RISING>,
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  381  					<GIC_SPI 220 IRQ_TYPE_EDGE_RISING>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  382  			interrupt-names = "edma3_ccint", "emda3_mperr",
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  383  					  "edma3_ccerrint";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  384  			dma-requests = <64>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  385  			#dma-cells = <2>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  386  
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  387  			ti,tptcs = <&edma1_tptc0 7>, <&edma1_tptc1 0>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  388  
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  389  			/*
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  390  			 * memcpy is disabled, can be enabled with:
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  391  			 * ti,edma-memcpy-channels = <12 13 14 15>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  392  			 * for example.
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  393  			 */
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  394  
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  395  			power-domains = <&k2g_pds 0x4f>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  396  		};
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  397  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  398  		edma1_tptc0: tptc@27b0000 {
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  399  			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  400  			reg = <0x027b0000 0x400>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  401  			power-domains = <&k2g_pds 0x4f>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  402  		};
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  403  
8dccafaa281aa1 arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2017-10-13  404  		edma1_tptc1: tptc@27b8000 {
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  405  			compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  406  			reg = <0x027b8000 0x400>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  407  			power-domains = <&k2g_pds 0x4f>;
f8d4416b825a4c arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-08-07  408  		};
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  409  
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  410  		mmc0: mmc@23000000 {
f7e8a182a41e79 arch/arm/boot/dts/keystone-k2g.dtsi             Kishon Vijay Abraham I 2018-06-29  411  			compatible = "ti,k2g-sdhci";
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  412  			reg = <0x23000000 0x400>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  413  			interrupts = <GIC_SPI 96 IRQ_TYPE_EDGE_RISING>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  414  			bus-width = <4>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  415  			no-1-8-v;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  416  			max-frequency = <96000000>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  417  			power-domains = <&k2g_pds 0xb>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  418  			clocks = <&k2g_clks 0xb 1>, <&k2g_clks 0xb 2>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  419  			clock-names = "fck", "mmchsdb_fck";
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  420  			status = "disabled";
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  421  		};
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  422  
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  423  		mmc1: mmc@23100000 {
f7e8a182a41e79 arch/arm/boot/dts/keystone-k2g.dtsi             Kishon Vijay Abraham I 2018-06-29  424  			compatible = "ti,k2g-sdhci";
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  425  			reg = <0x23100000 0x400>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  426  			interrupts = <GIC_SPI 97 IRQ_TYPE_EDGE_RISING>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  427  			bus-width = <8>;
f7e8a182a41e79 arch/arm/boot/dts/keystone-k2g.dtsi             Kishon Vijay Abraham I 2018-06-29  428  			no-1-8-v;
f7e8a182a41e79 arch/arm/boot/dts/keystone-k2g.dtsi             Kishon Vijay Abraham I 2018-06-29  429  			non-removable;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  430  			max-frequency = <96000000>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  431  			power-domains = <&k2g_pds 0xc>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  432  			clocks = <&k2g_clks 0xc 1>, <&k2g_clks 0xc 2>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  433  			clock-names = "fck", "mmchsdb_fck";
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  434  		};
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  435  
cc893871f092be arch/arm/boot/dts/keystone-k2g.dtsi             Rob Herring            2018-09-13  436  		qspi: spi@2940000 {
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  437  			compatible = "ti,k2g-qspi", "cdns,qspi-nor";
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  438  			#address-cells = <1>;
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  439  			#size-cells = <0>;
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  440  			reg = <0x02940000 0x1000>,
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  441  			      <0x24000000 0x4000000>;
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  442  			interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>;
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  443  			cdns,fifo-depth = <256>;
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  444  			cdns,fifo-width = <4>;
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  445  			cdns,trigger-address = <0x24000000>;
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  446  			clocks = <&k2g_clks 0x43 0x0>;
13fc30c7e1db89 arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-12-02  447  			power-domains = <&k2g_pds 0x43>;
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  448  			status = "disabled";
9529de63a4f51c arch/arm/boot/dts/keystone-k2g.dtsi             Lokesh Vutla           2017-08-07  449  		};
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  450  
b51c5cb56fa3a5 arch/arm/boot/dts/keystone-k2g.dtsi             Arnd Bergmann          2017-10-30  451  		mcasp0: mcasp@2340000 {
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  452  			compatible = "ti,am33xx-mcasp-audio";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  453  			reg = <0x02340000 0x2000>,
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  454  			      <0x21804000 0x1000>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  455  			reg-names = "mpu","dat";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  456  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  457  				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  458  			interrupt-names = "tx", "rx";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  459  			dmas = <&edma0 24 1>, <&edma0 25 1>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  460  			dma-names = "tx", "rx";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  461  			power-domains = <&k2g_pds 0x4>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  462  			clocks = <&k2g_clks 0x4 0>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  463  			clock-names = "fck";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  464  			status = "disabled";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  465  		};
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  466  
b51c5cb56fa3a5 arch/arm/boot/dts/keystone-k2g.dtsi             Arnd Bergmann          2017-10-30  467  		mcasp1: mcasp@2342000 {
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  468  			compatible = "ti,am33xx-mcasp-audio";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  469  			reg = <0x02342000 0x2000>,
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  470  			      <0x21804400 0x1000>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  471  			reg-names = "mpu","dat";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  472  			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  473  				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  474  			interrupt-names = "tx", "rx";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  475  			dmas = <&edma1 48 1>, <&edma1 49 1>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  476  			dma-names = "tx", "rx";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  477  			power-domains = <&k2g_pds 0x5>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  478  			clocks = <&k2g_clks 0x5 0>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  479  			clock-names = "fck";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  480  			status = "disabled";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  481  		};
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  482  
b51c5cb56fa3a5 arch/arm/boot/dts/keystone-k2g.dtsi             Arnd Bergmann          2017-10-30  483  		mcasp2: mcasp@2344000 {
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  484  			compatible = "ti,am33xx-mcasp-audio";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  485  			reg = <0x02344000 0x2000>,
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  486  			      <0x21804800 0x1000>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  487  			reg-names = "mpu","dat";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  488  			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  489  				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  490  			interrupt-names = "tx", "rx";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  491  			dmas = <&edma1 50 1>, <&edma1 51 1>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  492  			dma-names = "tx", "rx";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  493  			power-domains = <&k2g_pds 0x6>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  494  			clocks = <&k2g_clks 0x6 0>;
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  495  			clock-names = "fck";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  496  			status = "disabled";
55fe38f0c08f2b arch/arm/boot/dts/keystone-k2g.dtsi             Peter Ujfalusi         2017-10-09  497  		};
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  498  
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  499  		keystone_usb0: keystone-dwc3@2680000 {
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  500  			compatible = "ti,keystone-dwc3";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  501  			#address-cells = <1>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  502  			#size-cells = <1>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  503  			reg = <0x2680000 0x10000>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  504  			interrupts = <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  505  			ranges;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  506  			dma-coherent;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  507  			dma-ranges;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  508  			status = "disabled";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  509  			power-domains = <&k2g_pds 0x0016>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  510  
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  511  			usb0: usb@2690000 {
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  512  				compatible = "snps,dwc3";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  513  				reg = <0x2690000 0x10000>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  514  				interrupts = <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  515  				maximum-speed = "high-speed";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  516  				dr_mode = "otg";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  517  				usb-phy = <&usb0_phy>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  518  				status = "disabled";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  519  			};
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  520  		};
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  521  
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  522  		keystone_usb1: keystone-dwc3@2580000 {
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  523  			compatible = "ti,keystone-dwc3";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  524  			#address-cells = <1>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  525  			#size-cells = <1>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  526  			reg = <0x2580000 0x10000>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  527  			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  528  			ranges;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  529  			dma-coherent;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  530  			dma-ranges;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  531  			status = "disabled";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  532  			power-domains = <&k2g_pds 0x0017>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  533  
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  534  			usb1: usb@2590000 {
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  535  				compatible = "snps,dwc3";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  536  				reg = <0x2590000 0x10000>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  537  				interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  538  				maximum-speed = "high-speed";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  539  				dr_mode = "otg";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  540  				usb-phy = <&usb1_phy>;
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  541  				status = "disabled";
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  542  			};
252402aa37ce03 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  543  		};
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  544  
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  545  		ecap0: pwm@21d1800 {
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  546  			compatible = "ti,k2g-ecap", "ti,am3352-ecap";
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  547  			#pwm-cells = <3>;
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  548  			reg = <0x021d1800 0x60>;
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  549  			power-domains = <&k2g_pds 0x38>;
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  550  			clocks = <&k2g_clks 0x38 0>;
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  551  			clock-names = "fck";
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  552  			status = "disabled";
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  553  		};
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  554  
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  555  		ecap1: pwm@21d1c00 {
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  556  			compatible = "ti,k2g-ecap", "ti,am3352-ecap";
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  557  			#pwm-cells = <3>;
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  558  			reg = <0x021d1c00 0x60>;
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  559  			power-domains = <&k2g_pds 0x39>;
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  560  			clocks = <&k2g_clks 0x39 0x0>;
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  561  			clock-names = "fck";
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  562  			status = "disabled";
a9ccafd0a33aaa arch/arm/boot/dts/keystone-k2g.dtsi             Vignesh R              2017-10-09  563  		};
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  564  
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  565  		spi0: spi@21805400 {
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  566  			compatible = "ti,keystone-spi";
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  567  			reg = <0x21805400 0x200>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  568  			num-cs = <4>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  569  			ti,davinci-spi-intr-line = <0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  570  			interrupts = <GIC_SPI 64 IRQ_TYPE_EDGE_RISING>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  571  			#address-cells = <1>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  572  			#size-cells = <0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  573  			power-domains = <&k2g_pds 0x0010>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  574  			clocks = <&k2g_clks 0x0010 0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  575  		};
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  576  
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  577  		spi1: spi@21805800 {
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  578  			compatible = "ti,keystone-spi";
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  579  			reg = <0x21805800 0x200>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  580  			num-cs = <4>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  581  			ti,davinci-spi-intr-line = <0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  582  			interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  583  			#address-cells = <1>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  584  			#size-cells = <0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  585  			power-domains = <&k2g_pds 0x0011>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  586  			clocks = <&k2g_clks 0x0011 0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  587  		};
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  588  
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  589  		spi2: spi@21805c00 {
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  590  			compatible = "ti,keystone-spi";
2d62aab57d2ace arch/arm/boot/dts/keystone-k2g.dtsi             Andrew Davis           2023-05-15  591  			reg = <0x21805c00 0x200>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  592  			num-cs = <4>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  593  			ti,davinci-spi-intr-line = <0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  594  			interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  595  			#address-cells = <1>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  596  			#size-cells = <0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  597  			power-domains = <&k2g_pds 0x0012>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  598  			clocks = <&k2g_clks 0x0012 0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  599  		};
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  600  
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  601  		spi3: spi@21806000 {
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  602  			compatible = "ti,keystone-spi";
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  603  			reg = <0x21806000 0x200>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  604  			num-cs = <4>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  605  			ti,davinci-spi-intr-line = <0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  606  			interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  607  			#address-cells = <1>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  608  			#size-cells = <0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  609  			power-domains = <&k2g_pds 0x0013>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  610  			clocks = <&k2g_clks 0x0013 0>;
729ce96967f6f4 arch/arm/boot/dts/keystone-k2g.dtsi             Vitaly Andrianov       2017-10-09  611  		};
4cd6847c28c5bc arch/arm/boot/dts/keystone-k2g.dtsi             Tero Kristo            2018-03-12  612  
cbbe274187cff1 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi Kousik Sanagavarapu    2024-07-21 @613  		wdt: watchdog@02250000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
