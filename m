Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E816113C3F2
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759496172; cv=none; b=nxpUSRjw/PBRpQ9I58TdYlsvXM/zw6mNHVPSwZ6SeqLtJzPfhlueuEgLR+jL1h+ndFxasLV12vKo/JEWvSXpO4IUkdvyqwS2x5dbbUE+aFFOoQIYKDerfeftGCqUUcAcxzcLaGeMSg4ReKBtcz73CAyHDOSYVJCicIYMvV9IGO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759496172; c=relaxed/simple;
	bh=xJ5ZV1Aq6X9NDU2nzFmMA6gU86sjkj7GGIDIComc9tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ChhkOhONlVfWJbSC4FVV1n72JyDPIcj/l4mrvWO32v9VCta4YI1XVOx8DqxA6EBBHjavxJcP2uern3/8Ggo0EfQNT9B4Jy0zQlZXB39+ELmy+/yTEJpbF2pRAw0O7BEqEX1dx83EhXTUdJRpzl8khAP58+4HZIOeppRs+pF1jJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cch/pYPT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cch/pYPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759496170; x=1791032170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xJ5ZV1Aq6X9NDU2nzFmMA6gU86sjkj7GGIDIComc9tM=;
  b=Cch/pYPTgTGJBZq0e55HmAzJ8yBqFEFlR/NStzxGpF2TK1y1P5KqeKbp
   iKgsPRp7cgIlaK6VGp+xw87WbDPqXkfEaP9l1CRgulCLGJiDUEAP2lQj7
   gJtqLV9KlwhfCWrCDK55sbrB0GoKNV9yGT5DMtN0JxglIhB3mSbwWOCjI
   Q2t9PbH6FND7EGEwXSCruJ/hGpdIZRupT6JrfstL9YllifoifolLDgMxB
   rdTEQCe8sKdnvSRAmSgzK65emGoYzWUA7T6BHUoHq8ybf1uG2T/xtmhrO
   9M9C9TDROTzDQRORYeIX1P/M6VEoStuYggDso/CXSSESV2k8McoVO1xvM
   w==;
X-CSE-ConnectionGUID: TjJjbqsRS92RsSAUlJWK+g==
X-CSE-MsgGUID: Eq6BnyPKSk+Q88CmX1VXEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61879723"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="61879723"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:56:09 -0700
X-CSE-ConnectionGUID: V16BpNf1Ri6nYcDqXpYb1g==
X-CSE-MsgGUID: cCEQ7tPTQgawAgDoE48DtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="180080845"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Oct 2025 05:56:08 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4fKQ-0004Y7-0Z;
	Fri, 03 Oct 2025 12:56:06 +0000
Date: Fri, 3 Oct 2025 20:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:spi-6.18 17/17]
 arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff050000
 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202510032029.27RMfWR6-lkp@intel.com>
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
config: arm64-randconfig-053-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032029.27RMfWR6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510032029.27RMfWR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510032029.27RMfWR6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: pmic@5e (ti,tps65086): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65086.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: leds (gpio-leds): led-ds4:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0rx' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'phy0rx' does not match '^cpu[0-9]*$'
   	'phy0rx' does not match '^hci[0-9]+-power$'
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('arasan,has-mdma', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: leds (gpio-leds): led-ds4:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0rx' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'phy0rx' does not match '^cpu[0-9]*$'
   	'phy0rx' does not match '^hci[0-9]+-power$'
   	'phy0rx' does not match '^mmc[0-9]+$'
   	'phy0rx' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: leds (gpio-leds): led-ds4: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
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
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: spi@f1960000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: spi@f1970000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
