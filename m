Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A922B667
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 10:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741256984; cv=none; b=r9O1c5BHVSIxUhG4cf6u2smlAgp1Rn61EgLEq/hU41i1YgJt4LK6oT2xAZwulF53ttmIqon5Db+b7Hb9brjsrqGVsvWm6SSfD25sn+faOiOq6TVmb5gtLhMd1Xx5vvHzipC7Ahi9IU08djx8OTrmmXZB8dBZ66inHL0rQal/4Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741256984; c=relaxed/simple;
	bh=sQYgNnTLw/YD8l+t+pZAWWYHKRZE2FKoZTguqny1cZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=laqfXVM3dRT+0cVGRXP+4pQTQ4xEO5S/HhjBMZwryjYM8yeYrVh7vTpJKaBiI9QM+la8hMRzMHZGyGF1zbRcqckVypCBbuGZ7A3ndUJ1R/2rz2RRc/JInq++cZXMNPve9y9mzjc12w6k3QfLzID8k5ZplKofaZf4KVsoqULb4IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AN9ODJ6X; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AN9ODJ6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741256983; x=1772792983;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sQYgNnTLw/YD8l+t+pZAWWYHKRZE2FKoZTguqny1cZ4=;
  b=AN9ODJ6XG/u5DiHxwpQBNGWPBewN7C3J+p7Z0gIFgIapkOCaNZnvUppA
   +uH4acQOxGNlgaNDZNeH9tczd1R4ULu6ENdIX+FmFvEE4Nny3/wzDKJhb
   gI89MUbjlQbvHH4S4WJacUAkJ1pdRJlHgloUgcnq5/Db/QSFZ32D49hAl
   Fmk2bUFSJInAGeYu3IIOaYeJ0ULBDwCcA2ChtIikHgMv96l2WqxMsHyvz
   45z/CB/bExqxoAm9GP4IfAPq6qfC5/UwXwhIPPuAUHEIuqKFugICzFJDr
   HZFua0rfqCCogwfoPpFj/aOHJyFlek1v8GJZC5gI2mEr4sjEXmyitUaMw
   Q==;
X-CSE-ConnectionGUID: zBgTNO0vTPm44uJmV1UQ5w==
X-CSE-MsgGUID: gQ7urQZlQrCQNdrsnv7KZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53656829"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="53656829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 02:29:42 -0800
X-CSE-ConnectionGUID: eKTo5Tt/TAe5RvoFPzOTGQ==
X-CSE-MsgGUID: HCe0bJ06TamfI6VmKViQEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119667900"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Mar 2025 02:29:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq8Ts-000Mu6-32;
	Thu, 06 Mar 2025 10:29:36 +0000
Date: Thu, 6 Mar 2025 18:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] dt-bindings: net: Convert fsl,gianfar to YAML
Message-ID: <202503061857.h10Mkwhk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250228-gianfar-yaml-v2-3-6beeefbd4818@posteo.net>
References: <20250228-gianfar-yaml-v2-3-6beeefbd4818@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/dt-bindings-net-Convert-fsl-gianfar-mdio-tbi-to-YAML/20250301-013611
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250228-gianfar-yaml-v2-3-6beeefbd4818%40posteo.net
patch subject: [PATCH v2 3/3] dt-bindings: net: Convert fsl,gianfar to YAML
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250306/202503061857.h10Mkwhk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061857.h10Mkwhk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503061857.h10Mkwhk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b60000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: display-timings: 'mode0' does not match any of the regexes: '^timing', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d10000: queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d10000: queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d10000: Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d50000: queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d50000: queue-group@2d54000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d50000: Unevaluated properties are not allowed ('queue-group@2d50000', 'queue-group@2d54000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d90000: queue-group@2d90000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d90000: queue-group@2d94000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: ethernet@2d90000: Unevaluated properties are not allowed ('queue-group@2d90000', 'queue-group@2d94000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
--
   	'marvell,88e1118' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/mdio@2d24000/ethernet-phy@1: failed to match any schema with compatible: ['marvell,88e1118']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@2: compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1118'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1118' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/mdio@2d24000/ethernet-phy@2: failed to match any schema with compatible: ['marvell,88e1118']
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet@2d10000: queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet@2d10000: queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet@2d10000: Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet@2d50000: queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet@2d50000: queue-group@2d54000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet@2d50000: Unevaluated properties are not allowed ('queue-group@2d50000', 'queue-group@2d54000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet@2d90000: queue-group@2d90000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet@2d90000: queue-group@2d94000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet@2d90000: Unevaluated properties are not allowed ('queue-group@2d90000', 'queue-group@2d94000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: leds: 'beeper', 'cel-pwr', 'cel-reset', 'cpu-diag-green', 'cpu-diag-red', 'cpu-diag-yellow', 'sw-ready', 'wifi-signal0', 'wifi-signal1', 'wifi-signal2' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: sai@2b60000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: ethernet@2d10000: queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: ethernet@2d10000: queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: ethernet@2d10000: Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: ethernet@2d50000: queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: ethernet@2d50000: queue-group@2d54000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: ethernet@2d50000: Unevaluated properties are not allowed ('queue-group@2d50000', 'queue-group@2d54000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: ethernet@2d90000: queue-group@2d90000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: ethernet@2d90000: queue-group@2d94000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: ethernet@2d90000: Unevaluated properties are not allowed ('queue-group@2d90000', 'queue-group@2d94000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
--
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b50000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: ethernet@2d10000: queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: ethernet@2d10000: queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: ethernet@2d10000: Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: ethernet@2d50000: queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: ethernet@2d50000: queue-group@2d54000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: ethernet@2d50000: Unevaluated properties are not allowed ('queue-group@2d50000', 'queue-group@2d54000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: ethernet@2d90000: queue-group@2d90000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: ethernet@2d90000: queue-group@2d94000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: ethernet@2d90000: Unevaluated properties are not allowed ('queue-group@2d90000', 'queue-group@2d94000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
--
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: sai@2b60000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet@2d10000: queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet@2d10000: queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet@2d10000: Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet@2d50000: queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet@2d50000: queue-group@2d54000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet@2d50000: Unevaluated properties are not allowed ('queue-group@2d50000', 'queue-group@2d54000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet@2d90000: queue-group@2d90000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet@2d90000: queue-group@2d94000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet@2d90000: Unevaluated properties are not allowed ('queue-group@2d90000', 'queue-group@2d94000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
--
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b50000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/dcu@2ce0000: failed to match any schema with compatible: ['fsl,ls1021a-dcu']
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: ethernet@2d10000: queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: ethernet@2d10000: queue-group@2d14000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: ethernet@2d10000: Unevaluated properties are not allowed ('queue-group@2d10000', 'queue-group@2d14000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: ethernet@2d50000: queue-group@2d50000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: ethernet@2d50000: queue-group@2d54000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: ethernet@2d50000: Unevaluated properties are not allowed ('queue-group@2d50000', 'queue-group@2d54000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: ethernet@2d90000: queue-group@2d90000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: ethernet@2d90000: queue-group@2d94000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: ethernet@2d90000: Unevaluated properties are not allowed ('queue-group@2d90000', 'queue-group@2d94000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: usb@3100000: Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: power-controller@1ee2140: '#power-domain-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: timer0@29d0000: $nodename:0: 'timer0@29d0000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: timer0@29d0000: Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/fsl,ls-ftm-alarm.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: panel: 'power-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
