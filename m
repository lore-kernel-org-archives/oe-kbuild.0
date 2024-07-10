Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDDF190045
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720613553; cv=none; b=D/QrvyBrM4z/33Bcyn48VHiXptllCmoBnxd4R2/X+nvfficZxqt8iOkJC6n5Rl/vE6pcfNIsEO/TzACwfsVN9xDF+uItiadPTrtaWph9Y16fPLo1F7GRkcWZEb3dvr2JFuts/IjUsmuPmPAGDwHOx+rDpuSVaQ6TDX+f8UEVr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720613553; c=relaxed/simple;
	bh=qbjS1SYP0a7MLxtgCBgeYLgbtr6Npwkatm0dhoXsrio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JoQzPAxI1ddmrTsvPPPKvaXUuLafxPXPYF6F4A3Sj7AP21EsrT55tVfdxrVj8r6whwEexXCT+jMXlkSQR5A52BOq4uSe8bgTaY9B9lAm5ZMvHE1jjbjzImpRzXJHb/7bkx8/eVvH0VbWl6TrBElBdRVd4L4RKyZ7+FfhFLQLW7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXy0SppQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXy0SppQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720613549; x=1752149549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qbjS1SYP0a7MLxtgCBgeYLgbtr6Npwkatm0dhoXsrio=;
  b=IXy0SppQGIKBMQekFa9k4Xb/j2k9sKwI60gb25Lc7IMQfqgC+3S+GS4I
   FcESnmV5Jq9G1y/blnsrb6zeHX9knkW5RRmXlgM54dNyMeJArJMyrZeq9
   ORe1LZYeyMzp0ofcTIO3Gx2SwV6QRs3shz9FSsvmR//0BgMCxE/Ll9Id0
   ADRbpOHMu+YVP7CzgVZ4B7PvBRkHYdJi/wJQQl964jE1CY9hV/aMJVYgG
   asane0n3b9fsoD+gYRwa+3uFIREjxySrzN8WZK8V5u38iQ4z1dKrgyebL
   3fTTRJHJj0+47GT2PcjqpzKbkEg1yIY3kFjFoR/ZQ9VWRJOJRVc4vLNDM
   Q==;
X-CSE-ConnectionGUID: dNI4yq04Tq+h5BUm0f4XHQ==
X-CSE-MsgGUID: 88OjzaPcTfe3WnSgFy8OcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29088328"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="29088328"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 05:12:29 -0700
X-CSE-ConnectionGUID: oujl5CD1Qdmw5SILtMr/Yw==
X-CSE-MsgGUID: NCaEUivRT3iXpYMz2U68/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="48857844"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jul 2024 05:12:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRWBM-000XpC-22;
	Wed, 10 Jul 2024 12:12:24 +0000
Date: Wed, 10 Jul 2024 20:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 32/43]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi2spi@1c00: spi@0:
 False schema does not allow {'reg': [[0]], '#address-cells': [[1]],
 '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]],
 'at25,addr-mode': [[4]], 'at25,page-size': [[256]...
Message-ID: <202407102022.5n3w3TQD-lkp@intel.com>
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
TO: Eddie James <eajames@linux.ibm.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   9ca5a7d9d2e05de6b80676c4289575f2762fcf68
commit: 66122c0fa9fa881e2b813d4bde7221fdf593d103 [32/43] dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240710/202407102022.5n3w3TQD-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407102022.5n3w3TQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407102022.5n3w3TQD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/bus@1e78a000/i2c-bus@700/pca9551@60: failed to match any schema with compatible: ['nxp,pca9551']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@a/eeprom@50: failed to match any schema with compatible: ['atmel,at30tse004a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@b/eeprom@50: failed to match any schema with compatible: ['atmel,at30tse004a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@c/eeprom@50: failed to match any schema with compatible: ['atmel,at30tse004a']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@d/eeprom@50: failed to match any schema with compatible: ['atmel,at30tse004a']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'pagesize' is a required property
--
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: failed to match any schema with compatible: ['ibm,p10-occ']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fsi-master-hub']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/scom@1000: failed to match any schema with compatible: ['ibm,fsi2pib']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema with compatible: ['ibm,fsi-i2c-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@4,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@4,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@4,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@4,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@5,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@5,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@5,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@5,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@6,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@6,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@6,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@6,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@7,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@7,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@7,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@7,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@e/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800/i2c-bus@f/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'pagesize' is a required property
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@10/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: '#address-cells', '#size-cells', 'cfam@0,0' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,i2cr-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2cr@20: #address-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/scom@1000: failed to match any schema with compatible: ['ibm,i2cr-scom']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800/i2c-bus@11/i2cr@20/cfam@0,0/sbefifo@2400: failed to match any schema with compatible: ['ibm,p9-sbefifo']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@0: False schema does not allow {'reg': [[0]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@20: False schema does not allow {'reg': [[32]], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@40: False schema does not allow {'reg': [[64]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: fsi2spi@1c00: spi@60: False schema does not allow {'reg': [[96]], 'compatible': ['ibm,fsi2spi'], '#address-cells': [[1]], '#size-cells': [[0]], 'eeprom@0': {'at25,byte-len': [[524288]], 'at25,addr-mode': [[4]], 'at25,page-size': [[256]], 'compatible': ['atmel,at25'], 'reg': [[0]], 'spi-max-frequency': [[1000000]]}}
   	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'pagesize' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'size' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'address-width' is a required property
   	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: eeprom@0: 'pagesize' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
