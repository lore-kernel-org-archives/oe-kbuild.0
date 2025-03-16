Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8D7176AC5
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742156762; cv=none; b=E+2b9DI8DmMqYiCeA5AXNL4WC0lvC+AIxFoxbSgB2x+1C8rcAQrZinNjmLbbVx8V1aSNYLNbJHgI3Z8H/4+YwNiisZRyXk7jM9AlNMFpjq7u0prJ5sCwCkYez+0eOCkb+GXAtcMjI8quSR3s7KLXLfwEYplfTdj7k8oQOWy3dD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742156762; c=relaxed/simple;
	bh=qLNHjGl6MAG5XLiT2LGm7IWTZzZ8JZtOcVuDekzcPzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1jNLTMYA197Ol2alKD+82I3+rtcsjRabagJfT6HP4L482fnykS8B8Uz3IJOZGOz9fV8Y3/ZeOHt5RHYV8+4i9f4swJdkl/Jb+vbLr2tTp626ZZEPX90Cfnm0al/XLvNOdp6VG6rUzK7UtPvJgcb2zKpiyN1OVB/x/WpvmLe4TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnbK6TVt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnbK6TVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742156761; x=1773692761;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qLNHjGl6MAG5XLiT2LGm7IWTZzZ8JZtOcVuDekzcPzg=;
  b=dnbK6TVtRrhmw8jDWZ5ai84NeL45+NDM1x4gt2+JpNIZek4R7EOpffoF
   holl27S27UpRTCu/cpyBJsmucGIGp7zhCvGqig/d9bYt1X/bHMNU1pV7V
   8olI6tNR/je+F3sy4I+kXIQlVEiJroJgFWVTUlNGHeBm5WB4Uc5CxmYIR
   Xjmxy0OtrapulkppDy63+X6XVqS1RMwQWvodYBF0GG8QbI90GZOf/DOip
   YCIOXZmio0S3Owz23lVf4j7D6vOgWcm3GgO2zQlIT7i7ZOCQgz2VRl+5T
   Jpozz/qHP86Oq0/tDWEysc3Wj5sYZSjDAHjCxRZmz5vXJSe+OE/+gVK+B
   g==;
X-CSE-ConnectionGUID: 9c3KtHk3TBCCxDxaOSx1NQ==
X-CSE-MsgGUID: kK0hqUFBSlevbb0e7CCDZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="30831092"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="30831092"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 13:26:00 -0700
X-CSE-ConnectionGUID: RwM7bJX3SUCQu6sEmV/wRQ==
X-CSE-MsgGUID: bWFYn5ZKRkqrbhvb3YqHhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="158900507"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Mar 2025 13:25:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttuYV-000CE7-38;
	Sun, 16 Mar 2025 20:25:55 +0000
Date: Mon, 17 Mar 2025 04:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
Message-ID: <202503170426.DryKGsbf-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20250315 (https://download.01.org/0day-ci/archive/20250317/202503170426.DryKGsbf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503170426.DryKGsbf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503170426.DryKGsbf-lkp@intel.com/

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
