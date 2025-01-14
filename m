Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB844246342
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jan 2025 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736843309; cv=none; b=lAeA2KhQVacL6CatcLJkuke+JRGQfRD6cp96ZnlvlNzBvWJb/AyUKs3MJ+vWUpilOUr1JBiCBlKDb0l2DtrK1nJtOhQWEMeguD7E03N3cnX9OvspRtzhLj1S1eZLuirL5Xc25lGJVbaiEHnI4JRpv2EXg5/XNLOnNsaDJoSYSXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736843309; c=relaxed/simple;
	bh=LaEqJqayG032Lk8/nY4MJB8NtrMM4EA1kySQNcitVbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0ls9buZ162frMAxSldLl2I4g66avgdNbBztZBYAvJDbjGsaVySrmiHpdq4b/e6kYAWH+Jsxp+1TcAC0wcknxiHOphkAclfQj8G4IgICXcOcE9A+tODY/I5oJjPh5raiyaIqElTPCNBMxYmr5TN39XHxk3ySpqh1zlAO8k21RvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8ORjIzf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8ORjIzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736843307; x=1768379307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LaEqJqayG032Lk8/nY4MJB8NtrMM4EA1kySQNcitVbo=;
  b=l8ORjIzfTVWbq9iXaF0PN5xn6yB3/Ld091cF8G9LBKkG+GPWEE8s/o8/
   g7cHrN1w3DRrdyXFRMjnZWkm345P17jS42s3ADFu8+PgD4i5dSJ3YpfBd
   nHCQmeu0lb5MB89VQ5CdUFz5vNHXmcr47cGhtIfClHn4J9z2HRMsaCRLS
   9q9F8MRvTg7EBfpilKfqBaG06Hkae7do/Q4RAzROETFbBZdQF6xa5Lq2I
   14GQih7fqZsySDOODd95763ikl+Bxlw9N0g/T7uWTSTmtsCzxMHSCDC5Q
   KN2LT03b5q942geVYzQrywGIw7bvAUk4kRCoC4lGS3n3kWoZ2Fupl25I2
   Q==;
X-CSE-ConnectionGUID: i4LbsIIuT1K7bIXXcF6fcQ==
X-CSE-MsgGUID: lC9omiMTRMOfy2MtpmKH2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37241650"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37241650"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 00:28:27 -0800
X-CSE-ConnectionGUID: f72c/ww/RgyvVSTt8UmGug==
X-CSE-MsgGUID: YkapWUJfQqSDoRTIONoKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109879658"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jan 2025 00:28:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXcHf-000OHD-2l;
	Tue, 14 Jan 2025 08:28:23 +0000
Date: Tue, 14 Jan 2025 16:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [joel-bmc:for-next 42/55]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb:
 /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with
 compatible: ['aspeed,ast2600-smpmem']
Message-ID: <202501141656.vMPrqPjY-lkp@intel.com>
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
TO: Chanh Nguyen <chanh@os.amperecomputing.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git for-next
head:   3540adcccc7179d243216bf488532a62c37d9007
commit: de153911ffcb6d9a2800cd13cc60062ae118f2a4 [42/55] ARM: dts: aspeed: Add device tree for Ampere's Mt. Jefferson BMC
:::::: branch date: 6 days ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-053-20250111 (https://download.01.org/0day-ci/archive/20250114/202501141656.vMPrqPjY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141656.vMPrqPjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501141656.vMPrqPjY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /sdram@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: syscon@1e6e2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@560: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic0']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/syscon@1e6e2000/interrupt-controller@570: failed to match any schema with compatible: ['aspeed,ast2600-scu-ic1']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: adc@1e6e9000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: adc@1e6e9100: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: crypto@1e6fa000: 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2600-video-engine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: gpio@1e780000: 'ocp-aux-pwren-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: lpc@1e789000: lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: lpc@1e789000: reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: kcs@24: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: fsi@1e79b100: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
