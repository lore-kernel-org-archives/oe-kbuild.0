Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A01644F56E
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 12:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945163; cv=none; b=TQjqwLbHNHWJjCY2A1k0daP08l/9+Y/pJTcFOSifRRsZjB0forniybAe+VcOXG81dcm9Vn+HgXLIwzh4HiVO+SyFR8lCEGF84GxbEc9zSI089aNm4kdbtJISQ9L31jX3NC7fGmeorHD4c6e4KCZM8NVd16Tmm0eic8mAYUhyV4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945163; c=relaxed/simple;
	bh=x8OJb519GVxBPBsCOeYelhSwQ2wLqha4Vz5QFpHH2eY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mJOE7NLTAsiJdlE2hNZ9afNPvN4314XpEgMGCZAy/Erf7sxDpfakd60mHYFRpc3NnUclZCXQD/PgLU9lfT0aBE+xfkpldD+p7n52fyZLA+ySQ7bORrSzurXRUkcyqXIa7EQRTGKrrwiXQakOq/9EXLCQsfmaDjgTQi4rxSH1czU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRZ3E1T7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRZ3E1T7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790945161; x=1822481161;
  h=date:from:to:cc:subject:message-id;
  bh=x8OJb519GVxBPBsCOeYelhSwQ2wLqha4Vz5QFpHH2eY=;
  b=GRZ3E1T7p8IhXFsmoZF6XDuj0SM1PtjJv5EIMUs8kUGDhfW4vPrklja+
   6N7fFRSU7FZxTGh303inbwAhCbQP71eGOawVzfXavqoqstlalWAzXVDcR
   CH0UPYMR6m2YWmuuZxsacFTqbulpeIyIhasvIBMDqscSWJe4zBz0wN2x2
   ispvobF1w9EzaYdERqQtRAJVh74dnbCNmQ2FoDLBWaNOuRASRiByuFz7N
   uqeKF/eG1rkdlW50tYWO9+cymB8FrxO28CLHBPdK4VpnD5IaDN7Ihsxuy
   lTmulcttjF3RuK6ksJfChryMCVuwNr5lcDzgrw3MHjd3mLjJ5rBewaUmF
   A==;
X-CSE-ConnectionGUID: p2Waxc0uTz6INT4BMERwTg==
X-CSE-MsgGUID: dLNh6g7BT8i8aseOtaRrzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101039952"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101039952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 05:46:01 -0700
X-CSE-ConnectionGUID: BGhrnvMLRzy672lfXNe2/w==
X-CSE-MsgGUID: Yr5qtVXbSVqQ6CK1lwjp5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="305746856"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 Oct 2026 05:46:00 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCceD-000000000XX-14hM;
	Fri, 02 Oct 2026 12:45:57 +0000
Date: Fri, 02 Oct 2026 14:44:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:ste/dt32 3/9]
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config:
 b'\x00\x00\x00(' is not of type 'object', 'integer', 'array', 'boolean',
 'null'
Message-ID: <202610021404.JVCdH2x2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git ste/dt32
head:   2eb92e6b94b612eccb53366f65018ae5e8d072d5
commit: 72c808001efa2a4146821ecb6f70645c15eb9629 [3/9] ARM: dts: ux500: Add the Imagis ISA to Janice DTS
:::::: branch date: 9 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-2400-20260924 (https://download.01.org/0day-ci/archive/20261002/202610021404.JVCdH2x2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021404.JVCdH2x2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021404.JVCdH2x2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg3: ste,config: b'\x00\x00\x00*' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config: b'\x00\x00\x00(' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg2: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg3: ste,config: b'\x00\x00\x000' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/usb_per5@a03e0000: failed to match any schema with compatible: ['stericsson,db8500-musb']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: proximity@44 (sharp,gp2ap002a00f): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/light/sharp,gp2ap002.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80120000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80121000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: serial@80007000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@2e' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: current-sense-shunt (current-sense-shunt): 'io-channel-ranges' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/afe/current-sense-shunt.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'touchkey@20' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): $nodename:0: 'i2c-gpio-2' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-2 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'haptic-engine@49' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: i2c-gpio-3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'nfc@2b' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: nfc@2b (nxp,pn544-i2c): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/nfc/nxp,pn544.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
