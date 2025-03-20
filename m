Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DD7221F03
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Mar 2025 22:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742509914; cv=none; b=YbNhjp/MUkX7bA8rJPHcwo30l6+o5cHb19Yzp33U102aVlDwexyDKg3RfDTV5m8z2VtlvpqZc/7xb/OTDwffSzJVHzNri17mraW25Lyap+racco61yvkh5dIq8B7l/XbLGtgb+MyYfnmnHK1fStUwdmv4QL1BGdihXvslmUv3dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742509914; c=relaxed/simple;
	bh=ft8iW4azfufGjfCFzlHC0MsveBbIfbaHUDjguDLJCRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pb1nid/N3m4uZswQfs8BQX+UN3TiiCe88PODO8WrcDAsZPurm6Y1Pa52tchv0cIwICPxioTo/tOy5BZtyZNuW+HBWfZjjYdPAfDoQS2HCUSkt+0HQuvQMH4Bl8L9I2SSRKli9bU/Ki3eNtkdRQtKWmSXFO8x7ze2re9HZls4WLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eq1M73oB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eq1M73oB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742509912; x=1774045912;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ft8iW4azfufGjfCFzlHC0MsveBbIfbaHUDjguDLJCRo=;
  b=Eq1M73oBP/IixiJikewZ37SPD8CfzFu4TkQP30OILbH5Edsl+yrJrWOH
   v34PCRB8kx2U7okKU86GQUDJAF9+/uwnsLAkkkJdVV2SkBelzI3srWovT
   ym0dYubqyrAcY2QI3gclGDQK7glhP7c6VT+X6IVdYmL5IF8s8i+/4rKcp
   LZZJ2Q8+KHGgD9ZEeR8tsYtydsTvBSuMbA3G0biRvwmlDlNWfWhdekDRi
   3IpHK6Q21UFfM0an2ekQi68kcHx83xzNPqWsQtjX47bqKk3UwD/dFW28L
   4m3Zc7A7Et+8JIAskulWS7GSkJsjPs7PNis0sz1ioh2+BfMa0e+DJCv4A
   A==;
X-CSE-ConnectionGUID: xv5BKK+jRi21AQpmjUnGJA==
X-CSE-MsgGUID: r3SuB62OTnSLWG8pYgp+JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="55149317"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="55149317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 15:31:39 -0700
X-CSE-ConnectionGUID: QSiYwG7sThqQ0S8mHxLKrw==
X-CSE-MsgGUID: EBfebRF4RkWS7SUroXrLgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="127912356"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2025 15:31:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvOQH-0000p9-1b;
	Thu, 20 Mar 2025 22:31:33 +0000
Date: Fri, 21 Mar 2025 06:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
Message-ID: <202503210631.KaRoBeqN-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-052-20250315 (https://download.01.org/0day-ci/archive/20250321/202503210631.KaRoBeqN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210631.KaRoBeqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503210631.KaRoBeqN-lkp@intel.com/

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
