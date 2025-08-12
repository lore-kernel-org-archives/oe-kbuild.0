Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1372E2DD7
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 03:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967939; cv=none; b=Jx7Lzxlu3bMcyz2yi655gMFtqlsjHk2a3oJM9VwmzKmI20WVqgSgkmB5GMPMsbk3KYzT0ykiHEPHQfuE5MlCsoCH16rD5UMuoEA9qrmKfgKdRD2JtUDZCFpVp4w7fXC+jAgzxJfNGzCNUzqE3qU1QffCkOalAkjRcg82wamfl58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967939; c=relaxed/simple;
	bh=m2Q80uQweAsgFZ5JQe1HMn3txA7d6tU/bspshgDwnRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHvxE9wjQJxNxb1oIXy9g0c4AHVBNIN4Kdj3zy/F/OW2zhncF7ZfCLhcKJjhzWO58HOEb5m1SR/VOiF4X0REy0E+ayeDTBlFG8JvPoAl2baNwJ33tKYihylXKlXWp3+YdnRyFZ6SAazEwLRLSOcY6L/lx5d/23o00DZC4IbF8/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPLv1X9a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPLv1X9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754967935; x=1786503935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m2Q80uQweAsgFZ5JQe1HMn3txA7d6tU/bspshgDwnRU=;
  b=KPLv1X9ajx35iOEZlILXbz+J6P+gc0upZ1qBBozGpHAA8LPC4mBACQGL
   Ba/ZwA5tVhHNfyO3pVpiSGzUslKak/bDI0DrmQFr/hoomF0qfjq3av27I
   SP/1xk+DRrIRiVtMjDkJziRPMRCZ/qetmmuYv5qaEr74yzU2MH8sqazCH
   khIsEbWl99pbrqkV1WCq0tRcNRT0DgvB4lyAgDykzm7RFCV42Jblc35pC
   l7bFtyYPf9dqhIRTbVfNxAz7IDbImZV0rquHWGG4WGH6RMBpuMsV+cdMN
   JEu521AWxpCfIK8TzhUs2KqzPBHmPP6xNURKs2dYjebBmRA4hiGf24adw
   w==;
X-CSE-ConnectionGUID: JpuOG0gnSnW36Txt9kkLBg==
X-CSE-MsgGUID: ky/xOpJPROWIEKAb8rcIzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68606920"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68606920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 20:05:34 -0700
X-CSE-ConnectionGUID: zzTgSRSuR0y1xR/E42sAhg==
X-CSE-MsgGUID: iqOMXvJgQfq0qY4/Q74OpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165271589"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Aug 2025 20:05:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulfKH-0006NE-0x;
	Tue, 12 Aug 2025 03:05:27 +0000
Date: Tue, 12 Aug 2025 11:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/12] arch/powerpc/boot/dts/a4m072.dts:134.3-139.39:
 Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property
 '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0
 as fallback
Message-ID: <202508121111.7455m0aa-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   c2a1a5ede4717e6f12d49fe5177a66d40cbf4847
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [2/12] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 10 hours ago
:::::: commit date: 14 hours ago
config: powerpc-randconfig-052-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121111.7455m0aa-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121111.7455m0aa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508121111.7455m0aa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/a4m072.dts:112.13-118.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/a4m072.dts:119.13-123.5: Warning (simple_bus_reg): /localbus/sram0@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/a4m072.dts:134.3-139.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/a4m072.dts:134.3-139.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/a4m072.dts:134.3-139.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/a4m072.dts:134.3-139.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
   arch/powerpc/boot/dts/a4m072.dtb: /: failed to match any schema with compatible: ['anonymous,a4m072']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
--
   arch/powerpc/boot/dts/mpc5121.dtsi:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/ac14xx.dts:102.13-107.6: Warning (unit_address_vs_reg): /localbus@80000020/asi@2,0/master@1: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/ac14xx.dts:109.13-114.6: Warning (unit_address_vs_reg): /localbus@80000020/asi@2,0/master@2: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/ac14xx.dts:353.19-373.5: Warning (unit_address_vs_reg): /soc@80000000/matrix_keypad@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/mpc5121.dtsi:397.13-406.5: Warning (spi_bus_bridge): /soc@80000000/psc@11400: node name for SPI buses should be 'spi'
   arch/powerpc/boot/dts/mpc5121.dtsi:409.13-418.5: Warning (spi_bus_bridge): /soc@80000000/psc@11500: node name for SPI buses should be 'spi'
   arch/powerpc/boot/dts/ac14xx.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
>> arch/powerpc/boot/dts/ac14xx.dts:89.11-115.5: Warning (avoid_unnecessary_addr_size): /localbus@80000020/asi@2,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/powerpc/boot/dts/mpc5121.dtsi:79.9-88.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/mpc5121.dtsi:273.13-280.5: Warning (unique_unit_address_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also used in node /soc@80000000/ethernet@2800)
   arch/powerpc/boot/dts/mpc5121.dtsi:225.12-231.5: Warning (unique_unit_address_if_enabled): /soc@80000000/axe@2000: duplicate unit-address (also used in node /soc@80000000/axe-base@2000)
   arch/powerpc/boot/dts/mpc5121.dtsi:508.20-525.4: Warning (interrupt_provider): /pci@80008500: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/ac14xx.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/ac14xx.dtb: /: failed to match any schema with compatible: ['ifm,ac14xx', 'fsl,mpc5121']
   arch/powerpc/boot/dts/ac14xx.dtb: /: failed to match any schema with compatible: ['ifm,ac14xx', 'fsl,mpc5121']
   arch/powerpc/boot/dts/ac14xx.dtb: / (ifm,ac14xx): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
