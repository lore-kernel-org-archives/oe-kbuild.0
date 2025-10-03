Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E27155A30
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759495514; cv=none; b=IQ3d731jfpNG0hgkhSofIcHBSq0P+DZQqMRzMqJ+7z3EF7WKhdUVOgWuBJHMT4sOMKDQ9tD/PkeaSiXeaEq56SP0d54iNS+imXBJV6J9GtTlEiimrajrdIWJyrzGbDkBuQzX4dvDsh71nGrSsuYrHHvToMmfLI7b5NfFwyv+GEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759495514; c=relaxed/simple;
	bh=L1jiLWPY2BChK6Wv5PplPBxxckNphg2ALRaizSRWdyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EYCWzlqJHuCU5epkhIkZVNtYeJp0duSB/iiG1mOFGrAsM7KaphGoLw289sWnK8ukEoYTvZosvQfYHxkG3SajF2Ka1IHbkoxKzbetg5/SKOOro8kqvBfCIuHHlcHsJAhHTkwRwGcWymf/iLJ9ULVFCOA6Ri4QDwF4Z5xS/xB7ZXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4CZYCfy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4CZYCfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759495512; x=1791031512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L1jiLWPY2BChK6Wv5PplPBxxckNphg2ALRaizSRWdyE=;
  b=j4CZYCfyGUfyDfwtjG/Jf9YmQbMaNyRlXiGhvk7oFw5rMc1gzU0lakr3
   2IEwAG+kZUDIv1KCKU4jnnlRWFwCqMFY4n1j7JG5t1li+njlghHzsdP7T
   ocXHQKmI14O6nscU3kxYjMRk99S4Mh81H62tisJ53etjX2WNts2ZiidsY
   Lz4XihoFg9fVt62YVqfVNXXpbqmGKGDc1ZCJHJprl4ZCrybRMQpCLUWC/
   hoArbnv4seLOBKnRdblatDHnQJQ6vLMCdT779f3y0nZ//bU2HsfRbiFag
   4lL7Kc8lzmzbyuUx3rMcsJoR4vMe8WcpvBz2zrfVnIbn4JNyEbDGwNCdd
   A==;
X-CSE-ConnectionGUID: kYpUFJaeRXiDihp5XFjF8Q==
X-CSE-MsgGUID: uyBI9voAQRKjxnUNZ4bZCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61739169"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61739169"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:45:09 -0700
X-CSE-ConnectionGUID: rB//IcolQCC7bETi0/pM0g==
X-CSE-MsgGUID: cGXReECZSoOYn1CLmG1BYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="216396307"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2025 05:45:07 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4f9l-0004Xh-15;
	Fri, 03 Oct 2025 12:45:05 +0000
Date: Fri, 3 Oct 2025 20:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:spi-6.18 17/17]
 arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff040000
 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202510032038.2vnnL9yc-lkp@intel.com>
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
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Mark Brown <broonie@kernel.org>

Hi Conor,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git spi-6.18
head:   4092fc5f35cecb01d59b2cdf7740b203eac6948a
commit: 4092fc5f35cecb01d59b2cdf7740b203eac6948a [17/17] spi: dt-bindings: cadence: add soc-specific compatible strings for zynqmp and versal-net
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-054-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032038.2vnnL9yc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510032038.2vnnL9yc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510032038.2vnnL9yc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: i2c-mux@75 (nxp,pca9548): i2c@0: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: i2c-mux@75 (nxp,pca9548): i2c@1: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: i2c-mux@75 (nxp,pca9548): i2c@2: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: i2c-mux@75 (nxp,pca9548): i2c@3: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: pmic@5e (ti,tps65086): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65086.yaml#
>> arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: leds (gpio-leds): led-ds4:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0rx' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'phy0rx' does not match '^cpu[0-9]*$'
   	'phy0rx' does not match '^hci[0-9]+-power$'
   	'phy0rx' does not match '^mmc[0-9]+$'
   	'phy0rx' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: leds (gpio-leds): led-ds4: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('arasan,has-mdma', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('arasan,has-mdma', 'num-cs', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: i2c-mux@75 (nxp,pca9548): i2c@3: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: pmic@5e (ti,tps65086): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65086.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: leds (gpio-leds): led-ds4:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0rx' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: sc18is603@2f (nxp,sc18is603): $nodename:0: 'sc18is603@2f' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/nxp,sc18is.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
