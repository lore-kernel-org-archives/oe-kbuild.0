Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6E9168B7
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 03:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720840630; cv=none; b=mfV3wCZKnrkxaFcQu1oLX68ZkV2YXppJoIbK1fUsDAQ7q4VcFPFxQc4wxLWbWq7fF5JZeDkXDk+LS9FNaFEnFqh9jvUslJxuhieP6EXzgwv0jJ837+OXzZavpKXfExpq5345o7pPoPzXmddCRBRUkXVPJcYztmR7L4RpbrMHWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720840630; c=relaxed/simple;
	bh=Kcb4OTeAHh235iqwj9zaRrdfsGrpN1+Dq41bSoU4cvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qZ4z7GE+Qye4bu6RWzjJVfoI2SgNlUAkD3lLmXMbz2ecmFN/+o2/BdCL5s5nSVxi78LDsYRiE2Y3P9Sp2fhSJQ+/+SXKJlLEiNkyfgzu8zjo+Hpzwc+zsVg/RaeAoHK9+YFDkD+zevzHN9mdNDy8tMNAAH9ZaJ7o1aKxZ+6kSoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOqhxaiJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOqhxaiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720840624; x=1752376624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kcb4OTeAHh235iqwj9zaRrdfsGrpN1+Dq41bSoU4cvI=;
  b=hOqhxaiJHbpPbxAKkyG/5nFU2b+2lrWWgWbkb85L9vE0f9mXm/uaSo9v
   Cq3xNlJfLrwb5TM9roNkrs65tU+QPsT2w3HcYciVNSZmb+Hu2b3X/4jI8
   /vyDamtOsF7An13p2MzFcHHJnaKSUTIpFwbz8M0qg31b/9MtJcakJeFp+
   4wyAO4f2M08X0PEl1ivoyY4Q+T6GAsThtqHVuyU9BMtGd4vG7SEoDbbxO
   DqM/bAjZqh6l7lDtERzqUwRqE0u0dvqaPIL52LyvhKUxwaQHCz3XXZVk4
   XU4JjJFe4PUEWs2xPvkxkMKajxEEtd+wAHwvgM2eeSaFcemrqKkJV+zvK
   A==;
X-CSE-ConnectionGUID: Ko8iDDLaQQ2YwUArYP4qdg==
X-CSE-MsgGUID: G2mN6yljSRCWz20rCwMQhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17913356"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="17913356"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 20:17:01 -0700
X-CSE-ConnectionGUID: iiKeHuYbSeO6zZALURHWDQ==
X-CSE-MsgGUID: o9O/d4LST/GAF7RvyYOT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="80182574"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jul 2024 20:16:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSTFp-000bbq-2P;
	Sat, 13 Jul 2024 03:16:57 +0000
Date: Sat, 13 Jul 2024 11:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 38/38] arch/powerpc/boot/dts/a3m071.dtb: usb@1000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407131110.U9HGVtE8-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   ea9e315cccd5cfabdfd48bdd34ec774495f14201
commit: ea9e315cccd5cfabdfd48bdd34ec774495f14201 [38/38] dt-bindings: incomplete-devices: document devices without bindings
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: powerpc-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131110.U9HGVtE8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131110.U9HGVtE8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407131110.U9HGVtE8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/a3m071.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/a3m071.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/a3m071.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-uart', 'fsl,mpc5200-psc-uart']
--
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/a4m072.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/a4m072.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/a4m072.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/a4m072.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-uart', 'fsl,mpc5200-psc-uart']
--
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/i2c@ef600500: failed to match any schema with compatible: ['ibm,iic-405ez', 'ibm,iic']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/i2c@ef600500: failed to match any schema with compatible: ['ibm,iic-405ez', 'ibm,iic']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/gpio@ef600700: failed to match any schema with compatible: ['ibm,gpio-405ez']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/gpio@ef600800: failed to match any schema with compatible: ['ibm,gpio-405ez']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/ethernet@ef600900: failed to match any schema with compatible: ['ibm,emac-405ez', 'ibm,emac']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/ethernet@ef600900: failed to match any schema with compatible: ['ibm,emac-405ez', 'ibm,emac']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/can@ef601000: failed to match any schema with compatible: ['amcc,can-405ez']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/can@ef601800: failed to match any schema with compatible: ['amcc,can-405ez']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/cameleon@ef602000: failed to match any schema with compatible: ['amcc,cameleon-405ez']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/ieee1588@ef602800: failed to match any schema with compatible: ['amcc,ieee1588-405ez']
>> arch/powerpc/boot/dts/acadia.dtb: usb@ef603000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/acadia.dtb: usb@ef603000: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/dac@ef603300: failed to match any schema with compatible: ['amcc,dac-405ez']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/adc@ef603400: failed to match any schema with compatible: ['amcc,adc-405ez']
   arch/powerpc/boot/dts/acadia.dtb: /plb/opb/spi@ef603500: failed to match any schema with compatible: ['amcc,spi-405ez']
   arch/powerpc/boot/dts/acadia.dtb: /plb/ebc: failed to match any schema with compatible: ['ibm,ebc-405ez', 'ibm,ebc']
   arch/powerpc/boot/dts/acadia.dtb: /plb/ebc: failed to match any schema with compatible: ['ibm,ebc-405ez', 'ibm,ebc']
