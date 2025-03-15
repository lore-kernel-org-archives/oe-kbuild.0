Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0B11DC9BE
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742045383; cv=none; b=fCrsCVOmOEP8OpF4reQdoWOGr5FETBQ7swu/EKfrZDkHd55chp13ABoVcmsRRrtZYoS5qTRsbTOUz0faI9V4Om0S4Fl4/iqOATq4RPs9jTCEyU+hoHDHX/+FuyFvK/VApGGYS4GlaZgqTM9OLtWKbSp3EhnC1/kwT43Je5V6WDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742045383; c=relaxed/simple;
	bh=AVQcA1M6gk+P1Nq2W1gEghWvJMt845kwOhC7gCpvACU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZS18POYzOJtkosQsJzrG1VjJw1mU2QFrGMEn2IaDZLcS+Vb/lESvdUf78bESYdq2o8FeTaJ7vWdohpQqN6mR4TjKtcqoF5KyLdnMPOqdpigOc87CVlottTkVMaDjYSzI4CXYzldhDYcC91OHpcUrIA7wxjczOfNbHzp+XpCWkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2SZT5l4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2SZT5l4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742045381; x=1773581381;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AVQcA1M6gk+P1Nq2W1gEghWvJMt845kwOhC7gCpvACU=;
  b=Y2SZT5l4qAF6iWhOqUvBWe3KBXvbgClIInhSENcXXbhmJGF74vmA1dx1
   MVVNXjmbofLKvBp+fRKNh6Vxu7D4rQPjWx97ueCvivs1pCV943QfdT98X
   m/E8LVijMZfQp9GPchGJUvT5okRiTnqb5kfflPNnz6Pqfd0TDWXvS+yz5
   YWHYnFCAhmjqBu2rOd9CLm2lLjT0059DZYQ6g7PSIt5j+ZmgG0EZTOzz0
   z6awL9beVZ48+FuYGXePbrXaPSKrHjoF35/FW6Bg3PqhuDVb9x17lDtTK
   AevLh9tWTEeE8wqXRLcuuAMwcuG3vaIkNOv6sDZqYbdNMizBQ7C2pPSEc
   w==;
X-CSE-ConnectionGUID: gSYhtOhwQWii1DD8e9mrxA==
X-CSE-MsgGUID: R6QsLOPyQ6qsNb9bx9hGJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="46837642"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="46837642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 06:29:39 -0700
X-CSE-ConnectionGUID: A7JwC3pASCqQ6313troicQ==
X-CSE-MsgGUID: TCoyIVfmSgifsFSZu20Gsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121248601"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Mar 2025 06:29:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttRZr-000BM9-0E;
	Sat, 15 Mar 2025 13:29:26 +0000
Date: Sat, 15 Mar 2025 21:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
Message-ID: <202503152045.rJmi9xMv-lkp@intel.com>
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
In-Reply-To: <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
References: <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Crystal Wood <oss@buserror.net>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Naveen N Rao <naveen@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-mtd@lists.infradead.org
CC: linuxppc-dev@lists.ozlabs.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/dt-bindings-mtd-raw-nand-chip-Relax-node-name-pattern/20250314-053651
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250313-ppcyaml-elbc-v4-1-55903722d9ea%40posteo.net
patch subject: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name pattern
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250315 (https://download.01.org/0day-ci/archive/20250315/202503152045.rJmi9xMv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503152045.rJmi9xMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503152045.rJmi9xMv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: ohci@500000: Unevaluated properties are not allowed ('clock-names', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: /ahb/ohci@500000: failed to match any schema with compatible: ['atmel,at91rm9200-ohci', 'usb-ohci']
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,at91sam9260-ebi']
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,at91sam9260-nand-controller']
>> arch/arm/boot/dts/microchip/at91sam9260ek.dtb: nand@40000000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
>> arch/arm/boot/dts/microchip/at91sam9260ek.dtb: nand@40000000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: i2c-gpio-0: 'sda-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/microchip/at91sam9260ek.dtb: i2c-gpio-0: 'scl-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: ohci@500000: Unevaluated properties are not allowed ('clock-names', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: /ahb/ohci@500000: failed to match any schema with compatible: ['atmel,at91rm9200-ohci', 'usb-ohci']
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,at91sam9260-ebi']
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: nand-controller: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: nand-controller: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,at91sam9260-nand-controller']
>> arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: nand@40000000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
>> arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: nand@40000000: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: i2c-gpio-0: 'sda-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/microchip/at91-sam9_l9260.dtb: i2c-gpio-0: 'scl-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
