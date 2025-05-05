Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352FF42C0B
	for <oe-kbuild@lists.linux.dev>; Mon,  5 May 2025 03:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746415966; cv=none; b=XhRvw30lWmGYDh+HGmHNpyWajB2Zaz8swaJbf9Ii3QajF2PIMfNAykT4xgkFE0mrK7JY3nN3PezvFbghvzT1OCtyCGlw86oFbsVDdmvx8KyzLZ10wl7FYaKrvuH5kXQpmr6+7lYRF4JOHi16UAkB8ue+LMI/ITLTNFqABLavQdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746415966; c=relaxed/simple;
	bh=9mSYUh1/eGau63DaCmre7Rg/3OcsXQUC3FE/Z4QltS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HYUNr26MWPdAkVB5y5bwRbfk1T8F12EfV+u6St3zdVeOkrdhqi4qh/oquHeRj9yl/FGZvNqhTeyYy2mOKS6oO6HpXFndP3nFm2Umel2jPXtA/ABv9HPZG1bZNDfbQPSJwkTMoZW4P6v9t6qNEjff7DjdeCPFk88IOsP0Db/h7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMeOoyBo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMeOoyBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746415964; x=1777951964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9mSYUh1/eGau63DaCmre7Rg/3OcsXQUC3FE/Z4QltS0=;
  b=hMeOoyBonJsNE8qA2O96YQSprg1Dg3RKOL25V4OLjSmwFDJawn/CqGHQ
   zvn0MKZYmyIzY4kPbfZlkx8+l18facqWFX+sWoXk228YXcoEZFICBz7AQ
   SdfpF6sx7wQdvgQsho6HJYM9lo0QntsJNH+THe5vk5dKt8UqE0066xLQ6
   +5OM1jlykOAuW394eSk/yxsGcp77AeBipMqs/+xadKc1mYwYUejavEI3P
   kussMQdTN5n+xrZJsgysOXNPDPR+gWZl+cQMYnO6Zaw0GVLAPC7bZIVeX
   v8GRROi1oYF42b2BbM9/EzqLt7eNbQrPC+hBzMsOj1lLr4OK3Kp8k52px
   g==;
X-CSE-ConnectionGUID: Fku5jHf0T9GqyWZhbB137g==
X-CSE-MsgGUID: xMk9KhGnShGQcP0lNtvV8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="73407569"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="73407569"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2025 20:32:43 -0700
X-CSE-ConnectionGUID: fI8w29iSRj+z5mYpW8cf+g==
X-CSE-MsgGUID: YTO0EcQBRE6l3wqTPtOiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="136078785"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 May 2025 20:32:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBmZL-0005QK-1x;
	Mon, 05 May 2025 03:32:39 +0000
Date: Mon, 5 May 2025 11:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: rtc@10300
 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202505040454.IfyXYPuB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Javier Carrasco <javier.carrasco.cruz@gmail.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bac8898fe398ffa3e09075ecea2be511725fb0b
