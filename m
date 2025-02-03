Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9BAC139
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599896; cv=none; b=L5yswVlWnlGU8OcGSsIO+lajvdf+YquQG61TYGQj+hHANz7ufGJ0V1vZOOkwpDZGP8Pk3LTURgMbWhnJ4HkOSrpOgDkV5YPvUtfXnB8VZtXmqv67r923c12XajZ26MgqzloOa+1c7G4iE3kc156x/f0isNaa3uCz4mf2JYGUCts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599896; c=relaxed/simple;
	bh=gIpKmD7bXRe2QXv13m1UlK56QYwTI/ZdEyivDLUMn18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnNXwqlb8BX3wsNzBRCKjXr3zlsxOhnP3AOdltnqWBAF39DZOmIKt5gvXGi5ceajZ4oENd1xjDj2GftwN6qIBrUudEij4EJnFiawC7S40beJ8jlP610gh/TH6QdKYld8pnaFs2FYfgCLUBRlcZMe0dscP5Fxc/ojx4B2eLHleVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvbX9Q9s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvbX9Q9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738599894; x=1770135894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gIpKmD7bXRe2QXv13m1UlK56QYwTI/ZdEyivDLUMn18=;
  b=ZvbX9Q9sA2d3Iixvvh6sQcEc3YqSgLiu4OOkQeDQdcJYCSzQTzhGPOg8
   fXkz1Km3Ouo1F3dtDgZ1fJUzfNu0no0xyeO5oj9CthUNoU9lckymacIVr
   PmOzl1Hm686bqij57iGqDpaMV2Uw/JW7Situi4kO63SCWUvei/fDjxQ++
   +p/LX5XcDW/Iq5b+D51o1eaIhiKlKdwr+pIQB+LAzSrwTngLcMpedERZb
   vA+ZJ133rw79of6bInTY1TsyMG94h+mEWR3aE7Zu3s6vdN2NuhyJz9tEs
   pSEryUpuyysRFWF8kfife4M3HjrQ+Zd+5vnCyqIRQ+0npcWmM1aQLqVJB
   A==;
X-CSE-ConnectionGUID: Popf3SX3RwCtcvKK+2jfYw==
X-CSE-MsgGUID: NSNI10VMTyCzRzR3pbcJLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49752658"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="49752658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:24:50 -0800
X-CSE-ConnectionGUID: avDD/xYjSOCinSt9VHVgrw==
X-CSE-MsgGUID: V0b92sitRPakgGhJgNJYiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147539813"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2025 08:24:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tezFf-000rAp-0R;
	Mon, 03 Feb 2025 16:24:47 +0000
Date: Tue, 4 Feb 2025 00:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 22/53]
 arch/xtensa/boot/dts/xip_kc705.dtb: /: 'model' is a required property
Message-ID: <202502040000.EonF2Hha-lkp@intel.com>
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
commit: 3f7d70a56b32492a828d69fd82cf76ce43aa89bb [22/53] xtensa: xip_kc705_nommu: add defconfig and DTS
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: xtensa-randconfig-052-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040000.EonF2Hha-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040000.EonF2Hha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502040000.EonF2Hha-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (unit_address_vs_reg): /soc/main-oscillator: node has a reg or ranges property, but no unit name
   arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (simple_bus_reg): /soc/main-oscillator: simple-bus unit address format error, expected "d020004"
   arch/xtensa/boot/dts/xtfpga.dtsi:57.28-67.5: Warning (simple_bus_reg): /soc/serial@0d050020: simple-bus unit address format error, expected "d050020"
   arch/xtensa/boot/dts/xtfpga.dtsi:69.25-76.5: Warning (simple_bus_reg): /soc/ethoc@0d030000: simple-bus unit address format error, expected "d030000"
   arch/xtensa/boot/dts/xtfpga.dtsi:78.29-84.5: Warning (simple_bus_reg): /soc/xtfpga-i2s@0d080000: simple-bus unit address format error, expected "d080000"
   arch/xtensa/boot/dts/xtfpga.dtsi:86.29-104.5: Warning (simple_bus_reg): /soc/i2c-master@0d090000: simple-bus unit address format error, expected "d090000"
   arch/xtensa/boot/dts/xtfpga.dtsi:106.22-118.5: Warning (simple_bus_reg): /soc/spi@0d0a0000: simple-bus unit address format error, expected "d0a0000"
   arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi:4.25-27.5: Warning (simple_bus_reg): /soc/flash@00000000: simple-bus unit address format error, expected "0"
>> arch/xtensa/boot/dts/xip_kc705.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /: failed to match any schema with compatible: ['cdns,xtensa-kc705']
>> arch/xtensa/boot/dts/xip_kc705.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/xip_kc705.dtb: /pic: failed to match any schema with compatible: ['cdns,xtensa-pic']
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: xtfpga-i2s@0d080000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: serial@0d050020: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: i2c-master@0d090000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: spi@0d0a0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: flash@00000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: main-oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: ethoc@0d030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
>> arch/xtensa/boot/dts/xip_kc705.dtb: serial@0d050020: Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/ethoc@0d030000: failed to match any schema with compatible: ['opencores,ethoc']
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
>> arch/xtensa/boot/dts/xip_kc705.dtb: i2c-master@0d090000: Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/i2c-master@0d090000/clock-synth@69: failed to match any schema with compatible: ['ti,cdce706']
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (unit_address_vs_reg): /soc/main-oscillator: node has a reg or ranges property, but no unit name
   arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (simple_bus_reg): /soc/main-oscillator: simple-bus unit address format error, expected "d020004"
   arch/xtensa/boot/dts/xtfpga.dtsi:57.28-67.5: Warning (simple_bus_reg): /soc/serial@0d050020: simple-bus unit address format error, expected "d050020"
   arch/xtensa/boot/dts/xtfpga.dtsi:69.25-76.5: Warning (simple_bus_reg): /soc/ethoc@0d030000: simple-bus unit address format error, expected "d030000"
   arch/xtensa/boot/dts/xtfpga.dtsi:78.29-84.5: Warning (simple_bus_reg): /soc/xtfpga-i2s@0d080000: simple-bus unit address format error, expected "d080000"
   arch/xtensa/boot/dts/xtfpga.dtsi:86.29-104.5: Warning (simple_bus_reg): /soc/i2c-master@0d090000: simple-bus unit address format error, expected "d090000"
   arch/xtensa/boot/dts/xtfpga.dtsi:106.22-118.5: Warning (simple_bus_reg): /soc/spi@0d0a0000: simple-bus unit address format error, expected "d0a0000"
   arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi:4.25-27.5: Warning (simple_bus_reg): /soc/flash@00000000: simple-bus unit address format error, expected "0"
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /: failed to match any schema with compatible: ['cdns,xtensa-kc705']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /pic: failed to match any schema with compatible: ['cdns,xtensa-pic']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: serial@0d050020: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: spi@0d0a0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: i2c-master@0d090000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: xtfpga-i2s@0d080000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: ethoc@0d030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: flash@00000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: main-oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: serial@0d050020: Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/ethoc@0d030000: failed to match any schema with compatible: ['opencores,ethoc']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: i2c-master@0d090000: Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/i2c-master@0d090000/clock-synth@69: failed to match any schema with compatible: ['ti,cdce706']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
