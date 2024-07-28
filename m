Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D13A7470
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jul 2024 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722202766; cv=none; b=BivsCDGdED84Kj/WF3Sz6wzdOo2jlLDlASy7PtKy1i3yiykHvw59nGFeRADLW6chSU9ua+Wm0GJrnftniBDpxhJCOOppvLxrgBtQKqfqwZ2bEOkaQMBcqpjVzYsKsB17VMo9T26mgcA8ZCKf8bwOjHiPWnqnn3IefFV180WuYgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722202766; c=relaxed/simple;
	bh=ZQVIZ0Zif2InYHImGlN9z1ovA3akMwPz9jTjmR76jYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CuvHhtr6A+PxJ/JBTMio95J/uPMEXWKWeAvDO19x1KEQhQh0u6OkRL1GfVovgm5vhG1zqler4aZVj1ngL/Lb6Nlp7h8SGSMAKKNL2bFBCRXnHP8fiYrJVsWC9xtpkBTosauNuKYfw40zntfj+iLllLOnCJZHtzuq9qUEgcmgW/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNNrwWWs; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNNrwWWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722202764; x=1753738764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZQVIZ0Zif2InYHImGlN9z1ovA3akMwPz9jTjmR76jYE=;
  b=gNNrwWWskuGgmU2bnLhfxCsbwo45qpCzFXa1TisUjR5qWULqnGgwz3Yy
   Z+IVUlucW4AQJBwVaAQTP9amh4wGqOh+UYV1bGG6NBvYtERHtyOamIrPO
   HuyQGLFiKanwtTg9SmfU6uWTpdEO6WtKgCnbxW3PuswbjCVqru//q+18o
   gZOvlclzaJCnvoIV2wjwEqblEOmcc4OK2OJ14jcPXv0JSpUx5uYawujCk
   ikpJk0+m9BNCLv6G6+xgYy9O7LqcqL+1OyaV7NUGB22ugJXIJzYlc0UPX
   OCLM/5XGjZcm735VZiQsBQEtyU+m7K708cqKAHuXHzLmthWJPkW1IX7TC
   Q==;
X-CSE-ConnectionGUID: cNd6kAunRf+srwn1tMHAwg==
X-CSE-MsgGUID: UlXYn+mdQHSb+phv5fMyrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="19733376"
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="19733376"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 14:39:23 -0700
X-CSE-ConnectionGUID: IeNNy99BTtmZqGGPX4LnzA==
X-CSE-MsgGUID: Skan1bHIQVqxtp4e0mHe3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="54008660"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jul 2024 14:39:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYBbr-000rAI-2u;
	Sun, 28 Jul 2024 21:39:19 +0000
Date: Mon, 29 Jul 2024 05:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rafael-pm:bleeding-edge 1/2]
 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/tmu@1f00000: failed to match
 any schema with compatible: ['fsl,qoriq-tmu']
Message-ID: <202407290750.yHEf7P7L-lkp@intel.com>
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
CC: linux-acpi@vger.kernel.org
CC: devel@acpica.org
CC: linux-pm@vger.kernel.org
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   d138ebca836ae9753a88fe6824bcbfeed2f4aef0
commit: cdcda4575c5b569276d315acdafa95d03b5649b4 [1/2] Merge branch 'thermal/bleeding-edge' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/thermal/linux into bleeding-edge
:::::: branch date: 5 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20240723 (https://download.01.org/0day-ci/archive/20240729/202407290750.yHEf7P7L-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407290750.yHEf7P7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407290750.yHEf7P7L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:920.32-938.5: Warning (simple_bus_reg): /soc/dma-controller@8390000: simple-bus unit address format error, expected "8388000"
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: esdhc@1560000: compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
>> arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/tmu@1f00000: failed to match any schema with compatible: ['fsl,qoriq-tmu']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: adc@35: '#io-channel-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max1238.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-iot.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
--
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: aliases: 'enet0_rgmii_phy', 'enet1_rgmii_phy', 'enet2_rgmii_phy' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/spi@1550000/flash@0: failed to match any schema with compatible: ['spansion,s25fl064l', 'spansion,s25fl164k']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: esdhc@1560000: compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/tmu@1f00000: failed to match any schema with compatible: ['fsl,qoriq-tmu']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: sai@2b60000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
--
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: mdio-mux-emi1: mdio@80:reg:0:0: 128 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000: compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
>> arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/tmu@1f00000: failed to match any schema with compatible: ['fsl,qoriq-tmu']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/spi@2100000/at45db021d@0: failed to match any schema with compatible: ['atmel,at45db021d', 'atmel,at45', 'atmel,dataflash']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/spi@2100000/at45db021d@0: failed to match any schema with compatible: ['atmel,at45db021d', 'atmel,at45', 'atmel,dataflash']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/spi@2100000/at45db021d@0: failed to match any schema with compatible: ['atmel,at45db021d', 'atmel,at45', 'atmel,dataflash']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: sai@2b50000: dma-names:1: 'tx' was expected
--
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi:67.19-106.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1550000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: esdhc@1560000: compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
>> arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/tmu@1f00000: failed to match any schema with compatible: ['fsl,qoriq-tmu']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: sai@2b50000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
--
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts:41.29-104.4: Warning (avoid_unnecessary_addr_size): /soc/spi@2100000/ethernet-switch@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: memory-controller@1080000: 'big-endian' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: esdhc@1560000: compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
>> arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/tmu@1f00000: failed to match any schema with compatible: ['fsl,qoriq-tmu']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: ethernet-switch@1: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
--
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ddr.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000: compatible:0: 'fsl,ls1021a-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000: $nodename:0: 'esdhc@1560000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: esdhc@1560000: Unevaluated properties are not allowed ('big-endian', 'bus-width', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/esdhc@1560000: failed to match any schema with compatible: ['fsl,ls1021a-esdhc', 'fsl,esdhc']
>> arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/tmu@1f00000: failed to match any schema with compatible: ['fsl,qoriq-tmu']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@29d0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@29e0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@29f0000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: /soc/counter@2a00000: failed to match any schema with compatible: ['fsl,ftm-quaddec']
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian', 'clock-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b50000: dma-names:1: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
   arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: sai@2b50000: Unevaluated properties are not allowed ('dma-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
