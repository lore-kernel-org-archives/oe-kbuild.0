Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99E1A953
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 16:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722789802; cv=none; b=Au2IuUqdRUJ4bTtVNR0UkZvmfpkb9x2uheDt0OzZcoA94XYnv82Ta9ip9aNQN7Xwr8e4p0VHcMSrucTuBzE5wfhd1FdNoKyol3vrpHY3ulr7U5jiQ8VSTj3k9UZbeFXduCIIT/x+K70xABU9dTSy+Yceln6eJ1RZ3P2zp0TE4MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722789802; c=relaxed/simple;
	bh=02V7g72KRZamNXaXQUaLn9RqfEUF63VXGJpbUdWI4IU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2hUX8sdWz2/Iwr5pK8+fMLoaAZL4KL9joo+UAf+yvOQD5EChwNAo7ERfIldKcplQjH1alv39eBQCxQ1MY9YuMDFwTa7DG6aIFGVDFq0s2YIzIQCTbeMlsFTbKlA7r/6GQhp21JH8nAltVCswlljHJjDQQgHu5stK8X9Yo8WkzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrCSg46h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrCSg46h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722789797; x=1754325797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=02V7g72KRZamNXaXQUaLn9RqfEUF63VXGJpbUdWI4IU=;
  b=NrCSg46hZq2boevnMwi6Uc0w7bylfZ+foIfKXfWPbQeDrAwinQbvc9lB
   ILVViER8SyylEhFBEkUzlN+Gq7ylLVnP3ErAprNWly9f6z5qLEW5m7IR3
   7GFuuAAgrB93LtB4YDAjC3n1xf4TJpyD1Wl8nsfyc2hC0ibD9R+GM9SZF
   8u6OGOazEVsQC7rblG08yO5l4WhRv1zizFtQhg0l97DSYIVoWCqte+oiM
   FguxajWHC4syOAMEnZ2Gd3m/fDnZie/fWHcs/70QS0X5wtSJjNT6BlqKo
   8roRcIdfTrJ9zxvV1pjUQwFE5ZZIt2TayG2QLREf8RgrLtczWZ4JLyZUC
   A==;
X-CSE-ConnectionGUID: MFC68+SyRUe+9UaHL7SZcA==
X-CSE-MsgGUID: 0aRifpTqSmS9Nm3OjaMYxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31405542"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="31405542"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 09:43:16 -0700
X-CSE-ConnectionGUID: K+5isuPITwmo6CYRkQpVYg==
X-CSE-MsgGUID: eRhRJB4dQfOGEEbU6O2ckg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="55884559"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Aug 2024 09:43:15 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saeK8-0001Xk-20;
	Sun, 04 Aug 2024 16:43:12 +0000
Date: Mon, 5 Aug 2024 00:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 02/10] arm64: dts: layerscape: rename rcpm as
 wakeup-control from power-control