--
   arch/powerpc/boot/dts/bluestone.dts:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/bluestone.dts:151.13-326.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/bluestone.dts:158.14-235.6: Warning (unit_address_vs_reg): /plb/opb/ebc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/bluestone.dts:272.13-277.7: Warning (i2c_bus_reg): /plb/opb/i2c@ef600700/sttm@4C: I2C bus unit address format error, expected "4c"
>> arch/powerpc/boot/dts/bluestone.dts:189.14-234.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@1,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/bluestone.dtb: /: failed to match any schema with compatible: ['apm,bluestone']
   arch/powerpc/boot/dts/bluestone.dtb: / (apm,bluestone): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/bluestone.dtb: cpus: cpu@0:timebase-frequency: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/bluestone.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic']
   arch/powerpc/boot/dts/bluestone.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic']
   arch/powerpc/boot/dts/bluestone.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic']
   arch/powerpc/boot/dts/bluestone.dtb: /interrupt-controller3: failed to match any schema with compatible: ['ibm,uic']
   arch/powerpc/boot/dts/bluestone.dtb: /ocm@400040000: failed to match any schema with compatible: ['ibm,ocm']
--
   arch/powerpc/boot/dts/canyonlands.dts:47.9-50.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/canyonlands.dts:210.13-429.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/canyonlands.dts:268.14-289.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/canyonlands.dtb: /: failed to match any schema with compatible: ['amcc,canyonlands']
   arch/powerpc/boot/dts/canyonlands.dtb: / (amcc,canyonlands): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: cpus: cpu@0:timebase-frequency: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-460ex', 'ibm,uic']
   arch/powerpc/boot/dts/canyonlands.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-460ex', 'ibm,uic']
   arch/powerpc/boot/dts/canyonlands.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-460ex', 'ibm,uic']
   arch/powerpc/boot/dts/canyonlands.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-460ex', 'ibm,uic']
   arch/powerpc/boot/dts/canyonlands.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-460ex', 'ibm,uic']
--
   arch/powerpc/boot/dts/charon.dts:180.11-211.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/charon.dts:188.13-195.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/charon.dts:197.15-204.5: Warning (simple_bus_reg): /localbus/display@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/charon.dts:206.13-210.5: Warning (simple_bus_reg): /localbus/mram0@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/charon.dts:125.17-131.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/charon.dts:221.3-224.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/charon.dts:221.3-224.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/charon.dts:221.3-224.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/charon.dts:221.3-224.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
   arch/powerpc/boot/dts/charon.dtb: /: failed to match any schema with compatible: ['anon,charon']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200-immr']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200-pic']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/charon.dtb: usb@1000 (fsl,mpc5200-ohci): 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/digsy_mtc.dts:103.13-127.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/digsy_mtc.dts:129.11-134.5: Warning (simple_bus_reg): /localbus/can@4,0: simple-bus unit address format error, expected "400000000"
   arch/powerpc/boot/dts/digsy_mtc.dts:136.13-141.5: Warning (simple_bus_reg): /localbus/can@4,100: simple-bus unit address format error, expected "400000100"
   arch/powerpc/boot/dts/digsy_mtc.dts:143.16-147.5: Warning (simple_bus_reg): /localbus/serial@4,200: simple-bus unit address format error, expected "400000200"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/digsy_mtc.dts:86.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/digsy_mtc.dts:86.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/digsy_mtc.dts:86.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/digsy_mtc.dts:86.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
   arch/powerpc/boot/dts/digsy_mtc.dtb: /: failed to match any schema with compatible: ['intercontrol,digsy-mtc']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
--
   arch/powerpc/boot/dts/eiger.dts:48.9-51.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/eiger.dts:144.13-420.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/eiger.dts:161.19-195.7: Warning (unit_address_vs_reg): /plb/opb/ebc/nor_flash@0,0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/eiger.dts:197.14-233.7: Warning (unit_address_vs_reg): /plb/opb/ebc/ndfc@1,0: node has a unit name, but no reg or ranges property
>> arch/powerpc/boot/dts/eiger.dts:151.14-234.6: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/powerpc/boot/dts/eiger.dts:197.14-233.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@1,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/eiger.dtb: /: failed to match any schema with compatible: ['amcc,eiger']
   arch/powerpc/boot/dts/eiger.dtb: / (amcc,eiger): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/eiger.dtb: cpus: cpu@0:timebase-frequency: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/eiger.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-460sx', 'ibm,uic']
   arch/powerpc/boot/dts/eiger.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-460sx', 'ibm,uic']
   arch/powerpc/boot/dts/eiger.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-460sx', 'ibm,uic']
   arch/powerpc/boot/dts/eiger.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-460sx', 'ibm,uic']
   arch/powerpc/boot/dts/eiger.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-460sx', 'ibm,uic']