--
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/ethernet@ef600f00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/ethernet@ef600f00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/opb/ethernet@ef600f00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
>> arch/powerpc/boot/dts/bamboo.dtb: usb@ef601000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/bamboo.dtb: usb@ef601000: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/bamboo.dtb: /plb/pci@ec000000: failed to match any schema with compatible: ['ibm,plb440ep-pci', 'ibm,plb-pci']
   arch/powerpc/boot/dts/bamboo.dtb: /plb/pci@ec000000: failed to match any schema with compatible: ['ibm,plb440ep-pci', 'ibm,plb-pci']
--
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/crypto@180000: failed to match any schema with compatible: ['amcc,ppc460ex-crypto', 'amcc,ppc4xx-crypto']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/crypto@180000: failed to match any schema with compatible: ['amcc,ppc460ex-crypto', 'amcc,ppc4xx-crypto']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/hwrng@110000: failed to match any schema with compatible: ['amcc,ppc460ex-rng', 'ppc4xx-rng']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/hwrng@110000: failed to match any schema with compatible: ['amcc,ppc460ex-rng', 'ppc4xx-rng']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-460ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/canyonlands.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-460ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/canyonlands.dtb: ehci@bffd0400: $nodename:0: 'ehci@bffd0400' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: ehci@bffd0400: reg: [[4, 3221029888, 144], [4, 3221030032, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: usb@bffd0000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/canyonlands.dtb: usb@bffd0000: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: usbotg@bff80000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: usbotg@bff80000: interrupts: [[0], [1], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: usbotg@bff80000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: usbotg@bff80000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/powerpc/boot/dts/canyonlands.dtb: usbotg@bff80000: '#address-cells', '#interrupt-cells', '#size-cells', 'interrupt-map' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/powerpc/boot/dts/charon.dts:206.13-210.5: Warning (simple_bus_reg): /localbus/mram0@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/charon.dts:125.17-131.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/charon.dtb: /: failed to match any schema with compatible: ['anon,charon']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200-immr']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200-pic']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/charon.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/charon.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/charon.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/charon.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/serial@2000: failed to match any schema with compatible: ['fsl,mpc5200-psc-uart']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/serial@2400: failed to match any schema with compatible: ['fsl,mpc5200-psc-uart']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/ethernet@3000: failed to match any schema with compatible: ['fsl,mpc5200-fec']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/mdio@3000: failed to match any schema with compatible: ['fsl,mpc5200-mdio']
--
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/cm5200.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/cm5200.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/cm5200.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/cm5200.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-uart', 'fsl,mpc5200-psc-uart']
--
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/digsy_mtc.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/digsy_mtc.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/digsy_mtc.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/digsy_mtc.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc', 'fsl,mpc5200-psc']
--
   arch/powerpc/boot/dts/fsp2.dtb: mmc@20c0000: pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/mmc@20c0000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/mmc@20c0000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/opb: failed to match any schema with compatible: ['ibm,opb']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/opb/ethernet@b0000000: failed to match any schema with compatible: ['ibm,emac4sync']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/opb/ethernet@b0000100: failed to match any schema with compatible: ['ibm,emac4sync']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/opb/rgmii@b0000600: failed to match any schema with compatible: ['ibm,rgmii']
   arch/powerpc/boot/dts/fsp2.dtb: serial@b0020000: Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsp2.dtb: ohci@2040000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/fsp2.dtb: ohci@2040000: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/fsp2.dtb: ohci@2080000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/fsp2.dtb: ohci@2080000: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/fsp2.dtb: ehci@2000000: $nodename:0: 'ehci@2000000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
--
   arch/powerpc/boot/dts/haleakala.dtb: cpus: cpu@0:timebase-frequency: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/haleakala.dtb: /interrupt-controller: failed to match any schema with compatible: ['ibm,uic-405exr', 'ibm,uic']
   arch/powerpc/boot/dts/haleakala.dtb: /interrupt-controller: failed to match any schema with compatible: ['ibm,uic-405exr', 'ibm,uic']
   arch/powerpc/boot/dts/haleakala.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-405exr', 'ibm,uic']
   arch/powerpc/boot/dts/haleakala.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-405exr', 'ibm,uic']
   arch/powerpc/boot/dts/haleakala.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-405exr', 'ibm,uic']
   arch/powerpc/boot/dts/haleakala.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-405exr', 'ibm,uic']
   arch/powerpc/boot/dts/haleakala.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-405exr', 'ibm,plb4']
   arch/powerpc/boot/dts/haleakala.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-405exr', 'ibm,plb4']
>> arch/powerpc/boot/dts/haleakala.dtb: memory-controller: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ibm,sdram-405exr', 'ibm,sdram-4xx-ddr2'] is too long
   	'ibm,sdram-405exr' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'ibm,sdram-405exr' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'ibm,sdram-405exr' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'ibm,sdram-405exr' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'ibm,sdram-405exr' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'ibm,sdram-405exr' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'ibm,sdram-405exr' is not one of ['mti,ranchu']
   	'ibm,sdram-405exr' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/haleakala.dtb: memory-controller: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/haleakala.dtb: memory-controller: 'dcr-reg', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/haleakala.dtb: /plb/memory-controller: failed to match any schema with compatible: ['ibm,sdram-405exr', 'ibm,sdram-4xx-ddr2']
   arch/powerpc/boot/dts/haleakala.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-405exr', 'ibm,mcmal2']
   arch/powerpc/boot/dts/haleakala.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-405exr', 'ibm,mcmal2']
   arch/powerpc/boot/dts/haleakala.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-405exr', 'ibm,opb']
   arch/powerpc/boot/dts/haleakala.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-405exr', 'ibm,opb']
   arch/powerpc/boot/dts/haleakala.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-405exr', 'ibm,ebc']
   arch/powerpc/boot/dts/haleakala.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-405exr', 'ibm,ebc']
   arch/powerpc/boot/dts/haleakala.dtb: nor_flash@0,0: $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/kilauea.dtb: /interrupt-controller: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/kilauea.dtb: /interrupt-controller: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/kilauea.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/kilauea.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/kilauea.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/kilauea.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/kilauea.dtb: /cpm: failed to match any schema with compatible: ['ibm,cpm']
   arch/powerpc/boot/dts/kilauea.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-405ex', 'ibm,plb4']
   arch/powerpc/boot/dts/kilauea.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-405ex', 'ibm,plb4']
>> arch/powerpc/boot/dts/kilauea.dtb: memory-controller: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ibm,sdram-405ex', 'ibm,sdram-4xx-ddr2'] is too long
   	'ibm,sdram-405ex' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'ibm,sdram-405ex' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'ibm,sdram-405ex' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'ibm,sdram-405ex' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'ibm,sdram-405ex' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'ibm,sdram-405ex' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'ibm,sdram-405ex' is not one of ['mti,ranchu']
   	'ibm,sdram-405ex' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/kilauea.dtb: memory-controller: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/kilauea.dtb: memory-controller: 'dcr-reg', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/kilauea.dtb: /plb/memory-controller: failed to match any schema with compatible: ['ibm,sdram-405ex', 'ibm,sdram-4xx-ddr2']
   arch/powerpc/boot/dts/kilauea.dtb: /plb/crypto@ef700000: failed to match any schema with compatible: ['amcc,ppc405ex-crypto', 'amcc,ppc4xx-crypto']
   arch/powerpc/boot/dts/kilauea.dtb: /plb/crypto@ef700000: failed to match any schema with compatible: ['amcc,ppc405ex-crypto', 'amcc,ppc4xx-crypto']
   arch/powerpc/boot/dts/kilauea.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-405ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/kilauea.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-405ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/kilauea.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-405ex', 'ibm,opb']
   arch/powerpc/boot/dts/kilauea.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-405ex', 'ibm,opb']
   arch/powerpc/boot/dts/kilauea.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-405ex', 'ibm,ebc']
   arch/powerpc/boot/dts/kilauea.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-405ex', 'ibm,ebc']
--
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@640: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@650: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@660: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@670: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/rtc@800: failed to match any schema with compatible: ['fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/lite5200.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/lite5200.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/lite5200.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/lite5200.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/serial@2000: failed to match any schema with compatible: ['fsl,mpc5200-psc-uart']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/ethernet@3000: failed to match any schema with compatible: ['fsl,mpc5200-fec']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/mdio@3000: failed to match any schema with compatible: ['fsl,mpc5200-mdio']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/ata@3a00: failed to match any schema with compatible: ['fsl,mpc5200-ata']
--
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/lite5200b.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/lite5200b.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/lite5200b.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/lite5200b.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/lite5200b.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-uart', 'fsl,mpc5200-psc-uart']
--
   arch/powerpc/boot/dts/makalu.dtb: cpus: cpu@0:timebase-frequency: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/makalu.dtb: /interrupt-controller: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/makalu.dtb: /interrupt-controller: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/makalu.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/makalu.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/makalu.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/makalu.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/makalu.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-405ex', 'ibm,plb4']
   arch/powerpc/boot/dts/makalu.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-405ex', 'ibm,plb4']
>> arch/powerpc/boot/dts/makalu.dtb: memory-controller: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ibm,sdram-405ex', 'ibm,sdram-4xx-ddr2'] is too long
   	'ibm,sdram-405ex' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'ibm,sdram-405ex' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'ibm,sdram-405ex' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'ibm,sdram-405ex' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'ibm,sdram-405ex' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'ibm,sdram-405ex' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'ibm,sdram-405ex' is not one of ['mti,ranchu']
   	'ibm,sdram-405ex' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/makalu.dtb: memory-controller: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/makalu.dtb: memory-controller: 'dcr-reg', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/makalu.dtb: /plb/memory-controller: failed to match any schema with compatible: ['ibm,sdram-405ex', 'ibm,sdram-4xx-ddr2']
   arch/powerpc/boot/dts/makalu.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-405ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/makalu.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-405ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/makalu.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-405ex', 'ibm,opb']
   arch/powerpc/boot/dts/makalu.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-405ex', 'ibm,opb']
   arch/powerpc/boot/dts/makalu.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-405ex', 'ibm,ebc']
   arch/powerpc/boot/dts/makalu.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-405ex', 'ibm,ebc']
   arch/powerpc/boot/dts/makalu.dtb: nor_flash@0,0: $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/media5200.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/media5200.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/media5200.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/media5200.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc', 'fsl,mpc5200-psc']
--
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/motionpro.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/motionpro.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/motionpro.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/motionpro.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-uart', 'fsl,mpc5200-psc-uart']
--
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: localbus@e0005000: flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: localbus@e0005000: upm@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: localbus@e0005000: display@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8360-localbus', 'fsl,pq2pro-localbus', 'simple-bus']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8360-localbus', 'fsl,pq2pro-localbus', 'simple-bus']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /localbus@e0005000/upm@1,0: failed to match any schema with compatible: ['fsl,upm-nand']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /localbus@e0005000/upm@1,0/flash: failed to match any schema with compatible: ['st,nand512-a']
>> arch/powerpc/boot/dts/mpc836x_rdk.dtb: display@2,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fujitsu,MB86277', 'fujitsu,mint'] is too long
   	'fujitsu,MB86277' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fujitsu,MB86277' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fujitsu,MB86277' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fujitsu,MB86277' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fujitsu,MB86277' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fujitsu,MB86277' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fujitsu,MB86277' is not one of ['mti,ranchu']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/mpc836x_rdk.dtb: display@2,0: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/mpc836x_rdk.dtb: display@2,0: 'address', 'depth', 'device_type', 'fujitsu,sh3', 'height', 'linebytes', 'little-endian', 'reg', 'width' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8360-pci', 'fsl,mpc8349-pci']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8360-pci', 'fsl,mpc8349-pci']
--
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/mucmc52.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/mucmc52.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/mucmc52.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-uart', 'fsl,mpc5200-psc-uart']
--
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/o2d.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2d.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2d.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2d.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2d.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-spi', 'fsl,mpc5200-psc-spi']
--
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/o2d300.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2d300.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2d300.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2d300.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2d300.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-spi', 'fsl,mpc5200-psc-spi']
--
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/o2dnt2.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2dnt2.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2dnt2.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2dnt2.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2dnt2.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-spi', 'fsl,mpc5200-psc-spi']
--
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/o2i.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2i.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2i.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2i.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2i.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-spi', 'fsl,mpc5200-psc-spi']
--
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/o2mnt.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2mnt.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o2mnt.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o2mnt.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o2mnt.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-spi', 'fsl,mpc5200-psc-spi']
--
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/o3dnt.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o3dnt.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/o3dnt.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/o3dnt.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/o3dnt.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-spi', 'fsl,mpc5200-psc-spi']
--
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/powerpc/boot/dts/obs600.dtb: /interrupt-controller: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/obs600.dtb: /interrupt-controller: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/obs600.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/obs600.dtb: /interrupt-controller1: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/obs600.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/obs600.dtb: /interrupt-controller2: failed to match any schema with compatible: ['ibm,uic-405ex', 'ibm,uic']
   arch/powerpc/boot/dts/obs600.dtb: /cpm: failed to match any schema with compatible: ['ibm,cpm']
   arch/powerpc/boot/dts/obs600.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-405ex', 'ibm,plb4']
   arch/powerpc/boot/dts/obs600.dtb: /plb: failed to match any schema with compatible: ['ibm,plb-405ex', 'ibm,plb4']
>> arch/powerpc/boot/dts/obs600.dtb: memory-controller: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ibm,sdram-405ex', 'ibm,sdram-4xx-ddr2'] is too long
   	'ibm,sdram-405ex' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'ibm,sdram-405ex' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'ibm,sdram-405ex' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'ibm,sdram-405ex' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'ibm,sdram-405ex' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'ibm,sdram-405ex' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'ibm,sdram-405ex' is not one of ['mti,ranchu']
   	'ibm,sdram-405ex' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/obs600.dtb: memory-controller: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/obs600.dtb: memory-controller: 'dcr-reg', 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/obs600.dtb: /plb/memory-controller: failed to match any schema with compatible: ['ibm,sdram-405ex', 'ibm,sdram-4xx-ddr2']
   arch/powerpc/boot/dts/obs600.dtb: /plb/crypto@ef700000: failed to match any schema with compatible: ['amcc,ppc405ex-crypto', 'amcc,ppc4xx-crypto']
   arch/powerpc/boot/dts/obs600.dtb: /plb/crypto@ef700000: failed to match any schema with compatible: ['amcc,ppc405ex-crypto', 'amcc,ppc4xx-crypto']
   arch/powerpc/boot/dts/obs600.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-405ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/obs600.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-405ex', 'ibm,mcmal2']
   arch/powerpc/boot/dts/obs600.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-405ex', 'ibm,opb']
   arch/powerpc/boot/dts/obs600.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-405ex', 'ibm,opb']
   arch/powerpc/boot/dts/obs600.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-405ex', 'ibm,ebc']
   arch/powerpc/boot/dts/obs600.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-405ex', 'ibm,ebc']
--
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/pcm030.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/pcm030.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/pcm030.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/pcm030.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['mpc5200b-psc-ac97', 'fsl,mpc5200b-psc-ac97']
--
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/pcm032.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/pcm032.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/pcm032.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/pcm032.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-ac97', 'fsl,mpc5200-psc-ac97']
--
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/i2c@ef600800: failed to match any schema with compatible: ['ibm,iic-440ep', 'ibm,iic-440gp', 'ibm,iic']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/ethernet@ef600f00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/ethernet@ef600f00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/opb/ethernet@ef600f00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
>> arch/powerpc/boot/dts/sam440ep.dtb: usb@ef601000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/sam440ep.dtb: usb@ef601000: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/pci@ec000000: failed to match any schema with compatible: ['ibm,plb440ep-pci', 'ibm,plb-pci']
   arch/powerpc/boot/dts/sam440ep.dtb: /plb/pci@ec000000: failed to match any schema with compatible: ['ibm,plb440ep-pci', 'ibm,plb-pci']
--
   arch/powerpc/boot/dts/sequoia.dtb: /plb/sdram: failed to match any schema with compatible: ['ibm,sdram-440epx', 'ibm,sdram-44x-ddr2denali']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/sdram: failed to match any schema with compatible: ['ibm,sdram-440epx', 'ibm,sdram-44x-ddr2denali']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/crypto@e0100000: failed to match any schema with compatible: ['amcc,ppc440epx-crypto', 'amcc,ppc4xx-crypto']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/crypto@e0100000: failed to match any schema with compatible: ['amcc,ppc440epx-crypto', 'amcc,ppc4xx-crypto']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/rng@e0120000: failed to match any schema with compatible: ['amcc,ppc440epx-rng', 'amcc,ppc4xx-rng']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/rng@e0120000: failed to match any schema with compatible: ['amcc,ppc440epx-rng', 'amcc,ppc4xx-rng']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/dma: failed to match any schema with compatible: ['ibm,dma-440epx', 'ibm,dma-4xx']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/dma: failed to match any schema with compatible: ['ibm,dma-440epx', 'ibm,dma-4xx']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440epx', 'ibm,mcmal2']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/mcmal: failed to match any schema with compatible: ['ibm,mcmal-440epx', 'ibm,mcmal2']
>> arch/powerpc/boot/dts/sequoia.dtb: usb@e0000400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ibm,usb-ohci-440epx', 'ohci-be'] is too long
   	'ibm,usb-ohci-440epx' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'ibm,usb-ohci-440epx' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'ibm,usb-ohci-440epx' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'ibm,usb-ohci-440epx' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'ibm,usb-ohci-440epx' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'ibm,usb-ohci-440epx' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'ibm,usb-ohci-440epx' is not one of ['mti,ranchu']
   	'ibm,usb-ohci-440epx' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/sequoia.dtb: usb@e0000400: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/sequoia.dtb: usb@e0000400: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: /plb/usb@e0000400: failed to match any schema with compatible: ['ibm,usb-ohci-440epx', 'ohci-be']
   arch/powerpc/boot/dts/sequoia.dtb: ehci@e0000300: $nodename:0: 'ehci@e0000300' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/powerpc/boot/dts/sequoia.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440epx', 'ibm,opb']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/opb: failed to match any schema with compatible: ['ibm,opb-440epx', 'ibm,opb']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440epx', 'ibm,ebc']
   arch/powerpc/boot/dts/sequoia.dtb: /plb/opb/ebc: failed to match any schema with compatible: ['ibm,ebc-440epx', 'ibm,ebc']
   arch/powerpc/boot/dts/sequoia.dtb: nor_flash@0,0: $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