Message-ID: <202408050009.3kVPTIyQ-lkp@intel.com>
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
In-Reply-To: <20240729-ls_warning_all-v2-2-942d80ddd441@nxp.com>
References: <20240729-ls_warning_all-v2-2-942d80ddd441@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-layerscape-rename-aux-bus-to-bus/20240730-031018
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240729-ls_warning_all-v2-2-942d80ddd441%40nxp.com
patch subject: [PATCH v2 02/10] arm64: dts: layerscape: rename rcpm as wakeup-control from power-control
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240805/202408050009.3kVPTIyQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050009.3kVPTIyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408050009.3kVPTIyQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: crypto@1700000: rtic@60000:reg: [[393216, 256], [396800, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: serial@0: Unevaluated properties are not allowed ('clock-sc16is7xx' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: crypto@1700000: rtic@60000:reg: [[393216, 256], [396800, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: pcie@3400000: Unevaluated properties are not allowed ('num-viewport' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: mmc@1580000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: crypto@1700000: rtic@60000:reg: [[393216, 256], [396800, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: pcie@3400000: Unevaluated properties are not allowed ('num-viewport' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-oxalis.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   	['en25s64', 'jedec,spi-nor'] is too long
   	'en25s64' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'en25s64' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: flash@2: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/spi@2100000/flash@2: failed to match any schema with compatible: ['en25s64', 'jedec,spi-nor']
   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: mmc@1560000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: mmc@1580000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: crypto@1700000: rtic@60000:reg: [[393216, 256], [396800, 24]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1012a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb: pwm-fan: 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3400000: fsl,pcie-scfg:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3500000: fsl,pcie-scfg:0: [23, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3600000: fsl,pcie-scfg:0: [23, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: fman@1a00000: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: fman@1a00000: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: fman@1a00000: ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3400000: fsl,pcie-scfg:0: [22, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3500000: fsl,pcie-scfg:0: [22, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3600000: fsl,pcie-scfg:0: [22, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: fman@1a00000: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: fman@1a00000: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: fman@1a00000: ethernet@e2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: watchdog@2ad0000: Unevaluated properties are not allowed ('big-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3400000: fsl,pcie-scfg:0: [25, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3500000: fsl,pcie-scfg:0: [25, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3600000: fsl,pcie-scfg:0: [25, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: compatible: ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: fman@1a00000: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: fman@1a00000: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: fman@1a00000: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
--
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/pcie_ep@3400000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/pcie_ep@3600000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: fman@1a00000: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: fman@1a00000: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: fman@1a00000: ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
--
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/pcie_ep@3400000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/pcie_ep@3600000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: fman@1a00000: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: fman@1a00000: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: fman@1a00000: ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
--
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/pcie_ep@3400000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/pcie_ep@3600000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: fman@1a00000: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: fman@1a00000: ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: fman@1a00000: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
--
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/pcie_ep@3400000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: pcie_ep@3500000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/pcie_ep@3500000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: pcie_ep@3600000: compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/pcie_ep@3600000: failed to match any schema with compatible: ['fsl,ls1046a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: dma-controller@8380000: compatible: ['fsl,ls1046a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: /soc/wakeup-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1046a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: fman@1a00000: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: fman@1a00000: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: fman@1a00000: ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls1088aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/pcie-ep@3600000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/memory-controller@2240000/board-control@2,0: failed to match any schema with compatible: ['fsl,ls1088ardb-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/pcie-ep@3600000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/pcie-ep@3600000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: fsl-mc@80c000000: dpmacs:ethernet@1: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: fsl-mc@80c000000: dpmacs:ethernet@2: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/misc/fsl,qoriq-mc.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: ethernet@1: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: ethernet@2: 'sfp' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,qoriq-mc-dpmac.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3400000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3400000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3500000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3500000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: pcie-ep@3600000: compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/pcie-ep@3600000: failed to match any schema with compatible: ['fsl,ls1088a-pcie-ep', 'fsl,ls-pcie-ep']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1088a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3500000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3600000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: pcie@3700000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: pcie@3500000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: pcie@3600000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: pcie@3700000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /: failed to match any schema with compatible: ['fsl,ls2081a-rdb', 'fsl,ls2081a']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /: failed to match any schema with compatible: ['fsl,ls2081a-rdb', 'fsl,ls2081a']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3400000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3500000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3600000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: pcie@3700000: compatible: ['fsl,ls2080a-pcie', 'fsl,ls2085a-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/memory-controller@2240000/board-control@3,0: failed to match any schema with compatible: ['fsl,ls208xaqds-fpga', 'fsl,fpga-qixis', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: mdio-mux-emi1@54: mdio@60:reg:0:0: 96 is greater than the maximum of 31
   	from schema $id: http://devicetree.org/schemas/net/mdio.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /syscon@1e60000: failed to match any schema with compatible: ['fsl,ls2080a-rstcr', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: thermal-zones: 'core-cluster1-thermal', 'core-cluster2-thermal', 'core-cluster3-thermal', 'core-cluster4-thermal' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,ls2080a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/memory-controller@2240000/nand@2,0: failed to match any schema with compatible: ['fsl,ifc-nand']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
   arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/memory-controller@2240000/cpld@3,0: failed to match any schema with compatible: ['fsl,ls2080aqds-fpga', 'fsl,fpga-qixis']
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls208xa-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@7/i2c-mux@75/i2c@0/spi@28: failed to match any schema with compatible: ['nxp,sc18is602b']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: can@2180000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: can@2190000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3400000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb: pcie@3500000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@7/i2c-mux@75/i2c@0/spi@28: failed to match any schema with compatible: ['nxp,sc18is602b']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: can@2180000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: can@2190000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3400000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb: pcie@3500000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: fan-temperature-ctrlr@18: '#cooling-cells', 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@2/regulator@5c: failed to match any schema with compatible: ['lltc,ltc3882']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3400000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: pcie@3500000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: fan-temperature-ctrlr@18: '#cooling-cells', 'cooling-max-state', 'cooling-min-state' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@2/regulator@5c: failed to match any schema with compatible: ['lltc,ltc3882']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3400000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb: pcie@3500000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3400000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: pcie@3500000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: can@2180000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: can@2190000: 'can-transceiver' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/can/fsl,flexcan.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3400000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb: pcie@3500000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3400000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dtb: pcie@3500000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/i2c@2000000/fpga@66: failed to match any schema with compatible: ['fsl,lx2160aqds-fpga', 'fsl,fpga-qixis-i2c', 'simple-mfd']
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3400000: interrupt-names: ['aer', 'pme', 'intr'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: pcie@3500000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi:41.18-55.4: Warning (avoid_unnecessary_addr_size): /soc/spi@20c0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi:1702.34-1774.5: Warning (avoid_unnecessary_addr_size): /soc/pinmux@70010012c: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: hub@1: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: hub@2: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-13bb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-65bb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-7777.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-85bb.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/usb@3100000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/usb@3110000: failed to match any schema with compatible: ['fsl,ls1028a-dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: dma-controller@8380000: compatible: ['fsl,ls1028a-qdma', 'fsl,ls1021a-qdma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: pcie@1f0000000: ranges: [[2181038080, 1, 4160749568, 1, 4160749568, 0, 1441792], [3254779904, 1, 4162191360, 1, 4162191360, 0, 458752], [2181038080, 1, 4162650112, 1, 4162650112, 0, 131072], [3254779904, 1, 4162781184, 1, 4162781184, 0, 131072], [2181038080, 1, 4162912256, 1, 4162912256, 0, 131072], [3254779904, 1, 4163043328, 1, 4163043328, 0, 131072], [2181038080, 1, 4227858432, 1, 4227858432, 0, 4194304]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: ethernet@0,4: compatible:0: 'pci1957,ee02' is not one of ['fsl,etsec-ptp', 'fsl,fman-ptp-timer', 'fsl,dpaa2-ptp', 'fsl,enetc-ptp']
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: ethernet@0,4: compatible: ['pci1957,ee02', 'fsl,enetc-ptp'] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds-899b.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,ls1028a-rcpm', 'fsl,qoriq-rcpm-2.1+']
--
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: interrupt-controller@6000000: msi-controller@6020000: '#msi-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: thermal-zones: 'ddr-cluster5-thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/syscon@1f70000: failed to match any schema with compatible: ['fsl,lx2160a-isc', 'syscon']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: /soc/wakeup-controller@1e34040: failed to match any schema with compatible: ['fsl,lx2160a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: hub@1: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: hub@2: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: pcie@3400000: reg-names:0: 'regs' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: pcie@3400000: reg-names:1: 'config' was expected
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a-12-11-x.dtb: pcie@3400000: interrupts: [[0, 108, 4], [0, 108, 4], [0, 108, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