--
   arch/powerpc/boot/dts/glacier.dts:49.9-52.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/glacier.dts:161.13-457.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/glacier.dts:214.14-235.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/glacier.dtb: /: failed to match any schema with compatible: ['amcc,glacier']
   arch/powerpc/boot/dts/glacier.dtb: / (amcc,glacier): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/glacier.dtb: cpus: cpu@0:timebase-frequency: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/glacier.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-460gt', 'ibm,uic']
   arch/powerpc/boot/dts/glacier.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-460gt', 'ibm,uic']
   arch/powerpc/boot/dts/glacier.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-460gt', 'ibm,uic']
   arch/powerpc/boot/dts/glacier.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-460gt', 'ibm,uic']
   arch/powerpc/boot/dts/glacier.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-460gt', 'ibm,uic']
--
   arch/powerpc/boot/dts/lite5200.dts:291.11-303.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/lite5200.dts:298.13-302.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/lite5200.dts:218.17-224.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/lite5200.dts:279.3-282.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200.dts:279.3-282.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200.dts:279.3-282.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200.dts:279.3-282.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
   arch/powerpc/boot/dts/lite5200.dtb: /: failed to match any schema with compatible: ['fsl,lite5200']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200-immr']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200-pic']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@620: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@630: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@640: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@650: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/lite5200b.dts:127.13-154.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/lite5200b.dts:107.3-115.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200b.dts:107.3-115.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200b.dts:107.3-115.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200b.dts:107.3-115.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200b.dts:107.3-115.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200b.dts:107.3-115.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200b.dts:107.3-115.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/lite5200b.dts:107.3-115.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
   arch/powerpc/boot/dts/lite5200b.dtb: /: failed to match any schema with compatible: ['fsl,lite5200b']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/media5200.dts:110.13-115.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/media5200.dts:117.13-122.5: Warning (simple_bus_reg): /localbus/flash@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/media5200.dts:124.28-133.5: Warning (simple_bus_reg): /localbus/fpga@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/media5200.dts:135.12-140.5: Warning (simple_bus_reg): /localbus/uart@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
>> arch/powerpc/boot/dts/media5200.dts:84.3-98.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /localbus/fpga@2,0, using 0 as fallback
   arch/powerpc/boot/dts/media5200.dtb: /: failed to match any schema with compatible: ['fsl,media5200']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
--
   arch/powerpc/boot/dts/mpc5121.dtsi:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/mpc5121.dtsi:79.9-88.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/mpc5121.dtsi:273.13-280.5: Warning (unique_unit_address_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also used in node /soc@80000000/ethernet@2800)