--
   arch/powerpc/boot/dts/socrates.dtb: localbus: nand@3,70: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/socrates.dtb: localbus: can@3,100: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/socrates.dtb: localbus: display@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/socrates.dtb: /localbus: failed to match any schema with compatible: ['fsl,mpc8544-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/socrates.dtb: /localbus: failed to match any schema with compatible: ['fsl,mpc8544-localbus', 'fsl,pq3-localbus', 'simple-bus']
   arch/powerpc/boot/dts/socrates.dtb: nor_flash@0,0: $nodename:0: 'nor_flash@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/socrates.dtb: display@2,0: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/socrates.dtb: display@2,0: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/socrates.dtb: /localbus/fpga-pic@3,10: failed to match any schema with compatible: ['abb,socrates-fpga-pic']
   arch/powerpc/boot/dts/socrates.dtb: /localbus/spi@3,60: failed to match any schema with compatible: ['abb,socrates-spi']
   arch/powerpc/boot/dts/socrates.dtb: /localbus/nand@3,70: failed to match any schema with compatible: ['abb,socrates-nand']
   arch/powerpc/boot/dts/socrates.dtb: /localbus/can@3,100: failed to match any schema with compatible: ['philips,sja1000']
   arch/powerpc/boot/dts/socrates.dtb: /pci@e0008000: failed to match any schema with compatible: ['fsl,mpc8540-pci']
--
   arch/powerpc/boot/dts/tqm5200.dts:178.13-185.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/tqm5200.dts:127.17-133.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/tqm5200.dtb: /: failed to match any schema with compatible: ['tqc,tqm5200']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000: failed to match any schema with compatible: ['fsl,mpc5200-immr']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/cdm@200: failed to match any schema with compatible: ['fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/interrupt-controller@500: failed to match any schema with compatible: ['fsl,mpc5200-pic']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/tqm5200.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/tqm5200.dtb: usb@1000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/tqm5200.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/tqm5200.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/serial@2000: failed to match any schema with compatible: ['fsl,mpc5200-psc-uart']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/serial@2200: failed to match any schema with compatible: ['fsl,mpc5200-psc-uart']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/serial@2400: failed to match any schema with compatible: ['fsl,mpc5200-psc-uart']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/ethernet@3000: failed to match any schema with compatible: ['fsl,mpc5200-fec']
--
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/can@900: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/can@980: failed to match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/gpio@b00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/gpio@c00: failed to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gpio-wkup']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/spi@f00: failed to match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
>> arch/powerpc/boot/dts/uc101.dtb: usb@1000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['adm1030', 'bmac+', 'heathrow-media-bay', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', 'max6690', 'ohare-media-bay', 'ohare-swim3', 'smu-sat', 'swim3']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-rng', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'mpc5200b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'ohci-be', 'ohci-bigendian', 'ohci-le']
   	'fsl,mpc5200b-ohci' is not one of ['bq4802', 'ds1287', 'isa-m5819p', 'isa-m5823p', 'm5819', 'sab82532', 'SUNW,bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,smbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf-mau']
   	'fsl,mpc5200b-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,uml']
   	'fsl,mpc5200b-ohci' is not one of ['audio-graph-card2-custom-sample', 'compat1', 'compat2', 'compat3', 'linux,spi-loopback-test', 'mailbox-test', 'regulator-virtual-consumer']
   	'fsl,mpc5200b-ohci' is not one of ['mti,ranchu']
   	'fsl,mpc5200b-ohci' is not one of ['fujitsu,coral', 'fujitsu,lime', 'fujitsu,MB86276', 'fujitsu,MB86277', 'fujitsu,MB86293', 'fujitsu,MB86294', 'fujitsu,mint', 'ibm,axon-msic', 'ibm,pmemory', 'ibm,pmemory-v2', 'ibm,power-rng', 'ibm,ppc4xx-spi', 'ibm,sdram-4xx-ddr2', 'ibm,secureboot', 'ibm,secureboot-v1', 'ibm,secureboot-v2', 'ibm,secvar-backend', 'sgy,gpio-halt', 'wrs,epld-localbus']
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/uc101.dtb: usb@1000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/usb@1000: failed to match any schema with compatible: ['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be']
   arch/powerpc/boot/dts/uc101.dtb: dma-controller@1200: '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/dma-controller@1200: failed to match any schema with compatible: ['fsl,mpc5200b-bestcomm', 'fsl,mpc5200-bestcomm']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/xlb@1f00: failed to match any schema with compatible: ['fsl,mpc5200b-xlb', 'fsl,mpc5200-xlb']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/psc@2000: failed to match any schema with compatible: ['fsl,mpc5200b-psc-uart', 'fsl,mpc5200-psc-uart']
--
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/gpio@ef600b00: failed to match any schema with compatible: ['ibm,ppc4xx-gpio']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/gpio@ef600c00: failed to match any schema with compatible: ['ibm,ppc4xx-gpio']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/power-leds: failed to match any schema with compatible: ['warp-power-leds']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/warp.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
>> arch/powerpc/boot/dts/warp.dtb: usb@ef601000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/warp.dtb: usb@ef601000: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
--
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/spi@ef600900: failed to match any schema with compatible: ['amcc,spi-440ep']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/emac-zmii@ef600d00: failed to match any schema with compatible: ['ibm,zmii-440ep', 'ibm,zmii-440gp', 'ibm,zmii']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/ethernet@ef600e00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/ethernet@ef600f00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/ethernet@ef600f00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/opb/ethernet@ef600f00: failed to match any schema with compatible: ['ibm,emac-440ep', 'ibm,emac-440gp', 'ibm,emac']
>> arch/powerpc/boot/dts/yosemite.dtb: usb@ef601000: 'broken-usage-of-incorrect-compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
>> arch/powerpc/boot/dts/yosemite.dtb: usb@ef601000: 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/yosemite.dtb: /plb/pci@ec000000: failed to match any schema with compatible: ['ibm,plb440ep-pci', 'ibm,plb-pci']
   arch/powerpc/boot/dts/yosemite.dtb: /plb/pci@ec000000: failed to match any schema with compatible: ['ibm,plb440ep-pci', 'ibm,plb-pci']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
