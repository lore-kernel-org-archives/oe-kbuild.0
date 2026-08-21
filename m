Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D13C3C02
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 04:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288269; cv=none; b=ZKvT6PoDPfmM5Jr+bdUNUsBgXbhI03pA/niGtXJR8sttagzOyZGh0GCFf5QQtcZGW/TJnJ1U84Bg5ttNVKpfCdpLHIxiBQg0uZX6swPb62uvGqXcwhPkVjEH++75nf6w/KRsFb8iIC+c5G7IvBwqOFw7RNIJykIhrPs5KZEXM/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288269; c=relaxed/simple;
	bh=1dVXeDvIr3ivuv6Hl5AKFOM3wwaP8JMGdItr2NDNra4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hANSv2ElRX0isoSlcZ2hcT6F8Do3DcGa5943NguECyKI+b3y9gGxK1fMthjhbACsWBIeWlUx9iDTsUqoU/7wL/l8TmS81FjQ+L60pjAnoNMo0Pqbyf9rr+Kzv5XpHM3fFI9sWfjZ+LzIeLBtoJruFNq6TN1Pb2W6KDVWMZw0TWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdXpzj+N; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdXpzj+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787288264; x=1818824264;
  h=date:from:to:cc:subject:message-id;
  bh=1dVXeDvIr3ivuv6Hl5AKFOM3wwaP8JMGdItr2NDNra4=;
  b=RdXpzj+NAc88h7oV5ZEnSQWru75ITPcueNTPH9xdwQiFpClKBeFcPerD
   jAGUBmMheAkb8dSl6GHu1SdCIf6CjHDbrqBWj93Xp+IYyrxqK4sZgCfAC
   DwIf/pTzlED5cWGwNw4cBwn366vMHvdRlN3Dt5gIqcP1j/EogbmvU0Rwv
   tqEOvH2jwdni+IIG/Lv3Z2tHdW+GDeM/Un+wcwSFX1Vjhkv6Zv93L131M
   90XLGJuJsFGG6p2UaNLCb60DJM3zw7FaK9Xx95/ffsisgI5L8ytYmlmqt
   UE+XTU/3lMWrS7XHHQTFUDsU5+DeqFfxh+eLr9TWdGkODGDAFpJqbDtzV
   Q==;
X-CSE-ConnectionGUID: oxMggeGMSjSHV3zYuXP5hg==
X-CSE-MsgGUID: jWlS9P8qQriICL7a2UcScg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="75366293"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="75366293"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 21:57:43 -0700
X-CSE-ConnectionGUID: dGDoSgEhQJWBBxzvWDSlcA==
X-CSE-MsgGUID: gWAMiyB5QmC9JNJP2wBPOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="266833002"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2026 21:57:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxHJv-000000007en-2IZL;
	Fri, 21 Aug 2026 04:57:35 +0000
Date: Fri, 21 Aug 2026 06:57:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/mgcoge.dtb: flash@5,0 (cfi-flash):
 Unevaluated properties are not allowed ('partition@app' was unexpected)
