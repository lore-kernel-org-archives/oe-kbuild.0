Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065F188CCA
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735928395; cv=none; b=hQLXOMDMtUZFu1ePLT3TYDuNbeFOzBjrTyhGHUZhtomkKBYGw5LjGID4EFA2puDANhRuowM5UbtaRirG8RpiWD8gqU4dFm91VcTDlpYZQYSca5/1I6NwXSaFJdPiU77RkqDM0pwjZaXwZF6tBotITCKXylsZqhJWwzMEfF+77vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735928395; c=relaxed/simple;
	bh=MwoJMaLGIrVvjQwmgTCgHt5QcRnR5iP3TY9rGr/5BYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3LkHjOIILyg06dtqtDrgLmmxraMHoqbyIM3I7T3jr6HxI2RuVW6qKe0JQyzVVCvrnP+fFurF34eUy2Xc2T0YlUpMeTfmBTbpILLDcBV7cIICHMZc+0a/Jg4IuyBq/XAM+0fc7DCsbQPKDoSqXY+KZbuOar1L3+r+NsL8CgqtM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jua83P8w; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jua83P8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735928393; x=1767464393;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MwoJMaLGIrVvjQwmgTCgHt5QcRnR5iP3TY9rGr/5BYg=;
  b=Jua83P8wgvPIkZNQBGuhywG2VBnyQ93uRwsVvwoDnPggnUEqsYHScM3M
   CpTXn96gfR1A6wMs9+bN1urzEKCUtuyK9oauj9ZQKk27+FngFJb70Y/ED
   bNVxtNLmeNFfWnJ4WjFYwbg5RFbYygUixzk1UCvDbCd4hOxhrE/d4Wej2
   xRabgoO91+I4lHd1ft3CGbdNqbdnJac6ehxEpE1Canay91TslmX5/+2qK
   5t9YWvzGNDxspTIiW2K7LAcsojRwKyMN7motJeY1qOF2SIvTyCwX13wDu
   mI4HUaUeH6EI1Uj71vyZYCcVOr3uYL+WzaSIisUUcShwg83kLKJOTeKpQ
   w==;
X-CSE-ConnectionGUID: kh3V7h9zQDaSIFtUsd2DzQ==
X-CSE-MsgGUID: Y7rwc/UrTWy2U1DJfPStlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47533937"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="47533937"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 10:19:53 -0800
X-CSE-ConnectionGUID: f54DkD0PQ0CplWReazdb4g==
X-CSE-MsgGUID: 06RViazFQSO6Ab3AyVdVNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101686670"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jan 2025 10:19:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTmGz-000A9b-0V;
	Fri, 03 Jan 2025 18:19:49 +0000
Date: Sat, 4 Jan 2025 02:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 16/19] powerpc: dts: Add LANCOM NWAPP2 board devicetree
Message-ID: <202501040247.XnHHJ5Kj-lkp@intel.com>
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
In-Reply-To: <20250102-mpc83xx-v1-16-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-16-86f78ba2a7af@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Naveen N Rao <naveen@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Frank Li <Frank.Li@nxp.com>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fc033cf25e612e840e545f8d5ad2edd6ba613ed5]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-Generalize-MPC831x-platform-support/20250103-023455
base:   fc033cf25e612e840e545f8d5ad2edd6ba613ed5
patch link:    https://lore.kernel.org/r/20250102-mpc83xx-v1-16-86f78ba2a7af%40posteo.net
patch subject: [PATCH 16/19] powerpc: dts: Add LANCOM NWAPP2 board devicetree
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: powerpc-randconfig-052-20250103 (https://download.01.org/0day-ci/archive/20250104/202501040247.XnHHJ5Kj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040247.XnHHJ5Kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501040247.XnHHJ5Kj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc8315e.dtsi:42.9-45.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/powerpc/boot/dts/lancom-nwapp2.dts:177.11-220.4: Warning (simple_bus_reg): /localbus@e0005000/nand@0,0: simple-bus unit address format error, expected "0"
>> arch/powerpc/boot/dts/lancom-nwapp2.dts:177.11-220.4: Warning (avoid_unnecessary_addr_size): /localbus@e0005000/nand@0,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /: failed to match any schema with compatible: ['lancom,nwapp2', 'fsl,mpc8314e']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /: failed to match any schema with compatible: ['lancom,nwapp2', 'fsl,mpc8314e']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: localbus@e0005000: nand@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8315-elbc', 'fsl,elbc', 'simple-bus']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8315-elbc', 'fsl,elbc', 'simple-bus']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /localbus@e0005000/nand@0,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /localbus@e0005000/nand@0,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: immr@e0000000: $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000: failed to match any schema with compatible: ['fsl,mpc8315-immr', 'simple-bus']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/wdt@200: failed to match any schema with compatible: ['mpc83xx_wdt']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/spi@7000: failed to match any schema with compatible: ['fsl,spi']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/spi@7000/gpio-controller@0: failed to match any schema with compatible: ['onnn,74hc595a']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8315-dma', 'fsl,elo-dma']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8315-dma', 'fsl,elo-dma']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
   	'ns16550' was expected
   	'ns16550a' was expected
   	'ns16850' was expected
   	'aspeed,ast2400-vuart' was expected
   	'aspeed,ast2500-vuart' was expected
   	'intel,xscale-uart' was expected
