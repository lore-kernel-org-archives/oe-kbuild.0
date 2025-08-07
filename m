Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F7A83A14
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754576511; cv=none; b=h0qE1wcZO5ozlHz4asV8mLZg66gQv4vx45J+6SQDAexufTpztQFZDGqgiV3aiywck8/fGJUm5i5515DSc1y/azYvExs9Mxe2GOedQqMzFOAdbq718V+j0UcLLuVKXxVcmvV6AK4hi+AcSsMWZiV5KNUgYBYNaFEDXQg2fRvPMD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754576511; c=relaxed/simple;
	bh=lwdbXyTVOJUPafOv7Nds13NzjRMQrot5FXO2miFl1Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P6ZTPWwad2WSq40XMgxhaXlQfH9KISwg/XWtURId3lgLpRPSmPU+C9zdLxoKYS/Qvf2D74nh/QBMl+LwWLp5lTCjHdz4pmiAcSlpl5F+oZjdAz5W81cD1fv2ElTBo77Kjj3iAFZaLIm9HJo3pHn1P1pn5lIU1GdAy4s9yIHz5Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJKQ95z6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJKQ95z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754576509; x=1786112509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwdbXyTVOJUPafOv7Nds13NzjRMQrot5FXO2miFl1Mw=;
  b=bJKQ95z6IC4HOHc/d8oE8/MabyR/OhmYRdjfW+zs+6qQRqPQzvdvgduV
   pMGfa8x0jehv0AOcTVg3o7fTrSoVw6Nvaeh3I+XJU/LJ1W97CjKSLuNDF
   SyGuF9T+2VVtniNYt6mgujNUOjEX6ZY8EGWWIjPWeihqpTf3yncyDFB7W
   8pgo4lat3VQomD4cy7DX/ryfvw8XYLikT5K5hL9owi8mtj+93CED9wCZU
   TFHGhXlHZ6oH8jWLp6AIdsEN3n695OVX6Yx8lM0oH9aDu6j7Slvce9ucb
   zfJUIrJcGmCGaWX3vaTQ6N6+tIrbBRuaFw2q231euMAT01yqXRz7J7ZsB
   g==;
X-CSE-ConnectionGUID: 7KMzzvcjQz+MGDbgpGFA7w==
X-CSE-MsgGUID: YZtLL1kRSXmPGKsHQi/AWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="44506308"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="44506308"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 07:21:48 -0700
X-CSE-ConnectionGUID: vIbnxbdBSQasHV8u+TDVyA==
X-CSE-MsgGUID: bWt/wU2CT/WW+el5HArE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165428173"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Aug 2025 07:21:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk1Uy-0002sk-2A;
	Thu, 07 Aug 2025 14:21:40 +0000
Date: Thu, 7 Aug 2025 22:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 143/801] arch/powerpc/boot/dts/mpc5121ads.dtb:
 dma@14000 (fsl,mpc5121-dma): compatible: ['fsl,mpc5121-dma'] is too short
Message-ID: <202508072229.8hriuDqG-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: c0c1b22903228bf11de638ce0d0e396e252c0a37 [143/801] dt-bindings: dma: Convert fsl,mpc5121-dma to DT schema
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: powerpc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072229.8hriuDqG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072229.8hriuDqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072229.8hriuDqG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/psc@11400: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/psc@11500: failed to match any schema with compatible: ['fsl,mpc5121-psc-ac97', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/psc@11500: failed to match any schema with compatible: ['fsl,mpc5121-psc-ac97', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/psc@11600: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/psc@11700: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/psc@11800: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/psc@11900: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/psc@11a00: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/psc@11b00: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/pscfifo@11f00: failed to match any schema with compatible: ['fsl,mpc5121-psc-fifo']
>> arch/powerpc/boot/dts/mpc5121ads.dtb: dma@14000 (fsl,mpc5121-dma): compatible: ['fsl,mpc5121-dma'] is too short
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
   arch/powerpc/boot/dts/mpc5121ads.dtb: /pci@80008500: failed to match any schema with compatible: ['fsl,mpc5121-pci']
--
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/mdio@2800: failed to match any schema with compatible: ['fsl,mpc5121-fec-mdio']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/ethernet@2800: failed to match any schema with compatible: ['fsl,mpc5125-fec']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/ioctl@a000: failed to match any schema with compatible: ['fsl,mpc5125-ioctl']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/usb@3000: failed to match any schema with compatible: ['fsl,mpc5121-usb2-dr']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/sclpc@10100: failed to match any schema with compatible: ['fsl,mpc512x-lpbfifo']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/serial@11100: failed to match any schema with compatible: ['fsl,mpc5125-psc-uart', 'fsl,mpc5125-psc']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/serial@11100: failed to match any schema with compatible: ['fsl,mpc5125-psc-uart', 'fsl,mpc5125-psc']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/serial@11900: failed to match any schema with compatible: ['fsl,mpc5125-psc-uart', 'fsl,mpc5125-psc']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/serial@11900: failed to match any schema with compatible: ['fsl,mpc5125-psc-uart', 'fsl,mpc5125-psc']
   arch/powerpc/boot/dts/mpc5125twr.dtb: /soc@80000000/pscfifo@11f00: failed to match any schema with compatible: ['fsl,mpc5121-psc-fifo']
>> arch/powerpc/boot/dts/mpc5125twr.dtb: dma@14000 (fsl,mpc5121-dma): compatible: ['fsl,mpc5121-dma'] is too short
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: usb@23000 (fsl-usb2-dr): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
>> arch/powerpc/boot/dts/mpc8308_p1m.dtb: dma@2c000 (fsl,mpc8308-dma): compatible:0: 'fsl,mpc5121-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
>> arch/powerpc/boot/dts/mpc8308_p1m.dtb: dma@2c000 (fsl,mpc8308-dma): compatible: ['fsl,mpc8308-dma'] is too short
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
>> arch/powerpc/boot/dts/mpc8308_p1m.dtb: dma@2c000 (fsl,mpc8308-dma): interrupts: [[3, 8], [94, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
>> arch/powerpc/boot/dts/mpc8308_p1m.dtb: dma@2c000 (fsl,mpc8308-dma): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: usb@23000 (fsl-usb2-dr): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00 (fsl,mpc8308-gpio): 'device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,ipic']
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: dma@2c000 (fsl,mpc8308-dma): compatible:0: 'fsl,mpc5121-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: dma@2c000 (fsl,mpc8308-dma): compatible: ['fsl,mpc8308-dma'] is too short
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: dma@2c000 (fsl,mpc8308-dma): interrupts: [[3, 8], [94, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: dma@2c000 (fsl,mpc8308-dma): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
--
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/psc@11600: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/psc@11700: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/psc@11800: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/psc@11800: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/psc@11900: failed to match any schema with compatible: ['fsl,mpc5121-psc-spi', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/psc@11900: failed to match any schema with compatible: ['fsl,mpc5121-psc-spi', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/psc@11a00: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/psc@11b00: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/psc@11b00: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/pscfifo@11f00: failed to match any schema with compatible: ['fsl,mpc5121-psc-fifo']
>> arch/powerpc/boot/dts/pdm360ng.dtb: dma@14000 (fsl,mpc5121-dma): compatible: ['fsl,mpc5121-dma'] is too short
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
   arch/powerpc/boot/dts/pdm360ng.dtb: /pci@80008500: failed to match any schema with compatible: ['fsl,mpc5121-pci']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
