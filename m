Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD7D2F52
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 03:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720151241; cv=none; b=RRYvRvZFpT3iBCruVLm1gKAPKyZ+tTgHYq8MzRTbvLkvAwJEmSZiPu+DnQdGfrxey5fMJcdeFxvgUAgB+p5LjXKA/lvcPzMjR/nbnvatL2P0u3LzGRjdDL1cnvrgZ3UNYm0pFwzcqVJc3Rp2OscEXhHh4+KFVX9nYmTMQYj0M+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720151241; c=relaxed/simple;
	bh=1Py521Fua5amaF28Wn1apBcDYnGwqygPSOvjzYQNWeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFFeRrjoqjXsIDsaQnAcQ2m0UBEpbfLSLbqdszaPmMeSkWaw5bDZ+JNc+b1h3pZOKToFgx0lzFHiuruesKdnbUEFqTOIj8k3V1tKPLfLSDKXKtNJEYb2RKhFffGV/yKdymotx4GkBW286b93vOO8Es119m36nvCXG/+zHFFkD8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZdr0WTM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZdr0WTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720151239; x=1751687239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Py521Fua5amaF28Wn1apBcDYnGwqygPSOvjzYQNWeY=;
  b=EZdr0WTMdOTgk8xYHesJ5vQQ0UHsvifrzFUfp37hZpe3pTXKPQSyd3dx
   k1EIGogj5bye4onfQhIf7Xm0Bv1XwRTS0BHPcmi+1sqQ8rN/napHaxRR9
   anRz4yn7LhTpiRQGHfZi9n0z+9KLJZAnOlhbWduQtpNWy7NBmyC1sgC47
   hp3fsNTxE2MzAjvWhxaZGuurB0toM9c9cKMQvzjjzmYDObcxYyARHAj8d
   w3TlIBxg6JSM615qsfckx6e6ku9/7UYkHzuV6Uab5lIE3XLGGxlX9ccoj
   /CCc3vlqYY/SlVtzEuCdFsSSd6r7DiueJiuWar6N5qye7lSLd41N0CI/9
   g==;
X-CSE-ConnectionGUID: PIRgwRPmS1unmHZLC5cuhQ==
X-CSE-MsgGUID: 9AFqptbaTsS6kbF69j7lbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21245678"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="21245678"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 20:47:19 -0700
X-CSE-ConnectionGUID: 5XeSltyBR0iRbmfq8u6AYg==
X-CSE-MsgGUID: 56oTUygHS7m9/Z3tXFlZhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51940640"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2024 20:47:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPZul-000Rs4-0h;
	Fri, 05 Jul 2024 03:47:15 +0000
Date: Fri, 5 Jul 2024 11:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.10-rc 18/35]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: i2c@11003000:
 Unevaluated properties are not allowed ('compatible' was unexpected)
Message-ID: <202407051111.RUJ55I68-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rc
head:   16e22ff9e6052ffcab043b33e1ed0de08cdd2c64
commit: f1b553fc5cbd76d04645e3bebf7595d6a8dc2f5c [18/35] WIP: add BPi-R4
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-051-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051111.RUJ55I68-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051111.RUJ55I68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407051111.RUJ55I68-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: i2c@11003000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/i2c@11003000: failed to match any schema with compatible: ['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: i2c@11004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
--
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi@11007000: clock-names:3: 'hclk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi@11007000: Unevaluated properties are not allowed ('clock-names', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/spi@11007000: failed to match any schema with compatible: ['mediatek,ipm-spi-quad', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi_nand@0: $nodename:0: 'spi_nand@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi_nand@0: Unevaluated properties are not allowed ('partitions', 'spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000: volumes:ubi-volume-ubootenv:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:19: 'top_netsys_ppefb_250m_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:20: 'top_netsys_warp_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:21: 'xgp1' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:22: 'xgp2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:23: 'xgp3' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: mac@1: Unevaluated properties are not allowed ('phys' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: Unevaluated properties are not allowed ('mac@2', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: crypto@15600000: interrupts: [[0, 214, 4], [0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: crypto@15600000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: crypto@15600000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