commit: 1c431b92e21bcbfc374f97d801840c1df47e3d6b dt-bindings: rtc: convert trivial devices into dtschema
date:   1 year, 1 month ago
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-051-20250428 (https://download.01.org/0day-ci/archive/20250504/202505040454.IfyXYPuB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250504/202505040454.IfyXYPuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505040454.IfyXYPuB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/xor@60800: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/xor@60900: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/sata-phy@82000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/sata-phy@84000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
>> arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8025', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'isil,isl1208', 'isil,isl1218', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'nxp,lpc3220-rtc', 'pericom,pt7c4338', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/sata@80000: failed to match any schema with compatible: ['marvell,orion-sata']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: /ocp@f1000000/poweroff@12100: failed to match any schema with compatible: ['synology,power-off']
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: gpio-fan-100-15-35-3 (gpio-fan): alarm-gpios: [[27, 3, 0], [27, 12, 0], [27, 13, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/gpio-fan.yaml#
   arch/arm/boot/dts/marvell/kirkwood-rs411.dtb: gpio-leds-alarm-12 (gpio-leds): 'hdd1-green' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/xor@60800: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/xor@60900: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/sata-phy@82000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/sata-phy@84000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
>> arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8025', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'isil,isl1208', 'isil,isl1218', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'nxp,lpc3220-rtc', 'pericom,pt7c4338', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: /ocp@f1000000/sata@80000: failed to match any schema with compatible: ['marvell,orion-sata']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: mvsdio@90000 (marvell,orion-sdio): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: regulators (simple-bus): regulator@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dtb: regulators (simple-bus): #size-cells: 0 is not one of [1, 2]
--
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/xor@60800: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/xor@60900: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/sata-phy@82000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/sata-phy@84000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
>> arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8025', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'isil,isl1208', 'isil,isl1218', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'nxp,lpc3220-rtc', 'pericom,pt7c4338', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: /ocp@f1000000/sata@80000: failed to match any schema with compatible: ['marvell,orion-sata']
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: mvsdio@90000 (marvell,orion-sdio): Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq', 'cd-gpios', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: regulators (simple-bus): regulator@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-sheevaplug-esata.dtb: regulators (simple-bus): #size-cells: 0 is not one of [1, 2]
--
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/xor@60800: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/xor@60900: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/sata-phy@82000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/sata-phy@84000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
>> arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8025', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'isil,isl1208', 'isil,isl1218', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'nxp,lpc3220-rtc', 'pericom,pt7c4338', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: /ocp@f1000000/sata@80000: failed to match any schema with compatible: ['marvell,orion-sata']
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: regulators (simple-bus): regulator@1:reg:0: [1] is too short
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: regulators (simple-bus): #size-cells: 0 is not one of [1, 2]
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/marvell/kirkwood-t5325.dtb: regulators (simple-bus): $nodename:0: 'regulators' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
--
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/xor@60800: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/xor@60900: failed to match any schema with compatible: ['marvell,orion-xor']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/ethernet-controller@72000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/sata-phy@82000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/sata-phy@84000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/thermal@10078: failed to match any schema with compatible: ['marvell,kirkwood-thermal']
>> arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8025', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'isil,isl1208', 'isil,isl1218', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'nxp,lpc3220-rtc', 'pericom,pt7c4338', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: /ocp@f1000000/sata@80000: failed to match any schema with compatible: ['marvell,orion-sata']
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: mvsdio@90000 (marvell,orion-sdio): Unevaluated properties are not allowed ('broken-cd', 'bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cap-sdio-irq' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: gpio-leds (gpio-leds): 'disk', 'system', 'system2', 'wifi', 'wifi2' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-topkick.dtb: regulators (simple-bus): regulator@1:reg:0: [1] is too short
--
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy@X' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: mdio-bus@72004 (marvell,orion-mdio): 'ethernet-phy@X' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/sata-phy@82000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/sata-phy@84000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
>> arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8025', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'isil,isl1208', 'isil,isl1218', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'nxp,lpc3220-rtc', 'pericom,pt7c4338', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/sata@80000: failed to match any schema with compatible: ['marvell,orion-sata']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: /ocp@f1000000/poweroff@12100: failed to match any schema with compatible: ['qnap,power-off']
   arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'copy', 'reset' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/ethernet-controller@72000/ethernet0-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: mdio-bus@72004 (marvell,orion-mdio): Unevaluated properties are not allowed ('ethernet-phy@X' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/marvell,orion-mdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: mdio-bus@72004 (marvell,orion-mdio): 'ethernet-phy@X' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/ethernet-controller@76000: failed to match any schema with compatible: ['marvell,kirkwood-eth']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/ethernet-controller@76000/ethernet1-port@0: failed to match any schema with compatible: ['marvell,kirkwood-eth-port']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/sata-phy@82000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/sata-phy@84000: failed to match any schema with compatible: ['marvell,mvebu-sata-phy']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/audio-controller@a0000: failed to match any schema with compatible: ['marvell,kirkwood-audio']
>> arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: rtc@10300 (marvell,kirkwood-rtc): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible:0: 'marvell,kirkwood-rtc' is not one of ['abracon,abb5zes3', 'abracon,abeoz9', 'aspeed,ast2400-rtc', 'aspeed,ast2500-rtc', 'aspeed,ast2600-rtc', 'cnxt,cx92755-rtc', 'dallas,ds1374', 'dallas,ds1672', 'dallas,ds3232', 'emmicro,em3027', 'epson,rx8010', 'epson,rx8025', 'epson,rx8035', 'epson,rx8111', 'epson,rx8571', 'epson,rx8581', 'google,goldfish-rtc', 'isil,isl1208', 'isil,isl1218', 'marvell,orion-rtc', 'maxim,ds1742', 'maxim,mcp795', 'microcrystal,rv3029', 'microcrystal,rv8523', 'nxp,lpc3220-rtc', 'pericom,pt7c4338', 'ricoh,r2025sd', 'ricoh,r2221tl', 'ricoh,rs5c372a', 'ricoh,rs5c372b', 'ricoh,rv5c386', 'ricoh,rv5c387a', 'sii,s35390a', 'st,spear600-rtc', 'via,vt8500-rtc', 'whwave,sd3078', 'xircom,x1205']
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
>> arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: rtc@10300 (marvell,kirkwood-rtc): compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/rtc@10300: failed to match any schema with compatible: ['marvell,kirkwood-rtc', 'marvell,orion-rtc']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/sata@80000: failed to match any schema with compatible: ['marvell,orion-sata']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: mvsdio@90000 (marvell,orion-sdio): $nodename:0: 'mvsdio@90000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,orion-sdio.yaml#
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: /ocp@f1000000/poweroff@12100: failed to match any schema with compatible: ['qnap,power-off']
   arch/arm/boot/dts/marvell/kirkwood-ts419-6281.dtb: gpio_keys (gpio-keys): '#address-cells', '#size-cells', 'copy', 'reset' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