>> arch/powerpc/boot/dts/mpc5121ads.dts:158.3-172.7: Warning (interrupt_map): /pci@80008500:interrupt-map: Missing property '#address-cells' in node /localbus@80000020/pic@2,a, using 0 as fallback
>> arch/powerpc/boot/dts/mpc5121ads.dts:158.3-172.7: Warning (interrupt_map): /pci@80008500:interrupt-map: Missing property '#address-cells' in node /localbus@80000020/pic@2,a, using 0 as fallback
>> arch/powerpc/boot/dts/mpc5121ads.dts:158.3-172.7: Warning (interrupt_map): /pci@80008500:interrupt-map: Missing property '#address-cells' in node /localbus@80000020/pic@2,a, using 0 as fallback
>> arch/powerpc/boot/dts/mpc5121ads.dts:158.3-172.7: Warning (interrupt_map): /pci@80008500:interrupt-map: Missing property '#address-cells' in node /localbus@80000020/pic@2,a, using 0 as fallback
>> arch/powerpc/boot/dts/mpc5121ads.dts:158.3-172.7: Warning (interrupt_map): /pci@80008500:interrupt-map: Missing property '#address-cells' in node /localbus@80000020/pic@2,a, using 0 as fallback
>> arch/powerpc/boot/dts/mpc5121ads.dts:158.3-172.7: Warning (interrupt_map): /pci@80008500:interrupt-map: Missing property '#address-cells' in node /localbus@80000020/pic@2,a, using 0 as fallback
>> arch/powerpc/boot/dts/mpc5121ads.dts:158.3-172.7: Warning (interrupt_map): /pci@80008500:interrupt-map: Missing property '#address-cells' in node /localbus@80000020/pic@2,a, using 0 as fallback
>> arch/powerpc/boot/dts/mpc5121ads.dts:158.3-172.7: Warning (interrupt_map): /pci@80008500:interrupt-map: Missing property '#address-cells' in node /localbus@80000020/pic@2,a, using 0 as fallback
   arch/powerpc/boot/dts/mpc5121ads.dtb: /: failed to match any schema with compatible: ['fsl,mpc5121ads', 'fsl,mpc5121']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /: failed to match any schema with compatible: ['fsl,mpc5121ads', 'fsl,mpc5121']
   arch/powerpc/boot/dts/mpc5121ads.dtb: / (fsl,mpc5121ads): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc5121ads.dtb: /mbx@20000000: failed to match any schema with compatible: ['fsl,mpc5121-mbx']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /sram@30000000: failed to match any schema with compatible: ['fsl,mpc5121-sram']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /nfc@40000000: failed to match any schema with compatible: ['fsl,mpc5121-nfc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020: failed to match any schema with compatible: ['fsl,mpc5121-localbus']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020/board-control@2,0: failed to match any schema with compatible: ['fsl,mpc5121ads-cpld']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020/pic@2,a: failed to match any schema with compatible: ['fsl,mpc5121ads-cpld-pic']
--
   arch/powerpc/boot/dts/mpc5125twr.dts:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/mpc5125twr.dts:55.9-64.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/mpc5125twr.dts:201.13-209.5: Warning (unique_unit_address_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also used in node /soc@80000000/ethernet@2800)
   arch/powerpc/boot/dts/mpc5125twr.dtb: /: failed to match any schema with compatible: ['fsl,mpc5125ads', 'fsl,mpc5125']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /: failed to match any schema with compatible: ['fsl,mpc5125ads', 'fsl,mpc5125']
   arch/powerpc/boot/dts/mpc5125twr.dtb: / (fsl,mpc5125ads): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc5125twr.dtb: /sram@30000000: failed to match any schema with compatible: ['fsl,mpc5121-sram']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000: failed to match any schema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/rtc@a00: failed to match any schema with compatible: ['fsl,mpc5121-rtc']
--
   arch/powerpc/boot/dts/mucmc52.dts:172.43-177.5: Warning (simple_bus_reg): /localbus/gpio-controller-200@3,600200: simple-bus unit address format error, expected "300600200"
   arch/powerpc/boot/dts/mucmc52.dts:178.43-183.5: Warning (simple_bus_reg): /localbus/gpio-controller-201@3,600201: simple-bus unit address format error, expected "300600201"
   arch/powerpc/boot/dts/mucmc52.dts:184.43-189.5: Warning (simple_bus_reg): /localbus/gpio-controller-202@3,600202: simple-bus unit address format error, expected "300600202"
   arch/powerpc/boot/dts/mucmc52.dts:190.43-195.5: Warning (simple_bus_reg): /localbus/gpio-controller-203@3,600203: simple-bus unit address format error, expected "300600203"
   arch/powerpc/boot/dts/mucmc52.dts:196.43-201.5: Warning (simple_bus_reg): /localbus/gpio-controller-204@3,600204: simple-bus unit address format error, expected "300600204"
   arch/powerpc/boot/dts/mucmc52.dts:202.43-207.5: Warning (simple_bus_reg): /localbus/gpio-controller-206@3,600206: simple-bus unit address format error, expected "300600206"
   arch/powerpc/boot/dts/mucmc52.dts:208.43-213.5: Warning (simple_bus_reg): /localbus/gpio-controller-207@3,600207: simple-bus unit address format error, expected "300600207"
   arch/powerpc/boot/dts/mucmc52.dts:214.43-219.5: Warning (simple_bus_reg): /localbus/gpio-controller-20f@3,60020f: simple-bus unit address format error, expected "30060020f"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/mucmc52.dts:102.3-108.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/mucmc52.dts:102.3-108.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/mucmc52.dts:102.3-108.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/mucmc52.dts:102.3-108.7: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
   arch/powerpc/boot/dts/mucmc52.dtb: /: failed to match any schema with compatible: ['manroland,mucmc52']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/pcm030.dts:84.3-92.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm030.dts:84.3-92.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm030.dts:84.3-92.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm030.dts:84.3-92.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm030.dts:84.3-92.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm030.dts:84.3-92.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm030.dts:84.3-92.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm030.dts:84.3-92.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
   arch/powerpc/boot/dts/pcm030.dtb: /: failed to match any schema with compatible: ['phytec,pcm030']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/pcm032.dts:105.13-140.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/pcm032.dts:142.12-146.5: Warning (simple_bus_reg): /localbus/sram@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/pcm032.dts:81.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm032.dts:81.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm032.dts:81.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm032.dts:81.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm032.dts:81.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm032.dts:81.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm032.dts:81.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/pcm032.dts:81.3-89.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
   arch/powerpc/boot/dts/pcm032.dtb: /: failed to match any schema with compatible: ['phytec,pcm032']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,mpc5200-pic']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@610: failed to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
--
   arch/powerpc/boot/dts/mpc5121.dtsi:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc5121.dtsi:457.13-466.5: Warning (spi_bus_bridge): /soc@80000000/psc@11900: node name for SPI buses should be 'spi'
   arch/powerpc/boot/dts/pdm360ng.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
>> arch/powerpc/boot/dts/mpc5121.dtsi:79.9-88.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/mpc5121.dtsi:273.13-280.5: Warning (unique_unit_address_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also used in node /soc@80000000/ethernet@2800)
   arch/powerpc/boot/dts/mpc5121.dtsi:508.20-525.4: Warning (interrupt_provider): /pci@80008500: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/pdm360ng.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/pdm360ng.dtb: /: failed to match any schema with compatible: ['ifm,pdm360ng', 'fsl,mpc5121']
   arch/powerpc/boot/dts/pdm360ng.dtb: /: failed to match any schema with compatible: ['ifm,pdm360ng', 'fsl,mpc5121']
   arch/powerpc/boot/dts/pdm360ng.dtb: / (ifm,pdm360ng): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/pdm360ng.dtb: /mbx@20000000: failed to match any schema with compatible: ['fsl,mpc5121-mbx']
   arch/powerpc/boot/dts/pdm360ng.dtb: /sram@30000000: failed to match any schema with compatible: ['fsl,mpc5121-sram']
--
   arch/powerpc/boot/dts/sequoia.dts:52.9-55.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/sequoia.dts:163.13-373.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/sequoia.dts:214.14-235.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/sequoia.dtb: /: failed to match any schema with compatible: ['amcc,sequoia']
   arch/powerpc/boot/dts/sequoia.dtb: / (amcc,sequoia): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: cpus: cpu@0:timebase-frequency: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-440epx', 'ibm,uic']
   arch/powerpc/boot/dts/sequoia.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-440epx', 'ibm,uic']
   arch/powerpc/boot/dts/sequoia.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440epx', 'ibm,uic']
   arch/powerpc/boot/dts/sequoia.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440epx', 'ibm,uic']
   arch/powerpc/boot/dts/sequoia.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-440epx', 'ibm,uic']
--
   arch/powerpc/boot/dts/tqm5200.dts:172.11-186.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/tqm5200.dts:178.13-185.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/tqm5200.dts:127.17-133.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>> arch/powerpc/boot/dts/tqm5200.dts:196.3-199.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/tqm5200.dts:196.3-199.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/tqm5200.dts:196.3-199.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
>> arch/powerpc/boot/dts/tqm5200.dts:196.3-199.39: Warning (interrupt_map): /pci@f0000d00:interrupt-map: Missing property '#address-cells' in node /soc5200@f0000000/interrupt-controller@500, using 0 as fallback
   arch/powerpc/boot/dts/tqm5200.dtb: /: failed to match any schema with compatible: ['tqc,tqm5200']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200-immr']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200-pic']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/tqm5200.dtb: usb@1000 (fsl,mpc5200-ohci): 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:423.11-431.6: Warning (unit_address_vs_reg): /localbus@a0005000/upm@3,0/nand@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:351.13-384.5: Warning (simple_bus_reg): /localbus@a0005000/flash@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:387.11-397.5: Warning (simple_bus_reg): /localbus@a0005000/can@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:399.13-408.5: Warning (simple_bus_reg): /localbus@a0005000/can@2,100: simple-bus unit address format error, expected "200000100"
   arch/powerpc/boot/dts/tqm8548-bigflash.dts:411.11-432.5: Warning (simple_bus_reg): /localbus@a0005000/upm@3,0: simple-bus unit address format error, expected "300000000"
