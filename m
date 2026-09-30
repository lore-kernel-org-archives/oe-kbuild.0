Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092FA4A8430
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 18:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790792982; cv=none; b=UEKQxd+ccWsOzpg0tgZal+0uttuCorLKQyRYEEfKolxIUhv3KXdf/7o1WstaJLvk53KpQrCeZDk9skKJTGelH+QqiDSkiIissVys5x2jPwDsPyO3Cvv4pMnfxI8c7p7lCG5m0g77k8YwBe0rf2JzFV475T4iq+HYvLpiXzkcC8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790792982; c=relaxed/simple;
	bh=1tLn5oyOBPy2TpAiJDcWIXQtl75jcFRUUyfFZ52IfP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ikxFowWJTAXbmGtu76qkeGDlo4XUxxingQ0CNgpqkS2S/IdR/B4+laqJrwGUB4ITtsfv4BNFiIidie5l9HHQVsK7//Mh+K2zyYXbqjveCarltDNkmzJAvhbExT6MNduPjKaPnDvIuIwBPuXAsHcll7s4ETbcxJx4BHvdEYCx4f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3q3Qj7h; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3q3Qj7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790792980; x=1822328980;
  h=date:from:to:cc:subject:message-id;
  bh=1tLn5oyOBPy2TpAiJDcWIXQtl75jcFRUUyfFZ52IfP4=;
  b=a3q3Qj7hLx+Pik7RDyCmzvw3qSHclBuALordnMmeWIjj4x4Uxj59KrAB
   UV7tcBqYeAVYQJlH8sH6Dl5JgmICiPXb+hE4z31T7GVrI4LwLf6Kes2BT
   6z+vAiOAT6xBFSxErHCI98SJXJO+STwROl0Z3HZyzm/k4+iXhbJBzTE5z
   Ys+7nikwwDmo/PbLs5rIC2I3CaQasB1/Xq47x8kNHx+LTl6pBC+NiVQlh
   07chUDtYMOCIUOehDz6G3BDTK76FYRwftJfGDmtS+74SAXMv5gCt+KyHJ
   Rr9KJaQru1lXsh8xMkZPVpZj9dblBa3+8MjzZ15l6B0cBorJL4hVw7jou
   g==;
X-CSE-ConnectionGUID: XE23jBd6T4a1jiqNpCxDww==
X-CSE-MsgGUID: UPVTCH6dQEe5GJvHYlLuew==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90439823"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90439823"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 11:29:39 -0700
X-CSE-ConnectionGUID: E+egWXCyTralf2eSaF6nQA==
X-CSE-MsgGUID: 6ybLWKeZSliUSmUJ5lTBoQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2026 11:29:38 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBz3g-000000001xf-29sp;
	Wed, 30 Sep 2026 18:29:36 +0000
Date: Wed, 30 Sep 2026 20:29:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:ux500-dts-for-soc 3/9]
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: janice_cfg1: ste,config:
 b'\x00\x00\x00(' is not of type 'object', 'integer', 'array', 'boolean',
 'null'
Message-ID: <202609302015.R3yHFH2c-lkp@intel.com>
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
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-dts-for-soc
head:   2eb92e6b94b612eccb53366f65018ae5e8d072d5
commit: 72c808001efa2a4146821ecb6f70645c15eb9629 [3/9] ARM: dts: ux500: Add the Imagis ISA to Janice DTS
:::::: branch date: 7 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-2400-20260924 (https://download.01.org/0day-ci/archive/20260930/202609302015.R3yHFH2c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302015.R3yHFH2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609302015.R3yHFH2c-lkp@intel.com/

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