--
   	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
   	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: serial@4500: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: serial@4600: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
   	'ns16550' was expected
   	'ns16550a' was expected
   	'ns16850' was expected
   	'aspeed,ast2400-vuart' was expected
--
   	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
   	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/timer@500: failed to match any schema with compatible: ['fsl,mpc8315-gtm', 'fsl,gtm']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/timer@500: failed to match any schema with compatible: ['fsl,mpc8315-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc8315-gtm', 'fsl,gtm']
   arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/timer@600: failed to match any schema with compatible: ['fsl,mpc8315-gtm', 'fsl,gtm']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/ipic-msi@7c0: failed to match any schema with compatible: ['fsl,ipic-msi']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8315-pmc', 'fsl,mpc8313-pmc', 'fsl,mpc8349-pmc']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8315-pmc', 'fsl,mpc8313-pmc', 'fsl,mpc8349-pmc']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /immr@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8315-pmc', 'fsl,mpc8313-pmc', 'fsl,mpc8349-pmc']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pci@e0008500: failed to match any schema with compatible: ['fsl,mpc8349-pci']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8315-pcie', 'fsl,mpc8314-pcie']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pcie@e0009000: failed to match any schema with compatible: ['fsl,mpc8315-pcie', 'fsl,mpc8314-pcie']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pcie@e000a000: failed to match any schema with compatible: ['fsl,mpc8315-pcie', 'fsl,mpc8314-pcie']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: /pcie@e000a000: failed to match any schema with compatible: ['fsl,mpc8315-pcie', 'fsl,mpc8314-pcie']
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: gpio-watchdog: $nodename:0: 'gpio-watchdog' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/linux,wdt-gpio.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-power: $nodename:0: 'led-power' does not match '^multi-led(@[0-9a-f])?$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-power: Unevaluated properties are not allowed ('color', 'function', 'label' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-link: $nodename:0: 'led-wlan-link' does not match '^multi-led(@[0-9a-f])?$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-link: Unevaluated properties are not allowed ('color', 'function', 'label' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-data: $nodename:0: 'led-wlan-data' does not match '^multi-led(@[0-9a-f])?$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-data: Unevaluated properties are not allowed ('color', 'label' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-eth: $nodename:0: 'led-eth' does not match '^multi-led(@[0-9a-f])?$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-eth: Unevaluated properties are not allowed ('color', 'label' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-power-top: $nodename:0: 'led-power-top' does not match '^multi-led(@[0-9a-f])?$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-power-top: Unevaluated properties are not allowed ('color', 'function', 'label' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-top: $nodename:0: 'led-wlan-top' does not match '^multi-led(@[0-9a-f])?$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#
>> arch/powerpc/boot/dts/lancom-nwapp2.dtb: led-wlan-top: Unevaluated properties are not allowed ('color', 'label' were unexpected)
   	from schema $id: http://devicetree.org/schemas/leds/leds-group-multicolor.yaml#

vim +/0 +177 arch/powerpc/boot/dts/lancom-nwapp2.dts

0c1e3a5b21529a J. Neuschäfer 2025-01-02  172  
0c1e3a5b21529a J. Neuschäfer 2025-01-02  173  &localbus {
0c1e3a5b21529a J. Neuschäfer 2025-01-02  174  	status = "okay";
0c1e3a5b21529a J. Neuschäfer 2025-01-02  175  	ranges = <0x0 0x0 0xfe000000 0x00008000>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  176  
0c1e3a5b21529a J. Neuschäfer 2025-01-02 @177  	nand@0,0 {
0c1e3a5b21529a J. Neuschäfer 2025-01-02  178  		#address-cells = <1>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  179  		#size-cells = <1>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  180  		compatible = "fsl,mpc8315-fcm-nand",
0c1e3a5b21529a J. Neuschäfer 2025-01-02  181  			     "fsl,elbc-fcm-nand";
0c1e3a5b21529a J. Neuschäfer 2025-01-02  182  		reg = <0x0 0x0 0x2000>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  183  
0c1e3a5b21529a J. Neuschäfer 2025-01-02  184  		partitions {
0c1e3a5b21529a J. Neuschäfer 2025-01-02  185  			compatible = "fixed-partitions";
0c1e3a5b21529a J. Neuschäfer 2025-01-02  186  			#address-cells = <1>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  187  			#size-cells = <1>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  188  
0c1e3a5b21529a J. Neuschäfer 2025-01-02  189  			partition@0 {
0c1e3a5b21529a J. Neuschäfer 2025-01-02  190  				label = "loader1";
0c1e3a5b21529a J. Neuschäfer 2025-01-02  191  				reg = <0x0 0x8000>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  192  				read-only;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  193  			};
0c1e3a5b21529a J. Neuschäfer 2025-01-02  194  
0c1e3a5b21529a J. Neuschäfer 2025-01-02  195  			partition@8000 {
0c1e3a5b21529a J. Neuschäfer 2025-01-02  196  				label = "loader2";
0c1e3a5b21529a J. Neuschäfer 2025-01-02  197  				reg = <0x8000 0x78000>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  198  				read-only;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  199  			};
0c1e3a5b21529a J. Neuschäfer 2025-01-02  200  
0c1e3a5b21529a J. Neuschäfer 2025-01-02  201  			// 0x80000:0xf80000 is designated "loader spare" by
0c1e3a5b21529a J. Neuschäfer 2025-01-02  202  			// vendor firmware, but we re-use it for our purposes.
0c1e3a5b21529a J. Neuschäfer 2025-01-02  203  
0c1e3a5b21529a J. Neuschäfer 2025-01-02  204  			partition@80000 {
0c1e3a5b21529a J. Neuschäfer 2025-01-02  205  				label = "u-boot-env";
0c1e3a5b21529a J. Neuschäfer 2025-01-02  206  				reg = <0x80000 0x80000>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  207  			};
0c1e3a5b21529a J. Neuschäfer 2025-01-02  208  
0c1e3a5b21529a J. Neuschäfer 2025-01-02  209  			partition@100000 {
0c1e3a5b21529a J. Neuschäfer 2025-01-02  210  				label = "loader-spare";
0c1e3a5b21529a J. Neuschäfer 2025-01-02  211  				reg = <0x100000 0xf00000>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  212  			};
0c1e3a5b21529a J. Neuschäfer 2025-01-02  213  
0c1e3a5b21529a J. Neuschäfer 2025-01-02  214  			partition@1000000 {
0c1e3a5b21529a J. Neuschäfer 2025-01-02  215  				label = "fs";
0c1e3a5b21529a J. Neuschäfer 2025-01-02  216  				reg = <0x1000000 0xf000000>;
0c1e3a5b21529a J. Neuschäfer 2025-01-02  217  				/* YAFFS2 filesystem */
0c1e3a5b21529a J. Neuschäfer 2025-01-02  218  			};
0c1e3a5b21529a J. Neuschäfer 2025-01-02  219  		};
0c1e3a5b21529a J. Neuschäfer 2025-01-02  220  	};
0c1e3a5b21529a J. Neuschäfer 2025-01-02  221  };
0c1e3a5b21529a J. Neuschäfer 2025-01-02  222  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