>> arch/powerpc/boot/dts/tqm8548-bigflash.dts:411.11-432.5: Warning (avoid_unnecessary_addr_size): /localbus@a0005000/upm@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /: failed to match any schema with compatible: ['tqc,tqm8548']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: / (tqc,tqm8548): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /soc@a0000000: failed to match any schema with compatible: ['fsl,mpc8548-immr', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /soc@a0000000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /soc@a0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8548-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /soc@a0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8548-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: /soc@a0000000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8548-l2-cache-controller']
   arch/powerpc/boot/dts/tqm8548-bigflash.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/tqm8548.dts:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/tqm8548.dts:423.11-431.6: Warning (unit_address_vs_reg): /localbus@e0005000/upm@3,0/nand@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/tqm8548.dts:351.13-384.5: Warning (simple_bus_reg): /localbus@e0005000/flash@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/tqm8548.dts:387.11-397.5: Warning (simple_bus_reg): /localbus@e0005000/can@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/tqm8548.dts:399.13-408.5: Warning (simple_bus_reg): /localbus@e0005000/can@2,100: simple-bus unit address format error, expected "200000100"
   arch/powerpc/boot/dts/tqm8548.dts:411.11-432.5: Warning (simple_bus_reg): /localbus@e0005000/upm@3,0: simple-bus unit address format error, expected "300000000"
>> arch/powerpc/boot/dts/tqm8548.dts:411.11-432.5: Warning (avoid_unnecessary_addr_size): /localbus@e0005000/upm@3,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/tqm8548.dtb: /: failed to match any schema with compatible: ['tqc,tqm8548']
   arch/powerpc/boot/dts/tqm8548.dtb: / (tqc,tqm8548): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/tqm8548.dtb: /soc@e0000000: failed to match any schema with compatible: ['fsl,mpc8548-immr', 'simple-bus']
   arch/powerpc/boot/dts/tqm8548.dtb: /soc@e0000000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/tqm8548.dtb: /soc@e0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8548-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/tqm8548.dtb: /soc@e0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8548-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/tqm8548.dtb: /soc@e0000000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8548-l2-cache-controller']
   arch/powerpc/boot/dts/tqm8548.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/warp.dts:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/warp.dts:116.13-301.5: Warning (unit_address_vs_reg): /plb/opb: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/warp.dts:177.14-210.7: Warning (avoid_unnecessary_addr_size): /plb/opb/ebc/ndfc@1,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/warp.dtb: /: failed to match any schema with compatible: ['pika,warp']
   arch/powerpc/boot/dts/warp.dtb: / (pika,warp): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/warp.dtb: cpus: cpu@0:timebase-frequency: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/warp.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-440ep', 'ibm,uic']
   arch/powerpc/boot/dts/warp.dtb: /interrupt-controller0: failed to match any schema with compatible: ['ibm,uic-440ep', 'ibm,uic']
   arch/powerpc/boot/dts/warp.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440ep', 'ibm,uic']
   arch/powerpc/boot/dts/warp.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-440ep', 'ibm,uic']
   arch/powerpc/boot/dts/warp.dtb: /sdr: failed to match any schema with compatible: ['ibm,sdr-440ep']
--
   arch/powerpc/boot/dts/xpedite5330.dts:32.13-39.5: Warning (unit_address_vs_reg): /pmcslots/pmcslot@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/xpedite5330.dts:46.13-52.5: Warning (unit_address_vs_reg): /xmcslots/xmcslot@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/xpedite5330.dts:94.9-97.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/xpedite5330.dts:112.16-139.5: Warning (simple_bus_reg): /localbus@ef005000/nor-boot@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/xpedite5330.dts:141.21-169.5: Warning (simple_bus_reg): /localbus@ef005000/nor-alternate@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/xpedite5330.dts:171.12-188.5: Warning (simple_bus_reg): /localbus@ef005000/nand@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/xpedite5330.dts:547.13-570.5: Warning (simple_bus_reg): /soc8572@ef000000/gpio-leds: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/xpedite5330.dts:28.11-40.4: Warning (avoid_unnecessary_addr_size): /pmcslots: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/powerpc/boot/dts/xpedite5330.dts:42.11-53.4: Warning (avoid_unnecessary_addr_size): /xmcslots: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/xpedite5330.dtb: /: failed to match any schema with compatible: ['xes,xpedite5330', 'xes,MPC8572']
   arch/powerpc/boot/dts/xpedite5330.dtb: /: failed to match any schema with compatible: ['xes,xpedite5330', 'xes,MPC8572']
   arch/powerpc/boot/dts/xpedite5330.dtb: / (xes,xpedite5330): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/xpedite5330.dtb: localbus@ef005000 (fsl,mpc8572-elbc): nor-boot@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/xpedite5330.dtb: localbus@ef005000 (fsl,mpc8572-elbc): nor-alternate@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/xpedite5330.dtb: localbus@ef005000 (fsl,mpc8572-elbc): nand@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /: failed to match any schema with compatible: ['keymile,kmcent2']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: / (keymile,kmcent2): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: / (keymile,kmcent2): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: aliases: 'front_phy' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: localbus@ffe124000 (fsl,ifc): 'chassis-mgmt@6,0', 'nor@0,0' do not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /: failed to match any schema with compatible: ['fsl,T1040D4RDB']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: / (fsl,T1040D4RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: / (fsl,T1040D4RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	Unevaluated properties are not allowed ('compatible' was unexpected)
   	arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/t104xqds.dtsi:117.18-236.6: Warning (unit_address_vs_reg): /localbus@ffe124000/board-control@3,0/mdio-mux-emi1: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /: failed to match any schema with compatible: ['fsl,T1042D4RDB']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: / (fsl,T1042D4RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: / (fsl,T1042D4RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: 'oneOf' conditional failed, one must be fixed:
   	Unevaluated properties are not allowed ('compatible' was unexpected)
   	arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/t104xqds.dtsi:117.18-236.6: Warning (unit_address_vs_reg): /localbus@ffe124000/board-control@3,0/mdio-mux-emi1: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /: failed to match any schema with compatible: ['fsl,T1042RDB']
--
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-npc: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (unit_address_vs_reg): /dcsr@f00000000/dcsr-corenet: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:175.11-178.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-npc: simple-bus unit address format error, expected "1000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:183.15-186.4: Warning (simple_bus_reg): /dcsr@f00000000/dcsr-corenet: simple-bus unit address format error, expected "8000"
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:368.17-371.4: Warning (simple_bus_reg): /soc@ffe000000/soc-sram-error: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:489.16-536.4: Warning (simple_bus_reg): /soc@ffe000000/thermal-zones: missing or empty reg/ranges property
>> arch/powerpc/boot/dts/fsl/t1040si-post.dtsi:633.41-711.4: Warning (avoid_unnecessary_addr_size): /soc@ffe000000/ethernet-switch@800000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t104xsi-pre.dtsi:44.10-68.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /: failed to match any schema with compatible: ['fsl,T1042RDB_PI']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: / (fsl,T1042RDB_PI): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: / (fsl,T1042RDB_PI): memory: False schema does not allow {'device_type': ['memory']}

vim +134 arch/powerpc/boot/dts/a4m072.dts

fa59f178552f92 Grant Likely   2013-02-08   18  
7eb64c0f25574a Heiko Schocher 2012-03-18   19  / {
7eb64c0f25574a Heiko Schocher 2012-03-18   20  	model = "anonymous,a4m072";
7eb64c0f25574a Heiko Schocher 2012-03-18   21  	compatible = "anonymous,a4m072";
7eb64c0f25574a Heiko Schocher 2012-03-18   22  
7eb64c0f25574a Heiko Schocher 2012-03-18   23  	soc5200@f0000000 {
7eb64c0f25574a Heiko Schocher 2012-03-18   24  		#address-cells = <1>;
7eb64c0f25574a Heiko Schocher 2012-03-18   25  		#size-cells = <1>;
7eb64c0f25574a Heiko Schocher 2012-03-18   26  		compatible = "fsl,mpc5200b-immr";
7eb64c0f25574a Heiko Schocher 2012-03-18   27  		ranges = <0 0xf0000000 0x0000c000>;
7eb64c0f25574a Heiko Schocher 2012-03-18   28  		reg = <0xf0000000 0x00000100>;
7eb64c0f25574a Heiko Schocher 2012-03-18   29  		bus-frequency = <0>; /* From boot loader */
7eb64c0f25574a Heiko Schocher 2012-03-18   30  		system-frequency = <0>; /* From boot loader */
7eb64c0f25574a Heiko Schocher 2012-03-18   31  
7eb64c0f25574a Heiko Schocher 2012-03-18   32  		cdm@200 {
7eb64c0f25574a Heiko Schocher 2012-03-18   33  			fsl,init-ext-48mhz-en = <0x0>;
7eb64c0f25574a Heiko Schocher 2012-03-18   34  			fsl,init-fd-enable = <0x01>;
7eb64c0f25574a Heiko Schocher 2012-03-18   35  			fsl,init-fd-counters = <0x3333>;
7eb64c0f25574a Heiko Schocher 2012-03-18   36  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   37  
7eb64c0f25574a Heiko Schocher 2012-03-18   38  		spi@f00 {
7eb64c0f25574a Heiko Schocher 2012-03-18   39  			status = "disabled";
7eb64c0f25574a Heiko Schocher 2012-03-18   40  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   41  
7eb64c0f25574a Heiko Schocher 2012-03-18   42  		psc@2000 {
7eb64c0f25574a Heiko Schocher 2012-03-18   43  			compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
7eb64c0f25574a Heiko Schocher 2012-03-18   44  			reg = <0x2000 0x100>;
7eb64c0f25574a Heiko Schocher 2012-03-18   45  			interrupts = <2 1 0>;
7eb64c0f25574a Heiko Schocher 2012-03-18   46  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   47  
7eb64c0f25574a Heiko Schocher 2012-03-18   48  		psc@2200 {
7eb64c0f25574a Heiko Schocher 2012-03-18   49  			compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
7eb64c0f25574a Heiko Schocher 2012-03-18   50  			reg = <0x2200 0x100>;
7eb64c0f25574a Heiko Schocher 2012-03-18   51  			interrupts = <2 2 0>;
7eb64c0f25574a Heiko Schocher 2012-03-18   52  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   53  
7eb64c0f25574a Heiko Schocher 2012-03-18   54  		psc@2400 {
7eb64c0f25574a Heiko Schocher 2012-03-18   55  			compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
7eb64c0f25574a Heiko Schocher 2012-03-18   56  			reg = <0x2400 0x100>;
7eb64c0f25574a Heiko Schocher 2012-03-18   57  			interrupts = <2 3 0>;
7eb64c0f25574a Heiko Schocher 2012-03-18   58  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   59  
7eb64c0f25574a Heiko Schocher 2012-03-18   60  		psc@2600 {
7eb64c0f25574a Heiko Schocher 2012-03-18   61  			status = "disabled";
7eb64c0f25574a Heiko Schocher 2012-03-18   62  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   63  
7eb64c0f25574a Heiko Schocher 2012-03-18   64  		psc@2800 {
7eb64c0f25574a Heiko Schocher 2012-03-18   65  			status = "disabled";
7eb64c0f25574a Heiko Schocher 2012-03-18   66  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   67  
7eb64c0f25574a Heiko Schocher 2012-03-18   68  		psc@2c00 {
7eb64c0f25574a Heiko Schocher 2012-03-18   69  			compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
7eb64c0f25574a Heiko Schocher 2012-03-18   70  			reg = <0x2c00 0x100>;
7eb64c0f25574a Heiko Schocher 2012-03-18   71  			interrupts = <2 4 0>;
7eb64c0f25574a Heiko Schocher 2012-03-18   72  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   73  
7eb64c0f25574a Heiko Schocher 2012-03-18   74  		ethernet@3000 {
7eb64c0f25574a Heiko Schocher 2012-03-18   75  			phy-handle = <&phy0>;
7eb64c0f25574a Heiko Schocher 2012-03-18   76  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   77  
7eb64c0f25574a Heiko Schocher 2012-03-18   78  		mdio@3000 {
7eb64c0f25574a Heiko Schocher 2012-03-18   79  			phy0: ethernet-phy@1f {
7eb64c0f25574a Heiko Schocher 2012-03-18   80  				reg = <0x1f>;
7eb64c0f25574a Heiko Schocher 2012-03-18   81  				interrupts = <1 2 0>; /* IRQ 2 active low */
7eb64c0f25574a Heiko Schocher 2012-03-18   82  			};
7eb64c0f25574a Heiko Schocher 2012-03-18   83  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   84  
7eb64c0f25574a Heiko Schocher 2012-03-18   85  		i2c@3d00 {
7eb64c0f25574a Heiko Schocher 2012-03-18   86  			status = "disabled";
7eb64c0f25574a Heiko Schocher 2012-03-18   87  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   88  
7eb64c0f25574a Heiko Schocher 2012-03-18   89  		i2c@3d40 {
7eb64c0f25574a Heiko Schocher 2012-03-18   90  			hwmon@2e {
7eb64c0f25574a Heiko Schocher 2012-03-18   91  				compatible = "nsc,lm87";
7eb64c0f25574a Heiko Schocher 2012-03-18   92  				reg = <0x2e>;
7eb64c0f25574a Heiko Schocher 2012-03-18   93  			};
7eb64c0f25574a Heiko Schocher 2012-03-18   94  			rtc@51 {
7eb64c0f25574a Heiko Schocher 2012-03-18   95  				compatible = "nxp,rtc8564";
7eb64c0f25574a Heiko Schocher 2012-03-18   96  				reg = <0x51>;
7eb64c0f25574a Heiko Schocher 2012-03-18   97  			};
7eb64c0f25574a Heiko Schocher 2012-03-18   98  		};
7eb64c0f25574a Heiko Schocher 2012-03-18   99  	};
7eb64c0f25574a Heiko Schocher 2012-03-18  100  
7eb64c0f25574a Heiko Schocher 2012-03-18 @101  	localbus {
7eb64c0f25574a Heiko Schocher 2012-03-18  102  		compatible = "fsl,mpc5200b-lpb","simple-bus";
7eb64c0f25574a Heiko Schocher 2012-03-18  103  		#address-cells = <2>;
7eb64c0f25574a Heiko Schocher 2012-03-18  104  		#size-cells = <1>;
7eb64c0f25574a Heiko Schocher 2012-03-18  105  		ranges = <0 0 0xfe000000 0x02000000
7eb64c0f25574a Heiko Schocher 2012-03-18  106  			  1 0 0x62000000 0x00400000
7eb64c0f25574a Heiko Schocher 2012-03-18  107  			  2 0 0x64000000 0x00200000
7eb64c0f25574a Heiko Schocher 2012-03-18  108  			  3 0 0x66000000 0x01000000
7eb64c0f25574a Heiko Schocher 2012-03-18  109  			  6 0 0x68000000 0x01000000
7eb64c0f25574a Heiko Schocher 2012-03-18  110  			  7 0 0x6a000000 0x00000004>;
7eb64c0f25574a Heiko Schocher 2012-03-18  111  
7eb64c0f25574a Heiko Schocher 2012-03-18  112  		flash@0,0 {
7eb64c0f25574a Heiko Schocher 2012-03-18  113  			compatible = "cfi-flash";
7eb64c0f25574a Heiko Schocher 2012-03-18  114  			reg = <0 0 0x02000000>;
7eb64c0f25574a Heiko Schocher 2012-03-18  115  			bank-width = <2>;
7eb64c0f25574a Heiko Schocher 2012-03-18  116  			#size-cells = <1>;
7eb64c0f25574a Heiko Schocher 2012-03-18  117  			#address-cells = <1>;
7eb64c0f25574a Heiko Schocher 2012-03-18  118  		};
7eb64c0f25574a Heiko Schocher 2012-03-18  119  		sram0@1,0 {
7eb64c0f25574a Heiko Schocher 2012-03-18  120  			compatible = "mtd-ram";
7eb64c0f25574a Heiko Schocher 2012-03-18  121  			reg = <1 0x00000 0x00400000>;
7eb64c0f25574a Heiko Schocher 2012-03-18  122  			bank-width = <2>;
7eb64c0f25574a Heiko Schocher 2012-03-18  123  		};
7eb64c0f25574a Heiko Schocher 2012-03-18  124  	};
7eb64c0f25574a Heiko Schocher 2012-03-18  125  
7eb64c0f25574a Heiko Schocher 2012-03-18  126  	pci@f0000d00 {
7eb64c0f25574a Heiko Schocher 2012-03-18  127  		#interrupt-cells = <1>;
7eb64c0f25574a Heiko Schocher 2012-03-18  128  		#size-cells = <2>;
7eb64c0f25574a Heiko Schocher 2012-03-18  129  		#address-cells = <3>;
7eb64c0f25574a Heiko Schocher 2012-03-18  130  		device_type = "pci";
7eb64c0f25574a Heiko Schocher 2012-03-18  131  		compatible = "fsl,mpc5200-pci";
7eb64c0f25574a Heiko Schocher 2012-03-18  132  		reg = <0xf0000d00 0x100>;
7eb64c0f25574a Heiko Schocher 2012-03-18  133  		interrupt-map-mask = <0xf800 0 0 7>;
7eb64c0f25574a Heiko Schocher 2012-03-18 @134  		interrupt-map = <

:::::: The code at line 134 was first introduced by commit
:::::: 7eb64c0f25574abeb02b79088258f94ba9339075 powerpc/mpc52xx: add a4m072 board support

:::::: TO: Heiko Schocher <hs@denx.de>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