Message-ID: <202608210647.ap2yyf4t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c84d3e3130dfe1058cb27dc78e7ad8bd36f0545a
commit: 1eb9fabd52933cdf9be349de5391920fac4ed30b dt-bindings: mtd: Ensure partition node properties are documented
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-2051-20260820 (https://download.01.org/0day-ci/archive/20260821/202608210647.ap2yyf4t-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210647.ap2yyf4t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1eb9fabd5293 ("dt-bindings: mtd: Ensure partition node properties are documented")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608210647.ap2yyf4t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mgcoge.dts:114.10-124.6: Warning (simple_bus_reg): /soc@f0000000/cpm@119c0/muram: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mgcoge.dts:170.15-185.6: Warning (simple_bus_reg): /soc@f0000000/cpm@119c0/mdio@10d40: simple-bus unit address format error, expected "10d00"
   arch/powerpc/boot/dts/mgcoge.dts:221.14-228.6: Warning (simple_bus_reg): /soc@f0000000/cpm@119c0/spi@11aa0: simple-bus unit address format error, expected "11a80"
   arch/powerpc/boot/dts/mgcoge.dts:105.13-230.5: Warning (interrupt_provider): /soc@f0000000/cpm@119c0: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/mgcoge.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/mgcoge.dtb: /: failed to match any schema with compatible: ['keymile,km82xx']
   arch/powerpc/boot/dts/mgcoge.dtb: / (keymile,km82xx): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: /localbus@f0010100: failed to match any schema with compatible: ['fsl,mpc8247-localbus', 'fsl,pq2-localbus', 'simple-bus']
   arch/powerpc/boot/dts/mgcoge.dtb: /localbus@f0010100: failed to match any schema with compatible: ['fsl,mpc8247-localbus', 'fsl,pq2-localbus', 'simple-bus']
>> arch/powerpc/boot/dts/mgcoge.dtb: flash@5,0 (cfi-flash): Unevaluated properties are not allowed ('partition@app' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: flash@5,0 (cfi-flash): 'partition@app' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000: failed to match any schema with compatible: ['fsl,mpc8247-immr', 'fsl,pq2-soc', 'simple-bus']
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000: failed to match any schema with compatible: ['fsl,mpc8247-immr', 'fsl,pq2-soc', 'simple-bus']
   arch/powerpc/boot/dts/mgcoge.dtb: cpm@119c0 (fsl,mpc8247-cpm): muram:ranges: [[0, 0, 65536]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: cpm@119c0 (fsl,mpc8247-cpm): $nodename:0: 'cpm@119c0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/mgcoge.dtb: /soc@f0000000/cpm@119c0: failed to match any schema with compatible: ['fsl,mpc8247-cpm', 'fsl,cpm2', 'simple-bus']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): '#gpio-cells' is a required property
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000 (fsl,mpc8572-gpio): '#gpio-cells' is a required property
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /localbus@fffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /localbus@ffe05000/pib@2,0: failed to match any schema with compatible: ['fsl,p1021mds-pib']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /localbus@ffe05000/pib@3,0: failed to match any schema with compatible: ['fsl,p1021mds-pib']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1021-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1021-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1025-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000 (fsl-usb2-dr-v1.6): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml
--
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: dcsr-cpu-sb-proxy@43000 (fsl,dcsr-e500mc-sb-proxy): cpu-handle: b'\x00\x00\x00\x0c' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: dcsr-cpu-sb-proxy@43000 (fsl,dcsr-e500mc-sb-proxy): cpu-handle: b'\x00\x00\x00\x0c' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@47000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@47000: failed to match any schema with compatible: ['fsl,dcsr-e500mc-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: dcsr-cpu-sb-proxy@47000 (fsl,dcsr-e500mc-sb-proxy): cpu-handle: b'\x00\x00\x00\x15' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@41000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@41000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: dcsr-cpu-sb-proxy@41000 (fsl,dcsr-e5500-sb-proxy): cpu-handle: b'\x00\x00\x00\t' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-cpu-sb-proxy@43000: failed to match any schema with compatible: ['fsl,dcsr-e5500-sb-proxy', 'fsl,dcsr-cpu-sb-proxy']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: dcsr-cpu-sb-proxy@43000 (fsl,dcsr-e5500-sb-proxy): cpu-handle: b'\x00\x00\x00\r' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: bman-portals@ff4000000 (simple-bus): $nodename:0: 'bman-portals@ff4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: qman-portals@ff4200000 (simple-bus): $nodename:0: 'qman-portals@ff4200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: soc@ffe000000 (simple-bus): soc-sram-error: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: flash@0 (spansion,s25sl12801): Unevaluated properties are not allowed ('partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: flash@0 (spansion,s25sl12801): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
